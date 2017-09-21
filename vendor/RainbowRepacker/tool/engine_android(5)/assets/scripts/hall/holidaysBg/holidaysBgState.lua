require("common/commonScene")
require("common/commonState")

require("hall/holidaysBg/holidaysBgController")
require("hall/holidaysBg/holidaysBgScene")
local splashScreen = require(ViewPath .. "hall/splashScreen/splashScreen")

HolidaysBgState = class(CommonState)

HolidaysBgState.ctor = function(self)
	self.m_controller = nil
end

HolidaysBgState.getController = function(self)
	return self.m_controller
end

HolidaysBgState.load = function(self)
    Slider.setDefaultImages(
		"hall/common/progress_bg_l15_r15_t15_b15.png",
		"hall/common/progress_fg_l15_r15_t15_b15.png",
		"hall/common/progress_btn.png");
	CommonState.load(self)
	self.m_controller = new(HolidaysBgController, self, HolidaysBgScene, splashScreen)
    Slider.setDefaultImages()
	return true
end

HolidaysBgState.unload = function(self)
	CommonState.unload(self)
	delete(self.m_controller)
	self.m_controller = nil
end

HolidaysBgState.onBack = function(self)
end

HolidaysBgState.dtor = function(self)
	
end
