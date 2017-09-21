require("common/commonScene")
require("common/loadingView");

require("hall/matchHall/gameMatchHall/gameMatchTipsDialog");
require("hall/matchHall/gameMatchHall/data/gameMatchHallConstants");
require("isolater/interface/propIsolater");
require("isolater/interface/gameInfoIsolater");
require("isolater/interface/userPropertyIsolater");
require("isolater/interface/userIdentityIsolater");
require("isolater/interface/userExpInfoIsolater");
require("isolater/interface/userBaseInfoIsolater");
require("isolater/interface/payIsolater");
require("hall/animation/animSnow");
require("hall/backpack/data/backpackDataInterface");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");

GameMatchHallScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

--报名检验类型表
local ENROLL_CHECK_TYPE = {
	THRESHOLD = 1,--比赛门槛
	FEE = 2,--报名费
}

GameMatchHallScene.s_cmds = {
	onGetMatchList			= 1,
	signUpMatchSuccess 		= 3,
	closeMasterWnd			= 6,
	UpdateExitMatchResult   = 7,
	ShowEnterMatchDlg		= 8,
	updateMatchDetail		= 9,
    onBroadcastPayMoney     = 10,
    enterLoading            = 11,
    onInvitationalMyApplyLists = 12,
}

GameMatchHallScene.s_controls = {
    background = getIndex();
    contentView = getIndex();
    Button_return  = getIndex();
    Image__tittle = getIndex();

	bottomLeftView = getIndex();
	View_info = getIndex();
	View_head = getIndex();
	Button_head = getIndex();
	Text_name = getIndex();
	Image_vip_flag = getIndex();
    Button_gold = getIndex();
    Button_goldBar = getIndex();
	Text_gold = getIndex();
	Text_goldBar = getIndex();
    reLoginBtn = getIndex();
    loadingView = getIndex();
    loadingIcon = getIndex();
    rankBtn = getIndex();
    bagBtn = getIndex();
    signedBtn = getIndex();
    Image_bottom_bg = getIndex();
    invitationalBtn = getIndex();
    curTime = getIndex();
}

GameMatchHallScene.ctor = function ( self, viewConfig, controller )
	self.m_ctrls = GameMatchHallScene.s_controls;
	self:findViewById(self.m_ctrls.Image__tittle):restoreSize();
	self:initView();

	EventDispatcher.getInstance():register(HallController.s_matchListDispatch, self, self.checkSignupMatchId);
	UserIdentityIsolater.getInstance():setObserver(self);
	BackpackDataInterface.getInstance():setObserver(self);
	kUserInfoData:setObserver(self);

	--背包物品是否显示警示状态
	BackpackDataInterface.getInstance():setIconRed();
	UpdateHandleMgr.getInstance():setObserver(self);
	SafeBoxDataInterface.getInstance():setObserver(self);
    MatchHallDataInterface.getInstance():requestMatchTagList()
end

GameMatchHallScene.initView = function(self)
	self:_initVipAni();
	self:findViewById(self.m_ctrls.rankBtn):setVisible( not HallDataInterface.getInstance():getVersionFilterSwitch() );
    self:__initBg()
    self:__initInvitational()
    self:__showTime();
end

GameMatchHallScene.__showTime = function(self)
    local function updateTime()
        local __timeText = os.date("%H:%M");
        self:findViewById(self.m_ctrls.curTime):setText(__timeText);
    end

    updateTime();
    if not self.m_timeHandle then
        self.m_timeHandle = Clock.instance():schedule(function()
            updateTime();
        end, 30); 
    end
end

GameMatchHallScene.__deleteTimeHandle = function(self)
    if self.m_timeHandle then
        self.m_timeHandle:cancel();
        self.m_timeHandle = nil;
    end
end

GameMatchHallScene.__onDelayResumeScene = function(self)
	CommonScene.__onDelayResumeScene(self);
    self:__showMatchList();
end

GameMatchHallScene.__initBg = function(self)
    HolidaysBgDataInterface.getInstance():showImg(HolidaysBgDataInterface.ImgType.Bg, self:findViewById(self.m_ctrls.background))
    local __bg = self:findViewById(self.m_ctrls.background);
    ShaderManager.addBlur(__bg, {intensity=10} );

    local __template = self:findViewById(self.m_ctrls.Image_bottom_bg);
    local __width,__height = __template:getSize(); 
    local __width2,__height2 = __bg:getSize(); 

    if self.m_blurNode then
        local blur = require("libEffect/shaders/blur");
        blur.removeEffect(self.m_blurNode);
        __bg:removeChild(self.m_blurNode,true);
        self.m_blurNode = nil;
    end

    self.m_blurNode = ShaderManager.getPartBlurNode(__bg,10,1,0,__height2 -__height,__width,__height);
