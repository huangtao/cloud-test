require("common/commonScene");
require("hall/userInfo/userInfoController");
local userInfo = require(ViewPath .. "hall/userInfo/userInfo");
local userInfo_pin_map = require("qnFiles/qnPlist/hall/userInfo_pin");
local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");

UserInfoState = class(CommonState);

UserInfoState.ctor = function(self)

end

UserInfoState.getController = function(self)
	return self.m_controller;
end

UserInfoState.load = function(self)
	CommonState.load(self);
	RadioButton.setDefaultImages({userInfo_pin_map["checkBox_uncheck.png"],userInfo_pin_map["checkBox_checked.png"]});

	Slider.setDefaultImages(
		"hall/common/progress_bg_l15_r15_t15_b15.png",
		"hall/common/progress_fg_l15_r15_t15_b15.png",
		"hall/common/bg_blank.png");
	local UserInfoScene = require("hall/userInfo/userInfoScene");
	self.m_controller = new(UserInfoController , self , UserInfoScene, userInfo);
	RadioButton.setDefaultImages();
	Slider.setDefaultImages();
	return true;
end

UserInfoState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

UserInfoState.dtor = function(self)
   
end

UserInfoState.gobackLastState = function(self)
	StateMachine.getInstance():popState();
end

UserInfoState.onBack = function(self)
	local isDone = IPopDialogManager.getInstance():onBackPressCall();
	if isDone then
		return;
	end
	
	if BaseLoginDialog.isDialogShowing() then
		BaseLoginDialog.hideTopDialog();
		return;
	end
	self:popState();
end