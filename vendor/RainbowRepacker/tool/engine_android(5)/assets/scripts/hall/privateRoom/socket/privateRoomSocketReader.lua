require("common/commonSocketReader");
require("hall/privateRoom/socket/privateRoomSocketCmd");

PrivateRoomSocketReader = class(CommonSocketReader);

PrivateRoomSocketReader.ctor = function(self)
	self.m_logFileName = "PrivateRoomSocketReader";
end

--请求私人房列表回复
PrivateRoomSocketReader.onResponsePrivateRoomList = function(self, packetId)
	local size = self.m_socket:readInt(packetId,0);
	Log.d("wanpg-----PrivateRoomSocketReader.onResponsePrivateRoomList,收到私人房列表数量",size);
	local info = {};
	for i = 1,size do
		local tmp = {};
		tmp.tId = self.m_socket:readInt(packetId,0);
		tmp.svId = self.m_socket:readShort(packetId,0);
		tmp.gameId = self.m_socket:readShort(packetId,0);
		tmp.userCount_on = self.m_socket:readShort(packetId,0);
		tmp.userCount_max = self.m_socket:readShort(packetId,0);
		tmp.requireMoney = self.m_socket:readInt64(packetId,0);
		tmp.baseChip = self.m_socket:readInt64(packetId,0);
		tmp.roomName = self.m_socket:readString(packetId);
		tmp.password = self.m_socket:readString(packetId);
		local state = self.m_socket:readInt(packetId, 0);

		tmp.isCanEscape = (bit.band(state, 0x01) == 0x01) and true or false;
		tmp.isAlwaysBanker = (bit.band(state, 0x02) == 0x02) and true or false;
		table.insert(info, tmp);
	end

	for i = 1,size do
        info[i].ownerName = self.m_socket:readString(packetId, 0);
		info[i].tableType = self.m_socket:readInt(packetId, 0);
		info[i].times = self.m_socket:readInt(packetId, 0);
		info[i].rounds = self.m_socket:readInt(packetId, 0);
		info[i].extParams = self.m_socket:readString(packetId);
		info[i].tIdLong = self.m_socket:readInt(packetId, 0);
	end

	return info;
end

--收到房间信息
PrivateRoomSocketReader.onReceivePrivateRoomInfo = function(self, packetId)
	local info = {};
	info.tableId = self.m_socket:readInt(packetId, -1);
	info.sgid = self.m_socket:readInt(packetId, -1);--此字段暂时无用

	local state = self.m_socket:readInt(packetId, 0);

	info.isCanEscape = (bit.band(state, 0x01) == 0x01) and true or false;
	info.isAlwaysBanker = (bit.band(state, 0x02) == 0x02) and true or false;

	info.longTableId = self.m_socket:readInt(packetId, 0);
	info.time = self.m_socket:readInt(packetId, 0);
	Log.d("wanpg-----PrivateRoomSocketReader,onReceivePrivateRoomInfo",info);
	return info;
end

PrivateRoomSocketReader.s_severCmdFunMap = {
	[PRIVATE_ROOM_LIST_REPONSE]			 = PrivateRoomSocketReader.onResponsePrivateRoomList;
	[ROOM_BROADCAST_ROOM_INFO]			 = PrivateRoomSocketReader.onReceivePrivateRoomInfo;
};