end

GameMatchHallScene.__initInvitational = function(self)
    local isOpen = HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.invitational)
    self:findViewById(self.m_ctrls.invitationalBtn):setVisible(isOpen)
end

GameMatchHallScene.resume = function ( self )
    self.m_stayTime = os.time()
	CommonScene.resume(self);

	self:updateUserInfo();
    self:__playAnimSnow();

    EventDispatcher.getInstance():register(CommonJumpLogic.s_commonJumpEvent, self, self.checkCommonJumpParams);
end

GameMatchHallScene.pause = function ( self )
	CommonScene.pause(self);

	LoadingView.getInstance():hidden();

    EventDispatcher.getInstance():unregister(CommonJumpLogic.s_commonJumpEvent, self, self.checkCommonJumpParams);
	self:_stopVipAni();
    self:__stopAnimSnow();

    self.m_selectItemData = nil;
end

--@brief 判断跳转信息
GameMatchHallScene.checkCommonJumpParams = function(self)
    local cmd, stateId, params = CommonJumpLogic.getInstance():getJumpParams();
    if cmd == CommonJumpCmds.GOTO_MATCH_ROOM then
        --只拦截跳转到比赛的命令
        local jumpInfo = MatchHallDataInterface.getInstance():getMatchJumpInfo();
        CommonJumpLogic.getInstance():resetJumpData();
        self:openMatchDetailWndByJumpInfo();
        return true;
    end
end

--@brief 检查是否有需要自动报名的比赛id
GameMatchHallScene.checkSignupMatchId = function( self )
    local matchId = MatchHallDataInterface.getInstance():getSignMatchId();
    MatchHallDataInterface.getInstance():setSignMatchId(nil);
    if matchId > 0 then 
        local matchList = MatchHallDataInterface.getInstance():getMatchList();
        for k, v in ipairs(matchList) do
            if v.id == matchId then
                if v.status ~= GameConstant.HAVE_SIGN_UP then
                    if string.isEmpty(v.matchentrycode) then
                        self:__handleSignupMatchEvent(v);
                    else
                        self:onMatchItemClick(v);
                    end
                end
                return;
            end
        end
        if MatchHallDataInterface.getInstance():checkInvitationalById(matchId) then --邀请赛
            matchList = MatchHallDataInterface.getInstance():getInvitationalEnrollList()
            for _, v in ipairs(matchList) do
                if v.id == matchId and v.stime > GameInfoIsolater.getInstance():getRightTimeWithServer() then
                    self:__startSignupMatch(v)
                    return
                end
            end

            StateMachine.getInstance():pushState(States.Invitational)
            InvitationalDataInterface.getInstance():enterMatch({code = matchId})
            return
        end
        Toast.getInstance():showText("已结束报名",50,30,kAlignLeft,"",30,200,175,115);
    end
end

GameMatchHallScene.dtor = function ( self )
	UpdateHandleMgr.getInstance():clearObserver(self);
	kUserInfoData:clearObserver(self);
	BackpackDataInterface.getInstance():clearObserver(self);
	UserIdentityIsolater.getInstance():clearObserver(self);
	EventDispatcher.getInstance():unregister(HallController.s_matchListDispatch, self, self.checkSignupMatchId);
	SafeBoxDataInterface.getInstance():clearObserver(self)

	delete(self.animHallVip);
	self.animHallVip = nil;
    self.m_stayTime = nil

	self:_stopVipAni();
    self:__stopAnimSnow();

    GameMatchTipsDialog.hide();
    self:__deleteTimeHandle();
end

--@delegate 比赛详情报名回调
GameMatchHallScene.onMatchDetailLayerSignup = function (self, itemData)
    self:__handleSignupMatchEvent(itemData);
end

