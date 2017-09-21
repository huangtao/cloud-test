require("hall/common/gameManager");

ShortCutRechargeScene = class(CommonScene);

ShortCutRechargeScene.s_waitingPayingTime = 14 * 1000;

ShortCutRechargeScene.s_cmds = {
	onResume = 1,
	onPause = 2,
}

ShortCutRechargeScene.ctor = function(self, viewConfig, controller, 
										goodsListId,               --商品列表id
										requestParam,              --请求参数(如果商品信息为空，则会根据参数去请求商品信息)
										goodInfo,				   --商品信息(如果有则根据商品信息去进行支付)
										isOnlySupportSMS,		   --是否只支持短信(eg:房间桌子), 2.0禁用了
										preferPayMode,             --优先调用的支付方式(eg:某些活动)
										filterParams)			   --过滤参数

	self.m_goodsListId = goodsListId;
	self.m_goodInfo = goodInfo;
	self.m_requestParam = requestParam;
	self.m_isOnlySupportSMS = isOnlySupportSMS;
	self.m_preferPayMode = preferPayMode;
	self.m_filterParams = filterParams;

	self:log("ShortCutRechargeScene.ctor goodsListId --> ", self.m_goodsListId);
	self:log("ShortCutRechargeScene.ctor goodInfo --> ", self.m_goodInfo);
	self:log("ShortCutRechargeScene.ctor requestParam --> ", self.m_requestParam);
	self:log("ShortCutRechargeScene.ctor isOnlySupportSMS --> ", self.m_isOnlySupportSMS and "true" or "false");
	self:log("ShortCutRechargeScene.ctor m_preferPayMode --> ", self.m_preferPayMode);
	self:log("ShortCutRechargeScene.ctor m_filterParams --> ", self.m_filterParams);
end

ShortCutRechargeScene.resume = function(self)
	CommonScene.resume(self);

	kGoodsListInterface:setObserver(self);
	RechargeDataInterface.getInstance():setObserver(self);

	if self.m_hasEnter then
		return;
	end
	self.m_hasEnter = true;

	if table.isEmpty(self.m_goodInfo) then
		self:requestGoodsList();

	elseif self.m_goodInfo.currency == GoodsListInterface.eCurrencyType.gold then
		self:showRechargePropLayer(self.m_goodInfo);

	elseif self.m_goodInfo.currency == GoodsListInterface.eCurrencyType.diamond then
		self:log("ShortCutRechargeScene.resume", "the currency is diamond and it not support now");
		self:goBack();
	else
		self:onSelectGoodItem(self.m_goodsListId, self.m_goodInfo.id);
	end
end

ShortCutRechargeScene.onResume = function(self)
	self:log("ShortCutRechargeScene.onResume");
	self:hideLoading();
	self:__stopWaitPayingTimer();
end

ShortCutRechargeScene.pause = function(self)
	kGoodsListInterface:clearObserver(self);
	RechargeDataInterface.getInstance():clearObserver(self);

	CommonScene.pause(self);
end

ShortCutRechargeScene.onPause = function(self)
	self:log("ShortCutRechargeScene.onPause");
	self:hideLoading();
	self:__stopWaitPayingTimer();
end

ShortCutRechargeScene.dtor = function(self)
	self:log("ShortCutRechargeScene.dtor");
	self:hideLoading();
	self:__stopWaitPayingTimer();

	delete(self.m_payLogic);
	self.m_payLogic = nil;

	kGoodsListInterface:clearObserver(self);
end

--请求商品列表
ShortCutRechargeScene.requestGoodsList = function(self)
	local info = kGoodsListInterface:getSceneGoodsInfo(self.m_goodsListId, self.m_requestParam);
	self:log("ShortCutRechargeScene.requestGoodsList", "m_goodsListId = ", m_goodsListId, " info = ", info);
	if table.isEmpty(info) then
		if table.isEmpty(self.m_requestParam) then
			self:showToast("商品列表拉取失败~", " : 参数为空");
			self:goBack();
		else
			self:showLoading("加载商品...");
		end
	else
		self:__choosePaymentScene(info);
	end
end

--@delegate
ShortCutRechargeScene.onGetGoodsInfoCallBack = function(self, isSuccess, info, sendParam)
	self:log("ShortCutRechargeScene.onGetGoodsInfoCallBack", " isSuccess = ", isSuccess, " info = ", info);
	self:hideLoading();
	if not isSuccess then
		local errMsg = string.isEmpty(info.errorTips)  and "商品列表拉取失败~" or info.errorTips;
		self:showToast(errMsg);
		self:goBack();
		return;
	end

	self:__choosePaymentScene(info);
end

