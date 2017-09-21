require("common/commonGameLayer");
require("hall/main/data/hallBottomButtonConfig");
require(ViewPath .. "hall/main/hall_bottom_btns");
require("hall/main/pin/hall_pin");
require("hall/activity/data/activityDataInterface");
require("hall/backpack/data/backpackDataInterface");
require('hall/goldBar/data/goldBarDataInterface');
require("hall/privateRoom/data/privateRoomDataInterface");
require("isolater/widget/layerManagerIsolater");

local HallBottomBtns = class(CommonGameLayer, false);

HallBottomBtns.s_horizontalItemSpace = 130;
HallBottomBtns.s_verticalItemSpace = 120;

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

HallBottomBtns.Delegate = {

	onPushToOtherState = "onPushToOtherState";
	onToDayTask = "onToDayTask";
	onAddToScene =  "onAddToScene";
	onAgentBtnClick = "onAgentBtnClick";
    onCommunityBtnClick = "onCommunityBtnClick";
    getSafeBoxByMoneyId = "getSafeBoxByMoneyId";
}

HallBottomBtns.s_controls = {

	setting = getIndex();
	mall = getIndex();
	rank = getIndex();
	safeBox = getIndex();
	freeMoney = getIndex();
	activity = getIndex();
	message = getIndex();
	exchange = getIndex();
	backpack = getIndex();
	goldBar = getIndex();
	friend = getIndex();
	service = getIndex();
	agent = getIndex();
	friendRoom = getIndex();
	redEnvelope = getIndex();
	static_button_more = getIndex();
	static_text_time = getIndex();
	View_more_tip = getIndex();
}

HallBottomBtns.ctor = function(self)

	super(self, hall_bottom_btns);
	self:setFillParent(true,true);
	self.reportKey = "hall";
	self.m_isInRoomLevel = false;
	self.m_ctrl = HallBottomBtns.s_controls;
	self:__init();
	self:__addObservers();
end

HallBottomBtns.dtor = function(self)

	self:__delAnim();
	self:__removeObservers();
end

HallBottomBtns.__init = function(self)

	self.m_btns = {};
	for _, v in ipairs(HallBottomBtns.BottomBtnList) do
		self.m_btns[v.id] = self:findViewById(v.ctrlId);
	end

	self.m_gameId = GameType.HALL;

	self:__initStaticWigdets();
end

--设置所有按钮不可见
HallBottomBtns.__setAllBottomVisibleFalse = function(self)
	for k,v in pairs(self.m_btns) do
		v:setVisible(false);
	end
end

--根据功能ID找到相应的按钮句柄
HallBottomBtns.__getHandleById = function(self,p_btnId)

	if not p_btnId then
		return;
	end

    --得到ctrlId
    local function __getCtrlId(p_id)
        for k,v in pairs(self.BottomBtnList) do
            if v.id == p_id then
                return v.ctrlId;
            end
        end
    end


    local __ctrlId = __getCtrlId(p_btnId);

	if __ctrlId then
		local __button = self:findViewById(__ctrlId);
		if __button then
			return __button;
		else
			return ;
		end
	else
		return ;
	end

end

--初始化静态控件
HallBottomBtns.__initStaticWigdets = function(self)
	self:__showTime();

	local __isFirst = HallDataInterface.getInstance():isCanShowTip();
	if __isFirst then
		self:findViewById(self.m_ctrl.View_more_tip):setVisible(true);
        if self.m_tipHandle then
            self.m_tipHandle:cancel();
            self.m_tipHandle = nil;
        end

        self.m_tipHandle = Clock.instance():schedule_once(function()
                self:findViewById(self.m_ctrl.View_more_tip):setVisible(false);
                HallDataInterface.getInstance():setCanShowTip(false);
            end,
            15);
	else
		self:findViewById(self.m_ctrl.View_more_tip):setVisible(false);
	end
