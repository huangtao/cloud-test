require("gameBase/socketProcesser")
require("hall/onlineSocket/globalSocketCmd");
require("libs/json");

RankSocketProcesser = class(SocketProcesser)

-- 获取rank list 列表
RankSocketProcesser.onGetRankListCallBack = function(self, isSuccessed, ranlList)
	self.m_controller:handleSocketCmd(PHP_GET_RANK_LIST, isSuccessed, ranlList);
end

-- 获取我的排名信息列表
RankSocketProcesser.onGetMineRankInfoCallBack = function(self, isSuccessed, rankInfo)
	self.m_controller:handleSocketCmd(PHP_GET_RANK_INFO, isSuccessed, rankInfo);
end

RankSocketProcesser.s_severCmdEventFuncMap = {
	[PHP_GET_RANK_LIST]		= RankSocketProcesser.onGetRankListCallBack;
	[PHP_GET_RANK_INFO]		= RankSocketProcesser.onGetMineRankInfoCallBack;
};