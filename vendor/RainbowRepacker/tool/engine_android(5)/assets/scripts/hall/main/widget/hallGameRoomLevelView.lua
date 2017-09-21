require("common/commonGameLayer");
local hallRoomLevelView = require(ViewPath .. "hall/main/hallRoomLevelView");
local roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin")
local HallGameRoomLevelView = class(CommonGameLayer, false);


HallGameRoomLevelView.Delegate = {
    onLevelBackToHall = "onRoomLevelViewBackToHall";
    setBroadcastVisible = "setBroadcastVisible";
    showMoneyViewById = "showMoneyViewById";
}

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

HallGameRoomLevelView.s_controls = {
    backBtn = getIndex();
    gameNameView = getIndex();
    gameNameBtn = getIndex();
    gameName = getIndex();
    arrow = getIndex();
    pulldown_bg = getIndex();
    gameNameListView = getIndex();
    roomLevelListView = getIndex();
    fastStartGameBtn = getIndex();
    shieldLayer = getIndex();
    friendView = getIndex();
    matchView = getIndex();
    friendRoomBtn = getIndex();
    matchBtn = getIndex();
    maskImg = getIndex();
    maskView = getIndex();
    View_levelMode = getIndex();
    View_forCheckBoxs = getIndex();
}


HallGameRoomLevelView.ctor = function(self)
    super(self, hallRoomLevelView);
    self.m_ctrl = HallGameRoomLevelView.s_controls;
    self:findViewById(self.m_ctrl.gameNameView):setLevel(2);
    local __list = self:findViewById(self.m_ctrl.gameNameListView);
    __list:setScrollBarWidth(6);
    self.m_roomLevelData = {};
    self.m_currentLevelTab = 1;  --默认显示第一个
    self:__initViews();
end


HallGameRoomLevelView.show = function(self, gameId, roomLevelData, whichTab, autoEnterLevelInfo)
    whichTab = whichTab or kGameManager:getCurGameLevelTab(gameId);
    self:setBroadcastVisible(false);
    self.m_isGameSame = gameId and gameId == self.m_gameId;
    
    self.m_gameId = gameId;
    self.m_roomLevelData = roomLevelData;
    self:setVisible(true);
    self:__init(whichTab);

    --请求人数
    kGameManager:requestGameLevelPlayerNum(self.m_gameId);
     --恢复快速玩法，底主类型默认值
    kGameManager:setFastStartPlayType(0);   --标准玩法
    kGameManager:setFastStartMoneyType(0);  --底注银币

    self:__checkAutoEnterRoomLevelInfo(autoEnterLevelInfo);
end

HallGameRoomLevelView.__checkAutoEnterRoomLevelInfo = function(self, autoEnterLevelInfo)
    if table.isEmpty(autoEnterLevelInfo) or not autoEnterLevelInfo.levelId then
        return ;
    end

    if number.valueOf(autoEnterLevelInfo.levelId) == 0 then
        --levelId等于0，则代表是快速开始
        self:onFastStartGameBtnClick();
    else
        --指定进入具体的场次
        local __levelData = kGameManager:getGameLevelInfo(self.m_gameId, autoEnterLevelInfo.levelId);
        if table.isEmpty(__levelData) then
            return;
        end
        self.m_roomLevelListView:onGameLevelItemClick(__levelData);
    end
end

HallGameRoomLevelView.hide = function(self)
    self:setVisible(false);
    self:setBroadcastVisible(true);
    self:execDelegate(HallGameRoomLevelView.Delegate.showMoneyViewById,UserPropertyIsolater.getInstance():getPropertySilverCoinID());
end

HallGameRoomLevelView.__initViews = function (self)
    self.m_friendView = self:findViewById(self.m_ctrl.friendView);
    self.m_matchView = self:findViewById(self.m_ctrl.matchView);
    HallGameRoomLevelView.defaultFriendViewX, _ = self.m_friendView:getPos();
    HallGameRoomLevelView.defaultMatchViewX,_ = self.m_matchView:getPos();

    local mask = self:findViewById(self.m_ctrl.maskImg);
    HolidaysBgDataInterface.getInstance():showImg(HolidaysBgDataInterface.ImgType.Bg, mask);
    local alphaAreaY = require("coreex/alphaAreaY");
    local maskView = self:findViewById(self.m_ctrl.maskView);
    local _, y = maskView:getAbsolutePos();
    local _, h = maskView:getSize();
    local scale = System.getLayoutScale();
    y = System.getScreenHeight() - math.abs(y)*scale;
    local sy = y/System.getScreenHeight();
    local ey = (y+h*scale)/System.getScreenHeight();
    alphaAreaY.applyToDrawing(mask, sy, ey);