end
--初始化左上上按钮 
HallBottomBtns.__initLeftTopBtns = function(self)
	local __currentX = 25;
	local __currentY = 0;
	local __intervalX = 85;
	local __intervalY = 0;

	local __btns = HallDataInterface.getInstance():getLeftTopBtnIds(self.m_gameId);

	for k,v in pairs(__btns) do
		local __btnHandle = self:__getHandleById(v);
		if __btnHandle then
			__btnHandle:setVisible(not self.m_isInRoomLevel);
			__btnHandle:setAlign(kAlignTopLeft);
			__btnHandle:setPos(__currentX,__currentY);
			__currentX = __currentX + __intervalX;
			__currentY = __currentY + __intervalY;
		end
	end
end

--初始左中按钮 
HallBottomBtns.__initLeftCenterBtns = function(self)

	local __getPos = function(p_count)
		local __oX = 10;
		local __oY = 95;
		local __intervalX = 90;
		local __intervalY = 90;
		local __posTab = {};
		for i=1,p_count do
			local __tmpPos = {};
			if i==1 then
				__tmpPos.x = __oX;
				__tmpPos.y = __oY;
			else
				if math.mod(i,2) == 1 then
					__tmpPos.x = __oX + __intervalX*((i-1)/2);
					__tmpPos.y = __oY;
				else
					__tmpPos.x = __oX;
					__tmpPos.y = __oY + __intervalY*(i/2);
				end

			end
            table.insert(__posTab,__tmpPos);
		end

		return __posTab;
	end


	local __btns = HallDataInterface.getInstance():getLeftCenterBtnIdsBtnIds(self.m_gameId);

	local __posTab = __getPos(table.getn(__btns));

    local __flag = 1;
	for k,v in pairs(__btns) do
		local __btnHandle = self:__getHandleById(v);
		if __btnHandle then
			__btnHandle:setAlign(kAlignBottomLeft);
			__btnHandle:setVisible(true);
			__btnHandle:setPos(__posTab[__flag].x,__posTab[__flag].y);
            __flag = __flag + 1;
		end
	end
end

--初始化右下角按钮 
HallBottomBtns.__initRightBottomBtns = function(self)
	local __currentX = 250;
	local __currentY = 2;
	local __intervalX = 105;
	local __intervalY = 0;

	local __btns = HallDataInterface.getInstance():getRightBottomBtnIds(self.m_gameId);

	for k,v in pairs(__btns) do
		local __btnHandle = self:__getHandleById(v);
		if __btnHandle then
			__btnHandle:setAlign(kAlignBottomRight);
			__btnHandle:setVisible(not self.m_isInRoomLevel);
			__btnHandle:setPos(__currentX,__currentY);
			__currentX = __currentX + __intervalX;
			__currentY = __currentY + __intervalY;
		end
	end
end

--初始化左下角按钮 
HallBottomBtns.__initLeftBottomBtns = function(self)
	local __currentX = 415;
	local __currentY = 2;
	local __intervalX = 105;
	local __intervalY = 0;

	local __btns = HallDataInterface.getInstance():getLeftBottomBtnIds(self.m_gameId);

	for k,v in pairs(__btns) do
		local __btnHandle = self:__getHandleById(v);
		if __btnHandle then
			__btnHandle:setAlign(kAlignBottomLeft);
			__btnHandle:setVisible(true);
			__btnHandle:setPos(__currentX,__currentY);
			__currentX = __currentX + __intervalX;
			__currentY = __currentY + __intervalY;
		end
	end
end

HallBottomBtns.__addObservers = function(self)

	HallDataInterface.getInstance():setObserver(self);
	UpdateHandleMgr.getInstance():setObserver(self);
    SuggestionDataInterface.getInstance():setObserver(self);
	MessageDataInterface.getInstance():setObserver(self);
	TaskRewardDataInterface.getInstance():setObserver(self);
	ActivityDataInterface.getInstance():setObserver(self);
	BackpackDataInterface.getInstance():setObserver(self);
end

