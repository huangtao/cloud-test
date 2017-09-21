require("gameData/gameData");
require("core/dict");
require("hall/backpack/data/typeAdapter");
require("hall/php/phpManager");

local BackpackRecordData = class(GameData);

BackpackRecordData.s_defaultMaxCount = 3;
BackpackRecordData.s_serverUnitsNumForPage = 10;
BackpackRecordData.s_clientUnitsNumForPage = 12;--服务器分页是传输限制，客户端分页是设计需求，
                                                --此分页非彼分页，应该分开。

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end


BackpackRecordData.Delegate = {
    onGetRecordCallBack = "onGetRecordCallBack",
};

BackpackRecordData.ctor = function(self)
    self.m_connectTimeAndPage = {};
    self.m_isNeedFresh = true;
end

BackpackRecordData.dtor = function(self)
   
end

BackpackRecordData.initData = function(self)
    
end

BackpackRecordData.resetBackpackRecordRequsetStaus = function(self)
    self.m_isNeedFresh = true;
end

BackpackRecordData.getRecordList = function(self, updateLater)
    if self.m_recordList and not updateLater then
        self:formatDataAndHandleDelegate(true, self.m_recordList);
    end

    if self.m_isNeedFresh then
        self.m_connectCounts = {};
        self:getBagListByPageAndInit(1);
        self.m_isNeedFresh = false;
    end
    
end

BackpackRecordData.getBagListByPageAndInit = function(self, page)
    self.m_connectCounts[page] = BackpackRecordData.s_defaultMaxCount;
    self:getBagListByPage(page);
end

BackpackRecordData.getBagListByPage = function(self, page)

    if not page then
        return;
    end

    if self.m_connectCounts[page] <= 0 then
        self:_getPageError();
        return;
    end

    if not self.m_connectTimeAndPage or page == 1 then
        self.m_connectTimeAndPage = {};
        self.m_getedAllPage = false;
    end

    local param = {
        page = page,
        pagenum = BackpackRecordData.s_serverUnitsNumForPage,
        seqIndex = getIndex(),
    };

    OnlineSocketManager.getInstance():sendMsg(PHP_PACKAGE_RECORD, param, 6000);
    self.m_connectTimeAndPage[param.seqIndex] = page;
    self.m_connectCounts[page] = self.m_connectCounts[page] - 1;
 
end

BackpackRecordData._getPageError = function(self)
    self.m_recordList = {};
    self:saveData();
    self:formatDataAndHandleDelegate(false, self.m_recordList);
end

BackpackRecordData.updateMemData = function(self, data, sendParam) 
    if table.isEmpty(data) then
        return;
    end

    if not table.isEmpty(data) then
        local list = {};
        local tpage = tonumber(data.tpage);
        local page = tonumber(data.page);
      
        if page == 1 then
            self.m_recordList = {};
            if tpage > 1 then
                for i=2 ,tpage do
                    self:getBagListByPageAndInit(i);
                end
            end
        end
        self.m_connectTimeAndPage[sendParam.seqIndex] = nil;
    
        self.m_recordList[page] = data.record;

        if table.maxn(self.m_connectTimeAndPage) == 0 then
            self.m_recordList = table.verify(self.m_recordList);
            self:saveData();
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

BackpackRecordData._allPageFinish = function(self, flag)
    if flag ~= nil then
        self.m_getedAllPage = flag;
    end   

    if self.m_recordList and self.m_getedAllPage then
        self:formatDataAndHandleDelegate(true, self.m_recordList);
    end
end

--合并分页数据
BackpackRecordData.mergeTable = function(self,data)
    local megerTable = {}; 
    if not table.isEmpty(data) then
         if #data > 1 then
            for k,v in pairs(data) do
                if type(v) == "table" then
                    for k1,v1 in pairs(v) do
                        table.insert(megerTable,v1);
                    end
                end
            end   
        elseif #data == 1 then
            megerTable = data[1];
        else
                
        end 
    end 

    return megerTable;
end

BackpackRecordData.fillAndformatData = function(self,data)
    for k,v in pairs(table.verify(data)) do
        v.clientType = k_bagTypeAdapter:getClientType(tonumber(v.boxType),tonumber(v.smallType));
        v.isCompoundType = false;
        if v.clientType == BagTypeAdapter.s_shard then
            v.isCompoundType = true;
        end
    end
    return data;
end

BackpackRecordData.onGetRecordCallBack = function(self, isSuccess, data, sendParam)
    Log.v("BackpackRecordData.onGetBagListByPageCallback", data);
    
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

BackpackRecordData._analysisData = function(self, data)
    if type(data) ~= "table" then
        return;
    end 
    local tmpData = {};
    tmpData = self:mergeTable(data);
    tmpData = self:fillAndformatData(tmpData);
    return tmpData;
end



BackpackRecordData.formatDataAndHandleDelegate = function(self,isSuccess,data)
    if isSuccess then
        local formatData = self:_analysisData(data);
        self:execDelegate(BackpackRecordData.Delegate.onGetRecordCallBack, isSuccess, formatData);
    end
    
end

-------------------------------------------------------------------
--virtual
BackpackRecordData.loadDictData = function(self, dict)
    self.m_recordList = table.verify(json.decode(dict:getString("newObjectCase_recordData")));
end

--virtual
BackpackRecordData.saveDictData = function(self, dict)
    local data = json.encode(self.m_recordList) or "";
    dict:setString("newObjectCase_recordData", data);
end

--virtual
BackpackRecordData.getDictKeyVersion = function(self)
    return "900"; --差量更新配置
end

BackpackRecordData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "dic_newObjectCase_recordData"..self.m_userId;
end

-------------------------------------------------------------------

--排序(暂时没用上，默认直接用服务器已经排好序)
BackpackRecordData.sort = function(self,data)
    if type(data) ~= "table" then
        return;
    end

     table.sort(data,function(a,b)
            return number.valueOf(a.sort,0) > number.valueOf(b.sort,1);
        end)

     return data;
end


BackpackRecordData.s_socketCmdFuncMap = {
    [PHP_PACKAGE_RECORD]                        = BackpackRecordData.onGetRecordCallBack;
}

return BackpackRecordData;
