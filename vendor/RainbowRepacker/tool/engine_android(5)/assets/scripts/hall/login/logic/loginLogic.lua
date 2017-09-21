require("hall/login/socket/loginSocketReader");
require("hall/login/socket/loginSocketWriter");
require("hall/login/data/loginDataInterface");
require("hall/login/data/loginConstants");
require("hall/userInfo/data/userInfoData");
require("hall/task/data/taskRewardDataInterface");
require("hall/agency/data/agencyDataInterface");
require("hall/recharge/data/rechargeDataInterface");
require("hall/community/data/communityDataInterface");
require("hall/activity/data/activityDataInterface");
require("hall/diamondShop/data/diamondShopDataInterface");
require("hall/password/data/passwordDataInterface");
require("netWork/ServerConfig");
require("gameData/geTuiInfo");
require("hall/slotMachine/slotMachineInfo");
require("hall/login/data/thirdPartyLoginManager");
require("hall/backpack/data/backpackDataInterface");
require("hall/gameData/share/shareDataInterface");
require('hall/goldBar/data/goldBarDataInterface');
require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/moraGame/data/moraGameDataInterface");
require("hall/safeBox/data/safeBoxDataInterface");

LoginLogic = class(DataInterfaceBase);

LoginLogic.SendLogin_Timer = "SendLogin_Timer";

LoginLogic.Delegate = {
	onLogining     = "onLogining";
	onLoginSuccess = "onLoginSuccess";
	onLoginFailed = "onLoginFailed";
	onLoginTimeout = "onLoginTimeout";

	onCheckIsRegisterCallBack = "onCheckIsRegisterCallBack";
	onGetVerifyCodeCallBack = "onGetVerifyCodeCallBack";
	onResetPswdCallBack = "onResetPswdCallBack";
};

LoginLogic.ctor = function(self)	
	self.m_logFileName = "LoginLogic";
	kLoginDataInterface:setObserver(self);
	ThirdPartyLoginManager.getInstance():setObserver(self);

	self.m_timeOutTimer = new(TimeOutTimer, self);
	self:addSocketTools();
end

LoginLogic.dtor = function(self)
	kLoginDataInterface:clearObserver(self);
	ThirdPartyLoginManager.getInstance():clearObserver(self);

	delete(self.m_timeOutTimer);
	self.m_timeOutTimer = nil;

	self:__releaseDelayAnim();

	self:removeSocketTools();
end

LoginLogic.getInstance = function()
	if not LoginLogic.s_instance then
		LoginLogic.s_instance = new(LoginLogic);
	end

	return LoginLogic.s_instance;
end

LoginLogic.addSocketTools = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
	
	self.m_socketReader = new(LoginSocketReader);
	self.m_socket:addSocketReader(self.m_socketReader);

	self.m_socketWriter = new(LoginSocketWriter);
	self.m_socket:addSocketWriter(self.m_socketWriter);
end

LoginLogic.removeSocketTools = function(self)
	self.m_socket:removeSocketReader(self.m_socketReader);
	self.m_socket:removeSocketWriter(self.m_socketWriter);

	delete(self.m_socketReader);
	self.m_socketReader = nil;

	delete(self.m_socketWriter);
	self.m_socketWriter = nil;	
end

------------------------------------------------------------------------
----自动登录
LoginLogic.requestAutoLogin = function(self)

	local lastUType = kLoginDataInterface:getLastUType();
	self:log("requestAutoLogin, lastUType = ", lastUType);

	if ThirdPartyLoginManager.getInstance():isThirdPartySupportLogin() then
		self:requestThirdPartyLogin();
	elseif lastUType == LoginConstants.uType.BoyaaPassport then --博雅通行证登录
		self:requestBoyaaPassportLogin();
	else
		self:requestGuestLogin();
	end
end 

----游客登录
LoginLogic.requestGuestLogin = function(self)
	self:log("requestGuestLogin");

	local loginType = LoginConstants.loginType.Notoken;
	local uType = LoginConstants.uType.Guest;

	local lastUType = kLoginDataInterface:getLastUType();
	if lastUType == LoginConstants.uType.Guest then
		local token = kLoginDataInterface:getLastToken();
		if token ~= "" then 
			loginType = LoginConstants.loginType.Token;
		end 
	end 
	
	self:_requestLoginParamData(loginType,uType);
