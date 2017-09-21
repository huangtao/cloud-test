require("games/common2/network/socket/commonGameSocketCmd2");
require("games/common2/network/php/commonGamePhpCmd2");
require("games/common2/mechine/mechineManage");
require("games/common2/onlooker/data/onlookerPlayerManager");
local OnlookerSocketCmd = require("games/common2/onlooker/socket/onlookerSocketCmd");

CommonGameSocketProcesser2 = class(SocketHandlerBase);

CommonGameSocketProcesser2.ctor = function(self, controller)
	self.m_controller = controller;

	self:initServerLifeDetector();

	return self;
end 

CommonGameSocketProcesser2.dtor = function(self)
	ServerLifeDetector2.releaseInstance();
end

--大厅请求房间成功--指令0x210
CommonGameSocketProcesser2.onPreRoomJoinGameResponse = function(self, packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,ROOM_JOIN_GAME_RESPONSE, packetInfo);
	return true;
end

--大厅请求房间成功--指令0x210
CommonGameSocketProcesser2.onRoomJoinGameResponse = function(self, packetInfo, packetInfoId)
	if not table.isTable(packetInfo) then 
		-- Log.e("CommonGameSocketProcesser2.onRoomJoinGameResponse packetInfo is not table");
		local info = {};	
		info.errorType = 1;
		CommonGameSocketProcesser2.onLoginRoomError(self, info);
		MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
		return;
	end
	GameInfoIsolater.getInstance():setCurRoomIp(packetInfo.roomIp);
	GameInfoIsolater.getInstance():setCurRoomPort(packetInfo.roomPort);
	GameInfoIsolater.getInstance():setCurTableId(packetInfo.roomId);
	GameInfoIsolater.getInstance():setCurRoomLevelId(packetInfo.level);

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end


--房间登录错误 0x1005
CommonGameSocketProcesser2.onLoginRoomError = function(self, packetInfo)
	local action = GameMechineConfig.ACTION_LOGINERRO;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

-- 我退出房间成功 0x1008
CommonGameSocketProcesser2.onPreLoginOutSuccess = function(self, packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,ROOM_LOGOUT_SUCCESS, packetInfo);
	return true;
end

-- 我退出房间成功 0x1008
CommonGameSocketProcesser2.onLoginOutSuccess = function (self, packetInfo, packetInfoId)
	if packetInfo.totalMoney and packetInfo.totalMoney ~= -1 and not GameInfoIsolater.getInstance():isInMatchRoom() then
		local propertyId = RoomPropertyData.getInstance():getCurPropertyId();
		UserPropertyIsolater.getInstance():setMoneyById(propertyId,packetInfo.totalMoney);
	end

	local action = nil;
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then

		local isExitNow = true;
		if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
			if self.m_isMyselfLeaveJiFenInHalf then --积分房自己中途离开时，等玩家自己关闭最终结算界面再让玩家退回大厅
				isExitNow = false;
			end 
		end 

		local userId = UserBaseInfoIsolater.getInstance():getUserId();
		local propertyId = RoomPropertyData.getInstance():getCurPropertyId();
		local curState = MechineManage.getInstance():getStates(userId);
		local userMoney = RoomPropertyData.getInstance():getCurPropertyNum();
		if UserPropertyIsolater.getInstance():checkIsCrystal(propertyId) and userMoney == 0 and 
			(curState == GameMechineConfig.STATUS_GAMEOVER or curState == GameMechineConfig.STATUS_PLAYING)  then 
			action = GameMechineConfig.ACTION_LOGOUT;
			MechineManage.getInstance():receiveAction(action, packetInfo, -1, false, "onLoginOutSuccess");
			isExitNow = false;
		end 

		if isExitNow then 
			-- 私人房强制退出房间
			action = GameMechineConfig.ACTION_REQUEST_EXIT;
			MechineManage.getInstance():receiveAction(action, packetInfo, UserBaseInfoIsolater.getInstance():getUserId(), false, "onLoginOutSuccess");
		end 
	else 
		action = GameMechineConfig.ACTION_LOGOUT;
		MechineManage.getInstance():receiveAction(action, packetInfo, -1, false, "onLoginOutSuccess");
	end

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

-- 换桌失败
CommonGameSocketProcesser2.onChangeTableError = function (self, packetInfo)
	local action = GameMechineConfig.ACTION_CHANGETABLEERRO;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

-- Server回应退出请求(游戏中退出)
CommonGameSocketProcesser2.onLogoutInGameResponse = function (self, packetInfo)
	local action = GameMechineConfig.ACTION_REQUESTEXITGAME;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

-- 广播游戏强制结束（游戏中有玩家退出）
CommonGameSocketProcesser2.onStopGameInPlay = function (self, packetInfo)
	local action = GameMechineConfig.ACTION_OVER;
	local uids = {};
	local user = packetInfo.playerInfo or {};
	for k,v in ipairs(user) do 
		uids[k] = v.userId;
	end
	MechineManage.getInstance():receiveAction(action,packetInfo,uids, false, "onStopGameInPlay");
	return true;
end

--有玩家登录进来
CommonGameSocketProcesser2.onPrePlayerLogin = function(self, packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_PLAYER_LOGIN, packetInfo);
	return true;
end

