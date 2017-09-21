local match_hall_record_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_layout");
require("hall/matchHall/gameMatchHall/data/matchRecordDataInterface");

-- 比战绩
local GameMatchHallRecord = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecord.s_controls = 
{
    closeBtn = getIndex(),
    rankTabBtn = getIndex(),
    historyTabBtn = getIndex(),
    myInfoTabBtn = getIndex(),

    rankView = getIndex(),
    historyView = getIndex(),
    myInfoView = getIndex(),
};

GameMatchHallRecord.Delegate = {
    onMatchRecordLayerClose = "onMatchRecordLayerClose";
    onMatchRecordSignupMatch = "onMatchRecordSignupMatch";
}


GameMatchHallRecord.s_cmds = 
{

};


GameMatchHallRecord.ctor = function(self)
    super(self, match_hall_record_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
    self:setVisible(false);
    self:_initView();

    MatchRecordDataInterface.getInstance():setObserver(self);
end

GameMatchHallRecord.dtor = function(self)
    MatchRecordDataInterface.getInstance():clearObserver(self);
end

GameMatchHallRecord.show = function(self)
    CommonGameLayer.show(self);
    MatchRecordDataInterface.getInstance():reset();
    self:_checkJumpData();
end

GameMatchHallRecord.hide = function(self)
    CommonGameLayer.hide(self);
end

GameMatchHallRecord.hasOpenLayer = function(self)
    local hasOpenLayer = false;

    if (self.m_myInfoLayer and self.m_myInfoLayer:hasOpenLayer()) or 
        (self.m_historyLayer and self.m_historyLayer:hasOpenLayer()) or 
        (self.m_rankLayer and self.m_rankLayer:hasOpenLayer()) then
        hasOpenLayer = true;
    end

    return hasOpenLayer;
end

GameMatchHallRecord.onCloseBtnClick = function(self)
    if self:hasOpenLayer() then
        EventDispatcher.getInstance():dispatch(kClosePopupwinCountdows);
    end

    self:_closeView();
end

GameMatchHallRecord._closeView = function(self)
    self:execDelegate(GameMatchHallRecord.Delegate.onMatchRecordLayerClose, true);
end

GameMatchHallRecord.onEmptyFunc = function(self)
end


GameMatchHallRecord._initView = function(self)
    self.m_myInfoView = self:findViewById(self.s_controls.myInfoView);
    self.m_historyView = self:findViewById(self.s_controls.historyView);
    self.m_rankView = self:findViewById(self.s_controls.rankView);

    local rankTabBtn = self:findViewById(self.s_controls.rankTabBtn);
    local myInfoTabBtn = self:findViewById(self.s_controls.myInfoTabBtn);
    local historyTabBtn = self:findViewById(self.s_controls.historyTabBtn);

    self.m_tabMap = {
        {rankTabBtn, self.showRankView, UBConfig.kHallMatchRecordTabRank},
        {myInfoTabBtn, self.showMyInfoView, UBConfig.kHallMatchRecordTabMyInfo},
        {historyTabBtn, self.showHistoryView, UBConfig.kHallMatchRecordTabHistory},
    };
end

------------------------------------标签逻辑----------------------------------
GameMatchHallRecord.onTabBtnClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    self:_checkReport(drawing_id_current);
    self:_checkTabBtnStatus(drawing_id_current);
end

GameMatchHallRecord._checkTabBtnStatus = function(self, id)
    for k, v in pairs(self.m_tabMap) do
        local btn = v[1];
        local func = v[2];

        if btn then
            local isSeleted = btn:getID() == id;
            local imgSel = btn:getChildByName("imgSel");
            imgSel:setVisible(isSeleted);

            if isSeleted and func then
                self:resetView();
                func(self);
            end
        end
    end
end 

-- 上报
GameMatchHallRecord._checkReport = function(self, id)
    for k, v in pairs(self.m_tabMap) do
        local btn = v[1];
        local reportKey = v[3];

        if btn then
            local isSeleted = btn:getID() == id;

            if isSeleted then
                UBReport.getInstance():report(reportKey);
                break;
            end
        end
    end
end

--根据跳转信息弹出比赛战绩
GameMatchHallRecord._checkJumpData = function(self)
    local jumpInfo = MatchRecordDataInterface.getInstance():getMatchJumpInfo();
    if not table.isEmpty(jumpInfo) then
        local recordTabId = jumpInfo.recordTabId;
        if recordTabId then
            local btns = {self.s_controls.myInfoTabBtn, self.s_controls.historyTabBtn, self.s_controls.rankTabBtn};
            local ctrlId = btns[number.valueOf(recordTabId)];
            if ctrlId then
                local btn = self:findViewById(ctrlId);
                if btn then
                    self:_checkTabBtnStatus(btn:getID());
                    return;
                end
            end 
        end
    end

    self:_showDefaultView();
end


GameMatchHallRecord._showDefaultView = function(self)
    local myInfoTabBtn = self:findViewById(self.s_controls.myInfoTabBtn);
    self:_checkTabBtnStatus(myInfoTabBtn:getID());
end

GameMatchHallRecord.resetView = function(self)
    self.m_rankView:setVisible(false);
    self.m_historyView:setVisible(false);
    self.m_myInfoView:setVisible(false);
end

-- ---------------------------------我的战绩--------------------------------------
GameMatchHallRecord.showMyInfoView = function(self)
    if not self.m_myInfoLayer then
        local gameMatchHallRecordMyInfoLayer = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/myInfo/gameMatchHallRecordMyInfoLayer");
        self.m_myInfoLayer = new(gameMatchHallRecordMyInfoLayer);
        self.m_myInfoView:addChild(self.m_myInfoLayer);
    end

    self.m_myInfoLayer:show();

    self.m_myInfoView:setVisible(true);
end

---------------------------------历史战绩--------------------------------------
GameMatchHallRecord.showHistoryView = function(self)
    if not self.m_historyLayer then
        local gameMatchHallRecordHistoryLayer = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/history/gameMatchHallRecordHistoryLayer");
        self.m_historyLayer = new(gameMatchHallRecordHistoryLayer);
        self.m_historyLayer:setDelegate(self);
        self.m_historyView:addChild(self.m_historyLayer);
    end

    self.m_historyLayer:show();

    self.m_historyView:setVisible(true);
end

-- 弹出报名弹框，最近一场定时赛，或第一场定局赛
GameMatchHallRecord.onSignupBtnClick = function(self)
    self:onCloseBtnClick();
    local data = MatchHallDataInterface.getInstance():getClosestMatch();
    self:execDelegate(GameMatchHallRecord.Delegate.onMatchRecordSignupMatch, data);
end


---------------------------------好友排行--------------------------------------
GameMatchHallRecord.showRankView = function(self)
    if not self.m_rankLayer then
        local gameMatchHallRecordRankLayer = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/rank/gameMatchHallRecordRankLayer");
        self.m_rankLayer = new(gameMatchHallRecordRankLayer);
        self.m_rankView:addChild(self.m_rankLayer);
    end

    self.m_rankLayer:show();

    self.m_rankView:setVisible(true);
end

--------------------------------------------------------------------------------
GameMatchHallRecord.s_controlConfig =
{   
    [GameMatchHallRecord.s_controls.closeBtn] = {"contentBg", "closeBtn"};

    [GameMatchHallRecord.s_controls.rankTabBtn] = {"contentBg", "tabView", "rankTabBtn"};
    [GameMatchHallRecord.s_controls.historyTabBtn] = {"contentBg", "tabView", "historyTabBtn"};
    [GameMatchHallRecord.s_controls.myInfoTabBtn] = {"contentBg", "tabView", "myInfoTabBtn"};

    [GameMatchHallRecord.s_controls.rankView] = {"contentBg", "centerView", "rankView"};
    [GameMatchHallRecord.s_controls.historyView] = {"contentBg", "centerView", "historyView"};
    [GameMatchHallRecord.s_controls.myInfoView] = {"contentBg", "centerView", "myInfoView"};

};

GameMatchHallRecord.s_controlFuncMap =
{
    [GameMatchHallRecord.s_controls.closeBtn] = GameMatchHallRecord.onCloseBtnClick;

    [GameMatchHallRecord.s_controls.rankTabBtn] = GameMatchHallRecord.onTabBtnClick;
    [GameMatchHallRecord.s_controls.historyTabBtn] = GameMatchHallRecord.onTabBtnClick;
    [GameMatchHallRecord.s_controls.myInfoTabBtn] = GameMatchHallRecord.onTabBtnClick;
};

GameMatchHallRecord.s_cmdConfig =
{
};


return GameMatchHallRecord;