end

HallGameRoomLevelView.__refreshFriendRoomAndMatchBtnStates = function (self)
    local config = GameInfoIsolater.getInstance():getGameConfigById(self.m_gameId);
    if table.isEmpty(config) then
        return;
    end

    local isMatch = number.valueOf(config.isMatch) == 1;
    local isPrivate = number.valueOf(config.isPrivate) == 1;
    if isMatch and isPrivate then
        self.m_friendView:setPos(HallGameRoomLevelView.defaultFriendViewX, nil);
    elseif not isMatch and isPrivate then
        self.m_friendView:setPos(HallGameRoomLevelView.defaultMatchViewX, nil);
    end
    
    self.m_friendView:setVisible(isPrivate);
    self.m_matchView:setVisible(isMatch);
end

HallGameRoomLevelView.__init = function(self,whichTab)
    self:__initGameNameListStatus();
    self:__refreshCurGameName();
    self:__refreshGameNameList();
    self:__refreshLevelCheckBoxs(whichTab);
    self:__showGameNameList(false);
    self:__refreshFriendRoomAndMatchBtnStates();
end

HallGameRoomLevelView.__refreshLevelCheckBoxs = function(self,p_whichTab)
    if self.m_roomLevelData and self.m_roomLevelData.data and table.getn(self.m_roomLevelData.data) > 0 then
        
    else
        return;   
    end

    if self.m_levelTabInstance then
        delete(self.m_levelTabInstance);
        self.m_levelTabInstance = nil;
    end

    local __parent = self:findViewById(self.m_ctrl.View_levelMode);
    local __callBack = function(p_index)
        self:onTabChange(p_index);
    end

    self:findViewById(self.m_ctrl.View_levelMode):setVisible(true);
    local _subClassForLevelTab = kGameManager:getLevelTab(self.m_gameId);
    self.m_levelTabInstance = new(_subClassForLevelTab,self.m_roomLevelData,__parent,__callBack,p_whichTab);
	local __isShowBroadcast = self.m_levelTabInstance:isShowBroadcast();
	self:setBroadcastVisible(__isShowBroadcast);
    self:findViewById(self.m_ctrl.View_levelMode):addChild(self.m_levelTabInstance);

    local tabNum = table.getn(self.m_roomLevelData.data);

end

HallGameRoomLevelView.onTabChange = function(self,index)
    UBReport.getInstance():report(UBConfig.kHallGameLevelGoldBar,string.format("gameId%s", self.m_gameId or ""));
    --记录当前显示的tab下标
    self.m_currentLevelTab = index;
    kGameManager:setCurGameLevelTab(self.m_gameId,self.m_currentLevelTab);
    --根据index得到对应的数据刷新LevelListView
    self:__refreshRoomLevelListView();
    self:__refreshMoneyView();
end

HallGameRoomLevelView.__refreshMoneyView = function(self)
    local __currentMoneyId = self.m_roomLevelData.data[self.m_currentLevelTab].base_chip_type;
    self:execDelegate(HallGameRoomLevelView.Delegate.showMoneyViewById,__currentMoneyId);
end

HallGameRoomLevelView.__toWhichTab = function(self,p_which)
    p_which = tonumber(p_which) or 1;
    self.m_levelTabGroup:initStatus(p_which);
end

HallGameRoomLevelView.onBackBtnClick = function(self)
    self:execDelegate(HallGameRoomLevelView.Delegate.onLevelBackToHall);
end

HallGameRoomLevelView.setBroadcastVisible = function(self,isVisible)
    self:execDelegate(HallGameRoomLevelView.Delegate.setBroadcastVisible,isVisible);
end

HallGameRoomLevelView.onGameNameBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallRoomGoToOtherGame);
    local isShowing = self:findViewById(self.m_ctrl.pulldown_bg):getVisible();
    self:__showGameNameList(not isShowing);
    self:__setShieldLayerState(not isShowing);
end

