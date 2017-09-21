require("ui/node");
local match_hall_record_item_history_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_item_history_layout");
require("hall/matchHall/gameMatchHall/data/matchRecordDataInterface");
-- 历史战绩
local GameMatchHallRecordMatchItem = class(Node);

-- 箭头状态：右，下，上
GameMatchHallRecordMatchItem.STATUS_ARROW_RIGHT = 1;
GameMatchHallRecordMatchItem.STATUS_ARROW_DOWN = 2;
GameMatchHallRecordMatchItem.STATUS_ARROW_UP = 3;

GameMatchHallRecordMatchItem.s_defaultWidth = 300;
GameMatchHallRecordMatchItem.s_defaultHeight = 300;

GameMatchHallRecordMatchItem.setDefaultSize = function(width, height)
    GameMatchHallRecordMatchItem.s_defaultWidth = width or 300;
    GameMatchHallRecordMatchItem.s_defaultHeight = height or 300;
end

GameMatchHallRecordMatchItem.setOnItemClick = function(obj, func)
    GameMatchHallRecordMatchItem.s_callbackObj = obj;
    GameMatchHallRecordMatchItem.s_callbackFunc = func;
end

GameMatchHallRecordMatchItem.ctor = function(self, data)
    local view = SceneLoader.load(match_hall_record_item_history_layout);
    view:setAlign(kAlignCenter);
    view:setFillParent(false, true);
    self:addChild(view);
    self:setSize(GameMatchHallRecordMatchItem.s_defaultWidth, GameMatchHallRecordMatchItem.s_defaultHeight);
    self:setEventTouch(self, self.onItemClick);

    self.m_view = view;
    self.m_data = data;

    self:initView();
end

GameMatchHallRecordMatchItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

GameMatchHallRecordMatchItem.updateListItem = function (self, data)
    self.m_data = data;
    self:initView();
end

GameMatchHallRecordMatchItem.removeData = function(self)
    self:setVisible(false);
end

GameMatchHallRecordMatchItem.onItemClick = function(self, finger_action, x, y)
    if finger_action == kFingerDown then
        self.m_moving = false;
        self.m_startY = y;
    elseif finger_action == kFingerMove then
        if math.abs(y - self.m_startY) > 100 then
            self.m_moving = true;
        end
    elseif finger_action == kFingerUp then
        if not self.m_moving and GameMatchHallRecordMatchItem.s_callbackObj and GameMatchHallRecordMatchItem.s_callbackFunc then
            GameMatchHallRecordMatchItem.s_callbackFunc(GameMatchHallRecordMatchItem.s_callbackObj, self.m_data, self);
        end
    end
end

-- match info view callback
GameMatchHallRecordMatchItem.onMatchInfoShowCallback = function(self, view, isShowUp)
    if isShowUp then
        self:_setArrowStatus(GameMatchHallRecordMatchItem.STATUS_ARROW_UP);
    else
        self:_setArrowStatus(GameMatchHallRecordMatchItem.STATUS_ARROW_DOWN);
    end
end

-- match info view callback
GameMatchHallRecordMatchItem.onMatchInfoCloseCallback = function(self)
    self:_setArrowStatus(GameMatchHallRecordMatchItem.STATUS_ARROW_RIGHT);
end

---------------------------------------------------------------------------------------
GameMatchHallRecordMatchItem.initView = function(self)
    local data = self.m_data;

    local time = self.m_view:getChildByName("time");
    local name = self.m_view:getChildByName("name");
    local rank = self.m_view:getChildByName("rank");

    local timeStr = MatchRecordDataInterface.getInstance():getTimeStringWithTime(data.playtime);
    time:setText(timeStr);
    name:setText(data.matchname);
    rank:setText(string.format("第%s名", data.rank));

    self:_setArrowStatus(GameMatchHallRecordMatchItem.STATUS_ARROW_RIGHT);
end

GameMatchHallRecordMatchItem._setArrowStatus = function(self, state)
    local arrowRight = self.m_view:getChildByName("arrowRight");
    local arrowDown = self.m_view:getChildByName("arrowDown");
    local arrowUp = self.m_view:getChildByName("arrowUp");

    arrowDown:setVisible(false);
    arrowRight:setVisible(false);
    arrowUp:setVisible(false);

    if state == GameMatchHallRecordMatchItem.STATUS_ARROW_RIGHT then
        arrowRight:setVisible(true);
    elseif state == GameMatchHallRecordMatchItem.STATUS_ARROW_DOWN then
        arrowDown:setVisible(true);
    elseif state == GameMatchHallRecordMatchItem.STATUS_ARROW_UP then
        arrowUp:setVisible(true);
    end
end

return GameMatchHallRecordMatchItem;