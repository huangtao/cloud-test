require("common/commonGameLayer")
local invitational_create_slide_keyboard = require(ViewPath .. "hall/invitational/invitational_create_slide_keyboard")
local invitational_keyboard_slide = require(ViewPath .. "hall/invitational/invitational_keyboard_slide")
local InvitationalKeyboardLayer = require("hall/invitational/widget/invitationalKeyboardLayer")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--创建邀请赛滑出键盘
local InvitationalSlideKeyboard = class(hallLayerBaseWithName, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideKeyboard.s_controls = {
    contentView = getIndex(),
    content = getIndex(),
}


InvitationalSlideKeyboard.ctor = function(self, showType, data, obj, callback)
    super(self, invitational_create_slide_keyboard, nil, "InvitationalSlideKeyboard")
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrls = InvitationalSlideKeyboard.s_controls
    self.m_operating_data = ""
    self.m_data = data
    self:initView()
    self:setListenBackEvent(true);
    
    self.m_obj = obj;
    self.m_callback = callback;

    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.contentView));
end

InvitationalSlideKeyboard.dtor = function(self)
    if self.m_obj and self.m_callback then
        self.m_callback(self.m_obj, self.m_operating_data);
    end
end

InvitationalSlideKeyboard.initView = function(self)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_content = self:findViewById(self.m_ctrls.content)
    if not self.m_keyboard then
        self.m_keyboard = new(InvitationalKeyboardLayer, invitational_keyboard_slide)
        self.m_keyboard:setDelegate(self)
        self.m_content:addChild(self.m_keyboard)
    end
    Log.v("InvitationalSlideKeyboard.initView",self.m_content:getSize(),",",self.m_keyboard:getSize())
end

InvitationalSlideKeyboard.onInputNumberCallback = function(self, number)
    self.m_operating_data = string.format("%.4d", number)
    self:close()
end

InvitationalSlideKeyboard.s_controlConfig = {
    [InvitationalSlideKeyboard.s_controls.contentView] = {"contentView"},
    [InvitationalSlideKeyboard.s_controls.content] = {"contentView", "content"},
}

InvitationalSlideKeyboard.s_controlFuncMap = {
}

return InvitationalSlideKeyboard