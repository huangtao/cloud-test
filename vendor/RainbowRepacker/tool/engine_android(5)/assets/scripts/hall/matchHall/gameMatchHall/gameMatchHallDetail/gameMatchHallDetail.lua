local match_hall_detail_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_detail_layout");
local match_hall_pin_map = require("qnFiles/qnPlist/hall/match_hall_pin");
require("isolater/interface/gameInfoIsolater");
require("util/schedule");
require("hall/recharge/data/rechargeDataInterface");
require("uilibs/richText")
require("uilibs/userMoneyItem");

-- 比赛详细弹框
local GameMatchHallDetail = class(CommonGameLayer, false);

GameMatchHallDetail.s_itemFontSize = 24;
GameMatchHallDetail.s_feeIconSize = 45;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallDetail.s_controls = 
{
    closeBtn = getIndex(),
    titleBg = getIndex(),
    title = getIndex(),
    contentView = getIndex(),
    signupBtn = getIndex(),
    ruleBtn = getIndex(),
    reviveIcon = getIndex(),
    timeView = getIndex(),
    timeText = getIndex(),
    selectView = getIndex(),
    selectViewMask = getIndex(),
    selectViewBg = getIndex(),
    matchTimeStr = getIndex(),
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

GameMatchHallDetail.Delegate = {
    -- 弹框统一在Scene中处理，以响应物理返回
    onMatchDetailLayerClose = "onMatchDetailLayerClose";
    onMatchDetailLayerSignup = "onMatchDetailLayerSignup";
}


GameMatchHallDetail.s_cmds = 
{

};

GameMatchHallDetail.eMatchState = {
    CAN_SIGNUP_FREE = 1,                -- 可以报名(免费)
    CAN_SIGNUP_NOT_FREE = 2,            -- 可以报名(不免费)
    CAN_NOT_SIGNUP = 3,                 -- 不可报名
    CAN_NOT_SIGNUP_CAN_PAY = 4,         -- 不可报名(可充值)
    AREALDY_SIGNUP_CAN_ENTER = 5,       -- 已报名(可进入)
    AREALDY_SIGNUP_CAN_NOT_ENTER = 6,   -- 已报名(不可进入)
    WAIT_SIGNUP = 7;                    -- 等待报名
};

GameMatchHallDetail.ctor = function(self)
    super(self, match_hall_detail_layout);
   
    self:setFillParent(true, true);
    self:setAlign(kAlignCenter);
    self:setEventTouch(self, self.onEmptyFunc)
    self:setEventDrag(self, self.onEmptyFunc);

    self:_initView();
    self:setVisible(false);

    MatchHallDataInterface.getInstance():setObserver(self);
    kUserInfoData:setObserver(self);
    kGoodsListInterface:setObserver(self);
end

GameMatchHallDetail.dtor = function(self)
    self:_removeTimer();
    kGoodsListInterface:clearObserver(self);
    MatchHallDataInterface.getInstance():clearObserver(self);
    kUserInfoData:clearObserver(self);
    self:rmSelectViewChild()
end

GameMatchHallDetail.hide = function(self)
    CommonGameLayer.hide(self);
    self:_removeTimer();
    self:rmSelectViewChild()
    self.m_isInitPassword = nil
end

--删除多种报名选择框的子控件
GameMatchHallDetail.rmSelectViewChild = function(self)
    if self.m_selectView then
        self.m_selectView:removeAllChildren(true)
    end
end

-- 基本数据(报名方式)
GameMatchHallDetail.setData = function(self, data)
    LoadingView.getInstance():showText("数据加载中");
    
    self.m_data = data;
    self:_updateData();
end

GameMatchHallDetail.getData = function(self)
    return self.m_data;
end

GameMatchHallDetail.hasOpenLayer = function(self)
    local hasOpenLayer = false;

    if (self.m_rewardView and self.m_rewardView:isShowing()) or 
        (self.m_ruleView and self.m_ruleView:isShowing()) or 
        (self.m_helpViewFee and self.m_helpViewFee:isShowing()) or 
        (self.m_helpViewExit and self.m_helpViewExit:isShowing()) or
        (self.m_verificationView and self.m_verificationView:isShowing()) then
        hasOpenLayer = true;
    end

    return hasOpenLayer;
end

--更新数据
GameMatchHallDetail._updateData = function(self, isShowDetail)
    self:_resetView();

    if isShowDetail then
        self:setDataDetail(self.m_dataDetail);
    end

    if self.m_data then
        self:setMatchType(self.m_data)
        self:_showData();
    end
end

--获取下一场循环赛回调
GameMatchHallDetail.onGetNextLoopMatchInfo = function(self, isSuccess, data)
    if isSuccess and not table.isEmpty(data) then
        if self.m_data.configid == data.configid then
            self.m_data = data;
            self:_updateData(true);
        end
    end
end

--通知定时赛可以进入比赛
GameMatchHallDetail.onTimeToEnterMatch = function(self, data)
    if self.m_data.id == data.matchId then
        self.m_data.status = GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN;
        self:_updateData(true);
    end
end

-- 详细数据(规则, 奖励)
GameMatchHallDetail.setDataDetail = function(self, data)
    LoadingView.getInstance():hidden();
    self.m_dataDetail = data;

    if self.m_dataDetail then
        if table.isEmpty(self.m_dataDetail.rulescontent) then
            self:updateRule()
        else
            self:updateInvitationalRule()
        end
        self:updateTime();
        self:updateReward();
    end
end

-- 预计时间
GameMatchHallDetail.updateTime = function(self)
    self:setMatchTimeVal(string.format("%s", self.m_dataDetail.estimateduration or 0 ))
end

-- 更新规则
GameMatchHallDetail.updateRule = function(self)
    if self.m_ruleView then
        delete(self.m_ruleView);
        self.m_ruleView = nil;
    end

    local ruleData = self.m_dataDetail.desc;
    if string.isEmpty(ruleData) then
        return;
    end

    local gameMatchHallDetailRule = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailRule");
    self.m_ruleView = new(gameMatchHallDetailRule, ruleData);
    self.m_ruleView:setDelegate(self);
    self:addChild(self.m_ruleView);
end

-- 更新邀请赛规则
GameMatchHallDetail.updateInvitationalRule = function(self)
    local data = self.m_dataDetail.rulescontent
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

-- 更新奖励
GameMatchHallDetail.updateReward = function(self)
    local rewardData = self.m_dataDetail.award;
    if table.isEmpty(rewardData) then
        return;
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
    local topView = new(GameMatchHallDetailLeftTop, rewardData, self.m_dataDetail.icon)
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

-- 回调scene处理弹框关闭
GameMatchHallDetail.onCloseBtnClick = function(self)
    if self:hasOpenLayer() then
        EventDispatcher.getInstance():dispatch(kClosePopupWindows);
    end

    self:execDelegate(GameMatchHallDetail.Delegate.onMatchDetailLayerClose, true);
end

-- 银币更新回调,刷新列表
GameMatchHallDetail.refreshUserProperty = function(self,propertyType,curNum,lastNum)
    if propertyType == RechargeDataInterface.getInstance():getPropertySilverCoinID() or 
        propertyType == RechargeDataInterface.getInstance():getPropertyGoldBarID() then
        
        local data = self.m_data;
        local dataDetail = self.m_dataDetail;
        self:setData(data);
        self:setDataDetail(dataDetail);
    end
end
    
GameMatchHallDetail.onRuleBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchRuleItem);

    if self.m_ruleView then
        self.m_ruleView:show();
    end
