require("common/commonSocketWriter");
require("hall/privateRoom/socket/privateRoomSocketCmd");

PrivateRoomSocketWriter = class(CommonSocketWriter);

PrivateRoomSocketWriter.ctor = function(self)
	self.m_logFileName = "PrivateRoomSocketWriter";
    Log.d("PrivateRoomSocketWriter.ctor");
end 

PrivateRoomSocketWriter.dtor = function(self)
    Log.d("PrivateRoomSocketWriter.dtor");
end 
    
--搜索私人房
PrivateRoomSocketWriter.onRequestSearchPrivateRoom = function(self, packetId, keywords)
    self.m_socket:writeString(packetId, keywords or "");
end

--创建私人房
PrivateRoomSocketWriter.onRequestCreatePrivateRoom = function(self, packetId, info)
	self.m_socket:writeShort(packetId,info.gameId);
	self.m_socket:writeInt(packetId,info.baseChip or 0);
	self.m_socket:writeString(packetId,info.roomName or "");
	self.m_socket:writeString(packetId,info.password or "");
	self.m_socket:writeInt(packetId,info.requireMoney or 0);
	self.m_socket:writeString(packetId, "55ff85e777d50680fb52935076d7e55b");
	self.m_socket:writeString(packetId,info.userinfo or "");
	self.m_socket:writeInt(packetId,info.flag or 0); --server没有用

	local scapeState = info.isEscape and 0x01 or 0;	
	local bankerIndex = info.bankerIndex;
	local bankerState = 0;
	if bankerIndex == 1 then
		--轮庄
		bankerState = 0;
	elseif bankerIndex == 2 then
		--始终为庄家
		bankerState = 0x02;
	elseif bankerIndex == 3 then
		--始终为闲家
		bankerState = 0x04;
	end
	local state = bit.bor(scapeState, bankerState);

	self.m_socket:writeInt(packetId, state or 0); --允许游戏中途离开游戏，1:可以；0:否

	self.m_socket:writeString(packetId, info.param or "[]");

	self.m_socket:writeInt(packetId, info.tableType or 0);
	self.m_socket:writeInt(packetId, info.times or 0);
	self.m_socket:writeInt(packetId, info.rounds or 0);
end

--进入私人房
PrivateRoomSocketWriter.onRequestEnterPrivateRoom = function(self, packetId, info)
	self.m_socket:writeShort(packetId,info.gameId);
	self.m_socket:writeInt(packetId,info.serverId);
	self.m_socket:writeInt(packetId,info.tableId);
	self.m_socket:writeInt(packetId,info.mid);
	self.m_socket:writeString(packetId,"55ff85e777d50680fb52935076d7e55b");
	self.m_socket:writeString(packetId,info.userinfo);
	self.m_socket:writeInt(packetId,info.flag or 0);-- //允许游戏中途离开游戏，1:可以；0:否
	self.m_socket:writeString(packetId,info.password);
	self.m_socket:writeInt(packetId, info.tableType or 0);
	self.m_socket:writeInt(packetId, info.times or 0);
	self.m_socket:writeInt(packetId, info.rounds or 0);
end

PrivateRoomSocketWriter.s_clientCmdFunMap = {
	[SEARCH_PRIVATE_ROOM_REQUEST]	= PrivateRoomSocketWriter.onRequestSearchPrivateRoom;
	[CREATE_PRIVATE_ROOM_REQUEST]	= PrivateRoomSocketWriter.onRequestCreatePrivateRoom;
	[ENTER_PRIVATE_ROOM_REQUEST]	= PrivateRoomSocketWriter.onRequestEnterPrivateRoom;
};