require("common/commonGameLayer")
local invitational_info = require(ViewPath .. "hall/invitational/invitational_info")
local InvitationalInfoItem = require("hall/invitational/widget/invitationalInfoItem")
local InvitationalSlideRanking = require("hall/invitational/widget/invitationalSlideRanking")

--我创建的邀请赛
local InvitationalInfo = class(CommonGameLayer, false)

InvitationalInfo.Delegate = {
    onInvitationalInfoClose = "onInvitationalInfoClose",
}

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalInfo.s_controls = {
    returnBtn = getIndex(),
    matchView = getIndex(),
    contentView = getIndex(),
    tips= getIndex(),
}

InvitationalInfo.ctor = function(self)
    super(self, invitational_info)
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrls = InvitationalInfo.s_controls
    InvitationalDataInterface.getInstance():setObserver(self)
    self:__init()
    LoadingView.getInstance():showText("数据加载中...")
    InvitationalDataInterface.getInstance():getMyMatch()
end

InvitationalInfo.dtor = function(self)
    InvitationalDataInterface.getInstance():setCurMyMatchItemData(nil)
    InvitationalDataInterface.getInstance():clearObserver(self)
    self.m_curMatchConfigId = nil
    LayerManagerIsolater.getInstance():hideAll();
end

InvitationalInfo.__init = function(self)
    self.m_matchView = self:findViewById(self.m_ctrls.matchView)
    self.m_contentView = self:findViewById(self.m_ctrls.contentView)
    self.m_tips = self:findViewById(self.m_ctrls.tips)
    self:setEventDrag(self, self.onBgClick)
    self:setEventTouch(self, self.onBgClick)

    self:initHeadFile()
end

InvitationalInfo.onBgClick = function(self)

end

--初始化头像文件
InvitationalInfo.initHeadFile = function(self)
    local headUrl = kUserInfoData:getAvatar_b()
    if headUrl ~= "" then
        ImageCache.getInstance():request(headUrl, self, self.onHeadImageCallBack)
    else
        self.m_headFile = kUserInfoData:getHeadBySex(kUserInfoData:getSex(), true)
    end
end

--获取头像回调
InvitationalInfo.onHeadImageCallBack = function(self, url, imagePath)
    self.m_headFile = imagePath
end

InvitationalInfo.getHeadFile = function(self)
    return self.m_headFile
end

InvitationalInfo.setContentViewVisible = function(self, state)
    self.m_contentView:setVisible(state)
    self.m_tips:setVisible(not state)
end

InvitationalInfo.showList = function(self, data)
    LoadingView.getInstance():hidden()
    self.m_data = data
    if self.m_list then
        delete(self.m_list)
        self.m_list = nil
    end
    local isEmpty = table.isEmpty(data)
    self:setContentViewVisible(not isEmpty)
    if isEmpty then
        return
    end
    local w,h = self.m_matchView:getSize()
    self.m_list = UIFactory.createScrollView(0,0,w,h,true)
    self.m_matchView:addChild(self.m_list)
    local height = 0
    for i,v in ipairs(data) do
        local view = new(InvitationalInfoItem, v)
        local _,h = view:getSize()
        self.m_list:addChild(view)
        view:setDelegate(self)
        view:setPos(nil, height)
        height = height + h + 13
    end
    self.m_list:setNodeWidthHeight(nil, height)
    self.m_list:update()
end

InvitationalInfo.onReturnBtnClick = function(self)
    self:execDelegate(InvitationalInfo.Delegate.onInvitationalInfoClose, true)
end

--点击item
InvitationalInfo.onItemClick = function(self, data)
    if data.status == 0 then
        InvitationalDataInterface.getInstance():enterMatch({code = data.matchId})
    elseif data.status == 1 then 
        Toast.getInstance():showText("比赛已经开始，无法进入",50,30,kAlignLeft,"",30,200,175,115)
    end
end

--获取完整排名回调
InvitationalInfo.onInvitationalAwardRank = function(self, isSuccess, info)
    Log.v("InvitationalInfo.onInvitationalAwardRank",info)
    LoadingView.getInstance():hidden()
    if isSuccess and not table.isEmpty(info) then
        self:createRankingList(InvitationalSlideRanking.s_type.ALL, info, InvitationalDataInterface.getInstance():getCurMyMatchItemData())
    end
end

--退还奖池回复
InvitationalInfo.onReceiveReturnInvitational = function(self, info)
    LoadingView.getInstance():hidden()
    Toast.getInstance():showText("领取退还奖品成功",50,30,kAlignLeft,"",30,200,175,115)
end

--获取当前排名回调
InvitationalInfo.onCurRankInvitational = function(self, info)
    Log.v("InvitationalInfo.onResponseCurrentRankDetai",info)
    LoadingView.getInstance():hidden()
    if not table.isEmpty(info) then
        self:createRankingList(InvitationalSlideRanking.s_type.CURRENT, info, InvitationalDataInterface.getInstance():getCurMyMatchItemData())
    end
end

--点击操作按钮
InvitationalInfo.onItemCtrlBtnClick = function(self, data)
    local itemData = Copy(data)
    InvitationalDataInterface.getInstance():setCurMyMatchItemData(itemData)
    if data.status == 0 then
        if self.m_headFile then
            itemData.headFileName = self.m_headFile
            self:createShareDialog(PasswordConstants.TYPE_MATCH_INVITE, QRUtil.eQRType.INVITATIONAL_SHARE, itemData)
        end
    elseif data.status == 1 then
        LoadingView.getInstance():showText("数据加载中...")
        InvitationalDataInterface.getInstance():getCurrentAwardRank(data.matchId)
    elseif data.status == 2 then
        UBReport.getInstance():report(UBConfig.kInvitationalAction16)
        LoadingView.getInstance():showText("数据加载中...")
        InvitationalDataInterface.getInstance():requestAwardRank(data.matchConfigId)
    elseif data.status == 3 then
        LoadingView.getInstance():showText("领取中...")
        InvitationalDataInterface.getInstance():receiveReturnReward(data.matchId, data.matchConfigId)
    end
    self.m_curMatchConfigId = itemData.matchConfigId
end

--创建邀请框
InvitationalInfo.createShareDialog = function(self, passwordType, qrType, itemData)
    local password, qrName
    if self.m_curMatchConfigId == itemData.matchConfigId then
        password, qrName = InvitationalDataInterface.getInstance():getPasswordAndQrName()
    end
    local child = LayerManagerIsolater.getInstance():show("InvitationalSlideInvite", passwordType, qrType, password, qrName)
    child:setTitleView(itemData.matchId)
end

--创建排名列表
InvitationalInfo.createRankingList = function(self, showType, data, info_data)
    LayerManagerIsolater.getInstance():show("InvitationalSlideRanking", showType, data, info_data);
end

InvitationalInfo.s_controlConfig = {
    [InvitationalInfo.s_controls.returnBtn] = {"topView", "returnBtn"},
    [InvitationalInfo.s_controls.contentView] = {"contentView"},
    [InvitationalInfo.s_controls.matchView] = {"contentView", "matchView"},
    [InvitationalInfo.s_controls.tips] = {"tips"},
}

InvitationalInfo.s_controlFuncMap = {
    [InvitationalInfo.s_controls.returnBtn] = InvitationalInfo.onReturnBtnClick,
}

return InvitationalInfo