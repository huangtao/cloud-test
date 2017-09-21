require("common/commonGameLayer")
local invitational_create = require(ViewPath .. "hall/invitational/invitational_create")

local InvitationalCreateRewardItem = require("hall/invitational/widget/invitationalCreateRewardItem")
local InvitationalTipsDialog = require("hall/invitational/widget/invitationalTipsDialog")
local InvitationalSystemInfo = require("hall/invitational/widget/invitationalSystemInfo")
local TimeFormatUtil = require("util/timeFormatUtil")
local InvitationalSlideCommon = require("hall/invitational/widget/invitationalSlideCommon")
local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin")

--创建邀请赛界面
local InvitationalCreate = class(CommonGameLayer, false)

InvitationalCreate.Delegate = {
    onInvitationalCreateClose = "onInvitationalCreateClose",
    doCreateInvitational = "doCreateInvitational",
    onMyMatchBtnClick = "onMyMatchBtnClick",
}

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalCreate.s_controls = {
    shiled = getIndex(),
    returnBtn = getIndex(),
    title = getIndex(),
    systemInfoView = getIndex(),
    startMatchVal = getIndex(),
    matchCountVal = getIndex(),
    rewardView = getIndex(),
    rewardViewBg = getIndex(),
    matchRuleBtn = getIndex(),
    infoView = getIndex(),
    finishBtn = getIndex(),
    selectGameBtn = getIndex(),
    selectTimeBtn = getIndex(),
    selectCountBtn = getIndex(),
    selectAwardBtn = getIndex(),
    selectRankingBtn = getIndex(),
    selectFeeBtn = getIndex(),
    inputPasswordBtn = getIndex(),

    selectGameVal = getIndex(),
    selectTimeVal = getIndex(),
    selectCountVal = getIndex(),
    selectAwardVal = getIndex(),
    selectRankingVal = getIndex(),
    selectFeeVal = getIndex(),
    inputPasswordVal = getIndex(),
    successBg = getIndex(),
    successSwf = getIndex(),
}

InvitationalCreate.ctor = function(self, data)
    super(self, invitational_create)
    self.m_data = {}
    self.m_data.default_data = data
    self.m_operating_data = {}
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    InvitationalDataInterface.getInstance():setObserver(self)
    SafeBoxDataInterface.getInstance():setObserver(self)
    self.m_ctrls = InvitationalCreate.s_controls
    self:initView()
    self:createSystemInfo()
    self:initData()
end

InvitationalCreate.dtor = function(self)
    LoadingView.getInstance():hidden()
    InvitationalDataInterface.getInstance():clearObserver(self)
    SafeBoxDataInterface.getInstance():clearObserver(self)
    InvitationalTipsDialog.hide()
    LayerManagerIsolater.getInstance():hideAll();
    self:removeRuleDialog()
end

InvitationalCreate.initData = function(self)
    self.m_data.award_formula = InvitationalDataInterface.getInstance():getAwardFormula() 
    if table.isEmpty(self.m_data.award_formula) then
        InvitationalDataInterface.getInstance():requestAwardFormula()
    end
    local select_config = InvitationalDataInterface.getInstance():getSelectConfig()
    if not select_config then
        LoadingView.getInstance():showText("数据加载中...")
        InvitationalDataInterface.getInstance():requestSelectConfig()
    else
        self:updateSelectConfig(select_config)
    end
end

