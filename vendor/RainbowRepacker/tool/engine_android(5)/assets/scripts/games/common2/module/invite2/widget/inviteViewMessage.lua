local CommonSliderLayer = require("games/common2/module/invite2/widget/commonSliderLayer");
local inviteViewMessageLayout = require(ViewPath .. "games/common2/inviteViewMessageLayout");

-- 短信邀请弹框
local InviteViewMessage = class(CommonSliderLayer, false);

InviteViewMessage.Delegate = {

}

InviteViewMessage.s_controls = 
{
    content = ToolKit.getIndex(),
	messageViewEditorBg = ToolKit.getIndex();
    messageViewEditor = ToolKit.getIndex();
    messageViewEditorBtn = ToolKit.getIndex();
    messageViewEditorImg = ToolKit.getIndex();
	messageSendBtn = ToolKit.getIndex(),
	messageInviteBtn = ToolKit.getIndex();
    listViewMessage = ToolKit.getIndex(),
    emptyTipsMessage = ToolKit.getIndex(),
    emptyImgMessage = ToolKit.getIndex(),
    titleView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
}

InviteViewMessage.ctor = function(self)
    super(self, inviteViewMessageLayout);
    self:initView();
end

InviteViewMessage.dtor = function(self)
end

InviteViewMessage.show = function(self, data)
    CommonSliderLayer.show(self);
    CommunityLogic.getInstance():setDelegate(self);
    self:resetView();
    self:initData(data);
    self:showData();
end

InviteViewMessage.hideEnd = function(self)
    CommonSliderLayer.hideEnd(self);
    CommunityLogic.getInstance():setDelegate(nil);
end

InviteViewMessage.updateData = function(self, data)
    self:initData(data);
end

InviteViewMessage.initView = function(self)
    local content = self:findViewById(self.s_controls.content);
    content:setEventTouch(self, function() end);
    content:setEventDrag(self, function() end);
    self:setSlideContent(content);

	self.m_listViewMessage = self:findViewById(self.s_controls.listViewMessage);
    self.m_emptyTipsMessage = self:findViewById(self.s_controls.emptyTipsMessage);
    self.m_emptyImgMessage = self:findViewById(self.s_controls.emptyImgMessage);
    self.m_messageInviteBtn = self:findViewById(self.s_controls.messageInviteBtn);
    self.m_sendMsgBtn = self:findViewById(self.s_controls.messageSendBtn);
    self.m_messageViewEditorBg = self:findViewById(self.s_controls.messageViewEditorBg);
    self.m_listViewMessage:setOnItemClick(self, self.onListItemClick);
    self.m_listViewMessage:setScrollBarWidth(3);

    self:initViewSize();
end

InviteViewMessage.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

InviteViewMessage.resetView = function(self)
	self.m_messageInviteBtn:setVisible(false);
    self.m_sendMsgBtn:setVisible(false);
    self.m_listViewMessage:setVisible(false);
    self.m_emptyTipsMessage:setVisible(false);
    self.m_emptyImgMessage:setVisible(false);
    self.m_messageViewEditorBg:setVisible(false);

	self:_resetMessageViewEditor();
end

InviteViewMessage.initData = function(self, data)
    self.m_data = data;
end

InviteViewMessage.showData = function(self)
    if ClientInfoIsolater.getInstance():hasPhoneCard() then
        self:getContactList();
    else
        self:_showEmptyTipsMessage();
    end
    self:_checkInviteBtnStatus();
end

InviteViewMessage.onSendMsgBtnClick = function(self)
    if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end

    PasswordIsolater.getInstance():shareByMessage(self.m_data.type, self.m_data.password, false);
end

InviteViewMessage.onFriendViewEditorChange = function(self)
    local editor = self:findViewById(self.s_controls.messageViewEditor);
    local editorBtn = self:findViewById(self.s_controls.messageViewEditorBtn);
    local editorImg = self:findViewById(self.s_controls.messageViewEditorImg);
    local text = string.trim(editor:getText());
    if string.isEmpty(text) then
        self:_resetMessageViewEditor();
        editorBtn:setVisible(false);
        editorImg:setVisible(true);
    else
        editorBtn:setVisible(true);
        editorImg:setVisible(false);
    end
    
    self.m_listViewMessage:setVisible(false);
    self.m_emptyTipsMessage:setVisible(false);
    self.m_emptyImgMessage:setVisible(false);
    self:getContactList();
end

InviteViewMessage.onFriendViewEditorBtnClick = function(self)
    self:_resetMessageViewEditor();
    self:onFriendViewEditorChange();
end

InviteViewMessage.onMessageInviteBtnClick = function(self)
    self:inviteContactFriends();
end

-- 邀请通讯录好友，发送短信
InviteViewMessage.inviteContactFriends = function(self)
    ReportIsolater.getInstance():report(UBConfig.kRoomInviteFriendViewBtnMessage, true, true);

    if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end
    
    local text = PasswordIsolater.getInstance():shareByMessage(self.m_data.type, self.m_data.password, true);
    if not string.isEmpty(text) then
        CommunityLogic.getInstance():inviteContactFriends(text);
    end
end

InviteViewMessage.onInviteContactFriendsCallback = function(self)
    self:showData();
end

InviteViewMessage._resetMessageViewEditor = function(self)
    local editor = self:findViewById(self.s_controls.messageViewEditor);
    editor:setText("");
    editor:setHintText("输入联系名称搜索", 215, 171, 127);
    editor:setMaxLength(18);
end

