local MatchChatItem = require("games/common2/match/module/matchLoading/matchChatItem");

local MatchUserChatItem = class(MatchChatItem);

-- data =  
-- {
--     ["userName"] = KF骆遗忘;
--     ["mid"] = 2007183;
--     ["time"] = 2016-05-12 11:45:23;
--     ["sex"] = 1;
--     ["sendFlag"] = 2;
--     ["msgInfo"] = 地方;
--     ["cid"] = 2007110;
-- };

MatchUserChatItem.ctor = function(self, data,viewWidth)
end

MatchUserChatItem.dtor = function(self)
end
----------------------------------------------------------------------------------------
MatchUserChatItem.refreshData = function(self,data)
    local info = self.m_view:getChildByName("info");
    local sexIcon = info:getChildByName("icon");
    local msg = info:getChildByName("msg");

    self:_cancleSelect();

    sexIcon:setVisible(true);
    local imagePath = UserBaseInfoIsolater.getInstance():getSexIconBySex(data.sex);
    sexIcon:setFile(imagePath);

    local width = self:getSize();
    local sexIcon_x = sexIcon:getPos();
    local x = msg:getPos();
    local w = width - x - sexIcon_x;
    local r, g, b = 255, 255, 255; 
    local content = string.concat(data.userName or "", ":", data.msgInfo or "");
    msg:setText(content,w,nil,r,g,b);   
    msg:setSize(w,msg.m_res:getHeight());

    local _,h = msg:getSize();
    self:setSize(nil,h+10); 
end

MatchUserChatItem.onItemClick = function(self,finger_action, x, y)

    if finger_action == kFingerDown then 
        self.m_cacheY = y;
    elseif finger_action == kFingerUp then 
        local x0, y0 = self:getAbsolutePos();
        local w, h = self:getSize();
        if (x >= x0 and x <= x0 + w) and (y >= y0 and y <= y0 + h) then 
            if math.abs(self.m_cacheY - y) > 10 then
                self:onOtherChatItemSelected();
                self:broadcastCancleSelected();
            elseif self.m_isSelected then 
                --self:_cancleSelect();
            else 
                self:broadcastSelected();
                self:_selectItem();
            end  
        end
    end 
end

MatchUserChatItem.onOtherChatItemSelected = function(self)
    self:_cancleSelect();
end
---------------------------------------------------------------------------------------
MatchUserChatItem._selectItem = function(self)
    self:_setSelectStatus(true);
end

MatchUserChatItem._cancleSelect = function(self)
    self:_setSelectStatus(false);
end

MatchUserChatItem._setSelectStatus = function(self,isSelect)
    self.m_isSelected = isSelect;

    local bg = self.m_view:getChildByName("bg");
    bg:setVisible(isSelect);
end

return MatchUserChatItem;