--有玩家登录进来
CommonGameSocketProcesser2.onPlayerLogin = function(self, packetInfo, packetInfoId)
	if packetInfo.mid == -1 or packetInfo.seatid == -1 then
		local info = {};	
		info.errorType = 1;
		CommonGameSocketProcesser2.onLoginRoomError(self, info);
		MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
		return;
	end
	local localId = PlayerSeat.getInstance():getLocalSeat(packetInfo.seatid);
	local player = GamePlayer2.formatUserInfo(packetInfo.userInfo);

	player:setMid(packetInfo.mid);
	player:setSeatId(packetInfo.seatid);
	player:setIsReady(packetInfo.isReady ~= 0);
	if packetInfo.money then
		player:setMoney(packetInfo.money);
	end
	
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_JOINGAME, player, packetInfo.mid, false, "onPlayerLogin");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_LOGIN, player, packetInfo.mid, false, "onPlayerLogin");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE);

	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then 
		local userName = player:getNick();
		Toast.setDefaultDisplayTime(3000);
		self:showToast(userName.."进入了房间");
		Toast.setDefaultDisplayTime();

		local playerSize = GamePlayerManager2.getInstance():getPlayerSize();
		local playerSizeMax = PlayerSeat.getInstance():getCurGamePlayerMaxCount();
		if playerSize >= playerSizeMax then
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_HIDEINVITE);
		end
	end 

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

--有玩家登出
CommonGameSocketProcesser2.onPrePlayerLogout = function(self, packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_PLAYER_LOGOUT, packetInfo);
	return true;
end

--有玩家离开
CommonGameSocketProcesser2.onPlayerLogout = function(self, packetInfo, packetInfoId)
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then 
		local player = GamePlayerManager2.getInstance():getPlayerByMid(packetInfo.userId);
		local userName = player and player:getNick() or "玩家"
		Toast.setDefaultDisplayTime(3000);
		self:showToast(userName.."退出了房间");
		Toast.setDefaultDisplayTime();
	end 
	
	local action = GameMechineConfig.ACTION_EXIT;
	MechineManage.getInstance():receiveAction(action, packetInfo, packetInfo.userId, false, "onPlayerLogout");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE);
	
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

--有玩家准备
CommonGameSocketProcesser2.onPrePlayerReady = function(self, packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_PLAYER_READY, packetInfo);
	return true;
end

--有玩家准备
CommonGameSocketProcesser2.onPlayerReady = function(self, userId, packetInfoId)
	local uids = userId;
	local action = GameMechineConfig.ACTION_READY;
	MechineManage.getInstance():receiveAction(action,userId,uids, false, "onPlayerReady");

	if PrivateRoomIsolater.getInstance():isInJiFenRoom() 
		and userId == UserBaseInfoIsolater.getInstance():getUserId() then 

		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_JIFEN_HIDE_CHANGE_SEATE, nil,nil, false, "onPlayerReady");
	end 
	
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

--广播用户托管
CommonGameSocketProcesser2.onPlayerAi = function(self, packetInfo)
	local userId = packetInfo.userId;
	local action = GameMechineConfig.ACTION_NS_ROBOT;
	MechineManage.getInstance():receiveAction(action, packetInfo, userId, false, "onPlayerAi");
	return true;
end

--自己房间登录成功
CommonGameSocketProcesser2.onPreRoomLoginSuccess = function(self, packetInfo)
	Log.i("------CommonGameSocketProcesser2.onPreRoomLoginSuccess packetInfo", packetInfo);
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,ROOM_LOGIN_SUCCESS, packetInfo);
	return true;
end

--need Override
--自己房间登录成功
CommonGameSocketProcesser2.onRoomLoginSuccess = function(self, packetInfo, packetInfoId)
	Log.i("------CommonGameSocketProcesser2.onRoomLoginSuccess");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_RESET,nil,nil,false,"onRoomLoginSuccess");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_INITGAME, packetInfo.info,nil,false,"onRoomLoginSuccess");
	local info = packetInfo.info;
	local player = GamePlayerManager2.getInstance():getSelfData(info.seatid);
	player:setMoney(info.money);
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_JOINGAME,player,nil,false,"onRoomLoginSuccess");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_LOGIN,player,nil,false,"onRoomLoginSuccess");
	if not table.isEmpty(packetInfo.playerInfo) then
		for k, v in pairs(packetInfo.playerInfo) do
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_JOINGAME, v, v:getMid(),false,"onRoomLoginSuccess");
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_LOGIN, v, v:getMid(),false,"onRoomLoginSuccess");

			if v:isReady() then
				local action = GameMechineConfig.ACTION_READY;
				MechineManage.getInstance():receiveAction(action, v:getMid(), v:getMid(),false,"onRoomLoginSuccess");
			end
		end
	end

	if number.valueOf(info.isReady) == 1 then
		-- 登陆接口，有可能会返回已准备的状态。
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_READY, {}, nil,false,"onRoomLoginSuccess");
	end

	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE, true);
	end

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

--房间重连成功
CommonGameSocketProcesser2.onPreRoomReconnectSuccess = function(self, packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,ROOM_RECONNECT, packetInfo);
	return true;
end

