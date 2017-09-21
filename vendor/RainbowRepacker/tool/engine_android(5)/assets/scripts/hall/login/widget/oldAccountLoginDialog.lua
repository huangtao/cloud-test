local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
local ListEditText = require("hall/login/widget/listEditText");
local login_oldAccountLogin = require("view/kScreen_1280_800/hall/login/login_oldAccountLogin");
require("util/StringLib");

--已有账户登录
local OldAccountLoginDialog = class(BaseLoginDialog,false);

---------------------------------------------------------------------
----------------- config tables -------------------------------------
---------------------------------------------------------------------
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
OldAccountLoginDialog.s_controls = 
{
	closeBtn = getIndex();
	confirmBtn = getIndex();
	bg = getIndex();
	
	listEditText = getIndex();
	warningIcon = getIndex();
	errorMsg = getIndex();

	psdEditText = getIndex();
	psdWarningIcon = getIndex();
	psdErrorMsg = getIndex();

	findPsd = getIndex();
	guestLogin = getIndex();
	registerArea = getIndex();

	maskView = getIndex();
    phoneNumber = getIndex();
    phoneTips   = getIndex();
    phoneLine   = getIndex();
};

OldAccountLoginDialog.ctor = function(self)	
	super(self,login_oldAccountLogin);
	self.m_ctrls = OldAccountLoginDialog.s_controls;
	self:_init();

	LoginLogic.getInstance():setObserver(self);
end

OldAccountLoginDialog.dtor = function(self)	
	LoginLogic.getInstance():clearObserver(self);
	MessageBox.hide();
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------

OldAccountLoginDialog.onCloseClick = function(self)
	Log.d("-------------OldAccountLoginDialog onCloseClick------------");
	OldAccountLoginDialog.hide();
end

OldAccountLoginDialog.onLoginClick = function(self)
	Log.d("-------------OldAccountLoginDialog onLoginClick A------------");
	if self.m_listEditText:isShowing() then
		self.m_listEditText:hide();
		return;
	end
	
	local text = string.trim(self.m_listEditText:getText());
	local isNil = (text== nil or text == "");
	self:findViewById(self.m_ctrls.errorMsg):setVisible(isNil);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(isNil);
	if isNil then
		return;
	end

	local psd = string.trim(self:findViewById(self.m_ctrls.psdEditText):getText());
	local isPsdNil = (psd== nil or psd == "");
	local isPsdFormatError = not string.checkPsd(psd);

	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(isPsdNil or isPsdFormatError);
	self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(isPsdNil or isPsdFormatError);

	if isPsdNil then
		self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入密码");
		return;
	elseif isPsdFormatError then
		self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入6-12位数值、字母或符号的密码");
		return ;
	end

	--TODO 调用登录接口 

	self:onOpenToast();
	LoginLogic.getInstance():requestAccPswdLogin(text,psd);
end


OldAccountLoginDialog.onFindPsdClick = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	Log.d("-------------OldAccountLoginDialog onFindPsdClick------------");
	if finger_action == kFingerUp and drawing_id_first == drawing_id_current then		
		if self.m_listEditText:isShowing() then
			self.m_listEditText:hide();
			return;
		end
		local text = string.trim(self.m_listEditText:getText());
		OldAccountLoginDialog.hide();
		local FindPsdDialog = require("hall/login/widget/findPsdDialog");
		FindPsdDialog.show(text);
	end
end

OldAccountLoginDialog.onGuestLoginClick = function(self)
	Log.d("-------------OldAccountLoginDialog onGuestLoginClick------------");
	if self.m_listEditText:isShowing() then
		self.m_listEditText:hide();
		return;
	end
	
	self:onOpenToast();
	LoginLogic.getInstance():requestGuestLogin();
end

OldAccountLoginDialog.onRegistAccountBtnClick = function(self)
	OldAccountLoginDialog.hide();
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	RegisterAccountDialog.show();
end

