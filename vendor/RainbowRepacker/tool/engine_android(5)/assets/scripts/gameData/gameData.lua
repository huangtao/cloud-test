require("gameData/dictData");

GameData = class(DictData, false);

GameData.Delegate = {
	
}

GameData.ctor = function(self, dataInterface)
	self.m_dataInterface = dataInterface;
	super(self);
end

GameData.dtor = function(self)

end

GameData.ctorOperation = function(self)
	self.m_isTouched = false;
	self:initData();
	self:loadData();
end

GameData.dtorOperation = function(self)
	self:saveData();
end

GameData.initData = function(self)
	--init all variable
end

GameData.requestData = function(self, ...)

end

GameData.updateMemData = function(self , ...)
	
end

--@param serverVersion server版本号
--@param refreshFlag 刷新标志  如果为1，则需要刷新本地，优先级大于版本号
GameData.updateDataByCompareVersion = function(self, serverVersion, refreshFlag, ...)
	serverVersion = tonumber(serverVersion) or -1;
	refreshFlag = tonumber(refreshFlag) or 0;

	local hasUpdate = self:isHasUpdate(serverVersion, refreshFlag);
	self:updateData(hasUpdate, serverVersion, ...);
end

GameData.isHasUpdate = function(self, serverVersion, refreshFlag)
	local localVersion = self:getLocalVersion();
	if not localVersion then
		return true;
	end

	localVersion = tonumber(localVersion) or -2;
	return (serverVersion > localVersion) or (refreshFlag == 1);
end

GameData.updateData = function(self, hasUpdate,...)
	self.m_isTouched = true;

	if not hasUpdate then
		return;
	end

	self:updateMemData(...);
	self:saveData();
end

--获取字典名
GameData.getLocalDictName = function(self)
	return nil;
end

--获取本地数据版本号,一般为时间戳
GameData.getLocalVersion = function(self)
	return nil;
end

--获取字典关键字后缀
GameData.getDictKeyVersion = function(self)
	return "";
end

GameData.setDictBoolean = function(self, dict, key, value)
	key = key .. self:getDictKeyVersion();
	dict:setBoolean(key, value);
end

GameData.getDictBoolean = function(self, dict, key, defaultValue)
	key = key .. self:getDictKeyVersion();
	return dict:getBoolean(key, defaultValue);
end

GameData.setDictInt = function(self, dict, key, value)
	key = key .. self:getDictKeyVersion();
	dict:setInt(key, value);
end

GameData.getDictInt = function(self, dict, key, defaultValue)
	key = key .. self:getDictKeyVersion();
	return dict:getInt(key, defaultValue);
end

GameData.setDictDouble = function(self, dict, key, value)
	key = key .. self:getDictKeyVersion();
	dict:setDouble(key, value);
end

GameData.getDictDouble = function(self, dict, key, defaultValue)
	key = key .. self:getDictKeyVersion();
	return dict:getDouble(key, defaultValue);
end

GameData.setDictString = function(self, dict, key, value)
	key = key .. self:getDictKeyVersion();
	dict:setString(key, value);
end

GameData.getDictString = function(self, dict, key)
	key = key .. self:getDictKeyVersion();
	return dict:getString(key);
end

GameData.execDelegate = function(self,func,...)
    if self.m_dataInterface and self.m_dataInterface[func] then
        self.m_dataInterface[func](self.m_dataInterface,...);
    end
end