HallBottomBtns.__removeObservers = function(self)

	HallDataInterface.getInstance():clearObserver(self);
	UpdateHandleMgr.getInstance():clearObserver(self);
    SuggestionDataInterface.getInstance():clearObserver(self);
	MessageDataInterface.getInstance():clearObserver(self);
	TaskRewardDataInterface.getInstance():clearObserver(self);
	ActivityDataInterface.getInstance():clearObserver(self);
	BackpackDataInterface.getInstance():clearObserver(self);
end

HallBottomBtns.show = function(self, gameId)

	self:setVisible(true);


	--区分大厅和子游戏的大厅
	if gameId and gameId == GameType.HALL then
		self.reportKey = "hall";
	elseif gameId then
		self.reportKey = string.format("child_%s", gameId);
	end


	if gameId then
		self.m_gameId = gameId;
	end

	self:__refreshDynamicBtns();
end

HallBottomBtns.__refreshDynamicBtns = function(self)
	self:__setAllBottomVisibleFalse();
	self:__initLeftTopBtns();
	self:__initLeftCenterBtns();
	self:__initRightBottomBtns();
	self:__initLeftBottomBtns();
	self:updateBtnStatus();
end

HallBottomBtns.hide = function (self)

	self:setVisible(false);
end


--是否在房间等级界面
HallBottomBtns.setIsInRoomLevel = function(self,p_isInRoomLevel)
	self.m_isInRoomLevel = p_isInRoomLevel;
	self:__initLeftTopBtns();
	self:__initRightBottomBtns();
end

-------------------------------------------静态按钮start---------------------------------------
--时间显示
HallBottomBtns.__showTime = function(self)
    local function updateTime()
        local __timeText = os.date("%H:%M");
        self:findViewById(self.m_ctrl.static_text_time):setText(__timeText);
    end

    updateTime();
    if not self.m_timeHandle then
        self.m_timeHandle = Clock.instance():schedule(function()
            updateTime();
        end, 30); --30s刷新一次
    end
end

HallBottomBtns.__delAnim = function(self)
    if self.m_timeHandle then
        self.m_timeHandle:cancel();
        self.m_timeHandle = nil;
    end

    if self.m_tipHandle then
        self.m_tipHandle:cancel();
        self.m_tipHandle = nil;
    end
end
-------------------------------------------静态按钮end ---------------------------------------

HallBottomBtns.onRedEnvelopeBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallBottomRedEnvelope, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onAddToScene,"redenvelope_config");
end

HallBottomBtns.onFriendRoomBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBottomFriendRoom, self.reportKey or "");
   	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.PrivateRoom);
   	PrivateRoomDataInterface.getInstance():setOpenFlagHall(true);
end

HallBottomBtns.onAgentBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBottomAgent, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onAgentBtnClick);
end

HallBottomBtns.onServiceBtnClick = function(self)
	if kLoginDataInterface:getIsLoginSuccess() then
	    UBReport.getInstance():report(UBConfig.kHallBottomService, self.reportKey or "");
        self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.Suggestion,nil,true);
--		require("hall/gameData/cusomerService/cusomerServiceHelper")
--		CusomerServiceHelper.getInstance():enter(kUserInfoData:getkefuGid(), kUserInfoData:getkefuSid())
	end
end

HallBottomBtns.onFriendBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBottomFriend, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onCommunityBtnClick);
end


HallBottomBtns.onSettingBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallBottomSetting, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.Setting);
end

HallBottomBtns.onMallBtnClick = function(self)

	UBReport.getInstance():report(UBConfig.kHallBottomMall, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.Recharge);
end

HallBottomBtns.onRankBtnClick = function(self)

	UBReport.getInstance():report(UBConfig.kHallBottomRank, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.RankList);
end

HallBottomBtns.onSafeBoxBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallBottomSafeBox, self.reportKey or "");
    self:execDelegate(HallBottomBtns.Delegate.getSafeBoxByMoneyId);
end

HallBottomBtns.onFreeMoneyBtnClick = function(self)


	UBReport.getInstance():report(UBConfig.kHallBottomFreeMoney, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onToDayTask, true);
end