InvitationalCreate.initView = function(self)
    self.m_title = self:findViewById(self.m_ctrls.title)
    self.m_systemInfoView = self:findViewById(self.m_ctrls.systemInfoView)
    self.m_startMatchVal = self:findViewById(self.m_ctrls.startMatchVal)
    self.m_matchCountVal = self:findViewById(self.m_ctrls.matchCountVal)
    self.m_rewardView = self:findViewById(self.m_ctrls.rewardView)
    self.m_rewardViewBg = self:findViewById(self.m_ctrls.rewardViewBg)
    self.m_matchRuleBtn = self:findViewById(self.m_ctrls.matchRuleBtn)
    self.m_infoView = self:findViewById(self.m_ctrls.infoView)
    self.m_finishBtn = self:findViewById(self.m_ctrls.finishBtn)
    self.m_selectGameVal = self:findViewById(self.m_ctrls.selectGameVal)
    self.m_selectTimeVal = self:findViewById(self.m_ctrls.selectTimeVal)
    self.m_selectCountVal = self:findViewById(self.m_ctrls.selectCountVal)
    self.m_selectAwardVal = self:findViewById(self.m_ctrls.selectAwardVal)
    self.m_selectRankingVal = self:findViewById(self.m_ctrls.selectRankingVal)
    self.m_selectFeeVal = self:findViewById(self.m_ctrls.selectFeeVal)
    self.m_inputPasswordVal = self:findViewById(self.m_ctrls.inputPasswordVal)
    self.m_successBg = self:findViewById(self.m_ctrls.successBg)
    self.m_successSwf = self:findViewById(self.m_ctrls.successSwf)
    self.m_shiled = self:findViewById(self.m_ctrls.shiled)
    self.m_shiled:setEventDrag(self, self.onShiledClick)
end

InvitationalCreate.createSystemInfo = function(self)
    self.m_invitational_systemInfo = new(InvitationalSystemInfo)
    self.m_systemInfoView:addChild(self.m_invitational_systemInfo)
end

InvitationalCreate.updateBatteryLevel = function(self, level)
    self.m_invitational_systemInfo:updateBatteryLevel(level)
end