end 

--博雅通行证登录
LoginLogic.requestBoyaaPassportLogin = function(self)	
	self:log("requestBoyaaPassportLogin");

	local lastLoginByacc = kLoginDataInterface:getLastByacc();
	local loginAccount,loginPsd,bid,access_token;
	local mType = 0;

	lastLoginByacc = string.trim(lastLoginByacc);
	if lastLoginByacc ~= "" then
		loginAccount = lastLoginByacc;
		local loginInfo = kLoginDataInterface:getLoginInfoByAccount(loginAccount);
		loginPsd = loginInfo.loginPsd;
		bid = loginInfo.bid or kLoginDataInterface:getLastBid();
		access_token = loginInfo.access_token or kLoginDataInterface:getLastToken();

		if loginAccount and loginPsd then -- 有账号有密码，则博雅通行证登录 
			mType = 1;
		elseif loginAccount and not string.isEmpty(bid) and not string.isEmpty(access_token) then -- 有账号没有密码，则使用bid和accessToken登录 
			mType = 2;
		else 
			mType = 3;
		end
	end

	if mType == 1 then -- 有账号有密码，则博雅通行证登录 
		self:log("requestBoyaaPassportLogin"," account + pswd ==> _boyaaPassportLogin");
		self:_boyaaPassportLogin(loginAccount,loginPsd,bid,access_token);

	elseif mType == 2 then -- 有账号没有密码，则使用bid和accessToken登录 
		self:log("requestBoyaaPassportLogin"," account + bid + token ==> _boyaaPassportBidTokenLogin");
		self:_boyaaPassportBidTokenLogin(loginAccount,loginPsd,bid,access_token);

	else
		self:log("requestBoyaaPassportLogin","nothing ==> requestGuestLogin");
		self:requestGuestLogin();
	end
end

--密码账户登录
LoginLogic.requestAccPswdLogin = function(self,account,password)
	self:log("requestLoginWithPassword","account = ",account,"password = ",password);
	self:_boyaaPassportLogin(account,password);
end

--博雅通行证登录（账号+密码） 
LoginLogic._boyaaPassportLogin = function(self,account,password,bid,access_token)
	self:log("_boyaaPassportLogin","account = ",account,"password = ",password, "bid = ", bid, "access_token = ", access_token);

	local loginType = LoginConstants.loginType.BoyaaPassportLogin;
	local uType = LoginConstants.uType.BoyaaPassport;

	local data = {};
	data.phone = account;
	data.pwd = password;
	data.flag  = 0;

	local extraData = {};
	extraData.bid = bid;
	extraData.accesstoken = access_token;

	self.m_loginAccount = account;
	self.m_loginPswd = password;

	self:_requestLoginParamData(loginType,uType,data,extraData);
end

----博雅账号登录（账户+bid+token）
LoginLogic._boyaaPassportBidTokenLogin = function(self,account,password,bid,access_token)
	self:log("_boyaaPassportBidTokenLogin","account = ",account,"bid = ",bid,"access_token = ",access_token);
	
	local loginType = LoginConstants.loginType.BoyaaPassportLogin;
	local uType = LoginConstants.uType.BoyaaPassport;

	local data = {};
	data.phone = account;
	data.pwd = password;
	data.flag  = 0;

	local extraData = {};
	extraData.bid = bid;
	extraData.accesstoken = access_token;

    self.m_loginAccount = account;

	self:_requestLoginParamData(loginType,uType,data,extraData);
end

--检查账号是否注册
LoginLogic.checkIsRegister = function(self,phone)
	self:log("checkIsRegister","phone = ",phone);
	self.m_socket:sendMsg(PHP_LOGIN_LOGIC_checkReg,{type="PHONE",byacc=phone}); 
end 

LoginLogic.onCheckIsRegisterCallBack = function(self, isSuccess,info,requestParam)
    self:log("onCheckIsRegisterCallBack","isSuccess = ",isSuccess,"info = ",info);
    
    local isRegister = true;
	if isSuccess then
	    isRegister = not (info.flag == 0);
    end

    self:notify(LoginLogic.Delegate.onCheckIsRegisterCallBack,isRegister);
end

