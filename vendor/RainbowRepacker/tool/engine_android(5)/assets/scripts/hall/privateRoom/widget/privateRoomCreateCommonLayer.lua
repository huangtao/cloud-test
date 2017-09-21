local privateRoomCreateCommonLayout = require(ViewPath .. "hall/privateRoom/privateRoomCreateCommonLayout");

-- 私人房创建界面公共层
local PrivateRoomCreateCommonLayer = class(CommonGameLayer, false);

PrivateRoomCreateCommonLayer.Delegate = {
    onCreateCommonLayerClose = "onCreateCommonLayerClose";
    onCheckGameInstallStatus = "onCheckGameInstallStatus";
    onCheckCanEnterRoom = "onCheckCanEnterRoom";
}

PrivateRoomCreateCommonLayer.s_controls = 
{
    customView = ToolKit.getIndex(),
    returnBtn = ToolKit.getIndex(),
    gameListView = ToolKit.getIndex(),
};

PrivateRoomCreateCommonLayer.s_cmds = 
{
};

PrivateRoomCreateCommonLayer.ctor = function(self, layerType)
    super(self, privateRoomCreateCommonLayout);
    self:setFillParent(true, true);
    self:setEventTouch(self, function() end);
    self:setEventDrag(self, function() end);
    self:_initData(layerType);
    self:_initView();

    UpdateHandleMgr.getInstance():setObserver(self);
    PrivateRoomDataInterface.getInstance():setObserver(self);

    self:_getPrivateConfig();
end

PrivateRoomCreateCommonLayer.dtor = function(self)
    self.m_gameListData = nil;
    self.m_gameIdSelected = nil;
    self.m_downloadMonitor = nil;

    UpdateHandleMgr.getInstance():clearObserver(self);
    PrivateRoomDataInterface.getInstance():clearObserver(self);
end

PrivateRoomCreateCommonLayer._initData = function(self, layerType)
    self.m_gameListData = {};
    self.m_gameIdSelected = 1;
    self.m_downloadMonitor = nil;
    self.m_layerType = layerType or PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL;
end

PrivateRoomCreateCommonLayer._initView = function(self)
    self:_initGameListView();
end

PrivateRoomCreateCommonLayer._resetCreateRoomView = function(self)
    self:getAndResetLastCreateRoomInfo();
end

-- 获取私人房配置
PrivateRoomCreateCommonLayer._getPrivateConfig = function(self)
    if self.m_layerType == PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL then
        PrivateRoomDataInterface.getInstance():getPrivateConfig({
            PrivateRoomConstant.PRIVATE_ROOM_TYPE_MONEY, 
            PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL});
    elseif self.m_layerType == PrivateRoomConstant.CREATE_TYPE_SCORE then
        PrivateRoomDataInterface.getInstance():getPrivateConfig({PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE});
    end
end

-- interface callback
PrivateRoomCreateCommonLayer.onGetPrivatRoomConfigCallback = function(self, isSuccess, data)
    if isSuccess then
        self.m_gameListData = data;
        self.m_gameList:setData(data);

        self:_resetCreateRoomView();

        -- 优先处理配置刷新
        if self.m_refreshGameId then
            self.m_gameList:setSelecteItemId(self.m_refreshGameId);
            self.m_refreshGameId = nil;
        else
            -- 处理默认选中
            local createData = PrivateRoomDataInterface.getInstance():getCreateData();
            if not table.isEmpty(createData) then
                self.m_gameList:setSelecteItemId(createData.gameId);
                if self.m_customParamSetView then 
                    self.m_customParamSetView:resetParamData({tableType = createData.tableType});
                end
            end
        end
    end
end

PrivateRoomCreateCommonLayer.onRequestPrivatRoomConfigCallback = function(self, isSuccess, data)
    if isSuccess then
        self:_getPrivateConfig();
    end
end

-- 设置缓存数据
PrivateRoomCreateCommonLayer.getAndResetLastCreateRoomInfo = function(self)
    local dict = self:getDict();
    local data = table.verify(json.decode(dict:getString("create_room_info")));

    local gameData = self:_getCreateGameDataById(data.gameId);
    if not gameData then
        gameData = self.m_gameListData[1];
    end

    gameData = table.verify(gameData);
    if table.isEmpty(gameData) then
        self:findViewById(self.s_controls.customView):setVisible(false);
        self:showToast(kTextPrivateRoom);
        return;
    end

    self.m_gameIdSelected = gameData.id;
    self.m_gameList:setSelectItemData(gameData);
    self:_initCustomParamSetView(gameData);

    if self.m_customParamSetView then 
        self.m_customParamSetView:resetParamData(data);
    end

    self:findViewById(self.s_controls.customView):setVisible(true);
end

PrivateRoomCreateCommonLayer._initGameListView = function(self)
    if not self.m_gameList then
        local privateRoomCreateGameListView = require("hall/privateRoom/widget/privateRoomCreateGameListView");
        local gameListView = self:findViewById(self.s_controls.gameListView);
        self.m_gameList = new(privateRoomCreateGameListView);
        self.m_gameList:setAlign(kAlignTop);
        gameListView:addChild(self.m_gameList);
        self.m_gameList:setOnItemClick(self, self.onGameListItemClick);
    end
end

-- 刷新自定义界面
PrivateRoomCreateCommonLayer._initCustomParamSetView = function(self,data)
    data = table.verify(data);
    if self.m_curCustomData and table.equal(self.m_curCustomData,data) then 
        return;
    end 

    self.m_curCustomData = data;

    local customView = self:findViewById(self.s_controls.customView);
    if self.m_customParamSetView then
        customView:removeChild(self.m_customParamSetView);
        delete(self.m_customParamSetView);
        self.m_customParamSetView = nil;
    end

    local customParamSetView = self:_getCustomView(data.id);
    if customParamSetView then

        local __callBackConfirm = function()
            self:onConfirmBtnClick();
        end
        self.m_customParamSetView = new(customParamSetView, data, __callBackConfirm);   
        customView:addChild(self.m_customParamSetView);
    end
