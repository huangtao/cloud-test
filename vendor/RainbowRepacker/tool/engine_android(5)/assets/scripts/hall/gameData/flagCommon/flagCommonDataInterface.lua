require("gameData/dataInterfaceBase")
require("hall/gameData/flagCommon/flagCommonData")

FlagCommonDataInterface = class(DataInterfaceBase)

FlagCommonDataInterface.Delegate = {

}

FlagCommonDataInterface.getInstance = function()
	if not FlagCommonDataInterface.s_instance then
		FlagCommonDataInterface.s_instance = new(FlagCommonDataInterface)
	end
	return FlagCommonDataInterface.s_instance
end

FlagCommonDataInterface.ctor = function(self)
	self.m_data = new(FlagCommonData, self)
end

FlagCommonDataInterface.dtor = function(self)
	delete(self.m_data)
	self.m_data = nil
end

FlagCommonDataInterface.setShowQRTips = function(self, state)
    self.m_data:setShowQRTips(state)
end

FlagCommonDataInterface.getShowQRTips = function(self, state)
    return self.m_data:getShowQRTips()
end

FlagCommonDataInterface.s_socketCmdFuncMap = {

}