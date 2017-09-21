local login_warningAccountLogin = require("view/kScreen_1280_800/hall/login/login_warningAccountLogin");
require("util/StringLib");
local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");

--登陆提示
local WarningLoginDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
WarningLoginDialog.s_controls = 
{
	closeBtn = getIndex();
	continueSwitchBtn = getIndex();
	upgradeAccountBtn = getIndex();
};

WarningLoginDialog.ctor = function(self)	
	super(self, login_warningAccountLogin);
	self:setEventTouch(self,function ()end);
    self:setEventDrag(self,function ()end);
	self.m_ctrls = WarningLoginDialog.s_controls;
end

WarningLoginDialog.dtor = function(self)	
	
end

WarningLoginDialog.onCloseClick = function (self)
    WarningLoginDialog.hide();
end

WarningLoginDialog.onContinueSwitchClick = function (self)
	local OldAccountLoginDialog = require("hall/login/widget/oldAccountLoginDialog");
    OldAccountLoginDialog.show();
    WarningLoginDialog.hide();
end

WarningLoginDialog.onUpgradeAccountClick = function (self)
    WarningLoginDialog.hide();
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
    RegisterAccountDialog.show();
end

----------------------------------全     局-----------------------------------------------

WarningLoginDialog.show = function()	
	
	WarningLoginDialog.hide(true);
	WarningLoginDialog.s_instance = new(WarningLoginDialog);
	WarningLoginDialog.s_instance:addToRoot();
	WarningLoginDialog.s_instance:setFillParent(true,true);
	return WarningLoginDialog.s_instance;
end

WarningLoginDialog.hide = function()	
	delete(WarningLoginDialog.s_instance);
	WarningLoginDialog.s_instance = nil;
end


WarningLoginDialog.s_controlConfig = 
{	
	[WarningLoginDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
    [WarningLoginDialog.s_controls.continueSwitchBtn] = {"contentView","bottomView","continueSwitchBtn"};
	[WarningLoginDialog.s_controls.upgradeAccountBtn] = {"contentView","bottomView","upgradeAccountBtn"}
};

WarningLoginDialog.s_controlFuncMap =
{
	[WarningLoginDialog.s_controls.closeBtn] = WarningLoginDialog.onCloseClick;
	[WarningLoginDialog.s_controls.continueSwitchBtn] = WarningLoginDialog.onContinueSwitchClick;
    [WarningLoginDialog.s_controls.upgradeAccountBtn] = WarningLoginDialog.onUpgradeAccountClick;
};

return WarningLoginDialog