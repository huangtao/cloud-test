IosPayLogic = class(CommonLogic);

IosPayLogic.Delegate = {
    onPaySuccess = "onPaySuccess";
    onPayFailed = "onPayFailed";    
}

IosPayLogic.getInstance = function()
    if not IosPayLogic.s_instance then
         IosPayLogic.s_instance = new(IosPayLogic);
    end
    return IosPayLogic.s_instance;    
end

--@brief IOS支付成功后请求支付中心发货
IosPayLogic.__onIOSpayRequest = function(self, status, json_data)
    self:log("IosPayLogic.__onIOSpayRequest" , " status = ", status, "json_data = ", json_data);
    if not (status and json_data) then
        self:onPayFailed();
        return;
    end

    local pay_state =  GetNumFromJsonTable(json_data,"payState",-1);
    if pay_state == 1 then --- 支付成功
        local requestData = {};
        requestData.pid = GetStrFromJsonTable(json_data,"orderid","");
        requestData.pdealno = GetStrFromJsonTable(json_data,"pdealno","");
        requestData.receipt = GetStrFromJsonTable(json_data,"receipt","");
        requestData.sandbox = GetNumFromJsonTable(json_data,"sandbox", 0);--是否为沙河账号 1:是 0:不是
        self:log("IosPayLogic.__onIOSpayRequest --> ", "requestData = ", requestData);
        --请求支付中心发货,此时支付中心会验证订单的合法性
        OnlineSocketManager.getInstance():sendMsg(PHP_SEND_PAY_ORDER, requestData, 30*1000);
    else
        self:onPayFailed();
    end
end

--@brief 支付中心对订单合法性验证后的回调
IosPayLogic.__onIosPayCheckedCallBack = function(self, isSuccess, info, sendParam)
    self:log("IosPayLogic.__onIosPayCheckedCallBack", "isSuccess = ", isSuccess, " info = ", info, " sendParam = ", sendParam);

    if not isSuccess then
        if info.errorType == 3 then
            self:log("IosPayLogic.onIosPayCheckedCallBack , server返回超时.");
        elseif info.errorType == 2014 then
            self:log("IosPayLogic.onIosPayCheckedCallBack , PHP后台发送apple支付验证超时.");
        elseif info.errorType == 2037 then
            self:log("IosPayLogic.onIosPayCheckedCallBack , 重复发送了该订单数据 orderid=",sendParam.orderid);
            NativeEvent.getInstance():IosPayResultCallback(sendParam.pdealno);
        else
            Toast.getInstance():showText("订单支付尚未成功，大侠请重新来过", 50,30,kAlginCenter,"",24,255,255,255);
        end
        self:onPayFailed();
        return;
    end

    local retValue = tonumber(info.ret) or 0;
    if retValue == 1 then
        self:log("IosPayLogic.onIosPayCheckedCallBack , IOS支付验证成功");
        self:onPaySuccess();
        NativeEvent.getInstance():IosPayResultCallback(sendParam.pdealno);
    else
        self:log("IosPayLogic.onIosPayCheckedCallBack , IOS支付验证失败");
        self:onPayFailed();
    end
end

--@brief 请求sdk支付成功
IosPayLogic.onPaySuccess = function(self)
    self:log("IosPayLogic.onPaySuccess");

    self:execDelegate(IosPayLogic.Delegate.onPaySuccess);
end

--@brief 请求sdk支付失败
IosPayLogic.onPayFailed = function(self)
    self:log("IosPayLogic.onPayFailed");

    self:execDelegate(IosPayLogic.Delegate.onPayFailed);
end

IosPayLogic.log = function(self, ...)
    Log.v("IosPayLogic", ...);
    
    local fileName = self:getLogFileName();
    Log.addModuleCache(fileName,...);
end

IosPayLogic.getLogFileName = function(self)
    return "Pay";
end

IosPayLogic.s_nativeEventFuncMap = {
    ["startTongYiPay"]                      = IosPayLogic.__onIOSpayRequest;
}


IosPayLogic.s_socketCmdFuncMap = {
    [PHP_SEND_PAY_ORDER]     = IosPayLogic.__onIosPayCheckedCallBack;
}