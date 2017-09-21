require("core/object");
require("common/animFactory");

Timer = class();

Timer.s_interval = 100;
Timer.s_index = 0;

Timer.ctor = function(self,timerName,duration,callbackObj,callbackFunc,...)	
	Timer.s_index = Timer.s_index + 1;

	self.m_timerName = timerName or ("timer_"..Timer.s_index);

	self.m_duration = tonumber(duration) or 0;
	self.m_callbackObj = callbackObj;
	self.m_callbackFunc = callbackFunc;
	self.m_callbackParams = {...};

	if self.m_duration > 0 then
		self:startTimer();
	else 
		self:stopTimer();

		if callbackFunc then 
			callbackFunc(callbackObj,...);
		end 
	end 
end 

Timer.dtor = function(self)
	self:stopTimer();
end 

Timer.startTimer = function(self)
	self:clearTimer();

	self.m_startTime = os.time();
	self.m_timer = AnimFactory.createAnimDouble(kAnimLoop,0,1,Timer.s_interval,0);
	self.m_timer:setDebugName("Timer|"..self.m_timerName);
	self.m_timer:setEvent(self,self.onTimerEvent);
end

Timer.onTimerEvent = function(self)
	local time = os.time() - self.m_startTime;
	if time >= self.m_duration then 
		local obj = self.m_callbackObj;
		local func = self.m_callbackFunc;
		local arg = self.m_callbackParams;

		self:stopTimer();

		if func then 
			func(obj,unpack(arg));
		end 
	end 
end

Timer.stopTimer = function(self)
	self:clearTimer();
	self.m_duration = 0;
	self.m_callbackObj = nil;
	self.m_callbackFunc = nil;
	self.m_callbackParams = {};
end

Timer.clearTimer = function(self)	
	self.m_startTime = 0;

	delete(self.m_timer);
	self.m_timer = nil;
end