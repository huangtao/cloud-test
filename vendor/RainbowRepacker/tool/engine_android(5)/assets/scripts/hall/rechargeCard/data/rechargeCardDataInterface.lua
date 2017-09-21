require("gameData/dataInterfaceBase");
require("common/httpModule")

RechargeCardDataInterface = class(DataInterfaceBase);

RechargeCardDataInterface.Delegate = {
    onUseRechargeCardCallBack = "onUseRechargeCardCallBack";
}

RechargeCardDataInterface.getInstance = function()
    if not RechargeCardDataInterface.s_instance then
        RechargeCardDataInterface.s_instance = new(RechargeCardDataInterface);
    end

    return RechargeCardDataInterface.s_instance;
end

RechargeCardDataInterface.cleanup = function()
    local lastObserverMap = RechargeCardDataInterface.getInstance():getObserverMap();
    delete(RechargeCardDataInterface.s_instance);
    RechargeCardDataInterface.s_instance = nil;

    RechargeCardDataInterface.getInstance():setObserverMap(lastObserverMap);
end


RechargeCardDataInterface.ctor = function(self)
    EventDispatcher.getInstance():register(HttpModule.s_event,self,self.onHttpRequestCallBack);
end

RechargeCardDataInterface.dtor = function(self)
    EventDispatcher.getInstance():unregister(HttpModule.s_event,self,self.onHttpRequestCallBack);
end

RechargeCardDataInterface.initData = function(self)
    self.m_webUrl = "";
    self.m_payUrl = "";
end

--@override
RechargeCardDataInterface.getLocalDictName = function(self)
    return "RechargeCardDataInterface";
end

--@override
RechargeCardDataInterface.loadDictData = function(self, dict)
    self.m_webUrl = dict:getString("webUrl") or "";
    self.m_payUrl = dict:getString("payUrl") or "";
end

--@override
RechargeCardDataInterface.saveDictData = function(self, dict)
    dict:setString("webUrl", self.m_webUrl or "");
    dict:setString("payUrl", self.m_payUrl or "");
end

RechargeCardDataInterface.setRechargeCardWebUrl = function(self, rechargeCardUrl)
    self.m_webUrl = rechargeCardUrl;
    self:saveData();
end

RechargeCardDataInterface.getRechargeCardWebUrl = function(self)
    return self.m_webUrl or "";
end

RechargeCardDataInterface.setRechargeCardPayUrl = function(self, rechargeCardPayUrl)
    self.m_payUrl = rechargeCardPayUrl;
end

RechargeCardDataInterface.getRechargeCardPayUrl = function(self)
    return self.m_payUrl or "";
end

RechargeCardDataInterface.requestUseRechargeCard = function(self, cardNumber, password, cardtype)
    local url = string.format("%s&param[regionid]=%s&param[usercard]=%s&param[password]=%s&param[mid]=%s&param[type]=code&param[cardtype]=%s", 
                        self:getRechargeCardPayUrl(), kClientInfo:getRegionId(), cardNumber, password, kUserInfoData:getUserId(), cardtype );

    Log.v("RechargeCardDataInterface.requestUseRechargeCard  url = ", url);

    HttpModule.getInstance():setUrl(HttpModule.s_cmds.PayRechargeCard, url);
    HttpModule.getInstance():execute(HttpModule.s_cmds.PayRechargeCard, {}); 
end

RechargeCardDataInterface.onUseRechargeCardCallBack = function(self, isSuccess, data)
    Log.v("RechargeCardDataInterface.onUseRechargeCardCallBack ->", data);
    
    if isSuccess and not table.isEmpty(data) then
        if not table.isEmpty(data) then
            local status = GetNumFromJsonTable(data, "status", -1);
            local msg = GetStrFromJsonTable(data, "msg", "");
            local rmb = GetStrFromJsonTable(data, "rmb", "");
            local gold = GetStrFromJsonTable(data, "gold", "");

            isSuccess = number.valueOf(status) == 1;
            self:notify(RechargeCardDataInterface.Delegate.onUseRechargeCardCallBack, isSuccess, msg, rmb, gold);
            return;
        end
    end

    self:notify(RechargeCardDataInterface.Delegate.onUseRechargeCardCallBack, false, "");
end

RechargeCardDataInterface.onHttpRequestCallBack = function(self,command,...)
    if RechargeCardDataInterface.s_httpRequestCallBackFuncMap[command] then
        RechargeCardDataInterface.s_httpRequestCallBackFuncMap[command](self,...);
    end 
end

RechargeCardDataInterface.s_httpRequestCallBackFuncMap = {
    [HttpModule.s_cmds.PayRechargeCard]        = RechargeCardDataInterface.onUseRechargeCardCallBack,
};
