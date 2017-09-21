require("gameData/gameData");
require("core/dict");

--比赛历史战绩数据
local MatchRecordDataHistory = class(GameData);

MatchRecordDataHistory.DATA_NUMBER_PER_PAGE = 20;
MatchRecordDataHistory.VIEW_NUMBER_PER_PAGE = 5;

MatchRecordDataHistory.Delegate = {
    onGetMatchRecordHistory = "onGetMatchRecordHistory";
};

MatchRecordDataHistory.ctor = function(self)   
end

MatchRecordDataHistory.dtor = function(self)
end

MatchRecordDataHistory.initData = function(self)
    self.m_data = {};
    self.m_havemore = 0;
    self:reset();
end

MatchRecordDataHistory.reset = function(self)
    self.m_hasRequestData = false; -- 重新拉取数据标志
    self.m_currentPage = 1; -- 分页拉取，标记当前页
    self.m_isDataEnd = false; -- 分页拉取，标记是否还有数据
end

MatchRecordDataHistory.updateMemData = function(self, data, page)
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

MatchRecordDataHistory.getData = function(self)
	self:requestData();

    local list = self:_getDataList(self.m_currentPage);
    self:_checkDataState(list);

    -- 第一次读取缓存为空则不显示缓存数据
    if not (not self.m_hasRequestData and table.isEmpty(list)) then
        self:execDelegate(MatchRecordDataHistory.Delegate.onGetMatchRecordHistory, list, false);
    end
end

MatchRecordDataHistory.getDataNext = function(self)
    if not self.m_hasRequestData then
        return; 
    end

    if self.m_havemore == 1 then
        Log.d("MatchRecordDataHistory.getDataNext", "currentPage", self.m_currentPage, "page", self.m_currentPage + 1);
        OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_MATCH_LIST, {page = self.m_currentPage + 1});
    else
        self.m_isDataEnd = true;
        self:execDelegate(MatchRecordDataHistory.Delegate.onGetMatchRecordHistory, self:_getDataList(self.m_currentPage), true);
    end
end

MatchRecordDataHistory.hasDataNext = function(self)
    return not self.m_isDataEnd;
end

MatchRecordDataHistory.requestData = function(self)
	if not self.m_hasRequestData then
		OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_MATCH_LIST, {page = 1});
	end
end

MatchRecordDataHistory.onResponseData = function(self, isSuccess, data, sendParam)
    if table.isEmpty(sendParam) or not sendParam.page then
        return;
    end

    if not (sendParam.page == 1 or self.m_currentPage + 1 == sendParam.page) then
        return;
    end

    if isSuccess then
        self:updateData(true, data, sendParam.page);

        Log.d("MatchRecordDataHistory.onResponseData", "page", sendParam.page);

        local list = self:_getDataList(sendParam.page)
        self:_checkDataState(list);
        self:execDelegate(MatchRecordDataHistory.Delegate.onGetMatchRecordHistory, list, sendParam.page > 1);
    end
end

-- 只缓存第一页
MatchRecordDataHistory.loadDictData = function(self, dict)
    local data = table.verify(json.decode(dict:getString("data")));

    if not table.isEmpty(data[1]) then
        self.m_data[1] = self:_analyseDataList(data);
    end
    self.m_havemore = dict:getInt("havemore");
end

MatchRecordDataHistory.saveDictData = function(self, dict)
    local data = json.encode(self.m_data[1] or {}) or "";
    dict:setString("data", data);
    dict:setInt("havemore", self.m_havemore);
end

MatchRecordDataHistory.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "match_record_data_history_" .. self.m_userId;
end

----------------------------------------------------------------------------------

MatchRecordDataHistory._analyseData = function(self, data)
    data = table.verify(data);
    local tmp = {
        havemore = number.valueOf(data.havemore),
        list = self:_analyseDataList(data.list),
    };
	return tmp;
end

MatchRecordDataHistory._analyseDataList = function(self, data)
    local tmp = {};

    for k, v in pairs(table.verify(data)) do
        local item = self:_analyseDataItem(v);
        table.insert(tmp, item);
    end 

    return tmp;
end

MatchRecordDataHistory._analyseDataListInsert = function(self, list, data)
    for k, v in pairs(table.verify(data)) do
        local item = self:_analyseDataItem(v);
        table.insert(list, item);
    end 
end


MatchRecordDataHistory._analyseDataItem = function(self, data)
    data = table.verify(data);
    local item = {
        matchname = tostring(data.matchname or "") or "",
        rank = number.valueOf(data.rank),
        playtime = number.valueOf(data.playtime),
        mid = number.valueOf(data.mid),
        eliminate = number.valueOf(data.eliminate),
        rewards = tostring(data.rewards or "") or "",
    };
    return item;
end

MatchRecordDataHistory._getDataList = function(self, page)
    local list = {};
    for k, v in ipairs(self.m_data) do
        if k <= page then
            self:_analyseDataListInsert(list, v);
        else
            break;
        end
    end
    Log.d("MatchRecordDataHistory._getDataList", "dataCount", #list);
    return list;
end

MatchRecordDataHistory._checkDataState = function(self, data)
    self.m_isDataEnd = #data <= MatchRecordDataHistory.VIEW_NUMBER_PER_PAGE;
end

MatchRecordDataHistory.s_socketCmdFuncMap = {
    [PHP_MATCH_RECORD_MATCH_LIST] = MatchRecordDataHistory.onResponseData;
};

return MatchRecordDataHistory;