HallBottomBtns.onActivityBtnClick = function(self)


	UBReport.getInstance():report(UBConfig.kHallBottomActivity, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.Activity);
end

HallBottomBtns.onGroupGameBtnClick = function (self)

	UBReport.getInstance():report(UBConfig.kHallBottomGroupGame, self.reportKey or "");
	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.GroupGame);
end

HallBottomBtns.onBackpackBtnClick = function(self)

	UBReport.getInstance():report(UBConfig.kHallBottomBackpack);
	self:execDelegate(HallBottomBtns.Delegate.onAddToScene,"case_list_ui");
end

HallBottomBtns.onGoldBarBtnClick = function(self)

	UBReport.getInstance():report(UBConfig.kHallBottomGoldBar);
	self:execDelegate(HallBottomBtns.Delegate.onAddToScene,"goldBar");


	if GoldBarDataInterface.getInstance():getGoldBarRedState() == 1 then
		GoldBarDataInterface.getInstance():setGoldBarRedState(0);
		self:__getRedDot(self.m_ctrl.goldBar):setVisible(false);
	end
end

HallBottomBtns.onMoreGameBtnClick = function(self)

	UBReport.getInstance():report(UBConfig.kHallBottomMoreGame);
	self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.MoreGames);
end

HallBottomBtns.onMessageBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBottomMessage, self.reportKey or "");
    self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.Message);
end

HallBottomBtns.onExchangeBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallBottomExchange, self.reportKey or "");
    self:execDelegate(HallBottomBtns.Delegate.onPushToOtherState, States.DiamondShop);
end


HallBottomBtns.onMoreBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMore, self.reportKey or "");
	local __class = require("hall/main/widget/moreTip");
	local wnd = new(__class);
	self:addChild(wnd);
	wnd:setDelegate(self.m_delegate);
	self:__getRedDot(self.m_ctrl.static_button_more):setVisible(false);
    self:findViewById(self.m_ctrl.View_more_tip):setVisible(false);
    HallDataInterface.getInstance():setCanShowTip(false);
end

-----callback-----------------------------

--@brief 获取底部按钮信息回调
HallBottomBtns.onGetHallBottomButtonListCallBack = function(self, isSuccess, bottomBtnConfig, gameId)
    if isSuccess and self.m_gameId == gameId then

        self:__refreshDynamicBtns();
	end
end

--@brief 获取活动数目回调
HallBottomBtns.onGetActivityCountCallBack = function(self, isSuccess, num, url)
    self:__refreshActivityRedStatus();
end

--@brief 检查更新回调
HallBottomBtns.onCheckUpdateCallBack = function(self, isSuccess)
    self:__refreshSettingRedStatus();
end

--@brief 获取反馈列表回调
HallBottomBtns.onGetFeedbackListCallback = function(self)
    self:__refreshSettingRedStatus();
end

--@brief 获取消息回调
HallBottomBtns.delegateRefreshMsgCallback = function(self)
    self:__refreshMessageRedStatus();
end

--@brief 登录奖励以及任务刷新回调
HallBottomBtns.onRefreshTaskRewardStatusCallBack = function(self)
    self:__refreshTaskRewardRedStatus(); 
end

--刷新物品箱的状体
HallBottomBtns.toChangeNewObjectCaseRedState = function(self,isShow)
    self:__getRedDot(self.m_ctrl.backpack):setVisible(isShow);
end

-----------------刷新-----------------
HallBottomBtns.updateBtnStatus = function(self)
    if not kLoginDataInterface:getIsLoginSuccess() then
        return;
    end

    self:__refreshActivityRedStatus();
    self:__refreshSettingRedStatus();
    self:__refreshTaskRewardRedStatus();
    --背包物品是否显示警示状态
    BackpackDataInterface.getInstance():setIconRed();
    self:__refreshMessageRedStatus();
    self:__refreshGoldBarRedStatus();
    self:__refreshMoreRedStatus();
    self:__refreshFriendRedStatus();    
    self:__refreshFriendRoomRedStatus();
    --背包位置改变后通知 BackpackDataInterface
    local tmp_x,tmp_y = self:findViewById(self.m_ctrl.backpack):getAbsolutePos();
    BackpackDataInterface.getInstance():setBagPos({x = tmp_x,y = tmp_y});
