require("common/IBaseDialog")
local taskRewardLayout = require(ViewPath .. "hall/task/taskRewardLayout");
local dayTaskItem = require(ViewPath .. "hall/task/dayTaskItem");
require("util/timeOutTimer");
require("uiex/spannableText");
require("hall/task/widget/taskVipToast");
require("hall/common/commonJumpLogic")
require("hall/task/data/taskRewardDataInterface");
require("hall/task/widget/taskContinueTip");
require("hall/task/widget/taskSignupTip");
require("hall/recharge/data/rechargeDataInterface");
require("gameData/weixinShareUtil");

TaskRewardDialog = class(IBaseDialog, false);
TaskRewardDialog.s_eventTaskItemClick = EventDispatcher.getInstance():getUserEvent();

TaskRewardDialog.TAB_TASK = 1;
TaskRewardDialog.TAB_DAYREWARD = 2;

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
TaskRewardDialog.s_controls = 
{
	bg = getIndex(),
	contentArea = getIndex(),
	rewardTagBtn = getIndex(),
	textView_sign = getIndex(),
	taskTagBtn = getIndex(),
	textView_task = getIndex(),
	dayTaskDot = getIndex(),
	
	closeBtn = getIndex(),
	titleText = getIndex(),
	rewardAd = getIndex(),

	rewardArea = getIndex(),
	taskArea = getIndex(),
	
	signupView = getIndex(),
	signupDay = getIndex(),
	toBuSignupBtn = getIndex(),
	signupBtn = getIndex(),
	signupReward = getIndex(),
	signupRewardIcon = getIndex(),
	vipDoubleIcon = getIndex(),
	openVipBtn = getIndex(),
	renewVipBtn = getIndex(),

	buSignupView = getIndex(),
	calendarView = getIndex(),
	buTips = getIndex(),
	getBuBtn = getIndex(),
	returnSignBtn = getIndex(),

	signProgressFg = getIndex(),

	week_1_reward_icon = getIndex(),
	week_1_gotIcon  = getIndex(),
	week_1_reward_1  = getIndex(),
	week_1_gotIcon_get = getIndex(),

	week_2_reward_icon = getIndex(),
	week_2_gotIcon  = getIndex(),
	week_2_reward_1  = getIndex(),
	week_2_gotIcon_get = getIndex(),

	week_3_reward_icon = getIndex(),
	week_3_gotIcon  = getIndex(),
	week_3_reward_1  = getIndex(),
	week_3_gotIcon_get = getIndex(),

	week_4_reward_icon = getIndex(),
	week_4_gotIcon  = getIndex(),
	week_4_reward_1  = getIndex(),
	week_4_gotIcon_get = getIndex(),

	vip_tips_1 = getIndex(),
	vip_tips_2 = getIndex(),
	vip_tips_3 = getIndex(),
    adView = getIndex(),
};



TaskRewardDialog.s_cmds = 
{

};

TaskRewardDialog.ctor = function(self, showType)
	self.isClickGetBuBtn = nil
	System.setImageFormatPicker(function() 
		return kRGBGray; 
	end);
    super(self, taskRewardLayout, "TaskRewardDialog",997);
    System.setImageFormatPicker();
    self.m_showType = showType;
    self.m_ctrl = self.s_controls;

	self:findViewById(self.m_ctrl.bg):setEventDrag(self, self.onEmptyfunc);

	

	self.m_rewardAd = self:findViewById(self.m_ctrl.rewardAd);
	self.m_taskArea = self:findViewById(self.m_ctrl.taskArea);
	self.m_rewardArea = self:findViewById(self.m_ctrl.rewardArea);
	local signProgressFg = self:findViewById(self.m_ctrl.signProgressFg);
	local w,h = signProgressFg:getParent():getSize();
	signProgressFg:setClip(0,0,0,h);

	self:initVipTips();

	TaskRewardDataInterface.getInstance():setObserver(self);
	WeixinShareUtil.getInstance():setObserver(self);
	GoodsListInterface.getInstance():setObserver(self);
	BackpackDataInterface.getInstance():setObserver(self);
    kUserInfoData.getInstance():setObserver(self);
	EventDispatcher.getInstance():register(TaskRewardDialog.s_eventTaskItemClick, self, self.onTaskItemBtnClick);

end

TaskRewardDialog.dtor = function(self)
	self.isClickGetBuBtn = nil
	self:stopAdAnim();
	LoadingView.getInstance():hidden();
	delete(self.m_taskSigupTip);
	self.m_taskSigupTip = nil;

	TaskRewardDataInterface.getInstance():clearObserver(self);
	WeixinShareUtil.getInstance():clearObserver(self);
	GoodsListInterface.getInstance():clearObserver(self);
	BackpackDataInterface.getInstance():clearObserver(self);
    kUserInfoData.getInstance():clearObserver(self);
	ImageCache.getInstance():cleanRef(self);
	EventDispatcher.getInstance():unregister(TaskRewardDialog.s_eventTaskItemClick, self, self.onTaskItemBtnClick);

end

TaskRewardDialog.onShow = function(self)
	if self.m_showType and self.m_showType == TaskRewardDialog.TAB_TASK then
		self:onTaskTagBtnClick();
	else
		self:onRewardTagBtnClick();
	end
	self:loadAdAnim();
end

-------------------------- s_controlFuncMap 对应的方法  ---------------------------------------
TaskRewardDialog.onBgTouchEvent = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	-- 关闭每日任务
	if finger_action == kFingerDown then 
	elseif finger_action == kFingerMove then
	else
		if drawing_id_first == drawing_id_current then
			-- self:onCloseDialog();
		end
	end
