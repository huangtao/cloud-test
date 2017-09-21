local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
require("util/StringLib");
local login_phonelogin = require("view/kScreen_1280_800/hall/login/login_phonelogin");

--账户登录
local PhoneAccountLoginDialog = class(BaseLoginDialog,false);

---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
PhoneAccountLoginDialog.s_controls = 
{
	closeBtn = getIndex();
	confirmBtn = getIndex();
	bg = getIndex();
	
	psdEditText = getIndex();
	warningIcon = getIndex();
	errorMsg = getIndex();

	modphoneText = getIndex();
	findPsd = getIndex();
	valueTextPhone = getIndex();

	maskView = getIndex();
};

PhoneAccountLoginDialog.ctor = function(self,data)	
	super(self,login_phonelogin);
	self.m_data = data;
	self.m_ctrls = PhoneAccountLoginDialog.s_controls;
	self:_init();

	LoginLogic.getInstance():setObserver(self);
end


PhoneAccountLoginDialog.dtor = function(self,viewConfig)	
	self.m_data = nil;

	LoginLogic.getInstance():clearObserver(self);
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
PhoneAccountLoginDialog.onCloseClick = function(self)
	Log.d("-------------PhoneAccountLoginDialog onCloseClick------------");
	PhoneAccountLoginDialog.hide();
end

PhoneAccountLoginDialog.onConfirmClick = function(self)
	Log.d("-------------PhoneAccountLoginDialog onConfirmClick A------------");

	local psd = string.trim(self:findViewById(self.m_ctrls.psdEditText):getText());
	local isPsdNil = (psd == nil or psd == "");
	local isPsdFormatError = not string.checkPsd(psd);

	self:findViewById(self.m_ctrls.errorMsg):setVisible(isPsdNil or isPsdFormatError);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(isPsdNil or isPsdFormatError);

	if isPsdNil then
		self:findViewById(self.m_ctrls.errorMsg):setText("请输入密码");
		return;
	elseif isPsdFormatError then
		self:findViewById(self.m_ctrls.errorMsg):setText("请输入6-12位数值、字母或符号的密码");
		return ;
	end

	self:onOpenToast();
	LoginLogic.getInstance():requestAccPswdLogin(self.m_data,psd);

end

PhoneAccountLoginDialog.onModifyPhoneClick = function(self, finger_action , x , y, drawing_id_first , drawing_id_current)
	Log.d("-------------PhoneAccountLoginDialog onModifyPhoneClick------------");
	if finger_action == kFingerUp and drawing_id_first == drawing_id_current then
		local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
		RegisterAccountDialog.show();
		PhoneAccountLoginDialog.hide();
	end

end

PhoneAccountLoginDialog.onFindPsdClick = function(self, finger_action , x , y, drawing_id_first , drawing_id_current)
	Log.d("-------------PhoneAccountLoginDialog onFindPsdClick------------");

	if finger_action == kFingerUp and drawing_id_first == drawing_id_current then
		local FindPsdDialog = require("hall/login/widget/findPsdDialog");
		FindPsdDialog.show(self.m_data);
		PhoneAccountLoginDialog.hide();
	end
end


PhoneAccountLoginDialog.onBgClick = function(self)
end

PhoneAccountLoginDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end

PhoneAccountLoginDialog.onPsdEditText = function(self, text, flag)
	if flag == EditText.s_EX_CLOSE_DONE then
		self:onConfirmClick()
	end
end

---------------------------------------------------------------------
PhoneAccountLoginDialog._init = function(self)	
	self:findViewById(self.m_ctrls.valueTextPhone):setText(self.m_data or "");
	self:findViewById(self.m_ctrls.psdEditText):setHintText("请输入登录密码",220,180,140);
	self:findViewById(self.m_ctrls.psdEditText):setInputFlag(kEditBoxInputFlagPassword);
	self:findViewById(self.m_ctrls.psdEditText):setBackgroundColor("#EEE4CA");

	self:findViewById(self.m_ctrls.errorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(false);

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
end

---------------------------------继承自父类------------------------------------------------
PhoneAccountLoginDialog.onLoginSuccess = function(self,...)
	PhoneAccountLoginDialog.hide();
end

PhoneAccountLoginDialog.onLoginFailed = function(self,errorInfo)
	local msg = errorInfo and (errorInfo.errorTips or "登录失败" ) or "登录失败";
	self:findViewById(self.m_ctrls.errorMsg):setVisible(true);
	self:findViewById(self.m_ctrls.errorMsg):setText(msg);
end

----------------------------------全     局-----------------------------------------------
PhoneAccountLoginDialog.show = function(data)	
	
	PhoneAccountLoginDialog.hide(true);
	PhoneAccountLoginDialog.s_instance = new(PhoneAccountLoginDialog , data);
	PhoneAccountLoginDialog.s_instance:addToRoot();
	PhoneAccountLoginDialog.s_instance:setFillParent(true,true);
	-- PhoneAccountLoginDialog.s_instance:setLevel(15);
	return PhoneAccountLoginDialog.s_instance;
end

PhoneAccountLoginDialog.hide = function()	
	delete(PhoneAccountLoginDialog.s_instance);
	PhoneAccountLoginDialog.s_instance = nil;
end



PhoneAccountLoginDialog.s_controlConfig = 
{	
	[PhoneAccountLoginDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[PhoneAccountLoginDialog.s_controls.confirmBtn] = {"contentView","bottomView","loginBtn"};
	[PhoneAccountLoginDialog.s_controls.bg] = {"contentView","bg"};

	[PhoneAccountLoginDialog.s_controls.psdEditText] = {"contentView","centerView","subView","pswdView","psdBg","psdEditText"};
	[PhoneAccountLoginDialog.s_controls.warningIcon] = {"contentView","centerView","subView","pswdView","psdBg","warningIcon"};
	[PhoneAccountLoginDialog.s_controls.errorMsg] = {"contentView","centerView","subView","pswdView","psdBg","errorMsg"};
	[PhoneAccountLoginDialog.s_controls.modphoneText] = {"contentView","centerView","subView","accountView","modphoneText"};
	[PhoneAccountLoginDialog.s_controls.findPsd] = {"contentView","centerView","subView","pswdView","findPsd"};
	[PhoneAccountLoginDialog.s_controls.valueTextPhone] = {"contentView","centerView","subView","accountView","valueTextPhone"};
	[PhoneAccountLoginDialog.s_controls.maskView] = {"shiled"};
};


PhoneAccountLoginDialog.s_controlFuncMap =
{
	[PhoneAccountLoginDialog.s_controls.closeBtn] = PhoneAccountLoginDialog.onCloseClick;
	[PhoneAccountLoginDialog.s_controls.confirmBtn] = PhoneAccountLoginDialog.onConfirmClick;
	[PhoneAccountLoginDialog.s_controls.modphoneText] = PhoneAccountLoginDialog.onModifyPhoneClick;
	[PhoneAccountLoginDialog.s_controls.findPsd] = PhoneAccountLoginDialog.onFindPsdClick;
	[PhoneAccountLoginDialog.s_controls.bg] = PhoneAccountLoginDialog.onBgClick;
	[PhoneAccountLoginDialog.s_controls.maskView] = PhoneAccountLoginDialog.onMaskTouch;
	[PhoneAccountLoginDialog.s_controls.psdEditText] = PhoneAccountLoginDialog.onPsdEditText;
};

return PhoneAccountLoginDialog