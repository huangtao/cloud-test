--邀请赛选择获奖名次item
local invitational_info_slide_rank_item = require(ViewPath .. "hall/invitational/invitational_info_slide_rank_item")

local InvitationalSlideRankingItem = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideRankingItem.s_controls = 
{
    rank = getIndex(),
    nickName = getIndex(),
    id = getIndex(),
    reward = getIndex(),
    line = getIndex(),
    rank2 = getIndex(),
    nickName2 = getIndex(),
    reward2 = getIndex(),
}

InvitationalSlideRankingItem.Delegate = {

}

InvitationalSlideRankingItem.s_type = {
    CURRENT = "CURRENT",
    ALL = "ALL",
}

InvitationalSlideRankingItem.s_font_color = {132, 89, 38}

InvitationalSlideRankingItem.ctor = function(self, data, showType)
    super(self, invitational_info_slide_rank_item)
    self:setSize(self.m_root:getSize())
    self.m_showType = showType
    self.m_data = data
    self:_initView()
end

InvitationalSlideRankingItem._initView = function(self)
    self.m_line = self:findViewById(self.s_controls.line)
    if self.s_type.ALL == self.m_showType then
        self.m_rank = self:findViewById(self.s_controls.rank)
        self.m_nickName = self:findViewById(self.s_controls.nickName)
        self.m_id = self:findViewById(self.s_controls.id)
        self.m_reward = self:findViewById(self.s_controls.reward)
    elseif self.s_type.CURRENT == self.m_showType then
        self.m_rank = self:findViewById(self.s_controls.rank2)
        self.m_nickName = self:findViewById(self.s_controls.nickName2)
        self.m_reward = self:findViewById(self.s_controls.reward2)
    end
end

InvitationalSlideRankingItem.setLineState = function(self, state)
	self.m_line:setVisible(state)
end

InvitationalSlideRankingItem.setRank = function(self, str)
    self.m_rank:setText(str, nil, nil, unpack(InvitationalSlideRankingItem.s_font_color))
end

InvitationalSlideRankingItem.setNickName = function(self, str)
    self.m_nickName:setText(str, nil, nil, unpack(InvitationalSlideRankingItem.s_font_color))
end

InvitationalSlideRankingItem.setId = function(self, str)
    self.m_id:setText(str, nil, nil, unpack(InvitationalSlideRankingItem.s_font_color))
end

InvitationalSlideRankingItem.setReward = function(self, str)
    self.m_reward:setText(str, nil, nil, unpack(InvitationalSlideRankingItem.s_font_color))
end

InvitationalSlideRankingItem.setFontColor = function(self, color)
    InvitationalSlideRankingItem.s_font_color = color or {132, 89, 38}
end

InvitationalSlideRankingItem.s_controlConfig =
{   
    [InvitationalSlideRankingItem.s_controls.rank] = {"content1", "item1", "str"},
    [InvitationalSlideRankingItem.s_controls.nickName] = {"content1", "item2", "str"},
    [InvitationalSlideRankingItem.s_controls.id] = {"content1", "item3", "str"},
    [InvitationalSlideRankingItem.s_controls.reward] = {"content1", "item4", "str"},
    [InvitationalSlideRankingItem.s_controls.rank2] = {"content2", "item1", "str"},
    [InvitationalSlideRankingItem.s_controls.nickName2] = {"content2", "item2", "str"},
    [InvitationalSlideRankingItem.s_controls.reward2] = {"content2", "item4", "str"},
    [InvitationalSlideRankingItem.s_controls.line] = {"line"},
}
return InvitationalSlideRankingItem