end

TaskRewardDialog.onEmptyfunc = function(self)
end

TaskRewardDialog.onCloseBtnClick = function(self)
	self:onCloseDialog();
end

TaskRewardDialog.onRewardTagBtnClick = function(self)
	self:_showRewardArea();
end

TaskRewardDialog.onRewardTagBtnClickNative = function(self)
	UBReport.getInstance():report(UBConfig.kHallDayRewardTagBtn);
	self:onRewardTagBtnClick();
end

TaskRewardDialog.onTaskTagBtnClick = function(self)
	self:_showTaskArea();
end

TaskRewardDialog.onTaskTagBtnClickNative = function(self)
	UBReport.getInstance():report(UBConfig.kHallTaskTagBtn);
	self:onTaskTagBtnClick();
end

TaskRewardDialog.onRewardAdTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	
	
	if finger_action == kFingerDown then
	elseif finger_action == kFingerMove then
		
	else
		if drawing_id_first == drawing_id_current then
			UBReport.getInstance():report(UBConfig.kHallTaskAd);
			if self.m_curAdData then
				local jumpInfo = table.verify(json.decode(self.m_curAdData.jump_code));
				self:goToByJumpCode(jumpInfo);
			else
				StateMachine.getInstance():pushState(States.Hall);
			end
			self:onCloseDialog();
		end
	end
end

TaskRewardDialog.onToBuSignupBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallTaskRetroactive);
	self:_showBuSignupArea();
end 

TaskRewardDialog.onVipChargeClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallGetVipSignup);
	RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabVipId() );
	StateMachine.getInstance():pushState(States.Recharge);
	IBaseDialog.hideAll();
end

TaskRewardDialog.onGetBuBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallTaskGetSignupCard);
	local num = kPropManager:getPropNumByPropType(PropManager.propTypeMap.TYPE_BUQIANCARD);
	if num == 0 then
		local info = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketProp, { ["scene"] = PayConfig.eGoodsListId.MarketProp} );
        local itemInfo = GoodsListInterface.getInstance():getGoodsItemInfoByKV(PayConfig.eGoodsListId.MarketProp, "goods_id", GoodsListInterface.eItemId.replenishSign);
		if not table.isEmpty(info) and itemInfo then
			StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, PayConfig.eGoodsListId.MarketProp, nil, itemInfo);
		else
			self.isClickGetBuBtn = true
		end
	elseif num > 0 then
		Toast.getInstance():showText(TaskReplenishSign,50,30,kAlignLeft,"",24,200,175,110);
	end
end

TaskRewardDialog.dataUpdated = function(self)
	local num = kPropManager:getPropNumByPropType(PropManager.propTypeMap.TYPE_BUQIANCARD);
	self:findViewById(self.m_ctrl.buTips):setText(string.format("补签卡:%s张",number.valueOf(num)))
end

TaskRewardDialog.onGetGoodsInfoCallBack = function(self, isSuccess, info, sendParam)
	if self.isClickGetBuBtn then
		self.isClickGetBuBtn = false
		local itemInfo = GoodsListInterface.getInstance():getGoodsItemInfoByKV(PayConfig.eGoodsListId.MarketProp, "goods_id", GoodsListInterface.eItemId.replenishSign);
		if isSuccess and itemInfo then
			StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, PayConfig.eGoodsListId.MarketProp, nil, itemInfo);
		else
			Toast.getInstance():showText(TaskGetGoodsInfoError,50,30,kAlignLeft,"",24,200,175,110);
		end
	end
end

TaskRewardDialog.onReturnSignBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallReturnSignup);
	self:_showSignupArea();
end

--@brief 领取奖励
TaskRewardDialog.onSignupBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallTaskSignup);
	LoadingView.getInstance():showText("正在领取签到奖励...");
	self.m_isBuSignin = false;
	local serverTime = kAppData:getRightTimeWithServer();
	TaskRewardDataInterface.getInstance():requestSignin(os.date("*t", serverTime).day);
end

-----------------------------------------------------------------------------------------------------------
--微信分享回调
TaskRewardDialog.getWeiChatCallback = function(self, isSuccess, param, shareChannel)
	Log.v("TaskRewardDialog.getWeiChatCallback", " isSuccess = ", isSuccess, " param = ", param);

  	LoadingView.getInstance():hidden();
  	if isSuccess then
  		LoadingView.getInstance():showText(GameString.get("TaskWaiting"));
  		TaskRewardDataInterface.getInstance():sendDayTaskShareFlagByShareChannel(shareChannel, param.isSendToFriendsCircle);
  	end
end

TaskRewardDialog.onSendDayTaskShareFlagCallBack = function(self, isSuccess)
	if isSuccess and not table.isEmpty(self.m_curTaskFinishData) then
		TaskRewardDataInterface.getInstance():onFinishTaskSuccess(self.m_curTaskFinishData.id);
	end
end

-----------------------------------------------------------------------------------------------------------
TaskRewardDialog.onGetDayTaskListCallBack = function(self, isSuccess, data)
	LoadingView.getInstance():hidden();
	if not isSuccess or table.isEmpty(data) then
		Toast.getInstance():showText(kTextNoNetworkOrRetry,50,30,kAlginLeft,"",26,250,210,70);
	else
		table.sort(data, function(a,b)
			if a and b then -- 0:未完成 1:已完成未领奖 2:已领奖
				local aStatus = number.valueOf(a.status);
				local bStatus = number.valueOf(b.status);
				if aStatus == 1 and bStatus ~= 1 then
					return true;
				elseif aStatus ~= 1 and bStatus == 1 then
					return false;
				elseif aStatus == 2 and bStatus ~= 2 then
					return false;
				elseif aStatus ~= 2 and bStatus == 2 then
					return true;
				else
					return number.valueOf(a.sort_order) > number.valueOf(b.sort_order);
				end
			end
		end );

		if not self.m_dayTaskAdapter then
			self.m_dayTaskAdapter = new(CacheAdapter,DayTaskItem, data);
			self.m_taskArea:setAdapter(self.m_dayTaskAdapter);
		else
			self.m_dayTaskAdapter:changeData(data);
		end

		self:refreshDayTaskDot();
	end