end

-- sub view callback
PrivateRoomCreateCommonLayer.onGameListItemClick = function(self, data)
    if table.isEmpty(data) then
        self:showToast(kTextGetInformationError);
        return ;
    end 

    self.m_gameIdSelected = data.id;
    self:_initCustomParamSetView(data);

    local dict = self:getDict();
    local record = table.verify(json.decode(dict:getString("create_room_info")));
    if data.id == record.gameId then 
        self:getAndResetLastCreateRoomInfo();
    end 

    self:execDelegate(PrivateRoomCreateCommonLayer.Delegate.onCheckGameInstallStatus, data.id, self, self.onRefreshGameList);
end

PrivateRoomCreateCommonLayer.onConfirmBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallRoomCreateComfirm);

    local gameId = self.m_gameIdSelected;

    if not self:execDelegate(PrivateRoomCreateCommonLayer.Delegate.onCheckGameInstallStatus, gameId, self, self.onRefreshGameList) then
        return ;
    end

    if gameId <= 0 then
        self:showToast(kTextNoChoiceGame);
        return;
    end

    local info = {};
    if self.m_customParamSetView then 
        local isLegal,temp = self.m_customParamSetView:getCustomParamData();
        info = table.verify(temp);
        local param = json.encode(info);
        info.param = param;

        if not self:execDelegate(PrivateRoomCreateCommonLayer.Delegate.onCheckCanEnterRoom, info.tableType or 0, info.requireMoney or 0, self, self.onConfirmBtnClick) then
            return;
        elseif not isLegal then
            return;
        end
    end 

    info.gameId = gameId;
    info.tableType = info.tableType or self:_getDefaultTableType();
    
    local dict = self:getDict();
    local dataStrUser = json.encode(info) or "";
    dict:setString("create_room_info",dataStrUser);
    dict:save();

    self:_report(info);
    PrivateRoomDataInterface.getInstance():requestCreatePrivateRoom(info);
end

-- 更新结束刷新配置
PrivateRoomCreateCommonLayer.onRefreshGameList = function(self)
    self.m_refreshGameId = self.m_gameIdSelected;
    self:_getPrivateConfig();
end

PrivateRoomCreateCommonLayer._getCreateGameDataById = function(self, gameId)
    local gameData;
    for k,v in pairs(self.m_gameListData) do
        if v.id == gameId then
            gameData = v;
            break;
        end
    end
    return gameData;
end

-- 获取自定义界面
PrivateRoomCreateCommonLayer._getCustomView = function(self, id)
    if self.m_layerType == PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL then
        return kGameManager:getPrivateRoomCustomCreateView(id);
    elseif self.m_layerType == PrivateRoomConstant.CREATE_TYPE_SCORE then
        return kGameManager:getPrivateRoomCustomCreateViewScore(id);
    end
end

-- 默认房间类型
PrivateRoomCreateCommonLayer._getDefaultTableType = function(self)
    return self.m_layerType == PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL and 
        PrivateRoomConstant.PRIVATE_ROOM_TYPE_MONEY or PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE;
end

PrivateRoomCreateCommonLayer._report = function(self, info)
    if self.m_layerType == PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL then
        UBReport.getInstance():report(UBConfig.kPrivateRoomCreateYouXiBiSuccess);
    elseif self.m_layerType == PrivateRoomConstant.CREATE_TYPE_SCORE then
        UBReport.getInstance():report(UBConfig.kPrivateRoomCreateJiFenTimes, string.format("times_%s", info.times or ""));
        UBReport.getInstance():report(UBConfig.kPrivateRoomCreateJiFenRounds, string.format("rounds_%s", info.rounds or ""));
        UBReport.getInstance():report(UBConfig.kPrivateRoomCreateJiFenSuccess);
    end
end

---------------------------------------------------------------------------------------
PrivateRoomCreateCommonLayer.onReturnBtnClick = function(self)
    self:execDelegate(PrivateRoomCreateCommonLayer.Delegate.onCreateCommonLayerClose, true);
end
---------------------------------------------------------------------------------------

PrivateRoomCreateCommonLayer.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

PrivateRoomCreateCommonLayer.showToast = function(self, message)
    Toast.getInstance():showText(message,50,30,kAlginLeft,"",26,250,210,70);
end

PrivateRoomCreateCommonLayer.getDict = function(self)
    self.m_dictName = "private_data_" .. kUserInfoData:getUserId();
    if not self.m_dict then
        self.m_dict = new(Dict, self.m_dictName);
        self.m_dict:load();
    end
    return self.m_dict;
end

PrivateRoomCreateCommonLayer.s_controlConfig = 
{
    [PrivateRoomCreateCommonLayer.s_controls.customView] = {"customView"};
    [PrivateRoomCreateCommonLayer.s_controls.gameListView] = {"gameListView"};
    [PrivateRoomCreateCommonLayer.s_controls.returnBtn] = {"returnBtn"};
}

PrivateRoomCreateCommonLayer.s_controlFuncMap = 
{
    [PrivateRoomCreateCommonLayer.s_controls.returnBtn] = PrivateRoomCreateCommonLayer.onReturnBtnClick;
};

PrivateRoomCreateCommonLayer.s_cmdConfig = 
{
};

return PrivateRoomCreateCommonLayer;