require("common/popupWindow");
local match_hall_detail_help_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_detail_help_layout");

-- 比赛帮助界面
local GameMatchHallDetailHelpViewExit = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallDetailHelpViewExit.s_itemFontSize = 20;

GameMatchHallDetailHelpViewExit.s_controls = 
{
    contentBg = getIndex();
    contentView = getIndex();
};

GameMatchHallDetailHelpViewExit.Delegate = {
}


GameMatchHallDetailHelpViewExit.s_cmds = 
{

};


GameMatchHallDetailHelpViewExit.ctor = function(self, data)
    super(self, match_hall_detail_help_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onBgTouch)
    self:setEventDrag(self, self.onEmptyFunc);
    self:_initView();
    self:_initData(data);
    self:_showData();
end

GameMatchHallDetailHelpViewExit.dtor = function(self)
end

GameMatchHallDetailHelpViewExit.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallDetailHelpViewExit.show = function(self)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;
end

GameMatchHallDetailHelpViewExit.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end
end

GameMatchHallDetailHelpViewExit.setContentPos = function(self, x, y)
    local w, h = self.m_contentBg:getSize();
    self.m_contentBg:setAlign(kAlignTopLeft);
    self.m_contentBg:setPos(x - w/2, y - h);
end

GameMatchHallDetailHelpViewExit.onEmptyFunc = function(self)
end

GameMatchHallDetailHelpViewExit.onBgTouch = function(self, action)
    if action == kFingerUp then
        self:_closeView();
    end
end

GameMatchHallDetailHelpViewExit._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallDetailHelpViewExit._initData = function(self, data)
    self.m_data = data;
end

GameMatchHallDetailHelpViewExit._showData = function(self)
    local data = self.m_data;

    local text = new(Text, "退赛返还全额报名费", 1, 1, kAlignCenter, nil, GameMatchHallDetailHelpViewExit.s_itemFontSize, 255, 255, 255);
    text:setAlign(kAlignCenter);
    self.m_contentView:addChild(text);
end

GameMatchHallDetailHelpViewExit._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
end

--------------------------------------------------------------------------------
GameMatchHallDetailHelpViewExit.s_controlConfig =
{   
    [GameMatchHallDetailHelpViewExit.s_controls.contentBg] = {"contentBg"};
    [GameMatchHallDetailHelpViewExit.s_controls.contentView] = {"contentBg", "contentView"};
};

GameMatchHallDetailHelpViewExit.s_controlFuncMap =
{
};

GameMatchHallDetailHelpViewExit.s_cmdConfig =
{
};

return GameMatchHallDetailHelpViewExit;