end

TaskRewardDialog.onGetTaskRewardCallBack = function(self, isSuccess, info)
	LoadingView.getInstance():hidden();
	if not isSuccess or table.isEmpty(info) then
		Toast.getInstance():showText(kTextAwardGetFail,50,30,kAlginLeft,"",26,250,210,70);
	else
		local rewardType = number.valueOf(info.reward_type);--任务奖励类型(参见全局配置表的物品ID)
		local rewardNum = number.valueOf(info.reward);--领取的奖励
		local goodsInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(rewardType));
        local data = {};
        table.insert(data, {icon = goodsInfo.item_icon, name = goodsInfo.item_name, num = rewardNum or 0, sort = goodsInfo.sort});
        if not table.isEmpty(data) then
            GetRewardAnimManager.getInstance():play(data);
        end
        Log.d("TaskRewardDialog","param = ",param);
		self:refreshDayTaskDot();
	end	
end

-----------------------------------  以下为自己的代码 --------------------------------------------------
TaskRewardDialog.onCloseDialog = function(self)
	
	IBaseDialog.hide();
end

TaskRewardDialog._showRewardArea = function(self)
	self.m_rewardArea:setVisible(true);
	self.m_taskArea:setVisible(false);

	self:findViewById(self.m_ctrl.taskTagBtn):setEnable(true);
	
	self:findViewById(self.m_ctrl.rewardTagBtn):setEnable(false);
	
	
	self:findViewById(self.m_ctrl.titleText):setText("每日签到");
	self:refreshDayTaskDot();

	local isSignToday = TaskRewardDataInterface.getInstance():isSignToday();
	if isSignToday then
		self:_showBuSignupArea();
		return false;
	else
		self:_showSignupArea();
		return true;
	end
end

TaskRewardDialog._showTaskArea = function(self)
	self.m_rewardArea:setVisible(false);
	self.m_taskArea:setVisible(true);

	self:findViewById(self.m_ctrl.taskTagBtn):setEnable(false);
	
	self:findViewById(self.m_ctrl.rewardTagBtn):setEnable(true);
	

	self:findViewById(self.m_ctrl.titleText):setText("每日任务");
	self:refreshDayTaskDot();

	local taskList = TaskRewardDataInterface.getInstance():getDayTaskList(not self.m_forceUpdated);
	self.m_forceUpdated = true;
	if table.isEmpty(taskList) then
		LoadingView.getInstance():showText("正在加载任务列表...");
	else
		self:onGetDayTaskListCallBack(true, taskList);
	end
end

TaskRewardDialog.refreshDayTaskDot = function(self)
	local num = TaskRewardDataInterface.getInstance():getCanRewardTaskNum();
	self:findViewById(self.m_ctrl.dayTaskDot):setVisible(number.valueOf(num) > 0);	
end

TaskRewardDialog.loadAdAnim = function(self,rewardAdConfig)
	self:stopAdAnim();
	
	self.m_adConfig = TaskRewardDataInterface.getInstance():getRewardAdConfig();
	if table.isEmpty(self.m_adConfig) then
		--显示默认的
		--不再播动画
		self.m_curAdData = nil;
		self.m_rewardAd:setFile("hall/dailyReward/task_gd.png");
	else
		if not self.m_adIndex or self.m_adIndex > #self.m_adConfig then
			self.m_adIndex = 1;
		end

		local adData = self.m_adConfig[self.m_adIndex];
		if adData then
			self.m_curAdData = adData;

			ImageCache.getInstance():request(adData.icon, self, self.onRewardAdImageDownload);
			self.m_adAnim = AnimFactory.createAnimInt(kAnimNormal, 0, 1, number.valueOf(adData.sec) * 1000, -1);
			self.m_adAnim:setDebugName("AnimInt|TaskRewardDialog.loadAdAnim|m_adAnim|" .. self.m_adIndex);
			self.m_adAnim:setEvent(self, self.loadAdAnim);
			self.m_adIndex = self.m_adIndex + 1;		
		end
	end
end

TaskRewardDialog.stopAdAnim = function(self)
	delete(self.m_adAnim);
	self.m_adAnim = nil;
end

TaskRewardDialog.onRewardAdImageDownload = function(self, url, imagePath)
	if self.m_curAdData and self.m_curAdData.icon == url and imagePath then
        local adView = self:findViewById(self.m_ctrl.adView);
        if self.m_adImage then
            adView:removeChild(self.m_adImage);
            delete(self.m_adImage);
        end
        self.m_adImage = new(Mask, imagePath, "hall/dailyReward/task_mask.png");
        adView:addChild(self.m_adImage);
        self.m_adImage:setAlign(kAlignCenter);
	end
end

