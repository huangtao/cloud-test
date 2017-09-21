local invitational_detail_layout = require(ViewPath .. "hall/invitational/invitational_detail_layout");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
require("isolater/interface/gameInfoIsolater");
require("util/schedule");
require("hall/recharge/data/rechargeDataInterface");
require("uilibs/richText")
require("uilibs/userMoneyItem");

-- 比赛详细弹框
local InvitationalMatchDetail = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

InvitationalMatchDetail.s_controls = 
{
    closeBtn = getIndex(),
    titleBg = getIndex(),
    title = getIndex(),
    contentView = getIndex(),
    signupBtn = getIndex(),
    signupBtnIcon = getIndex(),
    ruleBtn = getIndex(),
    reviveIcon = getIndex(),
    timeView = getIndex(),
    timeText = getIndex(),
    selectView = getIndex(),
    selectViewMask = getIndex(),
    selectViewBg = getIndex(),
    matchTimeVal = getIndex(),
    enrollCountStr = getIndex(),
    enrollCountVal = getIndex(),
    countdownView = getIndex(),
    matchCountView = getIndex(),
    countdownStr = getIndex(),
    matchCountStr = getIndex(),
    rankView = getIndex(),
    enrollSelectVal = getIndex(),
    helpBtn = getIndex(),
    matchCodeStr = getIndex(),
    matchCodeVal = getIndex(),
    passwordStr = getIndex(),
    passwordView = getIndex(),
    passwordBtn = getIndex(),
    passwordVal = getIndex(),
};

InvitationalMatchDetail.Delegate = {
    onMatchDetailLayerClose = "onMatchDetailLayerClose";
    onMatchDetailLayerSignup = "onMatchDetailLayerSignup";
}

InvitationalMatchDetail.s_cmds = 
{

};

InvitationalMatchDetail.ctor = function(self)
    super(self, invitational_detail_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc)
    self:setEventDrag(self, self.onEmptyFunc);

    self:_initView();
    self:setVisible(false)

    MatchHallDataInterface.getInstance():setObserver(self);
    kUserInfoData:setObserver(self);
    kGoodsListInterface:setObserver(self);
end

InvitationalMatchDetail.dtor = function(self)
    MatchHallDataInterface.getInstance():clearObserver(self);
    kUserInfoData:clearObserver(self);
    self:_removeTimer()
end

InvitationalMatchDetail.hide = function(self)
    CommonGameLayer.hide(self);
    self:_removeTimer()
end

InvitationalMatchDetail.onEmptyFunc = function(self) 
end

-- 回调scene处理弹框关闭
InvitationalMatchDetail.onCloseBtnClick = function(self)
    self:execDelegate(InvitationalMatchDetail.Delegate.onMatchDetailLayerClose, true);
end

InvitationalMatchDetail.hasOpenLayer = function(self)
    local hasOpenLayer = false

    if ((self.m_ruleView and self.m_ruleView:isShowing()) or 
        (self.m_helpViewExit and self.m_helpViewExit:isShowing())) then
        hasOpenLayer = true
    end
    return hasOpenLayer
end

InvitationalMatchDetail.setData = function(self, data)
    self.m_data = data
    if table.isEmpty(data) then
        return
    end
    Log.v("InvitationalMatchDetail.setData",self.m_data)

    self:setTitle()
    self:setEnrollCountVal()
    self:setInfoTime()
    self:setMatchTimeVal()
    self:showFee()
    self:setDataDetail()
    self:setMatchStatus()
    self:setMatchCodeVal()
    self:updateRule()
    --self:setPassword()
end

InvitationalMatchDetail.getData = function(self)
    return self.m_data
end

-- 点击按钮
InvitationalMatchDetail.onSignupBtnClick = function(self)
    self:_signupMatch()
end

--报名比赛
InvitationalMatchDetail._signupMatch = function(self)
    Log.v("InvitationalMatchDetail._signupMatch================",self.m_data)
    self:execDelegate(InvitationalMatchDetail.Delegate.onMatchDetailLayerClose, true);
    self:execDelegate(InvitationalMatchDetail.Delegate.onMatchDetailLayerSignup, self.m_data)
end

---------------------------------------------------------------------------------

