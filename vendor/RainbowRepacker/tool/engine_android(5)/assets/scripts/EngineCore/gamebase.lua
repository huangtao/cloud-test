
package.preload[ "gameBase/gameController" ] = function( ... )
-- gameController.lua
-- Author: Vicent Gong
-- Date: 2013-01-17
-- Last modification : 2013-06-27
-- Description: A base class of controller in MVC 

require("gameBase/gameScene")

GameController = class();

GameController.s_cmds = 
{

};

GameController.s_cmdConfig = 
{

};

GameController.ctor = function(self, state, viewClass, viewConfig,...)
	if (not viewClass) or (not viewConfig) then
		error("No such view class or view config");
	end

	if not typeof(viewClass,GameScene) then
		error("View class is not a subclass of GameScene");
	end

	self.m_state = state;
	self.m_view = new(viewClass,viewConfig,self,...);
end

GameController.testCmd = function(self, cmd)
	return self.s_cmdConfig[cmd] and true or false;
end

GameController.handleCmd = function(self, cmd, ...)
	if not self.s_cmdConfig[cmd] then
		FwLog("Controller, no such cmd");
		return;
	end

	return self.s_cmdConfig[cmd](self,...)
end

GameController.updateView = function(self, cmd, ...)
	if not self.m_view then
		return;
	end

	return self.m_view:handleCmd(cmd,...);
end

GameController.pushStateStack = function(self, obj, func)
	self.m_state:pushStateStack(obj,func);
end

GameController.popStateStack = function(self)
	self.m_state:popStateStack();
end

GameController.run = function(self)
	if not self.m_view then
		return;
	end

	self.m_view:run();
end

GameController.resume = function(self)
	if not self.m_view then
		return;
	end

	self.m_view:resume();
end

GameController.pause = function(self)
	if not self.m_view then
		return;
	end

	self.m_view:pause();
end

GameController.stop = function(self)
	if not self.m_view then
		return;
	end
	
	self.m_view:stop();
end

GameController.dtor = function(self)
	delete(self.m_view);
	self.m_view = nil;
end

end
        

package.preload[ "gameBase.gameController" ] = function( ... )
    return require('gameBase/gameController')
end
            

package.preload[ "gameBase/gameEffect" ] = function( ... )
-- gameEffect.lua
-- Author: Vicent Gong
-- Date: 2013-02-20
-- Last modification : 2013-07-12
-- Description: A base wrapper for game effect player

require("core/object");
require("gameBase/gameSound");

GameEffect = class(GameSound,false);

GameEffect.getInstance = function()
	if not GameEffect.s_instance then
		GameEffect.s_instance = new(GameEffect);
	end

	return GameEffect.s_instance;
end

GameEffect.releaseInstance = function()
	delete(GameEffect.s_instance);
	GameEffect.s_instance = nil;
end

GameEffect.ctor = function(self)
	super(self,GameSound.s_effect);
end

GameEffect.unload = function(self, index)
	GameEffect.callFunc(self,"unload",index);
end

GameEffect.stop = function(self, id)
	GameEffect.callFunc(self,"stop",id);
end

GameEffect.preloadAll = function(self)
	for k,v in pairs(self.m_soundFileMap or {}) do
		GameEffect.preload(self,k);
	end
end

GameEffect.unloadAll = function(self)
	for k,v in pairs(self.m_loadedSounds) do
		GameEffect.unload(self,k);
	end
end

GameEffect.dtor = function(self)
	GameEffect.unloadAll(self);
end

end
        

package.preload[ "gameBase.gameEffect" ] = function( ... )
    return require('gameBase/gameEffect')
end
            

package.preload[ "gameBase/gameLayer" ] = function( ... )
-- gameLayer.lua
-- Author: Vicent Gong
-- Date: 2013-01-17
-- Last modification : 2013-06-27
-- Description: A base class of layer in multi-layer scene 

require("core/object");
require("ui/node");
require("editorRT/sceneLoader")

GameLayer = class(Node);

GameLayer.s_controls = 
{

};

GameLayer.s_controlConfig = 
{
	--[GameLayer.s_controls.***] = {"***","***","***"};
};

GameLayer.s_controlFuncMap = 
{
	--[GameLayer.s_controls.***] = function;
};

GameLayer.s_cmds = 
{

};

GameLayer.s_cmdConfig = 
{
	--[GameLayer.s_cmds.***] = ***;
};

GameLayer.s_ctrlCallbackMap = 
{
	{CheckBoxGroup      , "setOnChange"};
	{RadioButtonGroup 	, "setOnChange"};
	{Button 			, "setOnClick"};
	{EditText			, "setOnTextChange"};
	{EditTextView		, "setOnTextChange"};
	{Images	    		, "setEventTouch"};
	{Image				, "setEventTouch"};
	{Slider 			, "setOnChange"};
	{Switch				, "setOnChange"};
	{DrawingBase		, "setEventTouch"};
};

