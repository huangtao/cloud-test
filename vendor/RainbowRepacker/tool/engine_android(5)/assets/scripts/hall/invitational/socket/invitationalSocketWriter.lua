require("common/commonSocketWriter");
require("hall/invitational/socket/invitationalSocketCmd")

InvitationalSocketWriter = class(CommonSocketWriter)

InvitationalSocketWriter.ctor = function(self)
	self.m_logFileName = "InvitationalSocketWriter"

end 

InvitationalSocketWriter.dtor = function(self)
end 
 
--创建邀请赛
InvitationalSocketWriter.onRequestCreateInvitational = function(self, packetId, info)
	self.m_socket:writeShort(packetId,info.game_data and info.game_data.id or 0) --游戏id
	self.m_socket:writeInt(packetId,info.time) --开赛时间
	self.m_socket:writeInt(packetId,info.min_players) --最低开赛人数
	self.m_socket:writeInt(packetId,info.award_type)  --奖品类型
	self.m_socket:writeInt(packetId,info.award)  --奖品
	self.m_socket:writeInt(packetId,info.award_count) --获奖人数
	self.m_socket:writeInt(packetId,info.fee_type) --报名费用类型
	self.m_socket:writeInt(packetId,info.fee) --报名费用
	self.m_socket:writeString(packetId,info.password or "") --密码
	self.m_socket:writeString(packetId, info.match_name) --比赛名称
	self.m_socket:writeString(packetId,info.userinfo or "") --用户信息
	self.m_socket:writeInt(packetId, info.regionId)
end

--报名邀请赛
InvitationalSocketWriter.onRequestEnrollInvitational = function(self, packetId, info)
    self.m_socket:writeInt(packetId,info.uid)
    self.m_socket:writeInt(packetId,info.roomId)
    self.m_socket:writeString(packetId,info.key)
    self.m_socket:writeString(packetId,info.userInfo or "")
    self.m_socket:writeInt(packetId,info.flag)
    self.m_socket:writeString(packetId,info.matchentrycode or "")
    self.m_socket:writeInt(packetId, info.regionId)
    Log.v("InvitationalSocketWriter.onRequestEnrollInvitational",info)
end

--请求邀请赛详细信息
InvitationalSocketWriter.onRequestEnterInvitational = function(self, packetId, info)
	self.m_socket:writeInt(packetId,info.uid) --用户ID
	self.m_socket:writeInt(packetId,info.code) --比赛编号
	self.m_socket:writeString(packetId,"55ff85e777d50680fb52935076d7e55b")
	self.m_socket:writeString(packetId,info.userinfo or "")
	Log.v("onRequestEnterInvitational",info)
end

--获取我创建的申请赛
InvitationalSocketWriter.onMyMatchInvitational = function(self, packetId, info)

end

--领取退还奖池
InvitationalSocketWriter.onReceiveReturnInvitational = function(self, packetId, info)
	self.m_socket:writeInt(packetId, info.matchId)
	self.m_socket:writeString(packetId, info.matchConfigId)
end

--请求当前排名
InvitationalSocketWriter.onCurRankInvitational = function(self, packetId, info)
	self.m_socket:writeInt(packetId,info.matchId or 0)
    self.m_socket:writeInt(packetId,info.userInfoStr or 0)
end

InvitationalSocketWriter.s_clientCmdFunMap = {
	[CREATE_INVITATIONAL_REQUEST] = InvitationalSocketWriter.onRequestCreateInvitational,
	[ENTER_INVITATIONA_REQUEST]	= InvitationalSocketWriter.onRequestEnterInvitational,
	[ENROll_INVITATIONA_REQUEST]	= InvitationalSocketWriter.onRequestEnrollInvitational,
	[MY_MATCH_INVITATIONA_REQUEST]	= InvitationalSocketWriter.onMyMatchInvitational,
	[RECEIVE_RETURN_INVITATIONA_REQUEST] = InvitationalSocketWriter.onReceiveReturnInvitational,
	[CUR_RANK_INVITATIONA_REQUEST] = InvitationalSocketWriter.onCurRankInvitational,
}