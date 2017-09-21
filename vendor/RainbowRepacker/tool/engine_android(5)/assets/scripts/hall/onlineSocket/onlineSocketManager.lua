require("gameBase/gameSocket");

require("hall/onlineSocket/globalSocketCmd");
require("hall/php/phpSocketCmd");

require("hall/php/phpManager");

require("hall/onlineSocket/socketReconnectLogic");
require("common/socketHandlersStack");

OnlineSocketManager = class(GameSocket);

SocketStatus = {
	None = 0;
	Connecting = 1;
	Connected = 2;
	ConnectFailed = 3;
	HeartBeatTimeout = 4;
	Closing = 5;
	Closed = 6;
	Reconnecting = 7;
	Reconnected = 8;
	ReconnectFailed = 9;
};

local SOCKET_CLOSE_TYPE = {
	SERVER_CLOSE = 0; --server主动断开链接(eg停服)or由于网络变化导致断开链接
	USER_CLOSE = 1; --业务主动调用closeSocket断开链接
}

OnlineSocketManager.getInstance = function()
    --地方棋牌使用QE协议,网络字节序
	if not OnlineSocketManager.s_instance then 
		OnlineSocketManager.s_instance = new(OnlineSocketManager,kSocketRoom,PROTOCOL_TYPE_QE, 1, 1,nil,kProtocalVersion);
		OnlineSocketManager.s_instance:setHeartBeatCmd(SERVER_SEND_HEART);
		OnlineSocketManager.s_instance:setKeepAliveCmd(PHP_KEEPALIVE);
	end
	return OnlineSocketManager.s_instance;
end

OnlineSocketManager.releaseInstance = function()
	delete(OnlineSocketManager.s_instance);
	OnlineSocketManager.s_instance = nil;
end
------------------------------------------------------------------------------------------------------------

OnlineSocketManager.ctor = function(self,socketType,sockHeader,netEndian, gameId, deviceType, ver, subVer)
	EventDispatcher.getInstance():register(Event.Resume,self,self.onResume);
	
	self.m_fileName = "OnlineSocketManager";
	self.m_socketReconnectLogFileName = "SocketReconnect ";
	self.m_logicMap = {};

    System.setSocketHeaderSize(14);
    System.setSocketHeaderExtSize(0);

    self:setReconnectParam(100,3000);

    self.m_keepAliveInterval = 5 * 60 * 1000; --保持会话 定时器时长
    self.m_isKeepAlive = false; --开启保持会话定时器开关

    self.m_maxRequestReplyInterval = 1200 --单次收发包最大间隔
    self.m_maxAverageInterval = 500 --最近一次收发包间隔与平均收发包间隔的最大差值
    self.m_requestReplyIntervalTable = {} --请求回复间隔时间表
    self.m_nowRequestTimestamp = nil --当前请求时间戳

    self:_setSocketStatus(SocketStatus.None);

    self.m_reconnectLogic = new(SocketReconnectLogic,self);
end

OnlineSocketManager.dtor = function(self)
	EventDispatcher.getInstance():unregister(Event.Resume,self,self.onResume);
	
	self:_setSocketStatus();

	self:__stopKeepAliveTimeoutTimer();
	self:stopKeepAlive();
	self:_stopOnResumeCheckTimer();

	self:_clearReopenSocketDelayTimer();
	self:_clearDelayReceiverTimer();

    delete(self.m_reconnectLogic);
	self.m_reconnectLogic = nil;

    self.m_logicMap = {};
    self.m_requestReplyIntervalTable = nil
    self.m_nowRequestTimestamp = nil
end

OnlineSocketManager.log = function(self,funcName,...)
	Log.s(self.m_fileName," ",funcName," ",...);