TaskRewardDialog.onTaskItemBtnClick = function(self,data)
	if table.isEmpty(data) then
		return;
	end

	local status = number.valueOf(data.status);-- 0:未完成 1:已完成未领奖 2:已领奖
	local taskId = number.valueOf(data.id);
	if status == 0 then
		UBReport.getInstance():report(UBConfig.kHallTaskDoing, string.format("taskId_%s", taskId or ""));
		
		--去不同的地方
		local jumpInfo = table.verify(json.decode(data.jump_code));
		local cmd = jumpInfo.cmd;
		self:goToByJumpCode(jumpInfo, taskId);

		if cmd == CommonJumpCmds.GOTO_WEIXIN_SHARE or cmd == CommonJumpCmds.GOTO_WEIXIN_INVITE then
			self.m_curTaskFinishData = data;
			return;
		end
		self:onCloseDialog();
	elseif status == 1 then
		
		UBReport.getInstance():report(UBConfig.kHallTaskDone, string.format("taskId_%s", taskId or ""));

		--领奖
		self.m_curTaskGetRewardData = data;
		TaskRewardDataInterface.getInstance():requestGetTaskReward(taskId);
		LoadingView.getInstance():showText("正在领取任务奖励...");
	elseif status == 2 then
		--已经领奖
	else

	end
end

TaskRewardDialog.goToByJumpCode = function(self, jumpInfo, taskId)
	CommonJumpLogic.getInstance():executeJsCall(jumpInfo);
end

TaskRewardDialog._showSignupArea = function(self)
	self:_checkVip();
	self:findViewById(self.m_ctrl.buSignupView):setVisible(false);
	self:findViewById(self.m_ctrl.signupView):setVisible(true);


	local todayInfo = TaskRewardDataInterface.getInstance():getTodaySigninInfos();
	if table.isEmpty(todayInfo) then
		self:findViewById(self.m_ctrl.signupReward):setText("正在加载中...");
		LoadingView.getInstance():showText("正在加载中...");
	else
		local continueInfos = TaskRewardDataInterface.getInstance():getContinueInfos();
		self:_refreshSignupArea(todayInfo,continueInfos);
	end
end 

TaskRewardDialog.refreshUserIdentity = function (self, curIdentity, lastIdentity)
    self:_checkVip();
end

TaskRewardDialog._checkVip = function(self)
	local isVip = kUserInfoData:getIsVip();
	self:findViewById(self.m_ctrl.openVipBtn):setVisible(not isVip);
	self:findViewById(self.m_ctrl.renewVipBtn):setVisible(isVip);
	self:findViewById(self.m_ctrl.vipDoubleIcon):setVisible(isVip);
end

TaskRewardDialog._showBuSignupArea = function(self)
	self:findViewById(self.m_ctrl.buSignupView):setVisible(true);
	self:findViewById(self.m_ctrl.signupView):setVisible(false);

	local num = kPropManager:getPropNumByPropType(PropManager.propTypeMap.TYPE_BUQIANCARD);
	self:findViewById(self.m_ctrl.buTips):setText(string.format("补签卡:%s张",number.valueOf(num)));

	local signinCalendarInfo, continueSigninInfo = TaskRewardDataInterface.getInstance():getSigninCalendarInfo();
	if signinCalendarInfo then
		self:updateSiginCalendar(signinCalendarInfo, continueSigninInfo);
	else
		LoadingView.getInstance():showText("正在加载中...");
	end
end 

TaskRewardDialog._refreshSignupArea = function(self,todayInfos,continueInfos)
	local signupBtn = self:findViewById(self.m_ctrl.signupBtn);
	local signupBtnName = self:findViewById(self.m_ctrl.signupReward);
	self:findViewById(self.m_ctrl.signupDay):setText(todayInfos.continueDays or 0);

	local config = table.verify(todayInfos.config);
	local icon = config.icon or "";
	ImageCache.getInstance():request(icon,self,self.onUpdateSignupRewardIcon);
	local rewardType = number.valueOf(config.type);
        
    local rewardTypeName = "道具奖励";
    if rewardType == 0 then 
    	rewardTypeName = "银币";
    elseif rewardType == 2 then 
    	rewardTypeName = "钻石";
    else
    	rewardTypeName = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(rewardType)).item_name or rewardTypeName;
    end 

	if todayInfos.isSignToday then
        signupBtn:setEnable(false);
    	signupBtnName:setText("已领取签到奖励");       
	else
        local num = number.valueOf(config.num);       
        signupBtn:setEnable(true);
        signupBtnName:setText(string.format("签到领取%s%s",num,rewardTypeName));
	end

	self:_refreshSigninProgress(continueInfos);	
end

TaskRewardDialog.onUpdateSignupRewardIcon = function(self,url,imagePath)
	if imagePath then 
		self:findViewById(self.m_ctrl.signupRewardIcon):setFile(imagePath);
	end 
end

TaskRewardDialog.onGetSigninInfosCallBack = function(self,isSuccess,todaySigninInfos,tomorrowSigninConfig,continueSigninInfo,rewardAdConfig)
	LoadingView.getInstance():hidden();
	
	if not isSuccess then 
		Toast.getInstance():showText("签到数据刷新失败！",50,30,kAlginLeft,"",26,250,210,70);
		self:findViewById(self.m_ctrl.signupBtn):setEnable(false);
        self:findViewById(self.m_ctrl.signupReward):setText("拉取失败");
	else 
		self:_refreshSignupArea(todaySigninInfos,continueSigninInfo);
		--此处播放广告
		self:loadAdAnim(rewardAdConfig);
	end 
end

TaskRewardDialog.onGetSigninCalendarCallBack = function(self,isSuccess,signinCalendarInfo,continueSigninInfo)
	LoadingView.getInstance():hidden();
	if isSuccess then
		self:updateSiginCalendar(signinCalendarInfo, continueSigninInfo);
	else
		Toast.getInstance():showText("获取失败，请稍后重试",50,30,kAlginLeft,"",26,250,210,70); 
	end 
end

