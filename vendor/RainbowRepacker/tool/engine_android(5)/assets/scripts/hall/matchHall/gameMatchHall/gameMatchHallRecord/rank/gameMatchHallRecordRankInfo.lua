require("common/popupWindow");
local match_hall_record_info_rank_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_info_rank_layout");
local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin");

-- 好友排行信息弹框
local GameMatchHallRecordRankInfo = class(PopupWindow, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordRankInfo.s_controls = 
{
    contentView = getIndex(),
    contentBg = getIndex(),
    textPlay = getIndex(),
    textLevel = getIndex(),
    textScore = getIndex(),

    advanceFinalsCount = getIndex(),
    advanceCircleCount = getIndex(),
    winCount = getIndex(),
};

GameMatchHallRecordRankInfo.Delegate = {
    
}


GameMatchHallRecordRankInfo.s_cmds = 
{

};


GameMatchHallRecordRankInfo.ctor = function(self)
    super(self, match_hall_record_info_rank_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onBgTouch);
    self:setEventDrag(self, function() end)
    self:_initView();
    self:addToRoot();

    MatchRecordDataInterface.getInstance():setObserver(self);
end

GameMatchHallRecordRankInfo.dtor = function(self)
    MatchRecordDataInterface.getInstance():clearObserver(self);
end

GameMatchHallRecordRankInfo.isShowing = function(self)
    return self.m_isShowing;
end

GameMatchHallRecordRankInfo.show = function(self, data)
    PopupWindow.show(self, PopupWindowStyle.NORMAL);

    self.m_isShowing = true;

    self:_resetView();
    self:_initData(data);
    self:_showData();
end

GameMatchHallRecordRankInfo.hidden = function(self)
    if self.m_isShowing then
        self.m_isShowing = false;
        PopupWindow.hidden(self, PopupWindowStyle.NORMAL);
    end
end

GameMatchHallRecordRankInfo.setContentPos = function(self, x, y, delta)
    local contentView = self:findViewById(self.s_controls.contentView);
    local contentBg = self:findViewById(self.s_controls.contentBg);
    local sHeight = System.getScreenScaleHeight();

    local w, h = contentView:getSize();
    contentView:setAlign(kAlignTopLeft);

    local isShowUp = (y + delta + h) > sHeight;
    
    local viewX = x - w / 2;
    local viewY = isShowUp and (y - h - delta) or (y + delta);
    contentView:setPos(viewX, viewY);

    local file = isShowUp and match_record_pin_map["popup_bg_up.png"] or match_record_pin_map["popup_bg_down.png"]
    local align = isShowUp and kAlignTop or kAlignBottom;
    contentBg:setFile(file);
    contentBg:setAlign(align)
end

GameMatchHallRecordRankInfo.onBgTouch = function(self, finger_action, x, y, drawing_id_first,drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:_closeView();
    end
end

-- interface callback
GameMatchHallRecordRankInfo.onGetMatchRecordStatistics = function(self, data, mid)
    if mid ~= self.m_data.mid then
        return;
    end

    Log.d("GameMatchHallRecordRankInfo.onGetMatchRecordStatistics", "mid", mid);

    self:findViewById(self.s_controls.advanceFinalsCount):setText(tostring(data.finals_total or 0));
    self:findViewById(self.s_controls.advanceCircleCount):setText(tostring(data.awards_total or 0));
    self:findViewById(self.s_controls.winCount):setText(tostring(data.champion_total or 0));

    if not string.isEmpty(data.favorite_match) then
        self.m_textPlay:setText(string.format("最近常玩 %s", data.favorite_match));
    else
        self.m_textPlay:setText("暂无参赛记录");
    end
end

--------------------------------------------------------------------------------------
GameMatchHallRecordRankInfo._closeView = function(self)
    EventDispatcher.getInstance():dispatch(kClosePopupWindows);
end

GameMatchHallRecordRankInfo._initData = function(self, data)
	self.m_data = data;

    -- 请求比赛统计数据
    MatchRecordDataInterface.getInstance():getMatchRecordStatistics(self.m_data.mid);
end

GameMatchHallRecordRankInfo._showData = function(self)
    local data = self.m_data;
    
    self.m_textLevel:setText(string.format("等级：Lv.%s", data.level));
    self.m_textScore:setText(string.format("大师分：%s", data.masterpoints));
end

GameMatchHallRecordRankInfo._initView = function(self)
    self.m_textPlay = self:findViewById(self.s_controls.textPlay);
    self.m_textLevel = self:findViewById(self.s_controls.textLevel);
    self.m_textScore = self:findViewById(self.s_controls.textScore);
end

GameMatchHallRecordRankInfo._resetView = function(self)
    self:findViewById(self.s_controls.advanceFinalsCount):setText("");
    self:findViewById(self.s_controls.advanceCircleCount):setText("");
    self:findViewById(self.s_controls.winCount):setText("");
    self.m_textPlay:setText("");
end
--------------------------------------------------------------------------------
GameMatchHallRecordRankInfo.s_controlConfig =
{   
    [GameMatchHallRecordRankInfo.s_controls.contentView] = {"contentView"};
    [GameMatchHallRecordRankInfo.s_controls.contentBg] = {"contentView", "contentBg"};
    [GameMatchHallRecordRankInfo.s_controls.textPlay] = {"contentView", "textPlay"};
    [GameMatchHallRecordRankInfo.s_controls.textLevel] = {"contentView", "textLevel"};
    [GameMatchHallRecordRankInfo.s_controls.textScore] = {"contentView", "textScore"};
    [GameMatchHallRecordRankInfo.s_controls.advanceFinalsCount] = {"contentView", "statisticsView", "statisticsCenterView", "text"};
    [GameMatchHallRecordRankInfo.s_controls.advanceCircleCount] = {"contentView", "statisticsView", "statisticsLeftView", "text"};
    [GameMatchHallRecordRankInfo.s_controls.winCount] = {"contentView", "statisticsView", "statisticsRightView", "text"};
};

GameMatchHallRecordRankInfo.s_controlFuncMap =
{
};

GameMatchHallRecordRankInfo.s_cmdConfig =
{
};

return GameMatchHallRecordRankInfo;