--获取验证码
LoginLogic.requestVerifyCode = function(self,phone)
	self:log("requestVerifyCode","phone = ",phone);
	self.m_socket:sendMsg(PHP_LOGIN_sendResetToken,{type="PHONE",byacc=phone}); 
end

LoginLogic.onGetVerifyCodeCallBack = function(self,isSuccess, info)
	self:log("onGetVerifyCodeCallBack","isSuccess = ",isSuccess,"info = ", info);

	local isSuccess = info.errorType == LoginConstants.eVerifyCodeType.ResetPswd 
					  or info.errorType == LoginConstants.eVerifyCodeType.Register;

	self:notify(LoginLogic.Delegate.onGetVerifyCodeCallBack,isSuccess,info);
end

--重置密码
LoginLogic.requestResetPswd = function(self,account,verifycode,newpassword,errorType)
	self:log("requestResetPswd","account = ",account,"verifycode = ",verifycode,"newpassword = ",newpassword,"errorType = ",errorType);

	local data = {};
	data.byacc = account;
	data.pwd = newpassword;
	data.token = verifycode;
	data.type = "PHONE";
	self.m_socket:sendMsg(PHP_LOGIN_resetPwd, data); 
end

LoginLogic.onResetPswdCallBack = function(self, isSuccess, info)
	self:log("onResetPswdCallBack","responseType = ",responseType,"info = ", info);

	local isSuccess = info.errorType == 1030;--(1030:密码重置成功)
	self:notify(LoginLogic.Delegate.onResetPswdCallBack,isSuccess,info);
end

--请求第三方登录
LoginLogic.requestThirdPartyLogin = function(self)
	self:log("requestThirdPartyLogin");
	local loginType = ThirdPartyLoginManager.getInstance():getThirdPartyLoginType();
	ThirdPartyLoginManager.getInstance():requestLogin(loginType);
end

--第三方登录成功回调
LoginLogic.onThirdPartyLoginCallBack = function(self, isSuccess, loginType, uType, token, param, extraData)
	if not isSuccess then
		self:onLoginFailed();
		return;
	end

	self:_requestLoginParamData(loginType,uType,param,extraData);
end

--请求第三方切换账号
LoginLogic.requestThirdPartySwitchAccount = function(self)
	local loginType = ThirdPartyLoginManager.getInstance():getThirdPartyLoginType();
	ThirdPartyLoginManager.getInstance():requestSwitchAccount(loginType);
end

--第三方切换账号回调
LoginLogic.onThirdPartySwitchAccountCallBack = function(self, isSuccess, loginType, uType, token, param, extraData)
	if not isSuccess then
		self:onLoginFailed();
		return;
	end
	
	self:_requestLoginParamData(loginType,uType,param,extraData);
end
------------------------------------------------------------------------
LoginLogic.log = function(self,funcName,...)
	Log.record(self.m_logFileName," ",funcName," ",...);
end

-----------------------------------------------------------------------------------------------------
LoginLogic._requestLoginParamData = function(self,loginType,uType,in_param,in_extParam)
	Log.v("_requestLoginParamData","loginType = ",loginType,"uType = ",uType);
	
	kClientInfo:getPhoneInfo();

	local param_data = self:__getDefaultParamData();

	param_data.login_type = loginType;
	param_data.utype = uType;
	param_data.access_token = kLoginDataInterface:getLastToken();
	param_data.mid = kLoginDataInterface:getLastMid();
	if not string.isEmpty(s_guid) then 
		param_data.guid = string.concat(param_data.guid, s_guid);	
	end

	for k, v in pairs( table.verify(in_param) ) do
		if k and v then
			param_data[k] = v;
		end
	end

	local extParam_data = self:__getDefaultExtramParam();
	for k, v in pairs( table.verify(in_extParam) ) do
		if k and v then
			extParam_data[k] = v;
		end
	end

	param_data.param = json.encode(extParam_data);

	kLoginDataInterface:setCurLoginType(loginType);
	
	self:_sendLoginMsg(param_data);
end

