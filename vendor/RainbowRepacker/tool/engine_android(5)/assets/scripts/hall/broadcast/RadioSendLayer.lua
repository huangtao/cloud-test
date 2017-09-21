require("common/commonGameLayer");
local radioSendLayer = require(ViewPath .. "hall/broadcast/radioSendLayer");
local RadioSendLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end


local radioListItem = require(ViewPath.."hall/broadcast/radioListItem");
local RadioListItem = class(CommonGameLayer, false);

RadioListItem.s_controls =
{
    line = 1,
};

RadioListItem.ctor = function(self, data)
    super(self, radioListItem);
    self:setFillParent(true, false);
    local typeStr = "";
    if  number.valueOf(data.type) == 0  then 
        typeStr = "#cc8781e[用户]";
    else
        typeStr = "#c1e8c37[系统]";    
    end
    local fontSize = 26;
    local nameStr = "#cd7ab7f"..(data.nick or "").."：";
    local maxWidth = 1020;
    local contentStr = data.content or "";
    local str = string.concat(typeStr,nameStr,contentStr);
    local textView = new(RichText, str, maxWidth, 0, kAlignTopLeft, nil, fontSize,nil,nil,nil,true);
	local h = textView:getTotalHeight();
    textView:setPos(-2, 14);
    self.m_root:addChild(textView);
    self:setSize(nil, h + 32);
    local line = self:findViewById(RadioListItem.s_controls.line);
    line:setPos(nil,h+32);
end

RadioListItem.s_controlConfig =
{
    [RadioListItem.s_controls.line]             = {"line"},
};

RadioSendLayer.Delegate = {
    onRadioSendLayerClose = "onRadioSendLayerClose";
}

RadioSendLayer.s_controls = {
    shieldBg = getIndex();
    inputText = getIndex();
    sendMessageBtn = getIndex();
    radioSpendMoney = getIndex();
    msgView = getIndex();
    closeBtn = getIndex();
    bg = getIndex();
    sendMessageBtnText = getIndex();
    inputBg = getIndex();
    topView = getIndex();
}

RadioSendLayer.ctor = function(self)
    super(self, radioSendLayer);
    self:setFillParent(true, true);
    self:setEventTouch(self, self.onTouchBg);
    self:setEventDrag(self, self.onShieldDrag);
    
    self.m_ctrl = RadioSendLayer.s_controls;
    self:findViewById(self.m_ctrl.bg):setEventTouch(self,function () end);
    local textView = self:findViewById(self.m_ctrl.inputText);
    textView:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEND );
    textView:setFilterSensitiveWordFlag(true);
    BroadcastDataInterface.getInstance():setObserver(self);
end

RadioSendLayer.dtor = function(self)
    BroadcastDataInterface.getInstance():clearObserver(self);
end

RadioSendLayer.onShieldDrag = function(self)
end

RadioSendLayer.onTouchBg =  function (self,finger_action,x,y,drawing_id_first,drawing_id_current)
    if finger_action == kFingerDown or finger_action == kFingerMove then
    else
        self:onCloseBtnClick();
    end
end

RadioSendLayer.show = function(self)
    self:__showSendMsgOrRegisterBindlingGuide();
    self:setVisible(true);
    self:__init()
    self:__refreshRadioMessageList();
end

RadioSendLayer.__showSendMsgOrRegisterBindlingGuide = function (self)
    local loginType = LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest;
    local inputBg = self:findViewById(self.m_ctrl.inputBg);
    local sendMsgText = self:findViewById(self.m_ctrl.sendMessageBtnText);
    sendMsgText:setText(loginType and "立即绑定" or "发送");
    inputBg:setVisible(not loginType);
    if loginType and not self.m_richText then
        local str = "#c8F5C1F你正在使用游客账号#c359953注册绑定手机#c8F5C1F之后才可以发送世界喇叭哦";
        self.m_richText = new(RichText, str, w, h, kAlignLeft, nil, 26, nil, nil, nil);
        self.m_richText:setAlign(kAlignLeft);
        self:findViewById(self.m_ctrl.topView):addChild(self.m_richText); 
        self.m_richText:setPos(inputBg:getPos());
    end
    if self.m_richText then
        self.m_richText:setVisible(loginType);
    end
end

RadioSendLayer.hide = function(self)
    self:setVisible(false);
end

