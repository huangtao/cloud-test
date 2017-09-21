local match_hall_record_view_rank_invite_layout = require(ViewPath .. "hall/matchHall/widget/match_hall_record_view_rank_invite_layout");
require("gameData/weixinShareUtil");

local RecordContactsItem = require("hall/matchHall/gameMatchHall/gameMatchHallRecord/rank/gameMatchHallRecordContactsItem");

-- 好友排行
local GameMatchHallRecordRankInviteLayer = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

GameMatchHallRecordRankInviteLayer.eTabType = {
    TAB_MESSAGE = 1,
    TAB_WECHAT = 2,  
}

GameMatchHallRecordRankInviteLayer.s_controls = 
{
    -- 好友排行
    messageTabBtn = getIndex(),
    wechatTabBtn = getIndex(),
    messageView = getIndex(),
    wechatView = getIndex(),
    wechatViewText = getIndex(),
    wechatViewPassword = getIndex(),
    wechatViewInviteBtn = getIndex(),
    contactListView = getIndex(),
    contactsEmptyTips = getIndex(),
};

GameMatchHallRecordRankInviteLayer.s_cmds = 
{
};

GameMatchHallRecordRankInviteLayer.ctor = function(self)
    super(self, match_hall_record_view_rank_invite_layout);
    self:setSize(self.m_root:getSize());
    self:setAlign(kAlignCenter);

    self:_initView();
    self:_initData();

    MatchRecordDataInterface.getInstance():setObserver(self);
end

GameMatchHallRecordRankInviteLayer.dtor = function(self)
    MatchRecordDataInterface.getInstance():clearObserver(self);
end

GameMatchHallRecordRankInviteLayer.show = function(self)
	CommonGameLayer.show(self);
    self:_showRankViewDefaultView();
end

GameMatchHallRecordRankInviteLayer.hasOpenLayer = function(self)
    local hasOpenLayer = false;
    return hasOpenLayer;
end

-------------------------------------短信邀请 微信邀请-------------------------------------------
GameMatchHallRecordRankInviteLayer.onTabBtnClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    self:_checkRankViewTabStatus(drawing_id_current);
end

GameMatchHallRecordRankInviteLayer._checkRankViewTabStatus = function(self, id)
    for k, v in pairs(self.m_rankViewTabMap) do
        local btn = v[1];
        local func = v[2];

        if btn then
            local isSeleted = btn:getID() == id;
            local img = btn:getChildByName("img");
            local imgSel = btn:getChildByName("imgSel");
            img:setVisible(not isSeleted);
            imgSel:setVisible(isSeleted);

            btn:setLevel(isSeleted and 1 or -1);

            if isSeleted and func then
                self:_resetView();
                func(self);
            end
        end
    end
end

GameMatchHallRecordRankInviteLayer.showContactsEmptyView = function(self)
    if kClientInfo:hasPhoneCard() then
        self.m_contactsEmptyTips:setText("您的通讯录无法读取");
    else
        self.m_contactsEmptyTips:setText("您的手机没有sim卡哦\n安装sim卡才能分享成功~");
    end

    self.m_contactsEmptyTips:setVisible(true);
end 

GameMatchHallRecordRankInviteLayer.showRankViewWechatView = function(self)
    self.m_tabType = GameMatchHallRecordRankInviteLayer.eTabType.TAB_WECHAT;

    self.m_wechatView:setVisible(true);
    
    MatchRecordDataInterface.getInstance():getPasswordByInfo(self.m_data);
end

GameMatchHallRecordRankInviteLayer.showRankViewMessageView = function(self)
    self.m_tabType = GameMatchHallRecordRankInviteLayer.eTabType.TAB_MESSAGE;

    self.m_messageView:setVisible(true);

    MatchRecordDataInterface.getInstance():getPasswordByInfo(self.m_data);
end

GameMatchHallRecordRankInviteLayer._showRankViewDefaultView = function(self)
    self:_selectMessageTab();
end

GameMatchHallRecordRankInviteLayer._selectMessageTab = function(self)
    local messageTabBtn = self:findViewById(self.s_controls.messageTabBtn);
    self:_checkRankViewTabStatus(messageTabBtn:getID());
end

------------------------------好友口令--------------------------------
-- interface callback
GameMatchHallRecordRankInviteLayer.onGetPasswordByInfoCallback = function(self, isSuccess, password)
    if isSuccess then
        self.m_password = password;
        
        if self.m_tabType == GameMatchHallRecordRankInviteLayer.eTabType.TAB_WECHAT then
            self:_updatePassword();
            self:_checkInviteBtnStatus();
        elseif self.m_tabType ==GameMatchHallRecordRankInviteLayer.eTabType.TAB_MESSAGE then
            if kClientInfo:hasPhoneCard() then
                MatchRecordDataInterface.getInstance():getContactList();
            else
                self:showContactsEmptyView();
            end
        end
    end
end

GameMatchHallRecordRankInviteLayer._updatePassword = function(self)
    local shareContent = PasswordDataInterface.getInstance():getShareContent(PasswordConstants.TYPE_ADD_FRIENDS, self.m_password)
    local text = self:findViewById(self.s_controls.wechatViewText);
    local password = self:findViewById(self.s_controls.wechatViewPassword);
    text:setText(shareContent.gamePrefixStr or "")
    password:setText(string.format("好友口令：%s", shareContent.gameSuffixStr or ""));