end
------------------------------------------------------------------------------------------------------------
--@override
OnlineSocketManager.sendMsg = function(self, cmd, info,timeout)
	self:openSocket();
	if self:isSocketOpen() then 

		self:log("sendMsg","socket opened ==> GameSocket.sendMsg, cmd = ",number.formatToHex(cmd));
		if cmd < PHP_CMD_CONSTANT then 
			GameSocket.sendMsg(self, cmd, info);
		else 
			self:log("sendMsg","sendPhpMsg phpCmd = ",number.formatToHex(cmd - PHP_CMD_CONSTANT));
			local phpCmd,packetInfo = PhpManager.getInstance():generatePhpPacket(cmd, info,timeout);
			if phpCmd then
				GameSocket.sendMsg(self, phpCmd, packetInfo);
			end
		end 
		
		return true;
	end
end

--@override
OnlineSocketManager.createSocket = function(self,socketType,sockHeader,netEndian, gameId, deviceType, ver, subVer)
	return new(Socket,socketType,sockHeader,netEndian,gameId,deviceType,ver,subVer);
end

--@override
OnlineSocketManager.openSocket = function(self)
	if self.m_serverStoped then
		--停服后不再重新打开socket
		return;
	end

	if self:isSocketOpen() or self:isSocketOpening() then
		-- self:log("openSocket","isSocketOpen or isSocketOpening");

		if not self:isNetWorkAvailable() then
			self:log("openSocket","network disabled ==> onSocketConnectFailed");
			self:onSocketConnectFailed();
		end
		return;
	end
	self:log("openSocket");
	self:_setSocketStatus(SocketStatus.Connecting);

	local ip,port = ServerConfig.getInstance():getIpPort();
	if ip and port then
		self:log("openSocket-->","ip = ",ip,"port = ",port);
		GameSocket.openSocket(self,ip,port);
	else
		self:log("openSocket-->","ip = 1, port = 1");
		GameSocket.openSocket(self,1,1);
	end
end

--@override
OnlineSocketManager.closeSocketSync = function(self)
	self:log("closeSocketSync");
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.closeSocketSync");
	self.m_isKeepAlive = false;

	self:_setSocketStatus(SocketStatus.Closing);
	GameSocket.closeSocketSync(self);
end

--@override
OnlineSocketManager.onSocketClosed = function(self, param)
	self:log("onSocketClosed", "param = ", param);
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onSocketClosed");

	GameSocket.onSocketClosed(self);
	self.m_isKeepAlive = false;

	self:_setSocketStatus(SocketStatus.Closed);
		
	self:onReceivePacket(SOCKET_USER_CLOSED,{socket_close_type = param});
	self:resetRequestTimestamp()
end

--@override
--socket连接成功
OnlineSocketManager.onSocketConnected = function(self)
	self:log("onSocketConnected");
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onSocketConnected");
	GameSocket.onSocketConnected(self);
	self:_setSocketStatus(SocketStatus.Connected);
	ServerConfig.getInstance():onSocketConnected();
	
	self:startKeepAlive();--保持会话

	self.m_connectedCount = number.valueOf(self.m_connectedCount);
	if self.m_connectedCount == 0 then 
		self:onReceivePacket(SOCKET_FIRST_CONNECTED,{});
	else
		self:onReceivePacket(SOCKET_CONNECT_SUCCESS,{});
	end 
	self.m_connectedCount = self.m_connectedCount + 1;
	self:resetRequestTimestamp()
end 

--@override
--socket连接失败
OnlineSocketManager.onSocketConnectFailed = function(self,info)
	self:log("onSocketConnectFailed");
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onSocketConnectFailed");

	GameSocket.onSocketConnectFailed(self);
	self.m_isKeepAlive = false;
	self:_setSocketStatus(SocketStatus.ConnectFailed);

	ServerConfig.getInstance():clearBestIpPortIndex();	

	self:onReceivePacket(SOCKET_CONNECT_FAILED,{});
	self:resetRequestTimestamp()
end

--@override
--心跳包超时
OnlineSocketManager.onTimeout = function(self)
    self:log("onTimeout");
    Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onTimeout");
	GameSocket.onTimeout(self);
	self:closeSocketSync();
	self:_setSocketStatus(SocketStatus.HeartBeatTimeout);

	self:onReceivePacket(SOCKET_HEARTBEAT_TIMEOUT,{});
	self:resetRequestTimestamp()
