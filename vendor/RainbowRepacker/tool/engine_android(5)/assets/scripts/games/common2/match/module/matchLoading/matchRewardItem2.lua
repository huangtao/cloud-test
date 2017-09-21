
local match_reward_item_layout_2 = require(ViewPath .. "games/common2/match/match_reward_item_layout_2");

-- 比赛奖励列表项
MatchRewardItem2 = class(Node);

MatchRewardItem2.setRankTextWidth = function(width, spaceWidth, totalWidth)
    MatchRewardItem2.s_rankTextWidth = width;
    MatchRewardItem2.s_rankTextSpaceWidth = spaceWidth;
    MatchRewardItem2.s_rankTextTotalWidth = totalWidth;
end

MatchRewardItem2.ctor = function(self, data)
    local view = SceneLoader.load(match_reward_item_layout_2);
    local w, h = view:getSize();
    self:addChild(view);
    view:setFillParent(true, true);
    self:setFillParent(true,false);
    self:setSize(w, h);

    self.m_view = view;
    self.m_data = data;

    self:initView();
end

MatchRewardItem2.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

---------------------------------------------------------------------------------------

MatchRewardItem2.initView = function(self)
    local data = self.m_data;
    local content = self.m_view:getChildByName("content");
    local rankText = content:getChildByName("rank");
    local reward = content:getChildByName("reward");
    
    local posX = MatchRewardItem2.s_rankTextWidth or rankText.m_width;
    local spaceWidth = MatchRewardItem2.s_rankTextSpaceWidth or 28;

    rankText:setText(tostring(data.rank), posX);
    reward:setText(tostring(data.desc), 1);

    reward:setPos(posX + spaceWidth, 0);

    local totalWidth = MatchRewardItem2.s_rankTextTotalWidth;
    if totalWidth then
        content:setAlign(kAlignCenter);
        content:setSize(totalWidth);
    end

    if number.valueOf(data.sort) <= 3 then
        rankText:setColor(255, 255, 0);
        reward:setColor(255, 255, 0);
    end
end