end

GameMatchHallRecordRankInviteLayer._checkInviteBtnStatus = function(self)
    local inviteBtn = self:findViewById(self.s_controls.wechatViewInviteBtn);
    inviteBtn:setVisible(self.m_password and true or false);
end

GameMatchHallRecordRankInviteLayer.onWechatInviteBtnClick = function(self)
    PasswordDataInterface.getInstance():shareByWechat(PasswordConstants.TYPE_ADD_FRIENDS, self.m_password)
end

---------------------------------通讯录----------------------------------------
GameMatchHallRecordRankInviteLayer._updateContactList = function(self, data)
    if table.isEmpty(data) then
        self:showContactsEmptyView();
        return;
    end
    
    if not self.m_adapterContacts then
        local w, h = self.m_contactListView:getParent():getSize();
        RecordContactsItem.setDefaultSize(w, h / 5);
        RecordContactsItem.setEventCallback(self, self.onContactsInviteBtnClick);
        self.m_adapterContacts = new(CacheAdapter, RecordContactsItem, data);
        self.m_contactListView:setAdapter(self.m_adapterContacts);
    else
        self.m_adapterContacts:changeData(data);
    end

    self.m_contactListView:setVisible(true);
end

GameMatchHallRecordRankInviteLayer.onGetContactListCallBack = function(self, data)
    if self.m_tabType == GameMatchHallRecordRankInviteLayer.eTabType.TAB_MESSAGE then
        self:_updateContactList(data);
    end
end

GameMatchHallRecordRankInviteLayer.onContactsInviteBtnClick = function(self, data)
    local text = PasswordDataInterface.getInstance():shareByMessage(PasswordConstants.TYPE_ADD_FRIENDS, self.m_password)
    if not string.isEmpty(text) then
        MatchRecordDataInterface.getInstance():inviteContactFriends({data.number}, text)
    end
end

GameMatchHallRecordRankInviteLayer.onInviteContactFriendsCallback =function(self, isSuccess, info)
    if isSuccess then
        self:_showToast("短信发送成功");
    else
        self:_showToast("短信发送失败");
    end

    if self.m_tabType == GameMatchHallRecordRankInviteLayer.eTabType.TAB_MESSAGE then
        self:_selectMessageTab();
    end
end

---------------------------------------------------------------------------------------
GameMatchHallRecordRankInviteLayer._initView = function(self)
    self.m_messageView = self:findViewById(self.s_controls.messageView);
    self.m_wechatView = self:findViewById(self.s_controls.wechatView);
    self.m_contactListView = self:findViewById(self.s_controls.contactListView);
    self.m_contactsEmptyTips = self:findViewById(self.s_controls.contactsEmptyTips);

    local wechatTabBtn = self:findViewById(self.s_controls.wechatTabBtn);
    local messageTabBtn = self:findViewById(self.s_controls.messageTabBtn);

    self.m_rankViewTabMap = {
        {wechatTabBtn, self.showRankViewWechatView},
        {messageTabBtn, self.showRankViewMessageView}
    }

    self:_checkInviteBtnStatus();
end

GameMatchHallRecordRankInviteLayer._initData = function(self)
    self.m_data = MatchRecordDataInterface.getInstance():getInviteData();
end

GameMatchHallRecordRankInviteLayer._resetView = function(self)
    self.m_messageView:setVisible(false);
    self.m_wechatView:setVisible(false);
    self.m_contactsEmptyTips:setVisible(false);
end

GameMatchHallRecordRankInviteLayer._showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end
---------------------------------------------------------------------------------------
GameMatchHallRecordRankInviteLayer.s_controlConfig = 
{
    [GameMatchHallRecordRankInviteLayer.s_controls.messageTabBtn] = {"messageTabBtn"};
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatTabBtn] = {"wechatTabBtn"};
    [GameMatchHallRecordRankInviteLayer.s_controls.messageView] = {"bg", "messageView"};
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatView] = {"bg", "wechatView"};
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatViewText] = {"bg", "wechatView", "textView"};
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatViewPassword] = {"bg", "wechatView", "textPassword"};
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatViewInviteBtn] = {"bg", "wechatView", "inviteBtn"};
    [GameMatchHallRecordRankInviteLayer.s_controls.contactListView] = {"bg", "messageView", "listView"};
    [GameMatchHallRecordRankInviteLayer.s_controls.contactsEmptyTips] = {"bg", "messageView", "emptyView", "textView"};
};

GameMatchHallRecordRankInviteLayer.s_controlFuncMap = 
{
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatTabBtn] = GameMatchHallRecordRankInviteLayer.onTabBtnClick;
    [GameMatchHallRecordRankInviteLayer.s_controls.messageTabBtn] = GameMatchHallRecordRankInviteLayer.onTabBtnClick;
    [GameMatchHallRecordRankInviteLayer.s_controls.wechatViewInviteBtn] = GameMatchHallRecordRankInviteLayer.onWechatInviteBtnClick;
};

GameMatchHallRecordRankInviteLayer.s_cmdConfig = 
{
};

return GameMatchHallRecordRankInviteLayer;