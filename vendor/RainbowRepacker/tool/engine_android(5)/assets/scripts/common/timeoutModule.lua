require("util/log");
require("common/animFactory");

TimeoutModule = class();

TimeoutModule.s_defDuration = 10000;
TimeoutModule.getInstance = function()
	if not TimeoutModule.s_instance then
		TimeoutModule.s_instance = new(TimeoutModule);
	end
	return TimeoutModule.s_instance;
end

TimeoutModule.ctor = function(self)
	self.m_userKey = 0;
	self.m_timeoutTab = {};
end

TimeoutModule.add = function(self , id , obj , callBack , duration , tips , ...)
	Log.i("**************设定超时  id:" , id);
	if not id then
	 	return; 
	end
	duration = duration or TimeoutModule.s_defDuration;
	self:onStop(id , true);
	local timeout = AnimFactory.createAnimInt(kAnimNormal,0,1,duration,-1);
	timeout:setDebugName("TimeoutModule.add timeout|id:"..(id or -1));
	timeout:setEvent({obj = self ,id = id},self.onTimer);
	self.m_timeoutTab[id] = {
	   ["timeout"] = timeout;
	   ["obj"] = obj;
	   ["callBack"] = callBack;
	   ["duration"] = duration;
	   ["tips"] = tips;
	}
end

TimeoutModule.remove = function(self , id)
    
	return self:onStop(id , true);
	
end

TimeoutModule.onTimer = function(self)
	self.obj:onStop(self.id , false);
	
end

TimeoutModule.onStop = function(self , id , falg)
    Toast.getInstance():hidden();
	local arr = self.m_timeoutTab[id];
	if not arr then
		return false; 
	end
	local timeout = arr["timeout"];
	delete(timeout);
	timeout = nil;
	if not falg then
		local obj = arr["obj"];
		local callBack = arr["callBack"];
		local duration = arr["duration"];
		if obj and callBack then
			callBack(obj);
		end
		Log.i("**************设定超时 id:" , id , "  已经超时 时长为：" , duration);
	else
		Log.i("**************设定超时  id:" , id , " 未超时");
	end
	self.m_timeoutTab[id] = nil;
	
	return true;
end

TimeoutModule.removeAll = function(self)
	for k,v in pairs(self.m_timeoutTab) do
		self:onStop(k , true);
	end
	self.m_timeoutTab = {};
end

TimeoutModule.dtor = function(self)
	self:removeAll();
	self.m_userKey = 0;
end

TimeoutModule.getUserId = function(self)
	self.m_userKey = self.m_userKey + 1;
	return "timeout_" .. self.m_userKey;
end

kTimeoutModule = TimeoutModule.getInstance();