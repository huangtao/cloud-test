require("gameData/gameData")

BindingGuidelinesDataInterface = class(DataInterfaceBase)

BindingGuidelinesDataInterface.Intervals = 60 * 60 * 24 * 3

BindingGuidelinesDataInterface.getInstance = function()
	if not BindingGuidelinesDataInterface.s_instance then
		BindingGuidelinesDataInterface.s_instance = new(BindingGuidelinesDataInterface)
	end
	return BindingGuidelinesDataInterface.s_instance
end

BindingGuidelinesDataInterface.ctor = function(self)

end

BindingGuidelinesDataInterface.dtor = function(self)
end

BindingGuidelinesDataInterface.initData = function(self)
	self.displayTime = nil
end

BindingGuidelinesDataInterface.loadDictData = function(self, dict)
	local data = dict:getString("displayTime")
	self.displayTime = data
end

BindingGuidelinesDataInterface.saveDictData = function(self, dict)
	dict:setString("displayTime", self.displayTime)
end

BindingGuidelinesDataInterface.getLocalDictName = function(self)
	self.m_userId = self.m_userId or kUserInfoData:getUserId()
	return "BindingGuidelinesData" .. self.m_userId
end

BindingGuidelinesDataInterface.getDisplayTime = function(self)
	return self.displayTime
end

BindingGuidelinesDataInterface.updateDisplayTime = function(self)
	self.displayTime = AppData.getInstance():getRightTimeWithServer();
	self:saveData()
end

BindingGuidelinesDataInterface.check = function(self)
	if LoginDataInterface.getInstance():getLastUType() ~= LoginConstants.uType.Guest then
		return false
	end
	local cur_time = AppData.getInstance():getRightTimeWithServer();
	if (cur_time - number.valueOf(self.displayTime)) > BindingGuidelinesDataInterface.Intervals then
		local totalMoney = kUserInfoData:getTotalMoney()
		local gold = kUserInfoData:getTotalCrystal();
		local status = kBankruptDataInterface:getBankruptStatus()
		if (totalMoney >= 50000 or gold >= 500) and status ~= BankruptStatus.Real then
			return true
		end
	end
	return false
end