--need Override
--房间重连成功
CommonGameSocketProcesser2.onRoomReconnectSuccess = function(self, packetInfo, packetInfoId)
	-- body loginInfo,landlordInfo,gameInfo
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then 
		-- 显示私人房相关东西
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_LOGIN_VIDEO);
	end

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
----server配桌完成后，返回桌子信息
CommonGameSocketProcesser2.onServerResponseTableInfo = function(self, info)
	if not table.isEmpty(info) then
		local levelId = tonumber(info.level) or 0;
		GameRoomData.getInstance():setRoomLevel(levelId);

		local gameVersion = tonumber(info.gameversion) or 0;
		local playMode = tonumber(info.playmode);
		local baseChipType = tonumber(info.basechiptype);

		GameRoomData.getInstance():setCurRoomPlayType(playMode);
		GameRoomData.getInstance():setCurRoomPropertyId(baseChipType);
	end
	-- RoomTaskLogic.getInstance():requestRoomBaxTaskInfo();
	local action = GameMechineConfig.ACTION_NS_REFRESH_TABLEINFO;
	MechineManage.getInstance():receiveAction(action);
	return true;
end

--有人发送文字信息
CommonGameSocketProcesser2.onReceiveChat = function ( self, packetInfo )
	local action = GameMechineConfig.ACTION_RECEIVE_CHAT;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

--有人发送表情
CommonGameSocketProcesser2.onReceiveFace = function ( self, packetInfo )
	local action = GameMechineConfig.ACTION_RECEIVE_FACE;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

-- server升级踢人
CommonGameSocketProcesser2.onServerUpdateKick = function (self, packetInfo)
	local action = GameMechineConfig.ACTION_KICK;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

----公用方法，处理房间等级返回
-- CommonGameSocketProcesser2.onGetRoomLevel = function(self,packetInfo)
-- 	if not table.isTable(packetInfo) then 
-- 		Log.e("CommonGameSocketProcesser2.onGetRoomLevel packetInfo is not table");
-- 		return;
-- 	end;
-- 	Log.d("----------CDH RESPONE_ROOMLEVEL packetInfo:" .. json.encode(packetInfo));
	
-- 	local action = GameMechineConfig.ACTION_GETROOMLEVEL;
-- 	MechineManage.getInstance():receiveAction(action,packetInfo,uids);
-- 	return true;
-- end

---房间升级响应
CommonGameSocketProcesser2.onRoomUpLevel = function(self,packetInfo)
	if not table.isTable(packetInfo) then 
		Log.e("CommonGameSocketProcesser2.onRoomUpLevel packetInfo is not table");
		return;
	end;
	local action = GameMechineConfig.ACTION_UPLEVEL;
	MechineManage.getInstance():receiveAction(action,packetInfo,uids);
	return true;
end

-- 获取宝箱任务信息
CommonGameSocketProcesser2.onGetRoomTaskInfo = function(self,isSuccess,packetInfo)
	-- self.m_controller:handleSocketCmd(PHP_ROOM_TASK, ...);
	Log.d("CommonGameSocketProcesser2.onGetRoomTaskInfo", isSuccess, packetInfo);
	local action = GameMechineConfig.ACTION_GETROOMTASK;
	packetInfo.result = isSuccess;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

-- 获取任务奖励
CommonGameSocketProcesser2.onGetReward = function(self,isSuccess,packetInfo)
	Log.d("CommonGameSocketProcesser2.onGetReward","isSuccess = ",isSuccess,"packetInfo = ",packetInfo);
   	-- self.m_controller:handleSocketCmd(PHP_ROOM_TASK_GET_REWARD,isSuccess,packetInfo);
   	local action = GameMechineConfig.ACTION_GETTASKREWARD;
   	packetInfo.result = isSuccess;
	MechineManage.getInstance():receiveAction(action,packetInfo);
	return true;
end

-- 广播特殊任务类型
CommonGameSocketProcesser2.onTaskGame = function(self, packetInfo)
	local action = GameMechineConfig.ACTION_GETTASK;
	MechineManage.getInstance():receiveAction(action,packetInfo,uids);
	return true;
end

-- 广播已经完成的牌局任务
CommonGameSocketProcesser2.onTaskComplete = function(self, packetInfo)
	local action = GameMechineConfig.ACTION_COMPLETASK;
	MechineManage.getInstance():receiveAction(action,packetInfo,uids);
	return true;
end

CommonGameSocketProcesser2.showToast = function(self,msg )
	Toast.getInstance():showText(msg or "服务器繁忙，请稍后重试",50,30,kAlignLeft,"",24,200,175,110);
end

CommonGameSocketProcesser2.initServerLifeDetector = function(self)
	--初始化server监听器
	local slDetectListener = new(ServerLifeDetectListener2)
	slDetectListener.onDetectServerDead = function()
		Log.d("CommonGameSocketProcesser2.initServerLifeDetector onDetectServerDead");
		if not GameInfoIsolater.getInstance():isInNormalRoom() then
			return ;
		end
		local action = GameMechineConfig.ACTION_NS_FORCE_EXIT;
		MechineManage.getInstance():receiveAction(action);--任何情况下都强制退出，因为一分钟，这样意味着挂掉了
	end
	slDetectListener.onDetectNeedReconnect = function()
		Log.d("CommonGameSocketProcesser2.initServerLifeDetector onDetectNeedReconnect");
		local mainState = MechineManage.getInstance():getMainState();
		if mainState == GameMechineConfig.STATUS_PLAYING then
			-- self.m_socket:reopenSocket(); --重新打开socket，走游戏重连
		end
	end
	ServerLifeDetector2.getInstance():setDetectListener(slDetectListener);
end

