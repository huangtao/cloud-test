require("common/commonGameLayer")
local invitational_create_slide_confirm = require(ViewPath .. "hall/invitational/invitational_create_slide_confirm")
local TimeFormatUtil = require("util/timeFormatUtil")

local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--创建邀请赛滑出创建确认
local InvitationalSlideConfirm = class(hallLayerBaseWithName, false)

InvitationalSlideConfirm.Delegate = {
    onConfirmCreateInvitational = "onConfirmCreateInvitational";
}

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideConfirm.s_controls = {
    contentView = getIndex(),
    content = getIndex(),
    confirmBtn = getIndex(),
    gameVal = getIndex(),
    timeVal = getIndex(),
    minPlayersVal = getIndex(),
    awardVal = getIndex(),
    feeVal = getIndex(),
    tips2 = getIndex(),
}

InvitationalSlideConfirm.ctor = function(self, showType, data)
    super(self, invitational_create_slide_confirm, nil, "InvitationalSlideConfirm");
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_data = data
    self.m_ctrls = InvitationalSlideConfirm.s_controls
    self:initView()
    self:setListenBackEvent(true);
    
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.contentView));
end

InvitationalSlideConfirm.dtor = function(self)
end

InvitationalSlideConfirm.initView = function(self)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_content = self:findViewById(self.m_ctrls.content)
    
    self:findViewById(self.m_ctrls.gameVal):setText(self.m_data.game_data.name)
    local time = ""
    if TimeFormatUtil.isSameDay(GameInfoIsolater.getInstance():getRightTimeWithServer(), self.m_data.time) then
        time = os.date("今天 %H:%M", self.m_data.time)
    else
        time = os.date("%Y.%m.%d %H:%M", self.m_data.time)
    end
    self:findViewById(self.m_ctrls.timeVal):setText(time)
    self:findViewById(self.m_ctrls.minPlayersVal):setText(string.format("%s%s", self.m_data.min_players, "人"))
    local awardName = InvitationalDataInterface.getInstance():getMoneyNameByType(self.m_data.award_type)
    self:findViewById(self.m_ctrls.awardVal):setText(string.format("%s%s", self.m_data.award, awardName))
    self.m_tips2 = self:findViewById(self.m_ctrls.tips2)
    self.m_tips2:setText(string.format(self.m_tips2:getText(), self.m_data.award, awardName))
    if tonumber(self.m_data.fee) == 0 then
        self:findViewById(self.m_ctrls.feeVal):setText("免费")
    else
        local feeName = InvitationalDataInterface.getInstance():getMoneyNameByType(self.m_data.fee_type)
        self:findViewById(self.m_ctrls.feeVal):setText(string.format("%s%s", self.m_data.fee, feeName))
    end
end

InvitationalSlideConfirm.onConfirmBtnClick = function(self)
    self:execDelegate(InvitationalSlideConfirm.Delegate.onConfirmCreateInvitational, self.m_data);
    self:close();
end

InvitationalSlideConfirm.s_controlConfig = {
    [InvitationalSlideConfirm.s_controls.contentView] = {"contentView"},
    [InvitationalSlideConfirm.s_controls.content] = {"contentView", "content"},
    [InvitationalSlideConfirm.s_controls.tips2] = {"contentView", "content","tips2"},
    [InvitationalSlideConfirm.s_controls.confirmBtn] = {"contentView", "content", "confirmBtn"},
    [InvitationalSlideConfirm.s_controls.gameVal] = {"contentView", "content", "bg", "item1", "value"},
    [InvitationalSlideConfirm.s_controls.timeVal] = {"contentView", "content", "bg", "item2", "value"},
    [InvitationalSlideConfirm.s_controls.minPlayersVal] = {"contentView", "content", "bg", "item3", "value"},
    [InvitationalSlideConfirm.s_controls.awardVal] = {"contentView", "content", "bg", "item4", "value"},
    [InvitationalSlideConfirm.s_controls.feeVal] = {"contentView", "content", "bg", "item5", "value"},
}

InvitationalSlideConfirm.s_controlFuncMap = {
    [InvitationalSlideConfirm.s_controls.confirmBtn] = InvitationalSlideConfirm.onConfirmBtnClick,
}

return InvitationalSlideConfirm