end

GameMatchHallDetail.onRewardBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallMatchRewardItem);

    if self.m_rewardView then
        self.m_rewardView:show();
    end
end

-- rule view callback 
GameMatchHallDetail.onDetailRuleShowCallback = function(self)
    self.m_contentView:setVisible(false);
end

-- rule view callback 
GameMatchHallDetail.onDetailRuleCloseCallback = function(self)
    self.m_contentView:setVisible(true);
end

-- reward view callback 
GameMatchHallDetail.onDetailRewardShowCallback = function(self)
    self.m_contentView:setVisible(false);
end

-- reward view callback 
GameMatchHallDetail.onDetailRewardCloseCallback = function(self)
    self.m_contentView:setVisible(true);
end

-- 报名
GameMatchHallDetail.onSignupBtnClick = function(self)
    Log.v("GameMatchHallDetail.onSignupBtnClick ==>> 报名 matchId", self.m_data.id);
    self:_reportSignup();

    if self:_isNeedVerification() then
        self:_showVerificationView();
    else
        self:_signupMatch();
    end
end

--邀请码输入确认回调
GameMatchHallDetail.onDetailVerificationConfirmCallback = function(self)
    self:_signupMatch();
end

--显示邀请码视图
GameMatchHallDetail._showVerificationView = function(self)
    if not self.m_verificationView then
        local gameMatchHallDetailVerification = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailVerification");
        self.m_verificationView = new(gameMatchHallDetailVerification);
        self.m_verificationView:setDelegate(self);
        self:addChild(self.m_verificationView);
    end
    self.m_verificationView:show(self.m_data);
