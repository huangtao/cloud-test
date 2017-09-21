require("common/popupWindow");
local match_hall_detail_popup_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_detail_popup_layout");

-- 比赛规则
local GameMatchHallDetailRule = class(PopupWindow, false);

GameMatchHallDetailRule.s_itemFontSize = 28;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallDetailRule.s_controls = 
{
    contentBg = getIndex();
    contentView = getIndex();
    returnBtn = getIndex();
};

GameMatchHallDetailRule.Delegate = {
    onDetailRuleShowCallback = "onDetailRuleShowCallback";
    onDetailRuleCloseCallback = "onDetailRuleCloseCallback";
}


GameMatchHallDetailRule.s_cmds = 
{

};


GameMatchHallDetailRule.ctor = function(self, data)
    super(self, match_hall_detail_popup_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:_initView();
    self:_initData(data);
    self:_showData();
end

GameMatchHallDetailRule.dtor = function(self)
end

GameMatchHallDetailRule.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallDetailRule.show = function(self)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:execDelegate(GameMatchHallDetailRule.Delegate.onDetailRuleShowCallback);
end

GameMatchHallDetailRule.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end

    self:execDelegate(GameMatchHallDetailRule.Delegate.onDetailRuleCloseCallback);
end

GameMatchHallDetailRule.onReturnBtnClick = function(self)
    self:_closeView();
end

GameMatchHallDetailRule._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallDetailRule._initData = function(self, data)
	self.m_data = data;
end

GameMatchHallDetailRule._showData = function(self)
    self:showContent(self.m_data)
end

GameMatchHallDetailRule._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
end

GameMatchHallDetailRule.showContent = function(self, data)
	data = data or ""
    if self.m_scrollView then
        self.m_scrollView:removeAllChildren(true)
        self.m_contentView:removeChild(self.m_scrollView, true)
    end
    local w,h = self.m_contentView:getSize()
    self.m_scrollView = UIFactory.createScrollView(0,0,w,h,true)
    self.m_contentView:addChild(self.m_scrollView)  
    
    local height = 0
    local tab = string.split(data, "\n%s*\n")
    for i,v in ipairs(tab) do
        local view = new(TextView, v, w, 0, kAlignTopLeft, nil, GameMatchHallDetailRule.s_itemFontSize, 236, 217, 183)
        self.m_scrollView:addChild(view)
        view:setPos(nil, height)
        local _,viewH = view:getSize()
        height = height + viewH
        if i ~= #tab then
            height = height + 50
            local line = new(Image, "hall/matchHall/rule_line.png")
            self.m_scrollView:addChild(line)
            line:setPos(nil, (height - 25))
        end
    end
    self.m_scrollView:setNodeWidthHeight(nil, height)
    self.m_scrollView:update()
end

--------------------------------------------------------------------------------
GameMatchHallDetailRule.s_controlConfig =
{   
    [GameMatchHallDetailRule.s_controls.contentBg] = {"contentBg"};
    [GameMatchHallDetailRule.s_controls.contentView] = {"contentBg", "contentView"};
    [GameMatchHallDetailRule.s_controls.returnBtn] = {"contentBg", "returnBtn"};
};

GameMatchHallDetailRule.s_controlFuncMap =
{
    [GameMatchHallDetailRule.s_controls.returnBtn] = GameMatchHallDetailRule.onReturnBtnClick;
};

GameMatchHallDetailRule.s_cmdConfig =
{
};

return GameMatchHallDetailRule;