GameLayer.ctor = function(self, viewConfig)
	if not viewConfig then
		return;
	end
	self.m_root = SceneLoader.load(viewConfig);
	if self.m_root then 
	    GameLayer.addChild(self,self.m_root);
	end

	self.m_controlsMap = {};
	GameLayer.addEventListeners(self);
end

GameLayer.dtor = function(self)
	--self.m_root = nil;
	--self.m_controlsMap = nil;
end

GameLayer.getControlInConfig = function(self,config)
	if (not config) or (#config < 1) then
		return nil;
	end
	local result = nil;
	local itorNestValues = function(t)
		local index = {1};

		return function()
			local getValue = function(t,idx)
				local c = t;
				for i=1,#idx-1 do
					c = c[ idx[i] ]; 
				end
				c = c[ idx[#idx] ];
				return c
			end

			local value = getValue(t,index);
			while not value do
				table.remove(index,#index);
				if #index < 1 then
					return nil;
				end
				index[#index] = index[#index] + 1;
				value = getValue(t,index);
			end

			while type(value) == "table" do
				index[#index+1] = 1;
				value = getValue(t,index);
			end

			index[#index] = index[#index] + 1;
			return value;
		end
	end
    
    local ctrl = self.m_root or self;
	for v in itorNestValues(config) do
		ctrl = ctrl:getChildByName(v);
		result = ctrl;
		if not ctrl then
			break;
		end
	end
	return result;
end

--virtual function
GameLayer.getControl = function(self, control)
	if self.m_controlsMap[control] ~= nil then
		return self.m_controlsMap[control] or nil;
	end

	local config = self.s_controlConfig[control];

	if (not config) or (#config < 1) then
		self.m_controlsMap[control] = false;
		return nil;
	end
	local result = self:getControlInConfig(config);
	if result == nil then
		self.m_controlsMap[control] = false;
	else
		self.m_controlsMap[control] = result;
	end
	return self.m_controlsMap[control] or nil;
end

GameLayer.handleCmd = function(self, cmd, ...)
	if not self.s_cmdConfig[cmd] then
		FwLog("Scene, no such cmd");
		return;
	end

	return self.s_cmdConfig[cmd](self,...)
end

--声明 layout 变量
GameLayer.declareLayoutVar = function(self,layoutVarFile)
	local success, map = pcall(function () 
        return require(layoutVarFile)
    end)

    if success == false then
    	error("load layout_var file failed, not ".. layoutVarFile .. " file exist");
    	return
    end
	if map then
		self.s_controls = map["var"];
		self.s_controlConfig = map["ui"];
		self.s_controlFuncMap = map["func"];
		self:addEventListeners();
	end
end

GameLayer.addEventListeners = function(self)
    for k,v in pairs(self.s_controlFuncMap) do
		local ctrl = self:getControl(k);
		if type(v) == "string" then
			v = self[v];
		end
		if ctrl then
			for _,vv in ipairs(GameLayer.s_ctrlCallbackMap) do 
				if typeof(ctrl,vv[1]) then
					ctrl[ vv[2] ](ctrl,self,v);
					break;
				end
			end
		end
	end
end

end
        

package.preload[ "gameBase.gameLayer" ] = function( ... )
    return require('gameBase/gameLayer')
end
            

package.preload[ "gameBase/gameMusic" ] = function( ... )
-- gameMusic.lua
-- Author: Vicent Gong
-- Date: 2013-02-20
-- Last modification : 2013-07-12
-- Description: A base wrapper for game background music player

require("core/object");
require("gameBase/gameSound");

GameMusic = class(GameSound,false);

GameMusic.getInstance = function()
	if not GameMusic.s_instance then
		GameMusic.s_instance = new(GameMusic);
	end

	return GameMusic.s_instance;
end

GameMusic.releaseInstance = function()
	delete(GameMusic.s_instance);
	GameMusic.s_instance = nil;
end

GameMusic.ctor = function(self)
	super(self,GameSound.s_music);
end

GameMusic.unload = function(self,index)
	error("Music can not unload manually now");
end

GameMusic.stop = function(self,doUnload)
	GameMusic.callFunc(self,"stop",doUnload);
end

GameMusic.pause = function(self)
	GameMusic.callFunc(self,"pause");
end

GameMusic.resume = function(self)
	GameMusic.callFunc(self,"resume");
end

GameMusic.isPlaying = function(self)
	return Sound.isMusicPlaying();
end

GameMusic.dtor = function(self)
	GameMusic.stop(self,true);
end

end
        

package.preload[ "gameBase.gameMusic" ] = function( ... )
    return require('gameBase/gameMusic')
end
            

package.preload[ "gameBase/gameScene" ] = function( ... )
-- gameScene.lua
-- Author: Vicent Gong
-- Date: 2013-01-17
-- Last modification : 2013-06-27
-- Description: A base class of view in MVC 

require("core/object");
require("gameBase/gameLayer");

GameScene = class(GameLayer);

GameScene.ctor = function(self, viewConfig, controller)
	self.m_controller = controller;
	GameScene.addToRoot(self);
	GameScene.setFillParent(self,true,true);
end

GameScene.dtor = function(self)
	self.m_controller = nil;
end

GameScene.getController = function(self)
	return self.m_controller;
end

GameScene.requestCtrlCmd = function(self, cmd, ...)
	if not self.m_controller then
		return;
	end

	return self.m_controller:handleCmd(cmd, ...);
end

GameScene.pushStateStack = function(self, obj, func)
	if not self.m_controller then
		return;
	end

	self.m_controller:pushStateStack(obj,func);
end

GameScene.popStateStack = function(self)
	if not self.m_controller then
		return;
	end

	self.m_controller:popStateStack();
end

GameScene.pause = function(self)
	if not self.m_controller then
		return;
	end

	self.m_root:setPickable(false);
end

GameScene.resume = function(self)
	if not self.m_controller then
		return;
	end

	self.m_root:setPickable(true);
end

GameScene.stop = function(self)
	if not self.m_controller then
		return;
	end

	self.m_root:setVisible(false);
end

GameScene.run = function(self)
	if not self.m_controller then
		return;
	end
	
	self.m_root:setVisible(true);
	self.m_root:setPickable(false);
end



end
        

package.preload[ "gameBase.gameScene" ] = function( ... )
    return require('gameBase/gameScene')
end
            

package.preload[ "gameBase/gameSocket" ] = function( ... )
-- gameSocket.lua
-- Author: Vicent Gong
-- Date: 2013-07-15
-- Last modification : 2013-10-12
-- Description: Implement a base class for socket 

require("core/constants");
require("core/object");
require("core/global");
require("network/socket");
require("core/anim");
require("gameBase/socketReader");
require("gameBase/socketWriter");
require("gameBase/socketProcesser")

GameSocket = class();

GameSocket.ctor = function(self, socketType, sockHeader,netEndian,gameId, deviceType, ver, subVer)
	self.m_socket = self:createSocket(socketType,sockHeader,netEndian, gameId, deviceType, ver, subVer);
	self.m_socket:setEvent(self,GameSocket.onSocketEvent);

	self.m_heartBeatInterval = 10000;

	self.m_socketReaders = {};
	self.m_socketWriters = {};
	self.m_socketProcessers = {};

	self.m_commonSocketReaders = {};
	self.m_commonSocketWriters = {};
	self.m_commonSocketProcessers = {};
end

GameSocket.dtor = function(self)
	self:stopHeartBeat();

	self.m_socketReaders = {};
	self.m_socketWriters = {};
	self.m_socketProcessers = {};

	self.m_commonSocketReaders = {};
	self.m_commonSocketWriters = {};
	self.m_commonSocketProcessers = {};

	delete(self.m_socket);
	self.m_socket = nil;
end

GameSocket.openSocket = function(self, ip, port)
	if not self:isSocketOpen() then
		self.m_socket:open(ip,port);
	end
end

GameSocket.closeSocketSync = function(self)
	if self.m_socket then
		self:stopHeartBeat();
		self.m_socket:close();
		self.m_isSocketOpen = false;
	end
end

GameSocket.closeSocketAsync = function(self)
	if self.m_socket then
		self:stopHeartBeat();
		self.m_socket:close(0);
	end
end

GameSocket.isSocketOpen = function(self)
	return self.m_isSocketOpen;
end

GameSocket.sendMsg = function(self, cmd, info)
	--[[if not self.m_isSocketOpen then
		return false;
	end]]

	local packetId = self:writeBegin(self.m_socket,cmd);
	self:writePacket(self.m_socket,packetId,cmd,info);
	self:writeEnd(packetId);
	return true;
end

GameSocket.setHeartBeatInterval = function(self, milliSecond)
	self.m_heartBeatInterval = milliSecond;
end

GameSocket.setHeartBeatCmd = function(self, cmd)
	self.m_heartBeatCmd = cmd;
end

GameSocket.setReconnectParam = function(self, reconnectTimes, interval)
	self.m_socket:setReconnectParam(reconnectTimes, interval);
end

GameSocket.addSocketReader = function(self,socketReader)
	self:addSocketHandler(self.m_socketReaders,SocketReader,socketReader);
end

GameSocket.addSocketWriter = function(self,socketWriter)
	self:addSocketHandler(self.m_socketWriters,SocketWriter,socketWriter);
end

GameSocket.addSocketProcesser = function(self,socketProcesser)
	local ret = self:addSocketHandler(self.m_socketProcessers,SocketProcesser,socketProcesser);
	if ret then
		socketProcesser:setSocketManager(self);
	end
end

GameSocket.removeSocketReader = function(self,socketReader)
	self:removeSocketHandler(self.m_socketReaders,socketReader);
end

GameSocket.removeSocketWriter = function(self,socketWriter)
	self:removeSocketHandler(self.m_socketWriters,socketWriter);
end

GameSocket.removeSocketProcesser = function(self,socketProcesser)
	self:removeSocketHandler(self.m_socketProcessers,socketProcesser);
end

GameSocket.addCommonSocketReader = function(self,socketReader)
	self:addSocketHandler(self.m_commonSocketReaders,SocketReader,socketReader);
end

GameSocket.addCommonSocketWriter = function(self,socketWriter)
	self:addSocketHandler(self.m_commonSocketWriters,SocketWriter,socketWriter);
end

GameSocket.addCommonSocketProcesser = function(self,socketProcesser)
	local ret = self:addSocketHandler(self.m_commonSocketProcessers,SocketProcesser,socketProcesser);
	if ret then
		socketProcesser:setSocketManager(self);
	end
end

GameSocket.removeCommonSocketReader = function(self,socketReader)
	self:removeSocketHandler(self.m_commonSocketReaders,socketReader);
end

GameSocket.removeCommonSocketWriter = function(self,socketWriter)
	self:removeSocketHandler(self.m_commonSocketWriters,socketWriter);
end

GameSocket.removeCommonSocketProcesser = function(self,socketProcesser)
	self:removeSocketHandler(self.m_commonSocketProcessers,socketProcesser);
end

---------------------------------private functions-----------------------------------------

--virtual
GameSocket.createSocket = function(self,socketType, gameId, deviceType, ver, subVer)
	error("Derived class must implement this function");
end

--write packet functions
--virtual
GameSocket.writeBegin = function(self, socket, cmd)
	error("Derived class must implement this function");
end

--virtual
GameSocket.writePacket = function(self, socket, packetId, cmd, info)
	for k,v in pairs(self.m_socketWriters) do
		if v:writePacket(socket,packetId,cmd,info) then
			return true;
		end
	end

	for k,v in pairs(self.m_commonSocketWriters) do
		if v:writePacket(socket,packetId,cmd,info) then
			return true;
		end
	end

	return false;
end

--virtual
GameSocket.writeEnd = function(self, packedId)
	self.m_socket:writeEnd(packedId);
end

--read packet functions
--virtual
GameSocket.readBegin = function(self, packedId)
	return self.m_socket:readBegin(packedId);
end

--virtual
GameSocket.readPacket = function(self, socket, packetId, cmd)
	local packetInfo = nil;	

	for k,v in pairs(self.m_socketReaders) do
		local packetInfo =  v:readPacket(socket,packetId,cmd);
		if packetInfo then
			return packetInfo;
		end
	end

	for k,v in pairs(self.m_commonSocketReaders) do
		local packetInfo =  v:readPacket(socket,packetId,cmd);
		if packetInfo then
			return packetInfo;
		end
	end

	return packetInfo;
end

--virtual
GameSocket.readEnd = function(self, packedId)
	self.m_socket:readEnd(packedId);
end

--process packet functions
--virtual
GameSocket.onReceivePacket = function(self, cmd, info)
	for k,v in pairs(self.m_socketProcessers) do
		local info =  v:onReceivePacket(cmd,info);
		if info then
			return info;
		end
	end

	for k,v in pairs(self.m_commonSocketProcessers) do
		local info = v:onReceivePacket(cmd,info);
		if info then
			for k,v in pairs(self.m_socketProcessers) do
				if v:onCommonCmd(cmd,cmdInfo) then
					break;
				end
			end
			return;
		end
	end

	return false;
end

--socket event functions
--virtual
GameSocket.onSocketConnected = function(self)
	self.m_isSocketOpen = true;
	GameSocket.startHeartBeat(self);
end

--virtual
GameSocket.onSocketReconnecting = function(self)
end

--virtual
GameSocket.onSocketConnectivity = function(self)
	
end

--virtual
GameSocket.onSocketConnectFailed = function(self)
    self.m_isSocketOpen = false;
end

--virtual
GameSocket.onSocketClosed = function(self, param)
	self.m_isSocketOpen = false;
end

--virtual
GameSocket.onTimeout = function(self)
	self.m_isSocketOpen = false;
end

GameSocket.parseMsg = function(self, packetId)
	local cmd = self:readBegin(packetId);
	local info = self:readPacket(self.m_socket,packetId,cmd);
	self:readEnd(packetId);
	return cmd,info;
end

GameSocket.onSocketServerPacket = function(self, packetId)
	GameSocket.stopTimer(self);
	local cmd,info = GameSocket.parseMsg(self,packetId);
	self:onReceivePacket(cmd,info);
end

GameSocket.onSocketEvent = function(self, eventType, param)
	print_string("eventSocket GameSocket.onSocketEvent eventType:" .. eventType);
	if eventType == kSocketConnected then
		print_string("eventSocket kSocketConnected");
        self:onSocketConnected();
    elseif eventType == kSocketReconnecting then
    	print_string("eventSocket kSocketReconnecting");
        self:onSocketReconnecting();
    elseif eventType == kSocketConnectivity then
    	print_string("eventSocket kSocketConnectivity");
        self:onSocketConnectivity(param);
    elseif eventType == kSocketConnectFailed then
    	print_string("eventSocket kSocketConnectFailed");
        self:onSocketConnectFailed();
    elseif eventType == kSocketRecvPacket then
    	print_string("eventSocket kSocketRecvPacket");
        self:onSocketServerPacket(param);
    elseif eventType == kSocketUserClose then
    	print_string("eventSocket kSocketUserClose");
    	self:onSocketClosed(param);
	end
end

--heart beat 
GameSocket.startHeartBeat = function(self)
	if not self.m_heartBeatCmd then
		return;
	end

	GameSocket.stopHeartBeat(self);

	self.m_heartBeatAnim = new(AnimDouble,kAnimRepeat,0,1,self.m_heartBeatInterval,0);
	self.m_heartBeatAnim:setEvent(self,self.onHeartBeat);
end

GameSocket.stopHeartBeat = function(self)
	GameSocket.stopTimer(self);

	delete(self.m_heartBeatAnim);
	self.m_heartBeatAnim = nil;
end

GameSocket.onHeartBeat = function(self)
	local packetId = self:writeBegin(self.m_socket,self.m_heartBeatCmd);
	self:writeEnd(packetId);

	GameSocket.restartTimer(self);
end

GameSocket.onHeartBeatTimeout = function(self)
	GameSocket.stopHeartBeat(self);
	self:onTimeout();
end

GameSocket.restartTimer = function(self)
	self:stopTimer();

	self.m_timeOutAnim = new(AnimInt, kAnimNormal,0,1,self.m_heartBeatInterval*3/4,0);
	self.m_timeOutAnim:setEvent(self, GameSocket.onHeartBeatTimeout);
end

GameSocket.stopTimer = function(self)
	delete(self.m_timeOutAnim);
	self.m_timeOutAnim = nil;
end

GameSocket.addSocketHandler = function(self,vtable,valueType,value)
	if value and (not typeof(value,valueType)) then
		error("add error type to gamesocket");
	end

	if self:checkExist(vtable,value) then
		return false;
	end

	table.insert(vtable,1,value);
	return true;
end

GameSocket.removeSocketHandler = function(self,vtable,value)
	local index = self:getIndex(vtable,value);
	if index ~= -1 then
		table.remove(vtable,index);
		return true;
	end

	return false;
end

GameSocket.getIndex = function(self,vtable,value)
	for k,v in pairs(vtable or {}) do 
		if v == value then
			return k;
		end
	end

	return -1;
end

GameSocket.checkExist = function(self,vtable,value)
	return self:getIndex(vtable,value) ~= -1;
end

end
        

package.preload[ "gameBase.gameSocket" ] = function( ... )
    return require('gameBase/gameSocket')
end
            

package.preload[ "gameBase/gameSound" ] = function( ... )
-- gameSound.lua
-- Author: Vicent Gong
-- Date: 2013-02-20
-- Last modification : 2013-06-27
-- Description: A base wrapper for game sound player

require("core/object");
require("core/sound");

GameSound = class();

GameSound.s_music = "Music";
GameSound.s_effect = "Effect";

GameSound.ctor = function(self, str)
	if str ~= GameSound.s_music and str ~= GameSound.s_effect then
		error("Wrong game sound type");
	end

	self.m_typeStr = str;
	self.m_loadedSounds = {}; 

	self.m_prefix = "";
	self.m_extName = "";
end

GameSound.setSoundFileMap = function(self, soundFileMap)
	self.m_soundFileMap = soundFileMap;
end

GameSound.setPathPrefixAndExtName = function(self, prefix, extName)
	self.m_prefix = prefix;
	self.m_extName = extName;
end

GameSound.getPath = function(self, index)
	if not (self.m_soundFileMap and self.m_soundFileMap[index]) then
		return nil;
	end

	local path = self.m_prefix .. self.m_soundFileMap[index] .. self.m_extName;
	return path;
end

GameSound.preload = function(self, index)
	local path = GameSound.getPath(self,index);
	if not path then
		return;
	end

	self.m_loadedSounds[index] = true;
	GameSound.callFunc(self,"preload",path);
end

GameSound.unload = function(self, index)
	error("Derived class must define this function");
end

GameSound.play = function(self, index, loop)
	local path = GameSound.getPath(self,index);
	if not path then
		return;
	end

	self.m_loadedSounds[index] = true;
	return GameSound.callFunc(self,"play",path,loop);
end

GameSound.stop = function(self)
	error("Derived Class must define this function");
end

GameSound.setVolume = function(self,volume)
	Sound[string.format("%s%s%s","set",self.m_typeStr,"Volume")](volume);
end

GameSound.getVolume = function(self)
	return Sound[string.format("%s%s%s","get",self.m_typeStr,"Volume")]();
end

GameSound.getMaxVolume = function(self)
	return Sound[string.format("%s%s%s","get",self.m_typeStr,"MaxVolume")]();
end

---------------------------------private functions-----------------------------------------

GameSound.callFunc = function(self, commandStr, ...)
	Sound[string.format("%s%s",commandStr,self.m_typeStr)](...);
end

end
        

package.preload[ "gameBase.gameSound" ] = function( ... )
    return require('gameBase/gameSound')
end
            

package.preload[ "gameBase/gameState" ] = function( ... )
-- gameState.lua
-- Author: Vicent Gong
-- Date: 2013-01-17
-- Last modification : 2013-07-12
-- Description: A base class of state

require("core/object");
require("core/state");
require("core/global");
-- require("core/stateMachine")
require("core/eventDispatcher");
require("gameBase/gameController");

--All functions are virtual
GameState = class(State);

GameState.ctor = function(self)
	self.m_stateStack = {};
end

GameState.getController = function(self)
	error("Sub class must define this function,return the controller");
end

GameState.gobackLastState = function(self)
	error("Sub class must define this function");
end

GameState.run = function(self)
	State.run(self);

	local controller = self:getController();
	if typeof(controller,GameController) then
		controller:run();
	end
end

GameState.resume = function(self)
	State.resume(self);
    EventDispatcher.getInstance():register(Event.Back,self,self.onBack);
    
	local controller = self:getController();
	if typeof(controller,GameController) then
		controller:resume();
	end
end

GameState.pause = function(self)
	local controller = self:getController();
	if typeof(controller,GameController) then
		controller:pause();
	end
	
	EventDispatcher.getInstance():unregister(Event.Back,self,self.onBack);

	State.pause(self);
end

GameState.stop = function(self)
	local controller = self:getController();
	if typeof(controller,GameController) then
		controller:stop();
	end

	State.stop(self);
end

GameState.pushStateStack = function(self, obj, func)
	if not self.m_stateStack then
		return;
	end
	
	local t = {};
	t["obj"] = obj;
	t["func"] = func;
	self.m_stateStack[#self.m_stateStack+1] = t;
end

GameState.popStateStack = function(self)
	if not self.m_stateStack then
		return;
	end
	
	if #self.m_stateStack > 0 then
		return table.remove(self.m_stateStack,#self.m_stateStack);
	else
		return nil;
	end
end

GameState.changeState = function(self, state, style, ...)
	StateMachine.getInstance():changeState(state,style,...);
end

GameState.pushState = function(self, state, style, isPopupState, ...)
	StateMachine.getInstance():pushState(state,style,isPopupState,...);
end

GameState.popState = function(self, style, ...)
	local lastStateCallback = self:popStateStack();
	local lastStateCbFunc = lastStateCallback and lastStateCallback["func"];
	if lastStateCbFunc then
		lastStateCbFunc(lastStateCallback["obj"],...);
	else
		return self:gobackLastState(...);
	end
end

GameState.dtor = function(self)
	self.m_stateStack = nil;
end

---------------------------------private functions-----------------------------------------

GameState.onBack = function(self)
	self:popState();
end

end
        

package.preload[ "gameBase.gameState" ] = function( ... )
    return require('gameBase/gameState')
end
            

package.preload[ "gameBase/httpManager" ] = function( ... )
-- HttpManager.lua
-- Author: Vicent.Gong
-- Date: 2013-01-08
-- Last modification : 2013-07-12
-- Description: Implemented a http manager,to manager all http request.

require("core/constants");
require("core/object");
require("network/http");
require("core/eventDispatcher");
require("libs/json_wrap");
require("core/anim");

HttpConfigContants = 
{
	URL = 1,
	METHOD = 2,
	TYPE = 3,
	TIMEOUT = 4,
};

HttpErrorType = 
{
	SUCCESSED = 1,
	TIMEOUT = 2,
	NETWORKERROR = 3,
	JSONERROR = 4,
};

HttpManager = class();
HttpManager.s_event = EventDispatcher.getInstance():getUserEvent();

HttpManager.ctor = function(self,configMap,postDataOrganizer,urlOrganizer)
	self.m_httpCommandMap = {};
	self.m_commandHttpMap = {};
	self.m_commandTimeoutAnimMap = {};
	
	HttpManager.setConfigMap(self,configMap);
	HttpManager.setPostDataOrganizer(self,postDataOrganizer);
	HttpManager.setUrlOrganizer(self,urlOrganizer);

	self.m_userEvent = EventDispatcher.getInstance():getUserEvent();

	self.m_timeout  = 10000;
end

HttpManager.getHttpManagerEvent = function(self)
	return self.m_userEvent;
end

HttpManager.getConfigMap = function(self)
	return self.m_configMap;
end

HttpManager.setConfigMap = function(self,configMap)
	HttpManager.destroyAllHttpRequests(self);
	self.m_configMap = configMap or {};
end

HttpManager.appendConfigs = function(self,configMap)
	for k,v in pairs(configMap or {}) do
		self.m_configMap[k] = v;
	end
end

HttpManager.setDefaultTimeout = function(self,time)
	self.m_timeout = time or self.m_timeout;
end

HttpManager.setPostDataOrganizer = function(self,postDataOrganizer)
	self.m_postDataOrganizer = postDataOrganizer;
end

HttpManager.setUrlOrganizer = function(self,urlOrganizer)
	self.m_urlOrganizer = urlOrganizer;
end

HttpManager.execute = function(self,command,data)
	if not HttpManager.checkCommand(self,command) then
		return false;
	end

	HttpManager.destroyHttpRequest(self,self.m_commandHttpMap[command]);

	local config = self.m_configMap[command];
	local httpType = config[HttpConfigContants.TYPE] or kHttpPost;

	local url = self.m_urlOrganizer(config[HttpConfigContants.URL],
								config[HttpConfigContants.METHOD],
								httpType);
	
	local httpRequest = new(Http,httpType,kHttpReserved,url)
	httpRequest:setEvent(self, self.onResponse);
	httpRequest:setTimeout(self.m_timeout,self.m_timeout);
	if httpType == kHttpPost then 
		local postData =  self.m_postDataOrganizer(config[HttpConfigContants.METHOD],data);
		httpRequest:setData(postData);
	end

	local timeoutAnim = HttpManager.createTimeoutAnim(self,command,config[HttpConfigContants.TIMEOUT] or self.m_timeout);

    self.m_httpCommandMap[httpRequest] = command;
    self.m_commandHttpMap[command] = httpRequest;
    self.m_commandTimeoutAnimMap[command] = timeoutAnim;

	httpRequest:execute();
end

HttpManager.dtor = function (self)
	HttpManager.destroyAllHttpRequests(self);

    self.m_httpCommandMap = nil;
    self.m_commandHttpMap = nil;
	self.m_commandTimeoutAnimMap = nil;

	self.m_configMap = nil;
	self.m_userEvent = nil;
end

---------------------------------private functions-----------------------------------------

HttpManager.checkCommand = function(self, command)
	local errLog = nil;

	repeat 
		if not (command or self.m_configMap[command]) then
			errLog = "There is not command like this";
			break;
		end

		local config = self.m_configMap[command];

		if not config[HttpConfigContants.URL] then
			errLog = "There is not url in command";
			break;
		end

		if not config[HttpConfigContants.METHOD] then
			errLog = "There is not method in command";
			break;
		end

		local httpType = config[HttpConfigContants.TYPE];
		if httpType ~= nil and httpType ~= kHttpPost and  httpType ~= kHttpGet then
			errLog = "Not supported http request type";
			break;
		end
	until true

	if errLog then
		HttpManager.log(self,command,errLog);
		return false;
	end

	return true;
end

HttpManager.log = function(self, command, str)
	local prefixStr = "HttpRequest error :";
	if config then
		prefixStr =prefixStr .. " command |" .. command;
	end

	FwLog(prefixStr .. " | " .. str);
end

HttpManager.onResponse = function(self , httpRequest)
	local command = self.m_httpCommandMap[httpRequest];

	if not command then
		HttpManager.destroyHttpRequest(self,httpRequest);
		return;
	end

	HttpManager.destoryTimeoutAnim(self,command);
 
 	local errorCode = HttpErrorType.SUCCESSED;
 	local data = nil;
   
	repeat 
		-- 判断http请求的错误码,0--成功 ，非0--失败.
		-- 判断http请求的状态 , 200--成功 ，非200--失败.
		if 0 ~= httpRequest:getError() or 200 ~= httpRequest:getResponseCode() then
			errorCode = HttpErrorType.NETWORKERROR;
			break;
		end
	
		-- http 请求返回值
		local resultStr =  httpRequest:getResponse();

		-- http 请求返回值的json 格式
		local json_data = json.decode_node(resultStr);
		--返回错误json格式.
	    if not json_data:get_value() then
	    	errorCode = HttpErrorType.JSONERROR;
			break;
	    end

	    data = json_data;
	until true;
    EventDispatcher.getInstance():dispatch(self.m_userEvent,command,errorCode,data);
	
	HttpManager.destroyHttpRequest(self,httpRequest);
end

HttpManager.onTimeout = function(callbackObj)
	local self = callbackObj["obj"];
	local command = callbackObj["command"];
	EventDispatcher.getInstance():dispatch(self.m_userEvent,command,HttpErrorType.TIMEOUT);

	HttpManager.destroyHttpRequest(self,self.m_commandHttpMap[command]);
end

HttpManager.createTimeoutAnim = function(self,command,timeoutTime)
	local timeoutAnim = new(AnimInt,kAnimRepeat,0,1,timeoutTime,-1);
	timeoutAnim:setDebugName("AnimInt | httpTimeoutAnim");
    timeoutAnim:setEvent({["obj"] = self,["command"] = command},self.onTimeout);

    return timeoutAnim;
end

HttpManager.destoryTimeoutAnim = function(self,command)
	local anim = self.m_commandTimeoutAnimMap[command];
	delete(anim);

	self.m_commandTimeoutAnimMap[command] = nil;
end

HttpManager.destroyHttpRequest = function(self,httpRequest)
	if not httpRequest then 
		return;
	end

	local command = self.m_httpCommandMap[httpRequest];
	
	if not command then
		delete(httpRequest);
	    return;
	end

	HttpManager.destoryTimeoutAnim(self,command);
	self.m_commandHttpMap[command] = nil;
	self.m_httpCommandMap[httpRequest] = nil;
end

HttpManager.destroyAllHttpRequests = function(self)
	for _,v in pairs(self.m_commandHttpMap)do 
		HttpManager.destroyHttpRequest(self,v);
	end
end
end
        

package.preload[ "gameBase.httpManager" ] = function( ... )
    return require('gameBase/httpManager')
end
            

package.preload[ "gameBase/socketProcesser" ] = function( ... )
require("core/object");

SocketProcesser = class();

SocketProcesser.ctor = function(self,controller)
	self.m_controller = controller;
end 

SocketProcesser.setSocketManager = function(self, socketManager)
	self.m_socket = socketManager;
end

SocketProcesser.onReceivePacket = function(self,cmd,packetInfo)
    if self.s_severCmdEventFuncMap[cmd] then
        local info = self.s_severCmdEventFuncMap[cmd](self,packetInfo);
        return info or {};
    end
    return nil;
end

SocketProcesser.onCommonCmd = function(self,cmd,...)
	if self.s_commonCmdHandlerFuncMap[cmd] then
        local info = self.s_commonCmdHandlerFuncMap[cmd](self,...);
        return true;
    end
    return false;
end

SocketProcesser.s_severCmdEventFuncMap = {
	
};

SocketProcesser.s_commonCmdHandlerFuncMap = {
	
};



end
        

package.preload[ "gameBase.socketProcesser" ] = function( ... )
    return require('gameBase/socketProcesser')
end
            

package.preload[ "gameBase/socketReader" ] = function( ... )
require("core/object");

SocketReader = class();

SocketReader.ctor = function(self)
	self.m_socket = nil;	-- 操作的套接字
end

SocketReader.readPacket = function(self, socket, packetId, cmd)
	self.m_socket = socket;

	local packetInfo = nil;
	if self.s_severCmdFunMap[cmd] then
		packetInfo = self.s_severCmdFunMap[cmd](self,packetId);
	end 
	
	return packetInfo;
end

SocketReader.s_severCmdFunMap = {

};
end
        

package.preload[ "gameBase.socketReader" ] = function( ... )
    return require('gameBase/socketReader')
end
            

package.preload[ "gameBase/socketWriter" ] = function( ... )
require("core/object");

SocketWriter = class();

SocketWriter.ctor = function(self)
	self.m_socket = nil;	-- 操作的套接字
end

SocketWriter.writePacket = function(self, socket, packetId, cmd, info)
	self.m_socket = socket;

	if self.s_clientCmdFunMap[cmd] then
		self.s_clientCmdFunMap[cmd](self,packetId,info);
		return true;
	end

	return false;
end

SocketWriter.s_clientCmdFunMap = {
};
end
        

package.preload[ "gameBase.socketWriter" ] = function( ... )
    return require('gameBase/socketWriter')
end
            

package.preload[ "gameBase/version" ] = function( ... )
---
-- @module gameBase.version
-- @return #string 
-- @usage local ver = require 'gameBase.version' -- ver为一个字符串，内容是libgamebase的版本号。

return '3.0(f146a76aa56798fdcfae296906070dc6dafe7cee)'

end
        

package.preload[ "gameBase.version" ] = function( ... )
    return require('gameBase/version')
end
            
require("gameBase.gameController");
require("gameBase.gameEffect");
require("gameBase.gameLayer");
require("gameBase.gameMusic");
require("gameBase.gameScene");
require("gameBase.gameSocket");
require("gameBase.gameSound");
require("gameBase.gameState");
require("gameBase.httpManager");
require("gameBase.socketProcesser");
require("gameBase.socketReader");
require("gameBase.socketWriter");
require("gameBase.version");