require("common/commonLogic");

require("hall/login/data/loginConstants");
local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
local AccountRegisteredDialog = require("hall/login/widget/accountRegisteredDialog");
local AutoVerifyFailedDialog = require("hall/login/widget/autoVerifyFailedDialog");
local PhoneAccountLoginDialog = require("hall/login/widget/phoneAccountLoginDialog");
local RegisterAccountVerifyCloseDialog = require("hall/login/widget/registerAccountVerifyCloseDialog");
local RegisterAccountVerifyDialog = require("hall/login/widget/registerAccountVerifyDialog");
local AutoRegisterDialog = require("hall/login/widget/autoRegisterDialog");

require("hall/login/logic/loginLogic");
require("hall/login/data/registerDataInterface");

RegisterLogic = class(DataInterfaceBase);

RegisterLogic.Delegate = {
	onCheckRegisterSucess = "onCheckRegisterSucess";
	onCheckRegisterFailed = "onCheckRegisterFailed";
	onBindPhoneCallBack = "onBindPhoneCallBack";

	onGetRegisteVerifyCode = "onGetRegisteVerifyCode";
	onGetRegisteVerifyCodeByVoice = "onGetRegisteVerifyCodeByVoice";
};

RegisterLogic.SendSMS_Timer = "SendSMS_Timer";

RegisterLogic.getInstance = function()
	if not RegisterLogic.s_instance then
		RegisterLogic.s_instance = new(RegisterLogic);
	end

	return RegisterLogic.s_instance;
end

RegisterLogic.ctor = function(self)	
	self.m_logFileName = "RegisterLogic";
	self.m_timeOutTimer = new(TimeOutTimer, self);

	-- RegisterDataInterface.getInstance():getFillInfoConfig();
	self:initSocketManager();
end

RegisterLogic.dtor = function(self)
	delete(self.m_timeOutTimer);
	self.m_timeOutTimer = nil;
	Log.uploadModuleCache("Register");
end

------------------------------------------------------------------------
RegisterLogic.initSocketManager = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
end 

RegisterLogic.log = function(self, funcName, ...)
    local fileName = self:getLogFileName();
    Log.addModuleCache(fileName,"RegisterLogic",funcName,...);
end

RegisterLogic.getLogFileName = function(self)
    return "Register";
end

------------------------------------------------------------------------
---- 自动注册
RegisterLogic.startAutoRegister = function(self)
	self:log("startOneKeyRegisterLogin");
	NativeEvent.getInstance():ShowLoadingDialog(GameString.get("loginPhoneVerify"));
	
	kClientInfo:getPhoneInfo();

	local phoneNum = kClientInfo:getPhoneNum();
	phoneNum = string.trim(phoneNum);
	if phoneNum == "" then
		local simNum = kClientInfo:getImsi();
		simNum = string.trim(simNum);
		if simNum == "" then--没有sim卡
			self:log("startOneKeyRegisterLogin","on phone + no sim ==> onRegisterFailed");
			local data = {};
			data.errorType = LoginConstants.eRegisterErr.NoSimCard;
			self:onRegisterFailed(data);

		else--有sim卡			
			self:log("startOneKeyRegisterLogin","on phone + have sim ==> getOperatorMsg");
			self.m_socket:sendMsg(PHP_GET_MSGCODE,{simcode = simNum});--获取运营商电话号码
		end
	else
		self:log("startOneKeyRegisterLogin","have phone ==> checkRegister");
		self:checkRegister(phoneNum,true);
	end
end

RegisterLogic.onGetOperatorMsgCode = function(self,isSuccess,info)
	self:log("onGetOperatorMsgCode","isSuccess = ",isSuccess,"info = ",info);	
	
	if isSuccess then
		local destSmsPort = info and (info.operator or "") or "";
		if destSmsPort ~= "" then
			--发短信
			self.smsKey = kClientInfo:getGuid() .. os.time();
			local toPhone =  destSmsPort;
			local smsContext = "100011:" .. self.smsKey;

			--8秒钟后
			self:_startSendSmsTimer();

			self:log("onGetOperatorMsgCode","get operatorMsg success ==> sendSms");

			local info = {};
			info.toPhone = toPhone or "";
			info.smsContext = smsContext or "";
			local json_data = json.encode(info);
			NativeEvent.getInstance():sendSmsByRegister(json_data);

			return;
		else
			self:onAutoVerifyFailed();
		end
	else
		self:log("onGetOperatorMsgCode","get operatorMsg failed ==> onAutoVerifyFailed");
		self:onAutoVerifyFailed();
	end
end