--更新视图
InvitationalCreate.updateView = function(self, data)
    if table.isEmpty(self.m_data.select_config) or table.isEmpty(self.m_data.select_config.default) then
        return
    end
    local select_config = self.m_data.select_config
    local default = select_config.default
    data = data or {}
    --data.time = data.time or default.start_time
    data.time = InvitationalDataInterface.getInstance():getStartTime()
    data.game_data = data.game_data or default.game
    data.award_type = data.award_type or default.award_config.type
    data.award = data.award or default.award_config.value
    data.ranking_data = data.ranking_data or default.award_ranking
    data.fee_type = data.fee_type or default.enter_fee.value
    data.fee = data.fee or default.enter_fee.value
    data.min_players = data.min_players or default.inmatch_num

    self:setSelectView(data)
    if self.m_data.select_config.games then
        self:setArrowVisible(self.m_ctrls.selectGameBtn, #self.m_data.select_config.games > 1)
    end
end

--设置选择视图的值
InvitationalCreate.setSelectView = function(self, data)
    self:setSelectGameVal(data.game_data)
    self:setSelectTimeVal(data.time)
    self:setSelectCountVal(data.min_players)
    self:setSelectAwardVal(data.award_type, data.award)
    self:setSelectRankingVal(data.ranking_data)
    self:setSelectFeeVal(data.fee_type, data.fee)
    self:setInputPasswordVal(data.password)
end

--显示奖品视图
InvitationalCreate.showRewardView = function(self)
    local award_count = self:getOperatingData():getAwardCount()
    local data = InvitationalDataInterface.getInstance():getAwardConfigByCount(award_count)
    local award_data = InvitationalDataInterface.getInstance():getSingleAwardData(data, self:getOperatingData():getAward(), award_count)
    local InvitationalCreateRewardItem = require("hall/invitational/widget/invitationalCreateRewardItem")
    if self.m_rewardViewList then
        delete(self.m_rewardViewList)
        self.m_rewardViewList = nil
    end

    local w, h = self.m_rewardViewBg:getSize()
    local item_height = 60
    local count = #data
    h = (count <= 3) and 3 * item_height or h
    h = (count >3 and count <= 5) and count * item_height or h
    h = (count > 5) and 5 * item_height or h
    self.m_rewardView:setSize(w, h)
    self.m_rewardViewList = UIFactory.createScrollView(0,0,w,h,true)
    self.m_rewardViewBg:addChild(self.m_rewardViewList)
    local height = 0
    for i=1,count do
        local view = new(InvitationalCreateRewardItem, data[i], self:getOperatingData():getAwardType(), award_data[i], award_count)
        self.m_rewardViewList:addChild(view)
        view:setPos(nil, height)
        view:setAlign(kAlignTop)
        height = height + item_height
    end
    self.m_rewardViewList:setNodeWidthHeight(nil, height)
    self.m_rewardViewList:update()
end

InvitationalCreate.setArrowVisible = function(self, btnId, state)
    local btn = self:findViewById(btnId)
    local r,g,b = 165, 67, 13
    if state then
        r, g, b = 131, 104, 69
    end
    btn:getChildByName("val"):setColor(r, g, b)
    btn:setPickable(state)
    btn:getChildByName("arrow"):setVisible(state) 
    btn:setFile(state and invitational_pin_map["option_bg.png"] or "hall/common/bg_blank.png")
end

--获取操作数据
InvitationalCreate.getOperatingData = function(self)
    return InvitationalDataInterface.getInstance():getInvitationalCreateData() 
end

--------------------------------------------右侧---------------------------------------------
--设置游戏名字
InvitationalCreate.setSelectGameVal = function(self, data)
    if not table.isEmpty(data) then
        self.m_selectGameVal:setText(data.name)
        self:getOperatingData():setGameData(data)
    end
end

--设置开赛时间
InvitationalCreate.setSelectTimeVal = function(self, val)
    if val then
        if TimeFormatUtil.isSameDay(GameInfoIsolater.getInstance():getRightTimeWithServer(), val) then
            local str = os.date("今天 %H:%M", val)
            self.m_selectTimeVal:setText(str)
            self:setStartMatchVal(str)
        else
            self.m_selectTimeVal:setText(os.date("%m.%d %H:%M", val))
            self:setStartMatchVal(os.date("%Y.%m.%d %H:%M", val))
        end
        self:getOperatingData():setTime(val)
    end
end

--设置最低参赛人数
InvitationalCreate.setSelectCountVal = function(self, val)
    if val then
        self.m_selectCountVal:setText(val .. "人")
        self:setMatchCountVal(val .. "人")
        self:getOperatingData():setMinPlayers(val)
        self:setAwardCountAndRanking()
        self:showRewardView()
    end
end

--设置奖品
InvitationalCreate.setSelectAwardVal = function(self, typ, val)
    if typ and val then
        self.m_selectAwardVal:setText(string.format("%s%s", val, InvitationalDataInterface.getInstance():getMoneyNameByType(typ)))
        self:getOperatingData():setAwardType(typ)
        self:getOperatingData():setAward(val)
        self:setTitle(self:getOperatingData():getAwardType(), self:getOperatingData():getAward())
        self:showRewardView()
    end
end

--设置获奖名次
InvitationalCreate.setSelectRankingVal = function(self, data)
    if not table.isEmpty(data) then
        self:getOperatingData():setAwardRankingData(data)
        self:setAwardCountAndRanking()
        self:showRewardView()
    end
end

--设置奖圈人数及获奖名次
InvitationalCreate.setAwardCountAndRanking = function(self)
    local awardRankingType = self:getOperatingData():getAwardRankingType()
    local award_count = InvitationalDataInterface.getInstance():getAwardCount(awardRankingType,
        self:getOperatingData():getAwardRanking(), self:getOperatingData():getMinPlayers())
    self:getOperatingData():setAwardCount(award_count)

    local r, g, b = self.m_selectRankingVal:getColor()
    if r == 255 and g == 255 and b == 255 then
        r, g, b = 131, 104, 69
    end
    local awardRankingName = self:getOperatingData():getAwardRankingName()
    if awardRankingType == "percent" then
        self.m_selectRankingVal:setText(string.format("%s(前%s名)", awardRankingName or "", award_count or ""), nil, nil, r, g, b)
    elseif awardRankingType == "num" then
        self.m_selectRankingVal:setText(awardRankingName, nil, nil, r, g, b)
    end
end

--设置报名费用
InvitationalCreate.setSelectFeeVal = function(self, typ, val)
    if typ and val then
        if tonumber(val) == 0 then
            self.m_selectFeeVal:setText("免费")
        else
            self.m_selectFeeVal:setText(string.format("%s%s", val, InvitationalDataInterface.getInstance():getMoneyNameByType(typ)))
        end
        self:getOperatingData():setFee(val)
        self:getOperatingData():setFeeType(typ)
    end
end

--设置密码
InvitationalCreate.setInputPasswordVal = function(self, val)
    if val == nil or val == "" then
        self.m_inputPasswordVal:setText("默认无密码")
    else
        self.m_inputPasswordVal:setText(val)
    end
    self:getOperatingData():setPassword(val)
end
--------------------------------------------右侧---------------------------------------------


--------------------------------------------左侧---------------------------------------------
--设置比赛名字
InvitationalCreate.setTitle =function(self, typ, money)
    local name = InvitationalDataInterface.getInstance():getMatchNameByAward(typ, money)
    self.m_title:setText(name)
    self:getOperatingData():setMatchName(name)
end

--设置开赛时间
InvitationalCreate.setStartMatchVal =function(self, str)
    self.m_startMatchVal:setText(str)
end

--设置开赛人数
InvitationalCreate.setMatchCountVal =function(self, str)
    self.m_matchCountVal:setText(str)
end
--------------------------------------------左侧---------------------------------------------

--点击返回按钮
InvitationalCreate.onReturnBtnClick = function(self)
    self:execDelegate(InvitationalCreate.Delegate.onInvitationalCreateClose, true)
end

--点击完成创建按钮
InvitationalCreate.onFinishBtnClick = function(self)
    if self.m_data.select_config and self.m_data.award_formula and self.m_data.min_players then
        if self:getOperatingData():getTime() < GameInfoIsolater.getInstance():getRightTimeWithServer() then
            Toast.getInstance():showText("开赛时间小于当前时间，请重新选择",50,30,kAlignLeft,"",30,200,175,115)
            return
        end
        local result, error_type = MatchHallDataInterface.getInstance():checkEnroll(self:getOperatingData():getAwardType(), 
            self:getOperatingData():getAward(), true)
        if result then
            self:createSlideDialog("InvitationalSlideConfirm", nil, self:getOperatingData());
        else
            self:showErrorTips(error_type, self:getOperatingData():getAwardType(), self:getOperatingData():getAward())
        end   
    else
        Toast.getInstance():showText("初始化未完成，请稍候重试",50,30,kAlignLeft,"",30,200,175,115)
    end
end

--delegate 滑动确认回调 确认创建自建赛
InvitationalCreate.onConfirmCreateInvitational = function(self, data)
    if not table.isEmpty(data) then
        self:execDelegate(InvitationalCreate.Delegate.doCreateInvitational, data)
    end
end

--显示错误提示
InvitationalCreate.showErrorTips = function(self, error_type, typ, num)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local barID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    local bankruptMoney = BankruptDataInterface.getInstance():getBankruptLowestMoney()
    local dialog = InvitationalTipsDialog.show()
    local not_now_cb = nil
    local unit = (typ == coinID) and "银币" or "金条"
    local content = string.format("您的%s账户余额不足，是否现在充值？", unit)
    local not_now_text = ""
    local money = kUserInfoData:getMoneyById(typ)
    
    local continue_cb = function()
        InvitationalTipsDialog.hide()
        self.m_isPaying = true
        self:quickPay(typ, (typ == coinID) and (bankruptMoney + num) or num)
    end
    if error_type == GameMatchHallConstants.enrollErrorType.CASH_OUT or error_type == GameMatchHallConstants.enrollErrorType.CASH_RUIN then
        not_now_text = string.format("使用保险箱%s", unit)
        not_now_cb = function()
            InvitationalTipsDialog.hide()
            self.m_isPaying = true
            SafeBoxDataInterface.getInstance():updateSafeBox(2, (typ == coinID) and (bankruptMoney + num - money) or (num - money), typ)
        end   
    elseif error_type == GameMatchHallConstants.enrollErrorType.TOTAL_OUT or error_type == GameMatchHallConstants.enrollErrorType.TOTAL_RUIN then
        not_now_text = "暂不充值"
    end
    if error_type == GameMatchHallConstants.enrollErrorType.CASH_RUIN or error_type == GameMatchHallConstants.enrollErrorType.TOTAL_RUIN then
        content = string.format("您需要达到%s%s，才可以创建。", (bankruptMoney + num), unit)
    end
    dialog:initTipsView(content, self, continue_cb, not_now_cb, nil, not_now_text)
end

--快速购买银币or金条
InvitationalCreate.quickPay = function(self, typ, num)
    local goodsListId = (typ == RechargeDataInterface.getInstance():getPropertySilverCoinID()) and PayConfig.eGoodsListId.MarketGold 
        or PayConfig.eGoodsListId.MarketCrystal
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.KMatchApplyRecharge);
    StateMachine.getInstance():pushState(States.ShortCutRecharge, nil, true, goodsListId,
        {scene = goodsListId}, nil, nil, nil, { diffMoney = num - kUserInfoData:getMoneyById(typ)});
