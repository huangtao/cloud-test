require("common/commonSocketReader")
require("hall/invitational/socket/invitationalSocketCmd")

InvitationalSocketReader = class(CommonSocketReader)

InvitationalSocketReader.ctor = function(self)
	self.m_logFileName = "InvitationalSocketReader"
end

--请求邀请赛详细信息回复
InvitationalSocketReader.onResponseInvitationalDetail = function(self, packetId)
	local info = {}
	info.uid = self.m_socket:readInt(packetId, 0)
	info.status = self.m_socket:readInt(packetId, 0)
	info.signupcount = self.m_socket:readInt(packetId, 0)
	info.mtime = self.m_socket:readInt(packetId, 0)
	info.matchtype = self.m_socket:readInt(packetId, 0)
	info.config = self.m_socket:readString(packetId)
	return info
end

--创建邀请赛回复
InvitationalSocketReader.onResponseInvitationalCreate = function(self, packetId)
	local info = {}
	info.roomId = self.m_socket:readInt(packetId, 0)
	info.moneyInfo = self.m_socket:readString(packetId)
	return info
end

--创建邀请赛回复
InvitationalSocketReader.onResponseMyMatchInvitational = function(self, packetId)
	local info = {}
	local size = self.m_socket:readInt(packetId, 0)
	for i=1,size do
		info[i] = {}
		info[i] = self.m_socket:readString(packetId)
	end
	return info
end

--邀请赛进入错误回复
InvitationalSocketReader.onResponseErrorTipsInvitational = function(self, packetId)
	local info = {}
	info.uid = self.m_socket:readInt(packetId, 0)
	info.errCode = self.m_socket:readInt(packetId, 0)
	return info
end

--退还奖池回复
InvitationalSocketReader.onReceiveReturnInvitational = function(self, packetId)
	local info = {}
	info.uid = self.m_socket:readInt(packetId, 0)
	info.moneyInfo = self.m_socket:readString(packetId)
	return info
end

--刷新列表回复
InvitationalSocketReader.onRefreshMyMatchInvitational = function(self, packetId)
	local matchInfo = self.m_socket:readString(packetId)
	return matchInfo
end

--请求当前排名回复
InvitationalSocketReader.onCurRankInvitational = function(self, packetId)
	local info = {}
	info.count = self.m_socket:readInt(packetId, 0)--总人数
	info.pageCount = self.m_socket:readInt(packetId, 0)--总页数
	info.curPage = self.m_socket:readInt(packetId, 0)--当前页
	info.curCount = self.m_socket:readInt(packetId, 0)--当前页人数
	info.rank = {}
	for i=1,info.curCount do
		info.rank[i] = {}
		info.rank[i].uid = self.m_socket:readInt(packetId, 0)
		info.rank[i].userInfoStr = self.m_socket:readString(packetId)
	end
	return info
end

--退还报名费回复
InvitationalSocketReader.onFeeReturnInvitational = function(self, packetId)
	local info = {}
	info.uid = self.m_socket:readInt(packetId, 0)
	info.moneyInfo = self.m_socket:readString(packetId)
	return info
end

InvitationalSocketReader.s_severCmdFunMap = {
	[INVITATIONA_DETAIL_REPONSE]			 = InvitationalSocketReader.onResponseInvitationalDetail,
	[INVITATIONA_CREATE_REPONSE]			 = InvitationalSocketReader.onResponseInvitationalCreate,
	[INVITATIONA_MY_MATCH_REPONSE]			 = InvitationalSocketReader.onResponseMyMatchInvitational,
	[INVITATIONA_ERROR_TIPS_REPONSE]		 = InvitationalSocketReader.onResponseErrorTipsInvitational,
	[INVITATIONA_RECEIVE_RETURN_REPONSE]	 = InvitationalSocketReader.onReceiveReturnInvitational,
	[INVITATIONA_REFRESH_MY_MATCH_REPONSE]	 = InvitationalSocketReader.onRefreshMyMatchInvitational,
	[INVITATIONA_CUR_RANK_REPONSE]	 		 = InvitationalSocketReader.onCurRankInvitational,
	[INVITATIONA_FEE_RETURN_REPONSE]	 	 = InvitationalSocketReader.onFeeReturnInvitational,
};