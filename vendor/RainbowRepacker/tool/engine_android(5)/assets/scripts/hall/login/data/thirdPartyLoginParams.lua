
ThirdPartyLoginParams = class();

--@brief 获取第三方登录时，传给php后台的参数
--@return #1: params下的字段
--        #2: ext_param扩展参数下的字段
ThirdPartyLoginParams.getThirdPartyLoginParams = function(self, loginType, token, loginParams)
    if not loginType then
        return;
    end

    local func = ThirdPartyLoginParams.s_loginParamsMap[loginType];
    if not func then
        return;
    end

    return func(self, token, table.verify(loginParams) );
end

--移动基地参数信息
ThirdPartyLoginParams.onGetHeYouXiParams = function(self, token, loginParams)
    local params = {};
    params.mobilebase = { userId = token };
    return {}, params;
end

--爱游戏登录参数
ThirdPartyLoginParams.onGetAiYouXiParams = function(self, token, loginParams)
    local params = {};
    params.aiyouxicode = table.isTable(loginParams) and loginParams.egameToken or "";

    Log.v("ThirdPartyLoginParams.onGetAiYouXiParams", params);
    return {}, params;
end

--华为登录参数
ThirdPartyLoginParams.onGetHuaWeiParams = function(self, token, loginParams)
    local params = {access_token = token or ""};

    Log.v("ThirdPartyLoginParams.onGetHuaWeiParams", "params = ", params);
    return params, {};
end

ThirdPartyLoginParams.s_loginParamsMap = {
    [LoginConstants.loginType.HeYouXiLogin] = ThirdPartyLoginParams.onGetHeYouXiParams;
    [LoginConstants.loginType.AiYouXiLogin] = ThirdPartyLoginParams.onGetAiYouXiParams;
    [LoginConstants.loginType.HuaWeiLogin]  = ThirdPartyLoginParams.onGetHuaWeiParams;
}