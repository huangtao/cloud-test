require("common/commonScene")

HolidaysBgScene = class(CommonScene)

HolidaysBgScene.s_defaultTime = 2000
HolidaysBgScene.s_defaultAegisTime = 8000

HolidaysBgScene.s_controls = 
{
	bg = 1,
}

HolidaysBgScene.s_cmds = {
	doInit = 1,
}

HolidaysBgScene.ctor = function(self,viewConfig,controller)
	self.is_init = false
	self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_bg = self:findViewById(HolidaysBgScene.s_controls.bg)
    HolidaysBgDataInterface.getInstance():showImg(HolidaysBgDataInterface.ImgType.SplashScreen, self.m_bg)
    self:startAegisTimer()
end

HolidaysBgScene.startTimer = function(self, time)
	self:stopTimer()
	self.m_timer = new(AnimDouble, kAnimNormal, 0, 1, time or HolidaysBgScene.s_defaultTime, -1)
	self.m_timer:setDebugName("AnimDouble|HolidaysBgScene.startTimer")
	self.m_timer:setEvent(self, HolidaysBgScene.onTimer)
end

HolidaysBgScene.onTimer = function(self)
    self:stopTimer()
    self:requestCtrlCmd(HolidaysBgController.s_cmds.goBack)
end

HolidaysBgScene.stopTimer = function(self)
	if self.m_timer then
		delete(self.m_timer)
	end
	self.m_timer = nil
end

HolidaysBgScene.startAegisTimer = function(self)
	self:stopAegisTimer()
	self.m_aegis_timer = new(AnimDouble, kAnimNormal, 0, 1, HolidaysBgScene.s_defaultAegisTime, -1)
	self.m_aegis_timer:setDebugName("AnimDouble|HolidaysBgScene.startAegisTimer")
	self.m_aegis_timer:setEvent(self, HolidaysBgScene.onAegisTimer)
end

HolidaysBgScene.onAegisTimer = function(self)
	self.is_init = true
	self:stopAegisTimer()
	self:requestCtrlCmd(HolidaysBgController.s_cmds.goBack)
end

HolidaysBgScene.stopAegisTimer = function(self)
	if self.m_aegis_timer then
		delete(self.m_aegis_timer)
	end
	self.m_aegis_timer = nil
end

HolidaysBgScene.dtor = function(self)	
	self:stopTimer()
	self:stopAegisTimer()
end

HolidaysBgScene.init = function(self)
	if self.is_init then
		return
	end
	self:stopAegisTimer()
	self.m_anim = self.m_bg:addPropTransparency(1, kAnimNormal, 600, 200, 0.5, 1)
	self.m_anim:setEvent(self, self.stopAnim)
    self:startTimer(HolidaysBgScene.s_defaultTime)
end

HolidaysBgScene.stopAnim = function (self)
	if not self.m_bg:checkAddProp(1) then 
		self.m_bg:removeProp(1)
	end
	self.m_anim = self.m_bg:addPropTransparency(1, kAnimNormal, 400, 800, 1, 0.8)
	self.m_anim:setEvent(nil, function ()
		if not self.m_bg:checkAddProp(1) then 
			self.m_bg:removeProp(1)
		end
	end)
end

HolidaysBgScene.s_controlConfig = 
{	
	[HolidaysBgScene.s_controls.bg] = {"bg"}
}

HolidaysBgScene.s_controlFuncMap =
{

}

HolidaysBgScene.s_cmdConfig = {
	[HolidaysBgScene.s_cmds.doInit] = HolidaysBgScene.init,
}