end

--检验是否需要邀请码
GameMatchHallDetail._isNeedVerification = function(self)
    local isNeedVerification = false;

    if not table.isEmpty(self.m_data) and not string.isEmpty(self.m_data.matchentrycode)
        and self.m_matchType ~= GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_ENTER 
        and self.m_matchType ~= GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_NOT_ENTER then
        isNeedVerification = true;
    end

    return isNeedVerification;
end

--报名比赛
GameMatchHallDetail._signupMatch = function(self)
    self:execDelegate(GameMatchHallDetail.Delegate.onMatchDetailLayerClose, true);
    self:execDelegate(GameMatchHallDetail.Delegate.onMatchDetailLayerSignup, self.m_data) -- 报名
end

-------------------------------------------帮助--------------------------------------
-- 退赛帮助
GameMatchHallDetail.updateExitView = function(self)
    if self.m_helpViewExit then
        delete(self.m_helpViewExit);
        self.m_helpViewExit = nil;
    end

    local gameMatchHallDetailHelpViewExit = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailHelpViewExit");

    self.m_helpViewExit = new(gameMatchHallDetailHelpViewExit);
    self:addChild(self.m_helpViewExit);
end

-- 报名资格不足帮助
GameMatchHallDetail.onConditionsNotMetHelpBtnClick = function(self)
    local data = self.m_data;
    UBReport.getInstance():report(UBConfig.kHallMatchConditionsNotMetHelp, (data and data.id) and data.id or "");

    if self.m_helpViewFee then
        local x, y = self.m_signupBtn:getAbsolutePos();
        local w, h = self.m_signupBtn:getSize();
        self.m_helpViewFee:setContentPos(x + w / 2, y + h * 3 / 8);
        self.m_helpViewFee:show();
    end
end

-- 退赛帮助
GameMatchHallDetail.onExitHelpBtnClick = function(self)
    local data = self.m_data;
    UBReport.getInstance():report(UBConfig.kHallMatchExitHelp, (data and data.id) and data.id or "");

    if self.m_helpViewExit then
        local x, y = self.m_signupBtn:getAbsolutePos();
        local w, h = self.m_signupBtn:getSize();
        self.m_helpViewExit:setContentPos(x + w / 2, y + h * 3 / 8);
        self.m_helpViewExit:show();
    end
end

GameMatchHallDetail.onEmptyFunc = function(self) 
end

---------------------------------------------------------------------------------

GameMatchHallDetail._initView = function(self)
    self.m_titleBg = self:findViewById(self.s_controls.titleBg);
    self.m_title = self:findViewById(self.s_controls.title);
    self.m_contentView = self:findViewById(self.s_controls.contentView);
    
    self.m_signupBtn = self:findViewById(self.s_controls.signupBtn);
    self.m_helpBtn = self:findViewById(self.s_controls.helpBtn);
    self.m_reviveIcon = self:findViewById(self.s_controls.reviveIcon)

    self.m_timeView = self:findViewById(self.s_controls.timeView);
    self.m_timeText = self:findViewById(self.s_controls.timeText);

    self.m_ruleBtn = self:findViewById(self.s_controls.ruleBtn);

    self.m_enrollCountStr = self:findViewById(self.s_controls.enrollCountStr)
    self.m_enrollCountVal = self:findViewById(self.s_controls.enrollCountVal)
    self.m_matchTimeStr = self:findViewById(self.s_controls.matchTimeStr)
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

