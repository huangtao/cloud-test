require("games/common2/onlooker/data/onlookerPlayerManager");
local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");
require("games/common2/mechine/mechineManage");

local OnlookerSocketProcesser = class(SocketHandlerBase);

OnlookerSocketProcesser.onPreReplyLoginOnlooker = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_REPLY_LOGIN_ONLOOKER, info);
	return true;
end
OnlookerSocketProcesser.replyLoginOnlooker = function(self,info,packetInfoId)
	local errorCode = info.errorCode;
	if errorCode == 0 then --进入成功  		
		local action = GameMechineConfig.ACTION_ENTER_ONLOOKER_SUC;
		MechineManage.getInstance():receiveAction(action);

		GameInfoIsolater.getInstance():setCurGameId(info.gameId);
		GameInfoIsolater.getInstance():setCurRoomLevelId(info.gameLevel);

		GameRoomData.getInstance():setGameId(info.gameId);		
		GameRoomData.getInstance():setRoomLevel(info.gameLevel);
		GameRoomData.getInstance():setCurRoomPlayType(info.gamePlayType);
		GameRoomData.getInstance():setCurRoomPropertyId(info.gamePropertyId);

		GameRoomData.getInstance():setInfoByType("onlookerId",info.tMid);

		local seat = PlayerSeat.getInstance():getMyLocalSeat();
		local tPlayer = GamePlayer2.formatUserInfo(info.tUserInfo);
		tPlayer:setMid(info.tMid);
		GamePlayerManager2.getInstance():addPlayer(tPlayer,seat);

		local action = GameMechineConfig.ACTION_NS_RECEIVE_ONLOOKER_EXTEND;
		MechineManage.getInstance():receiveAction(action,info.extend); 
		
		local onlookers = table.verify(info.onlookers);
		for _,v in pairs(onlookers) do 
			local player = GamePlayer2.formatUserInfo(v.userInfo);
			player:setMid(v.userId);
			OnlookerPlayerManager.getInstance():addOnlooker(player);
		end 		

		local action = GameMechineConfig.ACTION_ONLOOKER_LOGIN;
		MechineManage.getInstance():receiveAction(action);
	else --errorCode 0:进入成功, 1. 其他错误 2. 该用户不在游戏  3.比赛已经结束 4.被申请围观的玩家不允许围观
		local msg = "你当前围观的牌桌已结束";
		if errorCode == 4 then 
			msg = "玩家不允许你围观";
		end 		
		self:showToast(msg);

		local action = GameMechineConfig.ACTION_NS_RECEIVE_ONLOOKER_EXTEND;
		MechineManage.getInstance():receiveAction(action,info.extend); 

		--进入失败
		local action = GameMechineConfig.ACTION_EXIT_ONLOOKER_SUC;
		MechineManage.getInstance():receiveAction(action);
	end 

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

OnlookerSocketProcesser.onPreReplyLogoutOnlooker = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_REPLY_LOGOUT_ONLOOKER, info);
	return true;
end
OnlookerSocketProcesser.replyLogoutOnlooker = function(self,info,packetInfoId)
	if info.errorCode == 0 then 
		if info.isGameEnd then 
			local msg = "你当前围观的牌桌已结束";
			self:showToast(msg); 
		end 

		local action = GameMechineConfig.ACTION_EXIT_ONLOOKER_SUC;
		MechineManage.getInstance():receiveAction(action);
	end 
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

OnlookerSocketProcesser.onPreServerBroadcastBarrage = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_BROADCAST_BARRAGE, info);
	return true;
end
OnlookerSocketProcesser.onServerBroadcastBarrage = function(self,info,packetInfoId)
	local action = GameMechineConfig.ACTION_NS_RECEIVE_BARRAGE_MSG;
	MechineManage.getInstance():receiveAction(action,info);

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

OnlookerSocketProcesser.onPreServerBroadcastShutup = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_BROADCAST_USER_SHUTUP, info);
	return true;
end
OnlookerSocketProcesser.onServerBroadcastShutup = function(self,info,packetInfoId)
	local action = GameMechineConfig.ACTION_NS_RECEIVE_SHUTUP;
	MechineManage.getInstance():receiveAction(action,info);

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

OnlookerSocketProcesser.showToast = function(self,msg )
	if not string.isEmpty(msg) then 
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end 
end

OnlookerSocketProcesser.s_socketCmdFuncMap = {	
	[OnlookerSocketCmd.S_REPLY_LOGIN_ONLOOKER] = "onPreReplyLoginOnlooker";
	[OnlookerSocketCmd.S_REPLY_LOGOUT_ONLOOKER] = "onPreReplyLogoutOnlooker";
	[OnlookerSocketCmd.S_BROADCAST_BARRAGE] = "onPreServerBroadcastBarrage";
	[OnlookerSocketCmd.S_BROADCAST_USER_SHUTUP]	= "onPreServerBroadcastShutup";
};
OnlookerSocketProcesser.m_socketCmdFuncMap = {
	[OnlookerSocketCmd.S_REPLY_LOGIN_ONLOOKER] = "replyLoginOnlooker";
	[OnlookerSocketCmd.S_REPLY_LOGOUT_ONLOOKER] = "replyLogoutOnlooker";
	[OnlookerSocketCmd.S_BROADCAST_BARRAGE] = "onServerBroadcastBarrage";
	[OnlookerSocketCmd.S_BROADCAST_USER_SHUTUP] = "onServerBroadcastShutup";
};

return OnlookerSocketProcesser;