--选择支付场景
ShortCutRechargeScene.__choosePaymentScene = function(self, info)
	if table.isEmpty(info.goodsList) then
		self:showToast("商品列表拉取失败~");
		self:goBack();
		return;		
	end

	local sceneId = self:__getPaymentScene(info.scene);
	if sceneId == PayConfig.ePayScene.ChooseGoodsLayer then
		--首冲/二冲
		self:showChooseGoodsLayer(info);
	elseif sceneId == PayConfig.ePayScene.SingleGoodsLayer and info.goodsList[1] then
		--快捷支付
		self:onSelectGoodItem(info.scene, info.goodsList[1].id);
	elseif sceneId == PayConfig.ePayScene.Market then
		if  self.m_filterParams then
			local goodInfo = kGoodsListInterface:getGoodsInfoWithChips(info.goodsList, self.m_filterParams.diffMoney);
			if not table.isEmpty(goodInfo) then
				self:onSelectGoodItem(info.scene, goodInfo.id);
			else
				self:showToast("商品获取失败~");
				self:goBack();
			end
		end
	elseif sceneId == PayConfig.ePayScene.Broken then
		--do nothing 
	else
		self:showToast("商品列表拉取失败~");
		self:log("ShortCutRechargeScene.__choosePaymentScene", "not found scene for the goodsListId", info.scene);
		self:goBack();
	end
end

--显示首冲/二冲商品界面
ShortCutRechargeScene.showChooseGoodsLayer = function(self, info)
	self:log("ShortCutRechargeScene.showChooseGoodsLayer");
	
	self.m_chooseGoodsLayer = self:__createLayer(self.m_chooseGoodsLayer, require("hall/shortCutRecharge/widget/chooseGoodsLayer"), self, self.goBack );
	self.m_chooseGoodsLayer:show(info);
end

--显示快捷支付界面
ShortCutRechargeScene.showSingleGoodsLayer = function(self, info)
	self:log("ShortCutRechargeScene.showSingleGoodsLayer");

	self.m_singleGoodsLayer = self:__createLayer(self.m_singleGoodsLayer, require("hall/shortCutRecharge/widget/singleGoodsLayer"), self, self.goBack );
	self.m_singleGoodsLayer:show(info);
end

--显示道具购买界面
ShortCutRechargeScene.showRechargePropLayer = function(self, goodInfo)
	self:log("ShortCutRechargeScene.showRechargePropLayer");
	local __wnd = LayerManagerIsolater.getInstance():show("shop_gold_pay_info",goodInfo);
	__wnd:setDelegate(self);
	self:pushStateStack(self, self.goBack);
	self.m_root:addChild(__wnd);
end	

--显示支付方式选择界面
ShortCutRechargeScene.showRechargeModeLayer = function(self, goodInfo)
	self:log("ShortCutRechargeScene.showRechargeModeLayer");

	self.m_rechargeModeLayer = self:__createLayer(self.m_rechargeModeLayer, require("hall/shortCutRecharge/widget/rechargeModeLayer"), self, self.onRechargeModeLayerClose);	
	self.m_rechargeModeLayer:show(goodInfo);
end

ShortCutRechargeScene.onGetPhoneNumberFail = function (self)
    self.m_inputPhoneNumber = self:__createLayer(self.m_inputPhoneNumber, require("hall/shortCutRecharge/widget/inputPhoneNumber"), self, self.onInputPhoneNumberClose);
	self.m_inputPhoneNumber:show();
end

--@delegate
ShortCutRechargeScene.onInputPhoneNumberClose = function(self, isManualClick) --失败
	self.m_inputPhoneNumber:hide();
	self:popStateStack(isManualClick);
end

--@delegate
ShortCutRechargeScene.onInputPhoneNumberBuyBtnClick = function(self,text)--成功
	kClientInfo:setPhoneNumSms(text);
    self.m_inputPhoneNumber:hide();
    self:popStateStack(true);
    self:__goToPay(self.m_curGoodsListId, self.m_curGoodsInfo.id, self.m_curPmode);
end

--@delegate 支付方式界面关闭
ShortCutRechargeScene.onRechargeModeLayerClose = function(self, isManualClick)
	self.m_rechargeModeLayer:hide();
	self:popStateStack(isManualClick);
end

