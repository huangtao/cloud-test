local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
require("util/StringLib");
local login_resetPsd = require("view/kScreen_1280_800/hall/login/login_resetPsd");

--重置密码
local ResetPsdDialog = class(BaseLoginDialog,false);

ResetPsdDialog.countDownSeconds=60;
ResetPsdDialog.psdNumMax = 12;

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
ResetPsdDialog.s_controls = 
{
	closeBtn = getIndex();
	confirmBtn = getIndex();
	bg = getIndex();
	
	timeClockText = getIndex();
	resendBtn = getIndex();

	tips = getIndex();
	codeEditText = getIndex();
	warningIcon = getIndex();
	errorMsg = getIndex();
	modphoneText = getIndex();

	psdEditText = getIndex();
	psdWarningIcon = getIndex();
	psdErrorMsg = getIndex();

	maskView = getIndex();
};

ResetPsdDialog.ctor = function(self,data,errorType)	
	super(self,login_resetPsd);
	self.m_data = data;
	self.errorType = errorType;
	self.m_ctrls = ResetPsdDialog.s_controls;
	self:_init();

	--TODO 调用监听短信接口 
	EventDispatcher.getInstance():register(BaseLoginDialog.s_SmsCallBack,self,self.onSmsCallBack);
	NativeEvent.getInstance():registerSmsObserver();

	LoginLogic.getInstance():setObserver(self);
end


ResetPsdDialog.dtor = function(self,viewConfig)	
	--TODO 调用取消短信监听接口
	EventDispatcher.getInstance():unregister(BaseLoginDialog.s_SmsCallBack,self,self.onSmsCallBack);
	NativeEvent.getInstance():unRegisterSmsObserver();

	self:_clearCountDownTimer();
	self.m_data = nil;
	self.m_psd = nil;

	LoginLogic.getInstance():clearObserver(self);
end

---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------

ResetPsdDialog.onCloseClick = function(self)
	Log.d("-------------ResetPsdDialog onCloseClick------------");
	ResetPsdDialog.hide();
end

ResetPsdDialog.onConfirmClick = function(self)
	Log.d("-------------ResetPsdDialog onConfirmClick A------------");
	
	local text = string.trim(self:findViewById(self.m_ctrls.codeEditText):getText());
	local isNil = (text == nil or text == "");
	self:findViewById(self.m_ctrls.errorMsg):setVisible(isNil);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(isNil);
	if isNil then
		return;
	end

	local psd = string.trim(self:findViewById(self.m_ctrls.psdEditText):getText());
	local isPsdNil = (psd == nil or psd == "");
	local isPsdFormatError = not string.checkPsd(psd) or self:_isTooLong(psd);

	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(isPsdNil or isPsdFormatError);
	self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(isPsdNil or isPsdFormatError);

	if isPsdNil then
		self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入密码");
		return;
	elseif isPsdFormatError then
		self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入6-12位数值、字母或符号的密码");
		return ;
	end

	self.m_psd = psd;

	--TODO 调用登录接口 
	self:onOpenToast();
	
	LoginLogic.getInstance():requestResetPswd(self.m_data ,text ,psd ,self.errorType);
	local AccountRegisteredDialog = require("hall/login/widget/accountRegisteredDialog");
    AccountRegisteredDialog.hide();
end

ResetPsdDialog.onResendClick = function(self)
	Log.d("-------------ResetPsdDialog onResendClick------------");
	self:_showResendView(false);
	self:_refreshCountDownView(ResetPsdDialog.countDownSeconds);
	self:_startCountDownTimer();

	-- self:onOpenToast();
	LoginLogic.getInstance():requestVerifyCode(self.m_data);
end

ResetPsdDialog.onBgClick = function(self)
end

ResetPsdDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end

