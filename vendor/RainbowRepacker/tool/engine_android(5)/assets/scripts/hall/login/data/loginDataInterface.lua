require("gameData/dataInterfaceBase");
require("hall/login/data/loginConstants");
require("hall/login/data/accountHistory");
require("hall/login/data/imsiPhoneHistory");
require("hall/login/data/lastLoginInfo");
require("gameData/clientInfo");

LoginDataInterface = class(DataInterfaceBase);

LoginDataInterface.Delegate = {
	onServerRequestReLogin = "onServerRequestReLogin";
	onLoginStateChanged = "onLoginStateChanged";
};

LoginDataInterface.getInstance = function()
	if not LoginDataInterface.s_instance then
		LoginDataInterface.s_instance = new(LoginDataInterface);
	end
	
	return LoginDataInterface.s_instance;
end

LoginDataInterface.releaseInstance = function()
	delete(LoginDataInterface.s_instance);
	LoginDataInterface.s_instance = nil;
end

LoginDataInterface.ctor = function(self)
	self:_initData();
	kClientInfo:setObserver(self);
end

LoginDataInterface.dtor = function(self)
	kClientInfo:clearObserver(self);

	delete(self.m_accountHistory);
	self.m_accountHistory = nil;

	delete(self.m_imsiPhoneHistory);
	self.m_imsiPhoneHistory = nil;

	delete(self.m_lastLoginInfo);
	self.m_lastLoginInfo = nil;
end

LoginDataInterface._initData = function(self)
	self.m_accountHistory = new(AccountHistory,self);
	self.m_imsiPhoneHistory = new(ImsiPhoneHistory,self);		
	self.m_lastLoginInfo = new(LastLoginInfo,self);
end
-----------------------------------------------------------------------------------------
--玩家登录状态
LoginDataInterface.setLoginState = function(self,state)
	Log.v("LoginDataInterface.setLoginState state =", state, " self.m_loginState = ", self.m_loginState);
	if state == LoginConstants.eLoginState.MultiDeviceLogin then
		Log.eWF("MultiDeviceLogin ","LoginDataInterface.setLoginState MultiDeviceLogin");
	end 

	if state == LoginConstants.eLoginState.ServerStop then
		Log.v("LoginDataInterface.setLoginState server stop");
		OnlineSocketManager.getInstance():setServerStoped();
	end

	if self.m_loginState ~= state then
		Log.v("LoginDataInterface.setLoginState enter");
		local lastLoginState = self.m_loginState;
		self.m_loginState = state;
		self:notify(LoginDataInterface.Delegate.onLoginStateChanged, self.m_loginState, lastLoginState);
	end
end

LoginDataInterface.getLoginState = function(self)
	return self.m_loginState or LoginConstants.eLoginState.None;
end

LoginDataInterface.getIsLoging = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.Logining or loginState == LoginConstants.eLoginState.Switching;
end

LoginDataInterface.getIsLoginSuccess = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.LoginSuccess;
end

LoginDataInterface.getIsMultiLogin = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.MultiDeviceLogin;
end

LoginDataInterface.getIsPhpKickout = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.PhpKickout;	
end

LoginDataInterface.getIsPhpSessionTimeOut = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.SessionTimeOut;	
end

LoginDataInterface.getIsOffline = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.Offline;
end

LoginDataInterface.getIsStopServer = function(self)
	local loginState = self:getLoginState();
	return loginState == LoginConstants.eLoginState.ServerStop;
end

LoginDataInterface.getNetWorkAvalible = function(self)
	return kClientInfo:getNetWorkAvalible();
end

LoginDataInterface.openNetSettings = function(self)
	NativeEvent.getInstance():openNetSettings();
end


--server通知重新登录
LoginDataInterface.onServerRequestReLogin = function(self)
	self:setLoginState(LoginConstants.eLoginState.None);
	self:notify(LoginDataInterface.Delegate.onServerRequestReLogin);
