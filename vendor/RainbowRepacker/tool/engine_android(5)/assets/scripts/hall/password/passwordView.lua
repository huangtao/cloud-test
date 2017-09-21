require("common/IBaseDialog");
require("uilibs/richText");
local passwordViewLayout = require(ViewPath .. "hall/password/passwordViewLayout");

-- 口令弹框
local PasswordView = class(IBaseDialog, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

PasswordView.s_controls = 
{
    closeBtn = getIndex(),
    title = getIndex(),
    message = getIndex(),
    infoView = getIndex(),
    tips = getIndex(),
    confirmBtn = getIndex(),
    emptyTips = getIndex(),
};

PasswordView.Delegate = {
    
}


PasswordView.s_cmds = 
{

};

PasswordView.showDialog = function(data, sourceType)
    PasswordView.instance = new(PasswordView, data, sourceType);
    IBaseDialog.hideAll();
    IBaseDialog.pushDialog(PasswordView.instance);
end

PasswordView.hideDialog = function()
	IBaseDialog.hideAll();
end

PasswordView.ctor = function(self, data, sourceType)   
    super(self, passwordViewLayout, "PasswordView", 999);
    self:setAlign(kAlignCenter);
    self.m_root:setVisible(false);
    
    self:_initData(data, sourceType);
    if self.m_isVersionSupported and self:_isShowContent() then
        self:setFillParent(true, true);
        self:setEventTouch(self, self.onEmptyFunc)
        self:setEventDrag(self, self.onEmptyFunc);
        self:_initView();
        self:_showData();
        self.m_root:setVisible(true);
    end
end

PasswordView.dtor = function(self)
    if self.m_isVersionSupported then
        self:_typeObjectClose();
    end

    PasswordView.instance = nil;
end

PasswordView.onShow = function(self)
    self:_typeObjectVersion();

    if self.m_isVersionSupported then
        self:_typeObjectShow();
    else
        self:hideDialog();
    end
end

PasswordView.onCloseBtnClick = function(self)
    self:hideDialog();
end

PasswordView.onConfirmBtnClick = function(self)
    self:_typeObjectConfirm();
end

PasswordView.onExecuteConfirmCallback = function(self)
    self:hideDialog();
end

PasswordView.onEmptyFunc = function(self)
end

-----------------------------------------------------------------------------------
PasswordView._initData = function(self, data, sourceType)
    self.m_data = data;
    self.m_sourceType = sourceType;
    self.m_typeObject = PasswordDataInterface.getInstance():getPasswordTypeObjectAndInitData(data);
    self.m_isVersionSupported = self:_isVersionSupported();
end

PasswordView._initView = function(self)
    self.m_title = self:findViewById(self.s_controls.title);
	self.m_message = self:findViewById(self.s_controls.message);
	self.m_infoView = self:findViewById(self.s_controls.infoView);
	self.m_tips = self:findViewById(self.s_controls.tips);
	self.m_emptyTips = self:findViewById(self.s_controls.emptyTips);
	self.m_confirmBtn = self:findViewById(self.s_controls.confirmBtn);
	self.m_confirmBtn:setVisible(false);
end

PasswordView._showData = function(self)
    local typeObj = self.m_typeObject;

    local title = typeObj:getTitle();
    if title then
        self.m_title:setText(title);
        self.m_title:setVisible(true);
    else
        self.m_title:setVisible(false);
    end
    
    local btnText = typeObj:getBtnText();
    if btnText then
        self:_setConfirmBtnText(btnText);
        self.m_confirmBtn:setVisible(true);
    else
        self.m_confirmBtn:setVisible(false);
    end

    local message = typeObj:getMessage();
    if message then
        self.m_message:setText(message);
        self.m_emptyTips:setVisible(false);
    else
        self.m_emptyTips:setVisible(true);
    end

    local info = typeObj:getInfo();
    if info then
        self.m_infoView:removeAllChildren(true);
        local richText = new(RichText, info, 1, 1, kAlignLeft, nil, 26);
        richText:setAlign(kAlignLeft);
        self.m_infoView:addChild(richText);
    end

    local tips = typeObj:getTips();
    if tips then
        self.m_tips:setText(tips);
        self.m_tips:setVisible(true);
    else
        self.m_tips:setVisible(false);
    end
end

PasswordView._isShowContent = function(self)
    local passwordType = tonumber(self.m_data.type) or 0;
    local viewType = PasswordConstants.viewConfig[passwordType];
    return viewType == PasswordConstants.TYPE_VIEW_WITH_CONTENT;
end

PasswordView._isVersionSupported = function(self)
    local dataType = number.valueOf(self.m_data.type)
    local dataVersion = number.valueOf(self.m_data.version);
    local localVersion = PasswordConstants.versionConfig[dataType] or 0;
    return dataVersion <= localVersion;
end

-----------------------------------------------------------------------------------
PasswordView._setConfirmBtnText = function(self, text)
    local btnText = self.m_confirmBtn:getChildByName("text");
    btnText:setText(tostring(text) or "", 1);
end

PasswordView._typeObjectVersion = function(self)
    local typeObj = self.m_typeObject;
    if typeObj.showVersion then
        typeObj:showVersion(self.m_isVersionSupported);
    end
end

PasswordView._typeObjectShow = function(self)
    local typeObj = self.m_typeObject;
    if typeObj.executeOnShow then
        typeObj:executeOnShow(self, self.onCloseBtnClick, self.m_sourceType);
    end
end

PasswordView._typeObjectConfirm = function(self)
    local typeObj = self.m_typeObject;
    if typeObj.executeOnConfirm then
        typeObj:executeOnConfirm(self, self.onExecuteConfirmCallback, self.m_sourceType);
    end
end

PasswordView._typeObjectClose = function(self)
    local typeObj = self.m_typeObject;
    if typeObj.executeOnClose then
        typeObj:executeOnClose();
    end
end

--------------------------------------------------------------------------------
PasswordView.s_controlConfig =
{   
    [PasswordView.s_controls.closeBtn] = {"content", "closeBtn"};
    [PasswordView.s_controls.title] = {"content", "titleBg", "title"};
    [PasswordView.s_controls.message] = {"content", "center", "message"};
    [PasswordView.s_controls.infoView] = {"content", "center", "infoView"};
    [PasswordView.s_controls.tips] = {"content", "center", "tips"};
    [PasswordView.s_controls.confirmBtn] = {"content", "confirmBtn"};
    [PasswordView.s_controls.emptyTips] = {"content", "center", "emptyTips"};
};

PasswordView.s_controlFuncMap =
{
    [PasswordView.s_controls.closeBtn] = PasswordView.onCloseBtnClick;
    [PasswordView.s_controls.confirmBtn] = PasswordView.onConfirmBtnClick;
};

PasswordView.s_cmdConfig =
{
};

return PasswordView;
