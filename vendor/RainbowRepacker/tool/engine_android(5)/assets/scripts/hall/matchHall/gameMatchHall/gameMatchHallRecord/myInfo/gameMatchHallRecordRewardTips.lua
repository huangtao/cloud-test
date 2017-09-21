require("common/popupWindow");
local match_hall_record_reward_tips_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_reward_tips_layout");

-- 战绩奖励提示
local GameMatchHallRecordRewardTips = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordRewardTips.s_controls = 
{
    contentBg = getIndex();
    textView = getIndex();
};

GameMatchHallRecordRewardTips.Delegate = {
}


GameMatchHallRecordRewardTips.s_cmds = 
{

};


GameMatchHallRecordRewardTips.ctor = function(self)
    super(self, match_hall_record_reward_tips_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onBgTouch)
    self:setEventDrag(self, self.onEmptyFunc);
    self:_initView();

    self:addToRoot();
end

GameMatchHallRecordRewardTips.dtor = function(self)
end

GameMatchHallRecordRewardTips.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallRecordRewardTips.show = function(self, data)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:_initData(data);
    self:_resetView();
    self:_showData();
end

GameMatchHallRecordRewardTips.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end
end

GameMatchHallRecordRewardTips.setContentPos = function(self, x, y)
    local w, h = self.m_contentBg:getSize();
    self.m_contentBg:setAlign(kAlignTopLeft);
    self.m_contentBg:setPos(x - 0.2 * w, y - h);
end

GameMatchHallRecordRewardTips.onEmptyFunc = function(self)
end

GameMatchHallRecordRewardTips.onBgTouch = function(self, action)
    if action == kFingerUp then
        self:_closeView();
    end
end

-------------------------------------------------------------------------
GameMatchHallRecordRewardTips._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallRecordRewardTips._initData = function(self, data)
    self.m_data = data;
end

GameMatchHallRecordRewardTips._showData = function(self)
    local data = self.m_data;

    self.m_textView:setText(data.desc);

    self:_checkContentSize();
end

GameMatchHallRecordRewardTips._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
    self.m_textView = self:findViewById(self.s_controls.textView);
end

GameMatchHallRecordRewardTips._resetView = function(self)
    self.m_textView:setText("", nil, 1);
end

GameMatchHallRecordRewardTips._checkContentSize = function(self)
    if self.m_textView.m_res and self.m_contentBg.m_res then
        local textH = self.m_textView.m_res:getHeight();
        self.m_textView:setSize(nil, textH);
        local contentH = self.m_contentBg.m_res:getHeight();
        local h = (textH + 32) > contentH and (textH + 32) or contentH;
        self.m_contentBg:setSize(nil, h);
    end
end

--------------------------------------------------------------------------------
GameMatchHallRecordRewardTips.s_controlConfig =
{   
    [GameMatchHallRecordRewardTips.s_controls.contentBg] = {"contentBg"};
    [GameMatchHallRecordRewardTips.s_controls.textView] = {"contentBg", "textView"};
};

GameMatchHallRecordRewardTips.s_controlFuncMap =
{
};

GameMatchHallRecordRewardTips.s_cmdConfig =
{
};

return GameMatchHallRecordRewardTips;