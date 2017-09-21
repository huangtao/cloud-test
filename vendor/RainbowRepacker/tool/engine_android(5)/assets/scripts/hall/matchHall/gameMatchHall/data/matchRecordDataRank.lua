require("gameData/gameData");
require("core/dict");

--比赛大师分好友排行数据
local MatchRecordDataRank = class(GameData);

MatchRecordDataRank.DATA_NUMBER_PER_PAGE = 50;
MatchRecordDataRank.VIEW_NUMBER_PER_PAGE = 5;

MatchRecordDataRank.Delegate = {
    onGetMatchRecordRankList = "onGetMatchRecordRankList";
};

MatchRecordDataRank.ctor = function(self)   
end

MatchRecordDataRank.dtor = function(self)
end

MatchRecordDataRank.initData = function(self)
    self.m_data = {};
    self.m_havemore = 0;
    self:reset();
end

MatchRecordDataRank.reset = function(self)
    self.m_hasRequestData = false; -- 重新拉取数据标志
    self.m_currentPage = 1; -- 分页拉取，标记当前页
    self.m_isDataEnd = false; -- 分页拉取，标记是否还有数据
end

MatchRecordDataRank.updateMemData = function(self, data, page)
    if page == 1 then
        self.m_data = {};
        self.m_hasRequestData = true;
        self.m_isDataEnd = false;
    end

    self.m_currentPage = page;
    local tmp = self:_analyseData(data);
    self.m_data[page] = tmp.list;
    self.m_havemore = tmp.havemore;
end

MatchRecordDataRank.getData = function(self)
	self:requestData();

    local list = self:_getDataList(self.m_currentPage);
    self:_checkDataState(list);

    -- 第一次读取缓存为空则不显示缓存数据
    if not (not self.m_hasRequestData and table.isEmpty(list)) then
        self:execDelegate(MatchRecordDataRank.Delegate.onGetMatchRecordRankList, list, false);
    end
end

MatchRecordDataRank.getDataNext = function(self)
    if not self.m_hasRequestData then
        return; 
    end

    if self.m_havemore == 1 then
        Log.d("MatchRecordDataRank.getDataNext", "currentPage", self.m_currentPage, "page", self.m_currentPage + 1);
        OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_MASTER_RANK_LIST, {page = self.m_currentPage + 1});
    else
        self.m_isDataEnd = true;
        self:execDelegate(MatchRecordDataRank.Delegate.onGetMatchRecordRankList, self:_getDataList(self.m_currentPage), true);
    end
end

MatchRecordDataRank.hasDataNext = function(self)
    return not self.m_isDataEnd;
end

MatchRecordDataRank.requestData = function(self)
	if not self.m_hasRequestData then
		OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_MASTER_RANK_LIST, {page = 1});
	end
end

MatchRecordDataRank.onResponseData = function(self, isSuccess, data, sendParam)
    if table.isEmpty(sendParam) or not sendParam.page then
        return;
    end

    if not (sendParam.page == 1 or self.m_currentPage + 1 == sendParam.page) then
        return;
    end

    if isSuccess then
        self:updateData(true, data, sendParam.page);

        Log.d("MatchRecordDataRank.onResponseData", "page", sendParam.page);

        local list = self:_getDataList(sendParam.page)
        self:_checkDataState(list);

        self:execDelegate(MatchRecordDataRank.Delegate.onGetMatchRecordRankList, list, sendParam.page > 1);
    end
end

MatchRecordDataRank.loadDictData = function(self, dict)
    local data = table.verify(json.decode(dict:getString("data")));

    if not table.isEmpty(data[1]) then
        self.m_data[1] = self:_analyseDataList(data);
    end
    self.m_havemore = dict:getInt("havemore");
end

MatchRecordDataRank.saveDictData = function(self, dict)
    local data = json.encode(self.m_data[1] or {}) or "";
    dict:setString("data", data);
    dict:setInt("havemore", self.m_havemore);
end

MatchRecordDataRank.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "match_record_data_rank_" .. self.m_userId;
end

----------------------------------------------------------------------------------

MatchRecordDataRank._analyseData = function(self, data)
    data = table.verify(data);
    local tmp = {
        havemore = number.valueOf(data.havemore),
        list = self:_analyseDataList(data.list),
    };
    return tmp;
end

MatchRecordDataRank._analyseDataList = function(self, data)
    local tmp = {};

    for k, v in pairs(table.verify(data)) do
        local item = self:_analyseDataItem(v);
        table.insert(tmp, item);
    end 

    return tmp;
end


MatchRecordDataRank._analyseDataListInsert = function(self, list, data)
    for k, v in pairs(table.verify(data)) do
        local item = self:_analyseDataItem(v);
        table.insert(list, item);
    end 
end

MatchRecordDataRank._analyseDataItem = function(self, data)
    data = table.verify(data);
    local item = {
        mid = number.valueOf(data.mid),
        cid = number.valueOf(data.cid),
        masterpoints = number.valueOf(data.masterpoints),
        level = number.valueOf(data.level),
        rank = number.valueOf(data.rank),
        nick = tostring(data.nick or "") or "",
    };
    return item;
end

MatchRecordDataRank._getDataList = function(self, page)
    local list = {};
    for k, v in ipairs(self.m_data) do
        if k <= page then
            self:_analyseDataListInsert(list, v);
        else
            break;
        end
    end
    
    Log.d("MatchRecordDataRank._getDataList", "dataCount", #list);
    return list;
end

MatchRecordDataRank._checkDataState = function(self, data)
    self.m_isDataEnd = #data <= MatchRecordDataRank.VIEW_NUMBER_PER_PAGE;
end

MatchRecordDataRank.s_socketCmdFuncMap = {
    [PHP_MATCH_RECORD_MASTER_RANK_LIST] = MatchRecordDataRank.onResponseData;
};

return MatchRecordDataRank;