local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");
require("games/common2/network/socket/commonGameSocketCmd2");

CommonGameSocketReader2 = class(CommonSocketReader);

CommonGameSocketReader2.log = function(self,...)
	local fileName = self:getBaseLogFileName();
	Log.addModuleCache(fileName,...);	
end 

CommonGameSocketReader2.getBaseLogFileName = function(self)
	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local fileName = GameInfoIsolater.getInstance():getGamePackageName(gameId);

	return fileName or "commonRoom";
end 

--大厅请求房间成功--指令0x210
CommonGameSocketReader2.onJoinGameResponse = function(self,packetId)
	local info = {};
	info.roomId 	= self.m_socket:readInt(packetId,0);
	info.serverId   = self.m_socket:readInt(packetId,0);
	info.roomIp 	= self.m_socket:readString(packetId);
	info.roomPort   = self.m_socket:readInt(packetId,0);
    info.hasIngame  = self.m_socket:readInt(packetId,0);
	info.level  = self.m_socket:readInt(packetId,0);
	info.gameId     = self.m_socket:readInt(packetId,0);
	Log.d("CommonGameSocketReader2.onJoinGameResponse  info=" .. json.encode(info));
	return info;
end

--server配桌完成后，返回桌子信息
CommonGameSocketReader2.onServerResponseTableInfo = function(self, packetId)
	local strData = self.m_socket:readString(packetId);
	local data = json.decode(strData);
	self:log("CommonGameSocketReader2.onServerResponseTableInfo", "data = ", data);

	if not table.isEmpty(data) then
		local gameId = tonumber(data.gameId) or 0;
		local levelId = tonumber(data.level) or 0;
		local tid = tonumber(data.tid) or 0;
		GameInfoIsolater.getInstance():setCurGameId(gameId);
		GameInfoIsolater.getInstance():setCurRoomLevelId(levelId);
		GameInfoIsolater.getInstance():setCurTableId(tid);
	end
	return data;
end

--登录大厅失败 0x1005
CommonGameSocketReader2.onLoginRoomError = function(self, packetId)
	local info = {};
	info.errorType = self.m_socket:readByte(packetId, -1);
	info.errorMsg = self.m_socket:readString(packetId) or "";
	return info;
end

--房间重连成功
CommonGameSocketReader2.onRoomReconnectSuccess = function(self, packetId)
	-- body
end

--玩家请求退出(游戏中)
CommonGameSocketReader2.onLogoutInGameResponse = function (self, packetId)
	local packetInfo = {};
	packetInfo.compensation = self.m_socket:readInt64(packetId, 0); -- 退出游戏，需要扣除的银币数
	return packetInfo;
end

--我退出房间成功 0x1008
CommonGameSocketReader2.onLoginOutSuccess = function (self, packetId)
	local packetInfo = {};
    packetInfo.totalMoney = self.m_socket:readInt64(packetId, -1); --用户现金 不一定每个游戏都会传
	packetInfo.money = self.m_socket:readInt64(packetId, 0); --德州时定义的参数(坑)
	return packetInfo;
end

-- 广播游戏强制结束（游戏中有玩家退出）
CommonGameSocketReader2.onStopGameInPlay = function (self, packetId)
	local packetInfo = {};
	packetInfo.logoutUserId = self.m_socket:readInt(packetId, 0); -- 离开玩家的id
	packetInfo.playerInfo = {};
	local maxCount = self.m_socket:readByte(packetId, 0);
	for i = 1, maxCount do
		local user = {};
		user.userId = self.m_socket:readInt(packetId, 0); -- 用户id
		user.totalMoney = self.m_socket:readInt64(packetId, 0); 
		user.turnMoney = self.m_socket:readInt64(packetId, 0);
		user.winMoneyTotalInTable = self.m_socket:readInt64(packetId, 0);
		packetInfo.playerInfo[i] = user;
	end
	return packetInfo;
end

