
local match_loading_chat_item = require(ViewPath .. "games/common2/match/match_loading_chat_item");

local MatchChatItem = class(Node);

MatchChatItem.BROADCAST_SELECTED = "match_select_chat_item_event";
MatchChatItem.BROADCAST_CANCLE_SELECTED = "match_cancle_select_chat_item_event";
MatchChatItem.ctor = function(self, data,viewWidth)
    EventDispatcher.getInstance():register(MatchChatItem.BROADCAST_SELECTED,self,self.onOtherChatItemSelected);
    EventDispatcher.getInstance():register(MatchChatItem.BROADCAST_CANCLE_SELECTED,self,self.onOtherChatItemSelected);

    local view = SceneLoader.load(match_loading_chat_item);
    local _, h = view:getSize();
    self:addChild(view);
    view:setFillParent(true, true);
    self:setSize(viewWidth, h);

    data = table.verify(data);

    self.m_view = view;
    self.m_data = data;

    self:_initView();
    self:refreshData(data);
end

MatchChatItem.dtor = function(self)
    EventDispatcher.getInstance():unregister(MatchChatItem.BROADCAST_SELECTED,self,self.onOtherChatItemSelected);
    EventDispatcher.getInstance():unregister(MatchChatItem.BROADCAST_CANCLE_SELECTED,self,self.onOtherChatItemSelected);
    self.m_data = nil;
end

MatchChatItem._initView = function(self)
    local info = self.m_view:getChildByName("info");
    local msg = info:getChildByName("msg");

    info:setEventTouch(self,self.onItemClick);
    msg:setEventTouch(self,self.onItemClick);
end

MatchChatItem.broadcastSelected = function(self)
    local data = Copy(self.m_data);

    local x,y = self:getAbsolutePos();
    local w,h = self:getSize();

    data.x = x + 20;
    data.y = y + h;
    EventDispatcher.getInstance():dispatch(MatchChatItem.BROADCAST_SELECTED,data);
end

MatchChatItem.broadcastCancleSelected = function(self)
    EventDispatcher.getInstance():dispatch(MatchChatItem.BROADCAST_CANCLE_SELECTED);
end
----------------------------------------------------------------------------------
MatchChatItem.refreshData = function(self,data)
end

MatchChatItem.onItemClick = function(self,finger_action)
end

MatchChatItem.onOtherChatItemSelected = function(self)
end

return MatchChatItem;