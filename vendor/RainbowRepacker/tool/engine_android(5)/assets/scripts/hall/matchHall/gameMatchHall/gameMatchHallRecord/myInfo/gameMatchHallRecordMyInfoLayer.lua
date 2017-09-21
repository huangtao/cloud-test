local match_hall_record_view_my_info_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_view_my_info_layout");
require("uilibs/userMoneyItem");
local match_record_pin_map = require("qnFiles/qnPlist/hall/match_record_pin")
local RecordRewardPage = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/myInfo/gameMatchHallRecordRewardItem");

-- 我的战绩
local GameMatchHallRecordMyInfoLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordMyInfoLayer.s_controls = 
{
    -- 我的战绩
    advanceFinalsCount = getIndex(),
    advanceCircleCount = getIndex(),
    winCount = getIndex(),
    rewardText = getIndex(),
    rewardShareBtn = getIndex(),
    rewardNextPageBtn = getIndex(),
    rewardPageView = getIndex(),
    levelHelpBtn = getIndex(),
    levelView = getIndex(),
    levelInfoView = getIndex(),
    levelBg = getIndex(),
};

GameMatchHallRecordMyInfoLayer.s_cmds = 
{
};

GameMatchHallRecordMyInfoLayer.ctor = function(self)
    super(self, match_hall_record_view_my_info_layout);
    self:setSize(self.m_root:getSize());
    self:setAlign(kAlignCenter);

    self:_initView();

    MatchRecordDataInterface.getInstance():setObserver(self);
end

GameMatchHallRecordMyInfoLayer.dtor = function(self)
    MatchRecordDataInterface.getInstance():clearObserver(self);

    self:_deleteMasterDescView();
    self:_deleteMatchRecordRewardTips();
    self:_deleteShareView();
end

GameMatchHallRecordMyInfoLayer.show = function(self)
	CommonGameLayer.show(self);
    
    self:_resetView();

    -- 获取比赛统计数据，累计奖励数据
    MatchRecordDataInterface.getInstance():getMatchRecordStatistics(kUserInfoData:getUserId());
    MatchRecordDataInterface.getInstance():getMatchRecordReward();
end

GameMatchHallRecordMyInfoLayer.hasOpenLayer = function(self)
    local hasOpenLayer = false;

    if (self.m_shareView and self.m_shareView:isShowing()) or 
        (self.m_masterDescView and self.m_masterDescView:isShowing()) or
        (self.m_rewardTips and self.m_rewardTips:isShowing()) then
        hasOpenLayer = true;
    end

    return hasOpenLayer;
end

---------------------------------奖励--------------------------------------

GameMatchHallRecordMyInfoLayer.onRewardNextPageBtnClick = function(self)
    self.m_rewardPageView:setPage(self.m_rewardPageView:getCurPage() + 1);
end

GameMatchHallRecordMyInfoLayer.onRewardPrePageBtnClick = function(self)
    self.m_rewardPageView:setPage(self.m_rewardPageView:getCurPage() - 1);
end

-- interface callback
GameMatchHallRecordMyInfoLayer.onGetMatchRecordStatistics = function(self, data, mid)
    if mid ~= kUserInfoData:getUserId() then
        return;
    end

    Log.d("GameMatchHallRecordMyInfoLayer.onGetMatchRecordStatistics", "mid", mid);

    self:findViewById(self.s_controls.advanceFinalsCount):setText(tostring(data.finals_total or 0));
    self:findViewById(self.s_controls.advanceCircleCount):setText(tostring(data.awards_total or 0));
    self:findViewById(self.s_controls.winCount):setText(tostring(data.champion_total or 0));

    self:_updateLevel(data.masterpoints or 0, data.masterlevel or 0, data.nextlevelpoints or 1);
end

-- interface callback
GameMatchHallRecordMyInfoLayer.onGetMatchRecordReward = function(self, data)
    if table.isEmpty(data) then
        self.m_rewardText:setText("未获得任何奖励：");

        -- 无奖励显示比赛标签
        local dataTagList = MatchRecordDataInterface.getInstance():getMatchTagList();
        if not table.isEmpty(dataTagList) then
            local dataType = self:_setDataType(dataTagList, GameMatchHallConstants.eRewardType.TAGS);
            self:showMatchRecordReward(dataType);
        end
    else
        self.m_rewardText:setText("本周累计赢取：");
        local dataType = self:_setDataType(data, GameMatchHallConstants.eRewardType.REWARD);
        self:showMatchRecordReward(self:_filterEmptyData(dataType));
    end
end

-- interface callback
GameMatchHallRecordMyInfoLayer.onGetMatchTagList = function(self, data)
    if not table.isEmpty(data) then
        local dataType = self:_setDataType(dataTagList, GameMatchHallConstants.eRewardType.TAGS);
        self:showMatchRecordReward(dataType);
    end
end