CommonGameSocketProcesser2.onReceivePacket = function(self, cmd, ...)
	if cmd ~= SERVER_HEART_RESPONSE and cmd ~= SOCKET_UPDATE_NET_ICON then
	    ServerLifeDetector2.getInstance():updateLifeTime();--此处更新监听器的时间
	end
    SocketHandlerBase.onReceivePacket(self, cmd, ...);
end

-- silver
CommonGameSocketProcesser2.onGetSilverData = function ( self, isSuccess, packetInfo )
	local action = GameMechineConfig.ACTION_NS_GET_SILVER_DATA;
	MechineManage.getInstance():receiveAction(action, packetInfo, nil, nil, "CommonGameSocketProcesser2.onGetSilverData");
end

CommonGameSocketProcesser2.onGetSilverReward = function ( self, isSuccess, packetInfo )
	if not isSuccess then 
		return;
	end
	packetInfo.isSuccess = isSuccess;
	local action = GameMechineConfig.ACTION_NS_GET_SILVER_REWARD;
	MechineManage.getInstance():receiveAction(action, packetInfo, nil, nil, "CommonGameSocketProcesser2.onGetSilverData");
end

CommonGameSocketProcesser2.onPreReceiveBeKicked = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_COMMAND_JIFEN_ROOM_SENDTO_BEKICKED_USER, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onReceiveBeKicked = function(self,data,packetInfoId)
	if table.isEmpty(data) then
		MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
        return;
    end
    local myMid = UserBaseInfoIsolater.getInstance():getUserId();
    if data.tUid == myMid then 
    	local sName = data.sName or "玩家";
    	local  str = string.concat("您将被",sName,"踢出房间");
    	self:showToast(str);
    end 
    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

CommonGameSocketProcesser2.onPreReceiveJiFenKickUser = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_COMMAND_BROAD_JIFEN_ROOM_KICK_USER, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onReceiveJiFenKickUser = function(self,data,packetInfoId)
    if table.isEmpty(data) then
    	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
        return;
    end

    if data.errorcode == 0 then 
        local myMid = UserBaseInfoIsolater.getInstance():getUserId();
        local sName = data.sName or "玩家";
        local tName = data.tName or "玩家";

        local str = "";
        if data.sUid == myMid then 
            str = string.concat("您将",tName or "玩家","踢出了房间");
        elseif data.tUid == myMid then 
            str = string.concat("您被",sName,"踢出了房间");
        else 
            str = string.concat(sName,tName,"踢出了房间");
        end 
        self:showToast(str);

        local info = {}; 
        info.vipuid = data.sUid;
        info.kickuid = data.tUid;
        info.errorcode = 0;
        local action = GameMechineConfig.ACTION_VIPKICK;
        MechineManage.getInstance():receiveAction(action,info,nil,nil,"CommonGameSocketProcesser2.onReceiveJiFenKickUser");
    else 
    	local str = "";
    	if data.errorcode == 1 then 
    		str = "该玩家已离开";
    	elseif data.errorcode == 2 then 
    		str = "游戏进行中，无法将该玩家请出房间";
    	elseif data.errorcode == 3 then 
    		str = "亲，你不是房主哦，只有房主才可以踢人哒~"
    	else 
    		str = "踢人失败！";
    	end 
    	self:showToast(str);
    end 
    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

CommonGameSocketProcesser2.onPreReceiveJiFenChangeSeatApply = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_APPLY, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onReceiveJiFenChangeSeatApply = function(self,packetInfo,packetInfoId)
	local action = GameMechineConfig.ACTION_NS_JIFEN_CHANGE_SEATE_NOTIFY;
	MechineManage.getInstance():receiveAction(action, packetInfo, nil, nil, "CommonGameSocketProcesser2.onReceiveJiFenChangeSeatApply");
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

