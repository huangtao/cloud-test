
require("games/common2/network/socket/commonGameSocketCmd2");
require("games/common2/data/commonPlayerInfoHandler2");

LoginGameLogic2 = class(CommonLogic);

LoginGameLogic2.getInstance = function()
	-- body
	if not LoginGameLogic2.s_instance then
		LoginGameLogic2.s_instance = new(LoginGameLogic2);
	end
	return LoginGameLogic2.s_instance;
end

LoginGameLogic2.releaseInstance = function()
	delete(LoginGameLogic2.s_instance);
	LoginGameLogic2.s_instance = nil;
end

LoginGameLogic2.ctor = function(self)
	self.m_socket = SocketIsolater.getInstance();
end

-- 请求进入房间
LoginGameLogic2.requestEnterRoom = function(self, isChangeTable)
	if RoomLogic.getInstance():checkIsLevelUp(true) then
		return;
	end

	local newData = {};
	newData.gameId = GameInfoIsolater.getInstance():getCurGameId();		
	newData.levelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
	newData.userInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(newData.gameId);
	newData.key = "55ff85e777d50680fb52935076d7e55b";
	newData.flag = 1;
	newData.changeTableType = (isChangeTable == true) and 1 or 0;
	newData.extParam = json.encode(table.verify(GameInfoIsolater.getInstance():getGameExtParam()));

	local playType = GameInfoIsolater.getInstance():getPlayTypeByLevelId(newData.gameId,newData.levelId) or 0;
	local propertyId = GameInfoIsolater.getInstance():getMoneyTypeByLevelId(newData.gameId,newData.levelId) or 0;
	newData.gameVersion = GameInfoIsolater.getInstance():getGameVersion(newData.gameId);--游戏版本号
	newData.playType = playType;--玩法：0标准玩法，>0其他特殊玩法
	newData.propertyId = propertyId;--货币类型：0银币，1元宝
	Log.d("requestEnterRoom",newData);

	--上报子游戏版本版本号
	UBReport.getInstance():reportSubGameVersion(newData.gameId);
	
	self.m_socket:sendMsg( ROOM_LOGIN_GAME_ONE_KEY, newData);
end

--0x210回复
--此处处理是否在房间或者继续往下走
LoginGameLogic2.onResponseJoinGameCallBack = function(self, packetInfo)
    local returnValue = false;
	if table.isEmpty(packetInfo) then 
		Log.e("LoginGameLogic2.onRoomJoinGameResponse packetInfo is not table");
		return returnValue;
	end

	local roomId = number.valueOf(packetInfo.roomId);
	local serverId = number.valueOf(packetInfo.serverId);
	local roomIp = number.valueOf(packetInfo.roomIp);
	local roomPort = number.valueOf(packetInfo.roomPort);
    local hasIngame = number.valueOf(packetInfo.hasIngame);
	local levelId = number.valueOf(packetInfo.level);
	local gameId = number.valueOf(packetInfo.gameId);

	Log.d("----------wanpg-- LoginGameLogic2.onResponseJoinGameCallBack" , packetInfo)

	if roomId <= 0 then 
		Toast.getInstance():showText(kTextRoomMorePlayer,400,30,kAlignCenter,"",28,200,175,110);
		LoadingView.getInstance():hidden();
		NativeEvent.getInstance():HideLoadingDialog();	
		return true;
    end

	LoadingView.getInstance():hidden();
	if not GameInfoIsolater.getInstance():getCurGameType() then 
		GameInfoIsolater.getInstance():setCurGameType(nil);
	end

	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local isNeedMsgBox = false;
	if hasIngame == 1 then		
		if not GameInfoIsolater.getInstance():checkIsExitGame(gameId) then--本地不存在该游戏则跳回大厅
		 	local onExitGame = function()
		 		Log.a("TOHALL","LoginGameLogic2.onResponseJoinGameCallBack.onExitGame","==> hall");
		 		GameInfoIsolater.getInstance():setLastGameId(curGameId);
				self:changeOtherGame(GameInfoIsolater.getInstance():getHallGameType());
	       	end
	       	local curGameName = GameInfoIsolater.getInstance():getGameName(curGameId)
			local content = string.concat("有其他游戏正在进行中，游戏结束后再来玩",curGameName,"吧~");
			MessageBox.show("",  content, "确定", nil, false, self, onExitGame);

			return true;
		else 
			if curGameId ~= gameId then
				isNeedMsgBox = true;
			end 
		end
	end
	
	GameInfoIsolater.getInstance():setCurRoomIp(roomIp);
	GameInfoIsolater.getInstance():setCurRoomPort(roomPort);

	GameInfoIsolater.getInstance():setCurTableId(roomId);
 
	GameInfoIsolater.getInstance():setCurRoomLevelId(levelId);
	
	if isNeedMsgBox then
		--说明在房间
		if gameId and gameId > 0 then 
       	    local levelStr = "";
	       	local onContinuGame = function()
		       	if levelId == 100 then
					GameInfoIsolater.getInstance():setInNormalReconnectRoom();
				elseif levelId == 500 or levelId == 700 or levelId == 600 then
					GameInfoIsolater.getInstance():setCurGameType(GameConstant.MATCH_RECONNECT);
				else
					GameInfoIsolater.getInstance():setInNormalReconnectRoom();
				end
				GameInfoIsolater.getInstance():setLastGameId(curGameId);
				GameInfoIsolater.getInstance():setCurGameId(gameId);
				self:changeOtherGame(gameId);
	       	end
	       	returnValue = true;
	       	local content = string.concat(GameInfoIsolater.getInstance():getGameName(gameId),levelStr,"仍在进行中，是否继续游戏？")
			MessageBox.show("",  content, "继续游戏", nil, false, self, onContinuGame);
		else
			Log.e("wanpg------0x210返回gameId",gameId,"搞毛线");
		end
	else
		if GameInfoIsolater.getInstance():isInRoom() and curGameId == gameId then 
			local info = {};
			info.roomId = GameInfoIsolater.getInstance():getCurTableId();
			info.mid = UserBaseInfoIsolater.getInstance():getUserId();
			info.userInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(gameId);
			info.key = "55ff85e777d50680fb52935076d7e55b";

			local data = {};
			data.api = ClientInfoIsolater.getInstance():getApi();
			data.version = ClientInfoIsolater.getInstance():getApkVersion();
			info.plateInfo = json.encode(data);

			self.m_socket:sendMsg(ROOM_SEND_LOGIN, info);
		else 
			GameInfoIsolater.getInstance():setLastGameId(curGameId);
	        GameInfoIsolater.getInstance():setCurGameId(gameId);
	        self:changeOtherGame(gameId);
	    end
	end
	return returnValue;
end

LoginGameLogic2.changeOtherGame = function(self,state,...)
	self:_clearSameNameTools();

	GameInfoIsolater.getInstance():startGame(state,...);
end

--在游戏房间往另一个游戏房间跳转前先释放common2与common中的名字相同的工具类，去掉加载标记，下次可以重新require
LoginGameLogic2._clearSameNameTools = function(self)

	CommonRoomTimer.releaseInstance();
	local pkg = package.loaded;
	pkg["games/common2/tools/commonRoomTimer"] = nil;
end

LoginGameLogic2.s_socketCmdFuncMap = {
	[ROOM_JOIN_GAME_RESPONSE]		= LoginGameLogic2.onResponseJoinGameCallBack;
};

LoginGameCallBackListener = class(CommonLogicCallBackListener);

LoginGameCallBackListener.onCallBack = function(obj, cmd, ...)
	-- body
end