ResetPsdDialog.onPsdEditText = function(self)
    local psdTxt = string.trim(self:findViewById(self.m_ctrls.psdEditText):getText());
	if string.len(psdTxt) > 0 then
		if self:_isTooLong(psdTxt) then 
			self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(true);
			self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(true);
			self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入6-12位数值、字母或符号的密码");
		else
			self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(false);
			self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(false);
		end

		self:findViewById(self.m_ctrls.psdEditText):setText(string.subUtfStr(psdTxt, 1, 24), 400);
	end
end

ResetPsdDialog.onModifyPhoneTouch = function(self, finger_action , x , y, drawing_id_first , drawing_id_current)
	if finger_action == kFingerUp then
		ResetPsdDialog.hide();
		local FindPsdDialog = require("hall/login/widget/findPsdDialog");
		FindPsdDialog.show("");
	end
end

---------------------------------------------------------------------
ResetPsdDialog.onSmsCallBack = function(self , number )		
	if number then
		self:findViewById(self.m_ctrls.codeEditText):setText(number);
	end
end

ResetPsdDialog._init = function(self)	
	self:findViewById(self.m_ctrls.codeEditText):setHintText("验证码",220,180,140);
	self:findViewById(self.m_ctrls.codeEditText):setBackgroundColor("#EEE4CA");
	self:findViewById(self.m_ctrls.codeEditText):setInputMode(kEditBoxInputModeNumeric);
	self:findViewById(self.m_ctrls.codeEditText):setMaxLength(10);
	self:findViewById(self.m_ctrls.psdEditText):setHintText("新密码",220,180,140);
	self:findViewById(self.m_ctrls.psdEditText):setBackgroundColor("#EEE4CA");
	self:findViewById(self.m_ctrls.psdEditText):setInputFlag(kEditBoxInputFlagPassword);
	self:findViewById(self.m_ctrls.psdEditText):setMaxLength(12);

	self:findViewById(self.m_ctrls.resendBtn):setVisible(false);

	self:findViewById(self.m_ctrls.errorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(false);
	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(false);

	self:_refreshCountDownView(ResetPsdDialog.countDownSeconds);
	self:_startCountDownTimer();

	self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );

	local tips = string.format("已向你的手机%s发送验证码", self.m_data or "");
	self:findViewById(self.m_ctrls.tips):setText(tips);
end

ResetPsdDialog._startCountDownTimer = function(self)
	self:_clearCountDownTimer();
	self.m_timeOut = AnimFactory.createAnimInt(kAnimRepeat,0,1,1000);
	ToolKit.setDebugName(self.m_timeOut,"AnimInt|ResetPsdDialog._startCountDownTimer|timeOut");
	self.m_timeOut:setEvent(self,self.onRequestTimeout);
end 

ResetPsdDialog._clearCountDownTimer = function(self)
	if self.m_timeOut then
		self.m_timeOut:setEvent();
	end
	delete(self.m_timeOut);
	self.m_timeOut = nil;
	ResetPsdDialog.mCurrentSecond=nil;
end

ResetPsdDialog.onRequestTimeout = function(self)
	
	ResetPsdDialog.mCurrentSecond = (ResetPsdDialog.mCurrentSecond or ResetPsdDialog.countDownSeconds) - 1;
	if ResetPsdDialog.mCurrentSecond > 0 then

		self:_refreshCountDownView(ResetPsdDialog.mCurrentSecond);

	elseif ResetPsdDialog.mCurrentSecond <= 0 then

		self:_clearCountDownTimer();
		self:_showResendView(true);
	end
end

ResetPsdDialog._refreshCountDownView = function(self,second)
	self:findViewById(self.m_ctrls.timeClockText):setText(string.format("重发(%d秒)",second));
end

ResetPsdDialog._showResendView = function(self ,visible)
	self:findViewById(self.m_ctrls.timeClockText):setVisible(not visible);
	self:findViewById(self.m_ctrls.resendBtn):setVisible(visible);
end

ResetPsdDialog._isTooLong = function(self, str)
	return string.len(tostring(str) or "") > ResetPsdDialog.psdNumMax;
end

---------------------------------继承自父类------------------------------------------------
ResetPsdDialog.onLoginSuccess = function(self,...)
	self:onCloseToast();
	Log.v("ResetPsdDialog","onLoginSuccess");
	ResetPsdDialog.hide();