OldAccountLoginDialog.onBgClick = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	if finger_action == kFingerUp then
		Log.d("-------------OldAccountLoginDialog onBgClick------------");

		if self.m_listEditText:isShowing() then
			self.m_listEditText:hide();
			return;
		end
    end	
end

OldAccountLoginDialog.onMaskTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
end

---------------------------------------------------------------------

OldAccountLoginDialog._init = function(self)	

	self:findViewById(self.m_ctrls.errorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(false);
	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(false);

	local listEditText = self:findViewById(self.m_ctrls.listEditText);
	local w = listEditText:getSize();
	self.m_listEditText = new(ListEditText , w , 200 );
	listEditText:addChild(self.m_listEditText);

	self:findViewById(self.m_ctrls.psdEditText):setInputFlag(kEditBoxInputFlagPassword);
	self:findViewById(self.m_ctrls.psdEditText):setBackgroundColor("#EEE4CA");
	self.m_listEditText:setOnAccountClickListener(self,OldAccountLoginDialog.onAccountClick);
	self.m_listEditText:setOnDeleteTextClickListener(self,OldAccountLoginDialog.onDeleteTextClick);

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );

	local isShiledGuestLogin = kLoginDataInterface:isShiledGuestLogin()
	self:findViewById(self.m_ctrls.guestLogin):setVisible( not isShiledGuestLogin );
	self:findViewById(self.m_ctrls.registerArea):setVisible( isShiledGuestLogin );
    local phoneTips = self:findViewById(self.m_ctrls.phoneTips);
    local text = new(Text, phoneTips:getText(), nil, nil, nil, nil, phoneTips.m_res.m_fontSize);
    local w,_ = text:getSize();
    delete(text);
    local phoneNumber = self:findViewById(self.m_ctrls.phoneNumber);
    local phoneNum = HallDataInterface.getInstance():getHotline();
    phoneNumber:setText(phoneNum, 1);
    local x = phoneTips:getPos() + w;
    phoneNumber:setPos(x, nil);

    local phoneLine = self:findViewById(self.m_ctrls.phoneLine);
    phoneLine:setPos(x, nil);
    
    local numberW,_ = phoneNumber:getSize();
    phoneLine:setSize(numberW, nil);
end

OldAccountLoginDialog.onAccountClick = function(self , data )
	local psd = data and (data.loginPsd or "") or "";
	self:findViewById(self.m_ctrls.psdEditText):setText(psd);
end

OldAccountLoginDialog.onDeleteTextClick = function(self )	
	self:findViewById(self.m_ctrls.psdEditText):setText("");
end
---------------------------------继承自父类------------------------------------------------
OldAccountLoginDialog.onLoginSuccess = function(self,...)
	Log.v("OldAccountLoginDialog","onLoginSuccess");
	self:onCloseToast();
	OldAccountLoginDialog.hide();
end

OldAccountLoginDialog.onLoginFailed = function(self,errorInfo)
	Log.v("OldAccountLoginDialog","onLoginFailed");
	self:onCloseToast();
	if errorInfo and errorInfo.errorType == LoginConstants.eLoginFailErr.ERR_FOBID_GUEST_LOGIN then
		self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(false);
	else
		local msg=errorInfo and (errorInfo.errorTips or "登录失败" ) or "登录失败";
		self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(true);
		self:findViewById(self.m_ctrls.psdErrorMsg):setText(msg);
	end
end

----------------------------------全     局-----------------------------------------------

OldAccountLoginDialog.show = function()	
	
	OldAccountLoginDialog.hide(true);
	OldAccountLoginDialog.s_instance = new(OldAccountLoginDialog);
	OldAccountLoginDialog.s_instance:addToRoot();
	OldAccountLoginDialog.s_instance:setFillParent(true,true);
	return OldAccountLoginDialog.s_instance;
end

