local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
require("util/StringLib");
local login_regAccount = require("view/kScreen_1280_800/hall/login/login_regAccount");

--账户注册
local RegisterAccountDialog = class(BaseLoginDialog,false);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
RegisterAccountDialog.s_controls = 
{
	closeBtn = getIndex();
	confirmBtn = getIndex();
	bg = getIndex();
	guestLogin = getIndex();

	phoneEditText = getIndex();
	warningIcon = getIndex();
	errorMsg = getIndex();

	maskView = getIndex();
};

RegisterAccountDialog.ctor = function(self,data)	
	super(self,login_regAccount);
	self.m_ctrls = RegisterAccountDialog.s_controls;
	self.m_data = data;

	self:_init();
	RegisterLogic.getInstance():setObserver(self);
end


RegisterAccountDialog.dtor = function(self)	
	RegisterLogic.getInstance():clearObserver(self);
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------

RegisterAccountDialog.onCloseClick = function(self)
	Log.d("-------------RegisterAccountDialog onCloseClick------------");
	RegisterAccountDialog.hide();
	if self.m_data and self.m_data.closeCall then
		if type(self.m_data.closeCall) == 'function' then
			self.m_data.closeCall();
		end
	end
end

RegisterAccountDialog.onConfirmBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoAccountUpgradeConfirm);
	Log.d("-------------RegisterAccountDialog onLeftClick A------------");
	
	--TODO 调用手机号登录接口

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

	--博雅通行证注册
	self:onOpenToast("正在验证手机号码");
	RegisterLogic.getInstance():checkRegister(text);
end

RegisterAccountDialog.onGuestLoginClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoOldAccountLogin);
	Log.d("-------------RegisterAccountDialog onGuestLoginClick------------");
	RegisterAccountDialog.hide();
	local OldAccountLoginDialog = require("hall/login/widget/oldAccountLoginDialog");
	OldAccountLoginDialog.show();	
end

RegisterAccountDialog.onBgClick = function(self)
end

RegisterAccountDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end

---------------------------------------------------------------------
RegisterAccountDialog._init = function(self)	
	self:findViewById(self.m_ctrls.phoneEditText):setHintText("您的手机号",220,180,140);
    self:findViewById(self.m_ctrls.phoneEditText):setBackgroundColor("#EEE4CA");
    self:findViewById(self.m_ctrls.phoneEditText):setInputMode(kEditBoxInputModePhoneNumber);
    self:findViewById(self.m_ctrls.phoneEditText):setMaxLength(20);
	self:findViewById(self.m_ctrls.errorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(false);

	local phone = kClientInfo:getPhoneNum();
	if not string.isEmpty(phone) then
        local splitPhone = string.split(phone,"+86");
        if #splitPhone == 2 then
            phone = splitPhone[2];
        else
            phone = splitPhone[1];
        end
		self:findViewById(self.m_ctrls.phoneEditText):setText(phone);
	end

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
end
---------------------------------继承自父类------------------------------------------------

RegisterAccountDialog.onCheckRegisterSucess = function(self, info)
	Log.v("RegisterAccountDialog","onCheckRegisterSucess");

	info = table.verify(info);
	info.checkPhone = info.checkPhone or 0;
	local RegisterAccountVerifyDialog = require("hall/login/widget/registerAccountVerifyDialog");
	local instance = RegisterAccountVerifyDialog.show(info);
	RegisterAccountDialog.hide();
	instance:findViewById(instance.m_ctrls.codeEditText):openEdit()
end

RegisterAccountDialog.onCheckRegisterFailed = function(self,errorInfo)
	Log.v("RegisterAccountDialog","onCheckRegisterFailed");

	local errorType = errorInfo and  errorInfo.errorType or 0;
	if errorType == LoginConstants.eRegisterErr.Registered then 
	    local num = errorInfo and errorInfo.checkPhone or 0;
		local AccountRegisteredDialog = require("hall/login/widget/accountRegisteredDialog");
		AccountRegisteredDialog.show(num);
		RegisterAccountDialog.hide();
	else
		local msg = errorInfo and errorInfo.msg or "验证失败，请稍后重试！";
		self:findViewById(self.m_ctrls.errorMsg):setText(msg);
		self:findViewById(self.m_ctrls.warningIcon):setVisible(true);
		self:findViewById(self.m_ctrls.errorMsg):setVisible(true);
	end 
end

RegisterAccountDialog.onPhoneEditText = function(self, text, flag)
	if flag == EditText.s_EX_CLOSE_DONE then
		self:onConfirmBtnClick()
	end
end

---------------------------------------------------------------------------------
RegisterAccountDialog.show = function(data)	
	
	RegisterAccountDialog.hide(true);
	RegisterAccountDialog.s_instance = new(RegisterAccountDialog , data);
	RegisterAccountDialog.s_instance:addToRoot();
	RegisterAccountDialog.s_instance:setFillParent(true,true);
	-- RegisterAccountDialog.s_instance:setLevel(15);
	return RegisterAccountDialog.s_instance;

end

RegisterAccountDialog.hide = function()	
	delete(RegisterAccountDialog.s_instance);
	RegisterAccountDialog.s_instance = nil;
end

RegisterAccountDialog.s_controlConfig = 
{	
	[RegisterAccountDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[RegisterAccountDialog.s_controls.confirmBtn] = {"contentView","centerView","subView","confirmBtn"};
	[RegisterAccountDialog.s_controls.bg] = {"contentView","bg"};
	[RegisterAccountDialog.s_controls.guestLogin] = {"contentView","bottomView","loginarea"};
	[RegisterAccountDialog.s_controls.phoneEditText] = {"contentView","centerView","subView","inputBg","phoneEditText"};

	[RegisterAccountDialog.s_controls.warningIcon] = {"contentView","centerView","subView","inputBg","warningIcon"};
	[RegisterAccountDialog.s_controls.errorMsg] = {"contentView","centerView","subView","inputBg","errorMsg"};
	[RegisterAccountDialog.s_controls.maskView] = {"shiled"};
};

RegisterAccountDialog.s_controlFuncMap =
{
	[RegisterAccountDialog.s_controls.closeBtn] = RegisterAccountDialog.onCloseClick;
	[RegisterAccountDialog.s_controls.confirmBtn] = RegisterAccountDialog.onConfirmBtnClick;
	[RegisterAccountDialog.s_controls.bg] = RegisterAccountDialog.onBgClick;
	[RegisterAccountDialog.s_controls.guestLogin] = RegisterAccountDialog.onGuestLoginClick;
	[RegisterAccountDialog.s_controls.maskView] = RegisterAccountDialog.onMaskTouch;
	[RegisterAccountDialog.s_controls.phoneEditText] = RegisterAccountDialog.onPhoneEditText;
};

return RegisterAccountDialog