end

HallBottomBtns.refreshAgentState = function(self)
    self:findViewById(HallBottomBtns.s_controls.agent):setVisible(false)
    self:__initLeftTopBtns();
end


HallBottomBtns.__refreshMessageRedStatus = function(self)
    local isShow = MessageDataInterface.getInstance():hasNewMessage();

    self:findViewById(self.m_ctrl.message):getChildByName("dot"):setVisible(isShow);
end

HallBottomBtns.__refreshMoreRedStatus = function(self)
	local __isFirst = HallDataInterface.getInstance():isCanShowTip();
	self:__getRedDot(self.m_ctrl.static_button_more):setVisible(__isFirst);
end

HallBottomBtns.__refreshGoldBarRedStatus = function(self)
    if GoldBarDataInterface.getInstance():getGoldBarRedState() == 1 then
        self:__getRedDot(self.m_ctrl.goldBar):setVisible(true);
    end
end

HallBottomBtns.__refreshActivityRedStatus = function(self)
    self:__getRedDot(self.m_ctrl.activity):setVisible( ActivityDataInterface.getInstance():hasUnReadActivity() );
end

HallBottomBtns.__refreshSettingRedStatus = function(self)
    local feedbaackUnread = SuggestionDataInterface.getInstance():getUnreadFeedbackNum();
    local isShow = feedbaackUnread > 0; 
    local status = HallUpdateConfig.getInstance():getHallUpdateStatus();
    local isHasUpdate = status == 1 or status == 3;

    self:__getRedDot(self.m_ctrl.setting):setVisible(isShow or isHasUpdate);

end

HallBottomBtns.__refreshTaskRewardRedStatus = function(self)
    self:__getRedDot(self.m_ctrl.freeMoney):setVisible( TaskRewardDataInterface.getInstance():canGetFreeMoney() );
end

HallBottomBtns.refreshFriendRedStatus = function(self)
	self:__refreshFriendRedStatus();
end

HallBottomBtns.__refreshFriendRedStatus = function(self)
	local hasNewMsg = CommunityDataInterface.getInstance():hasNewMessage();
    local isShow = hasNewMsg > 0 and true or false ;
    self:__getRedDot(self.m_ctrl.friend):setVisible(isShow);
end
HallBottomBtns.__refreshFriendRoomRedStatus = function(self)
	self:__getRedDot(self.m_ctrl.friendRoom):setVisible(not PrivateRoomDataInterface.getInstance():getOpenFlagHall());
end
HallBottomBtns.__getRedDot = function(self, ctrlId)
    return self:findViewById(ctrlId):getChildByName("dot");
end

HallBottomBtns.s_controlConfig = {

    [HallBottomBtns.s_controls.setting] = {"setting"};
    [HallBottomBtns.s_controls.mall] = {"mall"};
    [HallBottomBtns.s_controls.rank] = {"rank"},
    [HallBottomBtns.s_controls.safeBox] = {"safeBox"},
    [HallBottomBtns.s_controls.freeMoney] = {"freeMoney"},
    [HallBottomBtns.s_controls.activity] = {"activity"},
    [HallBottomBtns.s_controls.message] = {"message"},
    [HallBottomBtns.s_controls.backpack] = {"backpack"};
    [HallBottomBtns.s_controls.goldBar] = {"goldBar"};
    [HallBottomBtns.s_controls.friend ]= {"friend"};
    [HallBottomBtns.s_controls.service ]= {"service"};
    [HallBottomBtns.s_controls.agent ]= {"agent"};
    [HallBottomBtns.s_controls.friendRoom  ]= {"friendRoom"};
    [HallBottomBtns.s_controls.redEnvelope  ]= {"redEnvelope"};
    [HallBottomBtns.s_controls.static_button_more ]= {"static_button_more"};
    [HallBottomBtns.s_controls.static_text_time ]= {"static_text_time"};
    [HallBottomBtns.s_controls.View_more_tip ]= {"View_more_tip"};
}