end 

OnlineSocketManager.onSocketReconnecting = function(self, data)
	self:log("onSocketReconnecting");
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onSocketReconnecting");
	self:_setSocketStatus(SocketStatus.Reconnecting);
	self:onReceivePacket(SOCKET_RECONNECT_ING,data);
end

OnlineSocketManager.onSocketReconnected = function(self)
	self:log("onSocketReconnected");
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onSocketReconnected");
	self:startKeepAlive();--保持会话
	self:_setSocketStatus(SocketStatus.Reconnected);
	self:onReceivePacket(SOCKET_RECONNECT_SUCCESS,{});
	self:resetRequestTimestamp()
end

OnlineSocketManager.onSocketReconnectFailed = function(self)
	self:log("onSocketReconnectFailed");
	Log.sWF(self.m_socketReconnectLogFileName,"OnlineSocketManager.onSocketReconnectFailed");
	self.m_isKeepAlive = false;
	self:_setSocketStatus(SocketStatus.ReconnectFailed);
	self:onReceivePacket(SOCKET_RECONNECT_FAILED,{});
	self:resetRequestTimestamp()
end

--@override
OnlineSocketManager.writeBegin = function(self, socket, cmd)
	local packetId = socket:writeBegin3(cmd);
	return packetId;
end 

--override
OnlineSocketManager.onSocketServerPacket = function(self, packetId)
	GameSocket.stopTimer(self);
	self:updateNetIconState()
	local cmd,info,isValidPacket = self:parseMsg(packetId);

	if isValidPacket then
		self:onReceivePacket(cmd,info);
	else
		self:log("onSocketServerPacket", "WARNING filter cmd = ", number.formatToHex(cmd));
	end
end

OnlineSocketManager.updateNetIconState = function(self)
	if self.m_nowRequestTimestamp then
		local state = false
		local val = Clock.now() - self.m_nowRequestTimestamp
		local num = #self.m_requestReplyIntervalTable
		if val > self.m_maxRequestReplyInterval then
			state = true
			self:log("OnlineSocketManager.updateNetIconState:",ClientInfo.getInstance():getNetworkName(),val)
		else
			local average = 0
			if num > 3 then
				local count = 0
				for i = 1, num do
					count = count + tonumber(self.m_requestReplyIntervalTable[i])
				end
				average = count / num
				if val - average > self.m_maxAverageInterval then
					state = true
					self:log("OnlineSocketManager.updateNetIconState:",ClientInfo.getInstance():getNetworkName(),val,average)
				end
			end
		end
		if num >= 10 then
			table.remove(self.m_requestReplyIntervalTable, 1)
		end
		table.insert(self.m_requestReplyIntervalTable, val)
		self.m_nowRequestTimestamp = nil
		self:onReceivePacket(SOCKET_UPDATE_NET_ICON, state)
	end
end

OnlineSocketManager.resetRequestTimestamp = function(self)
	self.m_nowRequestTimestamp = nil
	self.m_requestReplyIntervalTable = {}
	self:onReceivePacket(SOCKET_UPDATE_NET_ICON, false)
end

--override
OnlineSocketManager.parseMsg = function(self, packetId)
	local cmd = self:readBegin(packetId);
	local info, isValidPacket = self:readPacket(self.m_socket,packetId,cmd);
	self:readEnd(packetId);
	return cmd,info,isValidPacket;
end

--override
OnlineSocketManager.readPacket = function(self, socket, packetId, cmd)
	local packetInfo = nil;
	local isValidPacket = false;

	for k,v in pairs(self.m_socketReaders) do
		local packetInfo, isValid =  v:readPacket(socket,packetId,cmd);
		isValidPacket = isValid and true or isValidPacket;
		if packetInfo then
			return packetInfo, true;
		end
	end

	for k,v in pairs(self.m_commonSocketReaders) do
		local packetInfo, isValid =  v:readPacket(socket,packetId,cmd);
		isValidPacket = isValid and true or isValidPacket;
		if packetInfo then
			return packetInfo, true;
		end
	end

	return packetInfo, isValidPacket;