--@brief 比赛列表点击回调
GameMatchHallScene.onMatchItemClick = function(self, data)
    local now = GameInfoIsolater.getInstance():getRightTimeWithServer();
    local delta = data.stime - now;
    if delta < 0 and number.valueOf(data.type) == GameConstant.FIXED_TIME_MATCH then
        --是定时赛，且已经过期了
        if not MatchHallDataInterface.getInstance():checkIsLoopMatch(data) then
            --不是循环赛，则显示toast
            Toast.getInstance():showText(kTextMatchStarted, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
            return;
        end
    end

    if number.valueOf(data.status) == GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN then
        self:__handleSignupMatchEvent(data);
    else
        self:initMatchDetailLayer(data);
        self:requestCtrlCmd(GameMatchHallController.s_cmds.requestMatchDetail, data);
    end
end

--@brief 处理比赛报名事件
--@param itemData 比赛列表数据
GameMatchHallScene.__handleSignupMatchEvent = function(self, itemData)
	if not UserBaseInfoIsolater.getInstance():getIsLoginSuccess() then 
		return false;
	end
	
	if not itemData then 
		return false;
	end

	self.m_itemData = itemData;
	

	local state = tonumber(itemData.status);
	if state == GameConstant.HAVE_SIGN_UP then 
		-- 此时为已报名，可以退赛状态 则执行退赛
		LoadingView.getInstance():showText("正在退赛...");
		self:requestCtrlCmd(GameMatchHallController.s_cmds.requestExitMatch, itemData);
		return true;
	end

	local downloaded = self:isGameDownloaded(itemData);
	if not downloaded then 
		return false;
	end

	-- 已报名且可以进入，不需要验证银币信息
	if state ~= GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN then
		--校验门槛
		local result,error_type = MatchHallDataInterface.getInstance():checkEnroll(itemData.thresholdType, itemData.threshold)
		if result then
			--校验报名费
			if not table.isEmpty(itemData.fee) and itemData.fee[1][1] then
				local typ = number.valueOf(itemData.fee[1][1].type)
	        	local num = number.valueOf(itemData.fee[1][1].num)
	    		result,error_type = MatchHallDataInterface.getInstance():checkEnroll(typ, num, true)
	    		if not result then
                    UBReport.getInstance():report(UBConfig.kHallMatchEnrollDiscontent, itemData and itemData.id or "")
	    			self:showEnrollErrorTips(ENROLL_CHECK_TYPE.FEE, error_type, typ, num, itemData)
	    			return false
	    		end
	    	end
		else
            UBReport.getInstance():report(UBConfig.kHallMatchThresholdDiscontent, itemData and itemData.id or "")
			self:showEnrollErrorTips(ENROLL_CHECK_TYPE.THRESHOLD, error_type, itemData.thresholdType, itemData.threshold, itemData)
			return false
		end
	end
		
	-- 个别比赛特殊处理
	if itemData.type == GameConstant.TIME_LIMITED_MATCH then 
		-- 限时赛 
		if state == GameConstant.ALLOW_JOIN_IN or state == GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN then 
			local gameId = number.valueOf(itemData.gameId);
            local level = 500;
			local matchId = itemData.id;
            EventDispatcher.getInstance():dispatch(GameMatchHallController.s_eventGoToGameByInfo, gameId, level, matchId);
		elseif state == GameConstant.HAVE_SIGN_UP then 
			Toast.getInstance():showText(kTextMatchNoStart,50,30,kAlignLeft,"",30,200,175,115);
		elseif state == GameConstant.NOT_SIGN_UP then 
			self:__startSignupMatch(itemData);
		end
	else 
		self:__startSignupMatch(itemData);
	end

	return true;
end

--@brief 请求报名
GameMatchHallScene.__startSignupMatch = function(self, info)
    if not info then 
        return;
    end

    if info.status == GameConstant.NOT_SIGN_UP then 
        LoadingView.getInstance():showText("正在报名...");
    elseif info.status == GameConstant.ALLOW_JOIN_IN then 
        LoadingView.getInstance():showText("正在进入比赛...");
    end

    self:requestCtrlCmd(GameMatchHallController.s_cmds.signupMatch, info);
end

--@brief 报名比赛成功，更新比赛列表信息
GameMatchHallScene.onSignupMatchSuccess = function(self, itemData)
    if table.isEmpty(itemData) then
        return;
    end
    
    LoadingView.getInstance():hidden();
    self:__refreshMatchList();
    self:updateUserInfo();

    if itemData.type == GameConstant.FIXED_TIME_MATCH then
        local tips = table.isEmpty(itemData.fee) and "请准时入场，预祝您赢得大奖！" or "未能按时参加比赛，已交报名费用不再退还"
        local dialog = GameMatchTipsDialog.show("报名成功")
        local TimeFormatUtil = require("util/timeFormatUtil");
        local time = TimeFormatUtil.isSameDay(os.time(), itemData.stime) and os.date("今天%H:%M", itemData.stime) or os.date("%m月%d日 %H:%M", itemData.stime)
        dialog:initSuccessView(time, tips)
    end
end

--@brief 报名成功,进入赛前等待界面
GameMatchHallScene.onEnterLoading = function(self, data)
    if self.m_stayTime and (os.time() - self.m_stayTime) > 0 then
        UBReport.getInstance():report(UBConfig.kHallMatchListToLoading)
        UBReport.getInstance():report(UBConfig.kHallMatchListToLoadingTime, os.time() - self.m_stayTime)
        self.m_stayTime = nil
    end
end

--@brief 更新退赛结果
GameMatchHallScene.onUpdateExitMatchResult = function (self, itemData, info, flag)
    LoadingView.getInstance():hidden();
    if flag then
        self:__refreshMatchList();
        self:updateUserInfo();
    else 
        -- 退赛失败
        Toast.getInstance():showText(info.result,50,30,kAlignLeft,"",30,200,175,115);
    end
end

--@brief 弹出比赛通知
GameMatchHallScene.onShowEnterMatchDlg = function ( self, data )
    self:__refreshMatchList();
end

--@brief 显示报名提示
--@param check_type 校验类型 ENROLL_CHECK_TYPE
--@param error_type 报名校验的返回类型表 GameMatchHallConstants.enrollErrorType
--@param typ 道具类型
--@param num 道具数量
--@param itemData item数据
GameMatchHallScene.showEnrollErrorTips = function(self, check_type, error_type, typ, num, itemData)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local barID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    local bankruptMoney = BankruptDataInterface.getInstance():getBankruptLowestMoney()
    local name = itemData.mname
    local continue_cb, ok_cb = nil, nil
    local unit = ""
    if typ == coinID or typ == barID then
        unit = (typ == coinID) and "银币" or "金条"
    end
    local tips = (check_type == ENROLL_CHECK_TYPE.THRESHOLD) and "要求必须携带" or "需要报名费"
    local dialog = GameMatchTipsDialog.show("报名提示")
    if error_type == GameMatchHallConstants.enrollErrorType.CASH_OUT or error_type == GameMatchHallConstants.enrollErrorType.CASH_RUIN then
        tips = string.format("报名%s%s%s%s，继续报名系统将自动为你取出保险箱中的%s并完成报名。", name, tips, num, unit, unit)
        if error_type == GameMatchHallConstants.enrollErrorType.CASH_RUIN then
            tips = string.format("您需要达到%s%s，才可以报名。继续报名系统将自动为你取出保险箱中的%s并完成报名。", (bankruptMoney + num), unit, unit)
        end
        continue_cb = function()
            GameMatchTipsDialog.hide()
            self.m_selectItemData = itemData
            local safeBox = (typ == coinID) and kUserInfoData:getSafeBoxCurMoney() or kUserInfoData:getSafeBoxCurCrystal()
            SafeBoxDataInterface.getInstance():updateSafeBox(2, safeBox, typ)
        end
    elseif error_type == GameMatchHallConstants.enrollErrorType.TOTAL_OUT or error_type == GameMatchHallConstants.enrollErrorType.TOTAL_RUIN then
        tips = string.format("报名%s%s%s%s，需获取更多的%s才能继续报名。", name, tips, num, unit, unit)
        if error_type == GameMatchHallConstants.enrollErrorType.TOTAL_RUIN then
            tips = string.format("您需要达到%s%s，才可以报名。", (bankruptMoney + num), unit)
        end
        continue_cb = function()
            GameMatchTipsDialog.hide()
            self:_quickPay(typ, (typ == coinID) and (bankruptMoney + num) or num, itemData);
        end
    elseif error_type == GameMatchHallConstants.enrollErrorType.DIAMOND_OUT or 
           error_type == GameMatchHallConstants.enrollErrorType.PROP_OUT then --钻石或道具不足

        unit = RechargeDataInterface.getInstance():getGoodNameByTypeId(typ)
        local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(typ)
        local access = propInfo and propInfo.item_access or ""
        tips = string.format("报名%s%s%s*%s%s", name, tips, unit, num, (access=="") and access or ("，"..access))
        dialog:setTipsViewNotNowState(false)
        dialog:setTipsViewContinueState(false)
        dialog:setTipsViewBtnOKState(true)
    end
    local function close_cb()
    	GameMatchTipsDialog.hide()
    	self:onMatchDetailLayerOpen()
    	if self.m_matchDetailLayer then
    		self.m_matchDetailLayer:_updateData()
    	end
    end
    dialog:initTipsView(tips, nil, continue_cb, close_cb, close_cb, close_cb)
end

--@brief 判断是否需要下载游戏
GameMatchHallScene.isGameDownloaded = function(self, itemData)
	local downloaded = true;
	local status = HallUpdateConfig.getInstance():getGameStatus(itemData.gameId);
	if status == HallGameStatus.CanPlay then	
	elseif status == HallGameStatus.CanInstall or status == HallGameStatus.CanUpdate then
		-- 需要更新或下载游戏
		downloaded = false;
		self:downloadGame(itemData.gameId, status);
	else
		downloaded = false;
		Toast.getInstance():showText(kTextExpectation,50,30,kAlignLeft,"",30,200,175,115);
	end
	return downloaded;
end

--@brief 更新或下载游戏
GameMatchHallScene.downloadGame = function(self, gameId, status)
	Log.v("GameMatchHallScene.downloadGame", "gameId = ", gameId, " status = ", status);
	local data = GameInfoIsolater.getInstance():getGameConfigById(gameId);
	data.status = status;
	UpdateHandleMgr.getInstance():startDownloadOrUpdateGame(data);
end

--@brief 下载游戏成功回调
GameMatchHallScene.downloadGameSuccessed = function(self, data)
	self:onMatchDetailLayerSignup(self.m_itemData);
end

--@brief 更新游戏成功回调
GameMatchHallScene.updateGameSuccessed = function(self, data)
	self:onMatchDetailLayerSignup(self.m_itemData);
end

--@brief 快速购买银币or金条
GameMatchHallScene._quickPay = function(self, typ, num, matchItemData)
    Log.v("GameMatchHallScene._quickPay",typ, num)
    local goodsListId = (typ == RechargeDataInterface.getInstance():getPropertySilverCoinID()) and PayConfig.eGoodsListId.MarketGold or PayConfig.eGoodsListId.MarketCrystal
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.KMatchApplyRecharge);
    StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, goodsListId, {scene = goodsListId}, nil, nil, nil, { diffMoney = num - kUserInfoData:getMoneyById(typ)});
    self.m_selectItemData = matchItemData;
