require("gameData/gameData");

local UserCacheInfo = class(GameData);

UserCacheInfo.getInstance = function()
	if not UserCacheInfo.s_instance then
		UserCacheInfo.s_instance = new(UserCacheInfo);
	end

	return UserCacheInfo.s_instance;
end

UserCacheInfo.releaseInstance = function()
    delete(UserCacheInfo.s_instance);
    UserCacheInfo.s_instance = nil;
end
---------------------------------------------------------------
UserCacheInfo.initData = function(self)
	self.m_cacheInfo = {};
end

UserCacheInfo.loadDictData = function(self, dict)
	local info = dict:getString("info");
	self.m_cacheInfo = table.verify(json.decode(info));
end

UserCacheInfo.saveDictData = function(self, dict)
	dict:setString("info",json.encode(self.m_cacheInfo));
end

UserCacheInfo.getLocalDictName = function(self)
	return "userCacheInfo";
end

UserCacheInfo.cleanup = function(self)
	self:initData();
end
-------------------------------------------------
--姓名
UserCacheInfo.setName = function(self, name)
	self.m_cacheInfo.nick = name;
	self:saveData();
end
UserCacheInfo.getName = function(self)
   local nick = self.m_cacheInfo.nick or "";
   return nick ~= "" and nick or nil;
end

--性别
UserCacheInfo.setSex = function(self,sex)
	self.m_cacheInfo.sex = sex;
	self:saveData();
end
UserCacheInfo.getSex = function(self)
	local sex = self.m_cacheInfo.sex or -1;
	return sex ~= -1 and sex or nil;
end

--城市
UserCacheInfo.setCity = function(self,city)
	self.m_cacheInfo.city = city;
	self:saveData();
end
UserCacheInfo.getCity = function(self)
	local city = self.m_cacheInfo.city or "";
	return city ~= "" and city or nil;
end

UserCacheInfo.isChanged = function(self)
	local nick = self:getName();
	local sex = self:getSex();
	local city = self:getCity();
	if nick or sex or city then		
		return true;
	else 
		return false;
	end 
end

return UserCacheInfo;