end
-----------------------------------------------------------------------------------------
--获取账户登录的历史记录
LoginDataInterface.getAccountHistory = function(self)		
	return table.verify(self.m_accountHistory:getAccount());
end

--根据账号获取密码
LoginDataInterface.getPsdByAccount = function(self, loginAccount)
	local data = self:getAccountHistory();
	for i, v in ipairs(data) do
		if v and v.loginAccount == loginAccount then
			return v.loginPsd;
		end
	end

	return "";
end

--新增账户登录信息
LoginDataInterface.addLoginInfo = function(self,loginAccount,loginPsd,bid,access_token)		
	if not loginAccount or (loginAccount == "") then
		return; 	
	end 

	local data = self:getAccountHistory();
	for i,v in ipairs(data) do
		if v and v.loginAccount == loginAccount then
			table.remove(data,i);
			break;
		end
	end

	local temp = {["loginAccount"]=loginAccount,["loginPsd"]=loginPsd,["bid"]=bid,["access_token"]=access_token};
	table.insert(data,1,temp);

	self.m_accountHistory:updateData(true,data);
end

--删除账户登录信息
LoginDataInterface.delLoginInfoByAccount = function(self,phone)		
	phone = phone or "";
	phone = string.trim(phone);
	if phone == "" then
		return;
	end
	
	local isExsit,key = self:checkIsExsitLoginInfo(phone);	
	if isExsit then
		local data = self:getAccountHistory();
		table.remove(data,key);
		self.m_accountHistory:updateData(true,data);
	end
end

LoginDataInterface.getLoginInfoByAccount = function(self,account)
	local _,_,value = self:checkIsExsitLoginInfo(account);
	return table.verify(value);
end

--根据账户检查是否存在，如果存在则返回该条记录
LoginDataInterface.checkIsExsitLoginInfo = function(self,account)
	local isExsit = false;
	local key;
	local temp = {};
	local accountList = self:getAccountHistory();
	for i,v in ipairs(accountList) do
		if type(v) == "table" then
			if v.loginAccount == account then
				isExsit = true;
				key = i;
				temp = v;
				break;
			end 
		end
	end

	return isExsit,key,temp;
end
---------------------------------------------------------------
LoginDataInterface.getImsiPhoneHistory = function(self)
	return table.verify(self.m_imsiPhoneHistory:getImsiPhone());
end
LoginDataInterface.addImsiPhone = function(self,imsi,phone)	
	imsi = imsi or "";
	phone = phone or "";
	imsi = string.trim(imsi);
	phone = string.trim(phone);
	if (imsi == "") or (phone == "") then
		return; 	
	end 

	local data = self:getImsiPhoneHistory();
	local isInList = false;
	for i,v in ipairs(data) do
		if v and v.imsi == imsi then
			if v.phone == phone then
				isInList = true;
			else
				table.remove(data,i);
			end
			break;
		end
	end

	if not isInList then
		local temp = {["imsi"]=imsi,["phone"]=phone};
		table.insert(data,temp);

		self.m_imsiPhoneHistory:updateData(true,data);
	end
end

--获取手机号码
LoginDataInterface.getRecordPhoneNumByImsi = function(self,readImsi)	
	readImsi = readImsi or "";
	readImsi = string.trim(readImsi);
	if readImsi ~= "" then
		local imsiPhoneTable = self:getImsiPhoneHistory();
		for i,v in ipairs(imsiPhoneTable) do
			if v.imsi == readImsi then
				return v.phone;
			end
		end
	end
	return "";
end

--获取imsi
LoginDataInterface.getRecordImsiByPhoneNum = function(self,phone)	
	phone = phone or "";
	phone = string.trim(phone);	
	if phone ~= "" then
		local imsiPhoneTable = self:getImsiPhoneHistory();
		for i,v in ipairs(imsiPhoneTable) do
			if v.phone == phone then
				return v.imsi;
			end
		end
	end
	return "";
