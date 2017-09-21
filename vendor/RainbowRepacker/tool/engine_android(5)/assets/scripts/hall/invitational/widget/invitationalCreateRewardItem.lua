local invitational_create_reward_item = require(ViewPath .. "/hall/invitational/invitational_create_reward_item")
local invitational_pin_map = require("qnFiles/qnPlist/hall/invitational_pin")

-- 创建邀请赛奖励item
local InvitationalCreateRewardItem = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index;
end

InvitationalCreateRewardItem.s_controls = 
{
    icon = getIndex(),
    rank = getIndex(),
    count = getIndex(),
    money = getIndex(),
}

InvitationalCreateRewardItem.Delegate = {

}

InvitationalCreateRewardItem.ctor = function(self, data, award_type, award, award_count)
    super(self, invitational_create_reward_item)
    self:setSize(self.m_root:getSize())
    self.m_data = {}
    self:_initView(data, award_type, award, award_count)
end

InvitationalCreateRewardItem._initView = function(self, data, award_type, award, award_count)
    self.m_icon = self:findViewById(self.s_controls.icon)
    self.m_rank = self:findViewById(self.s_controls.rank)
    self.m_count = self:findViewById(self.s_controls.count)
    self.m_money = self:findViewById(self.s_controls.money)

    self:setIconFile(data.rank_start, data.rank_end)
    self:setMoneyFile(award_type)
    self:setRank(data.rank_start, data.rank_end, award_count)
    self:setCount(award)
end

InvitationalCreateRewardItem.setIconFile = function(self, rank_start, rank_end)
    local file = ""

    if rank_start == 1 and rank_end == 1 then
        self.m_icon:setSize(48, 38)

        file = invitational_pin_map["icon_champion.png"]
    elseif rank_start == 2 and rank_end == 2 then
        self.m_icon:setSize(46, 38)
        file = invitational_pin_map["icon_secondPlace.png"]
    elseif rank_start == 3 and rank_end == 3 then
        self.m_icon:setSize(46, 38)
        file = invitational_pin_map["icon_bronze.png"]
    else
        self.m_icon:setSize(34, 46)
        file = invitational_pin_map["icon_medal.png"]
    end
    self.m_icon:setFile(file)
end

InvitationalCreateRewardItem.setMoneyFile = function(self, award_type)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local goldBarID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    local file
    if award_type == coinID then
        file = invitational_pin_map["icon_money.png"]
        self.m_money:setSize(33, 34)
    elseif award_type == goldBarID then
        file = invitational_pin_map["icon_crystal.png"]
        self.m_money:setSize(46, 36)
    end
    self.m_money:setFile(file)
end

InvitationalCreateRewardItem.setRank = function(self, rank_start, rank_end, award_count)
    local str = ""
    if rank_start == 1 and rank_end == 1 then
        str = "冠军"
    elseif rank_start == 2 and rank_end == 2 then
        str = "亚军"
    elseif rank_start == 3 and rank_end == 3 then
        str = "季军"
    elseif rank_start == award_count then
        str = string.format("第%s名", rank_start or 0)
    else
        str = string.format("%s-%s名", rank_start or 0, math.min((award_count or 0), (rank_end or 0)))
    end
    self.m_rank:setText(str)
end

InvitationalCreateRewardItem.setCount = function(self, award)
    self.m_count:setText(award)
end

InvitationalCreateRewardItem.s_controlConfig =
{   
    [InvitationalCreateRewardItem.s_controls.icon] = {"icon"},
    [InvitationalCreateRewardItem.s_controls.rank] = {"rank"},
    [InvitationalCreateRewardItem.s_controls.count] = {"count"},
    [InvitationalCreateRewardItem.s_controls.money] = {"money"},
}

InvitationalCreateRewardItem.s_controlFuncMap =
{
}

return InvitationalCreateRewardItem