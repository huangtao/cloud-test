require("common/nativeEvent")

SyncNativeEvent = class();

SyncNativeEvent.getInstance = function()
	if not SyncNativeEvent.s_instance then 
		SyncNativeEvent.s_instance = new(SyncNativeEvent);
	end
	return SyncNativeEvent.s_instance;
end

SyncNativeEvent.ctor = function(self)
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
	self:resetArguments();
end

SyncNativeEvent.dtor = function(self)
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

SyncNativeEvent.resetArguments = function(self)
	self.m_callbackStatus = nil; -- 回传状态
	self.m_callbackResult = nil; -- 用于回传值
end

SyncNativeEvent.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

SyncNativeEvent.onGetResult = function(self,status,jsonTable)
	self.m_callbackStatus = status;
	self.m_callbackResult = jsonTable;
end
-------------------------------------------------- Android,IOS, WinPhone8 --------------------------------------------------
if NativeEvent.s_platform == kPlatformAndroid or NativeEvent.s_platform == kPlatformIOS or NativeEvent.s_platform == kPlatformWp8 then

-- 获取php压缩格式
SyncNativeEvent.syncGetPhpCompressFormat = function(self)
	return "gzip";
end

SyncNativeEvent.syncUnBase64UngzipCheckJsonFormatForLua = function(self, content)
	self:resetArguments();
	local params = {};
	params.content = content;
	local json_data = json.encode(params);
	NativeEvent.getInstance():callNativeEvent("syncUnBase64UngzipCheckJsonFormatForLua",json_data);

	-- return self.m_callbackStatus, self.m_callbackResult 同
	-- flag 是否为json: kTrue(1)为是， kFalse(0)为否
	-- result content->反base64->ungzip中一个
	local ret = "";
	local isSuccess = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "flag");
		if flag == kTrue then
			ret = GetStrFromJsonTable(self.m_callbackResult, "result");
			isSuccess = true;
		end
	end
	Log.v("SyncNativeEvent.syncUnBase64UngzipCheckJsonFormatForLua","ret =",ret);
	return isSuccess,ret;
end

SyncNativeEvent.syncZipBase64CheckJsonFormatForLua = function(self,content)
	self:resetArguments();
	local params = {};
	params.content = content;
	local json_data = json.encode(params);
	NativeEvent.getInstance():callNativeEvent("syncZipBase64CheckJsonFormatForLua",json_data);

	-- return self.m_callbackStatus, self.m_callbackResult 同
	-- flag 是否为json: kTrue(1)为是， kFalse(0)为否
	-- result content->反base64->ungzip中一个
	local ret = "";
	local isSuccess = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "flag");
		if flag == kTrue then
			ret = GetStrFromJsonTable(self.m_callbackResult, "result");
			isSuccess = true;
		end
	end
	Log.v("SyncNativeEvent.syncZipBase64CheckJsonFormatForLua","ret =",ret);
	return isSuccess,ret;
end

-- 同步判断是否支持微信支付
SyncNativeEvent.syncIsWXAppSupportPaymentForLua = function(self)
	if kPlatformIOS == NativeEvent.s_platform then
		return true; --ios还未实现native方法，所以暂时先返回true;
	end

	self:resetArguments();
	NativeEvent.getInstance():isWXAppSupportPaymentForLua();

	local result = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "flag");
		if flag == kTrue then
			result = true;
		else
			result = false;
		end
	end
	return result;
end

-- 同步判断微信是否支持分享到朋友圈
SyncNativeEvent.syncIsWXAppSupportSendToFriendsCirCleForLua = function(self)
	if kPlatformIOS == NativeEvent.s_platform then
		return true; --ios还未实现native方法，所以暂时先返回true;
	end

	self:resetArguments();
	NativeEvent.getInstance():weixinCheckSupportSendToFriendsCirCleForLua();

	local result = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "flag");
		if flag == kTrue then
			result = true;
		else
			result = false;
		end
	end
	return result;
end

--同步返回第三方是否支持切换账号
SyncNativeEvent.syncIsThirdPartySupportSwitchAccount = function(self, loginTag)
	if kPlatformIOS == NativeEvent.s_platform then
		return false;
	end

	self:resetArguments();
	Log.v("SyncNativeEvent.syncIsThirdPartySupportSwitchAccount");
	NativeEvent.getInstance():isGodSDKSupportSwitchAccount(loginTag);
	local result = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "isSupport");
		Log.v("SyncNativeEvent.syncIsThirdPartySupportSwitchAccount", "flag = ", flag);
		if flag == kTrue then
			result = true;
		else
			result = false;
		end
	end
	return result;
end

--同步返回第三方是否支持退出
SyncNativeEvent.syncIsThirdPartySupportLogout = function(self)
	if kPlatformIOS == NativeEvent.s_platform then
		return false;
	end

	self:resetArguments();
	Log.v("SyncNativeEvent.syncIsThirdPartySupportLogout");
	NativeEvent.getInstance():isGodSDKSupportQuit();

	local result = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "isSupport");
		Log.v("SyncNativeEvent.syncIsThirdPartySupportLogout", "flag = ", flag);
		if flag == kTrue then
			result = true;
		else
			result = false;
		end
	end
	return result;
end

SyncNativeEvent.s_nativeEventFuncMap = {
	["syncUnBase64UngzipCheckJsonFormatForLua"] 				= SyncNativeEvent.onGetResult,
	["syncZipBase64CheckJsonFormatForLua"]						= SyncNativeEvent.onGetResult,
	["isWXAppSupportPaymentForLua"]								= SyncNativeEvent.onGetResult,
	["weixinCheckSupportSendToFriendsCirCleForLua"]				= SyncNativeEvent.onGetResult,
	["isThirdPartySupportSwitchAccount"]                        = SyncNativeEvent.onGetResult;
	["isGodSDKSupportQuit"]                                     = SyncNativeEvent.onGetResult;
};

else

-------------------------------------------------- Win32--------------------------------------------------
SyncNativeEvent.syncGetPhpCompressFormat = function(self)
	return "gzip";
end

SyncNativeEvent.syncUnBase64UngzipCheckJsonFormatForLua = function(self, content)
	self:resetArguments();
	local params = {};
	params.content = content;
	local json_data = json.encode(params);
	NativeEvent.getInstance():callNativeEvent("syncUnBase64UngzipCheckJsonFormatForLua",json_data);

	-- return self.m_callbackStatus, self.m_callbackResult 同
	-- flag 是否为json: kTrue(1)为是， kFalse(0)为否
	-- result content->反base64->ungzip中一个
	local ret = "";
	local isSuccess = false;
	if self.m_callbackStatus and self.m_callbackResult then
		local flag = GetNumFromJsonTable(self.m_callbackResult, "flag");
		if flag == kTrue then
			ret = GetStrFromJsonTable(self.m_callbackResult, "result");
			isSuccess = true;
		end
	end

	return isSuccess,ret;
end

SyncNativeEvent.syncZipBase64CheckJsonFormatForLua = function(self,content)
end

SyncNativeEvent.syncIsWXAppSupportPaymentForLua = function(self)
	return false;
end

SyncNativeEvent.syncIsWXAppSupportSendToFriendsCirCleForLua = function(self)
	return false;
end

SyncNativeEvent.syncIsThirdPartySupportSwitchAccount = function(self, loginTag)
	return false;
end

SyncNativeEvent.syncIsThirdPartySupportLogout = function(self)
	return false;
end

SyncNativeEvent.s_nativeEventFuncMap = {
	["syncUnBase64UngzipCheckJsonFormatForLua"] 				= SyncNativeEvent.onGetResult,
};

end