--检查账号是否注册
RegisterLogic.checkRegister = function(self,phone,isAutoCheckRegister)
	self:log("checkRegister","phone = ",phone);
	self.m_isAutoCheckRegister = isAutoCheckRegister;
	self.m_socket:sendMsg(PHP_LOGIN_checkReg,{type="PHONE",byacc=phone}); 
end 

RegisterLogic.onCheckRegisterCallBack = function(self, isSuccess,info,requestParam)
    self:log("onCheckRegisterCallBack","isSuccess = ",isSuccess,"info = ",info);
    
	if isSuccess then
		if info.flag == 1 then 
			self:log("onCheckRegisterCallBack","checkRegister failed registered ==> onCheckRegisterFailed");
			local data = {};
			data.errorType = LoginConstants.eRegisterErr.Registered;
			data.checkPhone = requestParam.byacc;
			self:onCheckRegisterFailed(data);

	    elseif info.flag == 0 then
	    	self:log("onCheckRegisterCallBack","checkRegister success ==> onCheckRegisterSucess");
	    	self:requestRegisteVerifyCode(requestParam.byacc);
	    	local data = {};
	    	data.checkPhone = requestParam.byacc;
            data.isShowRegistration = info.agentCodeSwitch;
            self:onCheckRegisterSucess(data);
	    end
	else
		if self.m_isAutoCheckRegister then 
			self:log("onCheckRegisterCallBack","auto checkRegister failed ==> onAutoVerifyFailed");
			self:onAutoVerifyFailed();
		else 
			self:log("onCheckRegisterCallBack","checkRegister failed ==> CheckRegisterFailed");
			self:onCheckRegisterFailed(info);
		end 
    end
    self.m_isAutoCheckRegister = nil;
end

RegisterLogic.onRegisterFailed = function(self,data)
	NativeEvent.getInstance():HideLoadingDialog();
	AutoRegisterDialog.hide();

	local errType = data.errorType or 0;
	if errType == LoginConstants.eRegisterErr.NoSimCard then 
		RegisterAccountDialog.show();
	end
end

RegisterLogic.onAutoVerifyFailed = function(self)
	NativeEvent.getInstance():HideLoadingDialog();
	AutoVerifyFailedDialog.show();
end

RegisterLogic.onCheckRegisterSucess = function(self,info)
	NativeEvent.getInstance():HideLoadingDialog();
	self:notify(RegisterLogic.Delegate.onCheckRegisterSucess,info);
end

RegisterLogic.onCheckRegisterFailed = function(self,errorInfo)
	NativeEvent.getInstance():HideLoadingDialog();
	self:notify(RegisterLogic.Delegate.onCheckRegisterFailed,errorInfo);
end

--获取注册验证码
RegisterLogic.requestRegisteVerifyCode = function(self,phone)
	self:log("requestRegisteVerifyCode","phone = ",phone);
	local data = {};
	data.phone = phone;

	self.m_socket:sendMsg(PHP_REGISTER_GETCODE,data);
end

RegisterLogic.onGetRegisteVerifyCode = function(self,isSuccess,info)
	self:log("onGetRegisteVerifyCode","isSuccess = ",isSuccess,"info = ",info);
	if isSuccess then 
		local flag = number.valueOf(info.flag);
		isSuccess = flag == 1;
	end 
	self:notify(RegisterLogic.Delegate.onGetRegisteVerifyCode,isSuccess);
end 

RegisterLogic.requestRegisterVerifyCodeByVoice = function(self, phone)
	self:log("requestRegisterVerifyCodeByVoice","phone = ",phone);
	local data = {};
	data.phone = phone;

	self.m_socket:sendMsg(PHP_REGISTER_GETCODE_BY_VOICE,data);
end

RegisterLogic.onGetRegisteVerifyCodeByVoice = function(self, isSuccess, info)
	self:log("RegisterLogic", "isSuccess = ", isSuccess, " info = ", info);
	if isSuccess then
		local flag = number.valueOf(info.flag);
		isSuccess = flag == 1;
	end

	self:notify(RegisterLogic.Delegate.onGetRegisteVerifyCodeByVoice, isSuccess);
end

