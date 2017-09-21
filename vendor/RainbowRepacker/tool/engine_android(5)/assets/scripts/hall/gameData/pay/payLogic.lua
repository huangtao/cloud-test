require("common/commonLogic");
require("hall/gameData/godsdk/godsdkHelper");
require("hall/gameData/pay/iosPayLogic");
require("hall/recharge/data/rechargeDataInterface");

--@brief 支付流程

PayLogic = class(CommonLogic);

PayLogic.Delegate = {
	onOrderNumRequesting = "onOrderNumRequesting";
	onOrderNumRequestSuccess = "onOrderNumRequestSuccess";
	onOrderNumRequestFailed = "onOrderNumRequestFailed";
	onPaying = "onPaying";
	onPaySuccess = "onPaySuccess";
	onPayFailed = "onPayFailed";
    onGetPhoneNumberFail = "onGetPhoneNumberFail"
}

PayLogic.ctor = function(self, delegate)
	self.m_curPaymentInfo = {};
	IosPayLogic.getInstance():setDelegate(self);
end

PayLogic.dtor = function(self)
    IosPayLogic.getInstance():setDelegate(nil);
   	delete(self.m_bareCodeConfirmLayer);
	self.m_bareCodeConfirmLayer = nil;
end

PayLogic.setExtensionOrderParam = function(self, extParam)
	self:log("PayLogic.setExtensionOrderParam", " extParam = ", extParam);
	self.m_extParam = extParam;
end

PayLogic.getExtensionOrderParam = function(self)
	self:log("PayLogic.getExtensionOrderParam", "self.m_extParam = ", self.m_extParam);
	return self.m_extParam;
end

--@brief 开始进行支付
PayLogic.requestRecharge = function(self, sceneId, goodId, pmode)
	self:log("PayLogic.requestRecharge", "sceneId = ", sceneId, " goodId = ", goodId, " pmode = ", pmode);
	pmode = tonumber(pmode) or 0;
	if not (goodId and sceneId) then
		self:log("PayLogic.rechargeData", " the goodId or sceneId is nil");
		self:onOrderNumRequestFailed("商品Id为空~");
		return;
	end

	local goodInfo = GoodsListInterface.getInstance():getGoodsItemInfo(sceneId, goodId);
	if table.isEmpty(goodInfo) then
		self:log("PayLogic.rechargeData", "the goodInfo is empty");
		self:onOrderNumRequestFailed("商品不存在~");
		return;
	end

	self.m_curPaymentInfo = {};
	self.m_curPaymentInfo.pmode = pmode;
	self.m_curPaymentInfo.goodInfo = goodInfo;

	self:__requestOrderNum();
end

--@brief 取消支付
PayLogic.cancleRecharge = function(self)
	self:log("PayLogic.cancleRecharge");
	LoadingView.getInstance():hidden();
	self.m_curPaymentInfo = {};
end

----------------------------------订单流程------------------------
--@brief 请求订单
PayLogic.__requestOrderNum = function(self)
	self:onOrderNumRequesting();

	local param = {};
	param.item_id = self.m_curPaymentInfo.goodInfo.id;--商品Id
	param.ptype = self.m_curPaymentInfo.pmode;--支付渠道
	param.v = (System.getPlatform() == kPlatformIOS) and 6 or 2;--支付版本：1为IOS(老版本)、2为安卓、6:IOS(新版) 其他为PC客户端
	param.operation =  kClientInfo:getPhoneCardType(); --手机卡类型 1移动 2 联通 3 电信
	param.mobileid =  kClientInfo:getPhoneNum();--手机号码
    self:log("PayLogic.__requestOrderNum", "param = ", param);
	OnlineSocketManager.getInstance():sendMsg(PHP_SEND_PAYMENT_ORDER, param);
end

--@brief 订单获取回调
PayLogic.__onGetOrderNumCallBack = function(self, isSuccess, orderData)
	self:log("PayLogic.__onGetOrderNum", " isSuccess = ", isSuccess, "orderData = ", orderData);

    if table.isEmpty(self.m_curPaymentInfo) or table.isEmpty(self.m_curPaymentInfo.goodInfo) then
        --代表取消了支付
        self:onOrderNumRequestFailed();
        return;
    end
    if not isSuccess then
    	local errInfo = orderData;
        if errInfo.errorType == 2036 then
        	--错误码2036代表手机号为必传参数，需手动输入手机号
            self:onGetPhoneNumberFail();
        else
            self:onOrderNumRequestFailed(errInfo.errorTips);
    	end
        return;
    end

    if table.isEmpty(orderData) or table.isEmpty(orderData.orderSundry) or table.isEmpty(orderData.orderinfo) then
        self:onOrderNumRequestFailed("订单参数错误");
        return;
    end

    self:onOrderNumRequestSuccess();

	self.m_rechargeData = {};
	self.m_rechargeData.name = self.m_curPaymentInfo.goodInfo.name;
	self.m_rechargeData.goodId = self.m_curPaymentInfo.goodInfo.id;
    self.m_rechargeData.pamount = self.m_curPaymentInfo.goodInfo.pamount;
	self.m_rechargeData.ptype = self.m_curPaymentInfo.pmode;

	self.m_orderData = orderData;

    self.m_rPmode = orderData.orderSundry.pmode;--返回的实际pmode
    if not self.m_rPmode then
    	self:onOrderNumRequestFailed("订单参数错误");
        return;
    end

    
    self:__sendPayOrder(orderData,self.m_curPaymentInfo)

    if tonumber(orderData.orderSundry.is_confirm) == 1 then
		self:__showBareCodeConfirmLayer();    	
	else
		self:__requestPay();
	end