LoginLogic.__getDefaultParamData = function(self)
	local param_data = {};
	
	param_data.api_ver = 2; --接口版本号
	param_data.channel_id = kClientInfo:getChannelId();
	param_data.channelKey = kClientInfo:getChannelKey();
	param_data.mac = kClientInfo:getMachineId();
	param_data.machine_type = kClientInfo:getPhoneModel();
	param_data.os = kClientInfo:getOSVersion();
	param_data.resolution = string.format("%d*%d",System.getScreenWidth(),System.getScreenHeight());
	param_data.imsi = kClientInfo:getImsi();
	param_data.operator = kClientInfo:getPhoneCardType();
	param_data.net = kClientInfo:getNetworkType();
	param_data.guid = kClientInfo:getGuid();
	param_data.nick = kClientInfo:getPhoneModel();
	param_data.appid = kClientInfo:getAppId();
	param_data.version = kClientInfo:getApkVersion();
	param_data.hall_version = kGameManager:getGameVersion(GameType.HALL);

	param_data.login_type = 1;
	param_data.utype = 1;
	param_data.sex = 0;
	param_data.phone = self.m_phoneNum or "";
	param_data.access_token = "";
	param_data.pwd="";
	param_data.verify_code=-1;
	param_data.verify_msg = "";

	param_data.param = "";

	return param_data;	
end

LoginLogic.__getDefaultExtramParam = function(self)
	local extraParam = {};
	extraParam.iccid = kClientInfo:getIccid();
	extraParam.imei  = kClientInfo:getImei();
	extraParam.imsi  = kClientInfo:getImsi();
	extraParam.timestamp = os.time();
	extraParam.safecode = kClientInfo:getSignDeviceId();
	extraParam.safecode_mac = kClientInfo:getSignMacAddress();
	extraParam.safecode_guid = kClientInfo:getSignGuid();
	extraParam.factoryid = kClientInfo:getFactoryId();
	extraParam.update_site_realtime = 1; --客户端是否支持登录接口更新请求入口配置（切服务器）
	if System.getPlatform() == kPlatformAndroid then
		--android 平台禁止模拟器登陆
		local isVirtual, flag = kClientInfo:isVirtual();
		extraParam.isSimulator = isVirtual;
		extraParam.simulatorCheckFlag = flag;
		if _DEBUG then
			local str = string.format("模拟器:%s  FLAG=%s", isVirtual and "true" or "false", flag);
			Toast.getInstance():showText(str ,50,30,kAlginLeft,"",26,255,255,255);
		end
	end

	return extraParam;
end

LoginLogic._sendLoginMsg = function(self,param_data)

	self:notify(LoginLogic.Delegate.onLogining);
	if kLoginDataInterface:getIsLoginSuccess() then 
		self:_switchAccount(param_data);
	else 
		self:_LoginAccount(param_data);
	end
end

LoginLogic._LoginAccount = function(self,param_data)
	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.Logining);

	self:_startTimeoutTimer(20*1000);

	self.m_socket:sendMsg(PHP_CORE_LOGIN,param_data,20*1000);
end

--切换账号
LoginLogic._switchAccount = function(self, param_data)
	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.Switching);
	kLoginDataInterface:setSwitchFlag(true);

	self.m_switchAccountParam = param_data;

	self:_startTimeoutTimer(10*1000);
	--client 发送切换账号的消息给server, server接收到后会断开和client的连接
	self.m_socket:sendMsg(LOGIN_SWITCH_ACCOUNT,{});

	--自己重新打开
	OnlineSocketManager.getInstance():reopenSocket();
end