TaskRewardDialog.updateSiginCalendar = function(self, signinCalendarInfo, continueSigninInfo)
	if not self.m_signinCalendarAdapter then 
		local calendarView = self:findViewById(self.m_ctrl.calendarView);
		local w,h = calendarView:getSize();
		local signinCalendar = UIFactory.createGridView(0,0,w,h); 
		self.m_signinCalendarAdapter = UIFactory.createCacheAdapter(DayCalendarItem,signinCalendarInfo);
		signinCalendar:setAdapter(self.m_signinCalendarAdapter);
		calendarView:addChild(signinCalendar);
		signinCalendar:setOnItemClick(self,self.onCalendarItemClick);
	else
		self.m_signinCalendarAdapter:changeData(signinCalendarInfo);
	end 

	self:_refreshSigninProgress(continueSigninInfo);
end

TaskRewardDialog.onSigninCallBack = function(self,isSuccess,info)
	Log.v("TaskRewardDialogTaskRewardDialog callback", info);

	LoadingView.getInstance():hidden();
	info = table.verify(info);
	if isSuccess then
		local toastArray = {};
        local isGold = true;
        local _imagePath = nil;
		for k,v in pairs(table.verify(info.daily)) do
			if v.type == 0 then
				for i = 1, v.ratio do
					table.insert(toastArray, string.format("您已经成功领取%s银币!",v.award or ""));
				end	
			elseif v.type == 1 then
				local name = "金条";
				for i = 1, v.ratio do
					table.insert(toastArray, string.format("您已经成功领取%s%s!", v.award or "", name));
				end
			elseif v.type == 2 then
				for i = 1, v.ratio do
					table.insert(toastArray, string.format("您已经成功领取%s钻石!",v.award or ""));
				end	
			else
                isGold = false;
				local name = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(v.type)).item_name or "奖励";
                _imagePath = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(v.type)).item_icon;
				for i = 1, v.ratio do
					table.insert(toastArray, string.format("您已经成功领取%s！",name));
				end
			end
		end
		TaskVipToast.showToast(toastArray);

		--显示额外奖励
		if not table.isEmpty(info.continue) then			 	
            local data = {};
			for i = 1,#info.continue do
                local temp = info.continue[i];
                local param = {};
                local goodsInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(temp.type));
                param.icon = goodsInfo.item_icon;
                param.sort = goodsInfo.sort;
                param.name = goodsInfo.item_name;
                param.num = tonumber(temp.award)*tonumber(temp.ratio or 1);
                table.insert(data,param);
			end
            if not table.isEmpty(data) then
                TaskVipToast.hide();
                GetRewardAnimManager.getInstance():play(data);
            end
		end

		if self.m_isBuSignin then 
			local num = kPropManager:getPropNumByPropType(PropManager.propTypeMap.TYPE_BUQIANCARD);
			kPropManager:updatePropNum(PropManager.propTypeMap.TYPE_BUQIANCARD, num-1);
			self:_showBuSignupArea();
		else 
			self:_showSignupArea();
		end
		self:onRewardTagBtnClick();

        if isGold then
		    AnimManager.getInstance():playAnim(AnimIds.MoneyDropPar, 100);
        elseif _imagePath then
            ImageCache.getInstance():request(_imagePath, self, self.getImageAndPlayAin);
        end
	else 
		local errType = number.valueOf(info.errorType,2);
		local msg = kTextSignFail;
		if errType == -1 then
			msg = kTextSignFail;
		elseif errType == 1 then
			msg = kTextSigned;
		elseif errType == 2 then
			msg = kTextSignFail;
		elseif errType == 3 then
			msg = "补签卡不足，请稍后重试！";
		elseif errType == 4 then
			msg = kTextRetroactivePastDue;
		elseif errType == 5 then
			msg = "补签卡每日仅限使用1张！";
		end 
		Toast.getInstance():showText(msg,50,30,kAlginLeft,"",26,250,210,70);
	end 
end 

TaskRewardDialog.getImageAndPlayAin = function(self, url, imagePath)
    if not string.isEmpty(imagePath) then
		--播放飞向背包的动画
        
        local _class = require("hall/animation/animBackpack");
        local _param = {image = imagePath};
        local ani = new(_class,_param);
        ani:play();
	end
end

TaskRewardDialog.onCalendarItemClick = function(self,adapter,view,index,viewX,viewY)
	local data = view:getData();
	if data.day ~= 0 and data.state == 2 then --补签
		if not TaskRewardDataInterface.getInstance():canUseCardToday() then 
			Toast.getInstance():showText("补签卡每日仅限使用1张!",50,30,kAlginLeft,"",26,250,210,70);
			return ;
		end
		UBReport.getInstance():report(UBConfig.kHallSignupDate);
		if self.m_taskSigupTip then
			delete(self.m_taskSigupTip);
		end
		TaskSignupTip.setOnGoRecharge(TaskSignupTip,self,self.onGetBuBtnClick);
		TaskSignupTip.setOnSignReward(TaskSignupTip,self,self.onBuSignin);

		local buSignupCard = kPropManager:getPropNumByPropType(PropManager.propTypeMap.TYPE_BUQIANCARD);
		if number.valueOf(buSignupCard) == 0 then
			self.m_taskSigupTip = new(TaskSignupTip,1,data);
		else 
			self.m_taskSigupTip = new(TaskSignupTip,0,data);
		end
	end 
end

TaskRewardDialog.onBuSignin = function(self,day)
	self.m_isBuSignin = true;
	TaskRewardDataInterface.getInstance():requestSignin(day, self.m_isBuSignin);
end