end

OnlineSocketManager.onReceivePacket = function(self, cmd, info) 
 	self:log("onReceivePacket","cmd =" ,number.formatToHex(cmd));
	if self.m_isStartDelayReceiver then 
		self:log("onReceivePacket","StartDelayReceiver ==> _addPacketToDelayReceiver cmd = " ,number.formatToHex(cmd));
		self:_addPacketToDelayReceiver(cmd,info);
	else 	
		self:log("onReceivePacket","==> _handleReceivePacket");	
		self:_handleReceivePacket(cmd,info);	
	end 
end

OnlineSocketManager._handleReceivePacket = function(self,cmd,info)
	if cmd == RESPONSE_PHP_REQUEST or cmd == RESPONSE_PHP_REQUEST_NEW then 	
		PhpManager.getInstance():pushCmdToRecQueue(cmd,info); 
	else 
		self:log("_handleReceivePacket", "receive server cmd = ", number.formatToHex(cmd), " info = ", info);
		self:_handlePacket(cmd,info);
	end
end

OnlineSocketManager.onReceivePhpPacket = function(self, phpCmd, phpInfo)
	if not phpCmd then
		return;
	end
	
	if phpCmd == PHP_KEEPALIVE then
		self:__stopKeepAliveTimeoutTimer();
	end
	self:log("_handleReceivePacket","receive php subCmd =" ,number.formatToHex(phpCmd - PHP_CMD_CONSTANT));  
	self:_handlePacket(phpCmd,unpack(phpInfo));
end

OnlineSocketManager._handlePacket = function(self,cmd,...)
	local isHandle = SocketHandlersStack.getInstance():handlePacket(cmd,...);
	if not isHandle then 
		self:log("_handlePacket"," Not handler cmd =", number.formatToHex(cmd));		
	end 
end

OnlineSocketManager.isNetWorkAvailable = function(self)
	local res = NativeEvent.getInstance():getNetWorkAvalible();
	self:log("OnlineSocketManager.isNetWorkAvailable", "res = ", res);
	return res;
end

OnlineSocketManager.isSocketOpening = function(self)
	local status = self:_getSocketStatus();
	local isOpening = status == SocketStatus.Connecting or status == SocketStatus.Reconnecting;

	self:log("OnlineSocketManager.isSocketOpening", "isOpening = ", isOpening);
	return isOpening;
end

OnlineSocketManager.isSocketAvailable = function(self)
	local isOpen = self:isSocketOpen();
	local status = self:_getSocketStatus();
	local isAvailable = status == SocketStatus.Connected or status == SocketStatus.Reconnected;

	return isOpen and isAvailable;
end

OnlineSocketManager.isSocketOffline = function(self)
	local status = self:_getSocketStatus();

	self:log("OnlineSocketManager.isSocketOffline", "status = ", status);
	return status == SocketStatus.Offline;
end

OnlineSocketManager._setSocketStatus = function(self,status)
	self:log("OnlineSocketManager._setSocketStatus", "status = ", status);
	self.m_socketStatus = status or SocketStatus.None;
end

OnlineSocketManager._getSocketStatus = function(self)
	return self.m_socketStatus or SocketStatus.None;
end

OnlineSocketManager.setServerStoped = function(self)
	self.m_serverStoped = true;
end
----------------------------------------------------------------------------------------------
OnlineSocketManager.reopenSocket = function(self,time)
	self:log("OnlineSocketManager.reopenSocket");
	if 	self:isSocketOpen() or self:isSocketOpening() then
		self:log("OnlineSocketManager.reopenSocket", "begin close last socket ");
		--原来的连接未断开
		self:closeSocketSync();--关闭连接

		--留一定的时间来关闭连接
		if not self.m_reopenSocketDelayTimer then
			self.m_reopenSocketDelayTimer = AnimFactory.createAnimInt(kAnimNormal,0,1,(time or 1000),0);
			self.m_reopenSocketDelayTimer:setDebugName("AnimInt|OnlineSocketManager|reopenSocketDelayTimer");
			self.m_reopenSocketDelayTimer:setEvent(self, self._onReopenSocketTimer);
		end
	else
		self:log("OnlineSocketManager.reopenSocket", "openSocket");
		--原来的连接已断开
		self:openSocket();
	end
