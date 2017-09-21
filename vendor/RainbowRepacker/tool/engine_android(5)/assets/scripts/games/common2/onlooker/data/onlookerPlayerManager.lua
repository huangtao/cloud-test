--[[
	管理围观者的个人信息
]]
require("core/object");
OnlookerPlayerManager = class();


OnlookerPlayerManager.getInstance = function()
	if not OnlookerPlayerManager.s_instance then
		OnlookerPlayerManager.s_instance = new(OnlookerPlayerManager);
	end
	return OnlookerPlayerManager.s_instance;
end

OnlookerPlayerManager.releaseInstance = function()
	delete(OnlookerPlayerManager.s_instance);
	OnlookerPlayerManager.s_instance = nil;
end

OnlookerPlayerManager.ctor = function(self)
	self.m_onlookerInfo = {};
end

OnlookerPlayerManager.dtor = function(self)
	self:removeAllLooker();
end

-- 添加旁观者
OnlookerPlayerManager.addOnlooker = function(self, playerInfo)
	if playerInfo == nil then 
		return;
	end	
	local isExist = false;
	local mid = playerInfo:getMid();
	self.m_onlookerInfo = table.verify(self.m_onlookerInfo);
	for k,v in pairs(self.m_onlookerInfo) do 
		if v:getMid() == mid then 
			isExist = true;
		end 
	end 
	if not isExist then 
		table.insert(self.m_onlookerInfo, playerInfo);
	end 
end

-- 查找旁观者
OnlookerPlayerManager.getOnlookerByMid = function(self, mid)
	self.m_onlookerInfo = table.verify(self.m_onlookerInfo);
	for k,v in pairs(self.m_onlookerInfo) do 
		if v:getMid() == mid then 
			return Copy(v);
		end 
	end 
	return nil;
end

--移除旁观者
OnlookerPlayerManager.removeOnlooker = function(self, mid)
	self.m_onlookerInfo = table.verify(self.m_onlookerInfo);
	local key;
	for k,v in pairs(self.m_onlookerInfo) do 
		if v:getMid() == mid then 
			key = k;
			break;
		end 
	end
	if key then 
		local user = table.remove(self.m_onlookerInfo,key);
		delete(user);
	end 
end

OnlookerPlayerManager.getAllOnlooker = function(self)
	return Copy(self.m_onlookerInfo or {});
end

OnlookerPlayerManager.removeAllOnlooker = function(self)
	self.m_onlookerInfo = table.verify(self.m_onlookerInfo);
	for k,v in pairs(self.m_onlookerInfo) do 
		delete(v);
	end 
	self.m_onlookerInfo = {};
end