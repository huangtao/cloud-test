local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");
require("util/StringLib");
local login_regAccount_psdVerify = require("view/kScreen_1280_800/hall/login/login_regAccount_psdVerify");
require("core/eventDispatcher");

-- （注册）密码验证
local RegisterAccountVerifyDialog = class(BaseLoginDialog, false);

RegisterAccountVerifyDialog.countDownSeconds = 30;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end
RegisterAccountVerifyDialog.s_controls =
{
    closeBtn = getIndex();
    confirmBtn = getIndex();
    bg = getIndex();
    timeClockText = getIndex();
    resendSmsBtn = getIndex();
    resendVoiceBtn = getIndex();
    warningIcon = getIndex();
    errorMsg = getIndex();
    codeEditText = getIndex();
    modPhoneText = getIndex();
    valueTextPhone = getIndex();
    maskView = getIndex();

    psdEditText = getIndex();
    psdWarningIcon = getIndex();
    psdErrorMsg = getIndex();


    subView = getIndex();
    subView2 = getIndex();
    registrationEditText = getIndex();
    registrationErrorMsg = getIndex();
    registrationWarningIcon = getIndex();


};

RegisterAccountVerifyDialog.ctor = function(self, data)
    super(self, login_regAccount_psdVerify);
    self.m_data = data.checkPhone;
    self.isShowRegistration =  true;
    if data.isShowRegistration == 0 then
    	self.isShowRegistration = false;
    end
    self.m_ctrls = RegisterAccountVerifyDialog.s_controls;

    self:_init();

    -- TODO 调用监听短信接口
    EventDispatcher.getInstance():register(BaseLoginDialog.s_SmsCallBack, self, self.onSmsCallBack);
    NativeEvent.getInstance():registerSmsObserver();
    RegisterLogic.getInstance():setObserver(self);
end

RegisterAccountVerifyDialog.dtor = function(self)
    EventDispatcher.getInstance():unregister(BaseLoginDialog.s_SmsCallBack, self, self.onSmsCallBack);
    NativeEvent.getInstance():unRegisterSmsObserver();
    RegisterLogic.getInstance():clearObserver(self);

    self:_clearCountDownTimer();
    self.m_data = nil;
end
---------------------------------------------------------------------
----------------- Button event response functions -------------------
---------------------------------------------------------------------
RegisterAccountVerifyDialog.onCloseClick = function(self)
	local RegisterAccountVerifyCloseDialog = require("hall/login/widget/registerAccountVerifyCloseDialog");
	RegisterAccountVerifyCloseDialog.show();
end

RegisterAccountVerifyDialog.onConfirmBtnClick = function(self)	
	local code = string.trim(self:findViewById(self.m_ctrls.codeEditText):getText());
	code = tonumber(code);
	local isCodeNil = (code == nil or code == "");

	self:findViewById(self.m_ctrls.errorMsg):setVisible(isCodeNil);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(isCodeNil);

	if isCodeNil then
		self:findViewById(self.m_ctrls.errorMsg):setText("验证码错误");
		return;
	end
	
	local psd = string.trim(self:findViewById(self.m_ctrls.psdEditText):getText());
	local isPsdNil = (psd == nil or psd == "");
	local isPsdFormatError = not string.checkPsd(psd);

	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(isPsdNil or isPsdFormatError);
	self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(isPsdNil or isPsdFormatError);

	if isPsdNil then
		self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入密码");
		return;
	elseif isPsdFormatError then
		self:findViewById(self.m_ctrls.psdErrorMsg):setText("请输入6-12位数字、字母或符号的密码");
		return ;
	end

    local  isNoError,registrationCode = self:_conformRegistration();
    if not isNoError then
        return;
    end

	--TODO:验证密码 phone,mid,pwd,verifyCode
	RegisterLogic.getInstance():requestBindPhone(self.m_data,kUserInfoData:getUserId(),psd,code,registrationCode);
end

