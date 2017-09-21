--[[
    联运版本接入管理类
]]


require("common/nativeEvent");
require("common/syncNativeEvent");
require("hall/login/data/loginConstants");
require("hall/login/data/thirdPartyLoginParams");

ThirdPartyLoginManager = class(DataInterfaceBase)

ThirdPartyLoginManager.Delegate = {
    onThirdPartyLoginCallBack = "onThirdPartyLoginCallBack";
    onThirdPartySwitchAccountCallBack = "onThirdPartySwitchAccountCallBack";
}

ThirdPartyLoginManager.UNKNOWN = "unknown";

ThirdPartyLoginManager.DICT_NAME = "ThirdPartyLogin";
ThirdPartyLoginManager.KEY_LOGINTAG = "LoginTag";
ThirdPartyLoginManager.KEY_TOKEN = "Token";
ThirdPartyLoginManager.KEY_FLAG = "Flag";
ThirdPartyLoginManager.KEY_PARAMS = "ExtraParams";

ThirdPartyLoginManager.getInstance = function()
    if not ThirdPartyLoginManager.s_instance then
        ThirdPartyLoginManager.s_instance = new(ThirdPartyLoginManager);
    end

    return ThirdPartyLoginManager.s_instance;
end

ThirdPartyLoginManager.ctor = function(self)
    self.m_thirdPartyLoginParams = new(ThirdPartyLoginParams);
    EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

ThirdPartyLoginManager.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

--@brief 获取用户登录类型
ThirdPartyLoginManager.getThirdPartyLoginType = function(self)
    self:log("getThirdPartyLoginType");
    -- return LoginConstants.loginType.HuaWeiLogin;
    return nil;
end

--@brief 获取第三方登录名称
ThirdPartyLoginManager.getThirdPartyLoginName = function(self, loginType)
    loginType = loginType or self:getThirdPartyLoginType();
    local config = self:__getLoginConfigByLoginType(loginType);
    return config and config.name or "";
end

--@brief 判断是否进行第三方登录流程
ThirdPartyLoginManager.isThirdPartySupportLogin = function(self)
    self:log("isThirdPartySupportLogin");
   local config = self:__getLoginConfigByLoginType( self:getThirdPartyLoginType() );
   return config and config.isSupportLogin;
end

--@brief 请求第三方登录
--@param loginType 用户登录类型
ThirdPartyLoginManager.requestLogin = function(self, loginType)
    self:log("requestLogin", "loginType = ", loginType);
    if System.getPlatform() ~= kPlatformAndroid then
        return;
    end

    loginType = loginType or self:getThirdPartyLoginType();
    local loginTag = self:__getLoginTagByLoginType(loginType);
    if not loginTag then
        return;
    end

    NativeEvent.getInstance():requestGodSDKLogin(loginTag);
end

--@brief 是否支持切换账号
--@param loginType 用户登录类型
ThirdPartyLoginManager.isSupportSwitchAccount = function(self, loginType)
    self:log("isSupportSwitchAccount", "loginType = ", loginType);
    loginType = loginType or self:getThirdPartyLoginType();
    local loginTag = self:__getLoginTagByLoginType(loginType);
    if not loginTag then
        return false;
    end

    return SyncNativeEvent.getInstance():syncIsThirdPartySupportSwitchAccount(loginTag);
end

--@brief 请求第三方切换账号
--@param loginType 用户登录类型
ThirdPartyLoginManager.requestSwitchAccount = function(self, loginType)
    self:log("requestSwitchAccount", "loginType = ", loginType);
    if System.getPlatform() ~= kPlatformAndroid then
        return;
    end

    loginType = loginType or self:getThirdPartyLoginType();
    local loginTag = self:__getLoginTagByLoginType(loginType);
    if not loginTag then
        return;
    end

    NativeEvent.getInstance():requestGodSDKSwitchAccount(loginTag);
end

--@brief 是否支持登出
ThirdPartyLoginManager.isSupportLogout = function(self)
    self:log("isSupportLogout");
    return SyncNativeEvent.getInstance():syncIsThirdPartySupportLogout();
end

--@brief 请求退出游戏
ThirdPartyLoginManager.requestLogout = function(self)
    self:log("requestLogout");
    if System.getPlatform() ~= kPlatformAndroid then
        return;
    end
    
    NativeEvent.getInstance():requestGodSDKQuit();
end

