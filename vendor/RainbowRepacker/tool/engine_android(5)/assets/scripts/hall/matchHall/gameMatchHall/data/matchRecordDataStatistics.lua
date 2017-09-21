require("gameData/gameData");
require("core/dict");

--比赛统计数据
local MatchRecordDataStatistics = class(GameData);

MatchRecordDataStatistics.Delegate = {
    onGetMatchRecordStatistics = "onGetMatchRecordStatistics";
};

MatchRecordDataStatistics.ctor = function(self)   
end

MatchRecordDataStatistics.dtor = function(self)
end

MatchRecordDataStatistics.initData = function(self)
    self.m_data = {};
    self.m_hasRequestData = false;
end

MatchRecordDataStatistics.reset = function(self)
	self.m_hasRequestData = false;
    local userData = self.m_data[kUserInfoData:getUserId()];
    self.m_data = {};
    self.m_data[kUserInfoData:getUserId()] = userData;
end

MatchRecordDataStatistics.updateMemData = function(self, data, mid)
    self.m_data[mid] = self:_analyseData(data); 
end

MatchRecordDataStatistics.getData = function(self, mid)
    if mid == kUserInfoData:getUserId() then
    	self:requestData(mid);
        self:execDelegate(MatchRecordDataStatistics.Delegate.onGetMatchRecordStatistics, self.m_data[mid] or {}, mid);
    elseif table.isEmpty(self.m_data[mid]) then
        OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_STATISTICS, {mid = mid});
    else
        self:execDelegate(MatchRecordDataStatistics.Delegate.onGetMatchRecordStatistics, self.m_data[mid], mid);
    end
end

MatchRecordDataStatistics.requestData = function(self, mid)
	if not self.m_hasRequestData then
		OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_STATISTICS, {mid = mid});
	end
end

MatchRecordDataStatistics.onResponseData = function(self, isSuccess, data, sendParam)
    if table.isEmpty(sendParam) or not sendParam.mid then
        return;
    end

    if isSuccess then
        self:updateData(true, data, sendParam.mid);
    end

    self:execDelegate(MatchRecordDataStatistics.Delegate.onGetMatchRecordStatistics, self.m_data[sendParam.mid], sendParam.mid);

    self.m_hasRequestData = true;
end

MatchRecordDataStatistics.loadDictData = function(self, dict)
    local data = table.verify(json.decode(dict:getString("data")));
    self.m_data[kUserInfoData:getUserId()] = self:_analyseData(data);
end

MatchRecordDataStatistics.saveDictData = function(self, dict)
    local data = json.encode(table.verify(self.m_data[kUserInfoData:getUserId()])) or "";
    dict:setString("data", data);
end

MatchRecordDataStatistics.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "match_record_data_statistics_" .. self.m_userId;
end

----------------------------------------------------------------------------------

MatchRecordDataStatistics._analyseData = function(self, data)
    local data = table.verify(data);
    local tmp = {
        mid = number.valueOf(data.mid),
        awards_total = number.valueOf(data.awards_total),
        finals_total = number.valueOf(data.finals_total),
        champion_total = number.valueOf(data.champion_total),
        favorite_match = tostring(data.favorite_match or "") or "",
        masterpoints = number.valueOf(data.masterpoints),
        masterlevel = number.valueOf(data.masterlevel),
        nextlevelpoints = number.valueOf(data.nextlevelpoints),
    };

    return tmp;
end

MatchRecordDataStatistics.s_socketCmdFuncMap = {
    [PHP_MATCH_RECORD_STATISTICS] = MatchRecordDataStatistics.onResponseData;
};

return MatchRecordDataStatistics;