end

OnlineSocketManager._onReopenSocketTimer = function(self)
	self:log("OnlineSocketManager._onReopenSocketTimer");
	self:_clearReopenSocketDelayTimer();

	self:openSocket();
end

OnlineSocketManager._clearReopenSocketDelayTimer = function(self)
	self:log("OnlineSocketManager._clearReopenSocketDelayTimer");
	delete(self.m_reopenSocketDelayTimer);
	self.m_reopenSocketDelayTimer = nil;
end
----------------------------------------------------------------------------------------------
--延时接收数据包
OnlineSocketManager.startDelayReceiver = function(self,time)
	self:log("startDelayReceiver","time = ",time);
	self.m_isStartDelayReceiver = true;

	self:_clearDelayReceiverTimer();

	self.m_delayReceiverTimer = AnimFactory.createAnimInt(kAnimNormal,0,1,(time or 1000),0);
	self.m_delayReceiverTimer:setDebugName("AnimInt|OnlineSocketManager|delayReceiverTimer");
	self.m_delayReceiverTimer:setEvent(self, self._onDelayReceiverTimeout);
end

OnlineSocketManager._onDelayReceiverTimeout = function(self)
	self:log("OnlineSocketManager._onDelayReceiverTimeout");
	self:_clearDelayReceiverTimer();

	self:log("_onDelayReceiverTimeout","handle start");
	self:_handleMsgInDelayReceiver();
	self:log("_onDelayReceiverTimeout","handle end");
end

