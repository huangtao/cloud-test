
--[[
	记录房间内通用信息
]]

GameCommonData = class(DataInterfaceBase);

GameCommonData.getInstance = function()
	if not GameCommonData.s_instance then
		GameCommonData.s_instance = new(GameCommonData);
	end

	return GameCommonData.s_instance;
end

GameCommonData.releaseInstance = function()
    delete(GameCommonData.s_instance);
    GameCommonData.s_instance = nil;
end


GameCommonData.ctor = function(self)
end

GameCommonData.dtor = function(self)
end

--@override
GameCommonData.getLocalDictName = function(self)
	return "GameCommonData";
end

--@override
GameCommonData.loadDictData = function(self, dict)
	self.m_hasShowqukuanTips = dict:getInt("hasShowqukuanTips",0);
end

--@override
GameCommonData.saveDictData = function(self, dict)
	dict:setInt("hasShowqukuanTips", self.m_hasShowqukuanTips);
end

-- 是否已经显示取款提示了
GameCommonData.getShowqukuanTips = function(self)
	return number.valueOf(self.m_hasShowqukuanTips);
end

GameCommonData.setShowqukuanTips = function(self,hasShowqukuanTips)
	self.m_hasShowqukuanTips = hasShowqukuanTips;
end