--@brief 第三方登录回调
ThirdPartyLoginManager.onThirdPartyLoginCallBack = function(self, status, jsonTable)
    self:__parseLoginParams(status, jsonTable, ThirdPartyLoginManager.Delegate.onThirdPartyLoginCallBack);
end

--@brief 第三方切换账号回调
ThirdPartyLoginManager.onThirdPartySwitchAccountCallBack = function(self, status, jsonTable)
    self:__parseLoginParams(status, jsonTable, ThirdPartyLoginManager.Delegate.onThirdPartySwitchAccountCallBack);
end

--@brief 解析登录/切换账号返回的数据
ThirdPartyLoginManager.__parseLoginParams = function(self, status, jsonTable, callback)
    self:log("__parseLoginParams", "status = ", status, "jsonTable = ", jsonTable);
    if not status or table.isEmpty(jsonTable) then
        self:notify(callback, false);
        return;
    end

    local flag = GetNumFromJsonTable(jsonTable, ThirdPartyLoginManager.KEY_FLAG, kFalse);
    local loginTag = GetStrFromJsonTable(jsonTable, ThirdPartyLoginManager.KEY_LOGINTAG, ThirdPartyLoginManager.UNKNOWN);
    local token = GetStrFromJsonTable(jsonTable, ThirdPartyLoginManager.KEY_TOKEN, "");
    local loginParams = GetStrFromJsonTable(jsonTable, ThirdPartyLoginManager.KEY_PARAMS, "");
    
    local loginType = self:__getLoginTypeByLoginTag(loginTag);
    local uType = self:__getUTypeByLoginType(loginType);

    local param, extParam = self.m_thirdPartyLoginParams:getThirdPartyLoginParams(loginType, token, json.decode(loginParams));

    if flag == kTrue then
        self:notify(callback, true, loginType, uType, token, table.verify(param), table.verify(extParam) );
    else
        self:notify(callback, false);
    end   
end

--@brief 根据用户登录类型获取登录配置
ThirdPartyLoginManager.__getLoginConfigByLoginType = function(self, loginType)
    if not loginType then
        return;
    end

    return ThirdPartyLoginManager.s_loginConfig[loginType];
end

--@brief 根据用户登录类型来获取godSdk对应的loginTag
ThirdPartyLoginManager.__getLoginTagByLoginType = function(self, loginType)
    local config = self:__getLoginConfigByLoginType(loginType);
    return config and config.godLoginTag;
end

--@brief 根据用户登录类型来获取用户类型
ThirdPartyLoginManager.__getUTypeByLoginType = function(self, loginType)
    local config = self:__getLoginConfigByLoginType(loginType);
    return config and config.uType or LoginConstants.uType.None;
end

--@brief 根据godSdk对应的loginTag来获取用户登录类型
ThirdPartyLoginManager.__getLoginTypeByLoginTag = function(self, loginTag)
    for k, v in pairs(ThirdPartyLoginManager.s_loginConfig) do
        if v.godLoginTag == loginTag then
            return k;
        end
    end

    return LoginConstants.loginType.Notoken;
end

ThirdPartyLoginManager.onNativeEvent = function(self,param,...)
    if self.s_nativeEventFuncMap[param] then
        self.s_nativeEventFuncMap[param](self,...);
    end
end

ThirdPartyLoginManager.log = function(self, tag, ...)
    Log.v("ThirdPartyLoginManager", tag, ...);
end

--用户登录类型配置表
ThirdPartyLoginManager.s_loginConfig = {
    [LoginConstants.loginType.AiYouXiLogin] = { 
        godLoginTag = "egame",
        uType = LoginConstants.uType.AiYouXi,
        name = "爱游戏登录";
        isSupportLogin = true;
    };

    [LoginConstants.loginType.HeYouXiLogin] = { 
        godLoginTag = "heyouxi",
        uType = LoginConstants.uType.HeYouXi,
        name = "移动基地登录",
        isSupportLogin = true;
    };

    [LoginConstants.loginType.HuaWeiLogin] = {
        godLoginTag = "huawei",
        uType = LoginConstants.uType.HuaWei,
        name = "华为登录",
        isSupportLogin = true;
    };
}


ThirdPartyLoginManager.s_nativeEventFuncMap = {
    ["ThirdPartyLoginCallBack"] = ThirdPartyLoginManager.onThirdPartyLoginCallBack;
    ["ThirdPartySwitchAccountCallBack"] = ThirdPartyLoginManager.onThirdPartySwitchAccountCallBack;
}