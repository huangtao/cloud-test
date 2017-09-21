
local match_over_reward_item = require(ViewPath .. "games/common2/match/match_over_reward_item");

-- 比赛奖励
MatchOverRewardItem = class(Node);

MatchOverRewardItem.ctor = function(self, type, num, desc)
    local view = SceneLoader.load(match_over_reward_item);
    local w, h = view:getSize();
    self:addChild(view);
    view:setFillParent(true, true);
    self:setSize(w, h);

    self.m_view = view;

    self:initView(type, num, desc);
end

MatchOverRewardItem.dtor = function(self)
    self.m_view = nil;
end

---------------------------------------------------------------------------------------

MatchOverRewardItem.initView = function(self, type, num, desc)
    local content = self.m_view:getChildByName("bg");
    local numText = content:getChildByName("text");
    numText:setScrollBarWidth(0);

    local rewardImg = nil;

    local function onUpdateRewardImage(self, url, imagePath) 
        if imagePath then
            if rewardImg then
                rewardImg:setFile(imagePath);
            else 
                rewardImg = UIFactory.createImage(imagePath);
            end

            self:_resetImageSize(rewardImg);
        end
    end

    local rewardFile = PropIsolater.getInstance():getPropIcon(type);
    local rewardName = PropIsolater.getInstance():getPropName(type);
    if rewardFile then 
        ImageCache.getInstance():request(rewardFile, self, onUpdateRewardImage);
    end

    if not rewardImg then
        rewardImg = UIFactory.createImage("isolater/bg_blank.png");
    end

    self:_resetImageSize(rewardImg);
    rewardImg:setAlign(kAlignCenter);

    numText:setText(desc or "");

    content:addChild(rewardImg);
end

MatchOverRewardItem._resetImageSize = function(self, img, width)
    local localWidth = width or 90;
    if img and img.m_res then
        local w = img.m_res:getWidth();
        local h = img.m_res:getHeight();

        img:setSize(localWidth, h * localWidth / w);
    end
end