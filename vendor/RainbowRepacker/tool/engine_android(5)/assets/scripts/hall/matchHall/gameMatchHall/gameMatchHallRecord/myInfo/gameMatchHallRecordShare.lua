require("common/popupWindow");
local match_hall_record_share_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_share_layout");

-- 比赛战绩分享弹框
local GameMatchHallRecordShare = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordShare.s_controls = 
{
    contentBg = getIndex(),
    momentBtn = getIndex(),
    wechatBtn = getIndex(),
    gameBtn = getIndex(),
};

GameMatchHallRecordShare.Delegate = {
}


GameMatchHallRecordShare.s_cmds = 
{

};


GameMatchHallRecordShare.ctor = function(self, data)
    super(self, match_hall_record_share_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onBgTouch);
    self:setEventDrag(self, function() end)
    self:_initView();
    self:_initData(data);
    self:_showData();

    self:addToRoot();
end

GameMatchHallRecordShare.dtor = function(self)
end

GameMatchHallRecordShare.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallRecordShare.show = function(self)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;
end

GameMatchHallRecordShare.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end
end

GameMatchHallRecordShare.setContentPos = function(self, x, y)
    self.m_contentBg:setAlign(kAlignTopLeft);
    self.m_contentBg:setPos(x, y);
end

GameMatchHallRecordShare.onMomentBtnClick = function(self)
    
end

GameMatchHallRecordShare.onWechatBtnClick = function(self)
    
end

GameMatchHallRecordShare.onGameBtnClick = function(self)
    
end

GameMatchHallRecordShare.onBgTouch = function(self, finger_action, x, y, drawing_id_first,drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:_closeView();
    end
end

-------------------------------------------------------------------------
GameMatchHallRecordShare._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallRecordShare._initData = function(self, data)
	self.m_data = data;
end

GameMatchHallRecordShare._showData = function(self)
    local data = self.m_data;
    
end

GameMatchHallRecordShare._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
end

--------------------------------------------------------------------------------
GameMatchHallRecordShare.s_controlConfig =
{   
    [GameMatchHallRecordShare.s_controls.contentBg] = {"contentBg"};
    [GameMatchHallRecordShare.s_controls.momentBtn] = {"contentBg", "momentBtn"};
    [GameMatchHallRecordShare.s_controls.wechatBtn] = {"contentBg", "wechatBtn"};
    [GameMatchHallRecordShare.s_controls.gameBtn] = {"contentBg", "gameBtn"};
};

GameMatchHallRecordShare.s_controlFuncMap =
{
    [GameMatchHallRecordShare.s_controls.momentBtn] = GameMatchHallRecordShare.onMomentBtnClick;
    [GameMatchHallRecordShare.s_controls.wechatBtn] = GameMatchHallRecordShare.onWechatBtnClick;
    [GameMatchHallRecordShare.s_controls.gameBtn] = GameMatchHallRecordShare.onGameBtnClick;
};

GameMatchHallRecordShare.s_cmdConfig =
{
};

return GameMatchHallRecordShare;