-- @desription 支付过程中输入手机号
-- @author     ReyLei
-- @date	   2015-07-14

local inputPhoneNumber = require(ViewPath .. "hall/shortCutRecharge/inputPhoneNumber");

local InputPhoneNumber = class(CommonGameLayer, false);

InputPhoneNumber.Delegate = {
    onInputPhoneNumberClose = "onInputPhoneNumberClose";
    onInputPhoneNumberBuyBtnClick = "onInputPhoneNumberBuyBtnClick";
};

InputPhoneNumber.s_controls = { --枚举
    shadeBg = 1;
    editText = 2;
    closeBtn = 3;
    buyBtn = 4;
    text_formatError = 5;
    img_error = 6;
}

InputPhoneNumber.ctor = function(self) 
    super(self, inputPhoneNumber);
    self:setFillParent(true, true);
    self.m_ctrls = InputPhoneNumber.s_controls;
    self:getControl(self.m_ctrls.shadeBg):setEventTouch(nil , function()
    end);
    self:getControl(self.m_ctrls.shadeBg):setEventDrag(nil , function()
    end);
end

InputPhoneNumber.show = function(self) --显示
    Log.v("InputPhoneNumber.show");
    CommonGameLayer.show(self);
end

InputPhoneNumber.onBuyBtnClick = function(self)--确认按钮
    
    local text = string.trim(self:getControl(self.m_ctrls.editText):getText());
	local isNil = (text== nil or text == "");
	local isPhoneFormatError = not string.checkPhoneNumber(text);

	self:getControl(self.m_ctrls.text_formatError):setVisible(isNil or isPhoneFormatError);
	self:getControl(self.m_ctrls.img_error):setVisible(isNil or isPhoneFormatError);
    if not(isNil or isPhoneFormatError) then
        self:execDelegate(InputPhoneNumber.Delegate.onInputPhoneNumberBuyBtnClick,text);
    end
end

InputPhoneNumber.onCloseBtnClick = function(self)--关闭按钮   
    self:getControl(self.m_ctrls.text_formatError):setVisible(false);
	self:getControl(self.m_ctrls.img_error):setVisible(false);
    self:execDelegate(InputPhoneNumber.Delegate.onInputPhoneNumberClose,true);
end

InputPhoneNumber.s_controlConfig = { --枚举节点
    [InputPhoneNumber.s_controls.shadeBg] =  {"shadeBg"};
    [InputPhoneNumber.s_controls.editText] = {"centerView", "contentBg", "img_phoneBg", "EditText_phone"};
    [InputPhoneNumber.s_controls.closeBtn] = {"centerView", "closeBtn"};
    [InputPhoneNumber.s_controls.buyBtn] =   {"centerView", "buyBtn"};
    [InputPhoneNumber.s_controls.text_formatError] =   {"centerView", "contentBg", "img_phoneBg", "text_formatError"};
    [InputPhoneNumber.s_controls.img_error] =   {"centerView", "contentBg", "img_phoneBg", "img_error"};
}

InputPhoneNumber.s_controlFuncMap = { --按钮触发
    [InputPhoneNumber.s_controls.closeBtn] = InputPhoneNumber.onCloseBtnClick;
    [InputPhoneNumber.s_controls.buyBtn]   = InputPhoneNumber.onBuyBtnClick;
}


return InputPhoneNumber;