end

--@brief 支付到账回调
InvitationalCreate.onBroadcastPayMoney = function(self, broadType)
    if self.m_isPaying then
        self.m_isPaying = nil
        self:onFinishBtnClick()
    end
end

--@brief 操作保险箱回调
InvitationalCreate.onUpdateSafeBoxCallBack = function(self, isSuccess, data)
    if self.m_isPaying then
        self.m_isPaying = nil
        self:onFinishBtnClick()
    end
end

--删除滑动规则视图
InvitationalCreate.removeRuleDialog = function(self)
    if self.m_slideRuleDialog then
        delete(self.m_slideRuleDialog)
        self.m_slideRuleDialog = nil
    end
end

--点击查看规则按钮
InvitationalCreate.onMatchRuleBtnClick = function(self)
    self:removeRuleDialog()
    if self.m_curRuleGameId == self:getOperatingData():getGameId() and self.m_curRuleMinPlayers == self:getOperatingData():getMinPlayers()
        and self.m_data.rules_content then
        self.m_slideRuleDialog = self:createSlideDialog("InvitationalSlideRule", nil, table.verify(self.m_data.rules_content))
    else
        self.m_slideRuleDialog = self:createSlideDialog("InvitationalSlideRule", nil, {})
        InvitationalDataInterface.getInstance():requestRulesContent(self:getOperatingData():getGameId(), self:getOperatingData():getMinPlayers())
        self.m_curRuleGameId = self:getOperatingData():getGameId()
        self.m_curRuleMinPlayers = self:getOperatingData():getMinPlayers()
    end
