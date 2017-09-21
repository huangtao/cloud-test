
local match_reward_layout_2 = require(ViewPath .. "/games/common2/match/match_reward_layout_2");
require("games/common2/match/module/matchLoading/matchRewardItem2");

-- 奖励弹框
MatchRewardView2 = class(IBaseDialog, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

MatchRewardView2.s_itemHeight = 40;
MatchRewardView2.s_itemFontSize = 22;
MatchRewardView2.s_itemMaxSize = 9;
MatchRewardView2.s_itemMinSize = 3;

MatchRewardView2.s_controls = 
{
    contentBg = getIndex(),
    rewardListView = getIndex(),
};

MatchRewardView2.s_cmds = 
{

};

MatchRewardView2.Delegate = {
    onCloseRewardViewCallback = "onCloseRewardViewCallback";
};

MatchRewardView2.ctor = function(self, data)
    super(self, match_reward_layout_2);
    self:setLevel(198);
    
    self:setFillParent(true, true);
    self.m_root:setFillParent(true, true);

    self.m_data = data;

    self:_initView();
    self:_resetView();
    self:_showData();
end

MatchRewardView2.dtor = function(self)
    self.m_isShowing = false;
end

MatchRewardView2.isShowing = function(self)
    return self.m_isShowing;
end

MatchRewardView2.showDialog = function(self)
    self.m_isShowing = true;
    IBaseDialog.pushDialog(self);
end

MatchRewardView2.hideDialog = function(self)
    self:execDelegate(MatchRewardView2.Delegate.onCloseRewardViewCallback);
    self.m_isShowing = false;
    IBaseDialog.hide();
end

MatchRewardView2.setContentPos = function(self, x, y)
    local width, height = self.m_contentBg:getSize();
    local localX = x and x - width / 2 or nil;
    local localY = y and y - height or nil;
    self.m_contentBg:setAlign(kAlignTopLeft);
    self.m_contentBg:setPos(localX, localY);
end

--------------------------------------private----------------------------------------------
MatchRewardView2._initView = function(self)
    self.m_contentBg = self:findViewById(self.s_controls.contentBg);
    self.m_rewardListView = self:findViewById(self.s_controls.rewardListView);

    self.m_root:setEventTouch(self, self._onBgTouch);
    self.m_root:setEventDrag(self, self._onEmptyFunc);

    self:_getViewSize();
end

MatchRewardView2._resetView = function(self)
    self.m_rewardListView:setVisible(false);
end

MatchRewardView2._onBgTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:hideDialog();
    end
end

MatchRewardView2._onEmptyFunc = function(self)
end

MatchRewardView2._showData = function(self)
    if not self.m_data then 
        return;
    end 
    local data = self.m_data;

    local itemCount = #data;
    local textWidth, spaceWidth, totalWidth = self:_getRewardTextWidth(data);
    itemCount = itemCount < MatchRewardView2.s_itemMinSize and MatchRewardView2.s_itemMinSize or itemCount;
    itemCount = itemCount > MatchRewardView2.s_itemMaxSize and MatchRewardView2.s_itemMaxSize or itemCount;
    local height = itemCount * MatchRewardView2.s_itemHeight;
    local _, _, topY, _, bottomY = self.m_rewardListView:getFillRegion();
    local totalHeight = topY + bottomY + height;
    self:_checkDetailViewSize(totalWidth, totalHeight);
    MatchRewardItem2.setRankTextWidth(textWidth, spaceWidth, totalWidth);
    if not self.m_adapter then
        self.m_adapter = new(CacheAdapter, MatchRewardItem2, data);
        self.m_rewardListView:setAdapter(self.m_adapter);
    else
        self.m_adapter:changeData(data);
    end

    self.m_rewardListView:setVisible(true);
end

MatchRewardView2._getRewardTextWidth = function(self, rewardData)
    if table.isEmpty(rewardData) then
        return nil;
    else
        local strRank = "";
        local strMaxDesc = "";
        for k, v in pairs(rewardData) do
            if string.len(strMaxDesc) < string.len(v.desc) then
                strMaxDesc = v.desc
            end

            if string.len(strRank) < string.len(v.rank) then
                strRank = v.rank
            end 
        end

        local text = new(Text, strRank, 1, 1, kAlignLeft, nil, MatchRewardView2.s_itemFontSize);
        local textReward = new(Text, strMaxDesc, 1, 1, kAlignLeft, nil, MatchRewardView2.s_itemFontSize);

        local rankWidth = text:getSize();
        local rewardWidth = textReward:getSize();
        
        delete(text);
        delete(textReward);
        
        local spaceWidth = MatchRewardView2.s_itemFontSize;
        return rankWidth, spaceWidth, rankWidth + spaceWidth + rewardWidth;
    end
end

MatchRewardView2._getViewSize = function(self)
    self.m_viewSizeInfo = {
        contentViewWidth = self.m_contentBg:getSize(),
        rewardVieWidth = self.m_rewardListView:getSize(),
    };
end

MatchRewardView2._checkDetailViewSize = function(self, itemWidth,totalHeight)
    itemWidth = number.valueOf(itemWidth);
    local contentViewWidth = self.m_viewSizeInfo.contentViewWidth;
    local rewardVieWidth = self.m_viewSizeInfo.rewardVieWidth;

    if itemWidth > rewardVieWidth then
        local delta = itemWidth - rewardVieWidth;
        contentViewWidth = contentViewWidth + delta;
        rewardVieWidth = rewardVieWidth + delta;
    end

    self.m_contentBg:setSize(contentViewWidth, totalHeight);
    self.m_rewardListView:setSize(rewardVieWidth);
end

-- 物理返回回调
MatchRewardView2.isCancelable = function(self)
    self:execDelegate(MatchRewardView2.Delegate.onCloseRewardViewCallback);
    return IBaseDialog.isCancelable(self);
end

MatchRewardView2.s_controlConfig =
{   
    [MatchRewardView2.s_controls.contentBg] = {"contentBg"};
    [MatchRewardView2.s_controls.rewardListView] = {"contentBg", "rewardListView"};
};

MatchRewardView2.s_cmdConfig =
{
};