end

--@brief 获取比赛列表
GameMatchHallScene.onGetMatchList = function ( self, data )
	MatchHallDataInterface.getInstance():setFilterGameId(0);

    self:__refreshMatchList();
    if self.m_horizontalView then
        self.m_horizontalView:setEmptyTipsState(table.isEmpty(data))
    end
    
    self:openMatchDetailWndByJumpInfo();
	self:checkSignupMatchId(); -- 处理接收好友邀请
end

--@brief 根据跳转信息弹出比赛详情框
GameMatchHallScene.openMatchDetailWndByJumpInfo = function(self)
    local jumpInfo = MatchHallDataInterface.getInstance():getMatchJumpInfo();
    if not table.isEmpty(jumpInfo) then
        local configid = tonumber(jumpInfo.matchconfigid);
        if configid then
            local matchList = MatchHallDataInterface.getInstance():getMatchList();
            for k, v in ipairs(matchList) do
                if v.configid == configid then
                    self:onMatchItemClick(v);
                    break;
                end
            end
        end
    end
    MatchHallDataInterface.getInstance():setMatchJumpInfo();
end

--@brief 根据跳转信息弹出比赛战绩
GameMatchHallScene.openMatchRecordLayerByJumpInfo = function(self)
	local jumpInfo = MatchHallDataInterface.getInstance():getMatchJumpInfo();
    if not table.isEmpty(jumpInfo) then
        local recordTabId = jumpInfo.recordTabId;
        if recordTabId then
        	self:showMatchRecordLayer();
        end
    end

    MatchHallDataInterface.getInstance():setMatchJumpInfo();
