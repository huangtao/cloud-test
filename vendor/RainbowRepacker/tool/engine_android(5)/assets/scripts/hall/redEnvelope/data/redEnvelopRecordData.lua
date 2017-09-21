require("gameData/gameData");
require("hall/redEnvelope/data/redEnvelopeDataInterface");
require("hall/php/phpManager");

local RedEnvelopSendRecord = class(GameData);

RedEnvelopSendRecord.s_defaultMaxCount = 3;

RedEnvelopSendRecord.Delegate = {
    onGetRedEnvelopSendRecord = "onGetRedEnvelopSendRecord",
};


local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

RedEnvelopSendRecord.ctor = function(self)
    self.m_connectTimeAndPage = {};
    self.m_connectCounts = {};
    self.m_sendRecordData = {};
end

RedEnvelopSendRecord.dtor = function(self)
   
end




RedEnvelopSendRecord.initData = function(self)
    
end

RedEnvelopSendRecord.getSendRecord = function(self)
    if table.isEmpty(self.m_sendRecordData) then
        self:_analysisData();
    end 
    return self.m_sendRecordData;
end

RedEnvelopSendRecord.requestData = function(self)
    if self.m_originalData then
        self:formatDataAndHandleDelegate(true, self.m_originalData);
    end

    self:getBagListByPageAndInit(1);
end

RedEnvelopSendRecord.getBagListByPageAndInit = function(self, page)
    self.m_connectCounts[page] = RedEnvelopSendRecord.s_defaultMaxCount;
    self:getBagListByPage(page);
end

RedEnvelopSendRecord.getBagListByPage = function(self, page)

    if not page then
        return;
    end

    if self.m_connectCounts[page] <= 0 then
        self:_getPageError();
        return;
    end

    if not self.m_connectTimeAndPage or page == 1 then
        self.m_connectTimeAndPage = {};
    end

    local param = {
        ["id"] = self.m_lastPastId;
        ["page"] = page;
        ["seqIndex"] = getIndex();
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_REDENVELOPE_SEND_LIST, param, 6000);

    self.m_connectTimeAndPage[param.seqIndex] = page;
    self.m_connectCounts[page] = self.m_connectCounts[page] - 1;
 
end

RedEnvelopSendRecord._getPageError = function(self)
    return;
end

-- RedEnvelopSendRecord.updateMemData = function(self, data, sendParam) 
--     --做成 key == tostring(id)
--     --便于查找更新数据。
--     if table.isEmpty(data) then
--         self.m_originalData = self.m_originalData;
--     else
--         for k,v in pairs(data) do
--             self.m_originalData[tostring(v.id)] = v;
--         end
--     end
-- end

RedEnvelopSendRecord.updateMemData = function(self, data, sendParam) 
    if table.isEmpty(data) then
        return;
    end

    if not table.isEmpty(data) then
        local list = {};
        local tpage = tonumber(data.totalpage) or 0;
        local page = tonumber(data.page);
      
        if page == 1 then
            if tpage > 1 then
                for i=2 ,tpage do
                    self:getBagListByPageAndInit(i);
                end
            end
        end
        self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
    
        if table.isEmpty(data.data) then
            self.m_originalData = self.m_originalData;
        else
            for k,v in pairs(data.data) do
                self.m_originalData[tostring(v.id)] = v;
            end
        end

        if table.maxn(self.m_connectTimeAndPage) == 0 then
            self:_allPageFinish(true);
        end
    else
        local page = self.m_connectTimeAndPage[sendParam.seqIndex];
        if page then
            self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
            self:getBagListByPage(page);
        end
    end
end


RedEnvelopSendRecord.onGetRedEnvelopSendRecord = function(self, isSuccess, data, sendParam)

    Log.v("RedEnvelopSendRecord.onGetRedEnvelopSendRecord", data);
    if not sendParam or not sendParam.seqIndex then
        return;
    end
    
    if isSuccess then
        self:updateData(true, data, sendParam);
    else
        local page = self.m_connectTimeAndPage[sendParam.seqIndex];
        if page then
            self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
            self:getBagListByPage(page);
        end  
    end
end

RedEnvelopSendRecord._analysisData = function(self)
    local data = self.m_originalData;

   local __record = {};
   local __lastPastId = 0;
   local __serverTime = GameInfoIsolater.getInstance():getRightTimeWithServer();
   local __intervalTime = 24*60*60;

   if not table.isEmpty(data) then
        for k,v in pairs(data) do 
          
            local __item = {
            id = tonumber(v.id) or 0,
            type = tonumber(v.type) or 0,
            num = tonumber(v.num) or 0,
            money = tonumber(v.money) or 0,
            time = tonumber(v.time) or 0,
            take = tonumber(v.take) or 0
            }

            --因为后台是按时间排过序的
           if __serverTime - (tonumber(v.time) or 0) > __intervalTime then

                __lastPastId = tonumber(v.id) or 0;
                
                if __lastPastId > self.m_lastPastId then
                    self.m_lastPastId = __lastPastId;
                end
           end
            table.insert(__record,__item);
           
        end
        table.sort(__record,function(a,b)
            return number.valueOf(a.id,0) > number.valueOf(b.id,1);
        end)
        
   end

   self.m_sendRecordData = __record;
   return __record;
end

RedEnvelopSendRecord._allPageFinish = function(self)
    self:formatDataAndHandleDelegate(true,self.m_originalData);
end

RedEnvelopSendRecord.formatDataAndHandleDelegate = function(self,isSuccess,data)
    if isSuccess then
        self:_analysisData();
        isSuccess = true;
        self:execDelegate(RedEnvelopSendRecord.Delegate.onGetRedEnvelopSendRecord, isSuccess, self.m_sendRecordData);
    end
end

-------------------------------------------------------------------
--virtual
RedEnvelopSendRecord.loadDictData = function(self, dict)
    self.m_originalData = table.verify(json.decode(dict:getString("redEnvelopSendRecord")));
    self.m_lastPastId = 0;
    self:_analysisData();
end

--virtual
RedEnvelopSendRecord.saveDictData = function(self, dict)
    local data = json.encode(self.m_originalData) or "";
    dict:setString("redEnvelopSendRecord", data);
end

RedEnvelopSendRecord.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "dic_redEnvelopSendRecord"..self.m_userId;
end

RedEnvelopSendRecord.s_socketCmdFuncMap = {
    [PHP_REDENVELOPE_SEND_LIST]                        = RedEnvelopSendRecord.onGetRedEnvelopSendRecord;
}

return RedEnvelopSendRecord;