InviteViewMessage._showEmptyTipsMessage = function(self)
    local editor = self:findViewById(self.s_controls.messageViewEditor);
    local keyword = string.trim(editor:getText());
    if string.isEmpty(keyword) then
        if ClientInfoIsolater.getInstance():hasPhoneCard() then
             self.m_emptyTipsMessage:setText("您的通讯录无法读取");
             self.m_emptyImgMessage:setFile("games/common/friend/invite_icon_contact.png");
             self.m_sendMsgBtn:setVisible(true);
        else
            self.m_emptyTipsMessage:setText("安装sim卡才能分享成功");
            self.m_emptyImgMessage:setFile("games/common/friend/invite_icon_sim.png");
        end
    else
        self.m_emptyTipsMessage:setText("未找到对应联系人");
        self.m_emptyImgMessage:setFile("games/common/friend/invite_icon_contact.png");
    end

    self.m_emptyTipsMessage:setVisible(true);
    self.m_emptyImgMessage:setVisible(true);
end

-----------------------------通讯录好友--------------------------------------
InviteViewMessage.getContactList = function(self)
    CommunityLogic.getInstance():getContactList();
end

-- interface回调 通讯录列表
InviteViewMessage.onGetContactListCallBack = function(self, data)
    local editor = self:findViewById(self.s_controls.messageViewEditor);
    local keyword = string.trim(editor:getText());
    local list = self:_operateContactListData(data, keyword);

    self:_updateListViewMessage(list, keyword);
end

InviteViewMessage._updateListViewMessage = function(self, data)
    if table.isEmpty(data) then
        self:_showEmptyTipsMessage();
        return;
    end

    CommunityLogic.getInstance():resetSeletedData();
    ScrollBar.setDefaultImage("games/common/friend/scrollbar.png");
    if not self.m_adapterMessage then
        local listItem = require("games/common2/module/invite2/inviteListItem");

        self.m_adapterMessage = new(CacheAdapter, listItem, data);
        self.m_listViewMessage:setAdapter(self.m_adapterMessage);
    else
        self.m_adapterMessage:changeData(data);
    end
    ScrollBar.setDefaultImage();
    self.m_listViewMessage:setVisible(true);
    self:_checkInviteBtnStatus();
    self.m_messageViewEditorBg:setVisible(true);
end


InviteViewMessage.onListItemClick = function(self, adapter, view, index, viewX, viewY)
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

InviteViewMessage.checkInvited = function(self, number)
    return CommunityLogic.getInstance():isInvitedMessage(number);
end

-- 邀请人数限制
InviteViewMessage.checkLimit = function(self)
    return CommunityLogic.getInstance():isLimitedMessage();
end

-- 统一数据格式
InviteViewMessage._operateContactListData = function(self, data, keyword)
    local tmp = {};

    for k, v in ipairs(table.verify(data)) do
        local item = {
            name = v.name,
            number = v.phoneNumber,
            isInvited = CommunityLogic.getInstance():isInvitedMessage(v.phoneNumber),
        };

        if string.contains(item.name, keyword) then
            table.insert(tmp, item);
        end
    end
    return tmp;
end

InviteViewMessage._checkInviteBtnStatus = function(self)
    if self.m_listViewMessage then
        self.m_messageInviteBtn:setVisible(self.m_listViewMessage:getVisible());
    end

    local hasSeletedData = CommunityLogic.getInstance():hasSeletedData();
    self.m_messageInviteBtn:setEnable(hasSeletedData);
end

InviteViewMessage.showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

InviteViewMessage.s_controlConfig =
{ 
    [InviteViewMessage.s_controls.content] = {"content"};
	[InviteViewMessage.s_controls.messageViewEditorBg]= {"content", "messageView", "contentView", "editorBg"};
    [InviteViewMessage.s_controls.messageViewEditor]= {"content", "messageView", "contentView", "editorBg", "editor"};
    [InviteViewMessage.s_controls.messageViewEditorBtn]= {"content", "messageView", "contentView", "editorBg", "btn"};
    [InviteViewMessage.s_controls.messageViewEditorImg] = {"content", "messageView", "contentView", "editorBg", "img"};
    [InviteViewMessage.s_controls.messageInviteBtn] = {"content", "messageView", "contentView", "inviteBtn"};
    [InviteViewMessage.s_controls.messageSendBtn] = {"content", "messageView", "contentView", "sendBtn"};
    [InviteViewMessage.s_controls.listViewMessage] = {"content", "messageView", "contentView", "listView"};
    [InviteViewMessage.s_controls.emptyTipsMessage] = {"content", "messageView", "contentView", "emptyTips"};
    [InviteViewMessage.s_controls.emptyImgMessage] = {"content", "messageView", "contentView", "emptyImg"};
    [InviteViewMessage.s_controls.titleView] = {"content", "messageView", "titleView"};
    [InviteViewMessage.s_controls.contentView] = {"content", "messageView", "contentView"};
}

InviteViewMessage.s_controlFuncMap =
{
	[InviteViewMessage.s_controls.messageSendBtn]	= InviteViewMessage.onSendMsgBtnClick;
    [InviteViewMessage.s_controls.messageViewEditor] = InviteViewMessage.onFriendViewEditorChange;
    [InviteViewMessage.s_controls.messageViewEditorBtn] = InviteViewMessage.onFriendViewEditorBtnClick;
    [InviteViewMessage.s_controls.messageInviteBtn] = InviteViewMessage.onMessageInviteBtnClick;
}

return InviteViewMessage;