end

-- 更新已报名比赛红点
GameMatchHallScene.updateSignupFlag = function(self, isShow)
    local btn = self:findViewById(self.s_controls.signedBtn)
    local redDot = btn:getChildByName("dot")
    redDot:setVisible(isShow)
end

--@brief 刷新比赛列表
GameMatchHallScene.__refreshMatchList = function(self)
    if self.m_horizontalView and self.m_horizontalView:getVisible() then
    	self.m_horizontalView:refreshMatchList();
    end
    if self.m_enrollList and self.m_enrollList:getVisible() then
        MatchHallDataInterface.getInstance().getMyApplyLists()
    end
end

--@brief 显示比赛列表
GameMatchHallScene.__showMatchList = function(self)
    if not self.m_horizontalView then
    	local gameMatchHallHorizontalView = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallHorizontalView");
        self.m_horizontalView = new(gameMatchHallHorizontalView);
        self.m_horizontalView:setDelegate(self);
        self:findViewById(self.m_ctrls.contentView):addChild(self.m_horizontalView);
        self.m_horizontalView:setFillParent(true, true);
    end

	self.m_horizontalView:show();
end

-------------------------------------------玩家信息-------------------------------------------------
GameMatchHallScene.updateUserInfo = function(self)
    self:_onUpdateVipHead();
    self:_onUpdateUserHead();
    self:_onUpdateMoney();

    ImageCache.getInstance():request(UserBaseInfoIsolater.getInstance():getAvatar_b(), self, self._onHeadDownloaded);

    local nickName = UserBaseInfoIsolater.getInstance():getNickname();
    self:findViewById(self.m_ctrls.Text_name):setText(ToolKit.subString(nickName, 12) );
end

GameMatchHallScene._onUpdateVipHead = function(self)
    local isVip = kUserInfoData:getIsVip();
    self:findViewById(self.m_ctrls.Image_vip_flag):setVisible(isVip);
end

