require("gameData/gameData");
require("core/dict");

-- 口令缓存,只缓存上次分享口令
local PasswordData = class(GameData);

PasswordData.Delegate = {
};

PasswordData.ctor = function(self)   
end

PasswordData.dtor = function(self)
end

PasswordData.initData = function(self)
    self.m_data = "";
end

PasswordData.setData = function(self, password)
	self.m_data = tostring(password) or "";
	self:saveData();
end

PasswordData.getData = function(self)
	return self.m_data;
end

----------------------------------------------------------------------------------
PasswordData.loadDictData = function(self, dict)
    self.m_data = dict:getString("password") or "";
end

PasswordData.saveDictData = function(self, dict)
    dict:setString("password", self.m_data);
end

PasswordData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "password_data_" .. self.m_userId;
end

PasswordData.s_socketCmdFuncMap = {
};

return PasswordData;
