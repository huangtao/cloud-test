require("isolater/common/commonController");
require("hall/onlineSocket/onlineSocketManager");
require("ui/toast");
require("hall/recharge/data/rechargeDataInterface");
require("hall/recharge/data/vipDataInterface");


RechargeController = class(CommonController);

RechargeController.s_requestRechargeTimeOut = 1;
RechargeController.s_requestOrderNumTimeOut = 2;
RechargeController.s_requestDataFailed = 3;

RechargeController.s_cmds = 
{	
	GoBack = -1,
	RequestPay = -2,
	RequestVipGoods = 1,
	RequestCrystalGoods = 2,
	RequestMoneyGoods = 3,
	RequestPropGoods = 4,
};

RechargeController.Delegate = 
{
	onMorePayment = "onMorePayment",
}

RechargeController.s_pay = EventDispatcher.getInstance():getUserEvent();

RechargeController.ctor = function(self, state, viewClass, viewConfig)
	EventDispatcher.getInstance():register(RechargeController.s_pay, self, self.onRequestPay); 
	self:requestBottomAd();
	self:requestTabsAd();
	self:requestVippropsData();

	RechargeDataInterface.getInstance():setObserver(self);
end

RechargeController.resume = function(self)
	CommonController.resume(self);

	require("hall/floatBall/data/floatBallDataInterface");
	FloatBallDataInterface:getInstance():setSceneName("shop");


	kGoodsListInterface:setObserver(self);
	VipDataInterface.getInstance():setObserver(self);

	self:requestTabsConfig();
end

RechargeController.pause = function(self)
	kGoodsListInterface:clearObserver(self);
	VipDataInterface.getInstance():setObserver(self);

	CommonController.pause(self);
end

RechargeController.dtor = function(self)
	LoadingView.getInstance():hidden();
    self:clearTimeoutTimer();
    EventDispatcher.getInstance():unregister(RechargeController.s_pay, self, self.onRequestPay); 

    RechargeDataInterface.getInstance():clearObserver(self);
end

--@override
RechargeController.onBackPressed = function(self)
	CommonController.onBackPressed(self);
end

RechargeController.requestBottomAd = function(self)
	RechargeDataInterface.getInstance():requestBottomVipAd();
end

RechargeController.onGetBottomVipAdCallBack = function(self, info)
	self:updateView(RechargeScene.s_cmds.updateBottomAd, info);
end

--打开统一支付
RechargeController.onRequestPay = function(self, sceneid, data)
	self.m_state:pushState(States.ShortCutRecharge, nil, true, sceneid, nil, data);
end

RechargeController.requestTabsConfig = function(self)
	local tabs = RechargeDataInterface.getInstance():getTabsConfig();
	if not table.isEmpty(tabs) then
		self:updateView(RechargeScene.s_cmds.UpdateTabs, tabs);
	end
end

RechargeController.onGetRechargeTabsCallBack = function(self, isSuccessed, tabsConfig, sendParam)
	if isSuccessed and not table.isEmpty(tabsConfig) then
		self:updateView(RechargeScene.s_cmds.UpdateTabs, tabsConfig);
	end
end
-----------------------------支付商品请求------------------------------
--请求获取支付列表
RechargeController.requestRechargeList = function(self)
	local data = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketGold,  { ["scene"] = PayConfig.eGoodsListId.MarketGold} );

	if not table.isEmpty(data.goodsList) then
		self:updateView(RechargeScene.s_cmds.UpdateChargeList, data);
	else
		self:showNotice();
		self:startRequestTimer(RechargeController.s_requestRechargeTimeOut);
	end
end

--@brief 请求vip商品列表
RechargeController.onRequestVipGoods = function(self)
	local data = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketVip, { ["scene"] = PayConfig.eGoodsListId.MarketVip} );

	if not table.isEmpty(data.goodsList) then
		self:updateView(RechargeScene.s_cmds.updateVipGoods, data);
	else
		self:showNotice();
		self:startRequestTimer(RechargeController.s_requestRechargeTimeOut);
	end

	self:requestVippropsData();
end

--@brief 请求促销商品
RechargeController.onRequestCrystalGoods = function(self)
	local data = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketCrystal, { ["scene"] = PayConfig.eGoodsListId.MarketCrystal} );

	if not table.isEmpty(data.goodsList) then
		self:updateView(RechargeScene.s_cmds.updateCrystalGoods, data);
	else
		self:showNotice();
		self:startRequestTimer(RechargeController.s_requestRechargeTimeOut);
	end
end

--@brief 请求道具商品
RechargeController.onRequestPropGoods = function(self)
	local data = kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketProp, { ["scene"] = PayConfig.eGoodsListId.MarketProp} );

	if not table.isEmpty(data.goodsList) then
		self:updateView(RechargeScene.s_cmds.updatePropGoods, data);
	else
		self:showNotice();
		self:startRequestTimer(RechargeController.s_requestRechargeTimeOut);
	end	
end