OnlineSocketManager._handleMsgInDelayReceiver = function(self)
    self.m_delayReceiverMap = table.verify(self.m_delayReceiverMap);
	self:log("_handleMsgInDelayReceiver","#self.m_delayReceiverMap = ",#self.m_delayReceiverMap);
    if #self.m_delayReceiverMap > 0 then
        local v = table.remove(self.m_delayReceiverMap, 1);
        self:log("_handleMsgInDelayReceiver"," ==> _handleReceivePacket cmd = ",number.formatToHex(v.cmd));
        self:_handleReceivePacket(v.cmd,v.info);
        self:_handleMsgInDelayReceiver(); 
    else 
    	self.m_isStartDelayReceiver = false;
    end
end

OnlineSocketManager._clearDelayReceiverTimer = function(self)
	self:log("OnlineSocketManager._clearDelayReceiverTimer");
	delete(self.m_delayReceiverTimer);
	self.m_delayReceiverTimer = nil;
end

OnlineSocketManager._addPacketToDelayReceiver = function(self,cmd,info)
	self:log("_addPacketToDelayReceiver","cmd =" ,number.formatToHex(cmd));
	local receiver = table.verify(self.m_delayReceiverMap);

	local data = {};
	data.cmd = cmd;
	data.info = info;
	
	table.insert(receiver,data);
	self.m_delayReceiverMap = receiver;
end
---------------------------------------------------------------------------------------------------------

---------------------------------- 请求会话开始 -----------------------------------------------
--保持会话 设置发送指令
OnlineSocketManager.setKeepAliveCmd = function(self,cmd)
	self.m_keepAliveCmd = cmd;
end

--保持会话 设置发送指令间隔时长
OnlineSocketManager.setKeepAliveInterval = function(self,keepAliveInterval)
	self.m_keepAliveInterval = keepAliveInterval or self.m_keepAliveInterval;
end

--保持会话  开启发送指令定时器
OnlineSocketManager.startKeepAlive = function(self)
	self:log("startKeepAlive =========> ","self.m_isKeepAlive = ",self.m_isKeepAlive);
	if self.m_isKeepAlive then 
		return; 
	end

	self:stopKeepAlive();
	self.m_isKeepAlive = true;
	self:log("startKeepAlive =========> ");
	self.m_keepAliveAnim = AnimFactory.createAnimDouble(kAnimRepeat,0,1,self.m_keepAliveInterval,-1);
	self.m_keepAliveAnim:setDebugName("OnlineSocketManager.m_keepAliveAnim");
	self.m_keepAliveAnim:setEvent(self,self.onStartKeepAlive);
end

--保持会话 设置发送指令定时器到时间 发送指令
OnlineSocketManager.onStartKeepAlive = function(self)
	if not self.m_keepAliveCmd  then
		self:log("onStartKeepAlive =========> ","not self.m_keepAliveCmd ==> return ");
		return;
	end
	self:log("onStartKeepAlive ========> sendMsg self.m_keepAliveCmd");
	self:__startKeepAliveTimeoutTimer();
	self:sendMsg(self.m_keepAliveCmd,{});
end

--保持会话 删除发送指令定时器
OnlineSocketManager.stopKeepAlive = function(self)
	self:log("stopKeepAlive");
	self:__stopKeepAliveTimeoutTimer();

	delete(self.m_keepAliveAnim);
	self.m_keepAliveAnim = nil;
end

OnlineSocketManager.__stopKeepAliveTimeoutTimer = function(self)
	self:log("OnlineSocketManager.__stopKeepAliveTimeoutTimer");
	delete(self.m_keepAliveTimeoutTimer);
	self.m_keepAliveTimeoutTimer = nil;
end

OnlineSocketManager.__startKeepAliveTimeoutTimer = function(self)
	self:log("OnlineSocketManager.__startKeepAliveTimeoutTimer");

	self:__stopKeepAliveTimeoutTimer();

	self.m_keepAliveTimeoutTimer = AnimFactory.createAnimDouble(kAnimRepeat, 0, 1, 6000, -1);
	self.m_keepAliveTimeoutTimer:setDebugName("OnlineSocketManager.m_keepAliveTimeoutTimer");
	self.m_keepAliveTimeoutTimer:setEvent(self, self.__onKeepAliveTimeout);
end

OnlineSocketManager.__onKeepAliveTimeout = function(self)
	self:log("OnlineSocketManager.__onKeepAliveTimeout");

	self:__stopKeepAliveTimeoutTimer();
	self.m_isKeepAlive = false;
	self:onStartKeepAlive();--保持会话消息发送超时后，先重新发送条
	self:startKeepAlive();
end
---------------------------------- 请求会话结束 -----------------------------------------------

--游戏从后台切回来后,延迟1s尝试打开socket与发送心跳包,减少在后台时网络发生后重连花费的时间
OnlineSocketManager.onResume = function(self)
	self:log("OnlineSocketManager.onResume");
	self:_stopOnResumeCheckTimer();
	
	self.m_onResumeCheckTimer =  AnimFactory.createAnimInt(kAnimNormal, 0, 1, 1000, 0);
	self.m_onResumeCheckTimer:setDebugName("OnlineSocketManager.m_onResumeCheckTimer");
	self.m_onResumeCheckTimer:setEvent(self, self._onResumeCheckTimeout);	
end

OnlineSocketManager._stopOnResumeCheckTimer = function(self)
	self:log("OnlineSocketManager._stopOnResumeCheckTimer");
	delete(self.m_onResumeCheckTimer);
	self.m_onResumeCheckTimer = nil;
end

OnlineSocketManager._onResumeCheckTimeout = function(self)
	self:log("OnlineSocketManager._onResumeCheckTimeout");
	self:_stopOnResumeCheckTimer();
	
	self:openSocket();
	GameSocket.onHeartBeat(self);
end

OnlineSocketManager.onHeartBeat = function(self)
	GameSocket.onHeartBeat(self)
	self.m_nowRequestTimestamp = Clock.now()
end

--获取server断开链接type值
OnlineSocketManager.getServerCloseSocketTypeValue = function(self)
	return SOCKET_CLOSE_TYPE.SERVER_CLOSE;
end

--获取业务主动断开链接type值
OnlineSocketManager.getUserCloseSocketTypeValue = function(self)
	return SOCKET_CLOSE_TYPE.USER_CLOSE;
end