end

--比赛规则弹框关闭
InvitationalCreate.onInvitationalSlidRuleClose = function(self)
    self.m_slideRuleDialog = nil;
end

--获取比赛规则内容回调
InvitationalCreate.onInvitationalRulesContent = function(self, data)
    if not table.isEmpty(data) then
        self.m_data.rules_content = data
        if self.m_slideRuleDialog then
            self.m_slideRuleDialog:initView(data)
        end
    end
end

--创建滑动框
InvitationalCreate.createSlideDialog = function(self, layerName, showType, data, obj, callback)
    local child = LayerManagerIsolater.getInstance():show(layerName, showType, data, obj, callback)
    child:setDelegate(self);
    return child;
end

--点击选择游戏
InvitationalCreate.onSelectGameBtnClick = function(self)
    if self.m_data.select_config and #table.verify(self.m_data.select_config.games) > 1 then
        local showType = InvitationalSlideCommon.s_slideShowType.games
        local showingIndex = InvitationalDataInterface.getInstance():getSelectGameIndex(self:getOperatingData():getGameId(), self.m_data.select_config.games)
        local child = self:createSlideDialog("InvitationalSlideCommon", showType, self.m_data.select_config.games, self, self.onSelectGameCallback)
        child:setListViewShowingIndex(showingIndex)
        child:setTitle("选择游戏")
    end
end

--选择游戏回调
InvitationalCreate.onSelectGameCallback = function(self, data)
    self:setSelectGameVal(data.data)
    InvitationalDataInterface.getInstance():requestMatchMinPlayers(self:getOperatingData():getGameId())
    self.m_selectGameVal:setColor(165, 67, 13)
