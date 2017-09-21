require("gameData/gameData")

FlagCommonData = class(GameData)

FlagCommonData.Delegate = {

}

FlagCommonData.initData = function(self)

end

FlagCommonData.loadDictData = function(self, dict)
	local strData = dict:getString("info")
	self.m_info = json.decode(strData) or {}
end

FlagCommonData.saveDictData = function(self, dict)
	local strData = json.encode(self.m_info or {})
	dict:setString("info", strData)
end

FlagCommonData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId()
	return "FlagCommonData" .. self.m_userId
end

FlagCommonData.setShowQRTips = function(self, state)
    self.m_info.showQRTips = state
    self:saveData()
end

FlagCommonData.getShowQRTips = function(self)
    return self.m_info.showQRTips
end

FlagCommonData.clear = function(self)
	self.m_info = {}
end


FlagCommonData.s_socketCmdFuncMap = {

}