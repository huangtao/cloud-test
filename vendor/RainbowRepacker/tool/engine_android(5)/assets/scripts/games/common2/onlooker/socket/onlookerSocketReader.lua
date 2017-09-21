local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");

local OnlookerSocketReader = class(CommonSocketReader);

OnlookerSocketReader.replyLoginOnlooker = function(self,packetId)
	local info = {};
	info.errorCode = self.m_socket:readByte(packetId,-1); --0:进入成功, 1. 其他错误 2. 该用户不在游戏  3.比赛已经结束 4.被申请围观的玩家不允许围观
	if info.errorCode == 0 then 
		info.tMid = self.m_socket:readInt(packetId,0);--被围观者id
		info.tUserInfo = self.m_socket:readString(packetId);--被围观者信息
		info.gameId = self.m_socket:readInt(packetId,0);--围观的游戏id
		info.gameLevel = self.m_socket:readInt(packetId,0);--围观的游戏level
		info.gamePlayType = self.m_socket:readInt(packetId,0);--围观的游戏玩法
		info.gamePropertyId = self.m_socket:readInt(packetId,0);--围观的游戏的货币类型	
		info.onlookersCount = self.m_socket:readInt(packetId,0);--围观人数
		local onlookers = {};
		for i = 1,info.onlookersCount do
			onlookers[i] = {};
			onlookers[i].userId = self.m_socket:readInt(packetId,0);--围观者id
			onlookers[i].userInfo = self.m_socket:readString(packetId);--围观者信息
		end
		info.onlookers = onlookers;
	end 
	info.extend = self.m_socket:readString(packetId);--扩展字段(json)
	
	Log.d("OnlookerSocketReader.replyLoginOnlooker",info);
	return info;
end

OnlookerSocketReader.replyLogoutOnlooker = function(self,packetId)
	local info = {};
	info.errorCode = self.m_socket:readByte(packetId,-1); --0:退出成功,~= 0失败
	info.isGameEnd = self.m_socket:readByte(packetId,0) == 1;--牌局是否已结束,1 结束 0 没有结束
	Log.d("OnlookerSocketReader.replyLogoutOnlooker",info);
	return info;
end

OnlookerSocketReader.onServerBroadcastBarrage = function(self,packetId)	
	local userId = self.m_socket:readInt(packetId,0);--发言者id
	local msgType = self.m_socket:readByte(packetId,0);--发言类型：0:普通，1:道具
	local msg = self.m_socket:readString(packetId);
	local info = json.decode(msg);
	info = table.verify(info);
	info.userId = userId;
	Log.d("OnlookerSocketReader.onServerBroadcastBarrage",info);
	return info;
end

OnlookerSocketReader.onServerBroadcastShutup = function(self,packetId)
    local info = {};
	info.msgInfo = self.m_socket:readString(packetId);
	Log.d("OnlookerSocketReader.onServerBroadcastShutup",info);
	return info;
end

OnlookerSocketReader.s_severCmdFunMap = {
	[OnlookerSocketCmd.S_REPLY_LOGIN_ONLOOKER] = "replyLoginOnlooker";
	[OnlookerSocketCmd.S_REPLY_LOGOUT_ONLOOKER] = "replyLogoutOnlooker";
	[OnlookerSocketCmd.S_BROADCAST_BARRAGE] = "onServerBroadcastBarrage";
	[OnlookerSocketCmd.S_BROADCAST_USER_SHUTUP]  = "onServerBroadcastShutup";
};

return OnlookerSocketReader;