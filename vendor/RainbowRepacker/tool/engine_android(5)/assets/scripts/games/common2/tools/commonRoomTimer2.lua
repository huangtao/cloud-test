
CommonRoomTimer2 = class();
--[[
	游戏中统一用的倒计时....
]]
CommonRoomTimer2.ctor = function(self)
end

CommonRoomTimer2.dtor = function(self)
	self:clean();
	self.m_callBacks = {};
	delete(self.m_Timer);
	self.m_Timer = nil;
end

CommonRoomTimer2.getInstance = function()
	if not CommonRoomTimer2.s_instance then
        CommonRoomTimer2.s_instance = new(CommonRoomTimer2);
    end
    return CommonRoomTimer2.s_instance;
end

CommonRoomTimer2.releaseInstance = function()
	delete(CommonRoomTimer2.s_instance);
	CommonRoomTimer2.s_instance = nil;
end

CommonRoomTimer2.onTimer = function(self)
	if table.isEmpty(self.m_callBacks) then	
		if self.m_Timer then
			delete(self.m_Timer);
		end
		self.m_Timer = nil;
		return;
	end
	for k,v in pairs(self.m_callBacks) do
		if k and v then
			v(k);
		end
	end
end

CommonRoomTimer2.addCallBack = function(self, object, func)
	if table.isEmpty(self.m_callBacks) then
		self.m_callBacks = {};
	end
	self.m_callBacks[object] = func;
	if not self.m_Timer then
		self.m_Timer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1 ,1000, 0);
    	self.m_Timer:setDebugName("CommonRoomTimer2|timer");
    	self.m_Timer:setEvent(self,self.onTimer); 
	end
end

CommonRoomTimer2.clean = function(self, object)

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