local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local login_regSuccessed = require("view/kScreen_1280_800/hall/login/login_regSuccessed");

--绑定成功
local RegisterSuccessedDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
RegisterSuccessedDialog.s_controls = 
{
	closeBtn = getIndex();
	confirmBtn = getIndex();
	bg = getIndex();
	maskView = getIndex();
};

RegisterSuccessedDialog.ctor = function(self)	
	super(self,login_regSuccessed);
	self.m_ctrls = RegisterSuccessedDialog.s_controls;
end

RegisterSuccessedDialog.dtor = function(self)	
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
RegisterSuccessedDialog.onCloseClick = function(self)
	RegisterSuccessedDialog.hide();
	
	NativeEvent.getInstance():HideLoadingDialog();
	NativeEvent.getInstance():ShowLoadingDialog("登录中");

	LoginLogic.getInstance():requestAutoLogin();
end

RegisterSuccessedDialog.onConfirmClick = function(self)	 
	self:onCloseClick();
end

RegisterSuccessedDialog.onBgClick = function(self)
end

RegisterSuccessedDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end
----------------------------------全     局-----------------------------------------------
RegisterSuccessedDialog.show = function( ... )		
	RegisterSuccessedDialog.hide(true);
	RegisterSuccessedDialog.s_instance = new(RegisterSuccessedDialog , ... );
	RegisterSuccessedDialog.s_instance:addToRoot();
	RegisterSuccessedDialog.s_instance:setFillParent(true,true);
	return RegisterSuccessedDialog.s_instance;
end

RegisterSuccessedDialog.hide = function()	
	delete(RegisterSuccessedDialog.s_instance);
	RegisterSuccessedDialog.s_instance = nil;
end

RegisterSuccessedDialog.s_controlConfig = 
{	
	[RegisterSuccessedDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[RegisterSuccessedDialog.s_controls.confirmBtn] = {"contentView","confirmBtn"};
	[RegisterSuccessedDialog.s_controls.bg] = {"contentView","bg"};
	[RegisterSuccessedDialog.s_controls.maskView] = {"shiled"};	
};


RegisterSuccessedDialog.s_controlFuncMap =
{
	[RegisterSuccessedDialog.s_controls.closeBtn] = RegisterSuccessedDialog.onCloseClick;
	[RegisterSuccessedDialog.s_controls.confirmBtn] = RegisterSuccessedDialog.onConfirmClick;
	[RegisterSuccessedDialog.s_controls.bg] = RegisterSuccessedDialog.onBgClick;
	[RegisterSuccessedDialog.s_controls.maskView] = RegisterSuccessedDialog.onMaskTouch;
};

return RegisterSuccessedDialog