--server广播用户登出
CommonGameSocketReader2.onPlayerLogout = function(self, packetId)
	local playerInfo = {};
	playerInfo.userId = self.m_socket:readInt(packetId,0);
	Log.d("CommonGameSocketReader2.onPlayerLogout  usetId = " , playerInfo.userId);
	return playerInfo;
end

--server广播用户进入
CommonGameSocketReader2.onPlayerLogin = function(self, packetId)
	local user = {};
	user.mid = self.m_socket:readInt(packetId,0);
	user.seatid = self.m_socket:readInt(packetId,0);
	user.isReady = self.m_socket:readInt(packetId,0);

	user.userInfo = self.m_socket:readString(packetId) or "";
	user.money = self.m_socket:readInt64(packetId,0);
	user.hp = self.m_socket:readInt(packetId, 0);
	return user;
end

--请求换桌失败
CommonGameSocketReader2.onChangeTableError = function (self, packetId)
	local packetInfo = {};
	packetInfo.errorFlag = self.m_socket:readInt(packetId, 0);
	return packetInfo;
end

--server广播玩家准备
CommonGameSocketReader2.onPlayerReady = function(self, packetId)
	local userId = self.m_socket:readInt(packetId,0);
	Log.d("CommonGameSocketReader2.onPlayerReady userId= ",userId);
	return userId;
end

--广播用户托管
CommonGameSocketReader2.onPlayerAi = function(self, packetId)
	local packetInfo = {};
	packetInfo.userId = self.m_socket:readInt(packetId, -1);
	packetInfo.isAi = self.m_socket:readInt(packetId, 0); --0表示取消托管，非0表示托管
	Log.wWF("record_bug_ai ","CommonGameSocketReader2.onPlayerAi","info = ",packetInfo);
	return packetInfo;
end

--need Override
--房间登录成功
CommonGameSocketReader2.onRoomLoginSuccess = function(self, packetId)
	self:log("CommonGameSocketReader2.onRoomLoginSuccess");
end

--need Override
--房间重连成功
CommonGameSocketReader2.onRoomReconnectSuccess = function(self, packetId)
	self:log("CommonGameSocketReader2.onRoomReconnectSuccess");
end


--接收用户发送的文字
CommonGameSocketReader2.onReceiveChat = function ( self, packetId )
	local packetInfo = {};
	packetInfo.uid = self.m_socket:readInt(packetId,-1);
	packetInfo.msg = self.m_socket:readString(packetId) or "";
	packetInfo.index = self.m_socket:readShort(packetId,-1);
	return packetInfo;
end

--接收用户发送的表情
CommonGameSocketReader2.onReceiveFace = function ( self, packetId )
	local packetInfo = {};
	packetInfo.uid = self.m_socket:readInt(packetId, -1);
	packetInfo.faceValue = self.m_socket:readInt(packetId, -1);
	packetInfo.vipType = self.m_socket:readInt(packetId, 1);
	return packetInfo;
end

-- 服务器广播聊天内容
CommonGameSocketReader2.onServerSendChatMsg = function(self, packetId)
	local info = {};
	info.msgInfo = self.m_socket:readString(packetId);
	return info;
end

---全局公用方法，读取房间等级
-- CommonGameSocketReader2.onGetRoomLevel = function(self,packetId)
-- 	local info = {};
-- 	info.gameId = self.m_socket:readShort(packetId,0);
-- 	info.uid = self.m_socket:readInt(packetId,0);
-- 	info.roomLevel = self.m_socket:readInt(packetId,0);
-- 	return info;
-- end 

--房间等级变化响应
CommonGameSocketReader2.onRoomUpLevel = function(self,packetId)
	local info = {};
	info.level = self.m_socket:readShort(packetId,0);--目标场次level
	info.flag = self.m_socket:readInt(packetId,0);-- 降级=-1   升级=1
	info.exp = self.m_socket:readInt(packetId,0);--经验值，目前不送经验
	info.msg = self.m_socket:readString(packetId);--信息
	info.baseChip = self.m_socket:readInt64(packetId,0);--目标场次的底注
	info.dis = self.m_socket:readInt64(packetId,0);-- flag==-1时表示持有银币与原场次银币的差额   flag==1时暂时为0
	self:log("CommonGameSocketReader2.onRoomUpLevel,level = ",level,"flag = ",flag);
	return info;