end

ResetPsdDialog.onLoginFailed = function(self,errorInfo)
	self:onCloseToast();
	Log.v("ResetPsdDialog","onLoginFailed");	

	local msg = errorInfo and (errorInfo.errorTips or "验证失败" ) or "验证失败";
	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(true);
	self:findViewById(self.m_ctrls.psdErrorMsg):setText(msg);
end

ResetPsdDialog.onResetPswdCallBack = function(self,isSuccess,data)	
	if isSuccess then 
		LoginLogic.getInstance():requestAccPswdLogin(self.m_data,self.m_psd);
	else 
		self:onCloseToast();
		local msg = data and (data.errorTips or "验证失败" ) or "验证失败";
		self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(true);
		self:findViewById(self.m_ctrls.psdErrorMsg):setText(msg);
	end 
end
----------------------------------全     局-----------------------------------------------
ResetPsdDialog.show = function( ... )		
	ResetPsdDialog.hide(true);
	ResetPsdDialog.s_instance = new(ResetPsdDialog , ... );
	ResetPsdDialog.s_instance:addToRoot();
	ResetPsdDialog.s_instance:setFillParent(true,true);
	return ResetPsdDialog.s_instance;
end

ResetPsdDialog.hide = function()	
	delete(ResetPsdDialog.s_instance);
	ResetPsdDialog.s_instance = nil;
end

ResetPsdDialog.s_controlConfig = 
{	
	[ResetPsdDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[ResetPsdDialog.s_controls.confirmBtn] = {"contentView","bottomView","confirmBtn"};
	[ResetPsdDialog.s_controls.bg] = {"contentView","bg"};

	[ResetPsdDialog.s_controls.timeClockText] = {"contentView","centerView","subView","codeView","timeClockText"};
	[ResetPsdDialog.s_controls.resendBtn] = {"contentView","centerView","subView","codeView","resendBtn"};
	
	[ResetPsdDialog.s_controls.tips] = {"contentView","centerView","subView", "tips"};
	[ResetPsdDialog.s_controls.codeEditText] = {"contentView","centerView","subView","codeView","codeBg","codeEditText"};
	[ResetPsdDialog.s_controls.warningIcon] = {"contentView","centerView","subView","codeView","codeBg","warningIcon"};
	[ResetPsdDialog.s_controls.errorMsg] = {"contentView","centerView","subView","codeView","codeBg","errorMsg"};
	[ResetPsdDialog.s_controls.modphoneText] = {"contentView","centerView","subView","codeView","modphoneText"};

	[ResetPsdDialog.s_controls.psdEditText] = {"contentView","centerView","subView","pswdView","psdBg","psdEditText"};
	[ResetPsdDialog.s_controls.psdWarningIcon] = {"contentView","centerView","subView","pswdView","psdBg","psdWarningIcon"};
	[ResetPsdDialog.s_controls.psdErrorMsg] = {"contentView","centerView","subView","pswdView","psdBg","psdErrorMsg"};

	[ResetPsdDialog.s_controls.maskView] = {"shiled"};
	
};


ResetPsdDialog.s_controlFuncMap =
{
	[ResetPsdDialog.s_controls.closeBtn] = ResetPsdDialog.onCloseClick;
	[ResetPsdDialog.s_controls.confirmBtn] = ResetPsdDialog.onConfirmClick;
	[ResetPsdDialog.s_controls.resendBtn] = ResetPsdDialog.onResendClick;
	[ResetPsdDialog.s_controls.bg] = ResetPsdDialog.onBgClick;
	[ResetPsdDialog.s_controls.maskView] = ResetPsdDialog.onMaskTouch;
    [ResetPsdDialog.s_controls.psdEditText] = ResetPsdDialog.onPsdEditText;
    [ResetPsdDialog.s_controls.modphoneText] = ResetPsdDialog.onModifyPhoneTouch;
};

return ResetPsdDialog