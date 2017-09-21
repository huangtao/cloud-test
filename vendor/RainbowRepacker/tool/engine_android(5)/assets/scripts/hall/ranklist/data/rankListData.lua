require("gameData/gameData");

--@brief 排行榜列表数据源

RankListData = class(GameData);

RankListData.Delegate = {
	onRankListDataCallBack = "onRankListDataCallBack";
};

RankListData.initData = function(self)
	self.m_data = {}; -- V["rankType"]["flag"] = list
	self.m_updateFlagMap = {};
end

--@override
--@param mid:用户id
--@param rankType:排行榜类型
--@param flag: 1:(今日)/-1(昨天)
RankListData.requestData = function(self, mid, rankType, flag)
	local param = {
		["mid"] = mid;
		["type"] = rankType;
		["flag"] = tonumber(flag) or RankListConstants.eFlag.Today;
	};

	OnlineSocketManager.getInstance():sendMsg(PHP_GET_RANK_LIST, param);
end

RankListData.onSocketCBRankList = function(self, isSuccess, info, requestData)
	Log.v("RankListData.onSocketCBRankList -> ", "isSuccess = ",isSuccess,"info = ",info,"requestData = ",requestData);
	
	local rankType = requestData.type or RankListConstants.eRankType.Money;
	local flag = requestData.flag or RankListConstants.eFlag.Today;
	if isSuccess then
		self.m_updateFlagMap[rankType] = self.m_updateFlagMap[rankType] or {};
		self.m_updateFlagMap[rankType][flag] = true;
		self:updateData(true, info, flag);
	end

	local list = self:__getRankList(rankType, flag);
	self:execDelegate(RankListData.Delegate.onRankListDataCallBack, isSuccess, rankType, flag, list);
end

RankListData.getRankListData = function(self, mid, rankType, flag)
	local updateFlag = self.m_updateFlagMap[rankType] and self.m_updateFlagMap[rankType][flag]
	if not updateFlag then
		self:requestData(mid, rankType, flag);		
	end

	return self:__getRankList(rankType, flag), updateFlag
end

--@override
RankListData.updateMemData = function(self, data, flag)
	if table.isEmpty(data) or not data.ranktab then
		return;
	end

	flag = flag or RankListConstants.eFlag.Today;
	self:__sortWithPos(data);

	local afterFormatList = {};
	for k, v in pairs( table.verify(data.list) ) do
		v = self:__formatData(v);
		v.index = k;
		v.tabType = tostring(data.ranktab) or "";
		table.insert(afterFormatList, v);
	end

	self:__insertRankDataWithType(data.ranktab, afterFormatList, flag);
end

RankListData.__insertRankDataWithType = function(self, rankType, list, flag)
	self.m_data[rankType] = table.verify( self.m_data[rankType] );
	self.m_data[rankType][tostring(flag)] = list; --fuck the json.encode <-> json.decode
end

RankListData.__getRankList = function(self, rankType, flag)
	strFlag = tostring(flag);
	local data = self.m_data[rankType] and self.m_data[rankType][strFlag]; 
	return table.verify(data);
end

RankListData.__formatData = function(self, itemData)
	itemData.mid = tonumber(itemData.mid) or 0;
	itemData.nick = tostring(itemData.nick) or "";
	itemData.icon = tostring(itemData.icon) or "";
	itemData.account = tostring(itemData.account) or "0";
	itemData.isVip = tonumber(itemData.isVip) or 0;
	itemData.pos   = tonumber(itemData.pos) or 0;
	itemData.sex   = tonumber(itemData.sex) or UserInfoData.eSex.Secret;
    itemData.cid   = tonumber(itemData.cid) or 0;
	return itemData; 
end

RankListData.__sortWithPos = function(self, data)
	table.sort(data, function(a, b)
		local a_pos = tonumber(a.pos) or 0;
		local b_pos = tonumber(b.pos) or 0;
		return b_pos > a_pos;
		end);	
end

--@override
RankListData.loadDictData = function(self, dict)
	local strData = dict:getString("rankData");
	local rankData = json.decode(strData);
	if table.isTable(rankData) then
		self.m_data = rankData;
	end
end

--@override
RankListData.saveDictData = function(self, dict)
	dict:setString("rankData", json.encode(self.m_data) or "");
end

--@override
RankListData.getLocalDictName = function(self)
	return "RankListData";
end

RankListData.s_socketCmdFuncMap = {
	[PHP_GET_RANK_LIST] 		         = RankListData.onSocketCBRankList;
};