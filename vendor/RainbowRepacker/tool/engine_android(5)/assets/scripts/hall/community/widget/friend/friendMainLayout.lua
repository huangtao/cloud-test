local friendMainLayout = require(ViewPath.."hall/community/friend/friendMainLayout");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")






local FriendMainLayout = class(CommonGameLayer,false);


local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

FriendMainLayout.currentLayout = 
{
    FRIEND  = "friendRankLayout",
    KNOW    = "knowLayout",
    NEARBY  = "nearByLayout",    
}


FriendMainLayout.s_controls = {
    tabFriendRank = getIndex();
    tabKnow   = getIndex();
    tabNearby = getIndex();
    addFriendBtn = getIndex();
    contentView = getIndex();
}

FriendMainLayout.ctor = function(self)
    super(self, friendMainLayout);
    self:setSize( self.m_root:getSize() );
    self.m_ctrls = FriendMainLayout.s_controls;
    self.m_clockHandle = Clock.instance():schedule_once(function()
        self:__init();
        end)
end

FriendMainLayout.dtor = function(self)
    self.m_clockHandle:cancel();
    self.m_clockHandle = nil;
end

FriendMainLayout.__init = function (self)
    self:onTabFriendRankBtnClick();
end

FriendMainLayout.onTabFriendRankBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityRank);
    self:__setTabSelect(self.m_ctrls.tabFriendRank);
    self.m_friendRankView = self:__addLayerToCenterView(self.m_friendRankView, require("hall/community/widget/friend/friendList/communityRankLayer"))
    if self.m_currentLayout ~= FriendMainLayout.currentLayout.FRIEND then
        Toast.getInstance():hidden();
        LoadingView.getInstance():hidden();
        self.m_friendRankView:show();
        self.m_currentLayout = FriendMainLayout.currentLayout.FRIEND;
    end
    CommunityDataInterface.getInstance():setFriendRankLayout(self.m_currentLayout);
end

FriendMainLayout.onTabKnowBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityKnow);
    self:__setTabSelect(self.m_ctrls.tabKnow);
    self.m_knowView = self:__addLayerToCenterView(self.m_knowView, require("hall/community/widget/friend/knowList/communityKnowLayer"));
    if self.m_currentLayout ~= FriendMainLayout.currentLayout.KNOW then
        Toast.getInstance():hidden();
        LoadingView.getInstance():hidden();
        self.m_knowView:show();
        self.m_currentLayout = FriendMainLayout.currentLayout.KNOW;
    end
    CommunityDataInterface.getInstance():setFriendRankLayout(self.m_currentLayout);
end

FriendMainLayout.onTabNearbyBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallCommunityNearby);
    self:__setTabSelect(self.m_ctrls.tabNearby);
    self.m_nearByView = self:__addLayerToCenterView(self.m_nearByView, require("hall/community/widget/friend/nearbyList/communityNearByLayer"));
    if self.m_currentLayout ~= FriendMainLayout.currentLayout.NEARBY then  
        Toast.getInstance():hidden();
        LoadingView.getInstance():hidden();
        self.m_nearByView:show();
        self.m_currentLayout = FriendMainLayout.currentLayout.NEARBY;
    end
    CommunityDataInterface.getInstance():setFriendRankLayout(self.m_currentLayout);
end

FriendMainLayout.show = function (self)
    CommunityDataInterface.getInstance():setFriendRankLayout(self.m_currentLayout);
    if self.m_currentLayout ==  FriendMainLayout.currentLayout.FRIEND then
        self.m_friendRankView:show();
    elseif self.m_currentLayout ==  FriendMainLayout.currentLayout.KNOW then
        self.m_knowView:show();
    elseif self.m_currentLayout ==  FriendMainLayout.currentLayout.NEARBY then
        self.m_nearByView:show();    
    end
    
end

FriendMainLayout.__addLayerToCenterView = function(self, memberName, layerClass)
    if not memberName then
        memberName = new(layerClass);
        memberName:setFillParent(true, true);
        self:findViewById(self.m_ctrls.contentView):addChild(memberName);
        memberName:setDelegate(self);
    end

    return memberName;
end

--设置tab选中状态
FriendMainLayout.__setTabSelect = function(self, selectTabId)
    local tabs = {  self.m_ctrls.tabFriendRank,
                    self.m_ctrls.tabKnow,
                    self.m_ctrls.tabNearby,
                };
    local images = {  
        "tab_friendRank_selected.png","tab_friendRank_select.png",
        "tab_know_selected.png","tab_know_select.png",
        "tab_nearby_selected.png","tab_nearby_select.png",
                 };
    local views = {
        self.m_friendRankView,
        self.m_knowView,
        self.m_nearByView,
    }
    for index, tabId in pairs(tabs) do
        local tab = self:findViewById(tabId);
        local isSelect = tabId == selectTabId;
        local imageTitle = isSelect and community_pin_map[images[2*index-1]] or community_pin_map[images[2*index]];
        local imageTab = isSelect and community_pin_map["tab_selected.png"] or community_pin_map["tab_selcet.png"];
        tab:getChildByName("tab"):setFile(imageTab);
        tab:getChildByName("tab"):getChildByName("title"):setFile(imageTitle);
        if views[index] then
            views[index]:setVisible(isSelect);
        end
    end
end

FriendMainLayout.onAddFriendBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunitySearchAdd);
    self:__onShowAddFriendLayout();
end

FriendMainLayout.__onShowAddFriendLayout = function(self)
    IBaseDialog.remove("CommunityAddFriendLayer");
    IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityAddFriendLayer")));
end



FriendMainLayout.s_controlConfig = {
    [FriendMainLayout.s_controls.tabFriendRank] = {"topTabView", "tabFriendRank"};
    [FriendMainLayout.s_controls.tabKnow]   = {"topTabView", "tabKnow"};
    [FriendMainLayout.s_controls.tabNearby] = {"topTabView", "tabNearby"};

    [FriendMainLayout.s_controls.addFriendBtn] = {"topTabView", "btnAddFriend"};

    [FriendMainLayout.s_controls.contentView] = {"centerView", "contentView"};  
}

FriendMainLayout.s_controlFuncMap = {
    [FriendMainLayout.s_controls.tabFriendRank] = FriendMainLayout.onTabFriendRankBtnClick;
    [FriendMainLayout.s_controls.tabKnow]   =  FriendMainLayout.onTabKnowBtnClick;
    [FriendMainLayout.s_controls.tabNearby] =  FriendMainLayout.onTabNearbyBtnClick;

    [FriendMainLayout.s_controls.addFriendBtn] = FriendMainLayout.onAddFriendBtnClick;    
}

return FriendMainLayout;