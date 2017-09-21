require("common/commonScene")
local SafeBoxScene = require("hall/safeBox/safeBoxScene")
require("hall/safeBox/safeBoxController")
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");

local safeBox = require(SafeBoxViewPath.."safeBox")

SafeBoxState = class(CommonState)

SafeBoxState.ctor = function(self, ...)
	self.m_controller = nil;
	self.m_args = {...};
end

SafeBoxState.getController = function(self)
	return self.m_controller;
end

SafeBoxState.load = function(self)
    Slider.setDefaultImages(
		"hall/common/progress_bg_l15_r15_t15_b15.png",
		"hall/common/progress_fg_l15_r15_t15_b15.png",
		"hall/common/progress_btn.png");
	CommonState.load(self);
	RadioButton.setDefaultImages({userInfo_pin_map["select.png"], userInfo_pin_map["selected.png"]});
	self.m_controller = new(SafeBoxController,self,SafeBoxScene,safeBox,unpack(self.m_args));
    Slider.setDefaultImages();
    RadioButton.setDefaultImages();
	return true;
end

SafeBoxState.resume = function(self)
	CommonState.resume(self);
end

SafeBoxState.pause =function(self)	
	CommonState.pause(self);
end

SafeBoxState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

SafeBoxState.dtor = function(self)
	
end