CommonGameSocketProcesser2.onPreJiFenChangeSeatResult = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_RESULT, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onBroadcastJiFenChangeSeatResult = function(self,info,packetInfoId)
	if info.result == 1 then --换座成功 
		if info.count > 0 then  
			local function _onUserLogin(player)
				if player then
					MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_JOINGAME, player, player:getMid(), true, "onBroadcastJiFenChangeSeatResult");
					MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_LOGIN, player,player:getMid(), true, "onBroadcastJiFenChangeSeatResult");
					if player:isReady() then
						local action = GameMechineConfig.ACTION_READY;
						MechineManage.getInstance():receiveAction(action, player:getMid(), player:getMid(),true,"onBroadcastJiFenChangeSeatResult");
					end
				end 
			end

			local myNewSeatId;
			local myMid = UserBaseInfoIsolater.getInstance():getUserId();
			for _,v in pairs(info.change) do 
				if v.uid == myMid then 
					myNewSeatId = v.seatid;
					break;
				end 
			end 

			if myNewSeatId then --我的位置变了
				local allPlayer = GamePlayerManager2.getInstance():getAllPlayer();

				local mySelf;
				local name;
				for _,v in pairs(allPlayer) do 
					for _,vv in pairs(info.change) do 
						if vv.uid == v:getMid() then 
							v:setSeatId(vv.seatid);
							if vv.uid ~= myMid then 
								name = v:getNick();
							end 
						end 
					end 
					if v:getMid() == myMid then 
						mySelf = v;
					end 
				end 

				local action = GameMechineConfig.ACTION_LOGOUT;
				MechineManage.getInstance():receiveAction(action, {}, -1, false, "onBroadcastJiFenChangeSeatResult");

				PlayerSeat.getInstance():setMyServerSeatId(myNewSeatId);
				local myNewLocalSeatId = PlayerSeat.getInstance():getLocalSeat(myNewSeatId);
				PlayerSeat.getInstance():setMyLocalSeat(myNewLocalSeatId);

				_onUserLogin(mySelf);
				if self.m_isWaitExecuteContinuePlay and mySelf:getInfoByType("isMaster") then 
					local action = GameMechineConfig.ACTION_NS_JIFEN_MASTER;
					MechineManage.getInstance():receiveAction(action,nil,nil,false,"onBroadcastJiFenChangeSeatResult");
				end 

				for _,v in pairs(allPlayer) do 
					if v:getMid() ~= myMid then 
						_onUserLogin(v);
					end 
				end
				local str = "换座成功！";
				str = name and "你与"..name..str or str;
				self:showToast(str);

				-- 更新语音动画位置
				MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE);
			else --我的位置没变
				local tmp = {};
				for _,v in pairs(info.change) do 
					local player = GamePlayerManager2.getInstance():getPlayerByMid(v.uid);
					if player then 
						player:setSeatId(v.seatid);
						table.insert(tmp,player);
					end 
					local action = GameMechineConfig.ACTION_EXIT;
					MechineManage.getInstance():receiveAction(action, v, v.uid, false, "onBroadcastJiFenChangeSeatResult");
				end 

				for _,v in pairs(tmp) do 
					_onUserLogin(v);
				end

				-- 更新语音动画位置
				MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE);
			end 
		end 
	else 
		local myMid = UserBaseInfoIsolater.getInstance():getUserId();
		if info.sUid == myMid or info.tUid == myMid then 
			local sPlayer = GamePlayerManager2.getInstance():getPlayerByMid(info.sUid);
			local tPlayer = GamePlayerManager2.getInstance():getPlayerByMid(info.tUid);
			local sName = sPlayer and sPlayer:getNick() or "对方";
			local tName = tPlayer and tPlayer:getNick() or "对方";
			sName = info.sUid == myMid and "你" or sName;
			tName = info.tUid == myMid and "你" or tName;

			local str = "换座失败！";
			if info.errorcode == 0 and info.sUid == myMid then  
				str = tName.."不同意你的换座请求。";
			elseif info.errorcode == 1 then 
				str = "牌局已开始,"..str;
			elseif info.errorcode == 2 then 
				str = sName.."座位已经改变,"..sName.."与"..tName..str;	
			elseif info.errorcode == 3 then 
				str = "不可重复提交换座申请";	
			elseif info.errorcode == 4 then 
				str = "位置已被其他玩家占用,"..str;
			elseif info.errorcode == 5 then 
				str = tName.."座位已经改变,"..sName.."与"..tName..str;	
			elseif info.errorcode == 6 then 
				str = sName.."已离开,"..str;
			end 	
			self:showToast(str);		
		end 
	end 
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

CommonGameSocketProcesser2.onPreBroadcastJiFenContinuePlay = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_JIFEN_ROOM_CONTINUE_PLAY, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onBroadcastJiFenContinuePlay = function(self,info,packetInfoId)
	self.m_isWaitExecuteContinuePlay = nil;

	local action = GameMechineConfig.ACTION_NS_JIFEN_CONTINUE_PLAY;
	MechineManage.getInstance():receiveAction(action,{},-1,nil,"CommonGameSocketProcesser2.onBroadcastJiFenContinuePlay");

	for k,v in pairs(info.playerInfo) do 
		local data = {};
		local tmp = {key = "ready",value = v.isReady == 1};
		table.insert(data,tmp);
		local tmp = {key = "money",value = v.money,propertyId = RoomPropertyData.getInstance():getCurPropertyId()};
		table.insert(data,tmp);
		local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(v.mid);
		GamePlayerManager2.getInstance():updatePlayerInfo(seat,data);
	end 

	local action = GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY;
	MechineManage.getInstance():receiveAction(action,nil,-1);

	local myMid = UserBaseInfoIsolater.getInstance():getUserId();
	local player = GamePlayerManager2.getInstance():getPlayerByMid(myMid);
	local isMaster;
	if player then 
		isMaster = player:getInfoByType("isMaster");
		if isMaster then 
			if player:isReady() then 
				local action = GameMechineConfig.ACTION_NS_REFRESH_READY_STATUS;
				MechineManage.getInstance():receiveAction(action,{isShow = true});
			else 
				local action = GameMechineConfig.ACTION_NS_SHOWRWNDVIEW;
				MechineManage.getInstance():receiveAction(action);

				local action = GameMechineConfig.ACTION_NS_PLAYAGAIN;
				MechineManage.getInstance():receiveAction(action);
			end 
		else 
			if not player:isReady() then 
				self:showToast("房主已开启新的一轮，点击准备继续游戏！");
			end 
		end 
	end
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);

	return true;
end