GameMatchHallDetail.setInfoViewItemStyle = function(self, isInvitational)
    self.m_countdownStr:setPos(nil, isInvitational and 15 or 25)
    self.m_timeView:setPos(nil, isInvitational and 0 or 10)
    self.m_matchCountStr:setPos(nil, isInvitational and 15 or 25)
    self.m_matchCountView:setPos(nil, isInvitational and 0 or 10)
    self.m_matchTimeStr:setPos(nil, isInvitational and 60 or 80)
    self.m_matchTimeVal:setPos(nil, isInvitational and 60 or 80)
    self.m_enrollCountStr:setPos(nil, isInvitational and 148 or 136)
    self.m_enrollCountVal:setPos(nil, isInvitational and 148 or 136)
    self.m_matchCodeStr:setVisible(isInvitational)
    self.m_matchCodeVal:setVisible(isInvitational)
    self.m_matchCodeVal:setText(self.m_data.id)
end

GameMatchHallDetail.setPassword = function(self)
    if self.m_isInitPassword then
        return
    end
    self.m_passwordBtn:setVisible(true)
    self.m_passwordVal:setVisible(false)
    self.m_isInitPassword = true
    local isNeedPassword = (not string.isEmpty(self.m_data.matchentrycode)) and self.m_data.createId == kUserInfoData:getUserId()
    self.m_passwordStr:setVisible(isNeedPassword)
    self.m_passwordView:setVisible(isNeedPassword)
    self.m_enrollCountStr:setVisible(not isNeedPassword)
    self.m_enrollCountVal:setVisible(not isNeedPassword)
    self.m_passwordVal:setText(self.m_data.matchentrycode or "")
end

--显示复活赛图标
GameMatchHallDetail.showReviveIcon = function(self)
    if self.m_data then
        self.m_reviveIcon:setVisible(self.m_data.isfhmatch == 1)
    end
end

--显示门槛
GameMatchHallDetail.showThreshold = function(self)
    if not self.m_data then
        return
    end
    local result,error_type = MatchHallDataInterface.getInstance():checkEnroll(self.m_data.thresholdType, self.m_data.threshold)
    if not result then
        self.m_selectViewBg:setVisible(false) 
        self.m_enrollSelectVal:setVisible(true)
        self.m_enrollSelectVal:setText(string.format("需要携带%s%s方可报名", self.m_data.threshold, 
            (self.m_data.thresholdType == 0) and "银币" or "金条"))
    end
end

