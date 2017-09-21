require("gameBase/gameController");
require("ubReport/ubReport");
require("hall/onlineSocket/globalSocketMessageHandler");

CommonController = class(GameController);

CommonController.ctor = function(self)
	GlobalSocketMessageHandler.getInstance():setObserver(self);
end

CommonController.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
	GlobalSocketMessageHandler.getInstance():clearObserver(self);
end

--@override
CommonController.resume = function(self)
	GameController.resume(self);
	
	EventDispatcher.getInstance():register(Event.Pause,self,self.onPause);
	EventDispatcher.getInstance():register(Event.Resume,self,self.onResume);

	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
	EventDispatcher.getInstance():register(k_socket_php_session_dead_event,self,self.onPhpDead);
end

--@override
CommonController.pause = function(self)
	EventDispatcher.getInstance():unregister(k_socket_php_session_dead_event,self,self.onPhpDead);
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);	

	EventDispatcher.getInstance():unregister(Event.Resume,self,self.onResume);
	EventDispatcher.getInstance():unregister(Event.Pause,self,self.onPause);

	GameController.pause(self);
end

--@brief 获取界面切换时绑定的数据
CommonController.getBundleData = function(self)
	if self.m_state then
		return self.m_state:getBundleData();
	end
end

CommonController.ubReport = function(self,actionID)
	UBReport.getInstance():report(actionID);
end 

--@override
--@brief 重写了处理scene来的指令逻辑，以支持字符串配置和继承
CommonController.handleCmd = function(self, cmd, ...)
	local func = nil;
	local curObj = self;

	while curObj and curObj.s_cmdConfig do
		func = curObj.s_cmdConfig[cmd];
		if func then
			break;
		else
			curObj = curObj.super;
		end
	end

	if type(func) == "function" then
		return func(self, ...);
	elseif type(func) == "string" then
		local funcSelf = nil;
		local curObj = self;
		while curObj do
			funcSelf = curObj[func];
			if funcSelf then
				break;
			else
				curObj = curObj.super;
			end
		end

		if funcSelf and type(funcSelf) == "function" then
			return funcSelf(self, ...);
		end
	end

	Log.w("Not such controller cmd[", string.format("%X",number.valueOf(cmd,0)), "] in current controller");
	return false;
end

--@virtual
CommonController.onPause = function(self)
	kMusicPlayer:pause();
	System.setFrameRate(1);
end

--@virtual
CommonController.onResume = function(self)
	kMusicPlayer:resume();
	System.setFrameRate(40);
	NativeEvent.getInstance():HideLoadingScene(); --关闭菊花
end

-----------------------------------------------------------------------
--子类可重写下列方法
CommonController.canPopStateStack = function(self)
	if self.m_state then
		return self.m_state:canPopStateStack();
	end

	return false;
end

CommonController.onBackPressed = function(self)
	if StateMachine.getInstance():canPop() then
		StateMachine.getInstance():popState();
	else
		StateMachine.getInstance():changeState(States.Hall);
	end
	return true;
end

CommonController.onSocketFirstConnected = function(self)
	Log.i("CommonController.onSocketFirstConnected ===========>");
end

-- socket 重连中
CommonController.onSocketReconnecting = function(self)
	Log.i("CommonController.onSocketReconnecting ===========>");
end

-- socket重连成功
CommonController.onSocketReconnected = function(self)
	Log.i("CommonController.onSocketReconnected ===========>");
end

-- socket断线
CommonController.onSocketReConnectFailed = function(self)
	Log.i("CommonController.onSocketReConnectFailed ===========>");
end

--房间宝箱进度更改
CommonController.onRoomBoxStateChange = function(self)
end

--php请求超时（server返回的）
CommonController.onPhpRequestTimeout = function(self)
end

--广播支付
CommonController.onBroadcastPayMoney = function(self)
end

--广播使用道具
CommonController.onServerBroadPhpUseProps = function(self)
end
-----------------------------------------------------------------------
CommonController.onPhpDead = function(self)	
	NativeEvent.getInstance():closeSecrecy();
  	NativeEvent.getInstance():DelView();
	
    MessageBox.show("登录超时", GameString.get("phpError_phpdead"), "重新登录", nil, false, self, self.handleSockePhpDead);	
end

-- 当socket关闭15分钟以上session过期了,要重新请求登录php
CommonController.handleSockePhpDead = function(self)
 	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.None); 
	-- 大厅的话要覆盖这个方法
	GameManager.getInstance():startGame(GameType.HALL);
end

CommonController.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

CommonController.s_nativeEventFuncMap = {

};
