require("gameData/gameData");

--@brief 个人的排行信息

UserRankInfo = class(GameData);

UserRankInfo.Delegate = {
	onUserRankInfoCallBack = "onUserRankInfoCallBack";
}

UserRankInfo.initData = function(self)
	self.m_data = {}; -- V["rankType"]["flag"]["mid"] = info
	self.m_updateFlagMap = {};
end

--@override
--@param mid:用户id
--@param rankType:排行榜类型
--@param flag: 1:(今日)/-1(昨天)
UserRankInfo.requestData = function(self, mid, rankType, flag)
	local param = {
		["mid"] = mid;
		["type"] = rankType;
		["flag"] = tonumber(flag) or RankListConstants.eFlag.Today;
	};

	OnlineSocketManager.getInstance():sendMsg(PHP_GET_RANK_INFO, param);
end

UserRankInfo.onSocketCBRankMineInfo = function(self, isSuccess, info, requestData)
	Log.v("UserRankInfo.onSocketCBRankMineInfo -> ", "isSuccess = ",isSuccess,"info = ",info,"requestData = ",requestData);

	local rankType = requestData.type or RankListConstants.eRankType.Money;
	local flag = requestData.flag or RankListConstants.eFlag.Today;
	local mid = requestData.mid or -1;

	if isSuccess then
		self.m_updateFlagMap[rankType] = self.m_updateFlagMap[rankType] or {};
		self.m_updateFlagMap[rankType][flag] = self.m_updateFlagMap[rankType][flag] or {};
		self.m_updateFlagMap[rankType][flag][mid] = true;
		self:updateData(true, info, mid, flag);
	end

	local list = self:__getUserRankInfo(mid, rankType, flag);
	self:execDelegate(UserRankInfo.Delegate.onUserRankInfoCallBack, isSuccess, mid, rankType, flag, list);
end

--@override
UserRankInfo.updateMemData = function(self, data, mid, flag)
	if table.isEmpty(data) then
		return;
	end

	local afterFomartData = self:__formatData(data);
	self:__insertUserRankInfo(afterFomartData, mid, flag);
end

UserRankInfo.getUserRankInfo = function(self, mid, rankType, flag)
	if not ( self.m_updateFlagMap[rankType] and self.m_updateFlagMap[rankType][flag] and self.m_updateFlagMap[rankType][flag][mid] ) then
		self:requestData(mid, rankType, flag);	
	end

	return self:__getUserRankInfo(mid, rankType, flag);
end

UserRankInfo.__getUserRankInfo = function(self, mid, rankType, flag)
	rankType = tostring(rankType);
	mid = tostring(mid);
	flag = tostring(flag);

	local data = self.m_data[rankType] and self.m_data[rankType][flag] and self.m_data[rankType][flag][mid];
	return table.verify(data);
end

UserRankInfo.__insertUserRankInfo = function(self, data, mid, flag)
	local rankType = data.ranktab or RankListConstants.eRankType.Money;
	rankType = tostring(rankType);
	mid = tostring(mid);
	flag = tostring(flag);

	self.m_data[rankType] = table.verify( self.m_data[rankType] );
	self.m_data[rankType][flag] = table.verify( self.m_data[rankType][flag] );
	self.m_data[rankType][flag][mid] = data;
end

UserRankInfo.__formatData = function(self, data)
	data.ranktab = tostring(data.ranktab) or RankListConstants.eRankType.Money;
	data.nick = tostring(data.nick) or "";
	data.icon = tostring(data.icon) or "";
	data.account = tonumber(data.account) or 0;
	data.curpos  = tonumber(data.curpos) or 0;
	data.reward  = tonumber(data.reward) or 0;
	data.name    = tostring(data.name) or "";
	data.tel     = tostring(data.tel) or "";
	data.addr    = tostring(data.addr) or "";
	return data;
end

--@override
UserRankInfo.loadDictData = function(self, dict)
	local strData = dict:getString("UserRankData");
	local userRankData = json.decode(strData);
	if table.isTable(userRankData) then
		self.m_data = userRankData;
	end
end

--@override
UserRankInfo.saveDictData = function(self, dict)
	dict:setString("UserRankData", json.encode(self.m_data) or "");
end

--@override
UserRankInfo.getLocalDictName = function(self)
	return "UserRankData";
end

UserRankInfo.s_socketCmdFuncMap = {
	[PHP_GET_RANK_INFO] 		         = UserRankInfo.onSocketCBRankMineInfo;
};