end


--@brief 显示裸码支付确认框
PayLogic.__showBareCodeConfirmLayer = function(self)
	if not self.m_bareCodeConfirmLayer then
		self.m_bareCodeConfirmLayer = new( require("hall/shortCutRecharge/widget/bareCodeConfirmLayer") );
		self.m_bareCodeConfirmLayer:setDelegate(self);
		self.m_bareCodeConfirmLayer:addToRoot();
	end

	self.m_bareCodeConfirmLayer:show(self.m_curPaymentInfo.goodInfo);
end

--@delegate
PayLogic.onBareCodeConfirmLayerClose = function(self)
	self.m_bareCodeConfirmLayer:hide();
	self:onPayFailed();
end

--@delegate
PayLogic.onBareCodeConfirmLayerBuyBtnClick = function(self)
	self.m_bareCodeConfirmLayer:hide();
	self:__requestPay();
end

--@brief 正在获取订单
PayLogic.onOrderNumRequesting = function(self)
	self:log("PayLogic.onOrderNumRequesting");
	LoadingView.getInstance():showText("正在创建订单。。。");
	self:execDelegate(PayLogic.Delegate.onOrderNumRequesting);
end

--@brief 订单获取成功
PayLogic.onOrderNumRequestSuccess = function(self)
	self:log("PayLogic.onOrderNumRequestSuccess");

	LoadingView.getInstance():hidden();
	self:execDelegate(PayLogic.Delegate.onOrderNumRequestSuccess);
end

--@brief 订单获取失败
PayLogic.onOrderNumRequestFailed = function(self, errTips)
	self:log("PayLogic.onOrderNumRequestFailed");

	LoadingView.getInstance():hidden();
	self:execDelegate(PayLogic.Delegate.onOrderNumRequestFailed, errTips);
end

--@brief 获取手机号失败
PayLogic.onGetPhoneNumberFail = function(self)
    self:log("PayLogic.onGetPhoneNumberFail");

    LoadingView.getInstance():hidden();
    self:execDelegate(PayLogic.Delegate.onGetPhoneNumberFail);
end

-----------------------------------支付流程------------------------------------
--@brief 开始调用sdk
PayLogic.__requestPay = function(self)
	if  table.isEmpty(self.m_curPaymentInfo) or not (self.m_rPmode and self.m_rechargeData and self.m_orderData) then
		self:onPayFailed();
		return;
	end

	self:onPaying();
	self.m_payResultFlag = false;
	if kPlatformIOS == System.getPlatform() then
		local orderinfo =  self.m_orderData.orderinfo;
		orderinfo.appstoreid = self.m_curPaymentInfo.goodInfo.appstoreid;
		dict_set_string("RechargeController","appstoreid", orderinfo.appstoreid);
		for k, v in pairs( table.verify(self:getExtensionOrderParam()) ) do
			if k and v then
				orderinfo[k] = v ;
			end
		end

		local data = json.encode(orderinfo);
        self:log("PayLogic.__requestPay ios payParam = ", data)
		NativeEvent.getInstance():startTongYiPay( data,kUserInfoData:getUserId());
	else
		self:log("PayLogic.__requestPay")
		GodSDKHelper.requestPay(self.m_rPmode, self.m_rechargeData, self.m_orderData);
	end

	--重置订单数据
	self.m_curPaymentInfo = {};
	self.m_extParam = {};
	--self.m_rPmode = nil;
	self.m_rechargeData = nil;
	self.m_orderData = nil;
end

--@brief java回调支付结果
PayLogic.__onPayResult = function(self, status, json_data)
	self:log("PayLogic.__onPayResult", " status = ", status, " json_data = ", json_data);

	--防止原生端回调多次支付结果，导致lua端出问题
	if self.m_payResultFlag then
		return;
	end
	self.m_payResultFlag = true;

	LoadingView.getInstance():hidden();
	if not (status and json_data) then
		self:onPayFailed();
		return;
	end
	
	local result = GetNumFromJsonTable(json_data,"ret",2); 
	if result == 0 then --支付成功
       self:__parsePayResult(json_data);
	else
		self:onPayFailed();
	end
end

--@brief 正在调用sdk 
PayLogic.onPaying = function(self)
	self:log("PayLogic.onPaying");
	LoadingView.getInstance():showText("正在请求支付...");
	self:execDelegate(PayLogic.Delegate.onPaying);
end