CommonGameSocketProcesser2.onPreBroadcastJiFenMaster = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_JIFEN_ROOM_MASTER, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onBroadcastJiFenMaster = function(self,packetInfo,packetInfoId)
	local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
    privateRoomInfo = table.verify(privateRoomInfo);
    local isCreator = privateRoomInfo.isCreator;

    if packetInfo.reconnectFlag == 0 then 
		local myMid = UserBaseInfoIsolater.getInstance():getUserId();
		if packetInfo.userId == myMid then 
			local player = GamePlayerManager2.getInstance():getPlayerByMid(myMid);
			local isMaster;
			if player then 
				isMaster = player:getInfoByType("isMaster");
			end
			if not (isMaster or isCreator) then 
				self:showToast("恭喜你成为房主，获得房主权限！");
			end 
		end
	end
	
	local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(packetInfo.userId);
	local data = {};
	local tmp = { key = "isMaster", value = true };
	table.insert(data,tmp);

	if self.m_isWaitExecuteContinuePlay then 
		local tmp = {key = "ready",value = false};
		table.insert(data,tmp);
	end 
	GamePlayerManager2.getInstance():updatePlayerInfo(seat,data); 

	local action = GameMechineConfig.ACTION_NS_JIFEN_MASTER;
	MechineManage.getInstance():receiveAction(action, packetInfo.userId, nil, nil, "CommonGameSocketProcesser2.onBroadcastJiFenMaster");

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

CommonGameSocketProcesser2.onPreBroadcastJiFenPlayerCancleReady = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,SERVER_BROADCAST_JIFEN_ROOM_CANCLE_READY, packetInfo);
	return true;
end

CommonGameSocketProcesser2.onBroadcastJiFenPlayerCancleReady = function(self,info,packetInfoId)	--只有在轮与轮之间等待开始下一轮的时候才会收到
	local userId = info.userId;
	if userId then 		
		local player = GamePlayerManager2.getInstance():getPlayerByMid(userId);
		if player then
			player:setIsReady(false);
		end

		local action = GameMechineConfig.ACTION_EXIT;
		MechineManage.getInstance():receiveAction(action, nil, userId, false, "onBroadcastJiFenPlayerCancleReady");

		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_JOINGAME, player,userId, true, "onBroadcastJiFenPlayerCancleReady");
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_LOGIN, player,userId, true, "onBroadcastJiFenPlayerCancleReady");

		if userId == UserBaseInfoIsolater.getInstance():getUserId() then 
			local action = GameMechineConfig.ACTION_NS_HIDRWNDVIEW;
    		MechineManage.getInstance():receiveAction(action);

			if not self.m_isWaitExecuteContinuePlay then --在等待开始下轮时新进的玩家变为新房主了
				local action = GameMechineConfig.ACTION_NS_JIFEN_SHOW_FINISHED_CONTINUE;
				MechineManage.getInstance():receiveAction(action);
			end 
		end 
	end 
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	
	return true;
end

CommonGameSocketProcesser2.onPreBroadcastJiFenRecordInfo = function(self,packetInfo)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self, SERVER_BROADCAST_JIFEN_RECORD_INFO, packetInfo);
end

CommonGameSocketProcesser2.onBroadcastJiFenRecordInfo = function(self,packetInfo,packetInfoId)
	-- 1 正常结算 2 总结算 3 重连 4中途离开
	local action = GameMechineConfig.ACTION_NS_RECEIVE_JIFEM_RECORD;
	MechineManage.getInstance():receiveAction(action, packetInfo, nil, nil, "CommonGameSocketProcesser2.onBroadcastJiFenRecordInfo");

	GameInfoIsolater.getInstance():setCurRoomLevelId(packetInfo.roomLevel);
	for k, v in pairs(packetInfo.record) do 
		local data = {};
		local tmp = {key = "money",value = v.currscore, propertyId = RoomPropertyData.getInstance():getCurPropertyId()};
		table.insert(data,tmp);
		local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(v.userId);
		GamePlayerManager2.getInstance():updatePlayerInfo(seat,data);
	end

	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY,nil,-1);

	local state = packetInfo.state;
	if state == 1 then
		local data = {};
		local tmp = {key = "ready",value = false};
		table.insert(data,tmp);

		local playerCount = GamePlayerManager2.getInstance():getPlayerSize();
		for seat = 1,playerCount do 
			GamePlayerManager2.getInstance():updatePlayerInfo(seat,data);
		end 

		local action = GameMechineConfig.ACTION_JIFEN_GAMEOVER;
		MechineManage.getInstance():receiveAction(action, packetInfo, -1, nil, "CommonGameSocketProcesser2.onBroadcastJiFenRecordInfo");
	elseif state == 4 then
		local leaveUserId = packetInfo.leaveUserId;
		if leaveUserId == UserBaseInfoIsolater.getInstance():getUserId() then --是自己要中途离开
			self:showToast("你提前离开，牌局结束！");

			self.m_isMyselfLeaveJiFenInHalf = true; 
		else 
			self:showToast("有玩家离开，牌局结束！");
		end
		
		self.m_isWaitExecuteContinuePlay = true;

		local action = GameMechineConfig.ACTION_JIFEN_FINISHED;
		MechineManage.getInstance():receiveAction(action, packetInfo,-1,nil,"CommonGameSocketProcesser2.onBroadcastJiFenRecordInfo");
	elseif state == 2 then
		self.m_isWaitExecuteContinuePlay = true;

		local action = GameMechineConfig.ACTION_JIFEN_FINISHED;
		MechineManage.getInstance():receiveAction(action, packetInfo,-1,nil,"CommonGameSocketProcesser2.onBroadcastJiFenRecordInfo")
	end
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

------------------------------------------------------------------------------------------------------
CommonGameSocketProcesser2.onPreServerBroadcastOnlookerGameInfo = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_BROADCAST_ONLOOKER_GAMEINFO, info);
	return true;
end