GameMatchHallScene._onUpdateUserHead = function(self, file)
	local sex = kUserInfoData:getSex();
    local headImg = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(sex) or file;

    local headBtn = self:findViewById(self.m_ctrls.Button_head);
    headBtn:setFile(headImg);
end

GameMatchHallScene._onUpdateMoney = function(self)
    local function __refreshMoneyById(p_text,p_id)
        local __moneyNum = kUserInfoData:getMoneyById(p_id);
        local __decimals = (__moneyNum >= 1000000) and  0 or 2;   --超过百万不显示小数部分
        __moneyStr = ToolKit.skipMoneyEx5(__moneyNum,__decimals);
        p_text:setText(__moneyStr);
    end

    local goldText = self:findViewById(self.m_ctrls.Text_gold);
    local goldBarText = self:findViewById(self.m_ctrls.Text_goldBar);

    __refreshMoneyById(goldText, UserPropertyIsolater.getInstance():getPropertySilverCoinID() );
    __refreshMoneyById(goldBarText, UserPropertyIsolater.getInstance():getPropertyGoldBarID() );
end

GameMatchHallScene._onHeadDownloaded = function(self,url,fileName)
    self:_onUpdateUserHead(fileName);
end

GameMatchHallScene._initVipAni = function(self)
	self.animHallVip = new (AnimHallVip);
	self.animHallVip:init();
end

GameMatchHallScene._showVipAni = function (self)
    if self.animHallVip then
        self.animHallVip:show();
    end
end

GameMatchHallScene._stopVipAni = function(self)
	if self.animHallVip then
		self.animHallVip:onTimerShop();
	end
end

GameMatchHallScene.__playAnimSnow = function(self)
    self:__stopAnimSnow();
	
	if not (HallDataInterface:getInstance():isSnow()) then  --是否播放下雪动画由服务器控制
		return;
	end
	
    local sw = System.getScreenScaleWidth();
    local sh = System.getScreenScaleHeight();
    self.m_animSnow = new(AnimSnow);
    self.m_snowView = self.m_animSnow:play(10, sw, sh, 40);
    self:addChild(self.m_snowView);
end

GameMatchHallScene.__stopAnimSnow = function(self)
    delete(self.m_animSnow);
    self.m_animSnow = nil;

    if self.m_snowView then
        local parent = self.m_snowView:getParent();
        if parent then
            parent:removeChild(self.m_snowView);
        end
        delete(self.m_snowView);
        self.m_snowView = nil;
    end
end

GameMatchHallScene.refreshUserIdentity = function(self,curIdentity,lastIdentity)
    self:_onUpdateVipHead();
end

---------------------------------比赛记录弹框----------------------------
--@brief 显示战绩
GameMatchHallScene.showMatchRecordLayer = function(self)
	self:pushStateStack(self, self.onMatchRecordLayerClose);

	if not self.m_recordLayer then
		local gameMatchHallRecord = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/gameMatchHallRecord");
		self.m_recordLayer = new(gameMatchHallRecord);
		self.m_recordLayer:setDelegate(self);
		self.m_root:addChild(self.m_recordLayer);
	end
	self.m_recordLayer:show();
end

--@brief 战绩弹框关闭
GameMatchHallScene.onMatchRecordLayerClose = function(self, popStack)
	if self.m_recordLayer:hasOpenLayer() then
		self:pushStateStack(self, self.onMatchRecordLayerClose);
		return;
	end

	if popStack then
        self:popStateStack();
    end

    if self.m_recordLayer then
        self.m_recordLayer:hide();
        delete(self.m_recordLayer);
        self.m_recordLayer = nil;
    end
end

GameMatchHallScene.onMatchRecordSignupMatch = function(self, data)
    if not table.isEmpty(data) then
        self:onMatchItemClick(data);
    end
end

---------------------------------------------比赛详情弹框----------------------------
-- 生成比赛详情弹框
GameMatchHallScene.initMatchDetailLayer = function(self, data)
    UBReport.getInstance():report(UBConfig.kHallMatchOpenEnroll, data and data.id or "")
	if not self.m_matchDetailLayer then
		local gameMatchHallDetail = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetail");
        self.m_matchDetailLayer = new(gameMatchHallDetail);
        self.m_matchDetailLayer:setDelegate(self);
        self.m_root:addChild(self.m_matchDetailLayer);
    end
    self.m_matchDetailLayer:setData(data);
end

GameMatchHallScene.onMatchDetailLayerOpen = function(self)
    if self.m_matchDetailLayer then
        if not self.m_matchDetailLayer:getVisible() then
            self:pushStateStack(self, self.onMatchDetailLayerClose);
    	end
        self.m_matchDetailLayer:show();
    end
end