--@brief 请求sdk支付成功
PayLogic.onPaySuccess = function(self)
	self:log("PayLogic.onPaySuccess");

	LoadingView.getInstance():hidden();
	self:execDelegate(PayLogic.Delegate.onPaySuccess);
end

--@brief 请求sdk支付失败
PayLogic.onPayFailed = function(self)
	self:log("PayLogic.onPayFailed");

	LoadingView.getInstance():hidden();
	self:execDelegate(PayLogic.Delegate.onPayFailed);
end

--@brief 解析从god那边返回的支付信息，判断是否需要向php发送验证信息
PayLogic.__parsePayResult = function(self, json_data)
    if  self.m_rPmode == PayConfig.ePayMode.UNICOM_FOURTHBAREBACK_PMODE
        or self.m_rPmode == PayConfig.ePayMode.WORDS_FUBAO_BARE_PMODE then

        --联通裸码第4套和话付宝裸码需要特殊处理
        local order = GetStrFromJsonTable(json_data,"orderid","");
        local vcode = GetStrFromJsonTable(json_data,"checkcode","");

        if not string.isEmpty(order) and not string.isEmpty(vcode) then
            self:__sendValidatePayParams( {order = order, vcode = vcode} );
            return;
        end
    end

    self:onPaySuccess();
end

--@brief 有些支付需要向php发送验证信息 (如 联通第四套裸码、话付宝裸码)
PayLogic.__sendValidatePayParams = function (self, info)
    info = table.verify(info);
    info.pmode = self.m_rPmode;
    info.phone = kClientInfo:getPhoneNum();

    self:log("PayLogic.__sendValidatePayParams","info = ",info);
    OnlineSocketManager.getInstance():sendMsg(PHP_SEND_VALIDATE, info, 10*1000);
end

--向Php发送验证信息回调 (发送短信验证码回调结果)
PayLogic.__onGetValidateResultCallBack = function (self, isSuccess, info, sendParam)
	self:log("PayLogic.__onGetValidateResultCallBack","isSuccess = ",isSuccess);
	if isSuccess then
	   self:onPaySuccess();
	else
	   self:onPayFailed(); 
	end
end

--------------------------------订单上报流程---------------------------------
--@brief 订单信息上报
PayLogic.__sendPayOrder = function(self, orderData,curPaymentInfo)
	--body
    local param = {};
    param.order_id = orderData.orderinfo.ORDER;--支付中心订单ID
    param.gameid = kGameManager:getCurGameId();--下单时所在的游戏ID
    param.level = kGameManager:getCurRoomLevelId();--下单时所在的房间等级
    param.gameparty_subname = ""; --下单时牌局场二级分类，比如游戏场的新手场，初级场，高级场，淘汰场 
    param.gameparty_anto = "";--下单时底注场
    param.bankrupt = kBankruptDataInterface:checkIsBankrupt(kUserInfoData:getMoney()) == true and 1 or 0 ; --下单时用户是否处于破产状态（ 0:否, 1：是 ）
    param.pay_scene = RechargeDataInterface.getInstance():getSceneType();--付费场景，在哪个游戏入口下单（如游戏界面、结算界面、降级充值、破产充值、商城）
    param.pm_name = orderData.orderinfo.PMODE; --下单时所用的支付方式名称（支付宝，银联啥的） 
    param.currency_type = curPaymentInfo.goodInfo.currency; --币种类型，比如F币，人民币
    param.currency_num = orderData.orderinfo.PAMOUNT;-- 币种数量
    param.item_category = curPaymentInfo.goodInfo.type;-- 购买商品类别，上报对应id(0:未定义 1:虚拟道具 4:游戏币 5:博雅币)
    param.item_id = curPaymentInfo.goodInfo.id;  --购买物品id, 当购买虚拟道具时，填写相关道具id 
    param.item_num =  orderData.orderinfo.PCHIPS;  --购买物品数量
    param.platform_order_id = ""; --平台订单流水号
    param.fee = 0;     --手续费用
    param.is_pay_done = 0;--是否支付完成 0为创建订单 1为支付完成
    OnlineSocketManager.getInstance():sendMsg(PHP_ROOM_PAY_SEND_ORDER,param);
end


PayLogic.showToast = function(self, msg)
	Toast.getInstance():showText(msg, 50,30,kAlginCenter,"",24,255,255,255);
end

PayLogic.log = function(self, ...)
	Log.v("PayLogic", ...);

    local fileName = self:getLogFileName();
    Log.addModuleCache(fileName,...);
end

PayLogic.getLogFileName = function(self)
    return "Pay";
end


PayLogic.s_nativeEventFuncMap = {
	["payResult"] 						    = PayLogic.__onPayResult;
}


PayLogic.s_socketCmdFuncMap = {
	[PHP_SEND_PAYMENT_ORDER] = PayLogic.__onGetOrderNumCallBack;
    [PHP_SEND_VALIDATE]      = PayLogic.__onGetValidateResultCallBack;
    [PHP_SEND_PAYMENT_ORDER_TEST] = PayLogic.__onGetOrderNumCallBack;
}