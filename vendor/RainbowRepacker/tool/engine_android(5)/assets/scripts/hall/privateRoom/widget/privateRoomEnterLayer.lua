-- 私人房进入弹框
local PrivateRoomEnterLayer = class(CommonGameLayer);

PrivateRoomEnterLayer.Delegate = {
    onEnterLayerClose = "onEnterLayerClose",
    onCheckGameInstallStatus = "onCheckGameInstallStatus"; -- 判断是否安装
    onCheckCanEnterRoom = "onCheckCanEnterRoom"; -- 判断满足进入条件
    onShowEnterTipsView = "onShowEnterTipsView"; -- 显示进入提示
}


PrivateRoomEnterLayer.ctor = function(self)
    self:setFillParent(true, true);
    self:setEventTouch(self, function() end);
    self:setEventDrag(self, function() end);
end

PrivateRoomEnterLayer.dtor = function(self)

end

PrivateRoomEnterLayer.show = function(self, data, enterType)
    CommonGameLayer.show(self);

    self:initData(data, enterType);
    self:showData();
end

PrivateRoomEnterLayer.initData = function(self, data, enterType)
    self.m_data = data;
    self.m_enterType = number.valueOf(enterType);
end

PrivateRoomEnterLayer.showData = function(self)
    local data = self.m_data;

    local userCountMax = number.valueOf(self.m_data.userCount_max);
    local userCount = number.valueOf(self.m_data.userCount_on);
    if userCount >= userCountMax then
        self:_sendLoginHall();--人满的情况下发送大厅登录检测下自己是否需要重连,如需重连socketReconnectLogic已处理
    end 

    if not self.m_enterView then
        local gameId = number.valueOf(data.gameId);

        local __callBackClose = function()
            self:onCloseCallback();
        end

        local __callBackConfirm = function()
            self:onConfirmCallback();
        end

        -- 创建进入弹框内容对象
        local enterViewClass = kGameManager:getPrivateRoomCustomEnterView(gameId);
        self.m_enterView = new(enterViewClass, data, __callBackClose, __callBackConfirm)
        self:addChild(self.m_enterView);
    end
end

PrivateRoomEnterLayer._sendLoginHall = function(self)
    local info = {};
    info.userId = kUserInfoData:getUserId();
    info.api = kClientInfo:getApi();
    info.guid = kClientInfo:getGuid();
    local data = {};
    data.api = kClientInfo:getApi();
    data.version = kClientInfo:getApkVersion();
    info.plateInfo = json.encode(data);

    info.version = kGameManager:getApkVerison();
    info.appid = kClientInfo:getAppId();
    info.hallVersion = kGameManager:getGameVersion(GameType.HALL);

    OnlineSocketManager.getInstance():sendMsg(HALL_SEND_LOGIN,info);
end 

PrivateRoomEnterLayer.onCloseCallback = function(self)
    self:execDelegate(PrivateRoomEnterLayer.Delegate.onEnterLayerClose, true);
end

PrivateRoomEnterLayer.onConfirmCallback = function(self)
    if table.isEmpty(self.m_data) then
        return;
    end

    local gameId = number.valueOf(self.m_data.gameId);
    local tableType = number.valueOf(self.m_data.tableType);
    local requireMoney = number.valueOf(self.m_data.requireMoney);
    local userCountMax = number.valueOf(self.m_data.userCount_max);
    local userCount = number.valueOf(self.m_data.userCount_on);

    -- 游戏是否安装
    if not self:execDelegate(PrivateRoomEnterLayer.Delegate.onCheckGameInstallStatus, gameId, self, self.onConfirmCallback) then
        return;
    end

    if not PrivateRoomDataInterface.getInstance():isGameSupportPrivateRoomFeature(gameId, tableType) then
        Toast.getInstance():showText(string.format("当前子游戏版本不支持%s", PrivateRoomConstant.ROOM_NAME_MAP[tableType] or ""),50,30,kAlignLeft,"",24,200,175,110);
        return;
    end
    
    -- 人数是否已满
    if userCount >= userCountMax then
        self:execDelegate(PrivateRoomEnterLayer.Delegate.onEnterLayerClose, true);
        self:execDelegate(PrivateRoomEnterLayer.Delegate.onShowEnterTipsView);
        return;
    end

    -- 携带货币是否足够
    if not self:execDelegate(PrivateRoomEnterLayer.Delegate.onCheckCanEnterRoom, tableType, requireMoney, self, self.onConfirmCallback) then
        return;
    end

    self:_report(tableType);

    PrivateRoomDataInterface.getInstance():requestEnterPrivateRoom(self.m_data);
end

PrivateRoomEnterLayer._report = function(self, tableType)
    local enterType = self.m_enterType;
    if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE and 
        enterType == PrivateRoomConstant.ENTER_TYPE_SEARCH then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterJiFenBySearch);
    elseif tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE and 
        enterType == PrivateRoomConstant.ENTER_TYPE_QR_CODE then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterJiFenByScan);
    elseif tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE and 
        enterType == PrivateRoomConstant.ENTER_TYPE_PASSWORD then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterJiFenByPassword);
    elseif tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE and 
        enterType == PrivateRoomConstant.ENTER_TYPE_HTML then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterJiFenByHtml);
    elseif tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE and 
        enterType == PrivateRoomConstant.ENTER_TYPE_ONLINE then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterJiFenByOnline);
    elseif enterType == PrivateRoomConstant.ENTER_TYPE_SEARCH then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterYouXiBiBySearch);
    elseif enterType == PrivateRoomConstant.ENTER_TYPE_QR_CODE then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterYouXiBiByScan);
    elseif enterType == PrivateRoomConstant.ENTER_TYPE_PASSWORD then
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterYouXiBiByPassword);
    elseif enterType == PrivateRoomConstant.ENTER_TYPE_HTML then 
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterYouXiBiByHtml);
    elseif enterType == PrivateRoomConstant.ENTER_TYPE_ONLINE then 
        UBReport.getInstance():report(UBConfig.kPrivateRoomEnterYouXiBiByOnline);
    end
end

---------------------------------------------------------------------------------------
PrivateRoomEnterLayer.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

return PrivateRoomEnterLayer;