TaskRewardDialog._refreshSigninProgress = function(self,continueInfos)
	local config = table.verify(continueInfos.config);
	local record = table.verify(continueInfos.record);
	local progress = continueInfos.progress or 0;

	local signProgressFg = self:findViewById(self.m_ctrl.signProgressFg);
	local w,h = signProgressFg:getParent():getSize();
	signProgressFg:setClip(0,0,w*progress,h);


	for k,v in pairs(config) do
		if type(v) == "table" then 
			if tonumber(v.day) == 7 then
				local reward = string.concat("x",number.valueOf(v.num,1));
				self:findViewById(self.m_ctrl.week_1_reward_1):setText(reward); --奖励
				ImageCache.getInstance():request(v.icon or "",{self,1},self.onUpdateContinueRewardIcon);
			elseif tonumber(v.day)== 14 then
				local reward = string.concat("x",number.valueOf(v.num,1));
				self:findViewById(self.m_ctrl.week_2_reward_1):setText(reward); --奖励
				ImageCache.getInstance():request(v.icon or "",{self,2},self.onUpdateContinueRewardIcon);
			elseif tonumber(v.day)== 21 then
				local reward = string.concat("x",number.valueOf(v.num,1));
				self:findViewById(self.m_ctrl.week_3_reward_1):setText(reward); --奖励
				ImageCache.getInstance():request(v.icon or "",{self,3},self.onUpdateContinueRewardIcon);
			elseif tonumber(v.day)== 0 then
				local reward = string.concat("x",number.valueOf(v.num,1));
				self:findViewById(self.m_ctrl.week_4_reward_1):setText(reward); --奖励
				ImageCache.getInstance():request(v.icon or "",{self,4},self.onUpdateContinueRewardIcon);
			end
		end 
	end

	local gotIcon1 = self:findViewById(self.m_ctrl.week_1_gotIcon);
	local gotIcon2 = self:findViewById(self.m_ctrl.week_2_gotIcon);
	local gotIcon3 = self:findViewById(self.m_ctrl.week_3_gotIcon);
	local gotIcon4 = self:findViewById(self.m_ctrl.week_4_gotIcon);
	for k,v in pairs(record) do
		if tonumber(k) == 7 then
			if tonumber(v) == 1 then
				gotIcon1:setVisible(true);
			end
		end
		if tonumber(k) == 14 then
			if tonumber(v) == 1 then
				gotIcon1:setVisible(true);
				gotIcon2:setVisible(true);
			end
		end
		if tonumber(k) == 21 then
			if tonumber(v) == 1 then
				gotIcon1:setVisible(true);
				gotIcon2:setVisible(true);
				gotIcon3:setVisible(true);
			end
		end
		if tonumber(k) == 0 then
			if tonumber(v) == 1 then
				gotIcon1:setVisible(true);
				gotIcon2:setVisible(true);
				gotIcon3:setVisible(true);
				gotIcon4:setVisible(true);
			end
		end
	end
end

TaskRewardDialog.onUpdateContinueRewardIcon = function(arg,url,imagePath)
	if imagePath then 
		local self = arg[1];
		local index = arg[2];
		local img = self:findViewById(self.m_ctrl[string.format("week_%s_reward_icon",index)]);
		local imgGet = self:findViewById(self.m_ctrl[string.format("week_%s_gotIcon_get",index)]);
		if img then 
			img:setFile(imagePath);
		end 

		if imgGet then
			imgGet:setFile(imagePath);
			imgGet:setGray(true);
		end
	end 
end

TaskRewardDialog.initVipTips = function(self)
	local tips_1 = self:findViewById(self.m_ctrl.vip_tips_1);
	local tips_2 = self:findViewById(self.m_ctrl.vip_tips_2);
	local tips_3 = self:findViewById(self.m_ctrl.vip_tips_3);

	tips_1:setText("VIP用户", 1);
	tips_2:setText("每日签到即可获得", 1);
	tips_3:setText("翻倍奖励", 1);

	local width_tips_1, _ = tips_1:getSize();
	local width_tips_2, _ = tips_2:getSize();
	tips_2:setPos(width_tips_1, 0);
	tips_3:setPos(width_tips_1 + width_tips_2, 0);

    self:findViewById(self.m_ctrl.textView_task):setPickable(false);
    self:findViewById(self.m_ctrl.textView_sign):setPickable(false);
end

