require("gameData/gameData");
require("core/dict");

--商城广告
local RechargeTabsAd = class(GameData);

RechargeTabsAd.Delegate = {
    onGetRechargeTabsAdCallBack = "onGetRechargeTabsAdCallBack";  
};

RechargeTabsAd.ctor = function(self)   
end

RechargeTabsAd.dtor = function(self)
end

RechargeTabsAd.initData = function(self)
    self.m_data = {};
end

RechargeTabsAd.cleanup = function(self)
    self.m_data = {};
end

RechargeTabsAd.updateMemData = function(self, data)
    self.m_data = self:_analyseData(data); 
end

RechargeTabsAd.getRechargeTabsAd = function(self, tabId)
    local item = {};
    tabId = tonumber(tabId);
    if tabId and not table.isEmpty(self.m_data) and not table.isEmpty(self.m_data.list) then
        for k, v in pairs(self.m_data.list) do
            if v.type and v.type == tabId then
                item = v;
                break;
            end
        end
    end
    return item;
end

RechargeTabsAd.requestData = function(self, tabId)
    OnlineSocketManager.getInstance():sendMsg(PHP_MARKET_TABS_AD, {type = 4});
end

RechargeTabsAd.onGetRechargeTabsAdCallBack = function(self, isSuccess, data, sendParam)
    if isSuccess then
        self:updateData(true, data);
    end

    self:execDelegate(RechargeTabsAd.Delegate.onGetRechargeTabsAdCallBack);
end

----------------------------------------------------------------------------------

RechargeTabsAd._analyseData = function(self, data)
    local tmp = {
        result = tonumber(data.result) or 0,
        code = tonumber(data.code) or 0,
        list = self:_analyseDataList(data.list),
    };

    return tmp; 
end

RechargeTabsAd._analyseDataList = function(self, data)
    local list = table.verify(json.decode(data));

    local tmp = {};
    for k, v in pairs(list) do
        local item = {
            type = tonumber(v.type) or 0,
            content = tostring(v.content) or "",
        }
        table.insert(tmp, item);
    end
    return tmp;
end

RechargeTabsAd.s_socketCmdFuncMap = {
    [PHP_MARKET_TABS_AD] = RechargeTabsAd.onGetRechargeTabsAdCallBack;
};


return RechargeTabsAd;