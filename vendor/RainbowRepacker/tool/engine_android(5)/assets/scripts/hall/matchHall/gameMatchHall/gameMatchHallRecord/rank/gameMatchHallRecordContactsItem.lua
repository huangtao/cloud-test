require("ui/node");
local match_hall_record_item_contacts_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_item_contacts_layout");

-- 通讯录
local GameMatchHallRecordContactsItem = class(Node);

GameMatchHallRecordContactsItem.s_defaultWidth = 300;
GameMatchHallRecordContactsItem.s_defaultHeight = 300;

GameMatchHallRecordContactsItem.setDefaultSize = function(width, height)
    GameMatchHallRecordContactsItem.s_defaultWidth = width or 300;
    GameMatchHallRecordContactsItem.s_defaultHeight = height or 300;
end

GameMatchHallRecordContactsItem.setEventCallback = function(obj, func)
    GameMatchHallRecordContactsItem.s_callbackObj = obj;
    GameMatchHallRecordContactsItem.s_callbackFunc = func;
end

GameMatchHallRecordContactsItem.ctor = function(self, data)
    local view = SceneLoader.load(match_hall_record_item_contacts_layout);
    local viewWidth = view:getSize();
    view:setAlign(kAlignCenter);
    view:setFillParent(false, true);
    self:addChild(view);
    self:setSize(viewWidth, GameMatchHallRecordContactsItem.s_defaultHeight);
    self.m_view = view;
    self.m_data = data;

    self:initView();
end

GameMatchHallRecordContactsItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

GameMatchHallRecordContactsItem.onInviteBtnClick = function(self)
    if GameMatchHallRecordContactsItem.s_callbackObj and GameMatchHallRecordContactsItem.s_callbackFunc then
        GameMatchHallRecordContactsItem.s_callbackFunc(GameMatchHallRecordContactsItem.s_callbackObj, self.m_data);
    end
end
---------------------------------------------------------------------------------------
GameMatchHallRecordContactsItem.initView = function(self)
    local data = self.m_data;

    local name = self.m_view:getChildByName("name");
    local number = self.m_view:getChildByName("number");
    local inviteBtn = self.m_view:getChildByName("inviteBtn");

    name:setText(data.name);
    number:setText(data.number);
    inviteBtn:setOnClick(self, self.onInviteBtnClick);
    inviteBtn:setEnable(not data.isInvited);
end

return GameMatchHallRecordContactsItem;