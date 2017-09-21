require("common/socketHandlerBase");


CommonLogic = class(SocketHandlerBase);

CommonLogic.Delegate = {

};

CommonLogic.s_cmds = 
{

};

CommonLogic.s_cmdConfig = 
{
    --[CommonLogic.s_cmds.***] = ***;
};

CommonLogic.s_nativeEventFuncMap = {
	
};

CommonLogic.ctor = function(self, delegate)
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
	
	self:setDelegate(delegate);
	self:addSocketTools();
end

CommonLogic.dtor = function(self)
	self:removeSocketTools();
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

-------------------------interface--------------------------
CommonLogic.setDelegate = function(self, delegate)
	self.m_delegate = delegate;
end

CommonLogic.log = function(self, tag, ...)

end

CommonLogic.getLogFileName = function(self)
	
end 

CommonLogic.initSocketManager = function(self)
	self:log("CommonLogic.initSocketManager","Derived class must implement this function");
end 

CommonLogic.createSocketReader = function(self)
	self:log("CommonLogic.createSocketReader","Derived class must implement this function");
end

CommonLogic.createSocketWriter = function(self)
	self:log("CommonLogic.createSocketWriter","Derived class must implement this function");
end
-------------------------private----------------------------
CommonLogic.addSocketTools = function(self)
	self:initSocketManager();		
	self:createSocketReader();
	self:createSocketWriter();
end

CommonLogic.removeSocketTools = function(self)
    if self.m_socket then 
    	self.m_socket:removeSocketReader(self.m_socketReader);
    	self.m_socket:removeSocketWriter(self.m_socketWriter);
    end 

	delete(self.m_socketReader);
	self.m_socketReader = nil;
	delete(self.m_socketWriter);
	self.m_socketWriter = nil;	
end

CommonLogic.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

CommonLogic.execDelegate = function ( self,func,... )
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

CommonLogic.handleCmd = function(self, cmd, ...)
    if not self.s_cmdConfig[cmd] then
        FwLog("CommonLogic, no such cmd");
        return;
    end

    return self.s_cmdConfig[cmd](self,...)
end
