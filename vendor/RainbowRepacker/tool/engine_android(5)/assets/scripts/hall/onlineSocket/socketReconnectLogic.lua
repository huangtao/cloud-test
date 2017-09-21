require("common/commonLogic");
require("common/messageBox");
require("hall/userInfo/data/userInfoData");
require("hall/common/gameManager");
require("gameData/clientInfo");

SocketReconnectLogic = class(CommonLogic);

SocketReconnectLogic.Delegate = {
	onSocketReconnecting = "onSocketReconnecting";
	onSocketReconnected = "onSocketReconnected";
	onSocketReconnectFailed = "onSocketReconnectFailed";
};

SocketReconnectLogic.ctor = function(self)
	self.m_fileName = "SocketReconnect ";
    self.m_maxReconnectTime = 5;
    self.m_socketRecTime = 0;
end

SocketReconnectLogic.dtor = function(self)
end

SocketReconnectLogic.log = function(self,funcName,...)
	Log.sWF(self.m_fileName," ",funcName," ",...);
end

SocketReconnectLogic._getSocket = function(self)
	if not self.m_socket then 
		self.m_socket = OnlineSocketManager.getInstance();
	end 
end
------------------------------------------------------------------------------
SocketReconnectLogic.requestReconnectSocket = function(self)
	self:_startReconnectSocket(true);
end
------------------------------------------------------------------------------
SocketReconnectLogic.onSocketConnectSuccess = function(self)
	self:log("onSocketConnectSuccess");

	-- if self.m_isSocketReconnecting then 
	-- 	self:log("onSocketConnectSuccess","reconnecting ==> _socketReconnected");
		self:_socketReconnected();
	-- end 
end

SocketReconnectLogic.onSocketConnectFailed = function(self)
	self:log("onSocketConnectFailed");
 	if self.m_socketRecTime >= self.m_maxReconnectTime then 
 		self:log("onSocketConnectFailed"," ==> _socketOffine");

 		self:_socketOffine();
 	else 

 		self:log("onSocketConnectFailed"," ==> _tryReconnectSocket");
 		self:_tryReconnectSocket();
 	end 
end

SocketReconnectLogic.onHeatBeatTimeout = function(self)
	self:log("onHeatBeatTimeout");
	self:_startReconnectSocket();
end

------------------------------------------------------------------------------
--处理socket重连中
SocketReconnectLogic._startReconnectSocket = function(self,isForce)
	self:log("_startReconnectSocket");
	if self.m_isSocketReconnecting or kLoginDataInterface:getIsStopServer() then 
		self:log("_startReconnectSocket","reconnecting ==> return", kLoginDataInterface:getIsStopServer());
		return;
	end 
	self:_stopTryReconnect();
	self.m_isSocketReconnecting = true;
	self.m_socketRecTime = 0;

	ServerConfig.getInstance():clearBestIpPortIndex();	

		
	self:_tryReconnectSocket(isForce);

	--开启计时器
	self.m_recCountAnim = AnimFactory.createAnimInt(kAnimRepeat,0,1,6000,-1);
	self.m_recCountAnim:setDebugName("SocketReconnectLogic.onHandleSocketReconnect m_recCountAnim");
	self.m_recCountAnim:setEvent(self,self.onSocketAnimCallBack);
end

SocketReconnectLogic.onSocketAnimCallBack = function(self)
	self:log("onSocketAnimCallBack");

	self:_tryReconnectSocket();
end

SocketReconnectLogic._tryReconnectSocket = function(self,isForce)
	self:log("_tryReconnectSocket","already socketRecTime = ",self.m_socketRecTime);
	self:_getSocket();

	if isForce then 
		if self.m_socket:isSocketOffline() then 
			self:log("_tryReconnectSocket","offline ==> _socketOffine");
			self:_stopTryReconnect();
			return;
		end 

		if self.m_socket:isSocketAvailable() then 
			self:log("_tryReconnectSocket","available ==> _socketReconnected");
			self:_socketReconnected();
			return;
		end 
	end 

	self.m_socketRecTime = self.m_socketRecTime + 1;
	self:log("_tryReconnectSocket","cur socketRecTime = ",self.m_socketRecTime);

	if self.m_socketRecTime > self.m_maxReconnectTime then 
		self:log("_tryReconnectSocket"," ==> _socketOffine");
		self:_socketOffine();

	else
		local msg = string.concat("重连中，正在进行第", self.m_socketRecTime, "次尝试");
		self:log("_tryReconnectSocket",msg);
		self:log("_tryReconnectSocket"," ==> OnlineSocketManager reopenSocket");


		self.m_socket:reopenSocket();

		self:execDelegate(SocketReconnectLogic.Delegate.onSocketReconnecting, {count = self.m_socketRecTime});
	end
end

