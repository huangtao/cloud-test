
local layerBase = require("games/common2/module/layerBase");
require("games/common2/match/matchMechine/matchMechineConfig");

MatchLayerBase = class(layerBase);

MatchLayerBase.ctor = function(self)
	self:registerMatchNotify();
	self:reset();
	self:init();
end

MatchLayerBase.registerMatchNotify = function(self)
	EventDispatcher.getInstance():register(MatchMechineConfig.NOTIFY_STATUS,self,self.matchStateChange);
	EventDispatcher.getInstance():register(MatchMechineConfig.NOTIFY_ACTION,self,self.monitoringAction);
end

MatchLayerBase.unregisterMatchNotify = function(self)
	EventDispatcher.getInstance():unregister(MatchMechineConfig.NOTIFY_STATUS,self,self.matchStateChange);
	EventDispatcher.getInstance():unregister(MatchMechineConfig.NOTIFY_ACTION,self,self.monitoringAction);
end

MatchLayerBase.dtor = function(self)
	self:unregisterMatchNotify();
	self:reset();
	self:_stopDelayTimer();
end

MatchLayerBase.reset = function(self)
	self.m_curMatchState = MatchMechineConfig.STATUS_NONE;
	self.m_lastMatchState = MatchMechineConfig.STATUS_NONE;
end

MatchLayerBase.matchStateChange = function(self,curState,lastState,action,seat,uid,info,isFast)
	self.m_curMatchState = curState;
	self.m_lastMatchState = lastState;

	self:monitoringState(curState,lastState,action,seat,uid,info,isFast);
end

MatchLayerBase.showLayer = function(self)
	self:setVisible(true);
end

MatchLayerBase.closeLayer = function(self)
	self:setVisible(false);
end

MatchLayerBase.init = function(self)
end

MatchLayerBase._startDelayTimer = function(self,delay,callObj,callFunc,...)
	delay = number.valueOf(delay);

	self:_stopDelayTimer();

	if delay > 0 then 
		local arg = {};
		arg.self = self;
		arg.callObj = callObj;
		arg.callFunc = callFunc;
		arg.param = {...};

		self.m_delayTimer = AnimFactory.createAnimInt(kAnimNormal,0,1,delay,-1);
		self.m_delayTimer:setDebugName("AnimInt|MatchLayerBase|m_delayTimer");
		self.m_delayTimer:setEvent(arg,self._onDelayTimerOut);
	else 
		if callFunc then
			callFunc(callObj,...);
		end 
	end 
end

MatchLayerBase._onDelayTimerOut = function(arg)
	local self = arg.self;

	self:_stopDelayTimer();

	if arg.callFunc then 
		arg.callFunc(arg.callObj,unpack(arg.param));
	end 
end

MatchLayerBase._stopDelayTimer = function(self)
	delete(self.m_delayTimer);
	self.m_delayTimer = nil;
end