InvitationalMatchDetail._initView = function(self)
    self.m_titleBg = self:findViewById(self.s_controls.titleBg);
    self.m_title = self:findViewById(self.s_controls.title);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
    
    self.m_signupBtn = self:findViewById(self.s_controls.signupBtn);
    self.m_signupBtnIcon = self:findViewById(self.s_controls.signupBtnIcon);
    self.m_helpBtn = self:findViewById(self.s_controls.helpBtn);
    self.m_reviveIcon = self:findViewById(self.s_controls.reviveIcon)

    self.m_timeView = self:findViewById(self.s_controls.timeView);
    self.m_timeText = self:findViewById(self.s_controls.timeText);

    self.m_ruleBtn = self:findViewById(self.s_controls.ruleBtn);

    --self.m_ruleItemText = self:_createRichText(self.m_ruleBtn);

    self.m_enrollCountStr = self:findViewById(self.s_controls.enrollCountStr)
    self.m_enrollCountVal = self:findViewById(self.s_controls.enrollCountVal)
    self.m_matchTimeVal = self:findViewById(self.s_controls.matchTimeVal)
    self.m_matchCountView = self:findViewById(self.s_controls.matchCountView)
    self.m_countdownStr = self:findViewById(self.s_controls.countdownStr)
    self.m_matchCountStr = self:findViewById(self.s_controls.matchCountStr)
    self.m_rankView = self:findViewById(self.s_controls.rankView)
    self.m_enrollSelectVal = self:findViewById(self.s_controls.enrollSelectVal)
    self.m_selectView = self:findViewById(self.s_controls.selectView)
    self.m_selectViewBg = self:findViewById(self.s_controls.selectViewBg)
    self.m_selectViewMask = self:findViewById(self.s_controls.selectViewMask)
    self.m_matchCodeStr = self:findViewById(self.s_controls.matchCodeStr)
    self.m_matchCodeVal = self:findViewById(self.s_controls.matchCodeVal)
    self.m_passwordStr = self:findViewById(self.s_controls.passwordStr)
    self.m_passwordView = self:findViewById(self.s_controls.passwordView)
    self.m_passwordBtn = self:findViewById(self.s_controls.passwordBtn)
    self.m_passwordVal = self:findViewById(self.s_controls.passwordVal)
end

InvitationalMatchDetail.setMatchCodeVal = function(self)
    self.m_matchCodeVal:setText(self.m_data.id)
end

InvitationalMatchDetail.setPassword = function(self)
    local isNeedPassword = InvitationalDataInterface.getInstance():isNeedPassword(self.m_data) and self.m_data.createId == kUserInfoData:getUserId()
    self.m_passwordStr:setVisible(isNeedPassword)
    self.m_passwordView:setVisible(isNeedPassword)
    self.m_enrollCountStr:setVisible(not isNeedPassword)
    self.m_enrollCountVal:setVisible(not isNeedPassword)
    self.m_passwordVal:setText(self.m_data.matchentrycode or "")
end

--设置报名人数
InvitationalMatchDetail.setEnrollCountVal = function(self)
    local data = self.m_data
    self.m_enrollCountVal:setText(data.allapplynum .. "/" .. data.requestnum)
end

--设置开赛信息
InvitationalMatchDetail.setInfoTime = function(self)
    local data = self.m_data
    local now = GameInfoIsolater.getInstance():getRightTimeWithServer()
    local delta = data.stime - now
    local secondADay = 24 * 3600
    if delta < 0 then
        self:_setTextTime(false, "00,00")
    elseif delta <= secondADay then
        self:_createTimer(delta)
    else
        local day = ToolKit.getDayInterval(now, data.stime)
        self:_setTextTime(true, day)
    end
end

--显示距离开赛信息
InvitationalMatchDetail._setTextTime = function(self, isShowText, str)
    self.m_timeText:setText("天后开赛", 1)
    self.m_timeText:setVisible(isShowText)

    if not self.m_timeNum then
        self.m_timeNum = new(UserMoneyItem);
        self.m_timeNum:setAlign(kAlignLeft);
        self.m_timeView:addChild(self.m_timeNum)
    end

    UserMoneyItem.setFilePath( UserMoneyItem.s_matchDetailNumFilePath );
    self.m_timeNum:setNormalMoneyNum(str, 0.7);
    UserMoneyItem.setFilePath();
    local width, height = self.m_timeNum:getSize()
    if isShowText then
        self.m_timeText:setPos(width+5)
    end