LoginLogic.onLoginCallBack = function(self, isSucess, info)
	self:log("onLoginCallBack","isSucess = ",isSucess);
	self:_clearTimeoutTimer();

	local resultInfo = {};
	if not isSucess then
		self:log("onLoginCallBack", "failed for not isSuccess");
		resultInfo = info;

		self:uploadLoginErr(LoginConstants.eLoginError.ERR_TIME_OUT);
		self:uploadErrLog(LoginConstants.eServerError.SER_ERR_LOGIN_TIME_OUT);
	else
		if table.isEmpty(info.game) or table.isEmpty(info.user) or table.isEmpty(info.account) then
			self:log("onLoginCallBack", "failed for empty param");
			self:uploadLoginErr(LoginConstants.eLoginError.ERR_RETURN_DATA);
			self:uploadErrLog(LoginConstants.eServerError.SER_ERR_RETURN_DATA);
			isSucess = false;
			resultInfo = {};
		else
			self:log("onLoginCallBack", "success");			

			kUserInfoData:cleanup();
			kClientInfo:setRegionId(info.user.region);
			kLoginDataInterface:setLoginState(LoginConstants.eLoginState.None);
			local userInfo,gameInfo,accountInfo = self:_initLoginInfo(info.user,info.game,info.account);
			self:saveCurLoginInfo(userInfo,gameInfo,accountInfo);

			isSucess = true;
			self.m_switchAccountParam = nil;

            resultInfo = {["user"] = userInfo; ["game"] = gameInfo; ["account"] = accountInfo};
   		end
	end
	
	kLoginDataInterface:setForbidLogin(false);
	if isSucess then
		kLoginDataInterface:setLoginState(LoginConstants.eLoginState.LoginSuccess);
		self:onLoginSuccess(resultInfo.user, resultInfo.game, resultInfo.account);
	else
		if resultInfo and resultInfo.errorType == PhpManager.TIME_OUT then
			self:onLoginTimeout();
		else
			kLoginDataInterface:setLoginState(LoginConstants.eLoginState.LoginFailed);
			self:onLoginFailed(resultInfo);
		end
	end

	self.m_loginAccount = nil;
	kLoginDataInterface:setSwitchFlag(false);

	return true;
end

LoginLogic.onLoginSuccess = function(self,userinfo,gameinfo,accountinfo)	
	self:log("onLoginSuccess");
	self:uploadErrLog();

	GetuiInfo.getInstance():uploadClientIdToPhp();

	--清除数据
	self:__cleanUpCacheData();

	HallDataInterface.getInstance():setSupportSilverState(userinfo.silverCrystalFlag);

	self:__saveMoney();
	self:notify(LoginLogic.Delegate.onLoginSuccess,userinfo, gameinfo, accountinfo);
	
	--请求数据
	self:__requestData(userinfo);

	if System.getPlatform() == kPlatformIOS then
	    --检查ios支付未完成的数据
	    NativeEvent.getInstance():checkUnfinishIAP();
	end

	QRUtil.getInstance():createQR(QRUtil.eQRType.BIND_ANGECY_USERINFO, 150, {cid = userinfo.cid, sex = userinfo.sex, 
		nick = userinfo.nick, region = userinfo.region, avatar_m = userinfo.avatar_m})

end

LoginLogic.__cleanUpCacheData = function(self)
	--清除缓存
	TaskRewardDataInterface.cleanup();
	BroadcastDataInterface.cleanup();
	CommunityDataInterface.cleanup();
	MessageDataInterface.cleanup();
	BankruptDataInterface.cleanup();
	DiamondShopDataInterface.cleanup();
	HallDataInterface.cleanup();
    BackpackDataInterface.cleanup();
    GoldBarDataInterface.cleanup();

	GoodsListInterface.cleanup();
	kPropManager:clear()
	HallDataInterface.getInstance():cleanup();
	ActivityDataInterface.getInstance():cleanup();
	RedEnvelopDataInterface.getInstance():cleanup();
end

