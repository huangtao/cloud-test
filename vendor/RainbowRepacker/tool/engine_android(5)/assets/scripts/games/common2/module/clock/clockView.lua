
local viewBase = require("games/common2/module/viewBase");

local ClockView = class(viewBase, false);

ClockView.s_controls ={
	bg 						= ToolKit.getIndex();
	time 					= ToolKit.getIndex();
};
ClockView.shakeSecond = 5;
ClockView.alarmSecond = 3;
ClockView.ctor = function(self, seat, layout)
	super(self, layout);
	if self.m_root then
		local width, height = self.m_root:getSize();
		self:setSize(width,height);
	end
	self.m_seat = seat;
	self.m_step = 1000;
	self.m_tickTime = 0;
	self:setVisible(false);
	self:initView();
end

ClockView.initView = function(self)
	self.m_ctrl 		= ClockView.s_controls;
	self.m_bg 			= self:findViewById(self.m_ctrl.bg);
	self.m_time 		= self:findViewById(self.m_ctrl.time);
end

ClockView.setTime = function(self, time)
	self.m_tickTime = time;
end

ClockView.parseConfig = function(self, config)
    self:setPos(config.x,config.y);
    self:setAlign(config.align);
end


ClockView.stop = function(self)
	self:stopTimer();
	self:setVisible(false);
end

--显示闹钟,tickTime:闹钟时长
--最后shakeTime秒开始震动
-- ClockView.show = function(self, tickTime, shakeTime, func, args)
ClockView.show = function(self,seat,uid,info,isFast)
	local leftTime = GameRoomData.getInstance():getOutCardTime();
	if seat == 1 then
		leftTime = GameRoomData.getInstance():getSelfOutCardTime();
	end
	self.m_tickTime = info.leftTime or leftTime;
	self.m_shakeTime = self:checkShakeTime(ClockView.shakeSecond);
	self.m_isShake = (info.isShake == nil) or info.isShake;
	self.m_uid = uid;

	self.m_bg:setFile("games/common/room/clock_bg_poker.png");
	self:startTimer();
	self:update(self.m_tickTime);
	self:setVisible(true);
end

-- 检测震动时间
ClockView.checkShakeTime = function(self, shakeTime)
	if type(shakeTime)=="number" and shakeTime>0 then
		return shakeTime;
	end
	return ClockView.shakeSecond;
end

ClockView.startTimer = function(self)
	self:stopTimer();
	self.m_timer = new(AnimInt, kAnimRepeat, 0, 1, self.m_step, 0);
	self.m_timer:setDebugName("ClockView.startTimer");
	self.m_timer:setEvent(self, ClockView.onTimer);
end

ClockView.stopTimer = function(self)
	self:stopShakeAnim();
	delete(self.m_timer);
	self.m_timer = nil;
end

ClockView.onTimer = function(self, _, _, loops)
	self.m_tickTime = self.m_tickTime - 1;
	if self.m_tickTime > 0 then
		Log.d("ClockView.onTimer", "curSeconds:", self.m_tickTime, "loops:", loops);
		self:update(self.m_tickTime);
		if SettingIsolater.getInstance():getShake() then
			if self.m_tickTime <= self.m_shakeTime then
				if self.m_isShake and self.m_uid == UserBaseInfoIsolater.getInstance():getUserId() then 
					NativeEvent.getInstance():DeviceShake();
				end
			end
			if self.m_tickTime == ClockView.shakeSecond then 
				self:startShake();
			end

			if self.m_tickTime == ClockView.alarmSecond then 
				self:startAlarm();
			end
		end
	else
		self:stop();
	end
end

ClockView.shake = function(self, time)
	self.m_shakeTime = time;
	NativeEvent.getInstance():DeviceShake();
end

--virtual, overide me to update view
ClockView.update = function(self, tick)
	local timeStr = string.format("%02d",tick);
	self.m_time:setText(timeStr);
end

ClockView.dtor = function(self)
	self:stopTimer();
end

ClockView.startShake = function ( self )
	self:stopShakeAnim();
	self.curShakeCount = 0;
	self.m_shakeAnim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 300, -1);
	self.m_shakeAnim:setDebugName("ClockView|ClockView.shakeAnim");
	self.m_shakeAnim:setEvent(self, self.shakeTimer);
end

ClockView.startAlarm = function ( self )
	-- body
	self:stopShakeAnim();
	self.curShakeCount = self.curShakeCount or 0;
	self.m_shakeAnim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 300, -1);
	self.m_shakeAnim:setDebugName("ClockView|ClockView.shakeAnim");
	self.m_shakeAnim:setEvent(self, self.shakeTimer);
end

ClockView.stopShakeAnim = function ( self )
	-- body
	delete(self.m_shakeAnim);
	self.m_shakeAnim = nil;
end

ClockView.shakeTimer = function ( self )
	-- body
	self.curShakeCount = self.curShakeCount + 1;
	local file = "";
	if self.curShakeCount % 2 == 0 then
		if self.m_tickTime <= ClockView.alarmSecond then
			file = "games/common/room/clock_anim_3.png";
		else
			file = "games/common/room/clock_anim_1.png";
		end
	else
		file = "games/common/room/clock_anim_2.png";
	end
	self.m_bg:setFile(file);
end

ClockView.s_controlConfig ={
	[ClockView.s_controls.bg]			= {"bg"};
	[ClockView.s_controls.time]			= {"bg","time"};
};

function ClockView:monitoringAction(action,seat,uid,info,isFast)
	if action == GameMechineConfig.ACTION_NS_OPENCLOCK then
		Log.d("------------------------------------------------------------------------------------");
	end
    return self:notifyActionMap(action,seat,uid,info,isFast);
end

ClockView.s_actionFuncMap = { 
    [GameMechineConfig.ACTION_NS_OPENCLOCK]			= "show";
    [GameMechineConfig.ACTION_NS_CLOSECLOCK]		= "stop";   
};

return ClockView;