RechargeController.onGetGoodsInfoCallBack = function(self, isSuccessed, data, sendParam)
	LoadingView.getInstance():hidden();
	self:clearTimeoutTimer();
	if self.m_requestRechargeTimeout then
		self.m_requestRechargeTimeout = false;
		return;
	end

	if not isSuccessed then
		self:requestRechargeListFailed();
	else 
		if table.isEmpty(data.goodsList) then
			self:requestRechargeListFailed();
		else
			if data.scene == PayConfig.eGoodsListId.MarketGold then
				self:updateView(RechargeScene.s_cmds.UpdateChargeList, data);

			elseif data.scene == PayConfig.eGoodsListId.MarketVip then
				self:updateView(RechargeScene.s_cmds.updateVipGoods, data);

			elseif data.scene == PayConfig.eGoodsListId.MarketCrystal then
				self:updateView(RechargeScene.s_cmds.updateCrystalGoods, data);

			elseif data.scene == PayConfig.eGoodsListId.MarketProp then

				self:updateView(RechargeScene.s_cmds.updatePropGoods, data);
			end
		end
	end
end

--请求vip特权
RechargeController.requestVippropsData = function(self)
	local vipProps = VipDataInterface.getInstance():getVipPropsList();
	if #vipProps > 0 then
		self:updateView(RechargeScene.s_cmds.updateVipprops, vipProps);
	end
end

--@brief vip特权回调
RechargeController.onGetVipPropsListCallBack = function(self, isSuccess, vipProps)
	if isSuccess and #vipProps > 0 then
		self:updateView(RechargeScene.s_cmds.updateVipprops, vipProps);
	end
end

RechargeController.requestTabsAd = function(self)
	RechargeDataInterface.getInstance():requestRechargeTabsAd();
end

RechargeController.onGetRechargeTabsAdCallBack = function(self)
	self:updateView(RechargeScene.s_cmds.updateTopAd);
end

RechargeController.showNotice = function(self)
	LoadingView.getInstance():showText(GameString.get("requestRechargeListTips"));
end

RechargeController.requestRechargeListFailed = function(self)
	self:updateView(RechargeScene.s_cmds.RequestTimeOut,RechargeController.s_requestRechargeTimeOut);
end

--@delegate
RechargeController.onBroadcastPayMoney = function(self)
	Log.v("RechargeController.onBroadcastPayMoney");
	--刷新商品数据，防止首冲、二冲这些特权！
    kGoodsListInterface:resetGoodsListUpdateFlag();
	kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketGold,  { ["scene"] = PayConfig.eGoodsListId.MarketGold} );
	kGoodsListInterface:getSceneGoodsInfo(PayConfig.eGoodsListId.MarketCrystal, { ["scene"] = PayConfig.eGoodsListId.MarketCrystal} );
end

RechargeController.onGetCrystalBuyGoodsCallBack = function(self, isSuccess, msg)
	if isSuccess then
		self:onBroadcastPayMoney();
	end
end

RechargeController.rechargeReport = function(self,actionID)
	--self:ubReport(actionID);
end

RechargeController.onGoBack = function(self,closeName)
	if closeName == "closeBrokeAllowanceWnd" then
		
	end
	self:onBackPressed();
end
---------------------------------------------------------
RechargeController.startRequestTimer = function(self,timeOutType)
    self:clearTimeoutTimer();
	self.m_timeOut = AnimFactory.createAnimInt(kAnimNormal,0,1,10000,-1);
	self.m_timeOut:setDebugName("AnimInt|RechargeController.startRequestTimer|m_timeOut");
	self.m_timeOutType = timeOutType; --FIXME 这个有用到？
	self.m_timeOut:setEvent(self,self.onRequestTimeOut);
end

RechargeController.clearTimeoutTimer = function(self)
	delete(self.m_timeOut);
	self.m_timeOut = nil;
end

RechargeController.onRequestTimeOut = function(self)
	LoadingView.getInstance():hidden();
	self:clearTimeoutTimer();
	self.m_requestRechargeTimeout = true;
	self:updateView(RechargeScene.s_cmds.RequestTimeOut,self.m_timeOutType);
end

RechargeController.execDelegate = function ( self,func,... )
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate,self,...);
    end
end
------------------------------------- 命令响应函数配置 ------------------------
RechargeController.s_cmdConfig = 
{
	[RechargeController.s_cmds.RequestPay] 		= RechargeController.onRequestPay,
	[RechargeController.s_cmds.GoBack] 			= RechargeController.onGoBack,
	[RechargeController.s_cmds.RequestVipGoods]	= RechargeController.onRequestVipGoods;
	[RechargeController.s_cmds.RequestCrystalGoods]	= RechargeController.onRequestCrystalGoods;
	[RechargeController.s_cmds.RequestMoneyGoods] = RechargeController.requestRechargeList;
	[RechargeController.s_cmds.RequestPropGoods] = RechargeController.onRequestPropGoods;
}

----广播
kPaySucessedConfirmed = EventDispatcher.getInstance():getUserEvent();