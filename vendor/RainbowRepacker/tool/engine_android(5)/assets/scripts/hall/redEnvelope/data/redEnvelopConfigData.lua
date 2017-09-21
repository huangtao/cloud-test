require("gameData/gameData");
require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/php/phpManager");

local RedEnvelopConfigData = class(GameData);

RedEnvelopConfigData.Delegate = {
    onGetRedEnvelopConfig = "onGetRedEnvelopConfig",
};

RedEnvelopConfigData.ctor = function(self)
    self.m_configData = {};
end

RedEnvelopConfigData.dtor = function(self)
   
end

RedEnvelopConfigData.initData = function(self)
    
end

RedEnvelopConfigData.getConfig = function(self)
    if table.isEmpty(self.m_configData) then
        self:_analysisData(self.m_originalData);
    end 
    return self.m_configData;
end

RedEnvelopConfigData.requestConfig = function(self)
    if self.m_originalData then
        self:formatDataAndHandleDelegate(true, self.m_originalData);
    end
    local param = {
        ["ver"] = self.m_originalData.ver;
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_REDENVELOPE_CONFIG, param, 6000);
end

RedEnvelopConfigData.updateMemData = function(self, data, sendParam) 
    if table.isEmpty(data) then
        self.m_originalData = {};
    else
        self.m_originalData = data;
    end
end


RedEnvelopConfigData.onGetRedEnvelopConfig = function(self, isSuccess, data, sendParam)
    Log.v("RedEnvelopConfigData.onGetRedEnvelopConfig", data);

    if table.isEmpty(data) then
        return ;
    end
    
    if isSuccess then
        self:updateData(true, data, sendParam);
    else
        
    end
    self:formatDataAndHandleDelegate(isSuccess,self.m_originalData);
end

RedEnvelopConfigData._analysisData = function(self, data)
   local __config = {};
   if not table.isEmpty(data.data) then
        local __lastSelectedId = RedEnvelopDataInterface.getInstance():getSelectedId();
        local __isHaveId = false;
        for k,v in pairs(data.data) do 
           

            local __item = {
            id = tonumber(v.id) or 0,
            type = tonumber(v.type) or 0,
            num = tonumber(v.num) or 0,
            money = tonumber(v.money) or 0
            }

            if __lastSelectedId == tonumber(v.id) then
                __isHaveId = true;
            end

            table.insert(__config,__item);
        end

        if not __isHaveId then
            RedEnvelopDataInterface.getInstance():setSelectedId(tonumber(data.data[1].id));
        end

   end
   return __config;
end



RedEnvelopConfigData.formatDataAndHandleDelegate = function(self,isSuccess,data)
    if isSuccess then
        self.m_configData = self:_analysisData(data);
        self:execDelegate(RedEnvelopConfigData.Delegate.onGetRedEnvelopConfig, isSuccess, self.m_configData);
    end
end

-------------------------------------------------------------------
--virtual
RedEnvelopConfigData.loadDictData = function(self, dict)
    self.m_originalData = table.verify(json.decode(dict:getString("redEnvelopConfig")));
end

--virtual
RedEnvelopConfigData.saveDictData = function(self, dict)
    local data = json.encode(self.m_originalData) or "";
    dict:setString("redEnvelopConfig", data);
end

RedEnvelopConfigData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "dic_redEnvelopConfig"..self.m_userId;
end

RedEnvelopConfigData.s_socketCmdFuncMap = {
    [PHP_REDENVELOPE_CONFIG]                        = RedEnvelopConfigData.onGetRedEnvelopConfig;
}

return RedEnvelopConfigData;
