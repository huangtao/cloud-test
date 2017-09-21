-- NativeEvent.lua
-- 本地事件方法

require("core/constants");
require("core/object");
require("core/system");
require("core/dict");
require("core/sound");
require("libs/json_wrap");
require("util/log");
require("common/animFactory");

kHideMsgPay = 0;--是否屏蔽短信支付，1屏蔽
NativeEvent = class();
NativeEvent.s_luaCallNavite = "OnLuaCall";
NativeEvent.s_luaCallEvent = "LuaCallEvent";
NativeEvent.s_platform = System.getPlatform();

NativeEvent.getInstance = function()
	if not NativeEvent.s_instance then 
		NativeEvent.s_instance = new(NativeEvent);
	end
	return NativeEvent.s_instance;
end

NativeEvent.onEventCall = function()
	EventDispatcher.getInstance():dispatch(Event.Call,NativeEvent.getInstance():getNativeCallResult());
end

NativeEvent.onWinKeyDown = function(key)

	if key == 77 then
		if g_GameMonitor then
			g_GameMonitor:update(100);
		end
	end

	if key == 118 then --F7
		if _DEBUG then
			local ConsoleDialog = require("hall/main/widget/consoleDialog")
			ConsoleDialog.show()
		end
	end

	if key == 81 then -- Q
		event_backpressed();

	elseif key == 83 then -- S
		mainHandle_restartVM();
	else
		EventDispatcher.getInstance():dispatch(Event.KeyDown,key);
	end
end
-- 解析 call_native 返回值
NativeEvent.getNativeCallResult = function(self)
	Log.d("NativeEvent.getNativeCallResult .....A..... ");
	local callParam = dict_get_string(kcallEvent,kcallEvent);
	local callResult = dict_get_int(callParam, kCallResult,-1);

    if callResult == 1 then -- 获取数值失败
    	Log.d("NativeEvent.getNativeCallResult .....B..... ");
        return callParam , false;
    end
    local result = dict_get_string(callParam , callParam .. kResultPostfix);
    dict_delete(callParam);
    local json_data = json.decode_node(result);
    Log.d("NativeEvent.getNativeCallResult callParam = ", callParam ," =========");
    Log.d("NativeEvent.getNativeCallResult result = " , result ," =========");
    --返回错误json格式.
    if json_data then
    	Log.d("NativeEvent.getNativeCallResult .....C..... ");
        return callParam ,true, json_data, result;
    else
    	Log.d("NativeEvent.getNativeCallResult .....D..... ");
        return callParam , true, json_data, result;
    end
end


if NativeEvent.s_platform == kPlatformAndroid  then
	require("common/nativeEventAndroid");
elseif NativeEvent.s_platform == kPlatformIOS then
	require("common/nativeEventIos");
else
	require("common/nativeEventWin32");
end


NativeEvent.invokeNativeFunc = function(self, funcName, ...)
	if not funcName then
		error("NativeEvent.invokeNativeFunc funcName is nil");
	end

	if NativeEvent[funcName] then
		NativeEvent[funcName](self, ...)
	else
		Log.v("NativeEvent.invokeNativeFunc this platform don't have the funcName --> ", funcName);
	end
end