RegisterAccountVerifyDialog._conformRegistration = function(self)
    local isNoError = true;
    local registrationCode = "";

    if not self.isShowRegistration then
        return isNoError,registrationCode;
    end

    local code = string.trim(self:findViewById(self.m_ctrls.registrationEditText):getText());

    if code == "" then
        code = "-1";
    end

	code = tonumber(code);

	local isCodeNil = (code == nil);

    registrationCode = code;

    isNoError = not isCodeNil;

	self:findViewById(self.m_ctrls.registrationErrorMsg):setVisible(isCodeNil);
	self:findViewById(self.m_ctrls.registrationWarningIcon):setVisible(isCodeNil);

	if isCodeNil then
		self:findViewById(self.m_ctrls.registrationErrorMsg):setText("推荐码无效，请更改或留空")
	end

     return isNoError,registrationCode;
end

RegisterAccountVerifyDialog.onModifyPhoneClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoModifyPhone);
	RegisterAccountVerifyDialog.hide();
	local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	RegisterAccountDialog.show();
end

RegisterAccountVerifyDialog.onResendSMSClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoResendSMS);
	self:_showResendView(false);
	self:_refreshCountDownView(RegisterAccountVerifyDialog.countDownSeconds);
	self:_startCountDownTimer();

	RegisterLogic.getInstance():requestRegisteVerifyCode(self.m_data);
end

RegisterAccountVerifyDialog.onResendVoiceClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallUserInfoResendVoice);
    self:_showResendView(false);
    self:_refreshCountDownView(RegisterAccountVerifyDialog.countDownSeconds);
    self:_startCountDownTimer();

    RegisterLogic.getInstance():requestRegisterVerifyCodeByVoice(self.m_data);    
end

RegisterAccountVerifyDialog.onBgClick = function(self)
end

RegisterAccountVerifyDialog.onMaskTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
end
----------------------------------------------------------------------------------
RegisterAccountVerifyDialog.onSmsCallBack = function(self , number )		
	if number then
		self:findViewById(self.m_ctrls.codeEditText):setText(number);
	end
end

RegisterAccountVerifyDialog._init = function(self)	
	self:findViewById(self.m_ctrls.valueTextPhone):setText(self.m_data or "");
	self:findViewById(self.m_ctrls.codeEditText):setHintText("输入验证码",215,171,127);
	self:findViewById(self.m_ctrls.codeEditText):setInputMode(kEditBoxInputModeNumeric);
	self:findViewById(self.m_ctrls.codeEditText):setBackgroundColor("#D7AB7F");
	self:findViewById(self.m_ctrls.codeEditText):setMaxLength(6);
	self:findViewById(self.m_ctrls.errorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.warningIcon):setVisible(false);
	self:findViewById(self.m_ctrls.resendSmsBtn):setVisible(false);
    self:findViewById(self.m_ctrls.resendVoiceBtn):setVisible(false);

	self:findViewById(self.m_ctrls.psdEditText):setHintText("请输入6-12位的密码",215,171,127);
	self:findViewById(self.m_ctrls.psdEditText):setInputFlag(kEditBoxInputFlagPassword);
	self:findViewById(self.m_ctrls.psdEditText):setMaxLength(12);
	self:findViewById(self.m_ctrls.psdErrorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.psdWarningIcon):setVisible(false);

    self:findViewById(self.m_ctrls.closeBtn):setVisible( not kLoginDataInterface:isForbidLogin() );
    
    self:_initRegistration();

	self:_refreshCountDownView(RegisterAccountVerifyDialog.countDownSeconds);
	self:_startCountDownTimer();
end

RegisterAccountVerifyDialog._initRegistration = function(self)
    if not self.isShowRegistration then
        return;
    end
    
    self:findViewById(self.m_ctrls.subView2):setVisible(true);
    self:findViewById(self.m_ctrls.registrationEditText):setHintText("请输入好友推荐码领礼包（选填）",215,171,127);
	self:findViewById(self.m_ctrls.registrationEditText):setInputMode(kEditBoxInputModeNumeric);
	self:findViewById(self.m_ctrls.registrationEditText):setMaxLength(11);
	self:findViewById(self.m_ctrls.registrationErrorMsg):setVisible(false);
	self:findViewById(self.m_ctrls.registrationWarningIcon):setVisible(false);

	local subView = self:findViewById(self.m_ctrls.subView);
	local _, y = subView:getPos();
    subView:setPos(nil, y - 60);