-- 关闭比赛详情弹框
GameMatchHallScene.onMatchDetailLayerClose = function(self, popStack)
	if self.m_matchDetailLayer:hasOpenLayer() then
		self:pushStateStack(self, self.onMatchDetailLayerClose);
		return;
	end

    if popStack then
        self:popStateStack();
    end

    if self.m_matchDetailLayer then
        self.m_matchDetailLayer:hide();
    end
end

GameMatchHallScene.onUpdateMatchDetail = function(self, data)
	self:onMatchDetailLayerOpen();

	if self.m_matchDetailLayer then
    	self.m_matchDetailLayer:setDataDetail(data);
    end
end

GameMatchHallScene.onUserHeadBtnClick = function(self)
    StateMachine.getInstance():pushState(States.UserInfo,nil,true);
end

-- 银币更新回调,刷新个人信息
GameMatchHallScene.refreshUserProperty = function(self,propertyType,curNum,lastNum)
	self:updateUserInfo();	
end

--@brief 支付到账回调
GameMatchHallScene.onBroadcastPayMoney = function(self, broadType)
    if self.m_selectItemData then
        --支付回来后，重新报名比赛
        self:__handleSignupMatchEvent(self.m_selectItemData)
        self.m_selectItemData = nil;
    end
end

--@brief 操作保险箱回调
GameMatchHallScene.onUpdateSafeBoxCallBack = function(self, isSuccess, data)
    if isSuccess and self.m_selectItemData then
        self:__handleSignupMatchEvent(self.m_selectItemData)
    end
    self.m_selectItemData = nil;
end

--物品箱红点
GameMatchHallScene.toChangeNewObjectCaseRedState = function(self,isShow)
	local bagBtn = self:findViewById(self.s_controls.bagBtn);
	local redDot = bagBtn:getChildByName("dot");
    redDot:setVisible(isShow);
end

--------------------------------------------按钮点击事件-------------------------------
GameMatchHallScene.onButton_goldBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallBottomMall, "child");
    RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabMoneyId() );
    StateMachine.getInstance():pushState(States.Recharge);
end

GameMatchHallScene.onButton_goldBarBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallBottomMall, "child");
    RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabCrystalId() );
    StateMachine.getInstance():pushState(States.Recharge);
end

-- 显示大师分排行榜
GameMatchHallScene.onRankBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchRecord);

    self:showMatchRecordLayer();
end

GameMatchHallScene.onBagBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchPackage);
    
    LayerManagerIsolater.getInstance():show("case_list_ui");
end

GameMatchHallScene.onSignedBtnClick = function(self)
    if not self.m_enrollList then
        local GameMatchHallHorizontaEnrollList = require("hall/matchHall/gameMatchHall/gameMatchHallHorizontalView/gameMatchHallHorizontaEnrollList")
        self.m_enrollList = new(GameMatchHallHorizontaEnrollList)
        self.m_enrollList:setDelegate(self)
        self:addChild(self.m_enrollList)
        self.m_enrollList:hide()
    end
    LoadingView.getInstance():showText("数据加载中...")
    self.m_isSignedBtnClick = true
    MatchHallDataInterface.getInstance().getMyApplyLists()
end

GameMatchHallScene.onInvitationalMyApplyLists = function(self, isSuccess, info)
    LoadingView.getInstance():hidden()
    if isSuccess then
        local data = MatchHallDataInterface.getInstance():getEnrollList()
        if self.m_isSignedBtnClick then
            if #data > 0 then
                if self.m_enrollList and not self.m_enrollList:getVisible() then
                    self.m_enrollList:show()
                    self:pushStateStack(self, self.onMatchEnrollListClose)
                end
            else
                Toast.getInstance():showText("老板，您还没有报名任何比赛。",50,30,kAlignLeft,"",30,200,175,115)
            end
        end
        if self.m_enrollList and self.m_enrollList:getVisible() then
            self.m_enrollList:refreshMatchList(data)
        end
    end
    self.m_isSignedBtnClick = nil
end

GameMatchHallScene.onMatchEnrollListClose = function(self, popStack)
    if popStack then
        self:popStateStack()
    end
    if self.m_enrollList then
        self.m_enrollList:hide()
    end
end

GameMatchHallScene.onButton_returnBtnClick = function(self)
    self:requestCtrlCmd(GameMatchHallController.s_cmds.onChangeToOtherState, States.Hall);
end

GameMatchHallScene.onInvitationalBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kInvitationalAction2)
    StateMachine.getInstance():pushState(States.Invitational)
end

GameMatchHallScene.showNotice = function(self,msg)
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
end

