
CommonRoomTimer = class();
--[[
	游戏中统一用的倒计时....
]]
CommonRoomTimer.ctor = function(self)
end

CommonRoomTimer.dtor = function(self)
	self.m_callBacks = {};
	delete(self.m_Timer);
	self.m_Timer = nil;
end

CommonRoomTimer.getInstance = function()
	if not CommonRoomTimer.s_instance then
		CommonRoomTimer.s_instance = new(CommonRoomTimer);
    end
    return CommonRoomTimer.s_instance;
end

CommonRoomTimer.releaseInstance = function()
	delete(CommonRoomTimer.s_instance);
	CommonRoomTimer.s_instance = nil;
end

CommonRoomTimer.onTimer = function(self)
	-- body
	if table.isEmpty(self.m_callBacks) then	
		if self.m_Timer then
			delete(self.m_Timer);
		end
		self.m_Timer = nil;
		return;
	end
	for k,v in pairs(self.m_callBacks) do
		if k and v then
			-- print("wanpg-----------------CommonRoomTimer.onTimer do func");
			v(k);
		end
	end
end

CommonRoomTimer.addCallBack = function(self, object, func)
	if table.isEmpty(self.m_callBacks) then
		self.m_callBacks = {};
	end
	self.m_callBacks[object] = func;
	if not self.m_Timer then
		self.m_Timer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1 ,1000, 0);
    	self.m_Timer:setDebugName("CommonRoomTimer");
    	self.m_Timer:setEvent(self,self.onTimer); 
	end
end

CommonRoomTimer.clean = function(self, object)
	if table.isEmpty(self.m_callBacks) then
		return;
	end
	if object then
		if self.m_callBacks[object] then
			self.m_callBacks[object] = nil;
		end
	else
		for k,v in pairs(self.m_callBacks) do
			if v then
				self.m_callBacks[k] = nil;
			end
		end
	end
end