end

--点击选择开赛时间
InvitationalCreate.onSelectTimeBtnClick = function(self)
    self:createSlideDialog("InvitationalCalendar", nil, {time=self:getOperatingData():getTime()}, self, self.onSelectTimeCallback)
end

--选择开赛时间回调
InvitationalCreate.onSelectTimeCallback = function(self, data)
    self:setSelectTimeVal(data.time)
    self.m_selectTimeVal:setColor(165, 67, 13)
end

--点击选择最低参赛人数
InvitationalCreate.onSelectCountBtnClick = function(self)
    if self.m_data.min_players then
        local showType = InvitationalSlideCommon.s_slideShowType.minPlayers
        local showingIndex = InvitationalDataInterface.getInstance():getSelectIndex(self:getOperatingData():getMinPlayers(), self.m_data.min_players)
        local child = self:createSlideDialog("InvitationalSlideCommon", showType, self.m_data.min_players, self, self.onSelectCountCallback)
        child:setListViewShowingIndex(showingIndex)
        child:setTitle("选择人数")
    end
end

--选择最低参赛人数回调
InvitationalCreate.onSelectCountCallback = function(self, data)
    self:setSelectCountVal(data.data)
    self.m_selectCountVal:setColor(165, 67, 13)
end

--点击选择奖品设置
InvitationalCreate.onSelectAwardBtnClick = function(self)
    if self.m_data.select_config and self.m_data.select_config.award_config then
        local showType = InvitationalSlideCommon.s_slideShowType.award
        local award = self:getOperatingData():getAward()
        local awardType = self:getOperatingData():getAwardType()
        if award and awardType then
            local data = self.m_data.select_config.award_config[string.format("type%s", awardType)]
            local showingIndex = InvitationalDataInterface.getInstance():getSelectIndex(award, data)
            local child = self:createSlideDialog("InvitationalSlideCommon", showType, self.m_data.select_config.award_config, self, self.onSelectAwardCallback)
            child:setRadioButtonGroupSelected(awardType+1)
            child:onRadioButtonGroupClick(awardType+1, nil, true)
            child:setListViewShowingIndex(showingIndex)
        end
    end
end

--选择奖品设置回调
InvitationalCreate.onSelectAwardCallback = function(self, data)
    if not table.isEmpty(data) then
        self:setSelectAwardVal(data.radio_index - 1, data.data)
        self:setTitle(self:getOperatingData():getAwardType(), self:getOperatingData():getAward())
        self.m_selectAwardVal:setColor(165, 67, 13)
    end
end

--点击选择获奖名次
InvitationalCreate.onSelectRankingBtnClick = function(self)
    if self.m_data.select_config and self.m_data.select_config.award_ranking then
        local showType = InvitationalSlideCommon.s_slideShowType.awardRanking
        local showingIndex = InvitationalDataInterface.getInstance():getSelectRankingIndex(self:getOperatingData():getAwardRankingType(), 
            self:getOperatingData():getAwardRanking(), self.m_data.select_config.award_ranking)
        local child = self:createSlideDialog("InvitationalSlideCommon", showType, self.m_data.select_config.award_ranking, 
            self, self.onSelectRankingCallback)
        child:setListViewShowingIndex(showingIndex)
        child:setTitle("获奖比例")
    end
end

--选择获奖名次回调
InvitationalCreate.onSelectRankingCallback = function(self, data)
    self:setSelectRankingVal(data.data)
    self.m_selectRankingVal:setColor(165, 67, 13)
end

--点击选择报名费用
InvitationalCreate.onSelectFeeBtnClick = function(self)
    if self.m_data.select_config and self.m_data.select_config.enter_fee then
        local showType = InvitationalSlideCommon.s_slideShowType.fee
        local fee = self:getOperatingData():getFee()
        local feeType = self:getOperatingData():getFeeType()
        if fee and feeType then
            local data = self.m_data.select_config.enter_fee[string.format("type%s", feeType)]
            local showingIndex = InvitationalDataInterface.getInstance():getSelectIndex(fee, data)
            local child = self:createSlideDialog("InvitationalSlideCommon", showType, self.m_data.select_config.enter_fee, self, self.onSelectFeeCallback)
            child:setRadioButtonGroupSelected(feeType+1)
            child:onRadioButtonGroupClick(feeType+1, nil, true)
            child:setListViewShowingIndex(showingIndex)
        end
    end