OldAccountLoginDialog.hide = function()	
	delete(OldAccountLoginDialog.s_instance);
	OldAccountLoginDialog.s_instance = nil;
end

OldAccountLoginDialog.onPsdEditText = function(self, text, flag)
    local psdTxt = string.trim(self:findViewById(self.m_ctrls.psdEditText):getText());
	if string.len(psdTxt) > 0 then
		self:findViewById(self.m_ctrls.psdEditText):setText(string.subUtfStr(psdTxt, 1, 12), 400);
	end
	if flag == EditText.s_EX_CLOSE_DONE then
		self:onLoginClick()
	end
end

OldAccountLoginDialog.onPhoneNumberClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action == kFingerUp then
        HallDataInterface.getInstance():callHotline();
    end
end

OldAccountLoginDialog.s_controlConfig = 
{	
	[OldAccountLoginDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[OldAccountLoginDialog.s_controls.confirmBtn] = {"contentView","centerView","subView","confirmBtn"};
	[OldAccountLoginDialog.s_controls.bg] = {"contentView","bg"};
	

	[OldAccountLoginDialog.s_controls.listEditText] = {"contentView","centerView","subView","accountView","listEditText"};
	[OldAccountLoginDialog.s_controls.warningIcon] = {"contentView","centerView","subView","accountView","listEditText","warningIcon"};
	[OldAccountLoginDialog.s_controls.errorMsg] = {"contentView","centerView","subView","accountView","listEditText","errorMsg"};

	[OldAccountLoginDialog.s_controls.psdEditText] = {"contentView","centerView","subView","pswdView","psdBg","psdEditText"};
	[OldAccountLoginDialog.s_controls.psdWarningIcon] = {"contentView","centerView","subView","pswdView","psdBg","psdWarningIcon"};
	[OldAccountLoginDialog.s_controls.psdErrorMsg] = {"contentView","centerView","subView","pswdView","psdBg","psdErrorMsg"};

	[OldAccountLoginDialog.s_controls.findPsd] = {"contentView","centerView","subView","pswdView","findPsd"};
	[OldAccountLoginDialog.s_controls.guestLogin] = {"contentView","bottomView","loginarea"};
	[OldAccountLoginDialog.s_controls.registerArea] = {"contentView", "bottomView", "registerArea"};

	[OldAccountLoginDialog.s_controls.maskView] = {"shiled"};
    [OldAccountLoginDialog.s_controls.phoneNumber] = {"contentView", "bottomView", "phoneNumber"};
    [OldAccountLoginDialog.s_controls.phoneTips] = {"contentView", "bottomView", "phoneTips"};
    [OldAccountLoginDialog.s_controls.phoneLine] = {"contentView", "bottomView", "phoneLine"};
    
};


OldAccountLoginDialog.s_controlFuncMap =
{
	[OldAccountLoginDialog.s_controls.closeBtn] = OldAccountLoginDialog.onCloseClick;
	[OldAccountLoginDialog.s_controls.confirmBtn] = OldAccountLoginDialog.onLoginClick;
	[OldAccountLoginDialog.s_controls.findPsd] = OldAccountLoginDialog.onFindPsdClick;
	[OldAccountLoginDialog.s_controls.bg] = OldAccountLoginDialog.onBgClick;
	[OldAccountLoginDialog.s_controls.guestLogin] = OldAccountLoginDialog.onGuestLoginClick;
	[OldAccountLoginDialog.s_controls.registerArea] = OldAccountLoginDialog.onRegistAccountBtnClick;
	[OldAccountLoginDialog.s_controls.maskView] = OldAccountLoginDialog.onMaskTouch;
    [OldAccountLoginDialog.s_controls.psdEditText] = OldAccountLoginDialog.onPsdEditText;
    [OldAccountLoginDialog.s_controls.phoneNumber] = OldAccountLoginDialog.onPhoneNumberClick;
};

return OldAccountLoginDialog