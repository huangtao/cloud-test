local invitational_info_item = require(ViewPath .. "/hall/invitational/invitational_info_item")
local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin")

-- 我创建的邀请赛item
local InvitationalInfoItem = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalInfoItem.s_controls = 
{
    btn = getIndex(),
    id = getIndex(),
    state = getIndex(),
    date = getIndex(),
    timeView = getIndex(),
    strView = getIndex(),
    rewardVal = getIndex(),
    rewardIcon = getIndex(),
    enrollVal = getIndex(),
    enrollIcon = getIndex(),
    ctrlBtn = getIndex(),
    ctrlBtnState = getIndex(),
    password = getIndex(),
    received = getIndex(),
}

InvitationalInfoItem.Delegate = {
    onItemClick = "onItemClick",
    onItemCtrlBtnClick = "onItemCtrlBtnClick",
}

InvitationalInfoItem.ctor = function(self, data)
    super(self, invitational_info_item)
    self:setSize(self.m_root:getSize())
    self.m_data = data
    self:_initView()

end

InvitationalInfoItem.dtor = function(self)

end

InvitationalInfoItem._initView = function(self)
    self.m_btn = self:findViewById(self.s_controls.btn)
    self.m_matchId = self:findViewById(self.s_controls.id)
    self.m_matchState = self:findViewById(self.s_controls.state)
    self.m_date = self:findViewById(self.s_controls.date)
    self.m_timeView = self:findViewById(self.s_controls.timeView)
    self.m_strView = self:findViewById(self.s_controls.strView)
    self.m_rewardVal = self:findViewById(self.s_controls.rewardVal)
    self.m_rewardIcon = self:findViewById(self.s_controls.rewardIcon)
    self.m_enrollVal = self:findViewById(self.s_controls.enrollVal)
    self.m_enrollIcon = self:findViewById(self.s_controls.enrollIcon)
    self.m_ctrlBtn = self:findViewById(self.s_controls.ctrlBtn)
    self.m_ctrlBtnState = self:findViewById(self.s_controls.ctrlBtnState)
    self.m_password = self:findViewById(self.s_controls.password)
    self.m_received = self:findViewById(self.s_controls.received)
    self.m_timeViewVal = {}
    for i=1,4 do
        self.m_timeViewVal[i] = self.m_timeView:getChildByName(string.format("bg%d", i)):getChildByName("val")
    end

    self:setMatchId(self.m_data.matchId)
    self:setMatchState(self.m_data.status)
    self:setDate(self.m_data.startTime)
    self:setTime(self.m_data.startTime)
    self:setReward(self.m_data.awardType, self.m_data.awardCount)
    self:setEnroll(self.m_data.feeType, self.m_data.totalEntryFee)
    self:setCount(self.m_data.matchUserCount, self.m_data.matchJoinCount)
    self:setCtrlBtnVisible(self.m_data.status, self.m_data.returnFlag)
    self:setPassword(self.m_data.status, self.m_data.matchentrycode)
    self.m_btn:setPickable(self.m_data.status ~= 2 and self.m_data.status ~= 3)
end

--点击item
InvitationalInfoItem.onItemClick = function(self)
    self:execDelegate(InvitationalInfoItem.Delegate.onItemClick, self.m_data)
end

--点击操作按钮
InvitationalInfoItem.onCtrlBtnClick = function(self)
    self:execDelegate(InvitationalInfoItem.Delegate.onItemCtrlBtnClick, self.m_data)
end

InvitationalInfoItem.setMatchId = function(self, str)
    self.m_matchId:setText(str)
end

InvitationalInfoItem.setCtrlBtnVisible = function(self, status, returnFlag)
    if status == 3 then
        self.m_ctrlBtn:setVisible(returnFlag ~= 1)
        self.m_received:setVisible(returnFlag == 1)
    end
end

