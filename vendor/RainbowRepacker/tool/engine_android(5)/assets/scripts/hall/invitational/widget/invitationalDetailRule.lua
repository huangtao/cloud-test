require("common/popupWindow");
local invitational_detail_rule = require(ViewPath .. "hall/invitational/invitational_detail_rule");

-- 邀请赛详情比赛规则
local InvitationalDetailRule = class(PopupWindow, false);

InvitationalDetailRule.s_itemFontSize = 28;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

InvitationalDetailRule.s_controls = 
{
    contentBg = getIndex();
    contentView = getIndex();
    returnBtn = getIndex();
};

InvitationalDetailRule.Delegate = {
    onDetailRuleShowCallback = "onDetailRuleShowCallback";
    onDetailRuleCloseCallback = "onDetailRuleCloseCallback";
}


InvitationalDetailRule.s_cmds = 
{

};

InvitationalDetailRule.s_itemFontSize = 24
InvitationalDetailRule.s_titleConfig = {"规则：", "预赛：", "决赛："}

InvitationalDetailRule.ctor = function(self, data)
    super(self, invitational_detail_rule);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:_initView();
    self:_initData(data);
    self:_showData();
end

InvitationalDetailRule.dtor = function(self)
end

InvitationalDetailRule.isShowing = function(self)
    return self.m_isShowing;
end

InvitationalDetailRule.show = function(self)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:execDelegate(InvitationalDetailRule.Delegate.onDetailRuleShowCallback);
end

InvitationalDetailRule.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end

    self:execDelegate(InvitationalDetailRule.Delegate.onDetailRuleCloseCallback);
end

InvitationalDetailRule.onReturnBtnClick = function(self)
    self:_closeView();
end

InvitationalDetailRule._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

InvitationalDetailRule._initData = function(self, data)
	self.m_data = data;
end

InvitationalDetailRule._showData = function(self)
    self:showContent()
end

InvitationalDetailRule._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
end

InvitationalDetailRule.showContent = function(self)
    if not self.m_data.rules or not self.m_data.prepare or not self.m_data.finals then
        return
    end
    local data = {self.m_data.rules, self.m_data.prepare, self.m_data.finals}
    if self.m_scrollView then
        delete(self.m_scrollView)
        self.m_scrollView = nil
    end
    local w,h = self.m_contentView:getSize()
    self.m_scrollView = UIFactory.createScrollView(0,0,w,h,true)
    self.m_contentView:addChild(self.m_scrollView)  
    
    local height = 0
    for i,v in ipairs(data) do
        local text = new(Text, InvitationalDetailRule.s_titleConfig[i], nil, nil, nil, nil, InvitationalDetailRule.s_itemFontSize, 226, 85, 0)
        self.m_scrollView:addChild(text)
        text:setPos(nil, height)
        text:setAlign(kAlignTopLeft)
        height = height + 34
        local view = new(TextView, v, w, 0, kAlignTopLeft, nil, InvitationalDetailRule.s_itemFontSize, 139, 106, 64)
        self.m_scrollView:addChild(view)
        view:setPos(nil, height)
        local _,viewH = view:getSize()
        height = height + viewH + 50
    end
    self.m_scrollView:setNodeWidthHeight(nil, height)
    self.m_scrollView:update()
end

--------------------------------------------------------------------------------
InvitationalDetailRule.s_controlConfig =
{   
    [InvitationalDetailRule.s_controls.contentBg] = {"contentBg"};
    [InvitationalDetailRule.s_controls.contentView] = {"contentBg", "contentView"};
    [InvitationalDetailRule.s_controls.returnBtn] = {"contentBg", "returnBtn"};
};

InvitationalDetailRule.s_controlFuncMap =
{
    [InvitationalDetailRule.s_controls.returnBtn] = InvitationalDetailRule.onReturnBtnClick;
};

InvitationalDetailRule.s_cmdConfig =
{
};

return InvitationalDetailRule;