HallBottomBtns.s_controlFuncMap = {

    [HallBottomBtns.s_controls.setting] = HallBottomBtns.onSettingBtnClick;
    [HallBottomBtns.s_controls.mall] = HallBottomBtns.onMallBtnClick;
    [HallBottomBtns.s_controls.rank] = HallBottomBtns.onRankBtnClick,
    [HallBottomBtns.s_controls.safeBox] = HallBottomBtns.onSafeBoxBtnClick,
    [HallBottomBtns.s_controls.freeMoney] = HallBottomBtns.onFreeMoneyBtnClick,
    [HallBottomBtns.s_controls.activity] = HallBottomBtns.onActivityBtnClick,
    [HallBottomBtns.s_controls.message] = HallBottomBtns.onMessageBtnClick,
    [HallBottomBtns.s_controls.backpack] = HallBottomBtns.onBackpackBtnClick,
    [HallBottomBtns.s_controls.goldBar] = HallBottomBtns.onGoldBarBtnClick,
    [HallBottomBtns.s_controls.friend ]= HallBottomBtns.onFriendBtnClick,
    [HallBottomBtns.s_controls.service ]= HallBottomBtns.onServiceBtnClick,
    [HallBottomBtns.s_controls.agent ]= HallBottomBtns.onAgentBtnClick,
    [HallBottomBtns.s_controls.friendRoom  ]= HallBottomBtns.onFriendRoomBtnClick,
    [HallBottomBtns.s_controls.redEnvelope  ]= HallBottomBtns.onRedEnvelopeBtnClick,
    [HallBottomBtns.s_controls.static_button_more]= HallBottomBtns.onMoreBtnClick,
}

HallBottomBtns.BottomBtnList = {
    { ["id"] = HallBottomButtonConfig.btnIds.safeBox , ["ctrlId"] = HallBottomBtns.s_controls.safeBox },
    { ["id"] = HallBottomButtonConfig.btnIds.freeMoney , ["ctrlId"] = HallBottomBtns.s_controls.freeMoney },
    { ["id"] = HallBottomButtonConfig.btnIds.mall , ["ctrlId"] = HallBottomBtns.s_controls.mall },
    { ["id"] = HallBottomButtonConfig.btnIds.activity , ["ctrlId"] = HallBottomBtns.s_controls.activity },
    { ["id"] = HallBottomButtonConfig.btnIds.message , ["ctrlId"] = HallBottomBtns.s_controls.message },
    { ["id"] = HallBottomButtonConfig.btnIds.setting , ["ctrlId"] = HallBottomBtns.s_controls.setting },
    { ["id"] = HallBottomButtonConfig.btnIds.rank , ["ctrlId"] = HallBottomBtns.s_controls.rank },
    { ["id"] = HallBottomButtonConfig.btnIds.backpack , ["ctrlId"] = HallBottomBtns.s_controls.backpack },
    { ["id"] = HallBottomButtonConfig.btnIds.goldBar , ["ctrlId"] = HallBottomBtns.s_controls.goldBar },
    { ["id"] = HallBottomButtonConfig.btnIds.friend , ["ctrlId"] = HallBottomBtns.s_controls.friend },
    { ["id"] = HallBottomButtonConfig.btnIds.service , ["ctrlId"] = HallBottomBtns.s_controls.service },
    { ["id"] = HallBottomButtonConfig.btnIds.agent , ["ctrlId"] = HallBottomBtns.s_controls.agent },
    { ["id"] = HallBottomButtonConfig.btnIds.friendRoom , ["ctrlId"] = HallBottomBtns.s_controls.friendRoom },
    { ["id"] = HallBottomButtonConfig.btnIds.redEnvelope , ["ctrlId"] = HallBottomBtns.s_controls.redEnvelope },
}

return HallBottomBtns;