end

RegisterAccountVerifyDialog._startCountDownTimer = function(self)
	self:_clearCountDownTimer();
	self.m_timeOut = AnimFactory.createAnimInt(kAnimRepeat,0,1,1000);
	ToolKit.setDebugName(self.m_timeOut,"AnimInt|RegisterAccountVerifyDialog._startCountDownTimer|timeOut");
	self.m_timeOut:setEvent(self,self.onRequestTimeout);
end 

RegisterAccountVerifyDialog._clearCountDownTimer = function(self)
	if self.m_timeOut then
		self.m_timeOut:setEvent();
	end
	delete(self.m_timeOut);
	self.m_timeOut = nil;
	RegisterAccountVerifyDialog.mCurrentSecond = nil;
end

RegisterAccountVerifyDialog.onRequestTimeout = function(self)
	RegisterAccountVerifyDialog.mCurrentSecond = (RegisterAccountVerifyDialog.mCurrentSecond or RegisterAccountVerifyDialog.countDownSeconds) - 1;
	if RegisterAccountVerifyDialog.mCurrentSecond > 0 then

		self:_refreshCountDownView(RegisterAccountVerifyDialog.mCurrentSecond);

	elseif RegisterAccountVerifyDialog.mCurrentSecond <= 0 then

		self:_clearCountDownTimer();
		self:_showResendView(true);
	end
end

RegisterAccountVerifyDialog._refreshCountDownView = function(self,second)
	self:findViewById(self.m_ctrls.timeClockText):setText(string.format("重发(%d秒)",second));
end

RegisterAccountVerifyDialog._showResendView = function(self ,visible)
	self:findViewById(self.m_ctrls.timeClockText):setVisible(not visible);
	self:findViewById(self.m_ctrls.resendSmsBtn):setVisible(visible);
    self:findViewById(self.m_ctrls.resendVoiceBtn):setVisible(visible);
end

---------------------------------------------------------------------------------
RegisterAccountVerifyDialog.onBindPhoneCallBack = function(self,isSuccess,info)
	if isSuccess then 
		RegisterAccountVerifyDialog.hide();
		local RegisterSuccessedDialog = require("hall/login/widget/registerSuccessedDialog");
		RegisterSuccessedDialog.show();
	else 
        if  self.isShowRegistration then
            if info.errorType == 1020 then
		        local msg = info and (info.errorTips or "手机号注册失败" ) or "手机号注册失败";
		        self:findViewById(self.m_ctrls.errorMsg):setVisible(true);
		        self:findViewById(self.m_ctrls.errorMsg):setText(msg);
            --elseif info.errorType == 1049 or info.errorTips == 1050 then
            else
		        local msg = info and (info.errorTips or "无效的推荐码" ) or "无效的推荐码";
		        self:findViewById(self.m_ctrls.registrationErrorMsg):setVisible(true);
		        self:findViewById(self.m_ctrls.registrationErrorMsg):setText(msg);
            end
        else
            local msg = info and (info.errorTips or "手机号注册失败" ) or "手机号注册失败";
		    self:findViewById(self.m_ctrls.errorMsg):setVisible(true);
		    self:findViewById(self.m_ctrls.errorMsg):setText(msg);
        end
        
	end
end
---------------------------------------------------------------------------------
RegisterAccountVerifyDialog.show = function(data)	
	
	RegisterAccountVerifyDialog.hide(true);
	RegisterAccountVerifyDialog.s_instance = new(RegisterAccountVerifyDialog , data);
	RegisterAccountVerifyDialog.s_instance:addToRoot();
	RegisterAccountVerifyDialog.s_instance:setFillParent(true,true);
	-- RegisterAccountVerifyDialog.s_instance:setLevel(15);
	return RegisterAccountVerifyDialog.s_instance;

end

RegisterAccountVerifyDialog.hide = function()	
	delete(RegisterAccountVerifyDialog.s_instance);
	RegisterAccountVerifyDialog.s_instance = nil;
