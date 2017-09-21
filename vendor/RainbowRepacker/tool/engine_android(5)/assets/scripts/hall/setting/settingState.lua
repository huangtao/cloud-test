require("common/commonScene")
require("hall/setting/settingController");
local setting = require(ViewPath .. "hall/setting/setting");
local setting_pin_map = require("qnFiles/qnPlist/hall/setting_pin");

SettingState = class(CommonState);

SettingState.ctor = function(self)
	self.m_controller = nil;
end

SettingState.getController = function(self)
	return self.m_controller;
end

SettingState.load = function(self)
	CommonState.load(self);
	Slider.setDefaultImages(
		"hall/common/progress_bg_l15_r15_t15_b15.png",
		"hall/common/progress_fg_l15_r15_t15_b15.png",
		"hall/common/progress_btn.png");
	Switch.setDefaultImages(
       setting_pin_map["switch_on_bg.png"],
       setting_pin_map["switch_off_bg.png"],
       setting_pin_map["switch_on.png"]
		);
	Switch.setEnableSlide(false)
    local SettingScene = require("hall/setting/settingScene");
	self.m_controller = new(SettingController, self, SettingScene, setting);
	Switch.setEnableSlide(true)
	Slider.setDefaultImages();
	Switch.setDefaultImages();
	return true;
end

SettingState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

SettingState.gobackLastState = function(self)
	if MessageBox.isShowing() then
		MessageBox.hide();
		return;
	end

	if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return;
	end
	
	if self.m_controller then 
		local isRefuse =  self.m_controller:checkIsRefuseBack();
		if isRefuse then 
			return;
		end 
	end 

	StateMachine.getInstance():popState();
end


SettingState.dtor = function(self)
	
end
