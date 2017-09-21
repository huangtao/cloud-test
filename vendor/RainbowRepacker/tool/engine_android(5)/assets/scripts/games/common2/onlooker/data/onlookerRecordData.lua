require("gameData/dictData");

OnlookerRecordData = class(DictData);

OnlookerRecordData.getInstance = function()
	if not OnlookerRecordData.s_instance then
		OnlookerRecordData.s_instance = new(OnlookerRecordData);
	end

	return OnlookerRecordData.s_instance;
end

OnlookerRecordData.releaseInstance = function()
    delete(OnlookerRecordData.s_instance);
    OnlookerRecordData.s_instance = nil;
end
----------------------------------------------------------------------------
OnlookerRecordData.isOpenBarrage = function(self)
	return self.m_isOpenBarrage;
end

OnlookerRecordData.changeBarrageSwitch = function(self,isOpen)
	self.m_isOpenBarrage = isOpen;

	self:saveData();
end

OnlookerRecordData.isHideNick = function(self)
	return self.m_isHideNick;
end

OnlookerRecordData.changeHideNickSwitch = function(self,isHideNick)
	self.m_isHideNick = isHideNick;

	self:saveData();
end
-----------------------------------------------------------------
OnlookerRecordData.loadDictData = function(self, dict)
	local switch_barrage = dict:getInt("switch_barrage",1); --1为打开，0为关闭
	local switch_hideNick = dict:getInt("switch_hideNick",0);--1为打开，0为关闭

	self.m_isOpenBarrage = switch_barrage == 1;
	self.m_isHideNick = switch_hideNick == 1;
end

--virtual
OnlookerRecordData.saveDictData = function(self, dict)	
	local switch_barrage = self.m_isOpenBarrage and 1 or 0;
	local switch_hideNick = self.m_isHideNick and 1 or 0;
	dict:setInt("switch_barrage",switch_barrage); 
	dict:setInt("switch_hideNick",switch_hideNick);	
end

OnlookerRecordData.getLocalDictName = function(self)
	return "OnlookerRecordData_"..UserBaseInfoIsolater.getInstance():getUserId();
end