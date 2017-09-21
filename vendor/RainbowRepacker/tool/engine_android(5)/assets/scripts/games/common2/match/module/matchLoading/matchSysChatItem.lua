local MatchChatItem = require("games/common2/match/module/matchLoading/matchChatItem");

local MatchSysChatItem = class(MatchChatItem);

-- data =  
-- {
--     ["sendFlag"] = 1;
--     ["userName"] = 系统;
--     ["msgInfo"] = 地方;
-- };
MatchSysChatItem.ctor = function(self, data,viewWidth)
end

MatchSysChatItem.dtor = function(self)
end

MatchSysChatItem.refreshData = function(self,data)
    local info = self.m_view:getChildByName("info");
    local sexIcon = info:getChildByName("icon");
    local msg = info:getChildByName("msg");

    sexIcon:setVisible(false);

    local width = self:getSize();
    local sexIcon_x = sexIcon:getPos();
    local w = width - 2*sexIcon_x;
    local color = data.sendFlag == -1 and {234, 72, 40} or {255, 254, 162};
    local content = string.concat(data.userName or "", ":", data.msgInfo or "");
    msg:setText(content,w,nil, unpack(color));   
    msg:setSize(w,msg.m_res:getHeight());
    msg:setPos(sexIcon_x,nil);

    local _,h = msg:getSize();
    self:setSize(nil,h+10); 
end

MatchSysChatItem.onItemClick = function(self,finger_action)
    if finger_action == kFingerUp then  
        self:broadcastCancleSelected();
    end 
end

return MatchSysChatItem;