--need Override
--解析子游戏玩牌信息
CommonGameSocketProcesser2.onServerBroadcastOnlookerGameInfo = function(self,info,packetInfoId)
	--TODO:子游戏实现
	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

--完善围观房间的信息
--子游戏在onServerBroadcastOnlookerGameInfo中第一步调用
-- info = {
-- 	roomLevel = 13; --等级
-- 	baseChip = 100;	--底注	
-- };
CommonGameSocketProcesser2.initOnlookerRoomInfo = function(self,info)
	Log.d("CommonGameSocketProcesser2.initOnlookerRoomInfo","info = ",info);
	info = table.verify(info);
	if info.roomLevel then
		GameInfoIsolater.getInstance():setCurRoomLevelId(info.roomLevel);
		GameRoomData.getInstance():setRoomLevel(info.roomLevel);
	end
	
	if info.baseChip then 
		GameRoomData.getInstance():setBaseChip(info.baseChip);
	end 
end

--完善围观房间中被围观者的信息
--子游戏在onServerBroadcastOnlookerGameInfo中第二步调用
-- info = {
-- 	seatid = 0; --被围观者seatid
-- 	isReady = true; --是否准备
-- };

--return：被围观者信息是否完善成功，被围观者userId;
CommonGameSocketProcesser2.initOnlookerUser = function(self,info)
	Log.d("CommonGameSocketProcesser2.initOnlookerUser","info = ",info);
	local isSuccess,userId,player = self:inintBeOnlookersInfo(info);
	if not isSuccess then 
		return false;
	end 

	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_RESET, nil, -1, true,"onServerBroadcastOnlookerGameInfo");		
	
	GamePlayerManager2.getInstance():removePlayerByMid(UserBaseInfoIsolater.getInstance():getUserId());
	GamePlayerManager2.getInstance():addPlayer(player,PlayerSeat.getInstance():getMyLocalSeat());

	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_INITGAME, player, userId, true,"onServerBroadcastOnlookerGameInfo");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_JOINGAME, player, userId, true,"onServerBroadcastOnlookerGameInfo");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_LOGIN, player, userId, true,"onServerBroadcastOnlookerGameInfo");
	
	-- 准备信息
	if player:isReady() then
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_READY, userId, userId, true,"onServerBroadcastOnlookerGameInfo");
	end

	return true,userId;
end

CommonGameSocketProcesser2.inintBeOnlookersInfo = function(self,info)
	info = table.verify(info);
	Log.d("CommonGameSocketProcesser2.inintBeOnlookersInfo","info = ",info);

	if (not info.seatid) or info.seatid == -1 then 
		Log.e("beOnlookers seatid is error !!!");
		return;
	end 

	local userId = GameRoomData.getInstance():getInfoByType("onlookerId"); --被围观者id
	local player = GamePlayerManager2.getInstance():getPlayerByMid(userId);
	Log.d("CommonGameSocketProcesser2.inintBeOnlookersInfo","onlookerId = ",userId,"player = ",player);
	if player then
		player:setSeatId(info.seatid);
		player:setIsReady(info.isReady);

		PlayerSeat.getInstance():setMyServerSeatId(info.seatid);

		return true,userId,player;
	else 
		return false;
	end 
end

CommonGameSocketProcesser2.onPreServerBoradcastOnlookerLogin = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGIN, info);
	return true;
end
CommonGameSocketProcesser2.onServerBoradcastOnlookerLogin = function(self,info,packetInfoId)
	local player = GamePlayer2.formatUserInfo(info.userInfo);
	OnlookerPlayerManager.getInstance():addOnlooker(player);

	local action = GameMechineConfig.ACTION_ONLOOKER_LOGIN;
	MechineManage.getInstance():receiveAction(action);

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end

CommonGameSocketProcesser2.onPreServerBoradcastOnlookerLogout = function(self,info)
	MsgProcessTools.getInstance():onPreHandlePacktInfo(self,OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGOUT, info);
	return true;
end
CommonGameSocketProcesser2.onServerBoradcastOnlookerLogout = function(self,info,packetInfoId)
	OnlookerPlayerManager.getInstance():removeOnlooker(info.userId);

	local action = GameMechineConfig.ACTION_ONLOOKER_LOGOUT;
	MechineManage.getInstance():receiveAction(action);

	MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
	return true;
end
---------------------------------------------------------------------------------------------------------

