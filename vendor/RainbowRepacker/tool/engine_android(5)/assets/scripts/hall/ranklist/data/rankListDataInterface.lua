require("gameData/dataInterfaceBase")
require("hall/ranklist/data/rankListConstants");
require("hall/ranklist/data/rankListData");
require("hall/ranklist/data/userRankInfo");
require("hall/ranklist/data/rankListTabData");

RankListDataInterface = class(DataInterfaceBase);

RankListDataInterface.Delegate = {
	onSubmitRankAwardMsgCallBack = "onSubmitRankAwardMsgCallBack";
	onRankListDataCallBack = "onRankListDataCallBack";
	onUserRankInfoCallBack = "onUserRankInfoCallBack";
	onGetRankListTabCallBack = "onGetRankListTabCallBack";
}

RankListDataInterface.getInstance = function()
	if not RankListDataInterface.s_instance then
		RankListDataInterface.s_instance = new(RankListDataInterface);
	end

	return RankListDataInterface.s_instance;
end

RankListDataInterface.ctor = function(self)
	self.m_rankListTabData = new(RankListTabData, self);
	self.m_rankListData = new(RankListData, self);
	self.m_userRankInfoData = new(UserRankInfo, self);
end

RankListDataInterface.dtor = function(self)
	delete(self.m_rankListTabData);
	self.m_rankListTabData = nil;

	delete(self.m_rankListData);
	self.m_rankListData = nil;

	delete(self.m_userRankInfoData);
	self.m_userRankInfoData = nil;
end

--@param mid:用户id
--@param rankType:排行榜类型
--@param flag: 1:(今日)/-1(昨天)
RankListDataInterface.getRankListData = function(self, rankType, flag, mid)
	mid = mid or kUserInfoData:getUserId();
	return self.m_rankListData:getRankListData(mid, rankType, flag);
end

RankListDataInterface.onRankListDataCallBack = function(self, isSuccess, rankType,flag, list)
	self:notify(RankListDataInterface.Delegate.onRankListDataCallBack, isSuccess, rankType,flag, list);
end

--@brief 根据mid获取某个用户的排行信息
RankListDataInterface.getUserRankInfo = function(self, rankType, flag, mid)
	mid = mid or kUserInfoData:getUserId();
	return self.m_userRankInfoData:getUserRankInfo(mid, rankType, flag);
end

RankListDataInterface.onUserRankInfoCallBack = function(self, isSuccess, mid, rankType, flag,info)
	self:notify(RankListDataInterface.Delegate.onUserRankInfoCallBack, isSuccess, mid, rankType, flag,info);
end

--@brief 填写排行榜领奖信息
--@param name:用户名字
--@param telephone:电话号码
--@param address:地址
RankListDataInterface.submitRankAwardMsg = function(self, name, telephone, address)
	local param = {
		["name"] = name;
		["tel"] = telephone;
		["addr"] = address;
	}

	OnlineSocketManager.getInstance():sendMsg(PHP_RANK_AWARD_PERMSG, param);
end

RankListDataInterface.onSubmitRankAwardMsgCallBack = function(self, isSuccess, info)
	Log.v("RankListDataInterface.onSubmitRankAwardMsgCallBack -> ", "isSuccess = ",isSuccess,"info = ",info);
	if not isSuccess or table.isEmpty(info) then
		self:notify(RankListDataInterface.Delegate.onSubmitRankAwardMsgCallBack, false);
	else
		self:notify(RankListDataInterface.Delegate.onSubmitRankAwardMsgCallBack, true, info.msg or "");
	end
end

--@brief 请求排行榜顶部tab显示列表
RankListDataInterface.getRankTabList = function(self)
	return self.m_rankListTabData:getRankTabList();
end

--@brief 排行榜顶部tab列表回调
RankListDataInterface.onGetRankListTabCallBack = function(self, isSuccess, info)
	self:notify(RankListDataInterface.Delegate.onGetRankListTabCallBack, isSuccess, info);
end

--@brief 获取优先显示的排行榜类型
RankListDataInterface.getPreferDisplayRankType = function(self)
	return self.m_rankListTabData:getPreferDisplayRankType();
end

RankListDataInterface.s_socketCmdFuncMap = {
	[PHP_RANK_AWARD_PERMSG] 		     = RankListDataInterface.onSubmitRankAwardMsgCallBack;
};
