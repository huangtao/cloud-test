require("gameData/gameData");
require("hall/php/phpManager");
--local OnlineSocketManager = require('hall/common/simpleVirtualServer/simpleVirtualServer');

GoldBarData = class(GameData);

GoldBarData.Delegate = {
    onGetGoldBarConfig = "onGetGoldBarConfig",
};

GoldBarData.ctor = function(self)
    
end

GoldBarData.dtor = function(self)
   
end

GoldBarData.initData = function(self)
    
end

GoldBarData.getGoldBarConfig = function(self, is_must_update)

    if is_must_update then
        local param = {};
        OnlineSocketManager.getInstance():sendMsg(PHP_GOLDBAR_CONFIG, param, 6000);
    end

    if table.isEmpty(self.m_goldBar_config) then   --第一次给个假数据。
        self.m_goldBar_config = {};
        self.m_goldBar_config.rate_goldBar =0;
        self.m_goldBar_config.rate_gold =1;
        self.m_goldBar_config.least = 0;
        self.m_goldBar_config.max =  0; 
        self.m_goldBar_config.maxForEveryDay = 0;
    end

    return self.m_goldBar_config;
    
end


GoldBarData.updateMemData = function(self, data, sendParam) 

    if table.isEmpty(data) then
        return;
    end

    self.m_goldBar_config.rate_goldBar = tonumber(data.per_crystal) or 0;
    self.m_goldBar_config.rate_gold = tonumber(data.per_money) or 1;
    self.m_goldBar_config.least = tonumber(data.min_money) or 0;
    self.m_goldBar_config.max = tonumber(data.remain_money) or 0; 
    self.m_goldBar_config.maxForEveryDay = tonumber(data.max_money) or 0;
end


GoldBarData.onGetGoldBarConfig = function(self, isSuccess, data, sendParam)
    Log.v("GoldBarData.onGetGoldBarConfig", data);

    if isSuccess then
        self:updateData(true, data);
        self:execDelegate(GoldBarData.Delegate.onGetGoldBarConfig, true,self.m_goldBar_config);
    else
        self:execDelegate(GoldBarData.Delegate.onGetGoldBarConfig, false,{});
    end
end

--刷新最大值
GoldBarData.refreshMaxLimit = function(self,p_num)
    if p_num and type(p_num) == 'number' then
        self.m_goldBar_config.max = p_num;
        self:saveData();
    end
end

GoldBarData.getMaxLimit = function(self)
    return self.m_goldBar_config.max;
end
-------------------------------------------------------------------
--virtual
GoldBarData.loadDictData = function(self, dict)
    self.m_goldBar_config = table.verify(json.decode(dict:getString("GoldBar_Data")));
end

--virtual
GoldBarData.saveDictData = function(self, dict)
    local data = json.encode(self.m_goldBar_config) or "";
    dict:setString("GoldBar_Data", data);
end

GoldBarData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "GoldBar_Data"..self.m_userId;
end

-------------------------------------------------------------------
GoldBarData.s_socketCmdFuncMap = {
    [PHP_GOLDBAR_CONFIG ]                       = GoldBarData.onGetGoldBarConfig;
}