CommonGameSocketProcesser2.s_socketCmdFuncMap = {	

	[ROOM_JOIN_GAME_RESPONSE] 						= CommonGameSocketProcesser2.onPreRoomJoinGameResponse;
	[ROOM_LOGIN_ERR]								= CommonGameSocketProcesser2.onLoginRoomError;
	[ROOM_LOGOUT_SUCCESS] 							= CommonGameSocketProcesser2.onPreLoginOutSuccess;
	[SERVER_COMMAND_CHANGE_TABLE_ERR] 				= CommonGameSocketProcesser2.onChangeTableError;
	[SERVER_COMMAND_LOGOUT_INGAME_RSP] 				= CommonGameSocketProcesser2.onLogoutInGameResponse;
	[SERVER_BROADCAST_STOP_GAME_IN_PLAY] 			= CommonGameSocketProcesser2.onStopGameInPlay;
	[SERVER_BROADCAST_PLAYER_LOGIN] 				= CommonGameSocketProcesser2.onPrePlayerLogin;
	[SERVER_BROADCAST_PLAYER_LOGOUT] 				= CommonGameSocketProcesser2.onPrePlayerLogout;
	[SERVER_BROADCAST_PLAYER_READY] 				= CommonGameSocketProcesser2.onPrePlayerReady;
	[SERVER_BROADCAST_PLAYER_AI] 					= CommonGameSocketProcesser2.onPlayerAi;
	[ROOM_USER_CHAT]  								= CommonGameSocketProcesser2.onReceiveChat;
	[ROOM_USER_FACE] 								= CommonGameSocketProcesser2.onReceiveFace;
	[ROOM_SERVER_UPDATE_KICK]						= CommonGameSocketProcesser2.onServerUpdateKick;
	-- [RESPONE_ROOMLEVEL] 							= CommonGameSocketProcesser2.onGetRoomLevel;
	[ROOM_UP_LEVEL] 								= CommonGameSocketProcesser2.onRoomUpLevel;
	[SERVER_BROADCAST_TASK_GAME]	 				= CommonGameSocketProcesser2.onTaskGame;
	[SERVER_BROADCAST_TASK_COMPLETE] 				= CommonGameSocketProcesser2.onTaskComplete;  

    [PHP_ROOM_TASK] 								= CommonGameSocketProcesser2.onGetRoomTaskInfo;
	[PHP_ROOM_TASK_GET_REWARD] 						= CommonGameSocketProcesser2.onGetReward;
	[ROOM_SERVER_RESPONSE_TABLE_INFO]   			= CommonGameSocketProcesser2.onServerResponseTableInfo;

	--需要子类重写的，不需要配置令
	[ROOM_LOGIN_SUCCESS] 							= "onPreRoomLoginSuccess";
	[ROOM_RECONNECT]								= "onPreRoomReconnectSuccess";
	
	-- silver
	[PHP_REQUEST_SILVER_DATA]						= CommonGameSocketProcesser2.onGetSilverData;
	[PHP_ROOM_SILVER_GET_REWARD]					= CommonGameSocketProcesser2.onGetSilverReward;

	[SERVER_COMMAND_JIFEN_ROOM_SENDTO_BEKICKED_USER] 	= "onPreReceiveBeKicked";
	[SERVER_COMMAND_BROAD_JIFEN_ROOM_KICK_USER]     	= "onPreReceiveJiFenKickUser";
	[SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_APPLY]		= "onPreReceiveJiFenChangeSeatApply";
	[SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_RESULT] 	= CommonGameSocketProcesser2.onPreJiFenChangeSeatResult;

	[SERVER_BROADCAST_JIFEN_ROOM_CONTINUE_PLAY] = "onPreBroadcastJiFenContinuePlay";

	[SERVER_BROADCAST_JIFEN_ROOM_MASTER]	= "onPreBroadcastJiFenMaster";
	
	[SERVER_BROADCAST_JIFEN_ROOM_CANCLE_READY]	= "onPreBroadcastJiFenPlayerCancleReady";
	[SERVER_BROADCAST_JIFEN_RECORD_INFO]	= "onPreBroadcastJiFenRecordInfo";


	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_GAMEINFO] = "onPreServerBroadcastOnlookerGameInfo";
	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGIN] = "onPreServerBoradcastOnlookerLogin";
	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGOUT] = "onPreServerBoradcastOnlookerLogout";
};

CommonGameSocketProcesser2.m_socketCmdFuncMap = {	
	[ROOM_JOIN_GAME_RESPONSE] 						= CommonGameSocketProcesser2.onRoomJoinGameResponse;
	[ROOM_LOGOUT_SUCCESS] 							= CommonGameSocketProcesser2.onLoginOutSuccess;
	[SERVER_BROADCAST_PLAYER_LOGIN] 				= CommonGameSocketProcesser2.onPlayerLogin;
	[SERVER_BROADCAST_PLAYER_LOGOUT] 				= CommonGameSocketProcesser2.onPlayerLogout;
	[SERVER_BROADCAST_PLAYER_READY] 				= CommonGameSocketProcesser2.onPlayerReady;

	--需要子类重写的，不需要配置令
	[ROOM_LOGIN_SUCCESS] 							= "onRoomLoginSuccess";
	[ROOM_RECONNECT]								= "onRoomReconnectSuccess";

	[SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_RESULT] = "onBroadcastJiFenChangeSeatResult";
	[SERVER_BROADCAST_JIFEN_ROOM_CONTINUE_PLAY]	= "onBroadcastJiFenContinuePlay";

	[SERVER_BROADCAST_JIFEN_ROOM_MASTER]				= "onBroadcastJiFenMaster";
	[SERVER_COMMAND_JIFEN_ROOM_SENDTO_BEKICKED_USER] 	= "onReceiveBeKicked";
	[SERVER_COMMAND_BROAD_JIFEN_ROOM_KICK_USER]     	= "onReceiveJiFenKickUser";
	[SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_APPLY]		= "onReceiveJiFenChangeSeatApply";
	[SERVER_BROADCAST_JIFEN_ROOM_CANCLE_READY]			= "onBroadcastJiFenPlayerCancleReady";
	[SERVER_BROADCAST_JIFEN_RECORD_INFO]				= "onBroadcastJiFenRecordInfo";

	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_GAMEINFO] = "onServerBroadcastOnlookerGameInfo";
	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGIN] = "onServerBoradcastOnlookerLogin";
	[OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGOUT] = "onServerBoradcastOnlookerLogout";
};