end

--创建计时器
InvitationalMatchDetail._createTimer = function(self, time)
    self:_removeTimer();

    self:setMatchTimeText(time);
    Schedule.getInstance():registerListener(self, self._onTimer, 1000, kAnimRepeat, nil, "updateTime");
end

--删除计时器
InvitationalMatchDetail._removeTimer = function(self)
    Schedule.getInstance():unregisterListener(self, self._onTimer, "updateTime");
end

--计时器回调
InvitationalMatchDetail._onTimer = function(self)
    local diff = self.m_data.stime - GameInfoIsolater.getInstance():getRightTimeWithServer()
    if diff < 0 then
        self:_removeTimer();
        Toast.getInstance():showText("比赛已开始",50,30,kAlignLeft,"",30,200,175,115);
        self:onCloseBtnClick();
        return
    end

    self:setMatchTimeText(diff)
end

--设置比赛倒计时文本
InvitationalMatchDetail.setMatchTimeText = function(self, time)
    local h, _ = math.floor(time/3600);
    local m, _ = math.floor(time % 3600 / 60);
    local s = time % 3600 % 60;
    local str;
    if h > 0 then
        str = string.format("%.2d,%.2d,%.2d", h, m, s);
    else
        str = string.format("%.2d,%.2d", m, s);
    end
    self:_setTextTime(false, str);
end

--设置比赛预计时长
InvitationalMatchDetail.setMatchTimeVal = function(self)
    local data = self.m_data
    self.m_matchTimeVal:setText(string.format("约%s分钟", data.estimateduration or 0 ))
end