LoginLogic.__requestData = function(self, userinfo)
	--需要立刻请求的数据，不需要延迟
	TaskRewardDataInterface.getInstance():getSigninInfos();
	CommunityDataInterface.getInstance():requestFriendDes(userinfo.friend_des);

	local requestQueue = {};
	local function pushRequestToQueue(delay, obj, func, ...)
		local item = {deadTime = System.getBootTime() + delay, obj = obj, func = func, args = {...} };
		table.insert(requestQueue, item);
	end

	--核心数据
	pushRequestToQueue(100, HallDataInterface.getInstance(), "requestGetCoreInitInfo");
	--底部按钮
	pushRequestToQueue(100, HallDataInterface.getInstance(), "getBottomButtonConfig", GameType.HALL);
	--模块列表
	pushRequestToQueue(100, kGameManager, "requestModuleList");
	--代理商配置
	pushRequestToQueue(100, AgencyDataInterface.getInstance(), "requestData", true);
	--金条兑换配置
	pushRequestToQueue(100, GoldBarDataInterface.getInstance(), "getGoldBarConfig");
	--我的道具信息
	pushRequestToQueue(500, kPropManager, "requestPropInfo");
	--游戏玩牌记录
	pushRequestToQueue(500, kUserInfoData, "getGameRecordData", kGameManager:getCurGameId());
	--保险箱配置
	pushRequestToQueue(500, SafeBoxDataInterface.getInstance(), "requestSafeBoxConfig");
	--物品配置
	pushRequestToQueue(1000, RechargeDataInterface.getInstance(), "requestGoodsClassifyConfig");
	--分享配置
	pushRequestToQueue(1500, ShareDataInterface.getInstance(), "requestShareInfo");
	--物品箱
	pushRequestToQueue(1500, BackpackDataInterface.getInstance(), "getBagList");
	--每日任务
	pushRequestToQueue(1500, TaskRewardDataInterface.getInstance(), "getDayTaskList", true);	
	--活动数目
	pushRequestToQueue(1500, ActivityDataInterface.getInstance(), "requestActivityCount");
	--浮动球配置
	pushRequestToQueue(2000, FloatBallDataInterface.getInstance(), "requestFloatBallConfig");
	--私信
	pushRequestToQueue(2000, MessageDataInterface.getInstance(), "requestMessageList");
	--私人房配置
	pushRequestToQueue(2000, PrivateRoomDataInterface.getInstance(), "requestPrivateConfig");
	--经验等级配置
	pushRequestToQueue(2000, kUserLevelConfigInterface, "getUserLevelConfig");
	--文本配置
	pushRequestToQueue(3000, TxtMgr.getInstance(), "requestData");
	--小游戏开关
	pushRequestToQueue(3000, SlotMachineInfo.getInstance(), "requestGameSwitch");
	--猜拳开关
	pushRequestToQueue(3000, MoraGameDataInterface.getInstance(), "requestSwitch");
	--节日图片配置
	pushRequestToQueue(4000, HolidaysBgDataInterface.getInstance(), "requestHolidaysBg");
    --客服反馈 
    pushRequestToQueue(4000, SuggestionDataInterface.getInstance(), "getFeedbackList");

	--the purpose is avoid much data back at the same time cause consume cpu high
	self:__releaseDelayAnim();
	self.m_delayAnim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 100, -1);
	self.m_delayAnim:setDebugName("LoginLogic|self.m_delayAnim");
	self.m_delayAnim:setEvent(self, function(self)
		local curTime = System.getBootTime();
		for k, v in pairs(requestQueue) do
			if k and v and curTime >= v.deadTime then
				v.obj[v.func](v.obj, unpack(v.args));
				requestQueue[k] = nil;
			end
		end

		if table.isEmpty(requestQueue) then
			self:__releaseDelayAnim();
		end
	end);
end

LoginLogic.__releaseDelayAnim = function(self)
	self:log("__releaseDelayAnim");
	delete(self.m_delayAnim);
	self.m_delayAnim = nil;
end

--存钱
LoginLogic.__saveMoney = function(self)
	local totalMoneyDic = new(Dict,"TOTALMONEY");
	totalMoneyDic:load();
	totalMoneyDic:setDouble("totalMoney", kUserInfoData:getTotalMoney() );
	totalMoneyDic:save();
	delete(totalMoneyDic);
	totalMoneyDic = nil;
end 

LoginLogic.onLoginFailed = function(self,errInfo)
	self:log("onLoginFailed", "errInfo = ", errInfo, " curLoginType = ", kLoginDataInterface:getCurLoginType() );
	self:uploadLoginErr(errInfo and errInfo.errorType);
	self:uploadErrLog(LoginConstants.eServerError.SER_ERR_LOGIN_TIME_FAIL);

	self:_clearTimeoutTimer();

	local errorType = errInfo and errInfo.errorType;
    if errorType == LoginConstants.eLoginFailErr.ERR_MOVE_SERVER then
		local extraInfo = errInfo.extraInfo or {};
		ServerConfig.getInstance():setConfig(nil, extraInfo.site_config);

	elseif errorType == LoginConstants.eLoginFailErr.ERR_STOP_SERVER then
		--计划性停服
        self:log("onLoginFailed", "LoginConstants.eLoginFailErr.ERR_STOP_SERVER");

        kLoginDataInterface:setLoginState(LoginConstants.eLoginState.ServerStop);
        AnnounceDataInterface.getInstance():requestStopServer(AnnounceDataInterface.eStatusType.PLAN);
	end

	local byPassWordAccount = nil;
	if kLoginDataInterface:getCurLoginType() == LoginConstants.loginType.BoyaaPassportLogin then
		self:log("onLoginFailed", " isByPsptLogin");
		--登录失败后，删除通行证登录信息(bid,access_token，也即更新，保留account+psd是为了在登录框里有个选项，用户体验更好)
		kLoginDataInterface:addLoginInfo(self.m_loginAccount, kLoginDataInterface:getPsdByAccount(self.m_loginAccount) );
		byPassWordAccount = self.m_loginAccount;
	else
		--登录失败时，如果是游客，则清空上次登录信息
		kLoginDataInterface:setLastLoginInfo({});
	end

	self:notify(LoginLogic.Delegate.onLoginFailed, errInfo, byPassWordAccount);