SocketReconnectLogic._stopTryReconnect = function(self)
	self:log("_stopTryReconnect");

	self.m_isSocketReconnecting = nil;

	self.m_socketRecTime = 0;

	delete(self.m_recCountAnim);
	self.m_recCountAnim = nil;
end

SocketReconnectLogic._socketReconnected = function(self)
	self:log("_socketReconnected");
	self:_stopTryReconnect();
	self:onSendLoginHall();
	self:execDelegate(SocketReconnectLogic.Delegate.onSocketReconnected);
end

SocketReconnectLogic._socketOffine = function(self)
	self:log("_socketOffine");
	self:_stopTryReconnect();

	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.Offline); 
	self:execDelegate(SocketReconnectLogic.Delegate.onSocketReconnectFailed);
	if not kGameManager:isInRoom() then
		kGameManager:startGame(GameType.HALL);
	end
end

-----------------------------------------------------------
SocketReconnectLogic.onSendLoginHall = function(self)
	self:log("onSendLoginHall");
	local loginState = kLoginDataInterface:getLoginState();
	Log.eWF("MultiDeviceLogin ","SocketReconnectLogic.onSendLoginHall","kLoginDataInterface:getLoginState() = ",loginState);
	if loginState == LoginConstants.eLoginState.MultiDeviceLogin then 
		Log.eWF("MultiDeviceLogin ","SocketReconnectLogic.onSendLoginHall","已异地登录，不发登录大厅");
	    return;
	end 
	if loginState == LoginConstants.eLoginState.Switching or 
		loginState == LoginConstants.eLoginState.Logining then 
		Log.eWF("MultiDeviceLogin ","SocketReconnectLogic.onSendLoginHall","正在切换账号或正在登录，不发登录大厅");
		return;
	end 

	local info = {};
	info.userId = kUserInfoData:getUserId();
	info.api = kClientInfo:getApi();
	info.guid = kClientInfo:getGuid();
	local data = {};
	data.api = kClientInfo:getApi();
	data.version = kClientInfo:getApkVersion();
	info.plateInfo = json.encode(data);

	info.version = kGameManager:getApkVerison();
	info.appid = kClientInfo:getAppId();
	info.hallVersion = kGameManager:getGameVersion(GameType.HALL);

	self:_getSocket();
	Log.eWF("MultiDeviceLogin ","SocketReconnectLogic.onSendLoginHall","sendMsg HALL_SEND_LOGIN");
	self.m_socket:sendMsg(HALL_SEND_LOGIN,info);
end