end

--广播特殊任务类型
CommonGameSocketReader2.onTaskGame = function(self, packetId)
	local info = {};
	info.isResult = self.m_socket:readInt(packetId, 0);
	info.type = self.m_socket:readInt(packetId, 0);
	info.times = self.m_socket:readInt(packetId, 0);
	return info;
end

--广播特殊牌局任务
CommonGameSocketReader2.onTaskComplete = function(self, packetId)
	local info = {};
	info.type = self.m_socket:readInt(packetId, 0);
	info.times = self.m_socket:readInt(packetId, 0);
	info.isResult = self.m_socket:readInt(packetId, 0);
	return info;
end

CommonGameSocketReader2.onReceiveBeKicked = function(self,packetId)
	local info = {};
	info.sUid = self.m_socket:readInt(packetId, 0);
	info.sName = self.m_socket:readString(packetId);
	info.tUid = self.m_socket:readInt(packetId, 0);
	info.tName = self.m_socket:readString(packetId);
	Log.d("CommonGameSocketReader2.onReceiveBeKicked","info = ",info);
	return info;
end

CommonGameSocketReader2.onReceiveJiFenKickUser = function(self, packetId)
	local info = {};
	info.errorcode = self.m_socket:readInt(packetId, -1);--踢人结果:(0:成功, 1，表示要被T的用户不存在，2：表示桌子已经在玩,3:你不是房主)
	if info.errorcode == 0 then 
		info.sUid = self.m_socket:readInt(packetId, 0);
		info.sName = self.m_socket:readString(packetId);
		info.tUid = self.m_socket:readInt(packetId, 0);
		info.tName = self.m_socket:readString(packetId);
	end 
	Log.d("CommonGameSocketReader2.onReceiveJiFenKickUser","info = ",info);
	return info;
end

CommonGameSocketReader2.onReceiveJiFenChangeSeatApply = function(self,packetId)
	local info = {};
	info.sUid = self.m_socket:readInt(packetId,0);
	info.sSeatId = self.m_socket:readInt(packetId,-1);
	info.tUid = self.m_socket:readInt(packetId,0);
	info.tSeatId = self.m_socket:readInt(packetId,-1);
	Log.d("CommonGameSocketReader2.onReceiveJiFenChangeSeatApply","info = ",info);
	return info;
end

CommonGameSocketReader2.onBroadcastJiFenChangeSeatResult = function(self,packetId)
	local info = {};
	info.result = self.m_socket:readInt(packetId, 0);--换座结果: result (int) (1:换座成功, 0: 换座失败)
	if info.result == 1 then
		info.count = self.m_socket:readInt(packetId,0);
		info.change = {};
		for i = 1,info.count do 
			local user = {};
			user.uid = self.m_socket:readInt(packetId, 0);
			user.seatid = self.m_socket:readInt(packetId,-1);
			info.change[i] = user;
		end 	
	else 
		--(errorCode: 0:对方拒绝,1:牌局已开始,2:申请换座的玩家的座位号已经变了,
			-- 3:向同一个玩家发起多次换座请求,被换座的玩家还没回复,4: 换座时，之前为空座，在收到命令后，桌上又有人了
			-- 5:被申请换座的玩家的位置已经变了，6:申请换座的玩家已经离开)
		info.errorcode = self.m_socket:readInt(packetId,-1);
		info.sUid = self.m_socket:readInt(packetId, 0);
		info.tUid = self.m_socket:readInt(packetId, 0);
	end 
	Log.d("CommonGameSocketReader2.onBroadcastJiFenChangeSeatResult","info = ",info);
	return info;
end