end

LoginLogic.onSocketReConnected = function(self)
	self:log("onSocketReConnected");
	--经测试，在win32上时切换账号时，会迅速的接收到这个消息，但在android上则会收到连接失败的消息
	--目测是2个socket库不一致
	self:__checkSwitchAccount();
end

LoginLogic.onSocketConnectSuccess = function(self)
	self:log("onSocketConnectSuccess");
	self:__checkSwitchAccount();
end

LoginLogic.__checkSwitchAccount = function(self)
	self:log("enter __checkSwitchAccount");
	if self:__isAccountSwitching() then 
		self:log("begin __checkSwitchAccount","during switchAccount ==> _LoginAccount param = ", self.m_switchAccountParam);
		local switchData = self.m_switchAccountParam;
		self.m_switchAccountParam = nil;	
		self:_LoginAccount(switchData);
	end
end

LoginLogic.__isAccountSwitching = function(self)
	self:log("__isAccountSwitching", "loginstate = ", kLoginDataInterface:getLoginState() );
	return kLoginDataInterface:getLoginState() == LoginConstants.eLoginState.Switching and self.m_switchAccountParam;
end

LoginLogic.s_socketCmdFuncMap = {
	[PHP_CORE_LOGIN] 		         	    = LoginLogic.onLoginCallBack;

	[SOCKET_CONNECT_SUCCESS]                = LoginLogic.onSocketConnectSuccess;
    [SOCKET_RECONNECT_SUCCESS] 				= LoginLogic.onSocketReConnected;

    [PHP_LOGIN_LOGIC_checkReg] 					= LoginLogic.onCheckIsRegisterCallBack;
    [PHP_LOGIN_sendResetToken]	 			= LoginLogic.onGetVerifyCodeCallBack;
    [PHP_LOGIN_resetPwd]					= LoginLogic.onResetPswdCallBack
};

-------------------------------------------------------------------------------------------------
LoginLogic._startTimeoutTimer = function(self, time)
	self:log("_startTimeoutTimer");
	self:_clearTimeoutTimer();
	
	time = time or 10*1000;
	self.m_timeOutTimer:startTimer(LoginLogic.SendLogin_Timer,self.onLoginTimeout,time);
end 

LoginLogic._clearTimeoutTimer = function(self)
	self.m_timeOutTimer:clearTimer(LoginLogic.SendLogin_Timer);
end

LoginLogic.onLoginTimeout = function(self)
	self:log("onLoginTimeout");
	self:uploadLoginErr(LoginConstants.eLoginError.ERR_TIME_OUT);
	self:uploadErrLog(LoginConstants.eServerError.SER_ERR_LOGIN_TIME_OUT);

	self:_clearTimeoutTimer();
	--执行给界面，做逻辑处理
	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.LoginFailed);
	self:notify(LoginLogic.Delegate.onLoginTimeout);

	kLoginDataInterface:setSwitchFlag(false);
end