--显示多种报名方式选择列表
GameMatchHallDetail.showSelectList = function(self, isSort)
    if not self.m_data then
        return
    end
    self.m_selectViewIsSpread = false
    self.m_data.fee = isSort and MatchHallDataInterface.getInstance():sortFee(self.m_data.fee) or self.m_data.fee
    local data = self:getSelectViewData(self.m_selectViewIsSpread)
    local isEmpty = table.isEmpty(data)
    self.m_enrollSelectVal:setVisible(isEmpty)
    self.m_selectViewBg:setVisible(not isEmpty)
    if isEmpty then
        return
    end
    local fee_count = #self.m_data.fee
    self.m_selectViewBg:setFile((fee_count == 1) and "hall/common/bg_blank.png" or match_hall_pin_map["select_item.png"])
    self.m_selectView:setScrollBarWidth(0)
    self.m_selectView:removeAllChildren(true)
    local GameMatchHallDetailSelectListItem = require("hall/matchHall/gameMatchHall/gameMatchHallDetail/gameMatchHallDetailSelectListItem")
    if not self.m_selectViewAdapter then
        self.m_selectViewAdapter = new(CacheAdapter, GameMatchHallDetailSelectListItem, data)
        self.m_selectView:setAdapter(self.m_selectViewAdapter)
    else
        self.m_selectViewAdapter:changeData(data)
    end

    self.m_selectViewAdapter:getView(1):setDirectionState(fee_count ~= 1)
    self.m_selectViewAdapter:getView(1):setStrState(fee_count ~= 1)
    self.m_selectViewAdapter:getView(#data):setLineState(false)
    self:updateSelectViewHeight(#data)
    self.m_selectView:setOnItemClick(self, self.onSelectViewItemClick)
    self.m_selectViewMask:setVisible(false)
end

--获取报名选择列表数据
GameMatchHallDetail.getSelectViewData = function(self, state)
    if not self.m_data or table.isEmpty(self.m_data.fee) then
        return {}
    end
    if state then
        return self.m_data.fee
    else
        return {self.m_data.fee[1]}
    end
end

--排序报名选择列表数据
GameMatchHallDetail.sortSelectViewData = function(self, index)
    if not self.m_data or table.isEmpty(self.m_data.fee) then
        return
    end
    table.insert(self.m_data.fee, 1, self.m_data.fee[index])
    table.remove(self.m_data.fee, (index +1))
end

--更新报名选择列表高度
GameMatchHallDetail.updateSelectViewHeight = function(self, count)
    self.m_selectViewBg:setSize(nil, ((count > 5) and (5 * 52) or (count * 52)))
end

--点击选择列表
GameMatchHallDetail.onSelectViewItemClick = function(self, adapter, view, index, x, y)
    self.m_selectViewIsSpread = not self.m_selectViewIsSpread
    self.m_selectViewMask:setVisible(self.m_selectViewIsSpread)
    self:sortSelectViewData(index)
    local data = self:getSelectViewData(self.m_selectViewIsSpread)
    if not table.isEmpty(data) then
        UBReport.getInstance():report(UBConfig.kHallMatchShowEnrollSelect, self.m_data and self.m_data.id or "")
        self:updateSelectViewHeight(#data)
        adapter:changeData(data)
        adapter:getView(1):setDirectionFile(self.m_selectViewIsSpread and match_hall_pin_map["up.png"] or match_hall_pin_map["down.png"])
        adapter:getView(1):setDirectionState((#self.m_data.fee) ~= 1)
        adapter:getView(1):setStrState((#self.m_data.fee) ~= 1)
        adapter:getView(#data):setLineState(false)
    end
end

--点击选择列表遮罩层
GameMatchHallDetail.onSelectViewMaskClick = function(self)
    self:showSelectList()
end

--重置视图
GameMatchHallDetail._resetView = function(self)
    self.m_contentView:setVisible(true);
    self.m_timeView:setVisible(false);
    self:setMatchTimeVal("")
    self:_removeTimer();
end

--设置比赛类型
GameMatchHallDetail.setMatchType = function(self, data)
    local now = GameInfoIsolater.getInstance():getRightTimeWithServer();
    local delta = data.stime - now;
    if delta < 0 and MatchHallDataInterface.getInstance():checkIsLoopMatch(data) then
        self.m_matchType = GameMatchHallDetail.eMatchState.WAIT_SIGNUP;--循环赛等待报名
    elseif tonumber(data.status) == GameConstant.NOT_SIGN_UP then --未报名
        self.m_matchType = self:getMatchTypeByData(data)
    elseif tonumber(data.status) == GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN then --报名并且比赛可以进入
        self.m_matchType = GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_ENTER;
    else  
        self.m_matchType = GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_NOT_ENTER; --已报名(不可进入)
    end
end

--根据报名条件获取比赛类型
GameMatchHallDetail.getMatchTypeByData = function(self, data)
    if table.isEmpty(data.fee) then
        return GameMatchHallDetail.eMatchState.CAN_SIGNUP_FREE; --可以报名(免费)
    end
    local canSign = MatchHallDataInterface.getInstance():checkCanSignup(data)
    local canPay, _, _ = self:_canPay(data.fee);
    if canSign then
        return GameMatchHallDetail.eMatchState.CAN_SIGNUP_NOT_FREE; --可以报名(不免费)
    elseif canPay then
        return GameMatchHallDetail.eMatchState.CAN_NOT_SIGNUP_CAN_PAY; --不可报名(可充值)
    else
        return GameMatchHallDetail.eMatchState.CAN_NOT_SIGNUP; --不可报名
    end
end

--显示公共数据和各类型比赛数据
GameMatchHallDetail._showData = function(self)
    self:_showCommonData();
    self:showSelectList(true)
    self:showThreshold()
    self:showReviveIcon()
    --self:setPassword()

    local func = GameMatchHallDetail.s_showDataFuncMap[self.m_data.type];
    if func then
        func(self);
    end
end

--显示一般快速赛数据
GameMatchHallDetail._showDataImmediate = function(self)
    local data = self.m_data;
    self:_setTextCount(data.requestnum)
    self:setDataImmediateState(true)
    self:setEnrollCountVal(data.applynum .. "/" .. data.requestnum)
end

--设置一般快速赛相关控件显示状态
GameMatchHallDetail.setDataImmediateState = function(self,state)
    self.m_matchCountView:setVisible(state)
    self.m_matchCountStr:setVisible(state)
    self.m_timeView:setVisible(not state)
    self.m_countdownStr:setVisible(not state)
end

GameMatchHallDetail._setTextCount = function(self, count)
    local textPre = self.m_matchCountView:getChildByName("textPre");
    local textPost = self.m_matchCountView:getChildByName("textPost");

    
    if not self.m_countNum then
        self.m_countNum = new(UserMoneyItem);
        self.m_countNum:setAlign(kAlignLeft);
        self.m_matchCountView:addChild(self.m_countNum);
    end

    textPre:setText("满", 1);
    textPost:setText("人开赛", 1);
    UserMoneyItem.setFilePath( UserMoneyItem.s_matchDetailNumFilePath );
    self.m_countNum:setNormalMoneyNum(number.valueOf(count, 0), 0.7);
    UserMoneyItem.setFilePath();

    local widthPre = textPre:getSize();
    local widthNum = self.m_countNum:getSize();
    local widthPost = textPost:getSize();
    local widthSpace = 10;
    textPre:setPos(0, 0);
    self.m_countNum:setPos(widthPre + widthSpace, 0);
    textPost:setPos(widthPre + 2 * widthSpace + widthNum, 0);
    self.m_matchCountView:setSize(widthPre + widthNum + widthPost + 2 * widthSpace);
end

--显示定时赛数据
GameMatchHallDetail._showDataTime = function(self)
    local data = self.m_data;
    local now = GameInfoIsolater.getInstance():getRightTimeWithServer();
    local delta = data.stime - now;

    local secondADay = 24 * 3600;
    if delta < 0 then
        self:_setTextTime(false, "00,00")
    elseif delta <= secondADay then
        self:_createTimer(delta);
    else
        local day = ToolKit.getDayInterval(now, data.stime);
        self:_setTextTime(true, day);
    end

    self:setDataImmediateState(false)
    if data.matchpartitions > 1 then
        self:setEnrollCountVal(string.format("%s/%s(分%s场开赛)", data.allapplynum, data.requestnum, data.matchpartitions))
    else
        self:setEnrollCountVal(string.format("%s/%s", data.allapplynum, data.requestnum))
    end
end

GameMatchHallDetail._setTextTime = function(self, isShowText, str)
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
GameMatchHallDetail._createTimer = function(self, time)
    self:_removeTimer();

    self:setMatchTimeText(time);
    Schedule.getInstance():registerListener(self, self._onTimer, 1000, kAnimRepeat, nil, "updateTime");
end

--删除计时器
GameMatchHallDetail._removeTimer = function(self)
    Schedule.getInstance():unregisterListener(self, self._onTimer, "updateTime");
end

--计时器回调
GameMatchHallDetail._onTimer = function(self)
    local diff = self.m_data.stime - GameInfoIsolater.getInstance():getRightTimeWithServer();

    if diff < 0 then
        self:_removeTimer();
        if MatchHallDataInterface.getInstance():checkIsLoopMatch(self.m_data) then
            self:_updateData(true);
        else
            Toast.getInstance():showText("比赛已开始",50,30,kAlignLeft,"",30,200,175,115);
            self:onCloseBtnClick();
        end
        return;
    end

    self:setMatchTimeText(diff);
end

--设置比赛倒计时文本
GameMatchHallDetail.setMatchTimeText = function(self, time)
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

--设置通用数据
GameMatchHallDetail._showCommonData = function(self)
    local data = self.m_data
    local name = string.valueOf(data.name):remove("#")
    self:setTitle(name)
    local isInvitational = data.invitetype and tonumber(data.invitetype) ~= -1;
    self:setInfoViewItemStyle(isInvitational)
    self:_showMatchTypeInfo(self.m_matchType); 
end

--设置标题
GameMatchHallDetail.setTitle = function(self, name)
    local nameSub = string.subUtfStrByCn(name, 1, 15, "")
    if string.len(name) > string.len(nameSub) then
        nameSub = string.subUtfStrByCn(name, 1, 14, "...")
    end
    self.m_title:setText(nameSub)
end

--设置报名人数
GameMatchHallDetail.setEnrollCountVal = function(self, text)
    self.m_enrollCountVal:setText(text)
end

-- 根据比赛状态显示相应数据
GameMatchHallDetail._showMatchTypeInfo = function(self, matchType)
    local text = self.m_signupBtn:getChildByName("signupText")
    self.m_helpBtn:setVisible(false)
    self.m_signupBtn:setPickable(true)
    if matchType == GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_NOT_ENTER then
        text:setText("退赛")
        self:updateExitView()
        if not table.isEmpty(self.m_data.fee) then
            self.m_helpBtn:setVisible(true)
        end
    elseif matchType == GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_ENTER then
        text:setText("进入")
    elseif matchType == GameMatchHallDetail.eMatchState.WAIT_SIGNUP then
        text:setText("等待报名")
        self.m_signupBtn:setPickable(false)
    else
        text:setText("马上报名")
    end
end

-- 判断能否有报名方式可购买
GameMatchHallDetail._canPay = function(self, data)
    if table.isEmpty(data) then
        return false, 0, 0
    end
    
    local feeType = 0
    local feeNum = 0
    for k,v in ipairs(data) do
        if not table.isEmpty(v) and (#v == 1) then
            feeType = number.valueOf(v[1].type,-1)
            if feeType == 0 or feeType == 1 then
                feeNum = number.valueOf(v[1].num)
                return true,feeType,feeNum
            end
        end
    end
    return false, 0, 0
end

GameMatchHallDetail._reportSignup = function(self)
    local data = self.m_data;
    -- 根据比赛状态上报相应数据
    if self.m_matchType == GameMatchHallDetail.eMatchState.CAN_SIGNUP_FREE or 
        self.m_matchType == GameMatchHallDetail.eMatchState.CAN_SIGNUP_NOT_FREE then
        UBReport.getInstance():report(UBConfig.kHallMatchSingup, string.format("id_%s", data.id));
    elseif self.m_matchType == GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_ENTER then
        UBReport.getInstance():report(UBConfig.kHallMatchEnter, string.format("id_%s", data.id));
    elseif self.m_matchType == GameMatchHallDetail.eMatchState.AREALDY_SIGNUP_CAN_NOT_ENTER then
        UBReport.getInstance():report(UBConfig.kHallMatchExitAdvanced, string.format("id_%s", data.id));
    elseif self.m_matchType == GameMatchHallDetail.eMatchState.CAN_NOT_SIGNUP_CAN_PAY then
        UBReport.getInstance():report(UBConfig.kHallMatchSignupPay, string.format("id_%s", data.id));
    end
end

--设置比赛预计时长
GameMatchHallDetail.setMatchTimeVal = function(self, text)
    self.m_matchTimeVal:setText(string.format("约%s分钟", text or ""))
end

GameMatchHallDetail.onPasswordBtnClick = function(self)
    self.m_passwordBtn:setVisible(false)
    self.m_passwordVal:setVisible(true)
end

GameMatchHallDetail.s_controlConfig =
{   
    [GameMatchHallDetail.s_controls.closeBtn] = {"content", "closeBtn"};
    [GameMatchHallDetail.s_controls.titleBg] = {"content", "titleBg"};
    [GameMatchHallDetail.s_controls.title] = {"content", "titleBg", "txtTitle"};
    [GameMatchHallDetail.s_controls.contentView] = {"content", "contentView"};
    [GameMatchHallDetail.s_controls.signupBtn] = {"content", "contentView", "rightView", "signupBtn"};
    [GameMatchHallDetail.s_controls.helpBtn] = {"content", "contentView", "rightView", "signupBtn", "helpBtn"};
    [GameMatchHallDetail.s_controls.ruleBtn] = {"content", "contentView", "leftView", "ruleBtn"};
    [GameMatchHallDetail.s_controls.reviveIcon] = {"content", "contentView", "leftView", "ruleBtn", "icon"};
    [GameMatchHallDetail.s_controls.rankView] = {"content", "contentView", "leftView", "rankView"};

    [GameMatchHallDetail.s_controls.timeView] = {"content", "contentView", "rightView", "infoView", "countdownView"};
    [GameMatchHallDetail.s_controls.timeText] = {"content", "contentView", "rightView", "infoView", "countdownView", "countdownText"};
    [GameMatchHallDetail.s_controls.selectViewMask] = {"selectViewMask"};
    [GameMatchHallDetail.s_controls.selectView] = {"selectContent", "contentView", "rightView","infoView", "selectViewBg", "selectView"};
    [GameMatchHallDetail.s_controls.selectViewBg] = {"selectContent", "contentView", "rightView","infoView", "selectViewBg"};
    [GameMatchHallDetail.s_controls.matchTimeStr] = {"content", "contentView", "rightView","infoView", "matchTimeStr"};
    [GameMatchHallDetail.s_controls.matchTimeVal] = {"content", "contentView", "rightView","infoView", "matchTimeVal"};
    [GameMatchHallDetail.s_controls.enrollCountStr] = {"content", "contentView", "rightView","infoView", "enrollCountStr"};
    [GameMatchHallDetail.s_controls.enrollCountVal] = {"content", "contentView", "rightView","infoView", "enrollCountVal"};
    [GameMatchHallDetail.s_controls.matchCountView] = {"content", "contentView", "rightView","infoView", "matchCountView"};
    [GameMatchHallDetail.s_controls.countdownStr] = {"content", "contentView", "rightView","infoView", "countdownStr"};
    [GameMatchHallDetail.s_controls.matchCountStr] = {"content", "contentView", "rightView","infoView", "matchCountStr"};
    [GameMatchHallDetail.s_controls.enrollSelectVal] = {"content", "contentView", "rightView","infoView", "enrollSelectVal"};
    [GameMatchHallDetail.s_controls.matchCodeStr] = {"content", "contentView", "rightView","infoView", "matchCodeStr"};
    [GameMatchHallDetail.s_controls.matchCodeVal] = {"content", "contentView", "rightView","infoView", "matchCodeVal"};
    [GameMatchHallDetail.s_controls.passwordStr] = {"content", "contentView", "rightView","infoView", "passwordStr"};
    [GameMatchHallDetail.s_controls.passwordView] = {"content", "contentView", "rightView","infoView", "passwordView"};
    [GameMatchHallDetail.s_controls.passwordBtn] = {"content", "contentView", "rightView","infoView", "passwordView", "btn"};
    [GameMatchHallDetail.s_controls.passwordVal] = {"content", "contentView", "rightView","infoView", "passwordView", "password"};
};

GameMatchHallDetail.s_controlFuncMap =
{
    [GameMatchHallDetail.s_controls.closeBtn] = GameMatchHallDetail.onCloseBtnClick;
    [GameMatchHallDetail.s_controls.ruleBtn] = GameMatchHallDetail.onRuleBtnClick;
    [GameMatchHallDetail.s_controls.signupBtn] = GameMatchHallDetail.onSignupBtnClick;
    [GameMatchHallDetail.s_controls.helpBtn] = GameMatchHallDetail.onExitHelpBtnClick;
    [GameMatchHallDetail.s_controls.selectViewMask] = GameMatchHallDetail.onSelectViewMaskClick;
    [GameMatchHallDetail.s_controls.passwordBtn] = GameMatchHallDetail.onPasswordBtnClick;
};

GameMatchHallDetail.s_cmdConfig =
{
};

-- 为各个类型的比赛单独显示数据
GameMatchHallDetail.s_showDataFuncMap = {
    [GameConstant.NORMAL_IMMEDIATE_MATCH] = GameMatchHallDetail._showDataImmediate;
    [GameConstant.FIXED_TIME_MATCH] = GameMatchHallDetail._showDataTime;
};

return GameMatchHallDetail;