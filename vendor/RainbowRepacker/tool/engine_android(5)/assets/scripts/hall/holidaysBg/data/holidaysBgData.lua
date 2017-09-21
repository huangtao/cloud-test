require("gameData/gameData")

HolidaysBgData = class(GameData)

HolidaysBgData.Delegate = {
	refreshHolidaysBg = "refreshHolidaysBg",
	clearSplashScreen = "clearSplashScreen",
	clearBackground = "clearBackground",
}

HolidaysBgData.initData = function(self)

end

HolidaysBgData.loadDictData = function(self, dict)
	local strData = dict:getString("info")
	self.m_info = json.decode(strData)
end

HolidaysBgData.saveDictData = function(self, dict)
	local strData = json.encode(self.m_info or {})
	dict:setString("info", strData)
end

HolidaysBgData.getLocalDictName = function(self)
	return "HolidaysBgData"
end

HolidaysBgData.getStartTime = function(self)
    return self.m_info and self.m_info.stime
end

HolidaysBgData.getEndTime = function(self)
    return self.m_info and self.m_info.etime
end

HolidaysBgData.getSplashUrl = function(self)
    return self.m_info and self.m_info.splashScreen
end

HolidaysBgData.getBgUrl = function(self)
    return self.m_info and self.m_info.background
end

HolidaysBgData.getSerVer = function(self)
    return self.m_info and self.m_info.ser_ver or -1
end

HolidaysBgData.updateMemData = function(self, serverVersion, info)
	if type(info) ~= "table" then
		return
	end	
	self.m_info = info
end

HolidaysBgData.clear = function(self)
	self.m_info = {}
end

HolidaysBgData.requestHolidaysBg = function(self)
	local param = {
		cli_ver = self:getSerVer(),
		appid = kClientInfo:getAppId(),
	}
	OnlineSocketManager.getInstance():sendMsg(PHP_HOLIDAYS_BG, param)
end

HolidaysBgData.onHolidaysBg = function(self, isSuccess, info)
	if isSuccess and info and info.ser_ver then
		if not info.splashScreen or info.splashScreen == "" then
			self:execDelegate(HolidaysBgData.Delegate.clearSplashScreen)
		end
		if not info.background or info.background == "" then
			self:execDelegate(HolidaysBgData.Delegate.clearBackground)
		end 
		self:updateDataByCompareVersion(info.ser_ver, nil, info)
		self:execDelegate(HolidaysBgData.Delegate.refreshHolidaysBg, self.m_info)
	end 
end

HolidaysBgData.s_socketCmdFuncMap = {
	[PHP_HOLIDAYS_BG] 		        = HolidaysBgData.onHolidaysBg
}