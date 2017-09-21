local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local login_autoVerifyFailed = require("view/kScreen_1280_800/hall/login/login_autoVerifyFailed");

--手机号自动验证未成功
local AutoVerifyFailedDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

AutoVerifyFailedDialog.s_controls = 
{
	closeBtn = getIndex();
	leftBtn = getIndex();
	rightBtn = getIndex();
	bg = getIndex();
	maskView = getIndex();
};

---------------------------------------------------------------------
----------------- 构造函数 -------------------------------------
---------------------------------------------------------------------
AutoVerifyFailedDialog.ctor = function(self,data,leftObj,leftFunc)	
	super(self,login_autoVerifyFailed);
	self.m_data = data;
	self.m_leftObj = leftObj;
	self.m_leftFunc = leftFunc;
	self.m_ctrls = AutoVerifyFailedDialog.s_controls;

	self:_init();
end

AutoVerifyFailedDialog.dtor = function(self)	
	self.m_data = nil;
	self.m_leftObj = nil;
	self.m_leftFunc = nil;
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
AutoVerifyFailedDialog.onCloseClick = function(self)
	Log.d("-------------AutoVerifyFailedDialog onCloseClick------------");
	AutoVerifyFailedDialog.hide();
end

AutoVerifyFailedDialog.onLeftClick = function(self)
	Log.d("-------------AutoVerifyFailedDialog onLeftClick A------------");
	AutoVerifyFailedDialog.hide();
	RegisterLogic.getInstance():startAutoRegister();
end

AutoVerifyFailedDialog.onRightClick = function(self)
	Log.d("-------------AutoVerifyFailedDialog onRightClick A------------");
	AutoVerifyFailedDialog.hide();
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	RegisterAccountDialog.show();
end

AutoVerifyFailedDialog.onBgClick = function(self)	
end

AutoVerifyFailedDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end
---------------------------------------------------------------------------------
AutoVerifyFailedDialog.show = function(...)	
	
	AutoVerifyFailedDialog.hide(true);
	AutoVerifyFailedDialog.s_instance = new(AutoVerifyFailedDialog , ...);
	AutoVerifyFailedDialog.s_instance:addToRoot();
	AutoVerifyFailedDialog.s_instance:setFillParent(true,true);
	return AutoVerifyFailedDialog.s_instance;
end

AutoVerifyFailedDialog.hide = function()	
	delete(AutoVerifyFailedDialog.s_instance);
	AutoVerifyFailedDialog.s_instance = nil;
end

---------------------------------------------------------------------
AutoVerifyFailedDialog._init = function(self)		
	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
end

AutoVerifyFailedDialog.s_controlConfig = 
{	
	[AutoVerifyFailedDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[AutoVerifyFailedDialog.s_controls.leftBtn] = {"contentView","bottomView","subView","tryAgainBtn"};
	[AutoVerifyFailedDialog.s_controls.rightBtn] = {"contentView","bottomView","subView","fillByHandBtn"};
	[AutoVerifyFailedDialog.s_controls.bg] = {"contentView","bg"};
	[AutoVerifyFailedDialog.s_controls.maskView] = {"shiled"};
};


AutoVerifyFailedDialog.s_controlFuncMap =
{
	[AutoVerifyFailedDialog.s_controls.closeBtn] = AutoVerifyFailedDialog.onCloseClick;
	[AutoVerifyFailedDialog.s_controls.leftBtn] = AutoVerifyFailedDialog.onLeftClick;
	[AutoVerifyFailedDialog.s_controls.rightBtn] = AutoVerifyFailedDialog.onRightClick;
	[AutoVerifyFailedDialog.s_controls.bg] = AutoVerifyFailedDialog.onBgClick;
	[AutoVerifyFailedDialog.s_controls.maskView] = AutoVerifyFailedDialog.onMaskTouch;
};

return AutoVerifyFailedDialog