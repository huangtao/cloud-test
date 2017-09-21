local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
require("util/StringLib");
local login_findPsd = require("view/kScreen_1280_800/hall/login/login_findPsd");

--找回密码
local FindPsdDialog = class(BaseLoginDialog,false);

---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
FindPsdDialog.s_controls = 
{
	closeBtn = getIndex();
	confirmBtn = getIndex();
	bg = getIndex();
	
	phoneEditText = getIndex();
	warningIcon = getIndex();
	errorMsg = getIndex();

	guestLogin = getIndex();
	maskView = getIndex();
};

---------------------------------------------------------------------
----------------- 构造函数 -------------------------------------
---------------------------------------------------------------------
FindPsdDialog.ctor = function(self,data)	
	super(self,login_findPsd);
	self.m_data = data;
	self.m_ctrls = FindPsdDialog.s_controls;
	self:_init();

	LoginLogic.getInstance():setObserver(self);
end

FindPsdDialog.dtor = function(self,viewConfig)	
	self.m_data = nil;
	LoginLogic.getInstance():clearObserver(self);
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------

FindPsdDialog.onCloseClick = function(self)
	Log.d("-------------FindPsdDialog onCloseClick------------");
	FindPsdDialog.hide();
end

FindPsdDialog.onConfirmClick = function(self)
	Log.d("-------------FindPsdDialog onConfirmClick A------------");

	local text = string.trim(self:findViewById(self.m_ctrls.phoneEditText):getText());
	local isNil = (text== nil or text == "");
	local isPhoneFormatError = not string.checkPhoneNumber(text);

	self:findViewById(self.m_ctrls.errorMsg):setVisible(isNil or isPhoneFormatError);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(isNil or isPhoneFormatError);

	if isNil then
		self:findViewById(self.m_ctrls.errorMsg):setText("请输入手机号");
		return;
	elseif isPhoneFormatError then
		self:findViewById(self.m_ctrls.errorMsg):setText("手机号码格式不正确");
		return ;
	end

	self.m_data = text;
	self:onOpenToast("正在验证手机号码");
	LoginLogic.getInstance():checkIsRegister(text);
end

FindPsdDialog.onGuestLoginClick = function(self)
	Log.d("-------------FindPsdDialog onGuestLoginClick------------");
	local OldAccountLoginDialog = require("hall/login/widget/oldAccountLoginDialog");
	OldAccountLoginDialog.show();
	FindPsdDialog.hide();
end

FindPsdDialog.onBgClick = function(self)
end

FindPsdDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end

---------------------------------------------------------------------------------------------------
FindPsdDialog._init = function(self)	
	self:findViewById(self.m_ctrls.phoneEditText):setHintText("您的手机号",220,180,140);
	self:findViewById(self.m_ctrls.phoneEditText):setInputMode(kEditBoxInputModePhoneNumber);
	self:findViewById(self.m_ctrls.phoneEditText):setBackgroundColor("#EEE4CA");
	self:findViewById(self.m_ctrls.phoneEditText):setMaxLength(20);
	self:findViewById(self.m_ctrls.errorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(false);

	if self.m_data and self.m_data ~= "" then
		self:findViewById(self.m_ctrls.phoneEditText):setText(self.m_data);
	end 

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
end

---------------------------------------------------------------------------------
FindPsdDialog.onCheckIsRegisterCallBack = function(self,isRegister)	
	if isRegister then
		LoginLogic.getInstance():requestVerifyCode(self.m_data);
	else 
		self:onCloseToast();
		local msg = "您的号码尚未注册";
		self:findViewById(self.m_ctrls.errorMsg):setText(msg);
		self:findViewById(self.m_ctrls.errorMsg):setVisible(true);
		self:findViewById(self.m_ctrls.warningIcon):setVisible(true);
	end 
end

FindPsdDialog.onGetVerifyCodeCallBack = function(self,isSuccess, info)
	self:onCloseToast();
	if isSuccess then
		local ResetPsdDialog = require("hall/login/widget/resetPsdDialog");
		ResetPsdDialog.show(self.m_data,info.errorType);
		FindPsdDialog.hide();
	else 
		local msg = info and info.errorTips or "验证码获取失败";
		self:findViewById(self.m_ctrls.errorMsg):setText(msg);
		self:findViewById(self.m_ctrls.errorMsg):setVisible(true);
		self:findViewById(self.m_ctrls.warningIcon):setVisible(true);
	end 
end

----------------------------------全     局-----------------------------------------------
FindPsdDialog.show = function(data)	
	
	FindPsdDialog.hide(true);
	FindPsdDialog.s_instance = new(FindPsdDialog , data);
	FindPsdDialog.s_instance:addToRoot();
	FindPsdDialog.s_instance:setFillParent(true,true);
	-- FindPsdDialog.s_instance:setLevel(15);
	return FindPsdDialog.s_instance;

end

FindPsdDialog.hide = function()	
	delete(FindPsdDialog.s_instance);
	FindPsdDialog.s_instance = nil;
end

---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------


FindPsdDialog.s_controlConfig = 
{	
	[FindPsdDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[FindPsdDialog.s_controls.confirmBtn] = {"contentView","centerView","subView","confirmBtn"};
	[FindPsdDialog.s_controls.bg] = {"contentView","bg"};
	
	[FindPsdDialog.s_controls.phoneEditText] = {"contentView","centerView","subView","inputBg","phoneEditText"};
	[FindPsdDialog.s_controls.warningIcon] = {"contentView","centerView","subView","inputBg","warningIcon"};
	[FindPsdDialog.s_controls.errorMsg] = {"contentView","centerView","subView","inputBg","errorMsg"};
	
	[FindPsdDialog.s_controls.guestLogin] = {"contentView","bottomView","loginarea"};
	[FindPsdDialog.s_controls.maskView] = {"shiled"};
};


FindPsdDialog.s_controlFuncMap =
{
	[FindPsdDialog.s_controls.closeBtn] = FindPsdDialog.onCloseClick;
	[FindPsdDialog.s_controls.confirmBtn] = FindPsdDialog.onConfirmClick;
	[FindPsdDialog.s_controls.bg] = FindPsdDialog.onBgClick;
	[FindPsdDialog.s_controls.guestLogin] = FindPsdDialog.onGuestLoginClick;
	[FindPsdDialog.s_controls.maskView] = FindPsdDialog.onMaskTouch;
};

return FindPsdDialog