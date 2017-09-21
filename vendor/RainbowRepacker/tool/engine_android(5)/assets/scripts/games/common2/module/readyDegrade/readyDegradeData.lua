require("gameData/dictData");

ReadyDegradeData = class(DictData);

ReadyDegradeData.isCloseReadyDegradeToday = function(self)
	return self.m_isCloseReadyDegradeToday;
end

ReadyDegradeData.setCloseReadyDegradeToday = function(self)
	self.m_isCloseReadyDegradeToday = true;

	self:saveData();
end

ReadyDegradeData.setIsDuringChangeDegrade = function(self,doing)
	self.m_isDuringChangeDegrade = doing;
	self:saveTmpData();
end

ReadyDegradeData.getIsDuringChangeDegrade = function(self)
	return self.m_isDuringChangeDegrade;
end

ReadyDegradeData.setReadyDegradeSavedMoney = function(self,money)
	self.m_degradeSavedMoney = number.valueOf(money);


	self:saveTmpData();
end

ReadyDegradeData.getReadyDegradeSavedMoney = function(self)
	return number.valueOf(self.m_degradeSavedMoney);
end 

ReadyDegradeData.saveTmpData = function(self)
	if self.m_isDuringChangeDegrade then
		GameInfoIsolater.getInstance():setReadyQuickMatingFailedInfo( {savedMoney = self.m_degradeSavedMoney} );
	else
		GameInfoIsolater.getInstance():setReadyQuickMatingFailedInfo();
	end
end
-----------------------------------------------------------------
ReadyDegradeData.loadDictData = function(self, dict)
	local switch = dict:getInt("switch",1); --1为打开，0为关闭
	local saveTime = dict:getInt("saveTime",0);--更新时间

	local saveDay = os.date("%Y-%m-%d",saveTime);
	local today = os.date("%Y-%m-%d",os.time());
	if saveDay ~= today then 
		self.m_isCloseReadyDegradeToday = false;
	else 
		self.m_isCloseReadyDegradeToday = switch == 0;
	end 
end

--virtual
ReadyDegradeData.saveDictData = function(self, dict)	
	local switch = self.m_isCloseReadyDegradeToday and 0 or 1;
	dict:setInt("saveTime",os.time()); 
	dict:setInt("switch",switch);	
end

ReadyDegradeData.getLocalDictName = function(self)
	return "readyDegradeData_"..UserBaseInfoIsolater.getInstance():getUserId();
end