CommonGameSocketReader2.onBroadcastJiFenMaster = function(self,packetId)
	local info = {};
	info.userId = self.m_socket:readInt(packetId,0);--房主userId
	info.reconnectFlag = self.m_socket:readShort(packetId,0);--0:不在重连，1:重连
	Log.d("CommonGameSocketReader2.onBroadcastJiFenMaster","info = ",info);
	return info;
end

CommonGameSocketReader2.onBroadcastJiFenContinuePlay = function(self,packetId)
	local info = {};
	info.playerCount = self.m_socket:readInt(packetId,0);
	info.playerInfo={};
	for i=1,info.playerCount do
		info.playerInfo[i]={};
		info.playerInfo[i].mid 		= self.m_socket:readInt(packetId,0);     --用户id
		info.playerInfo[i].seatid 	= self.m_socket:readInt(packetId,0);     --用户座位id
		info.playerInfo[i].isReady 	= self.m_socket:readInt(packetId,0);     --是否准备
		info.playerInfo[i].userInfo = self.m_socket:readString(packetId) or "";
		info.playerInfo[i].money 	= self.m_socket:readInt(packetId,0);
	end
	Log.d("CommonGameSocketReader2.onBroadcastJiFenContinuePlay","info = ",info);
	return info;
end

CommonGameSocketReader2.onBroadcastJiFenPlayerCancleReady = function(self,packetId)
	local info = {};
	info.userId = self.m_socket:readInt(packetId,0);
	Log.d("CommonGameSocketReader2.onBroadcastJiFenPlayerCancleReady"," info = ",info);
	return info;
end

CommonGameSocketReader2.onBroadcastJiFenRecordInfo = function(self,packetId)
	local info = {
		roomLevel = self.m_socket:readInt(packetId,0);
		playMode = self.m_socket:readInt(packetId,0);
		baseChipType = self.m_socket:readInt(packetId,0);
		multiple = self.m_socket:readInt(packetId,0);
		tableType = self.m_socket:readInt(packetId,0);
		roundsTotal = self.m_socket:readInt(packetId,0);--总局数
		roundsCurrent = self.m_socket:readInt(packetId,0);
		baseChip = self.m_socket:readInt(packetId,0);--初始积分
		state = self.m_socket:readInt(packetId,0);--状态  1 正常结算 2 总结算 3 重连 4中途离开
		leaveUserId = self.m_socket:readInt(packetId,0);--中途离开玩家 uid
		playCount = self.m_socket:readInt(packetId,0);--玩家总数
		record = {};
	};
	for i = 1, info.playCount do 
		local temp = {
			userId = self.m_socket:readInt(packetId,0);-- 用户uid
			currscore = self.m_socket:readInt(packetId,0);--当前积分
			wlscore = self.m_socket:readInt(packetId,0);--输赢积分
		};
		info.record[i] = temp;
	end

	-- 每局信息
	info.recordListSize = self.m_socket:readInt(packetId,0);--玩家总数
	info.recordList = {};
	local roundsCountMax = 0;
	for i = 1, info.recordListSize do 
		local temp = {
			userId = self.m_socket:readInt(packetId,0);-- 用户uid
			roundsCount = self.m_socket:readInt(packetId,0);--局数
			list = {};
		};

		roundsCountMax = math.max(roundsCountMax, temp.roundsCount);

		for j = 1, temp.roundsCount do 
			local tmp = {
				wlscore = self.m_socket:readInt(packetId,0);--输赢积分
				currscore = self.m_socket:readInt(packetId,0);--当前积分
			};
			temp.list[j] = tmp;
		end

		info.recordList[i] = temp;
	end

	info.time = self.m_socket:readInt(packetId,0);-- 结算时间
	info.gameExtParams = self.m_socket:readString(packetId);--子游戏扩展参数
	local roundsCount = info.roundsCurrent;
	info.roundsCurrent = roundsCountMax; -- 记录局数
	info.roundsNext = roundsCount; -- 当前局数
	return info;
end