end

--判断是否换了sim卡,true改变了，fasle未改变 ，该方法不是很准
LoginDataInterface.isChangeSimCard = function(self,phone)	
	phone = phone or "";
	phone = string.trim(phone);
	if phone == "" then
		return true;
	end

	local curPhone = kClientInfo:getPhoneNum();
	curPhone = curPhone or "";
	curPhone = string.trim(curPhone);
	if curPhone ~= "" then
		return not (phone == curPhone)--能读取到手机号
	else

		local readImsi = kClientInfo:getImsi();
		readImsi = readImsi or "";
		readImsi = string.trim(readImsi);
		if readImsi ~= "" then
			--检查历史记录
			local imsiPhoneTable = self:getImsiPhoneHistory();
			for i,v in ipairs(imsiPhoneTable) do
				if v.imsi == readImsi then
					return not (v.phone == phone);
				end
			end
		end
	end

	return false;
end

-------------------------------------------------------------------------------
LoginDataInterface.getLastLoginInfo = function(self)
	return table.verify(self.m_lastLoginInfo:getLastLoginInfo());
end

LoginDataInterface.setLastLoginInfo = function(self,data)
	self.m_lastLoginInfo:updateData(true,data);
end

LoginDataInterface.clearLastLoginInfo = function(self)
	self.m_lastLoginInfo:clearLastLoginInfo();
end

LoginDataInterface.getLastMid = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.mid or 0;
end

LoginDataInterface.getLastCid = function(self)
    local lastInfo = self:getLastLoginInfo();
    return lastInfo.cid or 0;
end

LoginDataInterface.getLastUType = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.uType or -1;
end

LoginDataInterface.getLastImsi = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.imsi or "";
end

LoginDataInterface.getLastByacc = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.byacc or "";
end

LoginDataInterface.getLastNickName = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.nick or "";
end

LoginDataInterface.getLastToken = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.token or "";
end

LoginDataInterface.getLastBid = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.bid or "";
end

LoginDataInterface.getLastPhoneNum = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.phoneNum or "";
end

LoginDataInterface.getLastSex = function(self)
	local lastInfo = self:getLastLoginInfo(); 
	return lastInfo.sex or 0;
end

LoginDataInterface.setCurLoginType = function(self, loginType)
	Log.v("LoginDataInterface.setCurLoginType loginType = ", loginType);
	self.m_curLoginType = loginType;
end

LoginDataInterface.getCurLoginType = function(self)
	return self.m_curLoginType;
end

-------------------------------------------------------------------------------
--检查手机号码是否是获取到的手机号
LoginDataInterface.isSelfPhone = function(self,phone)	
	local curPhoneNum = kClientInfo:getPhoneNum();
	if curPhoneNum == phone then 
		return string.checkPhoneNumber(phone);
	else 
		return false;
	end 
end
----------------------------------------------------------------------------------

--屏蔽游客登录相关逻辑

--是否屏蔽游客登录
LoginDataInterface.setShieldGuestLogin = function(self, isShiledGuestLogin)
	self.m_isShiledGuestLogin = isShiledGuestLogin;
end

LoginDataInterface.isShiledGuestLogin = function(self)
	-- return self.m_isShiledGuestLogin;
	return true; --690屏蔽游客登录入口
end

--是否强制登录
LoginDataInterface.setForbidLogin = function(self, isForbidLogin)
	self.m_isForbidLogin = isForbidLogin;
end

LoginDataInterface.isForbidLogin = function(self)
	return self.m_isForbidLogin;
end

-----------------------------------------------------------------------------------
-- 设置切换账号标志
LoginDataInterface.setSwitchFlag = function(self, flag)
	self.m_switchFlag = flag;
end

-- 获取切换账号标志
LoginDataInterface.getSwitchFlag = function(self, flag)
	return self.m_switchFlag;
end

kLoginDataInterface = LoginDataInterface.getInstance();