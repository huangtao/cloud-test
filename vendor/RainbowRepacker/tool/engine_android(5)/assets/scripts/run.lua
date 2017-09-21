
require("hall/onlineSocket/onlineSocketManager");
Run = class();
Run.ctor = function(self)
	
end

--保持会话 设置发送指令定时器到时间 发送指令
Run.keepAlive = function(self)
	EventDispatcher.getInstance():register(Event.Pause,Run,Run.onKeepAliveCallBack);
	EventDispatcher.getInstance():register(Event.Resume,Run,Run.onKeepAliveCallBack);
end

--保持会话 设置发送指令定时器到时间 发送指令
Run.onKeepAliveCallBack = function(self)
	OnlineSocketManager.getInstance():onStartKeepAlive();
end

Run.dtor = function(self)
	
end 