-- 进围观时子游戏玩牌等信息
-- 同游戏重连数据,如果不同需子游戏自行实现消息解析
CommonGameSocketReader2.onServerBroadcastOnlookerGameInfo = function(self,packetId)
	return self:onRoomReconnectSuccess(packetId);
end

CommonGameSocketReader2.onServerBoradcastOnlookerLogin = function(self,packetId)
	local info = {};
	info.userId = self.m_socket:readInt(packetId,0);--围观者id
	info.userInfo = self.m_socket:readString(packetId);--围观者信息
	Log.d("CommonGameSocketReader2.onServerBoradcastOnlookerLogin",info);
	return info;
end

CommonGameSocketReader2.onServerBoradcastOnlookerLogout = function(self,packetId)
	local info = {};
	info.userId = self.m_socket:readInt(packetId, 0);--围观者id
	Log.d("CommonGameSocketReader2.onServerBoradcastOnlookerLogout",info);
	return info;
end

CommonGameSocketReader2.s_severCmdFunMap = {
	
	[ROOM_JOIN_GAME_RESPONSE] 					= "onJoinGameResponse";
	[ROOM_LOGIN_ERR]							= "onLoginRoomError";
	--需要子类重写的，不需要配置令
	[ROOM_LOGIN_SUCCESS] 						= "onRoomLoginSuccess";
	[ROOM_RECONNECT]							= "onRoomReconnectSuccess";
	[SERVER_COMMAND_LOGOUT_INGAME_RSP] 			= "onLogoutInGameResponse";
	[ROOM_LOGOUT_SUCCESS] 						= "onLoginOutSuccess";
	[SERVER_BROADCAST_STOP_GAME_IN_PLAY] 		= "onStopGameInPlay";
	[SERVER_BROADCAST_PLAYER_LOGOUT] 			= "onPlayerLogout"; 
	[SERVER_BROADCAST_PLAYER_LOGIN] 			= "onPlayerLogin";
	[SERVER_COMMAND_CHANGE_TABLE_ERR] 			= "onChangeTableError"; 
	[SERVER_BROADCAST_PLAYER_READY] 			= "onPlayerReady";
	[SERVER_BROADCAST_PLAYER_AI] 				= "onPlayerAi";

	[ROOM_USER_CHAT]  							= "onReceiveChat";
	[ROOM_USER_FACE] 							= "onReceiveFace";
	-- [RESPONE_ROOMLEVEL]		  					= "onGetRoomLevel";
	[ROOM_UP_LEVEL] 		  					= "onRoomUpLevel";	
	[SERVER_BROADCAST_TASK_GAME]	 			= "onTaskGame";
	[SERVER_BROADCAST_TASK_COMPLETE] 			= "onTaskComplete"; 
	[ROOM_SERVER_RESPONSE_TABLE_INFO] 			= CommonGameSocketReader2.onServerResponseTableInfo;

	[SERVER_COMMAND_JIFEN_ROOM_SENDTO_BEKICKED_USER] = "onReceiveBeKicked";
	[SERVER_COMMAND_BROAD_JIFEN_ROOM_KICK_USER]	= "onReceiveJiFenKickUser";
	[SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_APPLY]		= "onReceiveJiFenChangeSeatApply";
	[SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_RESULT] 	= "onBroadcastJiFenChangeSeatResult";

	[SERVER_BROADCAST_JIFEN_ROOM_MASTER]	= "onBroadcastJiFenMaster";
	[SERVER_BROADCAST_JIFEN_ROOM_CONTINUE_PLAY]	= "onBroadcastJiFenContinuePlay";
	[SERVER_BROADCAST_JIFEN_ROOM_CANCLE_READY] = "onBroadcastJiFenPlayerCancleReady";
	[SERVER_BROADCAST_JIFEN_RECORD_INFO] = "onBroadcastJiFenRecordInfo";

	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_GAMEINFO] = "onServerBroadcastOnlookerGameInfo";
	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGIN] = "onServerBoradcastOnlookerLogin";
	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGOUT] = "onServerBoradcastOnlookerLogout";
};