require("isolater/interface/settingIsolater");
local MatchRankListItem = class(Node);

MatchRankListItem.ctor = function(self, data)
	local match_rank_list_item = require(ViewPath .. "games/common2/match/match_rank_list_item");

    local view = SceneLoader.load(match_rank_list_item);
    local w, h = view:getSize();
    self:addChild(view);
    view:setFillParent(true, true);
    self:setFillParent(true,false);
    self:setSize(w, h);

    self.m_view = view;
    self.m_data = data;

    self:initView();
end

MatchRankListItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end

---------------------------------------------------------------------------------------
MatchRankListItem.initView = function(self)
    local data = self.m_data;
    local rankIcon = self.m_view:getChildByName("rank_icon");
    local rankText = self.m_view:getChildByName("rank");
    local nick = self.m_view:getChildByName("nick");
    local score = self.m_view:getChildByName("score");
    local onlookerBtn = self.m_view:getChildByName("onlookerBtn");

    local colors = {{255,232,41},{211,192,255},{245,172,51},{238,206,144}};
    local sort = number.valueOf(data.rank,4);
    local color = sort <= 3 and colors[sort] or colors[4];

    if sort <= 3 then
    	local file = string.format("%s%s.png","games/common/match/match_rank_reward/",sort);
    	rankIcon:setFile(file);
    end

    rankIcon:setVisible(sort <= 3);
    rankText:setVisible(sort >= 4);

    rankText:setText(tostring(data.rank),nil,nil,unpack(color));
    nick:setText(string.subUtfStrByCn(data.name or "",1,6),nil,nil,unpack(color));
    score:setText(tostring(data.score),nil,nil,unpack(color));

    local canOnlooker = false;
    local isOpen = SettingIsolater.getInstance():getMatchOnlookerSwitch();
    if isOpen then
        local curGameId = GameInfoIsolater.getInstance():getCurGameId();       
        local isSupport = GameInfoIsolater.getInstance():isGameSupportOnlookerMatchFeature(curGameId);
        if isSupport then 
            if data.userId ~= UserBaseInfoIsolater.getInstance():getUserId() then 
                local curState,_,curSubState = MatchMechine.getInstance():getStates();
                if curState == MatchMechineConfig.STATUS_WAITING and curSubState == MatchMechineConfig.STATUS_WAITING_ROUNDOVER then
                    canOnlooker = data.canOnlooker;
                elseif curState == MatchMechineConfig.STATUS_FINISH then 
                    canOnlooker = data.canOnlooker;
                end
            end 
        end 
    end

    onlookerBtn:setVisible(canOnlooker);
end

MatchRankListItem.getData = function(self)
    return self.m_data;
end

MatchRankListItem.checkIsOnlookerBtnClick = function(self,c_x,c_y)
    local onlookerBtn = self.m_view:getChildByName("onlookerBtn");
    if onlookerBtn:getVisible() then 
        local x,y = onlookerBtn:getPos();
        local w,h = onlookerBtn:getSize();
        local e_x = x + w;
        local e_y = y + h;
        if (c_x >= x and c_x <= e_x) and (c_y >= y and c_y <= e_y) then 
            return true;
        end  
    end 
    return false;    
end

return MatchRankListItem;