SocketReconnectLogic.onHallLoginSuccess = function(self,packetInfo)

	self:log("onHallLoginSuccess");
    --若有物品需要更新，先更新物品
    if not table.isEmpty(packetInfo.objectInfo) then
        require("hall/userInfo/data/userInfoData");
        local _userInfo = UserInfoData.getInstance();

        if tonumber(packetInfo.objectInfo.money) and tonumber(packetInfo.objectInfo.money) > 0 then
            _userInfo:setMoney(tonumber(packetInfo.objectInfo.money) or 0);
        end

        if tonumber(packetInfo.objectInfo.safebox) and tonumber(packetInfo.objectInfo.safebox) > 0 then
            _userInfo:setSafeBoxCurMoney(tonumber(packetInfo.objectInfo.safebox),0);
        end

        if tonumber(packetInfo.objectInfo.diamond) and tonumber(packetInfo.objectInfo.diamond) > 0 then
            _userInfo:setDiamond(tonumber(packetInfo.objectInfo.diamond),0);
        end

        if tonumber(packetInfo.objectInfo.silver) and tonumber(packetInfo.objectInfo.silver) > 0 then
            _userInfo:setCrystal(tonumber(packetInfo.objectInfo.silver),0);
        end
        
        if tonumber(packetInfo.objectInfo.masterpoint) then
        	require("hall/matchHall/gameMatchHall/data/matchRecordDataInterface");
            MatchRecordDataInterface.getInstance():setMyMasterPoint(tonumber(packetInfo.objectInfo.masterpoint),0);
        end
    end

	if kLoginDataInterface:getIsMultiLogin() then 
		Log.eWF("MultiDeviceLogin ","SocketReconnectLogic.onHallLoginSuccess","已异地登录，不做后续处理");
	    return;
	end 

	if not kLoginDataInterface:getIsLoginSuccess() then
		return;
	end
	
	local roomId = 0;
	local gameId = 0;
	local roomLevel = 0;
	if packetInfo.ret == 1 then
		roomId = number.valueOf(packetInfo.roomId);
		gameId = number.valueOf(packetInfo.gameType);
		if roomId > 0 then
			roomLevel = number.valueOf(packetInfo.roomLevel);
		end
    end

    local matchRecInfo = packetInfo.matchInfo;
   	local matchGameId = 0;
    if not table.isEmpty(matchRecInfo) then
    	matchGameId = number.valueOf(matchRecInfo.gameId);
    end

    MatchHallDataInterface.getInstance():checkLastConnect(matchRecInfo);

    local onlookerInfo = packetInfo.onlookerInfo;
    local onlookerGameId = 0;
    if not table.isEmpty(onlookerInfo) then
    	onlookerGameId = number.valueOf(onlookerInfo.gameId);
    end

    if not ( kGameManager:getInitStatus(gameId) or kGameManager:getInitStatus(matchGameId)  
    		or kGameManager:getInitStatus(onlookerGameId) ) then --本地不存在该游戏则不保存相关信息
    	return;
    end 

    if kGameManager:isInRoom() --当前在需要重连去的那个游戏的房间界面，房间中会处理重连，不需再切换状态
    	and (gameId > 0 or matchGameId > 0 or onlookerGameId > 0) then 
    	local curGameId = kGameManager:getCurGameId();
    	if gameId == curGameId 
    		or matchGameId == curGameId 
    		or onlookerGameId == curGameId then 
    		return;
    	end 
    end  

    if gameId > 0 then --需要重连的时候再保存相关信息
    	kGameManager:getGameLevelListByGameId(gameId);
    	kGameManager:setLastGameId(kGameManager:getCurGameId());
	    kGameManager:setCurTableId(roomId);	
		kGameManager:setCurGameId(gameId);
		kGameManager:setCurRoomLevelId(roomLevel);
		kGameManager:setCurRoomPort(packetInfo.roomPort);
		kGameManager:setCurRoomIp(packetInfo.roomIP);
	end 

	if onlookerGameId > 0 then 
		kGameManager:getGameLevelListByGameId(onlookerGameId);
    	kGameManager:setLastGameId(kGameManager:getCurGameId());
		kGameManager:setCurGameId(onlookerGameId);
		kGameManager:setCurRoomLevelId(onlookerInfo.roomLevel);
	end 
	
	
	if not table.isEmpty(matchRecInfo) then --重连比赛（TODO）
		local svid = number.valueOf(matchRecInfo.svid);
		local matchId = number.valueOf(matchRecInfo.matchId);
		gameId = number.valueOf(matchRecInfo.gameId);

		if matchId > 0 and gameId > 0 then	
			 kGameManager:setCurGameId(gameId);

			 local info = {};
			 info.id = matchId;
			 info.gameId = gameId;

			 if not table.isEmpty(onlookerInfo) and onlookerGameId == gameId then
		    	info.isEnterOnlooker = true;
		    	info.userId = onlookerInfo.userId;
		    	roomLevel = onlookerInfo.roomLevel;
		    end

			 if roomId > 0 then 
			 	kAppData:setCurGameType(AppData.MATCH_RECONNECT_INGAME);			
			 else
			 	kAppData:setCurGameType(AppData.MATCH_RECONNECT);
			 end
			 kGameManager:setCurRoomLevelId(roomLevel);
			 MatchHallDataInterface.getInstance():setMatchData(info);
			 GameManager.getInstance():startGame(gameId,nil,info);
			return;
		end
	end

	if roomId > 0 and gameId > 0 then 
		local info = {}
		info.roomPort = packetInfo.roomPort;		
		info.roomIp = packetInfo.roomIp;
		info.roomId = roomId;

		if kAppData:checkIsPrivateRoomLevel(roomLevel) then 
			kAppData:setCurGameType(AppData.PRIVATE_ROOM_RECONNECT); 
		elseif kAppData:checkIsMatchRoomLevel(roomLevel) then
			kAppData:setCurGameType(AppData.MATCH_RECONNECT);
		else
			kAppData:setCurGameType(AppData.NORMAL_ROOM_RECONNECT);
		end
		-- MatchHallDataInterface.getInstance():getLimitMatchData();--请求是否当前有比赛场 --防止登录时候没有请求到的情况
		kUserInfoData:getGameRecordData(gameId);
		GameManager.getInstance():startGame(gameId,nil,info);
		return;
	end 

	if onlookerGameId > 0 then 
		local info = {};
		info.isEnterOnlooker = true;
		info.userId = onlookerInfo.userId;
		info.gameId = onlookerGameId;
		info.roomLevel = onlookerInfo.roomLevel;

		kAppData:setCurGameType(nil);
		kUserInfoData:getGameRecordData(onlookerGameId);
		GameManager.getInstance():startGame(onlookerGameId,nil,info);
		return;
	end 
end

SocketReconnectLogic.s_socketCmdFuncMap = {
    [SOCKET_CONNECT_SUCCESS] 			= SocketReconnectLogic.onSocketConnectSuccess;
	[SOCKET_CONNECT_FAILED] 	 		= SocketReconnectLogic.onSocketConnectFailed;
	[SOCKET_HEARTBEAT_TIMEOUT] 		    = SocketReconnectLogic.onHeatBeatTimeout;

	[HALL_LOGIN_SUCCESS] 				= SocketReconnectLogic.onHallLoginSuccess;
};