TaskRewardDialog.s_controlConfig = 
{
	[TaskRewardDialog.s_controls.bg] = {"bg"};
	[TaskRewardDialog.s_controls.contentArea] = {"content"};
	[TaskRewardDialog.s_controls.rewardTagBtn] 		= {"content","dayRewardTagBtn"};
    [TaskRewardDialog.s_controls.textView_sign] 		= {"content","dayRewardTagBtn","TextView_sign"};
	
	[TaskRewardDialog.s_controls.taskTagBtn] 		= {"content","dayTaskTagBtn"};
	[TaskRewardDialog.s_controls.textView_task] 		= {"content","dayTaskTagBtn","TextView_task"};

	[TaskRewardDialog.s_controls.dayTaskDot] 		= {"content","dayTaskTagBtn","taskDot"};
	[TaskRewardDialog.s_controls.closeBtn] 		= {"content","closeBtn"};
	[TaskRewardDialog.s_controls.titleText] 	= {"content","titleImg","titleText"};
	[TaskRewardDialog.s_controls.rewardAd] 		= {"content","adView","rewardAd"};

	[TaskRewardDialog.s_controls.rewardArea] 	= {"content","dayRewardView"};
	[TaskRewardDialog.s_controls.taskArea] 		= {"content","dayTaskListView"};
    [TaskRewardDialog.s_controls.adView]        = {"content","adView"};
	[TaskRewardDialog.s_controls.signupView] 	= {"content","dayRewardView","signupView"};
	[TaskRewardDialog.s_controls.signupDay] 	= {"content","dayRewardView","signupView","topView","dayNumBg","signupTips2"};
	[TaskRewardDialog.s_controls.toBuSignupBtn] = {"content","dayRewardView","signupView","topView","buSignupBtn"};
	[TaskRewardDialog.s_controls.signupBtn] 	= {"content","dayRewardView","signupView","signupBtn"};
	[TaskRewardDialog.s_controls.signupReward] 	= {"content","dayRewardView","signupView","signupBtn","name"};
	[TaskRewardDialog.s_controls.signupRewardIcon] 	= {"content","dayRewardView","signupView","signupBtn","rewardIcon"};
	[TaskRewardDialog.s_controls.vipDoubleIcon] = {"content","dayRewardView","signupView","signupBtn","vipIcon"};
	[TaskRewardDialog.s_controls.openVipBtn] 	= {"content","dayRewardView","signupView","bottomView","openVip"};
	[TaskRewardDialog.s_controls.renewVipBtn] 	= {"content","dayRewardView","signupView","bottomView","renewVip"};

	[TaskRewardDialog.s_controls.buSignupView] 	= {"content","dayRewardView","buSignupView"};
	[TaskRewardDialog.s_controls.calendarView] 	= {"content","dayRewardView","buSignupView","calendarView"};
	[TaskRewardDialog.s_controls.buTips] 		= {"content","dayRewardView","buSignupView","buSignup","buSignupNum"};
	[TaskRewardDialog.s_controls.getBuBtn] 		= {"content","dayRewardView","buSignupView","buSignup","getBuBtn"};
	[TaskRewardDialog.s_controls.returnSignBtn] = {"content","dayRewardView","buSignupView","buSignup","returnBtn"};

	[TaskRewardDialog.s_controls.signProgressFg] 	= {"content","dayRewardView","progressView","progress","fg"};

	[TaskRewardDialog.s_controls.week_1_reward_icon]   = {"content","dayRewardView","progressView","rewardView","first","icon"};
	[TaskRewardDialog.s_controls.week_1_gotIcon]   = {"content","dayRewardView","progressView","rewardView","first","gotView"};
	[TaskRewardDialog.s_controls.week_1_reward_1]   = {"content","dayRewardView","progressView","rewardView","first","bg","reward"};
	[TaskRewardDialog.s_controls.week_1_gotIcon_get]   = {"content","dayRewardView","progressView","rewardView","first","gotView","icon_get"};

	[TaskRewardDialog.s_controls.week_2_reward_icon]   = {"content","dayRewardView","progressView","rewardView","second","icon"};
	[TaskRewardDialog.s_controls.week_2_gotIcon]   = {"content","dayRewardView","progressView","rewardView","second","gotView"};
	[TaskRewardDialog.s_controls.week_2_reward_1]   = {"content","dayRewardView","progressView","rewardView","second","bg","reward"};
	[TaskRewardDialog.s_controls.week_2_gotIcon_get]   = {"content","dayRewardView","progressView","rewardView","second","gotView","icon_get"};

	[TaskRewardDialog.s_controls.week_3_reward_icon]   = {"content","dayRewardView","progressView","rewardView","third","icon"};
	[TaskRewardDialog.s_controls.week_3_gotIcon]   = {"content","dayRewardView","progressView","rewardView","third","gotView"};
	[TaskRewardDialog.s_controls.week_3_reward_1]   = {"content","dayRewardView","progressView","rewardView","third","bg","reward"};
	[TaskRewardDialog.s_controls.week_3_gotIcon_get]   = {"content","dayRewardView","progressView","rewardView","third","gotView","icon_get"};

	[TaskRewardDialog.s_controls.week_4_reward_icon]   = {"content","dayRewardView","progressView","rewardView","fourth","icon"};
	[TaskRewardDialog.s_controls.week_4_gotIcon]   = {"content","dayRewardView","progressView","rewardView","fourth","gotView"};
	[TaskRewardDialog.s_controls.week_4_reward_1]   = {"content","dayRewardView","progressView","rewardView","fourth","bg","reward"};
	[TaskRewardDialog.s_controls.week_4_gotIcon_get]   = {"content","dayRewardView","progressView","rewardView","fourth","gotView","icon_get"};
	[TaskRewardDialog.s_controls.vip_tips_1]   = {"content","dayRewardView","signupView","bottomView","tips","vipTips1"};
	[TaskRewardDialog.s_controls.vip_tips_2]   = {"content","dayRewardView","signupView","bottomView","tips","vipTips2"};
	[TaskRewardDialog.s_controls.vip_tips_3]   = {"content","dayRewardView","signupView","bottomView","tips","vipTips3"};
};

TaskRewardDialog.s_controlFuncMap = 
{
	[TaskRewardDialog.s_controls.bg] = TaskRewardDialog.onBgTouchEvent;
	[TaskRewardDialog.s_controls.contentArea] = TaskRewardDialog.onEmptyfunc;
	[TaskRewardDialog.s_controls.closeBtn] = TaskRewardDialog.onCloseBtnClick;
	[TaskRewardDialog.s_controls.rewardTagBtn] = TaskRewardDialog.onRewardTagBtnClickNative;
	[TaskRewardDialog.s_controls.taskTagBtn] = TaskRewardDialog.onTaskTagBtnClickNative;
	[TaskRewardDialog.s_controls.rewardAd] 		= TaskRewardDialog.onRewardAdTouch; 
	
	[TaskRewardDialog.s_controls.openVipBtn] = TaskRewardDialog.onVipChargeClick;
	[TaskRewardDialog.s_controls.renewVipBtn] = TaskRewardDialog.onVipChargeClick;

	[TaskRewardDialog.s_controls.signupBtn] = TaskRewardDialog.onSignupBtnClick;
	[TaskRewardDialog.s_controls.toBuSignupBtn] = TaskRewardDialog.onToBuSignupBtnClick;

	[TaskRewardDialog.s_controls.getBuBtn] = TaskRewardDialog.onGetBuBtnClick;
	[TaskRewardDialog.s_controls.returnSignBtn] = TaskRewardDialog.onReturnSignBtnClick;
};


