require("core/object");
require("core/constants");
require("core/anim");

TimeOutTimer = class();

TimeOutTimer.ctor = function(self, obj, timeOutTime)
	-- body
	self.timerTable = {};
	self.obj = obj;
	self.timeOutTime = timeOutTime or 6 * 1000;
end

TimeOutTimer.startTimer = function(self, id, func, time)
	-- body
	if not id then 
		
		return;
	end 
	self:onTimeOut(id);
	local timeOutCount = new(TimeOutCount, id, self.obj, func, self, self.onTimeOut, time or self.timeOutTime);
	self.timerTable[id] = timeOutCount;
end

TimeOutTimer.clearTimer = function(self, id)
	-- body
	if id then
			delete(self.timerTable[id]);
			self.timerTable[id] = nil;
	else
		for k,v in pairs(self.timerTable) do
			if v then
				delete(v);
				v = nil;
			end
		end
		self.timerTable = {};
	end
end

TimeOutTimer.dtor = function(self)
	-- body
	self:clearTimer();
end

-------------------- private ---------------------------------

TimeOutTimer.onTimeOut = function(self, id)
	-- body
	if id then
		delete(self.timerTable[id]);
		self.timerTable[id] = nil;
	end	
end

----------------------------以下为计时器类----------------------------------------

TimeOutCount = class();

TimeOutCount.ctor = function(self, id, obj, funcObj, parentObj, funcParent, timeOutTime)
	-- body
	self.id = id;
	self.obj = obj;
	self.funcObj = funcObj;
	self.funcParent = funcParent;
	self.parentObj = parentObj;
	self:onStop();
	self.timeOut = AnimFactory.createAnimInt(kAnimNormal,0,1,timeOutTime,-1);
	self.timeOut:setDebugName("AnimInt|TimeOutCount|id"..(id or 0));
	self.timeOut:setEvent(self,self.onTimeOut);
end

TimeOutCount.onStop = function(self)
	delete(self.timeOut);
	self.timeOut = nil;
end

TimeOutCount.dtor = function(self)
	-- body
	-- self.id = nil;
	-- self.obj = nil;
	-- self.funcObj = nil;
	self:onStop();
end

TimeOutCount.onTimeOut = function(self)
	self:onStop();
	-- body
	if self.obj and self.funcObj then
		self.funcObj(self.obj, self.id);
	end
	if self.funcParent then
		self.funcParent(self.parentObj, self.id);
	end
end