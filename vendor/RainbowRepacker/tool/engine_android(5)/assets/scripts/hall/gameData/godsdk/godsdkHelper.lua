require("hall/gameData/godsdk/godsdkConstants");
require("common/nativeEvent");
require("hall/gameData/godsdk/godsdkPayHelper");

GodSDKHelper = {};

-- @private
GodSDKHelper.GodSDKSupportPmodes = {};
-- @private
GodSDKHelper.isSupportPmodesInited = false;
-- @private
GodSDKHelper.GodSDKSupportLoginTags = {};
-- @private
GodSDKHelper.isSupportLoginTagsInited = false;

-- 获取GodSDK支持的pmode列表
GodSDKHelper.getSupportPmodes = function()
	GodSDKHelper.initSupportPmodes();
	return GodSDKHelper.GodSDKSupportPmodes;
end

-- 判断pmode是否为通过GodSDK添加的支付方式
GodSDKHelper.isInGodSDKSupportPmodes = function(pmode)
	GodSDKHelper.initSupportPmodes();
	pmode = tostring(pmode);
	for _, v in ipairs(GodSDKHelper.GodSDKSupportPmodes) do
		if v == pmode then
			return true;
		end
	end
	return false;
end



-- 请求通过GodSDK加入的支付方式
GodSDKHelper.requestPay = function(pmode, rechargeData, orderData)
	pmode = tostring(pmode);

	local payParams = GodSDKPayHelper.getPayParams(pmode, rechargeData, orderData);
	local jsonPayParams = json.encode(payParams);
	Log.i("GodSDKHelper.requestPay pmode == ", pmode, " jsonPayParams == " , jsonPayParams);
	dict_set_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_PAY_PARAMS, jsonPayParams);
	dict_set_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_PAY_PMODE, pmode);
	NativeEvent.getInstance():requestGodSDKPay();
end

-- 获取GodSDK支持的登录方式列表
GodSDKHelper.getSupportLoginTags = function()
	GodSDKHelper.initSupportLoginTags();
	return GodSDKHelper.GodSDKSupportLoginTags;
end

-- 获取GodSDK支持的默认登录方式
GodSDKHelper.getDefaultLoginTag = function()
	local defaultLoginTag = dict_get_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_DEFAULT_LOGINTAG);
	Log.i("GodSDKHelper.getDefaultLoginTag defaultLoginTag == ", defaultLoginTag);
	return defaultLoginTag;
end


-- 获取是否需要接入第三方退出
GodSDKHelper.isQuitRequired = function ()
	local flag = dict_get_int(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_IS_QUIT_REQUIRED, kFalse);
	if flag == kTrue then
		return true;
	else
		return false;
	end
end

-- 获取打包时用户自定义的渠道标识
GodSDKHelper.getChannelSymbol = function()
	local symbol = dict_get_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_CHANNEL_SYMBOL);
	return symbol;
end

-- @private
GodSDKHelper.initSupportLoginTags = function()
	if not GodSDKHelper.isSupportLoginTagsInited and #GodSDKHelper.GodSDKSupportLoginTags == 0 then
		local loginTagsString = GodSDKHelper.getSupportLoginTagsString();
		if loginTagsString ~= "" then
			local loginTagsTable = json.decode(loginTagsString);
			for _, tag in ipairs(loginTagsTable) do
				table.insert(GodSDKHelper.GodSDKSupportLoginTags, tostring(tag));
			end
			Log.i("GodSDKHelper.initSupportLoginTags ", loginTagsTable);
		end
		GodSDKHelper.isSupportLoginTagsInited = true;
	end
end

-- @private
GodSDKHelper.getSupportLoginTagsString = function()
	local loginTagsString = dict_get_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_LOGINTAGS) or "";
	Log.i("GodSDKHelper.getSupportLoginTagsString loginTagsString == ", loginTagsString);
	return loginTagsString;
end

-- @private
GodSDKHelper.initSupportPmodes = function()
	if not GodSDKHelper.isSupportPmodesInited and #GodSDKHelper.GodSDKSupportPmodes == 0 then
		local pmodesString = GodSDKHelper.getSupportPmodesString();
		if pmodesString ~= "" then
			local pmodesTable = json.decode(pmodesString);
			for _, pmode in ipairs(pmodesTable) do
				table.insert(GodSDKHelper.GodSDKSupportPmodes, tostring(pmode));
			end
			Log.i("GodSDKHelper.initSupportPmodes ", pmodesTable);
		end
		GodSDKHelper.isSupportPmodesInited = true;
	end
end

-- @private
GodSDKHelper.getSupportPmodesString = function()
	local pmodesString = dict_get_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_PMODES) or "";
	Log.i("GodSDKHelper.getSupportPmodesString pmodesString == " .. pmodesString);
	return pmodesString;
end


GodSDKHelper.callSpecialMethod = function(methodName, ...)
	local extras = {}
	extras.method = methodName or "";
	for key, value in pairs(arg) do
		if type(value) == "table" then
			for _, val in pairs(value) do
				table.insert(extras, val);
			end
		else
			table.insert(extras, value);
		end
		
	end
	dict_set_string(GodSDKConstants.DICT_NAME, GodSDKConstants.KEY_SPECIAL_METHOD, json.encode(extras));
	NativeEvent.getInstance():callSpecialMethod();
end