end

--选择报名费用回调
InvitationalCreate.onSelectFeeCallback = function(self, data)
    if not table.isEmpty(data) then
        self:setSelectFeeVal(data.radio_index - 1, data.data)
        self.m_selectFeeVal:setColor(165, 67, 13)
    end
end

--点击设置密码
InvitationalCreate.onInputPasswordBtnClick = function(self)
    self:createSlideDialog("InvitationalSlideKeyboard", nil, self:getOperatingData():getPassword(), self, self.onInputPasswordCallback)
end

--设置密码回调
InvitationalCreate.onInputPasswordCallback = function(self, data)
    self:setInputPasswordVal(data)
    self.m_inputPasswordVal:setColor(165, 67, 13)
end

--获取创建比赛参数选项配置回调
InvitationalCreate.onInvitationalSelectConfig = function(self, data)
    LoadingView.getInstance():hidden()
    self:updateSelectConfig(data, true)
end

--更新创建比赛参数选项配置
InvitationalCreate.updateSelectConfig = function(self, data, needRefresh)
    if not table.isEmpty(data) then
        self.m_data.select_config = data
        local min_players = InvitationalDataInterface.getInstance():getMatchMinPlayers()
        if min_players and (not needRefresh) then
            self.m_data.min_players = min_players
        else
            if not table.isEmpty(data.default) then
                InvitationalDataInterface.getInstance():requestMatchMinPlayers(data.default.game.id)
            end
        end
        self:updateView(self:getOperatingData() or self.m_data.default_data)
    end
end

--获取奖圈对应奖金分配公式回调
InvitationalCreate.onInvitationalAwardFormula = function(self, data)
    if not table.isEmpty(data) then
        self.m_data.award_formula = data
        self:updateView(self:getOperatingData())
    end
end

--获取比赛创建界面最低参赛人数选项回调
InvitationalCreate.onInvitationalMatchMinPlayers = function(self, data)
    LoadingView.getInstance():hidden()
    if not table.isEmpty(data) then
        self.m_data.min_players = data
        self:updateView(self:getOperatingData())
    end
end

InvitationalCreate.setSuccessBgState = function(self, state)
    self.m_successBg:setVisible(state)
end

InvitationalCreate.doSuccessAnim = function(self, info)
    self:setSuccessBgState(true)
    self.m_successSwf:play()
    if self:getOperatingData():getPassword() and self:getOperatingData():getPassword() ~= "" then
        UBReport.getInstance():report(UBConfig.kInvitationalAction9)
    end
    if self:getOperatingData():getAwardRanking() then
        UBReport.getInstance():report(UBConfig.kInvitationalAction10, self:getOperatingData():getAwardRanking())
    end
    local function func()
        self:setSuccessBgState(false)
        self:execDelegate(InvitationalCreate.Delegate.onInvitationalCreateClose, true)
        self:execDelegate(InvitationalCreate.Delegate.onMyMatchBtnClick)
        InvitationalDataInterface.getInstance():enterMatch({code = info.roomId})
    end
    self.m_successSwf:setCompleteEvent(self, func)
end

InvitationalCreate.onShiledClick = function(self)
    
end