GameMatchHallScene.s_cmdConfig = {
	[GameMatchHallScene.s_cmds.onGetMatchList]			    = GameMatchHallScene.onGetMatchList;
	[GameMatchHallScene.s_cmds.signUpMatchSuccess]		    = GameMatchHallScene.onSignupMatchSuccess;
	[GameMatchHallScene.s_cmds.closeMasterWnd]			    = GameMatchHallScene.onCloseMasterWnd;
	[GameMatchHallScene.s_cmds.UpdateExitMatchResult]	    = GameMatchHallScene.onUpdateExitMatchResult;
	[GameMatchHallScene.s_cmds.ShowEnterMatchDlg]		    = GameMatchHallScene.onShowEnterMatchDlg;
	[GameMatchHallScene.s_cmds.updateMatchDetail]		    = GameMatchHallScene.onUpdateMatchDetail;
    [GameMatchHallScene.s_cmds.onBroadcastPayMoney]         = GameMatchHallScene.onBroadcastPayMoney;
    [GameMatchHallScene.s_cmds.enterLoading]                = GameMatchHallScene.onEnterLoading;
    [GameMatchHallScene.s_cmds.onInvitationalMyApplyLists]  = GameMatchHallScene.onInvitationalMyApplyLists;
}

GameMatchHallScene.s_controlConfig = {
	[GameMatchHallScene.s_controls.background] 			   = {"background"},
	[GameMatchHallScene.s_controls.Button_return] 		   = {"Image_top_bg","Button_return"},

	[GameMatchHallScene.s_controls.bottomLeftView] = {"bottomLeftView"};
    [GameMatchHallScene.s_controls.View_info] = {"bottomLeftView","View_info"};
    [GameMatchHallScene.s_controls.View_head] = {"bottomLeftView","View_head"};
    [GameMatchHallScene.s_controls.Button_head] = {"bottomLeftView","View_head","Button_head"};
    [GameMatchHallScene.s_controls.Text_name] = {"bottomLeftView","View_info","Text_name"};
    [GameMatchHallScene.s_controls.Image_vip_flag] = {"bottomLeftView","View_info","Image_vip_flag"};
    [GameMatchHallScene.s_controls.Button_gold] = {"bottomLeftView","View_info","Button_gold"};
    [GameMatchHallScene.s_controls.Button_goldBar] = {"bottomLeftView","View_info","Button_goldBar"};
    [GameMatchHallScene.s_controls.Text_gold] = {"bottomLeftView","View_info","Button_gold","Text_gold"};
    [GameMatchHallScene.s_controls.Text_goldBar] = {"bottomLeftView","View_info","Button_goldBar","Text_goldBar"};

    [GameMatchHallScene.s_controls.reLoginBtn] = {"bottomLeftView", "reLoginBtn"};
    [GameMatchHallScene.s_controls.loadingView] = {"bottomLeftView", "loadingView"};
    [GameMatchHallScene.s_controls.loadingIcon] = {"bottomLeftView", "loadingView", "loadingIcon"};


    [GameMatchHallScene.s_controls.rankBtn] = {"bottomRightView", "rankBtn"};
    [GameMatchHallScene.s_controls.bagBtn] = {"bottomRightView", "bagBtn"};
    [GameMatchHallScene.s_controls.signedBtn] = {"bottomRightView", "signedBtn"};
    [GameMatchHallScene.s_controls.invitationalBtn] = {"bottomRightView", "invitationalBtn"};

    [GameMatchHallScene.s_controls.contentView]            = {"contentView"},
    [GameMatchHallScene.s_controls.Image__tittle]   = {"Image_top_bg","Image__tittle"},
    [GameMatchHallScene.s_controls.Image_bottom_bg] 		   = {"Image_bottom_bg"},
    [GameMatchHallScene.s_controls.curTime] 		   = {"curTime"},
}

GameMatchHallScene.s_controlFuncMap = {
	[GameMatchHallScene.s_controls.background]			   = GameMatchHallScene.onBackgroundTouch;
	[GameMatchHallScene.s_controls.rankBtn]                = GameMatchHallScene.onRankBtnClick;
	[GameMatchHallScene.s_controls.bagBtn]                 = GameMatchHallScene.onBagBtnClick;
	[GameMatchHallScene.s_controls.signedBtn]       	   = GameMatchHallScene.onSignedBtnClick;
	[GameMatchHallScene.s_controls.Button_return] 		   = GameMatchHallScene.onButton_returnBtnClick;
    [GameMatchHallScene.s_controls.invitationalBtn]        = GameMatchHallScene.onInvitationalBtnClick;

	[GameMatchHallScene.s_controls.Button_head]    		   = GameMatchHallScene.onUserHeadBtnClick;
	[GameMatchHallScene.s_controls.Button_gold] 		   = GameMatchHallScene.onButton_goldBtnClick;
	[GameMatchHallScene.s_controls.Button_goldBar] 		   = GameMatchHallScene.onButton_goldBarBtnClick;
}