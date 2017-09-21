local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local login_regAccount_psdVerify_close = require("view/kScreen_1280_800/hall/login/login_regAccount_psdVerify_close");

--（注册）密码验证提示
local RegisterAccountVerifyCloseDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

RegisterAccountVerifyCloseDialog.s_controls = 
{
	closeBtn = getIndex();
	leftBtn = getIndex();
	rightBtn = getIndex();
	bg = getIndex();
	maskView = getIndex();
};

RegisterAccountVerifyCloseDialog.ctor = function(self,data)	
	super(self,login_regAccount_psdVerify_close);
	self.m_data = data;
	self.m_ctrls = RegisterAccountVerifyCloseDialog.s_controls;

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
end

RegisterAccountVerifyCloseDialog.dtor = function(self)	
	self.m_data = nil;
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
RegisterAccountVerifyCloseDialog.onCloseClick = function(self)
	Log.d("-------------RegisterAccountVerifyCloseDialog onCloseClick------------");
	RegisterAccountVerifyCloseDialog.hide();
end

RegisterAccountVerifyCloseDialog.onLeftClick = function(self)
	Log.d("-------------RegisterAccountVerifyCloseDialog onLeftClick A------------");
	RegisterAccountVerifyCloseDialog.hide();
	local RegisterAccountVerifyDialog = require("hall/login/widget/registerAccountVerifyDialog");
	RegisterAccountVerifyDialog.hide();
	
end

RegisterAccountVerifyCloseDialog.onRightClick = function(self)
	Log.d("-------------RegisterAccountVerifyCloseDialog onRightClick A------------");
	RegisterAccountVerifyCloseDialog.hide();
end

RegisterAccountVerifyCloseDialog.onBgClick = function(self)
end

RegisterAccountVerifyCloseDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end

---------------------------------------------------------------------------------
RegisterAccountVerifyCloseDialog.show = function(...)	
	
	RegisterAccountVerifyCloseDialog.hide(true);
	RegisterAccountVerifyCloseDialog.s_instance = new(RegisterAccountVerifyCloseDialog , ...);
	RegisterAccountVerifyCloseDialog.s_instance:addToRoot();
	RegisterAccountVerifyCloseDialog.s_instance:setFillParent(true,true);
	-- RegisterAccountVerifyCloseDialog.s_instance:setLevel(15);
	return RegisterAccountVerifyCloseDialog.s_instance;

end

RegisterAccountVerifyCloseDialog.hide = function()	
	delete(RegisterAccountVerifyCloseDialog.s_instance);
	RegisterAccountVerifyCloseDialog.s_instance = nil;
end

---------------------------------------------------------------------------------

RegisterAccountVerifyCloseDialog.s_controlConfig = 
{	
	[RegisterAccountVerifyCloseDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[RegisterAccountVerifyCloseDialog.s_controls.leftBtn] = {"contentView","bottomView","subView","tryAgainBtn"};
	[RegisterAccountVerifyCloseDialog.s_controls.rightBtn] = {"contentView","bottomView","subView","fillByHandBtn"};
	[RegisterAccountVerifyCloseDialog.s_controls.bg] = {"contentView","bg"};

	[RegisterAccountVerifyCloseDialog.s_controls.maskView] = {"shiled"};
};


RegisterAccountVerifyCloseDialog.s_controlFuncMap =
{
	[RegisterAccountVerifyCloseDialog.s_controls.closeBtn] = RegisterAccountVerifyCloseDialog.onCloseClick;
	[RegisterAccountVerifyCloseDialog.s_controls.leftBtn] = RegisterAccountVerifyCloseDialog.onLeftClick;
	[RegisterAccountVerifyCloseDialog.s_controls.rightBtn] = RegisterAccountVerifyCloseDialog.onRightClick;
	[RegisterAccountVerifyCloseDialog.s_controls.bg] = RegisterAccountVerifyCloseDialog.onBgClick;
	[RegisterAccountVerifyCloseDialog.s_controls.maskView] = RegisterAccountVerifyCloseDialog.onMaskTouch;
};

return RegisterAccountVerifyCloseDialog