--绑定手机
RegisterLogic.requestBindPhone = function(self,phone,mid,pwd,verifyCode,registrationCode)
	self:log("requestBindPhone","phone = ",phone,"mid = ",mid,"pwd = ",pwd,"verifyCode = ",verifyCode);
	local data = {};
	data.phone = phone;
	data.mid = mid;
	data.pwd = pwd;
	data.token = verifyCode;
    data.agentcode = registrationCode;
    data.hall_version = kGameManager:getGameVersion(GameType.HALL);
    data.apk_version = kClientInfo:getApkVersion();
    data.channel_id = kClientInfo:getChannelId();
    data.machine_type = kClientInfo:getPhoneModel();
	data.resolution = string.format("%d*%d",System.getScreenWidth(),System.getScreenHeight());
	data.imsi = kClientInfo:getImsi();
   	data.os = kClientInfo:getOSVersion();
	data.net = kClientInfo:getNetworkType();
	data.operator = kClientInfo:getPhoneCardType();
	data.guid = kClientInfo:getGuid();


	self.m_socket:sendMsg(PHP_LOGIN_bindPhone,data); 
end

RegisterLogic.onBindPhoneCallBack = function(self,isSuccess, data, requestParam)
	self:log("onBindPhoneCallBack","isSuccess = ",isSuccess,"info = ", data);

	if isSuccess then
		if not table.isEmpty(requestParam) then 
			local temp = {};
			temp.uType = LoginConstants.uType.BoyaaPassport;
			temp.byacc = requestParam.phone;
			temp.token = data.accesstoken;
			temp.bid = data.bid;
			temp.phoneNum = requestParam.phone;
			kLoginDataInterface:setLastLoginInfo(temp); 

			kLoginDataInterface:addLoginInfo(temp.byacc,requestParam.pwd,temp.bid,temp.token);
		end 

		self:log("onBindPhoneCallBack","bind success");
	else 

		self:log("onBindPhoneCallBack","bind failed");
	end 
	self:notify(RegisterLogic.Delegate.onBindPhoneCallBack,isSuccess,data);
end

------------------ --发送短信回调--------------------------------------------------------
RegisterLogic.onSendSmsByRegisterCallback = function(self,isSuccess)
	self:log("onSendSmsByRegisterCallback","isSuccess = ",isSuccess);
	if not isSuccess then
		self:log("onSendSmsByRegisterCallback","send sms failed ==> registerFailed");
		self:onAutoVerifyFailed();
	end
end

RegisterLogic.s_nativeEventFuncMap = {
	["sendSmsByRegister"] 				 = RegisterLogic.onSendSmsByRegisterCallback;
};

----------------------------------------------------------------------------------------------------------------
RegisterLogic._startSendSmsTimer = function(self)
	self:log("_startSendSmsTimer","sending sms");
	self:_clearSendSmsTimer();
	self.m_timeOutTimer:startTimer(RegisterLogic.SendSMS_Timer,self.onSendSmsTimeOut,8000);
end 

RegisterLogic._clearSendSmsTimer = function(self)
	self.m_timeOutTimer:clearTimer(RegisterLogic.SendSMS_Timer);
end

RegisterLogic.onSendSmsTimeOut = function(self)
	self:log("onSendSmsTimeOut","sendSms timeOut ==> msgUpChed");

	self:_clearSendSmsTimer();
	self.m_socket:sendMsg(PHP_MSGUPCHECK,{key=self.smsKey});--通过上行短信获取用户手机号码
end

RegisterLogic.onMsgUpCheckCallBack = function(self,isSuccess,info)
	self:log("onMsgUpCheckCallBack","isSuccess = ",isSuccess,"info = ",info);	

	if isSuccess then
		local phone = info and (info.phone or "") or "";
		if phone ~= "" then
			kClientInfo:setPhoneNumSms(phone);
			local imsi = kClientInfo:getImsi();
			kLoginDataInterface:addImsiPhone(imsi,phone);

			self:log("onMsgUpCheckCallBack","get phone success ==> checkRegister");
			self:checkRegister(phone,true);
			return;
		end
	end

	self:log("onMsgUpCheckCallBack","get phone failed ==> onAutoVerifyFailed");
	self:onAutoVerifyFailed();
end

RegisterLogic.s_socketCmdFuncMap = {
	[PHP_GET_MSGCODE] 		         	= RegisterLogic.onGetOperatorMsgCode;
	[PHP_MSGUPCHECK] 	 		     	= RegisterLogic.onMsgUpCheckCallBack;

    [PHP_LOGIN_checkReg] 				= RegisterLogic.onCheckRegisterCallBack;
    [PHP_REGISTER_GETCODE] 				= RegisterLogic.onGetRegisteVerifyCode;
    [PHP_REGISTER_GETCODE_BY_VOICE]     = RegisterLogic.onGetRegisteVerifyCodeByVoice;
    [PHP_LOGIN_bindPhone]	 			= RegisterLogic.onBindPhoneCallBack;
};