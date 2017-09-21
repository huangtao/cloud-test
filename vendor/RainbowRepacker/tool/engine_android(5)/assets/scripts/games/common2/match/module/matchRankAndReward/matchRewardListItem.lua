local MatchRewardListItem = class(Node);

MatchRewardListItem.ctor = function(self, data)
	local match_reward_list_item = require(ViewPath .. "games/common2/match/match_reward_list_item");

    local view = SceneLoader.load(match_reward_list_item);
    local w, h = view:getSize();
    self:addChild(view);
    view:setFillParent(true, true);
    self:setFillParent(true,false);
    self:setSize(w, h);

    self.m_view = view;
    self.m_data = data;

    self:initView();
end

MatchRewardListItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

---------------------------------------------------------------------------------------

MatchRewardListItem.initView = function(self)
    local data = self.m_data;
    local rankIcon = self.m_view:getChildByName("rank_icon");
    local rankText = self.m_view:getChildByName("rank");
    local reward = self.m_view:getChildByName("reward");

    local colors = {{255,232,41},{211,192,255},{245,172,51},{238,206,144}};
    local sort = number.valueOf(data.sort,4);
    local color = sort <= 3 and colors[sort] or colors[4];

    if sort <= 3 then
    	local file = string.format("%s%s.png","games/common/match/match_rank_reward/",sort);
    	rankIcon:setFile(file);
    end

    rankIcon:setVisible(sort <= 3);
    rankText:setVisible(sort >= 4);
    rankText:setText(data.rank or "",nil,nil,unpack(color));    
    reward:setText(data.desc or "",nil,nil,unpack(color));

    if data.isNeedRoll then 
        self:playRollAnim(color);
    end 
end

MatchRewardListItem.playRollAnim = function(self,color)
    local reward = self.m_view:getChildByName("reward");
    reward:setVisible(false);
    local x,y = reward:getPos();
    local w,h = reward:getSize();

    local node = UIFactory.createNode();
    node:setSize(w,h+10);
    self.m_view:addChild(node);
    node:setAlign(kAlignLeft);
    node:setPos(x,y);    
    node:setClip(x,0,w,h+10);
    
    local animText = UIFactory.createText(self.m_data.desc or "",26,1,1, kAlignLeft,unpack(color));
    local w_2 = animText:getSize();
    animText:setPos(-w_2,0);
    animText:setAlign(kAlignLeft);
    animText:addPropTranslate(0,kAnimRepeat,5000,0,w+w_2,0,0,0);
    node:addChild(animText);
end

return MatchRewardListItem;