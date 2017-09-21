require("core/object");
require("hall/onlineSocket/onlineSocketManager");
require("common/httpModule");
require("netWork/ServerConfig");

SocketIsolater = class();

SocketIsolater.getInstance = function()
	if not SocketIsolater.s_instance then
		SocketIsolater.s_instance = new(SocketIsolater); 
	end
	return SocketIsolater.s_instance;
end

SocketIsolater.ctor = function(self)
end
SocketIsolater.dtor = function(self)
end

SocketIsolater.getSocket = function(self)
	return OnlineSocketManager.getInstance();
end

SocketIsolater.openSocket = function(self)
	OnlineSocketManager.getInstance():openSocket();
end

SocketIsolater.reopenSocket = function(self,time)
	OnlineSocketManager.getInstance():reopenSocket(time);
end

SocketIsolater.sendMsg = function(self,cmd, info,timeout)
	return OnlineSocketManager.getInstance():sendMsg(cmd, info,timeout);
end

SocketIsolater.addSocketReader = function(self,socketReader)
	return OnlineSocketManager.getInstance():addSocketReader(socketReader);
end

SocketIsolater.addSocketWriter = function(self,socketWriter)
	return OnlineSocketManager.getInstance():addSocketWriter(socketWriter);
end

SocketIsolater.removeSocketReader = function(self,socketReader)
	OnlineSocketManager.getInstance():removeSocketReader(socketReader);
end

SocketIsolater.removeSocketWriter = function(self,socketWriter)
	OnlineSocketManager.getInstance():removeSocketWriter(socketWriter);
end

SocketIsolater.onReceivePacket = function(self, cmd, info) 
	OnlineSocketManager.getInstance():onReceivePacket(cmd, info);
end

--@brief 获取php命令cmd值自增长的
--@note 子模块或子游戏内部使用到php命令时，都应该调用此接口来获取
--		用于保证大厅以及各子游戏、子模块 php cmd值的不冲突
SocketIsolater.getPhpCmdValue = function(self)
	return PhpManager.getInstance():getPhpCmdValue();
end

--@brief 子游戏和php之间的推送类型值， 子游戏如果需要接收PHP推送，则应该监听此类型
--interface GlobalSocketMessageHandler.onGetPhpPushMessageCallBack
SocketIsolater.getPhpPushMsgType = function(self)
	return 34;
end

--@brief 获取由php推送的消息
--@param gameid 子游戏|子模块的gameid
--@return 所有该子游戏缓存的消息, 调用了此方法后，该游戏缓存的数据将被清空，所以如果游戏需要继续使用，则应保存到自己的变量中
--[[
	ret = {
		[1] = {
			xxx,
			xxx
		}
	}
]]
SocketIsolater.getMessagePushedByPhp = function(self, gameid)
	if not gameid then
		return {};
	end

	self.m_pushMessageStack = table.verify(self.m_pushMessageStack);
	local ret = table.verify(self.m_pushMessageStack[gameid]);
	self.m_pushMessageStack[gameid] = nil;
	return ret;
end

--@brief 设置php推送的子游戏or子模块推送信息
--@param gameid 子游戏or子模块gameid
--@param gameMsgType 子游戏自己定义的消息类型(和PHP进行约定)，同一个子游戏gameMsgType应该不同。
SocketIsolater.setMessagePushedByPhp = function(self, gameid, gameMsgType, data)
	if not (gameid and gameMsgType and data) then
		return
	end

	self.m_pushMessageStack = table.verify(self.m_pushMessageStack);
	self.m_pushMessageStack[gameid] = table.verify(self.m_pushMessageStack[gameid]);
	self.m_pushMessageStack[gameid][gameMsgType] = table.verify(self.m_pushMessageStack[gameid][gameMsgType]);
	table.insert(self.m_pushMessageStack[gameid][gameMsgType], data);
end

--@brief 获取cdn地址
SocketIsolater.getCdn = function(self)
	ServerConfig.getInstance():getCdn();
end

--@brief 获取php域名
SocketIsolater.getPhpHostUrl = function(self)
	return ServerConfig.getInstance():getHostUrl();
end

--@brief 注册http监听器
SocketIsolater.registerHttpEvent = function(self, obj, func)
	EventDispatcher.getInstance():register(HttpModule.s_event, obj, func);
end

--@brief 反注册http监听器
SocketIsolater.unregisterHttpEvent = function(self, obj, func)
	EventDispatcher.getInstance():unregister(HttpModule.s_event, obj, func);
end

--@brief 设置http请求参数 
--@param URL http请求地址
--@param METHOD 接口名 eg：Feedback.mGetFeedback
--@param TYPE 请求类型 kHttpPost  kHttpGet
--@param TIMEOUT 超时时间

--[[
	1、TYPE为kHttpGet时
		请求地址为url本身，忽略METHOD本身
	2、TYPE为kHttpPost时
		METHOD会以#进行分隔，并将其拼接到Url后面
		local indexs =  string.find( method, "#");
	    local m = "";
	    local p = "";
	    if indexs then
	        m = string.sub(method , 1 , indexs-1);
	        p = string.sub(method , indexs + 1 );
	    end
	    if m ~="" and p ~= "" then
    	 	url = url .. "?m=".. m .. "&p=" .. p;
    	elseif m ~= "" and p == "" then 
    		url = url .. "?m=" .. m;
    	elseif m == "" and p ~= "" then 
    		url = url .. "?m=" .. p;
    	end  
]]
SocketIsolater.setHttpRequestParams = function(self, URL, METHOD, TYPE, TIMEOUT)
	local httpId = HttpModule.getHttpCmdId();
	HttpModule.s_cmds[httpId] = httpId;
	HttpModule.s_config[httpId] = {
		URL,
		METHOD,
		TYPE,
		TIMEOUT,
	};

	return httpId;
end

--@brief 执行http请求
--@param httpId setHttpRequestParams返回的id
--@param params 参数信息，会将其拼在参数信息中
SocketIsolater.executeHttpRequest = function(self, httpId, params)
	HttpModule.getInstance():execute(httpId, params);
end