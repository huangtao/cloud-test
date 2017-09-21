require("common/commonGameLayer")
local invitational_info_slide_rank = require(ViewPath .. "hall/invitational/invitational_info_slide_rank")
local InvitationalSlideRankingItem = require("hall/invitational/widget/invitationalSlideRankingItem")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--我创建的邀请赛滑出排名列表
local InvitationalSlideRanking = class(hallLayerBaseWithName, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideRanking.s_controls = {
    contentView = getIndex(),
    content = getIndex(),
    title = getIndex(),
    menu1 = getIndex(),
    menu2 = getIndex(),
}

InvitationalSlideRanking.s_type = {
    CURRENT = "CURRENT",
    ALL = "ALL",
}

InvitationalSlideRanking.ctor = function(self, showType, data, info_data)
    super(self, invitational_info_slide_rank, nil, "InvitationalSlideRanking")
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_showType = showType
    self.m_data = data
    self.m_ctrls = InvitationalSlideRanking.s_controls
    self:initView()
    self:setTitle(info_data.matchName)
    self:initData(self.m_data)
    self:setListenBackEvent(true);
    
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.contentView));
end

InvitationalSlideRanking.initView = function(self)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_content = self:findViewById(self.m_ctrls.content)
    self.m_title = self:findViewById(self.m_ctrls.title)
    self.m_menu1 = self:findViewById(self.m_ctrls.menu1)
    self.m_menu2 = self:findViewById(self.m_ctrls.menu2)
end

InvitationalSlideRanking.setAllRankingVisible = function(self, state)
    self.m_menu1:setVisible(state)
    self.m_menu2:setVisible(not state)
end

InvitationalSlideRanking.setTitle = function(self, str)
    self.m_title:setText(str)
end

--初始化数据
InvitationalSlideRanking.initData = function(self, data)
    if self.m_list then
        delete(self.m_list)
        self.m_list = nil
    end
    local w,h = self.m_content:getSize()
    self.m_list = UIFactory.createScrollView(0,0,w,h,true)
    self.m_content:addChild(self.m_list)

    local height = 0
    for i,v in ipairs(data) do
        local view = new(InvitationalSlideRankingItem, v, self.m_showType)
        local _,h = view:getSize()
        self.m_list:addChild(view)
        view:setDelegate(self)
        view:setPos(nil, height)
        height = height + h + 5
        if i == #data then
            view:setLineState(false)
        end

        self.s_typeFunc[self.m_showType](self, view, v)
    end
    
    self.m_list:setNodeWidthHeight(nil, height)
    self.m_list:update()
end

--初始化当前排名item
InvitationalSlideRanking.initCurrentRankingItem = function(self, item, item_data)
    self:setAllRankingVisible(false)
    item:setRank(item_data.userInfo.rank or "")
    item:setNickName(item_data.userInfo.username or "")
    item:setReward(item_data.userInfo.score or "")
end

--初始化完整排名item
InvitationalSlideRanking.initAllRankingItem = function(self, item, item_data)
    self:setAllRankingVisible(true)
    if kUserInfoData:getUserCid() == item_data.cid then
        item:setFontColor({181, 75, 18})
    end
    item:setRank(item_data.rank_id)
    item:setNickName(item_data.nick)
    item:setId(item_data.cid)
    local value = item_data.award[1] and item_data.award[1].value or 0
    if value == 0 then
        item:setReward("无")
    else
        local typ = item_data.award[1] and number.valueOf(item_data.award[1].type) or 0
        local unit = InvitationalDataInterface.getInstance():getMoneyNameByType(typ)
        item:setReward(string.format("%s%s", unit, value))
    end
    item:setFontColor()
end

InvitationalSlideRanking.s_controlConfig = {
    [InvitationalSlideRanking.s_controls.title] = {"contentView", "titleBg", "title"},
    [InvitationalSlideRanking.s_controls.contentView] = {"contentView"},
    [InvitationalSlideRanking.s_controls.menu1] = {"contentView", "titleView", "bg", "menu1"},
    [InvitationalSlideRanking.s_controls.menu2] = {"contentView", "titleView", "bg", "menu2"},
    [InvitationalSlideRanking.s_controls.content] = {"contentView", "content"},
}

InvitationalSlideRanking.s_typeFunc = {
    [InvitationalSlideRanking.s_type.CURRENT] = InvitationalSlideRanking.initCurrentRankingItem,
    [InvitationalSlideRanking.s_type.ALL] = InvitationalSlideRanking.initAllRankingItem,
}

InvitationalSlideRanking.s_controlFuncMap = {
}

return InvitationalSlideRanking