HallGameRoomLevelView.onFastStartGameBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kEveryGameId, string.format("gameId%s_levelId%s", self.m_gameId or "", -1));
    if self.m_roomLevelData.data[self.m_currentLevelTab].base_chip_type == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then
        UBReport.getInstance():report(UBConfig.kHallGameLevelGoldBarFastStart, string.format("gameId%s", self.m_gameId or ""));
    end

    if self.m_roomLevelListView then
        if self.m_roomLevelListView:canFastEnterRoom() then
            --设置快速开始的玩法 和 底注类型
            kGameManager:setFastStartPlayType(self.m_roomLevelData.data[self.m_currentLevelTab].play_mode);
            kGameManager:setFastStartMoneyType(self.m_roomLevelData.data[self.m_currentLevelTab].base_chip_type);
            EventDispatcher.getInstance():dispatch(HallController.s_eventGoToGameDirect, {id = self.m_gameId} );
        end
    end
end

HallGameRoomLevelView.__refreshRoomLevelListView = function(self)
    local parent = self:findViewById(self.m_ctrl.roomLevelListView);

    local tempRoomLevelListView = self.m_roomLevelListView;
    if  self.m_roomLevelListView then
        --only remove listView from it's parent for avoid reload texture cause consume much time;
        parent:removeChild(self.m_roomLevelListView);
        self.m_roomLevelListView = nil;
    end

    if not self.m_roomLevelListView then
        self.m_roomLevelListView = new( kGameManager:getGameLevelListView(self.m_gameId) );
        self.m_roomLevelListView:setDelegate(self);
        parent:addChild(self.m_roomLevelListView);
        self.m_roomLevelListView:setFillParent(true, true);
    end

    self.m_roomLevelListView:show(self.m_gameId, self.m_roomLevelData.data[self.m_currentLevelTab].tab_data or {});

    --delete tempRoomLevelList view for avid memory leak 
    delete(tempRoomLevelListView);
    tempRoomLevelListView = nil;
end

HallGameRoomLevelView.__refreshCurGameName = function(self)
    local gameTitle = kGameManager:getGameHallTitleFile(self.m_gameId);
    self:findViewById(self.m_ctrl.gameName):setFile(gameTitle);
end

HallGameRoomLevelView.__showGameNameList = function(self, isShow)
    self:findViewById(self.m_ctrl.pulldown_bg):setVisible(isShow);
    self:findViewById(self.m_ctrl.arrow):setFile(isShow and 
        "hall/hall/hall_level_arrow_up.png" or "hall/hall/hall_level_arrow_down.png");
end

HallGameRoomLevelView.__initGameNameListStatus = function(self)
    local data = self:__getInitedGamesConfig();
    local bShow = #data > 0;
    self:findViewById(self.m_ctrl.arrow):setVisible(bShow);
    self:findViewById(self.m_ctrl.gameNameBtn):setPickable(bShow);

    local shieldLayer = self:findViewById(self.m_ctrl.shieldLayer);
    shieldLayer:setEventTouch(self, self.__onShieldLayerTouch);
    shieldLayer:setEventDrag(self, function() end);
    shieldLayer:setVisible(false);
end

