-- getuiInfo.lua
-- 个推相关信息，务必使用getInstance

require("common/nativeEvent");

GetuiInfo = class();

GetuiInfo.s_instance = nil;

GetuiInfo.getInstance = function()
    if not GetuiInfo.s_instance then
        GetuiInfo.s_instance = new(GetuiInfo);
    end
    return GetuiInfo.s_instance;
end

GetuiInfo.releaseInstance = function()
    if GetuiInfo.s_instance then
        delete(GetuiInfo.s_instance);
        GetuiInfo.s_instance = nil;
    end
end

GetuiInfo.s_dict_name                       = "getui";
GetuiInfo.s_dict_key_getui_id      = "getui_id";

-- nativeEvent 回调key
GetuiInfo.s_broadcast_callback_name         = "getGetuiClientIdForLua";

GetuiInfo.ctor = function(self)
    EventDispatcher.getInstance():register(Event.Call,self,self.onNativeCallDone);
end

GetuiInfo.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeCallDone);
end

-- 获取当前个推clientId
GetuiInfo.getCurrentClientId = function(self)
    NativeEvent.getInstance():getGeTuiToken();
    local clientId = dict_get_string(GetuiInfo.s_dict_name , GetuiInfo.s_dict_key_getui_id);
    return clientId or "";
end

-- 上传当前clientId给php
GetuiInfo.uploadClientIdToPhp = function(self, id)
    local clientId = id or self:getCurrentClientId();
    if string.isEmpty(clientId) then
        return;
    end

    Log.i("gettui client id == " .. clientId);

    local info = {
        ["ssid"] =  kUserInfoData:getSsid();
        ["push_token"] = clientId;
        ["push_flags"] = 1;
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_SEND_GETUI_ID, info);
end

-- Java端的广播clientId
GetuiInfo.onGetClientIdBroadcast = function(self,status,json_data)
    if not status or not json_data then
        return;
    end

    local clientId = GetStrFromJsonTable(json_data, "clientid", "");

    if not clientId or clientId == "" then
        return;
    end

    -- 如果用户已经登录成功，则请求php接口上传clientId
    self:uploadClientIdToPhp(clientId);
end

GetuiInfo.onNativeCallDone = function(self ,param , ...)
    if GetuiInfo.callEventFuncMap[param] then
        GetuiInfo.callEventFuncMap[param](self,...);
    end
end

GetuiInfo.callEventFuncMap = {
    [GetuiInfo.s_broadcast_callback_name] = GetuiInfo.onGetClientIdBroadcast;
}