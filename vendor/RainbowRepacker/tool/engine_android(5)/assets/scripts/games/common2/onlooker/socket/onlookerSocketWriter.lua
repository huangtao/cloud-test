local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");

local OnlookerSocketWriter = class(CommonSocketWriter);

OnlookerSocketWriter.requestLoginOnlooker = function(self,packetId,info)
	self.m_socket:writeString(packetId,info.userInfo or "");--围观者信息
	self.m_socket:writeInt(packetId,info.tmid or 0); 	--被围观者id
	self.m_socket:writeShort(packetId,info.keepOnlooker or 0);--是否一直围观,1:持续围观,0:看完被围观者正在打的那桌就被server踢出	
	self.m_socket:writeString(packetId,info.extend or "");--扩展字段(json)
end

OnlookerSocketWriter.requestLogoutOnlooker = function(self,packetId,info)	
	self.m_socket:writeInt(packetId,info.tmid or 0); 	--被围观者id
end

OnlookerSocketWriter.requestSendBarrage = function(self,packetId,info)
	self.m_socket:writeByte(packetId,info.msgType);--发言类型：0:普通，1:道具
	self.m_socket:writeString(packetId,info.msg or ""); --json
end

OnlookerSocketWriter.requestChatReport = function(self,packetId, info)
    self.m_socket:writeInt(packetId, info.mid or 0);
    self.m_socket:writeInt(packetId, info.otherMid or 0);
end

OnlookerSocketWriter.s_clientCmdFunMap = {
	[OnlookerSocketCmd.C_REQUEST_LOGIN_ONLOOKER] = "requestLoginOnlooker";
	[OnlookerSocketCmd.C_REQUEST_LOGOUT_ONLOOKER] = "requestLogoutOnlooker";
	[OnlookerSocketCmd.C_REQUEST_SEND_BARRAGE] = "requestSendBarrage";
	[OnlookerSocketCmd.C_REQUEST_CHAT_COMPLAINT] = "requestChatReport";
};

return OnlookerSocketWriter;