InvitationalCreate.s_controlConfig = {
    [InvitationalCreate.s_controls.shiled] = {"shiled"},
    [InvitationalCreate.s_controls.successBg] = {"successBg"},
    [InvitationalCreate.s_controls.successSwf] = {"successBg", "swf"},
    [InvitationalCreate.s_controls.returnBtn] = {"topView", "returnBtn"},
    [InvitationalCreate.s_controls.systemInfoView] = {"topView", "systemInfoView"},
    [InvitationalCreate.s_controls.title] = {"contentView", "leftView", "topInfo", "title"},
    [InvitationalCreate.s_controls.startMatchVal] = {"contentView", "leftView", "topInfo", "startMatchVal"},
    [InvitationalCreate.s_controls.matchCountVal] = {"contentView", "leftView", "topInfo", "matchCountVal"},
    [InvitationalCreate.s_controls.matchRuleBtn] = {"contentView", "leftView", "topInfo", "matchRuleBtn"},
    [InvitationalCreate.s_controls.rewardView] = {"contentView", "leftView", "rewardView"},
    [InvitationalCreate.s_controls.rewardViewBg] = {"contentView", "leftView", "rewardView", "bg"},

    [InvitationalCreate.s_controls.infoView] = {"contentView", "rightView", "infoView"},
    [InvitationalCreate.s_controls.selectGameBtn] = {"contentView", "rightView", "infoView", "item1", "btn"},
    [InvitationalCreate.s_controls.selectTimeBtn] = {"contentView", "rightView", "infoView", "item2", "btn"},
    [InvitationalCreate.s_controls.selectCountBtn] = {"contentView", "rightView", "infoView", "item3", "btn"},
    [InvitationalCreate.s_controls.selectAwardBtn] = {"contentView", "rightView", "infoView", "item4", "btn"},
    [InvitationalCreate.s_controls.selectRankingBtn] = {"contentView", "rightView", "infoView", "item5", "btn"},
    [InvitationalCreate.s_controls.selectFeeBtn] = {"contentView", "rightView", "infoView", "item6", "btn"},
    [InvitationalCreate.s_controls.inputPasswordBtn] = {"contentView", "rightView", "infoView", "item7", "btn"},

    [InvitationalCreate.s_controls.selectGameVal] = {"contentView", "rightView", "infoView", "item1", "btn", "val"},
    [InvitationalCreate.s_controls.selectTimeVal] = {"contentView", "rightView", "infoView", "item2", "btn", "val"},
    [InvitationalCreate.s_controls.selectCountVal] = {"contentView", "rightView", "infoView", "item3", "btn", "val"},
    [InvitationalCreate.s_controls.selectAwardVal] = {"contentView", "rightView", "infoView", "item4", "btn", "val"},
    [InvitationalCreate.s_controls.selectRankingVal] = {"contentView", "rightView", "infoView", "item5", "btn", "val"},
    [InvitationalCreate.s_controls.selectFeeVal] = {"contentView", "rightView", "infoView", "item6", "btn", "val"},
    [InvitationalCreate.s_controls.inputPasswordVal] = {"contentView", "rightView", "infoView", "item7", "btn", "val"},

    [InvitationalCreate.s_controls.finishBtn] = {"contentView", "rightView", "finishBtn"},
}

InvitationalCreate.s_controlFuncMap = {
    [InvitationalCreate.s_controls.shiled] = InvitationalCreate.onShiledClick,
    [InvitationalCreate.s_controls.returnBtn] = InvitationalCreate.onReturnBtnClick,
    [InvitationalCreate.s_controls.matchRuleBtn] = InvitationalCreate.onMatchRuleBtnClick,
    [InvitationalCreate.s_controls.finishBtn] = InvitationalCreate.onFinishBtnClick,
    [InvitationalCreate.s_controls.selectGameBtn] = InvitationalCreate.onSelectGameBtnClick,
    [InvitationalCreate.s_controls.selectTimeBtn] = InvitationalCreate.onSelectTimeBtnClick,
    [InvitationalCreate.s_controls.selectCountBtn] = InvitationalCreate.onSelectCountBtnClick,
    [InvitationalCreate.s_controls.selectAwardBtn] = InvitationalCreate.onSelectAwardBtnClick,
    [InvitationalCreate.s_controls.selectRankingBtn] = InvitationalCreate.onSelectRankingBtnClick,
    [InvitationalCreate.s_controls.selectFeeBtn] = InvitationalCreate.onSelectFeeBtnClick,
    [InvitationalCreate.s_controls.inputPasswordBtn] = InvitationalCreate.onInputPasswordBtnClick,
}

return InvitationalCreate