--@delegate 选择支付方式
ShortCutRechargeScene.onSelectPayMode = function(self, pmode)
	self:log("ShortCutRechargeScene.onSelectPayMode", "pmode = ", pmode);
    self.m_curPmode = pmode;
	if table.isEmpty(self.m_curGoodsInfo) then
		return;
	end

	if pmode == PayConfig.ePayMode.LOCAL_CRYSTAL_PMODE then
		--金条购买
		self:showLoading("正在购买" .. self.m_curGoodsInfo.name);
		self:requestPayByCrystal(self.m_curGoodsInfo.id);
		return;
	end

	if System.getPlatform() == kPlatformIOS then
		if tostring(pmode) == PayConfig.ePayMode.LIAN_DONG_WEB_PMODE 
			or tostring(pmode) == PayConfig.ePayMode.ALIPAY_WEB_PMODE then
			self:showIosPayWebView(pmode);
		else
			self:__goToPay(self.m_curGoodsListId, self.m_curGoodsInfo.id, pmode);
		end
	else
		self:__goToPay(self.m_curGoodsListId, self.m_curGoodsInfo.id, pmode);
	end
end

--显示IOS webView
ShortCutRechargeScene.showIosPayWebView = function(self, pmode)
	self:log("ShortCutRechargeScene.showIosPayWebView ", "pmode = ", pmode);

	self.m_iosPayWebView = self:__createLayer(self.m_iosPayWebView, require("hall/shortCutRecharge/widget/iosPayWebView"), self, self.onIosPayWebViewClose);
	self.m_iosPayWebView:show();
	
	local x,y,w,h = self.m_iosPayWebView:getWebFrame();
	local extParam = {
		webFrame = {["x"]= x,["y"]= y,["w"]= w,["h"]= h},
		ptype = pmode;
	}

	self:__goToPay(self.m_curGoodsListId, self.m_curGoodsInfo.id, pmode, extParam);
end

ShortCutRechargeScene.onIosPayWebViewClose = function(self, isManualClick)
	if self.m_iosPayWebView and self.m_iosPayWebView:getVisible() then
		self.m_iosPayWebView:hide();
		self:hideLoading();
		self:popStateStack(isManualClick);
	end
end

--@delegate 选中商品
ShortCutRechargeScene.onSelectGoodItem = function(self, goodsListId, goodId)
	self:log("ShortCutRechargeScene.onSelectGoodItem", " goodsListId = ", goodsListId, " goodId = ", goodId);
	self.m_curGoodsInfo = GoodsListInterface.getInstance():getGoodsItemInfo(goodsListId, goodId);
	self.m_curGoodsListId = goodsListId;

	if table.isEmpty(self.m_curGoodsInfo) then
		self:showToast("不存在的商品~");
		self:goBack();
		return;
	end

	if kPlatformIOS == System.getPlatform() then
		if #self.m_curGoodsInfo.pmodes == 1 and self.m_curGoodsInfo.pmodes[1].id == PayConfig.ePayMode.APPLE_PMODE then
			self:onSelectPayMode(PayConfig.ePayMode.APPLE_PMODE); --只有苹果支付时，则直接弹出苹果支付
		else
			self:showRechargeModeLayer(self.m_curGoodsInfo); --否则的话，则弹出支付选择界面
		end
	else
		local preferMode = nil;
		if self.m_preferPayMode then
			local supportPmodes = self.m_curGoodsInfo.pmodes;
			for k, v in pairs( table.verify(supportPmodes) ) do
				if v.id == tostring(self.m_preferPayMode) then
					preferMode = tostring(self.m_preferPayMode);
				end
			end
		end

		if preferMode then
			self:onSelectPayMode(preferMode);
		else
			self:showRechargeModeLayer(self.m_curGoodsInfo);
		end
	end
end

--根据商品列表id获取对应的显示场景
ShortCutRechargeScene.__getPaymentScene = function(self, goodsListId)
	for sceneId, goodsListIds in pairs(PayConfig.paySceneGoodsListMap) do
		for _, id in pairs(goodsListIds) do
			if id == goodsListId then
				return sceneId;
			end
		end
	end

	return nil;
end

--开始使用金条购买商品
ShortCutRechargeScene.requestPayByCrystal = function(self, goodId, num)
	self:log("ShortCutRechargeScene.__goToPayUseCrystal", "goodId = ", goodId, " num = ", num);

	RechargeDataInterface.getInstance():requestPayByCrystal(goodId, num);
end

ShortCutRechargeScene.onGetCrystalBuyGoodsCallBack = function(self, isSuccess, msg)
	self:log("ShortCutRechargeScene.onGetCrystalBuyGoodsCallBack", "isSuccess = ", isSuccess, "msg = ", msg);
	self:hideLoading();

	if isSuccess then
		if not string.isEmpty(msg) then
			self:showToast(msg);
		end

		self:goBack();
	else
		msg = msg or "购买失败，请检查网络状况~";
		self:showToast(msg);
	end
end

