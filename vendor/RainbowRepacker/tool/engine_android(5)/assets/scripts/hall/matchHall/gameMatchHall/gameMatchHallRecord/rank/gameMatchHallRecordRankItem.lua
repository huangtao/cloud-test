require("ui/node");
local match_hall_record_item_rank_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_item_rank_layout");
require("uilibs/userMoneyItem");
local ranklist_pin_map = require("qnFiles/qnPlist/hall/ranklist_pin");

-- 好友排行
local GameMatchHallRecordRankItem = class(Node);

GameMatchHallRecordRankItem.s_defaultWidth = 300;
GameMatchHallRecordRankItem.s_defaultHeight = 300;

GameMatchHallRecordRankItem.setDefaultSize = function(width, height)
    GameMatchHallRecordRankItem.s_defaultWidth = width or 300;
    GameMatchHallRecordRankItem.s_defaultHeight = height or 300;
end

GameMatchHallRecordRankItem.setOnItemClick = function(obj, func)
    GameMatchHallRecordRankItem.s_callbackObj = obj;
    GameMatchHallRecordRankItem.s_callbackFunc = func;
end


GameMatchHallRecordRankItem.ctor = function(self, data)
    local view = SceneLoader.load(match_hall_record_item_rank_layout);
    view:setAlign(kAlignCenter);
    view:setFillParent(false, true);
    self:addChild(view);
    self:setSize(GameMatchHallRecordRankItem.s_defaultWidth, GameMatchHallRecordRankItem.s_defaultHeight);
    self:setEventTouch(self, self.onItemClick);
    self.m_view = view;
    self.m_data = data;

    self:initView();
end

GameMatchHallRecordRankItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

GameMatchHallRecordRankItem.updateListItem = function (self, data)
    self.m_data = data;
    self:initView();
end

GameMatchHallRecordRankItem.removeData = function(self)
    self:setVisible(false);
end

GameMatchHallRecordRankItem.onItemClick = function(self, finger_action, x, y)
    if finger_action == kFingerDown then
        self.m_moving = false;
        self.m_startY = y;
    elseif finger_action == kFingerMove then
        if math.abs(y - self.m_startY) > 100 then
            self.m_moving = true;
        end
    elseif finger_action == kFingerUp then
        if not self.m_moving and GameMatchHallRecordRankItem.s_callbackObj and GameMatchHallRecordRankItem.s_callbackFunc then
            GameMatchHallRecordRankItem.s_callbackFunc(GameMatchHallRecordRankItem.s_callbackObj, self.m_data, self);
        end
    end
end

---------------------------------------------------------------------------------------
GameMatchHallRecordRankItem.initView = function(self)
    local data = self.m_data;

    local number = self.m_view:getChildByName("number");
    local numberImg = self.m_view:getChildByName("numberImg");
    local name = self.m_view:getChildByName("name");
    local score = self.m_view:getChildByName("score");
    local levelBg = self.m_view:getChildByName("levelBg");
    local contentView = levelBg:getChildByName("contentView");
    local img = contentView:getChildByName("img");
    local levelView = contentView:getChildByName("levelView");

    if not self.m_levelItem then
        self.m_levelItem = new(UserMoneyItem);
        self.m_levelItem:setAlign(kAlignLeft);
        levelView:addChild(self.m_levelItem);
    end
    UserMoneyItem.setFilePath(UserMoneyItem.s_matchDetailNumFilePath);
    self.m_levelItem:setNormalMoneyNum(tostring(data.level) or "0", 0.4);
    UserMoneyItem.setFilePath();

    local widthNumber = numberImg:getSize();
    number:setVisible(false);
    numberImg:setVisible(false);
    if data.rank >= 1 and data.rank <= 3 then
        local file = ranklist_pin_map[string.format("rank_%s.png", data.rank)];
        if file then
            numberImg:setFile(file);
        end
        
        numberImg:setVisible(true);
    else
        number:setText(string.format("%s、", data.rank), widthNumber);
        widthNumber = number:getSize();
        number:setVisible(true);
    end

    name:setText(data.nick, 1);
    score:setText(string.format("%s大师分", data.masterpoints));

    local widthName = name:getSize();
    name:setPos(widthNumber);
    local posLevelBg = widthNumber + widthName;
    posLevelBg = math.max(posLevelBg, 200);
    levelBg:setPos(posLevelBg);

    local widthImg = img:getSize();
    local widthLevel = self.m_levelItem:getSize();
    contentView:setSize(widthImg + widthLevel);
end

return GameMatchHallRecordRankItem;