
local viewBase = require("games/common2/module/viewBase");

local SystemInfoView = class(viewBase, false);

local l_index = 0;
local getIndex = function(...)
	l_index = l_index + 1;
	return l_index;
end
SystemInfoView.s_controls = {
	battery 	= getIndex();
	timeText 	= getIndex();
};

function SystemInfoView:ctor (seat, layoutConfig)
	super(self, layoutConfig);
	self:setSize(self.m_root:getSize());
	self.m_ctrl = SystemInfoView.s_controls;
	self:_init();
end

function SystemInfoView:dtor()
	CommonRoomTimer2.getInstance():clean(self);
	self:_stopBatteryTimer();
end
----------------------------------------------------------------------------------

function SystemInfoView:parseConfig(config)
    if not table.isEmpty(config) then
		self:setPos(config.x,config.y);
    	self:setAlign(config.align);
	    self:setVisible(config.isShow);
    end
end

function SystemInfoView:_initTimeView (seat, uid, info, isFast)
	self:parseConfig(info);
end

function SystemInfoView:_init()
	self.m_battery = self:findViewById(self.m_ctrl.battery);
	self.m_timeText = self:findViewById(self.m_ctrl.timeText);
	CommonRoomTimer2.getInstance():addCallBack(self, self._onUpdateTime);
	self:_startDelayTimer(1,self,self._updateBattery);
end

function SystemInfoView:_onUpdateTime()
	local hour = os.date("*t",os.time()).hour;
	local min = os.date("*t",os.time()).min;
	self.m_timeText:setText(string.format("%02d:%02d", hour, min));
end

function SystemInfoView:_updateBattery()
	if System.getPlatform()==kPlatformIOS then
		self:_startBatteryTimer()
	end
	NativeEvent.getInstance():getBatteryLevel()
end

function SystemInfoView:_startBatteryTimer()
	self:_stopBatteryTimer()
	self.m_batteryAnim = new(AnimInt, kAnimRepeat, 0, 1, 60000, -1)
	self.m_batteryAnim:setDebugName("SystemInfoView.startBatteryTimer")
	self.m_batteryAnim:setEvent(nil, function()
		NativeEvent.getInstance():getBatteryLevel()
	end)
end

function SystemInfoView:_stopBatteryTimer ()
	delete(self.m_batteryAnim)
	self.m_batteryAnim = nil
end

function SystemInfoView:onUpdateBatteryLevel(seat, uid, info, isFast)
	local level = number.valueOf(info) or 100;
	local index = math.ceil(level/20) - 1
	local file = string.format("games/common/menuToolbar/battery_%d.png", index);
	self.m_battery:setFile(file);
end

SystemInfoView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_GET_BATTERYLEVEL]		= "onUpdateBatteryLevel";
	[GameMechineConfig.ACTION_NS_INITTIMEVIEW]			= "_initTimeView";
};

SystemInfoView.s_controlConfig =
{
	[SystemInfoView.s_controls.battery]			= {"info_view","battery"};
	[SystemInfoView.s_controls.timeText]		= {"info_view","timeText"};
};

----------------------------------------------------------------------------------

return SystemInfoView;