-- 显示累计奖励
GameMatchHallRecordMyInfoLayer.showMatchRecordReward = function(self, data)
    if table.isEmpty(data) then
        return;
    end

    -- 分页，4个一页
    local pageData = self:_groupData(data, 4);
    self.m_rewardTotalPage = #pageData;

    RecordRewardPage.setDefaultSize(self.m_rewardPageView:getSize());
    RecordRewardPage.setOnClick(self, self.onRewardItemClick);

    if not self.m_adapterReward then
        self.m_adapterReward = UIFactory.createCacheAdapter(RecordRewardPage, pageData);
        self.m_rewardPageView:setAdapter(self.m_adapterReward);
        self.m_rewardPageView:setOnPageChanged(self, self.onRewardPageChanged);
    else
        self.m_adapterReward:changeData(pageData);
    end

    self:checkRewardArrowStatus();

    self.m_rewardPageView:setVisible(true);
end

GameMatchHallRecordMyInfoLayer.onRewardPageChanged = function(self, curPage, lastPage)
    self:checkRewardArrowStatus();
end

GameMatchHallRecordMyInfoLayer.onRewardItemClick = function(self, data, view)
    self:_createMatchRecordRewardTips(data, view);
end

-- 设置箭头显示状态
GameMatchHallRecordMyInfoLayer.checkRewardArrowStatus = function(self)
    local curPage = self.m_rewardPageView:getCurPage();
    curPage = curPage <= 0 and 1 or curPage;
    local isFinalPage = self.m_rewardTotalPage == curPage;
    local img = self.m_rewardNextPageBtn:getChildByName("img");
    img:setFile(isFinalPage and match_record_pin_map["arrow_page_pre.png"] or match_record_pin_map["arrow_page_next.png"]);
    self.m_rewardNextPageBtn:setOnClick(self, isFinalPage and self.onRewardPrePageBtnClick or self.onRewardNextPageBtnClick);
    self.m_rewardNextPageBtn:setVisible(self.m_rewardTotalPage > 1);
end

-- 显示奖励比赛信息提示
GameMatchHallRecordMyInfoLayer._createMatchRecordRewardTips = function(self, data, view)
    if not self.m_rewardTips then
        local gameMatchHallRecordRewardTips = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/myInfo/gameMatchHallRecordRewardTips");
        self.m_rewardTips = new(gameMatchHallRecordRewardTips);
    end

    self.m_rewardTips:show(data);
    local w, h = view:getSize();
    local x, y = view:getAbsolutePos();
    self.m_rewardTips:setContentPos(x + w / 2, y);
end

GameMatchHallRecordMyInfoLayer._deleteMatchRecordRewardTips = function(self)
    if self.m_rewardTips then
        delete(self.m_rewardTips);
        self.m_rewardTips = nil;
    end
end

GameMatchHallRecordMyInfoLayer._groupData = function(self, data, count)
    count = count or 4;
    local tmp = {}; -- 分组后的数据
    local pos = 1;
    for k, v in ipairs(table.verify(data)) do 
        if not tmp[pos] then 
            tmp[pos] = {};
        end
        table.insert(tmp[pos], v);
        if #tmp[pos] >= count then 
            pos = pos + 1;
        end
    end

    return tmp;
end

-- 插入奖励类型：标签，奖励
GameMatchHallRecordMyInfoLayer._setDataType = function(self, data, type)
    local tmp = {};
    for k, v in pairs(table.verify(data)) do
        v.rewardType = type;
        table.insert(tmp, v);
    end
    return tmp;
end

GameMatchHallRecordMyInfoLayer._filterEmptyData = function(self, data)
    local tmp = {};
    for k, v in pairs(table.verify(data)) do
        local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(v.type);
        if not table.isEmpty(propInfo) then
            table.insert(tmp, v);
        end
    end
    return tmp;
end

-------------------------------大师分等级信息----------------------------
GameMatchHallRecordMyInfoLayer._updateLevel = function(self, masterPoint, level, masterPointNextLevel)
    -- 大师分等级
    if not self.m_levelText then
        self.m_levelText = new(UserMoneyItem);
        self.m_levelText:setAlign(kAlignLeft);
        local levelView = self:findViewById(self.s_controls.levelView);
        levelView:addChild(self.m_levelText);
    end

    UserMoneyItem.setFilePath(UserMoneyItem.s_matchDetailNumFilePath);
    self.m_levelText:setNormalMoneyNum(tostring(level) or "0", 1);
    UserMoneyItem.setFilePath();

    -- 升级所需大师分
    local infoStr = "";
    if number.valueOf(masterPointNextLevel) <= 0 then 
        infoStr = string.format("#c8F5C1F您已达到当前最高等级");
    else
        infoStr = string.format("#c8F5C1F升级#c1B885ELv.%s#c8F5C1F还需要#c1B885E%s#c8F5C1F大师分", level + 1, masterPointNextLevel - masterPoint);
    end
    if not self.m_levelInfoText then
        self.m_levelInfoText = new(RichText, infoStr, 1, 1, kAlignLeft, nil, 24);
        self.m_levelInfoText:setAlign(kAlignRight);
        local levelInfoView = self:findViewById(self.s_controls.levelInfoView);
        levelInfoView:addChild(self.m_levelInfoText);
    else
        self.m_levelInfoText:setText(infoStr, 1, 1);
    end