--显示多种报名条件
InvitationalMatchDetail.showFee = function(self)
    local data = self.m_data.fee
    local isEmpty = table.isEmpty(data)
    self.m_enrollSelectVal:setVisible(isEmpty)
    self.m_selectViewBg:setVisible(not isEmpty)
    
    if isEmpty then
        self.m_enrollSelectVal:setText("免费")
    else
        self.m_selectViewBg:setFile("hall/common/bg_blank.png")
        self.m_selectView:setScrollBarWidth(0)
        self.m_selectView:removeAllChildren(true)
        local GameMatchHallDetailSelectListItem = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailSelectListItem")
        if not self.m_selectViewAdapter then
            self.m_selectViewAdapter = new(CacheAdapter, GameMatchHallDetailSelectListItem, data)
            self.m_selectView:setAdapter(self.m_selectViewAdapter)
        else
            self.m_selectViewAdapter:changeData(data)
        end
        self.m_selectViewAdapter:getView(1):setDirectionState(false)
        self.m_selectViewAdapter:getView(1):setStrState(false)
        self.m_selectViewAdapter:getView(#data):setLineState(false)
        self.m_selectViewMask:setVisible(false)
    end
end

--设置标题
InvitationalMatchDetail.setTitle = function(self)
    local data = self.m_data
    local name = string.valueOf(data.name):remove("#")
    local nameSub = string.subUtfStrByCn(name, 1, 15, "")
    if string.len(name) > string.len(nameSub) then
        nameSub = string.subUtfStrByCn(name, 1, 14, "...")
    end
    self.m_title:setText(nameSub)
end

--设置奖励
InvitationalMatchDetail.setDataDetail = function(self, info)
    local rewardData = self.m_data.awardsList
    local iconData = {}
    if info then
        rewardData = info.award
        iconData = info.icon
    end
    if table.isEmpty(rewardData) then
        return
    end

    local GameMatchHallDetailLeftTop = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailLeftTop")
    local GameMatchHallDetailLeftItem = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailLeftItem")
    if self.m_rankList then
        self.m_rankList:removeAllChildren(true)
        self.m_rankView:removeChild(self.m_rankList, true)
    end

    local w,h = self.m_rankView:getSize()
    self.m_rankList = UIFactory.createScrollView(0,0,w,h,true)
    self.m_rankView:addChild(self.m_rankList)
    
    local height = 0
    local topView = new(GameMatchHallDetailLeftTop, rewardData, iconData)
    self.m_rankList:addChild(topView)
    topView:setPos(nil, 116)
    topView:setAlign(kAlignTop)
    height = height + 250
    for i=4,#rewardData do
        local view = new(GameMatchHallDetailLeftItem, rewardData[i])
        self.m_rankList:addChild(view)
        view:setPos(nil, height)
        view:setAlign(kAlignTop)
        height = height + 60
    end
    self.m_rankList:setNodeWidthHeight(nil, height)
    self.m_rankList:update()
end

-- 根据比赛状态显示相应数据
InvitationalMatchDetail.setMatchStatus = function(self)
    local matchStatus = self.m_data.status
    local text = self.m_signupBtn:getChildByName("signupText")
    self.m_helpBtn:setVisible(false)
    self.m_signupBtn:setPickable(true)
    if matchStatus == InvitationalConstants.eMatchStatus.NO_SIGN then
        text:setText("马上报名")
        self:setLockState()
    elseif matchStatus == InvitationalConstants.eMatchStatus.SIGNED then
        text:setText("退赛")
        self:updateExitView()
        if not table.isEmpty(self.m_data.fee) and self.m_data.fee[1].num ~= 0  then
            self.m_helpBtn:setVisible(true)
        end
    elseif matchStatus == InvitationalConstants.eMatchStatus.CAN_ENTER then
        text:setText("进入")
    elseif matchStatus == InvitationalConstants.eMatchStatus.STARTED then
        text:setText("比赛已开始")
        self.m_signupBtn:setPickable(false)
    else
        text:setText("等待报名")
        self.m_signupBtn:setPickable(false)
    end
end

--通知定时赛可以进入比赛
InvitationalMatchDetail.onTimeToEnterMatch = function(self, data)
    if self.m_data.id == data.matchId then
        self.m_data.status = InvitationalConstants.eMatchStatus.CAN_ENTER
        self:setMatchStatus()
    end
end

InvitationalMatchDetail.setLockState = function(self)
    self.m_signupBtnIcon:setVisible(InvitationalDataInterface.getInstance():isNeedPassword(self.m_data))
end

-- 退赛帮助
InvitationalMatchDetail.updateExitView = function(self)
    if self.m_helpViewExit then
        delete(self.m_helpViewExit);
        self.m_helpViewExit = nil;
    end

    local gameMatchHallDetailHelpViewExit = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailHelpViewExit");

    self.m_helpViewExit = new(gameMatchHallDetailHelpViewExit);
    self:addChild(self.m_helpViewExit);
end

-- 退赛帮助
InvitationalMatchDetail.onExitHelpBtnClick = function(self)
    local data = self.m_data;
    UBReport.getInstance():report(UBConfig.kHallMatchExitHelp, (data and data.id) and data.id or "");

    if self.m_helpViewExit then
        local x, y = self.m_signupBtn:getAbsolutePos();
        local w, h = self.m_signupBtn:getSize();
        self.m_helpViewExit:setContentPos(x + w / 2, y + h * 3 / 8);
        self.m_helpViewExit:show();
    end
end

-- rule view callback 
InvitationalMatchDetail.onDetailRuleShowCallback = function(self)
    self.m_contentView:setVisible(false);
end

-- rule view callback 
InvitationalMatchDetail.onDetailRuleCloseCallback = function(self)
    self.m_contentView:setVisible(true);
end

InvitationalMatchDetail.onRuleBtnClick = function(self)
    if self.m_ruleView then
        self.m_ruleView:show()
    end
end

-- 更新规则
InvitationalMatchDetail.updateRule = function(self)
    local data = self.m_data.rulesContent
    if table.isEmpty(data) then
        return
    end
    if self.m_ruleView then
        delete(self.m_ruleView)
        self.m_ruleView = nil
    end

    local invitationalDetailRule = require("hall/invitational/widget/invitationalDetailRule")
    self.m_ruleView = new(invitationalDetailRule, data)
    self.m_ruleView:setDelegate(self)
    self:addChild(self.m_ruleView)
end

InvitationalMatchDetail.onPasswordBtnClick = function(self)
    self.m_passwordBtn:setVisible(false)
    self.m_passwordVal:setVisible(true)
end

InvitationalMatchDetail.s_controlConfig =
{   
    [InvitationalMatchDetail.s_controls.closeBtn] = {"content", "closeBtn"};
    [InvitationalMatchDetail.s_controls.titleBg] = {"content", "titleBg"};
    [InvitationalMatchDetail.s_controls.title] = {"content", "titleBg", "txtTitle"};
    [InvitationalMatchDetail.s_controls.contentView] = {"content", "contentView"};
    [InvitationalMatchDetail.s_controls.signupBtn] = {"content", "contentView", "rightView", "signupBtn"};
    [InvitationalMatchDetail.s_controls.signupBtnIcon] = {"content", "contentView", "rightView", "signupBtn", "icon"};
    [InvitationalMatchDetail.s_controls.helpBtn] = {"content", "contentView", "rightView", "signupBtn", "helpBtn"};
    [InvitationalMatchDetail.s_controls.ruleBtn] = {"content", "contentView", "leftView", "ruleBtn"};
    [InvitationalMatchDetail.s_controls.reviveIcon] = {"content", "contentView", "leftView", "ruleBtn", "icon"};
    [InvitationalMatchDetail.s_controls.rankView] = {"content", "contentView", "leftView", "rankView"};

    [InvitationalMatchDetail.s_controls.timeView] = {"content", "contentView", "rightView", "infoView", "countdownView"};
    [InvitationalMatchDetail.s_controls.timeText] = {"content", "contentView", "rightView", "infoView", "countdownView", "countdownText"};
    [InvitationalMatchDetail.s_controls.selectViewMask] = {"selectViewMask"};
    [InvitationalMatchDetail.s_controls.selectView] = {"selectContent", "contentView", "rightView","infoView", "selectViewBg", "selectView"};
    [InvitationalMatchDetail.s_controls.selectViewBg] = {"selectContent", "contentView", "rightView","infoView", "selectViewBg"};
    [InvitationalMatchDetail.s_controls.matchTimeVal] = {"content", "contentView", "rightView","infoView", "matchTimeVal"};
    [InvitationalMatchDetail.s_controls.enrollCountStr] = {"content", "contentView", "rightView","infoView", "enrollCountStr"};
    [InvitationalMatchDetail.s_controls.enrollCountVal] = {"content", "contentView", "rightView","infoView", "enrollCountVal"};
    [InvitationalMatchDetail.s_controls.matchCountView] = {"content", "contentView", "rightView","infoView", "matchCountView"};
    [InvitationalMatchDetail.s_controls.countdownStr] = {"content", "contentView", "rightView","infoView", "countdownStr"};
    [InvitationalMatchDetail.s_controls.matchCountStr] = {"content", "contentView", "rightView","infoView", "matchCountStr"};
    [InvitationalMatchDetail.s_controls.enrollSelectVal] = {"content", "contentView", "rightView","infoView", "enrollSelectVal"};
    [InvitationalMatchDetail.s_controls.matchCodeStr] = {"content", "contentView", "rightView","infoView", "matchCodeStr"};
    [InvitationalMatchDetail.s_controls.matchCodeVal] = {"content", "contentView", "rightView","infoView", "matchCodeVal"};
    [InvitationalMatchDetail.s_controls.passwordStr] = {"content", "contentView", "rightView","infoView", "passwordStr"};
    [InvitationalMatchDetail.s_controls.passwordView] = {"content", "contentView", "rightView","infoView", "passwordView"};
    [InvitationalMatchDetail.s_controls.passwordBtn] = {"content", "contentView", "rightView","infoView", "passwordView", "btn"};
    [InvitationalMatchDetail.s_controls.passwordVal] = {"content", "contentView", "rightView","infoView", "passwordView", "password"};
};

InvitationalMatchDetail.s_controlFuncMap =
{
    [InvitationalMatchDetail.s_controls.closeBtn] = InvitationalMatchDetail.onCloseBtnClick;
    [InvitationalMatchDetail.s_controls.ruleBtn] = InvitationalMatchDetail.onRuleBtnClick;
    [InvitationalMatchDetail.s_controls.signupBtn] = InvitationalMatchDetail.onSignupBtnClick;
    [InvitationalMatchDetail.s_controls.helpBtn] = InvitationalMatchDetail.onExitHelpBtnClick;
    [InvitationalMatchDetail.s_controls.passwordBtn] = InvitationalMatchDetail.onPasswordBtnClick;
    [InvitationalMatchDetail.s_controls.selectViewMask] = InvitationalMatchDetail.onSelectViewMaskClick;
};

InvitationalMatchDetail.s_cmdConfig =
{
}


return InvitationalMatchDetail;