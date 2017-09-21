local invitational_system_info = require(ViewPath .. "hall/invitational/invitational_system_info")
local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin")

--电池、时间
local InvitationalSystemInfo = class(CommonGameLayer, false)

InvitationalSystemInfo.ctor = function(self)
	super(self, invitational_system_info)
	self:declareLayoutVar(ViewPath.."hall/invitational/invitational_system_info".."_layout_var")
	self:setSize(self.m_root:getSize())
	self:_init()
end

InvitationalSystemInfo.dtor = function(self)
	self:_stopBatteryTimer()
	if self.m_timeHandle then
        self.m_timeHandle:cancel()
        self.m_timeHandle = nil
    end
end

InvitationalSystemInfo._init = function(self)
	self.m_battery = self:findViewById(self.s_controls.battery)
	self.m_timeText = self:findViewById(self.s_controls.time)
	self:_updateBattery()
	self:_showTime()
end

InvitationalSystemInfo._onUpdateTime = function (self)
	local hour = os.date("*t",os.time()).hour;
	local min = os.date("*t",os.time()).min;

	if self.m_timeText then
		self.m_timeText:setText(string.format("%02d:%02d", hour, min));
	end
end

InvitationalSystemInfo._showTime = function(self)
    local function updateTime()
        local timeText = os.date("%H:%M", GameInfoIsolater.getInstance():getRightTimeWithServer())
        self.m_timeText:setText(timeText)
    end

    updateTime()
    if not self.m_timeHandle then
        self.m_timeHandle = Clock.instance():schedule(function()
            updateTime()
        end, 30)
    end
end

InvitationalSystemInfo._updateBattery = function(self)
	if System.getPlatform()==kPlatformIOS then
		self:_startBatteryTimer()
	end
	NativeEvent.getInstance():getBatteryLevel()
end

InvitationalSystemInfo._startBatteryTimer = function(self)
	self:_stopBatteryTimer()
	self.m_batteryAnim = new(AnimInt, kAnimRepeat, 0, 1, 60000, -1)
	self.m_batteryAnim:setDebugName("InvitationalSystemInfo.startBatteryTimer")
	self.m_batteryAnim:setEvent(nil, function()
		NativeEvent.getInstance():getBatteryLevel()
	end)
end

InvitationalSystemInfo._stopBatteryTimer = function(self)
	delete(self.m_batteryAnim)
	self.m_batteryAnim = nil
end

InvitationalSystemInfo.updateBatteryLevel = function(self, level)
	local level = number.valueOf(level) or 100
	local index = 4
	if level <= 20 then
		index = 0
	elseif level <= 40 then
		index = 1
	elseif level <= 60 then
		index = 2
	elseif level <= 80 then
		index = 3
	end
	local file = invitational_pin_map[string.format("battery_%d.png", index)]
	if self.m_battery then
		self.m_battery:setFile(file)
	end
end

return InvitationalSystemInfo