end

RegisterAccountVerifyDialog.s_controlConfig = 
{	
	[RegisterAccountVerifyDialog.s_controls.closeBtn] = {"contentView","closeBtn"};
	[RegisterAccountVerifyDialog.s_controls.codeEditText] = {"contentView","centerView","subView","codeView","codeBg","codeEditText"};

	
	[RegisterAccountVerifyDialog.s_controls.timeClockText] = {"contentView","centerView","subView","codeView","timeClockText"};
	[RegisterAccountVerifyDialog.s_controls.resendSmsBtn] = {"contentView","centerView","subView","codeView","resendSmsBtn"};
    [RegisterAccountVerifyDialog.s_controls.resendVoiceBtn] = {"contentView","centerView","subView","codeView","resendVoiceBtn"};

	[RegisterAccountVerifyDialog.s_controls.modPhoneText] = {"contentView","centerView","subView","accountView","modphoneText"};

	[RegisterAccountVerifyDialog.s_controls.confirmBtn] = {"contentView","bottomView","regBtn"};
	[RegisterAccountVerifyDialog.s_controls.bg] = {"contentView","bg"};

	[RegisterAccountVerifyDialog.s_controls.warningIcon] = {"contentView","centerView","subView","codeView","codeBg","warningIcon"};
	[RegisterAccountVerifyDialog.s_controls.errorMsg] = {"contentView","centerView","subView","codeView","codeBg","errorMsg"};	

	[RegisterAccountVerifyDialog.s_controls.valueTextPhone] = {"contentView","centerView","subView","accountView","valueTextPhone"};
	[RegisterAccountVerifyDialog.s_controls.maskView] = {"shiled"};	

	[RegisterAccountVerifyDialog.s_controls.psdEditText] = {"contentView","centerView","subView","psdView","psdBg","psdEditText"};
	[RegisterAccountVerifyDialog.s_controls.psdWarningIcon] = {"contentView","centerView","subView","psdView","psdBg","psdWarningIcon"};
	[RegisterAccountVerifyDialog.s_controls.psdErrorMsg] = {"contentView","centerView","subView","psdView","psdBg","psdErrorMsg"};

    [RegisterAccountVerifyDialog.s_controls.subView]                 = {"contentView", "centerView", "subView"},
	 
	[RegisterAccountVerifyDialog.s_controls.subView2]                = {"contentView", "centerView", "subView2"},
	       
	[RegisterAccountVerifyDialog.s_controls.registrationEditText]    = {"contentView", "centerView", "subView2", "registrationView", "registrationBg", "registrationEditText"},
	[RegisterAccountVerifyDialog.s_controls.registrationErrorMsg]    = {"contentView", "centerView", "subView2", "registrationView", "registrationBg", "registrationErrorMsg"},
	[RegisterAccountVerifyDialog.s_controls.registrationWarningIcon] = {"contentView", "centerView", "subView2", "registrationView", "registrationBg", "registrationWarningIcon"},
	
};


RegisterAccountVerifyDialog.s_controlFuncMap =
{
	[RegisterAccountVerifyDialog.s_controls.closeBtn] = RegisterAccountVerifyDialog.onCloseClick;
	[RegisterAccountVerifyDialog.s_controls.confirmBtn] = RegisterAccountVerifyDialog.onConfirmBtnClick;
	[RegisterAccountVerifyDialog.s_controls.modPhoneText] = RegisterAccountVerifyDialog.onModifyPhoneClick;
	[RegisterAccountVerifyDialog.s_controls.resendSmsBtn] = RegisterAccountVerifyDialog.onResendSMSClick;
    [RegisterAccountVerifyDialog.s_controls.resendVoiceBtn] = RegisterAccountVerifyDialog.onResendVoiceClick;
	[RegisterAccountVerifyDialog.s_controls.bg] = RegisterAccountVerifyDialog.onBgClick;
	[RegisterAccountVerifyDialog.s_controls.maskView] = RegisterAccountVerifyDialog.onMaskTouch;
};

return RegisterAccountVerifyDialog