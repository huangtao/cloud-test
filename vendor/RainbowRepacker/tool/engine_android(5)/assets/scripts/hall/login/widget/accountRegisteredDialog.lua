local login_accountRegisted = require("view/kScreen_1280_800/hall/login/login_accountRegisted");
local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
require("core/eventDispatcher");

--账户已被注册
local AccountRegisteredDialog = class(BaseLoginDialog,false);


---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

AccountRegisteredDialog.s_controls = 
{
	closeBtn = getIndex();
	leftBtn = getIndex();
	rightBtn = getIndex();
	bg = getIndex();
	phoneNum = getIndex();
	maskView = getIndex();
};

AccountRegisteredDialog.ctor = function(self,data)	
	super(self,login_accountRegisted);
	self.m_data = data;
	self.m_ctrls = AccountRegisteredDialog.s_controls;
	self:_init();
end

AccountRegisteredDialog.dtor = function(self)	
	self.m_data = nil;
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
AccountRegisteredDialog.onCloseClick = function(self)
	Log.d("-------------AccountRegisteredDialog onCloseClick------------");
	AccountRegisteredDialog.hide();
end

--点击直接登录
AccountRegisteredDialog.onLeftClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoDirectLogin);
	Log.d("-------------AccountRegisteredDialog onLeftClick A------------");
	local PhoneAccountLoginDialog = require("hall/login/widget/phoneAccountLoginDialog")
	PhoneAccountLoginDialog.show(self.m_data);
	AccountRegisteredDialog.hide();
end

--点击新手机注册
AccountRegisteredDialog.onRightClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoNewPhoneRegister);
	Log.d("-------------AccountRegisteredDialog onRightClick A------------");
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	RegisterAccountDialog.show();
	AccountRegisteredDialog.hide();
end

AccountRegisteredDialog.onBgClick = function(self)
end

AccountRegisteredDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end

----------------------------------全     局-----------------------------------------------
AccountRegisteredDialog.show = function(data)		
	AccountRegisteredDialog.hide(true);
	AccountRegisteredDialog.s_instance = new(AccountRegisteredDialog , data);
	AccountRegisteredDialog.s_instance:addToRoot();
	AccountRegisteredDialog.s_instance:setFillParent(true,true);
	return AccountRegisteredDialog.s_instance;
end

AccountRegisteredDialog.hide = function()	
	delete(AccountRegisteredDialog.s_instance);
	AccountRegisteredDialog.s_instance = nil;
end

----------------------------------------------------------------------------------------------
AccountRegisteredDialog._init = function(self)
	self:findViewById(self.m_ctrls.phoneNum):setText(self.m_data);

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
end

AccountRegisteredDialog.s_controlConfig = 
{	
	[AccountRegisteredDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[AccountRegisteredDialog.s_controls.leftBtn] = {"contentView","bottomView","subView","directLoginBtn"};
	[AccountRegisteredDialog.s_controls.rightBtn] = {"contentView","bottomView","subView","newPhoneRegisterBtn"};
	[AccountRegisteredDialog.s_controls.bg] = {"contentView","bg"};
	[AccountRegisteredDialog.s_controls.phoneNum] = {"contentView","centerView","subView","phoneNum"};
	[AccountRegisteredDialog.s_controls.maskView] = {"shiled"};
};


AccountRegisteredDialog.s_controlFuncMap =
{
	[AccountRegisteredDialog.s_controls.closeBtn] = AccountRegisteredDialog.onCloseClick;
	[AccountRegisteredDialog.s_controls.leftBtn] = AccountRegisteredDialog.onLeftClick;
	[AccountRegisteredDialog.s_controls.rightBtn] = AccountRegisteredDialog.onRightClick;
	[AccountRegisteredDialog.s_controls.bg] = AccountRegisteredDialog.onBgClick;
	[AccountRegisteredDialog.s_controls.maskView] = AccountRegisteredDialog.onMaskTouch;
};

return AccountRegisteredDialog