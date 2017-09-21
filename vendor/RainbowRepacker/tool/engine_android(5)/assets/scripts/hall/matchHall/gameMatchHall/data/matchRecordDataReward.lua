require("gameData/gameData");
require("core/dict");

--比赛奖励累计数据
local MatchRecordDataReward = class(GameData);

MatchRecordDataReward.Delegate = {
    onGetMatchRecordReward = "onGetMatchRecordReward";
};

MatchRecordDataReward.ctor = function(self)   
end

MatchRecordDataReward.dtor = function(self)
end

MatchRecordDataReward.initData = function(self)
    self.m_data = {};
    self.m_hasRequestData = false;
end

MatchRecordDataReward.reset = function(self)
	self.m_hasRequestData = false;
end

MatchRecordDataReward.updateMemData = function(self, data)
    self.m_data = self:_analyseData(data); 
end

MatchRecordDataReward.getData = function(self)
	self:requestData();

    if not (not self.m_hasRequestData and table.isEmpty(self.m_data)) then
        self:execDelegate(MatchRecordDataReward.Delegate.onGetMatchRecordReward, self.m_data);
    end
end

MatchRecordDataReward.requestData = function(self)
	if not self.m_hasRequestData then
		OnlineSocketManager.getInstance():sendMsg(PHP_MATCH_RECORD_REWARD_STATISTICS);
	end
end

MatchRecordDataReward.onResponseData = function(self, isSuccess, data, sendParam)
    if isSuccess then
        self:updateData(true, data);
    end

    self:execDelegate(MatchRecordDataReward.Delegate.onGetMatchRecordReward, self.m_data);

    self.m_hasRequestData = true;
end

MatchRecordDataReward.loadDictData = function(self, dict)
    local data = table.verify(json.decode(dict:getString("data")));
    self.m_data = self:_analyseData(data);
end

MatchRecordDataReward.saveDictData = function(self, dict)
    local data = json.encode(self.m_data) or "";
    dict:setString("data", data);
end

MatchRecordDataReward.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "match_record_data_reward_" .. self.m_userId;
end

----------------------------------------------------------------------------------

MatchRecordDataReward._analyseData = function(self, data)
    local tmp = {};

	for k, v in pairs(table.verify(data)) do
		local item = {
			type = number.valueOf(v.type),
			num = number.valueOf(v.num),
		};
		table.insert(tmp, item);
	end	

	return tmp;
end

MatchRecordDataReward.s_socketCmdFuncMap = {
    [PHP_MATCH_RECORD_REWARD_STATISTICS] = MatchRecordDataReward.onResponseData;
};

return MatchRecordDataReward;