--开始调用支付逻辑
ShortCutRechargeScene.__goToPay = function(self, goodsListId, goodId, pmode, extParam)
	self:log("ShortCutRechargeScene.__goToPay", " goodsListId = ", goodsListId, " goodId = ", goodId, " pmode = ", pmode, "extParam = ", extParam);

	if not self.m_payLogic then
		self.m_payLogic = new(PayLogic, self);
	end
	self.m_payLogic:setExtensionOrderParam(extParam);
	self.m_payLogic:requestRecharge(goodsListId, goodId, pmode);
end

ShortCutRechargeScene.onOrderNumRequestFailed = function(self, errTips)
	self:showToast(errTips);
	self:popStateStack();
end

ShortCutRechargeScene.onPaying = function(self)
	if self.m_iosPayWebView and self.m_iosPayWebView:getVisible() then
		self:hideLoading();
	end

	self:log("ShortCutRechargeScene.onPaying");
	self:__startWaitPayingTimer();
end

--payLogic delegate
ShortCutRechargeScene.onPaySuccess = function(self)
	self:log("ShortCutRechargeScene.onPaySuccess");
	self:onIosPayWebViewClose(true);
	self:__showRechargeResultLayer(true);
end

--payLogic delegate
ShortCutRechargeScene.onPayFailed = function(self)
	self:log("ShortCutRechargeScene.onPayFailed");
	self:onIosPayWebViewClose(true);
	self:__showRechargeResultLayer(false);
end

--显示GodSdk返回的支付结果弹框
ShortCutRechargeScene.__showRechargeResultLayer = function(self, isSuccess)
	if self.m_rechargeResultLayer and self.m_rechargeResultLayer:getVisible() then
		self.m_rechargeResultLayer:show(isSuccess);
	else

		self.m_rechargeResultLayer = self:__createLayer(self.m_rechargeResultLayer, require("hall/shortCutRecharge/widget/rechargeResultLayer"), self, self.onRechargeResultLayerClose);
		self.m_rechargeResultLayer:show(isSuccess);
	end
end

ShortCutRechargeScene.onRechargeResultLayerClose = function(self, isManualClick)
	self.m_rechargeResultLayer:hide();
	self:popStateStack(isManualClick);
end

ShortCutRechargeScene.__createLayer = function(self, memberName, layerClass, obj, func)
	if not memberName then
		memberName = new(layerClass);
		memberName:setDelegate(self);
		memberName:setFillParent(true, true);
		self:addChild(memberName);

		self:pushStateStack(obj, func);
	end

	return memberName, bCreate;
end

ShortCutRechargeScene.__startWaitPayingTimer = function(self)
	self:__stopWaitPayingTimer();

	self:log("ShortCutRechargeScene.__startWaitPayingTimer");
	self.m_waitPayingTimer = AnimFactory.createAnimInt(kAnimNormal, 0, 1, ShortCutRechargeScene.s_waitingPayingTime, -1);
	self.m_waitPayingTimer:setDebugName("ShortCutRechargeScene|m_waitPayingTimer");
	self.m_waitPayingTimer:setEvent(self, self.__onWaitPayingTimeOut);
end

ShortCutRechargeScene.__onWaitPayingTimeOut = function(self)
	self:log("ShortCutRechargeScene.__onWaitPayingTimeOut");
	self:__stopWaitPayingTimer();
	self:popStateStack();
end

ShortCutRechargeScene.__stopWaitPayingTimer = function(self)
	self:log("ShortCutRechargeScene.__stopWaitPayingTimer");
	delete(self.m_waitPayingTimer);
	self.m_waitPayingTimer = nil;
end

ShortCutRechargeScene.popStateStack = function(self, isManualClick)
	self:log("ShortCutRechargeScene.popStateStack", "isManualClick = ", isManualClick and "true" or "false");
	if isManualClick then
		CommonScene.popStateStack(self);
	end

	if not self:canPopStateStack() then
		self:goBack();
	end
end

--@delegate
ShortCutRechargeScene.goBack = function(self)
	self:requestCtrlCmd(ShortCutRechargeController.s_cmds.GoBack);
end

ShortCutRechargeScene.showToast = function(self, msg)
	if not string.isEmpty(msg) then 
		Toast.getInstance():showText(msg, 50,30,kAlginCenter,"",24,255,255,255);
	end
end

ShortCutRechargeScene.showLoading = function(self, msg)
	LoadingView.getInstance():showText(msg);
end

ShortCutRechargeScene.hideLoading = function(self)
	LoadingView.getInstance():hidden();
end

ShortCutRechargeScene.log = function(self, tag, ...)
	Log.v(tag, ...);
	Log.addModuleCache("Pay",tag,...);
end


ShortCutRechargeScene.s_cmdConfig = {
	[ShortCutRechargeScene.s_cmds.onResume] = ShortCutRechargeScene.onResume;
	[ShortCutRechargeScene.s_cmds.onPause] = ShortCutRechargeScene.onPause;
}