end

---------------------------------分享弹框--------------------------------------
-- 680版本不显示
GameMatchHallRecordMyInfoLayer.onRewardShareBtnClick = function(self)
    self:_createShareView();
end

-- 680版本不显示
GameMatchHallRecordMyInfoLayer._createShareView = function(self)
    if not self.m_shareView then
        local gameMatchHallRecordShare = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/myInfo/gameMatchHallRecordShare");
        self.m_shareView = new(gameMatchHallRecordShare);
        local shareBtn = self:findViewById(self.s_controls.rewardShareBtn);
        local w, h = shareBtn:getSize();
        local x, y = shareBtn:getAbsolutePos();
        self.m_shareView:setContentPos(x + w, y);
    end

    self.m_shareView:show();
end

GameMatchHallRecordMyInfoLayer._deleteShareView = function(self)
    if self.m_shareView then
        delete(self.m_shareView);
        self.m_shareView = nil;
    end
end

---------------------------------大师分描述-------------------------------------
GameMatchHallRecordMyInfoLayer.onLevelHelpBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchRecordMasterDesc);
    self:_createMasterDescView();
end

GameMatchHallRecordMyInfoLayer._createMasterDescView = function(self)
    if not self.m_masterDescView then
        local gameMatchHallRecordMasterDesc = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/myInfo/gameMatchHallRecordMasterDesc");
        self.m_masterDescView = new(gameMatchHallRecordMasterDesc);
        local levelBg = self:findViewById(self.s_controls.levelBg);
        local w, h = levelBg:getSize();
        local x, y = levelBg:getAbsolutePos();
        self.m_masterDescView:setContentPos(x + w / 2, y + h + 10);
    end

    self.m_masterDescView:show();
end

GameMatchHallRecordMyInfoLayer._deleteMasterDescView = function(self)
    if self.m_masterDescView then
        delete(self.m_masterDescView);
        self.m_masterDescView = nil;
    end
end

---------------------------------------------------------------------------------------
GameMatchHallRecordMyInfoLayer._initView = function(self)
	self.m_rewardPageView = self:findViewById(self.s_controls.rewardPageView);
    self.m_rewardNextPageBtn = self:findViewById(self.s_controls.rewardNextPageBtn);
    self.m_rewardText = self:findViewById(self.s_controls.rewardText);
end

GameMatchHallRecordMyInfoLayer._resetView = function(self)
    self.m_rewardPageView:setVisible(false);
    self.m_rewardNextPageBtn:setVisible(false);
    self.m_rewardText:setText("");
end

---------------------------------------------------------------------------------------
GameMatchHallRecordMyInfoLayer.s_controlConfig = 
{
    [GameMatchHallRecordMyInfoLayer.s_controls.advanceFinalsCount] = {"statisticsBg", "statisticsCenterView", "text"};
    [GameMatchHallRecordMyInfoLayer.s_controls.advanceCircleCount] = {"statisticsBg", "statisticsLeftView", "text"};
    [GameMatchHallRecordMyInfoLayer.s_controls.winCount] = {"statisticsBg", "statisticsRightView", "text"};
    [GameMatchHallRecordMyInfoLayer.s_controls.rewardText] = {"rewardBg", "text"};
    [GameMatchHallRecordMyInfoLayer.s_controls.rewardShareBtn] = {"rewardBg", "shareBtn"};
    [GameMatchHallRecordMyInfoLayer.s_controls.rewardPageView] = {"rewardBg", "pageView"};
    [GameMatchHallRecordMyInfoLayer.s_controls.rewardNextPageBtn] = {"rewardBg", "nextPageBtn"};
    [GameMatchHallRecordMyInfoLayer.s_controls.levelHelpBtn] = {"levelBg", "helpBtn"};
    [GameMatchHallRecordMyInfoLayer.s_controls.levelView] = {"levelBg", "levelView"};
    [GameMatchHallRecordMyInfoLayer.s_controls.levelInfoView] = {"levelBg", "levelInfoView"};
    [GameMatchHallRecordMyInfoLayer.s_controls.levelBg] = {"levelBg"};
};

GameMatchHallRecordMyInfoLayer.s_controlFuncMap = 
{
    [GameMatchHallRecordMyInfoLayer.s_controls.rewardShareBtn] = GameMatchHallRecordMyInfoLayer.onRewardShareBtnClick;
    [GameMatchHallRecordMyInfoLayer.s_controls.rewardNextPageBtn] = GameMatchHallRecordMyInfoLayer.onRewardNextPageBtnClick;
    [GameMatchHallRecordMyInfoLayer.s_controls.levelHelpBtn] = GameMatchHallRecordMyInfoLayer.onLevelHelpBtnClick;
};

GameMatchHallRecordMyInfoLayer.s_cmdConfig = 
{
};

return GameMatchHallRecordMyInfoLayer;