InvitationalInfoItem.setMatchState = function(self, status)
    local icon,btn
    if status == 0 then --未开赛
        icon = invitational_pin_map["tag_wait_start.png"]
        btn = invitational_pin_map["invite_friends.png"]
    elseif status == 1 then -- 进行中
        icon = invitational_pin_map["tag_match_in.png"]
        btn = invitational_pin_map["check_rankings.png"]
    elseif status == 2 then --正常结束
        icon = invitational_pin_map["tag_match_end.png"]
        btn = invitational_pin_map["check_all_rankings.png"]
    elseif status == 3 then --异常结束
        icon = invitational_pin_map["tag_match_fail.png"]
        btn = invitational_pin_map["receive_return_bonus.png"]
    end
    if icon then
        self.m_matchState:setFile(icon)
    end
    if btn then
        self.m_ctrlBtnState:setFile(btn)
    end
end

InvitationalInfoItem.setDate = function(self, time)
    local date = os.date("%m月%d日", time)
    self.m_date:setText(date)
end

InvitationalInfoItem.setTime = function(self, time)
    local t = os.date("*t", time)
    local data = {math.floor(t.hour / 10), t.hour % 10, math.floor(t.min / 10), t.min % 10}
    for i,v in ipairs(self.m_timeViewVal) do
        v:setText(data[i])
    end
end

InvitationalInfoItem.setReward = function(self, typ, val)
    local file, width, height = self:getMoneyByType(typ)
    self.m_rewardIcon:setFile(file)
    self.m_rewardIcon:setSize(width, height)
    self.m_rewardVal:setText(val)
    
end

InvitationalInfoItem.setEnroll = function(self, typ, val)
    local file, width, height = self:getMoneyByType(typ)
    self.m_enrollIcon:setFile(file)
    self.m_enrollIcon:setSize(width, height)
    self.m_enrollVal:setText(val)
end

InvitationalInfoItem.getMoneyByType = function(self, typ)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local goldBarID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    if typ == coinID then
        return invitational_pin_map["icon_money.png"], 33, 34
    elseif typ == goldBarID then
        return invitational_pin_map["icon_crystal.png"], 46, 36 
    end
    return ""
end

InvitationalInfoItem.setCount = function(self, matchUserCount, matchJoinCount)
    if not self.m_strViewText then
        self.m_strViewText = new(RichText, "", 1, 1, kAlignCenter, nil, 28)
        self.m_strView:addChild(self.m_strViewText)
    end
    self.m_strViewText:setText(string.format("#c149411%s#c815c1f/%s",matchUserCount, matchJoinCount))
end


InvitationalInfoItem.setPassword = function(self, status, password)
    local state = (status == 0) and (not string.isEmpty(password))
    self.m_ctrlBtn:setPos(nil, state and 48 or 31)
    self.m_password:setVisible(state)
    self.m_password:setText(string.format("比赛密码：%s", password))
end

InvitationalInfoItem.s_controlConfig =
{   
    [InvitationalInfoItem.s_controls.btn] = {"btn"},
    [InvitationalInfoItem.s_controls.id] = {"id","str"},
    [InvitationalInfoItem.s_controls.state] = {"id","state"},
    [InvitationalInfoItem.s_controls.date] = {"time","date"},
    [InvitationalInfoItem.s_controls.timeView] = {"time","timeView"},
    [InvitationalInfoItem.s_controls.strView] = {"count","strView"},
    [InvitationalInfoItem.s_controls.rewardVal] = {"reward", "bg", "val"},
    [InvitationalInfoItem.s_controls.rewardIcon] = {"reward", "bg", "icon"},
    [InvitationalInfoItem.s_controls.enrollVal] = {"enroll", "bg", "val"},
    [InvitationalInfoItem.s_controls.enrollIcon] = {"enroll", "bg", "icon"},
    [InvitationalInfoItem.s_controls.ctrlBtn] = {"ctrl", "ctrlBtn"},
    [InvitationalInfoItem.s_controls.ctrlBtnState] = {"ctrl", "ctrlBtn", "state"},
    [InvitationalInfoItem.s_controls.ctrlBtnState] = {"ctrl", "ctrlBtn", "state"},
    [InvitationalInfoItem.s_controls.password] = {"ctrl", "password"},
    [InvitationalInfoItem.s_controls.received] = {"ctrl", "received"},
}

InvitationalInfoItem.s_controlFuncMap =
{
    [InvitationalInfoItem.s_controls.btn] = InvitationalInfoItem.onItemClick,
    [InvitationalInfoItem.s_controls.ctrlBtn] = InvitationalInfoItem.onCtrlBtnClick,
}

return InvitationalInfoItem