require("common/commonSocketWriter");
require("hall/onlineSocket/globalSocketCmd");

GlobalSocketWriter = class(CommonSocketWriter);

GlobalSocketWriter.onSendLoginHall = function(self,packetId,info)
	self.m_socket:writeInt(packetId,info.userId);
	self.m_socket:writeShort(packetId,0);
	self.m_socket:writeShort(packetId,info.api);
	self.m_socket:writeInt(packetId, 1);
	self.m_socket:writeString(packetId,info.plateInfo);
	self.m_socket:writeString(packetId,info.guid or "");
	self.m_socket:writeString(packetId,info.version or "");
	self.m_socket:writeInt(packetId, info.appid or 0);
	self.m_socket:writeInt(packetId, info.hallVersion);
end

GlobalSocketWriter.onSendRoomLogout = function(self,packetId)

end

GlobalSocketWriter.onDefendAttackSendIpPort = function(self, packetId, info)
	Log.v("GlobalSocketWriter.onDefendAttackSendIpPort info = ", info);
	self.m_socket:writeString(packetId, info.ip);
	self.m_socket:writeShort(packetId, info.port);
end

GlobalSocketWriter.s_clientCmdFunMap = {
	[HALL_SEND_LOGIN] 				= GlobalSocketWriter.onSendLoginHall;
	[ROOM_SEND_LOGOUT] 				= GlobalSocketWriter.onSendRoomLogout;
	[SERVER_DEFEND_ATTACK_SEND_IP_PORT]      = GlobalSocketWriter.onDefendAttackSendIpPort;
};