-------------------------- 每日签到的日历的item ---------------------------------------
local dayCalendarItem = require(ViewPath .. "hall/task/dayCalendarItem");
require("ui/node");

DayCalendarItem = class(Node);

DayCalendarItem.iconPos = nil;      --记录被领取物品icon的位置
DayCalendarItem.imagePath = nil;    --记录被领取物品icon的imagePaht

DayCalendarItem.ctor = function(self,data)
	self.m_view = SceneLoader.load(dayCalendarItem);
	self:setSize(self.m_view:getSize());
	self:addChild(self.m_view);

	data = table.verify(data);
	self.m_data = data;

	local day = self.m_view:getChildByName("day");
	local bu = self.m_view:getChildByName("bu");
	local signed = self.m_view:getChildByName("signed");

	day:setText(data.day or "");
	bu:setVisible(data.state == 2);--补签
	signed:setVisible(data.state == 1); --已签到
	day:setVisible(data.day ~= 0 and data.state == 0);
end 

DayCalendarItem.getData = function(self)
	return self.m_data;
end 
-------------------------- 每日任务的item ---------------------------------------
local crystal_pin_map = require("qnFiles/qnPlist/hall/crystal_pin");
DayTaskItem = class(Node);

DayTaskItem.goodsMap = {
	[1] = { id = 0, name = "银币" },
	[2] = { id = 2, name = "钻石" },
	[3] = { id = 3, name = "月饼兑换券" },
	[4] = { id = 4, name = "VIP体验卡" },
};

DayTaskItem.ctor = function(self, data)
	self.m_view = SceneLoader.load(dayTaskItem);
	self:setSize(self.m_view:getSize());
	self:addChild(self.m_view);
	self.m_data = data;
	self.m_bg = self.m_view:getChildByName("bg");
	self.m_iconImg = self.m_bg:getChildByName("taskIcon");
	self.m_titleText = self.m_bg:getChildByName("taskName");
	self.m_rewardIcon = self.m_bg:getChildByName("rewardArea"):getChildByName("Image2");
	self.m_rewardView = self.m_bg:getChildByName("rewardArea"):getChildByName("rewardNum");
	self.m_rewardBtn = self.m_bg:getChildByName("btn");
	self.m_progressText = self.m_bg:getChildByName("progress");

    self.isGold = false;

    if not self.m_moneyItem then
        self.m_moneyItem = new(UserMoneyItem);
        self.m_rewardView:addChild(self.m_moneyItem);
    end
    self.m_moneyItem:setMoneyNum(data.reward, 0.75);
    self.m_moneyItem:setVisible(true);

	local rewardType = number.valueOf(data.reward_type);
    if rewardType == 0 or  rewardType == 1 or  rewardType == 2 then
        self.isGold = true;
    end


	local goodsInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeId(rewardType);
    if not table.isEmpty(goodsInfo) then
        ImageCache.getInstance():request(goodsInfo.item_icon, self, self.onImageDownloadedReward);
    end

	self.m_titleText:setText(data.name or "");
	self.m_iconImg:setFile("hall/activity/activity_gift_icon.png");
	self.m_progressText:setText(data.progress or "")
	ImageCache.getInstance():request(data.icon,self, self.onImageDownloaded);

	self.m_rewardBtn:setOnClick(self, self.onRewardBtnClick);
	local status = number.valueOf(data.status);-- 0:未完成 1:已完成未领奖 2:已领奖
	if status == 0 then
		self.m_rewardBtn:getChildByName("doTask"):setText("做任务");
		self.m_rewardBtn:setFile("hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png");
	elseif status == 1 then
		self.m_rewardBtn:getChildByName("doTask"):setText("领奖励");
		self.m_rewardBtn:setFile("hall/common/btns/btn_orange_164x89_l25_r25_t25_b25.png");
	elseif status == 2 then
		self.m_rewardBtn:getChildByName("doTask"):setText("已领取");
		self.m_rewardBtn:setFile("hall/common/btns/btn_gray_163x89_l25_r25_t25_b25.png");
		self.m_rewardBtn:setPickable(false);
	end
end

DayTaskItem.onImageDownloaded = function(self, url, imagePath)
	if self.m_data.icon == url and imagePath then
		self.m_iconImg:setFile(imagePath);
	end
end

DayTaskItem.onImageDownloadedReward = function(self, url, imagePath)
	if not string.isEmpty(imagePath) then
		self.m_rewardIcon:setFile(imagePath);
	end
    self.m_imagePath = imagePath;
end

DayTaskItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end

DayTaskItem.onRewardBtnClick = function(self)
    local _x,_y = self.m_iconImg:getAbsolutePos();
    DayTaskItem.iconPos = {x=_x,y=_y };
    DayTaskItem.imagePath = self.m_imagePath;
    DayTaskItem.isGold = self.isGold;
	EventDispatcher.getInstance():dispatch(TaskRewardDialog.s_eventTaskItemClick, self.m_data);
end