RadioSendLayer.onSendMessageBtnClick = function(self)
    if LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest then
        UBReport.getInstance():report(UBConfig.kHallUserInfoRegistAccount)
	    local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	    RegisterAccountDialog.show();
        self:onCloseBtnClick();
    else
        UBReport.getInstance():report(UBConfig.kHallBroadcastSend);
        local radioMoney = BroadcastDataInterface.getInstance():getRadioMoney();
        local remainMoney = kUserInfoData:getMoney() - radioMoney;
        if kBankruptDataInterface:checkIsBankrupt(remainMoney)  then
            Toast.getInstance():showText(string.format(kTextFirstRecharger,radioMoney), 50, 30, kAliginCenter, "", 24, 255, 255, 255);
            return;
        end

        if UserPropertyIsolater.getInstance():getMoney() < BroadcastDataInterface.getInstance():getSendHallBroadcastLimitMoney() then
            Toast.getInstance():showText(string.format(kTextSendBroadCastLimit,BroadcastDataInterface.getInstance():getSendHallBroadcastLimitMoney()), 50, 30, kAliginCenter, "", 24, 255, 255, 255);
            return;
        end

        local textView = self:findViewById(self.m_ctrl.inputText);
        local inputContent = textView:getText();
        inputContent=string.trim(inputContent);
        local strNum =  string.count(inputContent);

        if strNum>28  then
            Toast.getInstance():showText(kTextFixNumber, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
        elseif string.isEmpty(inputContent) then
            Toast.getInstance():showText(kTextFixNumber, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
        else
            BroadcastDataInterface.getInstance():sendRadio(inputContent, BroadcastDataInterface.getInstance():getHallRadioType() );
            self:onCloseBtnClick();
        end
    end
end

RadioSendLayer.onCloseBtnClick = function(self)
    self:execDelegate(RadioSendLayer.Delegate.onRadioSendLayerClose, true);
end

RadioSendLayer.onRadioEditText = function(self,p_string,flag)
    local textView = self:findViewById(self.m_ctrl.inputText);
    local str = textView:getText();
    if string.isEmpty(str) then
        textView:setText(); 
    else
        textView:setText(string.subUtfStr(str,1,28));
        if flag == EditText.s_EX_CLOSE_DONE then
            self:onSendMessageBtnClick();
        end
    end
end

RadioSendLayer.__init = function(self)
    local inputText = self:findViewById(self.m_ctrl.inputText);
    inputText:setHintText("请在此输入文字(1-28字符)",215,171,127);
    inputText:setText();

    local radioMoney = BroadcastDataInterface.getInstance():getRadioMoney();
    self:findViewById(self.m_ctrl.radioSpendMoney):setText(string.format("%s银币",radioMoney));
    self.m_msgView = self:findViewById(self.m_ctrl.msgView);
end

RadioSendLayer.__refreshRadioMessageList = function(self)
    local redioMsgTab = BroadcastDataInterface.getInstance():getRadioMsgList();
    local overRedioMsgTab = BroadcastDataInterface.getInstance():getOverRadioMsgList();
    local sortRadioMessageList = {};

    for i=#redioMsgTab,1,-1 do
        table.insert(sortRadioMessageList, redioMsgTab[i]);
    end

    for i=#overRedioMsgTab,1,-1 do
        table.insert(sortRadioMessageList, overRedioMsgTab[i]);
    end

    table.sort(sortRadioMessageList, function(a, b)
        if a and b then
            return number.valueOf(a.send_time, 0) > number.valueOf(b.send_time, 0);
        else
            return true;
        end
    end);
    if not self.m_msgScrollView then
	    local w,h = self.m_msgView:getSize();
	    self.m_msgScrollView = UIFactory.createScrollView(0,0,w,h,true);
	    self.m_msgView:addChild(self.m_msgScrollView);
    end
    self.m_msgScrollView:removeAllChildren(true);
    if #sortRadioMessageList > 0 then
         self.m_msgView:setVisible(true);
         for k, v in ipairs(sortRadioMessageList) do
            local item = new(RadioListItem, v);
		    self.m_msgScrollView:addChild(item);
	     end
    else
        self.m_msgView:setVisible(false);
    end
end

RadioSendLayer.onSendRadioCallBack = function(self, isSuccess,info)   
    if isSuccess then
        Toast.getInstance():showText(kTextBroadcast, 50, 30, kAliginCenter, "", 30, 250, 210, 70);  
    else 
        local msg = info.errorTips or "";
        if msg ~= "" then 
            Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 30, 255, 255, 255);    
        end 
    end
end

RadioSendLayer.s_controlConfig = {
    [RadioSendLayer.s_controls.inputText] = {"bg", "topView", "inputBg", "inputText"},
    [RadioSendLayer.s_controls.sendMessageBtn] = {"bg", "topView", "sendMessageBtn"},
    [RadioSendLayer.s_controls.radioSpendMoney] = {"bg", "tipsView", "Image1", "tips"},
    [RadioSendLayer.s_controls.msgView] = {"bg", "msgView"},
    [RadioSendLayer.s_controls.closeBtn] = {"bg", "close"},
    [RadioSendLayer.s_controls.bg] = {"bg"},
    [RadioSendLayer.s_controls.sendMessageBtnText] = {"bg", "topView", "sendMessageBtn","Text5"},
    [RadioSendLayer.s_controls.inputBg] = {"bg", "topView", "inputBg"},
    [RadioSendLayer.s_controls.topView] = {"bg", "topView"},
}

RadioSendLayer.s_controlFuncMap = {
    [RadioSendLayer.s_controls.sendMessageBtn] = RadioSendLayer.onSendMessageBtnClick;
    [RadioSendLayer.s_controls.closeBtn] = RadioSendLayer.onCloseBtnClick;
    [RadioSendLayer.s_controls.inputText] =  RadioSendLayer.onRadioEditText,
}

return RadioSendLayer;