HallGameRoomLevelView.__refreshGameNameList = function(self)
    local data = self:__getInitedGamesConfig();
    if table.isEmpty(data) then
        return;
    end

    self:__resetGameNameListViewSize(#data);

    if not self.m_gameNameAdapter then
        local gameNameListView = self:findViewById(self.m_ctrl.gameNameListView);
        gameNameListView:setFillParent(true, false);
        gameNameListView:setOnItemClick(self, self.__onGameNameItemClick);    
        self.m_gameNameAdapter = new(CacheAdapter, HallGameNameItem, data);
        gameNameListView:setAdapter(self.m_gameNameAdapter);
    else
        self.m_gameNameAdapter:changeData(data);
    end
end

HallGameRoomLevelView.__resetGameNameListViewSize = function(self, itemCount)
    local pulldown_bg = self:findViewById(self.m_ctrl.pulldown_bg);
    local totalHeight = pulldown_bg.m_res.m_height;
    local maxCount = 3;
    local count = itemCount;
    local itemHeight = totalHeight/maxCount;
    if count >= maxCount then
        pulldown_bg:setSize( nil, totalHeight - 90);
    else
        pulldown_bg:setSize( nil, itemHeight*count + 18 );
    end
end

HallGameRoomLevelView.__getInitedGamesConfig = function(self)
    local ret = {};
    local gameIds = kGameManager:getInitedGameIds();
    for _, id in ipairs(gameIds) do
        if id ~= self.m_gameId then
            local config = kGameManager:getGameConfigById(id);
            if not table.isEmpty(config) then
                table.insert(ret, config);
            end
        end
    end
    return ret;
end

-------------------------------------屏蔽层------------------------------------------
HallGameRoomLevelView.__onGameNameItemClick = function(self, adapter, view, index)
    self:__showGameNameList(false);
    EventDispatcher.getInstance():dispatch(HallController.s_eventRequestGameRoomList, view:getData() );
end

HallGameRoomLevelView.__setShieldLayerState = function(self, visible)
    local shieldLayer = self:findViewById(self.m_ctrl.shieldLayer);
    shieldLayer:setVisible(visible);
end

HallGameRoomLevelView.__onShieldLayerTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:onGameNameBtnClick();
    end
end

HallGameRoomLevelView.onFriendRoomBtnClick = function (self)
   --友盟统计
   UBReport.getInstance():report(UBConfig.kHallGameType, "private");
   local __currentMoneyId = self.m_roomLevelData.data[self.m_currentLevelTab].base_chip_type;
   PrivateRoomDataInterface.getInstance():setCreateData({gameId = self.m_gameId, tableType = __currentMoneyId});
   StateMachine.getInstance():pushState(States.PrivateRoom);
end

HallGameRoomLevelView.onMatchBtnClick = function (self)
    --友盟统计
    UBReport.getInstance():report(UBConfig.kHallGameType, "match");
    StateMachine.getInstance():pushState(States.GameMatchHall);
end

HallGameRoomLevelView.s_controlConfig = {
    [HallGameRoomLevelView.s_controls.backBtn] = {"backBtn"},
    [HallGameRoomLevelView.s_controls.gameNameView] = {"gameNameView"};
    [HallGameRoomLevelView.s_controls.gameNameBtn] = {"gameNameView", "gameNameBtn"};
    [HallGameRoomLevelView.s_controls.gameName] = {"gameNameView", "gameNameBtn", "gameName"};
    [HallGameRoomLevelView.s_controls.arrow] = {"gameNameView", "gameNameBtn", "arrow"};
    [HallGameRoomLevelView.s_controls.pulldown_bg] = {"gameNameView", "pulldown_bg"};
    [HallGameRoomLevelView.s_controls.gameNameListView] = {"gameNameView", "pulldown_bg", "gameNameListView"};
    [HallGameRoomLevelView.s_controls.roomLevelListView] = {"roomLevelView"};
    [HallGameRoomLevelView.s_controls.fastStartGameBtn] = {"fastStartGameBtn"};
    [HallGameRoomLevelView.s_controls.shieldLayer] = {"shieldLayer"};
    [HallGameRoomLevelView.s_controls.friendView] = {"friendView"};
    [HallGameRoomLevelView.s_controls.matchView] = {"matchView"};
    [HallGameRoomLevelView.s_controls.friendRoomBtn] = {"friendView","friendRoomBtn"};
    [HallGameRoomLevelView.s_controls.matchBtn] = {"matchView","matchBtn"};
    [HallGameRoomLevelView.s_controls.maskImg] = {"maskImg"};
    [HallGameRoomLevelView.s_controls.maskView] = {"maskView"};
    [HallGameRoomLevelView.s_controls.View_levelMode] = {"View_levelMode"};
    [HallGameRoomLevelView.s_controls.View_forCheckBoxs] = {"View_levelMode","View_forCheckBoxs"};
    
}

HallGameRoomLevelView.s_controlFuncMap = {
    [HallGameRoomLevelView.s_controls.backBtn] = HallGameRoomLevelView.onBackBtnClick;
    [HallGameRoomLevelView.s_controls.gameNameBtn] = HallGameRoomLevelView.onGameNameBtnClick;
    [HallGameRoomLevelView.s_controls.fastStartGameBtn] = HallGameRoomLevelView.onFastStartGameBtnClick;
    [HallGameRoomLevelView.s_controls.friendRoomBtn] = HallGameRoomLevelView.onFriendRoomBtnClick;
    [HallGameRoomLevelView.s_controls.matchBtn] = HallGameRoomLevelView.onMatchBtnClick;  
}


HallGameNameItem = class(Node);

HallGameNameItem.ctor = function(self, data)
    self.m_data = data;

    local bg = UIFactory.createNode();
    bg:setSize(329,90);
    self:setSize(329,90);
    local line = UIFactory.createImage("hall/common/line_h4.png");
    line:setAlign(kAlignBottom);
    bg:addChild(line);
    self:addChild(bg);

    local gameTitle = kGameManager:getGameHallTitleFile(self.m_data.id);
    self.m_gameNameFile = new(Image, gameTitle);
    self:addChild(self.m_gameNameFile);
    self.m_gameNameFile:setAlign(kAlignCenter);
end

HallGameNameItem.getData = function(self)
    return self.m_data;
end

return HallGameRoomLevelView;
