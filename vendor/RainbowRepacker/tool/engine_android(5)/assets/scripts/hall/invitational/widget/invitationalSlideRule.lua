require("common/commonGameLayer")
local invitational_create_slide_rule = require(ViewPath .. "hall/invitational/invitational_create_slide_rule")

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--创建邀请赛滑出比赛规则
local InvitationalSlideRule = class(hallLayerBaseWithName, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideRule.s_controls = {
    contentView = getIndex(),
    content = getIndex(),
    tips = getIndex(),
}

InvitationalSlideRule.Delegate = {
    onInvitationalSlidRuleClose = "onInvitationalSlidRuleClose";
}


InvitationalSlideRule.s_itemFontSize = 24
InvitationalSlideRule.s_titleConfig = {"规则：", "预赛：", "决赛："}

InvitationalSlideRule.ctor = function(self, showType, data)
    super(self, invitational_create_slide_rule, nil, "InvitationalSlideRule")
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrls = InvitationalSlideRule.s_controls
    self.m_data = data
    self:initView(self.m_data)
    self:setListenBackEvent(true);
    
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.contentView));
end

InvitationalSlideRule.dtor = function(self)
    self:execDelegate(InvitationalSlideRule.Delegate.onInvitationalSlidRuleClose);
end


InvitationalSlideRule.initView = function(self, data)
    self.m_tips = self:findViewById(self.m_ctrls.tips)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_content = self:findViewById(self.m_ctrls.content)
    if table.isEmpty(data) then
        self.m_tips:setVisible(true)
        return
    end
    self.m_tips:setVisible(false)

    local data = {data.rules, data.prepare, data.finals}
    if self.m_scrollView then
        self.m_scrollView:removeAllChildren(true)
        self.m_content:removeChild(self.m_scrollView, true)
    end
    local w,h = self.m_content:getSize()
    self.m_scrollView = UIFactory.createScrollView(0,0,w,h,true)
    self.m_content:addChild(self.m_scrollView)  
    
    local height = 0
    for i,v in ipairs(data) do
        local text = new(Text, InvitationalSlideRule.s_titleConfig[i], nil, nil, nil, nil, InvitationalSlideRule.s_itemFontSize, 226, 85, 0)
        self.m_scrollView:addChild(text)
        text:setPos(nil, height)
        text:setAlign(kAlignTopLeft)
        height = height + 34
        local view = new(TextView, v, w, 0, kAlignTopLeft, nil, InvitationalSlideRule.s_itemFontSize, 139, 106, 64)
        self.m_scrollView:addChild(view)
        view:setPos(nil, height)
        local _,viewH = view:getSize()
        height = height + viewH + 50
    end
    self.m_scrollView:setNodeWidthHeight(nil, height)
    self.m_scrollView:update()
end

InvitationalSlideRule.s_controlConfig = {
    [InvitationalSlideRule.s_controls.contentView] = {"contentView"},
    [InvitationalSlideRule.s_controls.content] = {"contentView", "bg", "content"},
    [InvitationalSlideRule.s_controls.tips] = {"contentView", "bg", "tips"},
}

InvitationalSlideRule.s_controlFuncMap = {
}

return InvitationalSlideRule