require("isolater/common/commonController")
require("hall/common/commonJumpLogic")
require("hall/activity/data/activityDataInterface");

ActivityController = class(CommonController)

ActivityController.s_cmds = 
{
	Back = 1,
};

ActivityController.s_ActivityListTimeOut = 1;
ActivityController.s_timeOutTime = 6000;

ActivityController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;

	ActivityDataInterface.getInstance():setIsShowActivity(true);
end

ActivityController.run = function(self)
    CommonController.run(self);
end

ActivityController.stop = function(self)
	CommonController.stop(self);
	LoadingView.getInstance():hidden();
	NativeEvent.getInstance():HideLoadingDialog();
end

-- 活动需要实时获取数据
ActivityController.resume = function(self)
    Log.v("ActivityController.resume");
	CommonController.resume(self);
    self:getActivityData();
end

ActivityController.getActivityData = function (self)
    kGoodsListInterface:setObserver(self);
	ActivityDataInterface.getInstance():setObserver(self);
    --此处检测当前url是否过期
    local url = ActivityDataInterface.getInstance():getActivityUrl();
    local sessionId = kUserInfoData:getSsid();
    local s,e = string.find(url,sessionId);
    if s and e then
        --此处说明当前activity的url是可用的
	    self:updateView(ActivityScene.s_cmds.LoadWebView, true);
    else
	    self:requestActivityList();
    end
end

ActivityController.onResume = function (self)
    Log.v("ActivityController.onResume");
    CommonController.onResume(self);
    -- self:getActivityData();
end

ActivityController.pause = function(self)
	kGoodsListInterface:clearObserver(self);
	ActivityDataInterface.getInstance():clearObserver(self);
	CommonController.pause(self);
end

ActivityController.dtor = function(self)	
	LoadingView.getInstance():hidden();
	self.m_state = nil;

	delete(self.m_payLogic);
	self.m_payLogic = nil;
end

ActivityController.requestActivityList = function(self)
	LoadingView.getInstance():showText(GameString.get("ActivityQuest"));
	local w, h = self:updateView(ActivityScene.s_cmds.GetWebViewSize);
	ActivityDataInterface.getInstance():requestActivityUrl(w, h);
end

ActivityController.onGetActivityUrlCallBack = function(self, isSuccess, tipMsg, url)
	self:updateView(ActivityScene.s_cmds.LoadWebView, isSuccess, tipMsg);	
end

ActivityController.onBack = function(self)
	if NativeEvent.s_platform ~= kPlatformAndroid then 
		self:onGoBackWebView();
	else
		NativeEvent.getInstance():GoBackWebView();
	end
end

ActivityController.onGoBackWebView = function(self, status, jsonTable)
	StateMachine.getInstance():popState();
end

ActivityController.onWebviewCall = function(self, status, jsonTable, jsonStr)
	Log.v("ActivityController.onWebviewCall", "status = ", status, "jsonTable = ", jsonTable, "jsonStr = ", jsonStr);
	if table.isEmpty(jsonTable) then return; end
	
	if status and jsonTable then
		local jsonData = json.decode(jsonStr);
		if table.isEmpty(jsonData) then
			return;
		end
		local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(jsonData);
		local cmd = number.valueOf(jsonData.cmd);
		if isNeedBackToHall then
			self:onGoBackWebView();
		elseif cmd == CommonJumpCmds.START_RECHARGE then
	    	local info = jsonData.info;
	    	if not table.isEmpty(info) then
	    		self:requestRechargeList(info.price, info.number);
	    	end			
		end
	end
end

--请求获取支付列表
ActivityController.requestRechargeList = function(self, price, number)
	local sceneGoodInfo = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketGold, {scene = PayConfig.eGoodsListId.MarketGold} );
	self.m_requestPrice = price;
	self.m_requestNumber = number;
	if not table.isEmpty(sceneGoodInfo) then
		self:onGetGoodsInfoCallBack(true, sceneGoodInfo);
	end 
end

ActivityController.onGetGoodsInfoCallBack = function(self, isSuccessed, info, sendParam)
	if not isSuccessed then
		return;
	end

	local goodsList = info.goodsList;
	if table.isEmpty(goodsList) then
		return;
	end

	local price1 = number.valueOf(self.m_requestPrice);
	local number1 = number.valueOf(self.m_requestNumber);

	if price1 > 0 then
		table.sort(goodsList, function(a, b)
			-- body
			local priceA = number.valueOf(a.pamount);
			local priceB = number.valueOf(b.pamount);
			return priceA < priceB;
		end);
		for k,v in pairs(goodsList) do
			local price2 = number.valueOf(v.pamount);
			if price2 ~= 0 and price2 >= price1 then
				--此处调用支付
				self:requestRecharge(v);
				return ;
			end
		end
	end

	if number1 > 0 then
		table.sort(goodsList, function(a, b)
			-- body
			local numberA = number.valueOf(a.pchips);
			local numberB = number.valueOf(b.pchips);
			return numberA < numberB;
		end);
		for k,v in pairs(goodsList) do
			local number2 = number.valueOf(v.pchips);
			if number2 ~= 0 and number2 >= number1 then
				--此处调用支付
				self:requestRecharge(v);
				return ;
			end
		end
	end
end

ActivityController.requestRecharge = function(self, goodInfo)
	self:updateView(ActivityScene.s_cmds.DeleteActivityWebView);
	self.m_state:pushState(States.ShortCutRecharge, nil, true, PayConfig.eGoodsListId.MarketGold, nil, goodInfo);
end


ActivityController.s_nativeEventFuncMap = {
	["GoBackWebViewUrl"] 		= ActivityController.onGoBackWebView;
	["OnWebViewCall"] 			= ActivityController.onWebviewCall;
}

ActivityController.s_cmdConfig = 
{
	[ActivityController.s_cmds.Back] = ActivityController.onBack,
}