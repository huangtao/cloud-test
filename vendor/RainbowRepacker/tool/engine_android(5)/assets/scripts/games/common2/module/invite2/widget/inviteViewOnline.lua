local CommonSliderLayer = require("games/common2/module/invite2/widget/commonSliderLayer");
local inviteViewOnlineLayout = require(ViewPath .. "games/common2/inviteViewOnlineLayout");

-- 在线好友邀请弹框
local InviteViewOnline = class(CommonSliderLayer, false);

InviteViewOnline.Delegate = {

}

InviteViewOnline.s_controls = 
{
    content = ToolKit.getIndex(),
	listViewOnline = ToolKit.getIndex();
    emptyTipsOnline = ToolKit.getIndex();
    emptyImgOnline = ToolKit.getIndex();
    onlineInviteBtn = ToolKit.getIndex();
    titleView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
}

InviteViewOnline.ctor = function(self)
    super(self, inviteViewOnlineLayout);
    self:initView();
end

InviteViewOnline.dtor = function(self)
end

InviteViewOnline.show = function(self, data)
    CommonSliderLayer.show(self);
    CommunityLogic.getInstance():setDelegate(self);
    self:resetView();
    self:initData(data);
    self:showData();
end

InviteViewOnline.updateData = function(self, data)
    self:initData(data);
end

InviteViewOnline.hideEnd = function(self)
    CommonSliderLayer.hideEnd(self);
    CommunityLogic.getInstance():setDelegate(nil);
end

InviteViewOnline.initView = function(self)
    local content = self:findViewById(self.s_controls.content);
    content:setEventTouch(self, function() end);
    content:setEventDrag(self, function() end);
    self:setSlideContent(content);

    self.m_listViewOnline = self:findViewById(self.s_controls.listViewOnline);
    self.m_emptyTipsOnline = self:findViewById(self.s_controls.emptyTipsOnline);
    self.m_emptyImgOnline = self:findViewById(self.s_controls.emptyImgOnline);
    self.m_onlineInviteBtn = self:findViewById(self.s_controls.onlineInviteBtn);
    self.m_listViewOnline:setOnItemClick(self, self.onListItemClick);
    self.m_listViewOnline:setScrollBarWidth(3);
    self:initViewSize();
end

InviteViewOnline.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

InviteViewOnline.resetView = function(self)
    self.m_onlineInviteBtn:setVisible(false);
    self.m_listViewOnline:setVisible(false);
    self.m_emptyTipsOnline:setVisible(false);
    self.m_emptyImgOnline:setVisible(false);
end

InviteViewOnline.initData = function(self, data)
    self.m_data = data;
end

InviteViewOnline.showData = function(self)
    self:getFriendsInviteList();
    self:_checkInviteBtnStatus();
end

InviteViewOnline.onOnlineInviteBtnClick = function(self)
    self:inviteOnlineFriends();
end

-----------------------------------在线好友--------------------------------------
InviteViewOnline._updateListViewOnline = function(self, data)
    if table.isEmpty(data) then
        self:_showEmptyTipsOnline();
        return;
    end

    CommunityLogic.getInstance():resetSeletedData();
    
    ScrollBar.setDefaultImage("games/common/friend/scrollbar.png");
    if not self.m_adapterOnline then
        local listItem = require("games/common2/module/invite2/inviteListItem");

        self.m_adapterOnline = new(CacheAdapter, listItem, data);
        self.m_listViewOnline:setAdapter(self.m_adapterOnline);
    else
        self.m_adapterOnline:changeData(data);
    end
    ScrollBar.setDefaultImage();

    self.m_listViewOnline:setVisible(true);
    self:_checkInviteBtnStatus();
end

InviteViewOnline.getFriendsInviteList = function(self)
    CommunityLogic.getInstance():requestFriendsInviteList();
end

-- interface回调
InviteViewOnline.onGetFriendsInviteList = function(self, data)
    local list = self:_operateFriendsInviteListData(data);
    self:_updateListViewOnline(list);
end

-- 邀请在线好友
InviteViewOnline.inviteOnlineFriends = function(self)
    ReportIsolater.getInstance():report(UBConfig.kRoomInviteFriendViewBtnOnline, true, true);
    local data = self.m_data;
    CommunityLogic.getInstance():inviteFriends(data);
end

-- interface回调
InviteViewOnline.onSendInviteFriendCallBack = function(self)
    -- 刷新
    self:showData();
end

InviteViewOnline.onListItemClick = function(self, adapter, view, index, viewX, viewY)
    local number = adapter:getData()[index].number;

    if self:checkLimit() then
        self:showToast("已达到好友邀请上限");
        return;
    end

    if self:checkInvited(number) then
        self:showToast("该好友已邀请过");
        return;
    end

    local checked = not view:getChecked();
    view:setChecked(checked);

    CommunityLogic.getInstance():selectInviteList(number, checked);

    self:_checkInviteBtnStatus();
end

InviteViewOnline._checkInviteBtnStatus = function(self)
    if self.m_listViewOnline then
        self.m_onlineInviteBtn:setVisible(self.m_listViewOnline:getVisible());
    end
    local hasSeletedData = CommunityLogic.getInstance():hasSeletedData();
    self.m_onlineInviteBtn:setEnable(hasSeletedData);
end

InviteViewOnline._showEmptyTipsOnline = function(self)
    self.m_emptyTipsOnline:setText("当前没有在线好友");
    self.m_emptyTipsOnline:setVisible(true);
    self.m_emptyImgOnline:setVisible(true);
end

-- 统一数据格式
InviteViewOnline._operateFriendsInviteListData = function(self, data)
    local tmp = {};

    for k, v in pairs(table.verify(data)) do
        local item = {
            name = v.nick,
            number = v.cid,
            isInvited = CommunityLogic.getInstance():isInvitedOnline(v.cid),
        };
        table.insert(tmp, item);
    end
    return tmp;
end

-----------------------邀请限制------------------------------------
-- 已邀请交互限制
InviteViewOnline.checkInvited = function(self, number)
    return CommunityLogic.getInstance():isInvitedOnline(number);
end

-- 邀请人数限制
InviteViewOnline.checkLimit = function(self)
    return false;
end

InviteViewOnline.showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

InviteViewOnline.s_controlConfig =
{ 
    [InviteViewOnline.s_controls.content] = {"content"};
    [InviteViewOnline.s_controls.listViewOnline] = {"content", "onlineView", "contentView", "listView"};
    [InviteViewOnline.s_controls.emptyTipsOnline] = {"content", "onlineView", "contentView", "emptyTips"};
    [InviteViewOnline.s_controls.emptyImgOnline] = {"content", "onlineView", "contentView", "emptyImg"};
    [InviteViewOnline.s_controls.onlineInviteBtn] = {"content", "onlineView", "contentView", "inviteBtn"};
    [InviteViewOnline.s_controls.titleView] = {"content", "onlineView", "titleView"};
    [InviteViewOnline.s_controls.contentView] = {"content", "onlineView", "contentView"};
}

InviteViewOnline.s_controlFuncMap =
{
    [InviteViewOnline.s_controls.onlineInviteBtn] = InviteViewOnline.onOnlineInviteBtnClick;
}

return InviteViewOnline;