LoginLogic._initLoginInfo = function(self,user,game,account)
	user = table.verify(user);
	game = table.verify(game);
	account = table.verify(account);

	user.mid = number.valueOf(user.mid, -1);
	user.appid = number.valueOf(user.appid, -1);
	user.nick = user.nick or "";
	user.avatar_s = user.avatar_s or "";
	user.avatar_m = user.avatar_m or "";
	user.avatar_b = user.avatar_b or "";
	user.status = number.valueOf(user.status, -1);
	user.lastlogin = number.valueOf(user.lastlogin);
	user.sex = number.valueOf(user.sex);
	user.join = number.valueOf(user.join);
	user.ssid = user.ssid or "";
	user.hometown = user.hometown;
	user.city = user.city;
	user.platformid = user.platformid or "";
	user.byacc = user.byacc;

	game.exp = number.valueOf(game.exp);
	game.money = number.valueOf(game.money);
	game.safebox = number.valueOf(game.safebox);
	game.totalmoney = number.valueOf(game.totalmoney);
	game.bdiamond = number.valueOf(game.bdiamond);
	game.silver = number.valueOf(game.silver);

	account.access_token = account.access_token or "";
	account.bid = account.bid;
	account.login_type = number.valueOf(account.login_type);
	account.guid = account.guid or "";
	account.register = number.valueOf(account.register);

	account.utype = number.valueOf(account.utype);

	return user, game, account;
end

LoginLogic.saveCurLoginInfo = function(self,userInfo,gameInfo,accountInfo)
	self:log("saveCurLoginInfo");
	if not table.isTable(userInfo) or 
	   not table.isTable(gameInfo) or 
	   not table.isTable(accountInfo) then

	   self:log("saveCurLoginInfo", "failed");
	   return;
	end

	kUserInfoData:setNotifyStatus(false);

	kUserInfoData:setUserId(userInfo.mid);
    kUserInfoData:setUserCid(userInfo.cid or userInfo.mid);
	kUserInfoData:setNickname(userInfo.nick);
	kUserInfoData:setAppId(userInfo.appid);
	kUserInfoData:setUType(userInfo.utype);
	kUserInfoData:setAvatar_s(userInfo.avatar_s);
	kUserInfoData:setAvatar_m(userInfo.avatar_m);
	kUserInfoData:setAvatar_b(userInfo.avatar_b);

	local isForbidGuestLogin = (userInfo.is_guide_by == 1) and true or false; 
	kLoginDataInterface:setShieldGuestLogin(isForbidGuestLogin);

	kUserInfoData:setStatus(userInfo.status);
	kUserInfoData:setLastLoginTime(userInfo.lastlogin);
	kUserInfoData:setSex(userInfo.sex);
	kUserInfoData:setCity(userInfo.city);
	kUserInfoData:setRegisterTime(userInfo.join);
	kUserInfoData:setSsid(userInfo.ssid);

	kUserInfoData:setExp(gameInfo.exp);
	kUserInfoData:setMoney(gameInfo.money);
	kUserInfoData:setSafeBoxCurMoney(gameInfo.safebox);
	kUserInfoData:setDiamond(gameInfo.bdiamond);
	kUserInfoData:setCrystal(gameInfo.crystal);
    kUserInfoData:setSafeBoxCurCrystal(gameInfo.crystalsafebox);

	kUserInfoData:setHometown(userInfo.hometown);
	kUserInfoData:setIsCurRegister(accountInfo.register == 1);

	kClientInfo:setPhoneCardType(accountInfo.operator);

	kUserInfoData:setNotifyStatus(true);

	dict_set_int(kDFQPGame , kUserId , kUserInfoData:getUserId());
	dict_save(kDFQPGame);

	kPropManager:clear();

	local data = {};
	data.imsi = kClientInfo:getImsi();
	data.mid = userInfo.mid;
	data.byacc = userInfo.byacc;
	data.nick = userInfo.nick;
	data.sex = userInfo.sex;
	data.uType = accountInfo.utype;
	data.token = accountInfo.access_token;
	data.bid = accountInfo.bid;
	data.phoneNum = accountInfo.phone;
	data.loginType = accountInfo.login_type;

	kLoginDataInterface:setLastLoginInfo(data); 

	self:log("saveCurLoginInfo", "data = ", data);
	if data.uType == LoginConstants.uType.BoyaaPassport then 
		kLoginDataInterface:addLoginInfo(userInfo.byacc,self.m_loginPswd,accountInfo.bid,accountInfo.access_token);		
	end
end 

----------------------------------------错误日志上报----------------------------------
LoginLogic.uploadLoginErr = function(self, errorType)
end

--上报错误日志到后台
LoginLogic.uploadErrLog = function(self, errType)
end
