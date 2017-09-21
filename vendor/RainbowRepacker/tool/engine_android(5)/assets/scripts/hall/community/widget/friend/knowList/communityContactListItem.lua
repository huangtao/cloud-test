local communityContactsListItem = require(ViewPath.."hall/community/friend/knowlist/communityContactsListItem");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local CommunityContactsListItem = class(CommonGameLayer,false);

CommunityContactsListItem.s_event_changeBtnStatusToDetailLayout = EventDispatcher.getInstance():getUserEvent();

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityContactsListItem.s_controls = { 
    contactsBg = getIndex();
    headBg = getIndex();
    describe = getIndex(),
    hasAdd = getIndex();
    btnAddfriend = getIndex();
    addFriendText = getIndex();
    line = getIndex();
    btnInvite = getIndex();
    nickname = getIndex();
    inviteText = getIndex();
    addFriendBtnBg = getIndex();
    inviteBtnBg = getIndex();
    head_frame = getIndex();
};

CommunityContactsListItem.statusImage = {
   BTN_INVITE_BG  = "btn_sendInvite.png",
   BTN_INVITEED_BG  =  "btn_knows.png",
   BTN_INVITE_TEXT = "invit.png",
   BTN_INVITEED_TEXT  = "invited.png",
   BTN_APPLYED_TEXT  =  "applyed.png",
   BTN_ADDFEIEND_TEXT  =  "addFreindsText.png",
}


CommunityContactsListItem.ctor = function(self,data,listItemType)
    super(self, communityContactsListItem);
    self:setSize( self.m_root:getSize() );
    self:setFillParent(false, false);
    self.m_ctrl = CommunityContactsListItem.s_controls;
    CommunityDataInterface.getInstance():setObserver(self);
    self.m_contactsBg = self:findViewById(self.m_ctrl.contactsBg);
    self.m_headBg = self:findViewById(self.m_ctrl.headBg);
    self.m_describe = self:findViewById(self.m_ctrl.describe);
    self.m_hasAdd = self:findViewById(self.m_ctrl.hasAdd);
    self.m_btnAddfriend = self:findViewById(self.m_ctrl.btnAddfriend);
    self.m_addFriendText = self:findViewById(self.m_ctrl.addFriendText);
    self.m_line  = self:findViewById(self.m_ctrl.line);
    self.m_btnInvite = self:findViewById(self.m_ctrl.btnInvite);
    self.m_nickname = self:findViewById(self.m_ctrl.nickname);
    self.m_inviteText = self:findViewById(self.m_ctrl.inviteText);
    self.m_addFriendBtnBg = self:findViewById(self.m_ctrl.addFriendBtnBg);
    self.m_inviteBtnBg = self:findViewById(self.m_ctrl.inviteBtnBg);
    self.m_data = data;
    self:updateListItem(data,listItemType);
    if listItemType == "nearByList" then
        self:setEventTouch(self,self.onShowDetailClick)
    end
    self.m_timer = 0;
    self.m_dy = 0;
    self.m_touchy = 0;
    EventDispatcher.getInstance():register(CommunityContactsListItem.s_event_changeBtnStatusToDetailLayout, self, self.refreshBtnStatus);
end

CommunityContactsListItem.onShowDetailClick = function (self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action == kFingerDown then
        self:startCheckTimer();
        self.m_touchy = y;
    elseif finger_action == kFingerMove then
         self.m_dy = y - self.m_touchy;
    else    
        self:stopCheckTimer();
    end
    if math.abs(self.m_dy) > 20 then
        self:stopCheckTimer();
    end
end

CommunityContactsListItem.startCheckTimer = function(self)
	self:stopCheckTimer();
	self.m_checkTimer = new(Timer,"CommunityContactsListItem|startCheckTimer",2,self,self.onCheckTimeout);
end 

CommunityContactsListItem.stopCheckTimer = function(self)
	if self.m_checkTimer then
        delete(self.m_checkTimer);
    end
	self.m_checkTimer = nil;
end

CommunityContactsListItem.onCheckTimeout = function(self)
	self:stopCheckTimer();
    self:onHeadBgClick();
end

CommunityContactsListItem.__refreshInviteBtnStatus = function (self)
    self.m_inviteText:setFile(community_pin_map[CommunityContactsListItem.statusImage.BTN_INVITEED_TEXT]); 
    self.m_inviteBtnBg:setFile(community_pin_map[CommunityContactsListItem.statusImage.BTN_INVITEED_BG])
    self.m_btnInvite:setEnable(false);
    self.m_inviteText:setSize(self.m_inviteText.m_res:getWidth(),self.m_inviteText.m_res:getHeight());
end

CommunityContactsListItem.updateListItem = function (self,data,listItemType)
    self.m_data = data;
    self.m_listItemType = listItemType;
    local nameStr = "";
    if listItemType == "knowList" then
        self.m_describe:setText(data.phone_number);
        nameStr = data.nickname.."("..data.name..")"
        if data.invite and data.regist_status == 0 then 
           self:__refreshInviteBtnStatus();
        end
        self.m_headBg:setVisible(false);
        self.m_describe:setPos(25);
        self.m_nickname:setPos(25);
        self:findViewById(self.m_ctrl.head_frame):setVisible(false);
    elseif listItemType == "nearByList" then
       
        self.m_describe:setVisible(true);
        local str = "";
        if data.distance  <= 10 then
            str = tostring(10).."米以内";
        elseif data.distance < 1000 then
            str = tostring(data.distance).."米以内";
        else
            str = tostring(data.distance/1000).."千米以内";
        end
        self.m_describe:setText(str);
        nameStr = data.nickname;
        self:setHeadImage(kUserInfoData:getHallHeadBySex(data.sex)); 
        ImageCache.getInstance():request(data.avatar_url, self, self.onUpdateHeadImage);
    end
    if data.addFriend then
        self:__refreshAddFriendBtnStatus(true);
    else
        self:__refreshAddFriendBtnStatus(false);
    end
    self.m_nickname:setText(nameStr);
    if data.regist_status == 0 then --未注册
        self.m_hasAdd:setVisible(false);
        self.m_btnAddfriend:setVisible(false);
        self.m_btnInvite:setVisible(true);
    else
        self.m_btnInvite:setVisible(false);
        local isShow = data.is_friend  == 1 and  true or false;
        self.m_hasAdd:setVisible(isShow);
        self.m_btnAddfriend:setVisible(not isShow);
    end
end

CommunityContactsListItem.setLine = function (self,setVisiable)
    self.m_line:setVisible(setVisiable);
end

CommunityContactsListItem.dtor = function(self)
    EventDispatcher.getInstance():unregister(CommunityContactsListItem.s_event_changeBtnStatusToDetailLayout, self, self.refreshBtnStatus);
    CommunityDataInterface.getInstance():clearObserver(self);
    ImageCache.getInstance():cleanRef(self);
    self:stopCheckTimer();
end

CommunityContactsListItem.onUpdateHeadImage = function(self, url, imagePath)
    if not url or not imagePath then
        return;
    end

    self:setHeadImage(imagePath);
end

CommunityContactsListItem.setHeadImage = function(self, image)
    if self.m_headImage then
        self.m_headBg:removeChild(self.m_headImage);
    end
    delete(self.m_headImage);

    self.m_headImage = new(Mask, image, community_pin_map["mask.png"]);
    self.m_headBg:getParent():addChild(self.m_headImage);
    self.m_headImage:setAlign(kAlignCenter);
end

CommunityContactsListItem.__refreshAddFriendBtnStatus = function (self,refresh)
    if refresh then
        self.m_addFriendText:setFile(community_pin_map[CommunityContactsListItem.statusImage.BTN_APPLYED_TEXT]); 
        self.m_addFriendBtnBg:setFile(community_pin_map[CommunityContactsListItem.statusImage.BTN_INVITEED_BG])
    else
       self.m_addFriendText:setFile(community_pin_map[CommunityContactsListItem.statusImage.BTN_ADDFEIEND_TEXT]); 
       self.m_addFriendBtnBg:setFile(community_pin_map[CommunityContactsListItem.statusImage.BTN_INVITE_BG])      
    end
    self.m_btnAddfriend:setEnable(not refresh);
    self.m_addFriendText:setSize(self.m_addFriendText.m_res:getWidth(),self.m_addFriendText.m_res:getHeight());
end

CommunityContactsListItem.refreshBtnStatus = function (self,data)
    if table.isEmpty(data) then
       return;
    end
    if self.m_listItemType == "nearByList" then
        if data.cid == self.m_data.cid then
            self:__refreshAddFriendBtnStatus(true);
            CommunityDataInterface.getInstance():setNearByAddFriendBtnStatus(data);
        end
    elseif self.m_listItemType == "knowList" then
        if data.phone_number == self.m_data.phone_number then
            self:__refreshAddFriendBtnStatus(true);
            CommunityDataInterface.getInstance():setKnowAddFriendBtnStatus(data);
        end
    end
end

CommunityContactsListItem.onBtnAddFriendClick = function (self)--添加好友
    if not self.m_data.addFriend then
        local  dst_cid = tonumber(self.m_data.cid or 0);
        local msg = ""
        CommunityDataInterface.getInstance():requestAddFriend(dst_cid,msg);
        self.m_data.addFriend = true;
        self:refreshBtnStatus(self.m_data);
    end
end

--邀请
CommunityContactsListItem.onBtnInviteClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityKnowInvite);
    local isPhoneFormatError = string.checkPhoneNumber(self.m_data.phone_number);
    if not isPhoneFormatError then
        self:showNoticeView("无效手机号码");
    else
        if not self.m_data.invite then
            CommunityDataInterface.getInstance():requestSmsInviteFriend(self.m_data.phone_number);
            self:__refreshInviteBtnStatus();
            self.m_data.invite = true;
            CommunityDataInterface.getInstance():setKnowInviteBtnStatus(self.m_data);
            self:showNoticeView("邀请消息发送成功");
        end
    end
end

CommunityContactsListItem.showNoticeView = function(self,msg,width ,height)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
    Toast.setDefaultDisplayTime();
end 


CommunityContactsListItem.s_controlConfig =
{   
    [CommunityContactsListItem.s_controls.contactsBg]   = {"contactsView","contactsBg"};
    [CommunityContactsListItem.s_controls.describe]     = {"contactsView","describe"};
    [CommunityContactsListItem.s_controls.headBg]       = {"contactsView","headView","headBg"};
    [CommunityContactsListItem.s_controls.head_frame]   = {"contactsView","headView","head_frame"};
    [CommunityContactsListItem.s_controls.hasAdd]       = {"contactsView","hasAdd"};
    [CommunityContactsListItem.s_controls.btnAddfriend] = {"contactsView","btnAddfriend"};
    [CommunityContactsListItem.s_controls.addFriendText]= {"contactsView","btnAddfriend","addFriendText"};
    [CommunityContactsListItem.s_controls.line]         = {"contactsView","line"};
    [CommunityContactsListItem.s_controls.btnInvite]    = {"contactsView","btnInvite"};
    [CommunityContactsListItem.s_controls.inviteText]   = {"contactsView","btnInvite","inviteText"};
    [CommunityContactsListItem.s_controls.nickname]     = {"contactsView","nickname"};  
    [CommunityContactsListItem.s_controls.addFriendBtnBg]= {"contactsView","btnAddfriend","addFriendBtnBg"};
    [CommunityContactsListItem.s_controls.inviteBtnBg]   = {"contactsView","btnInvite","inviteBtnBg"};
};

CommunityContactsListItem.onHeadBgClick = function (self)
    if self.m_listItemType == "nearByList" then
        IBaseDialog.remove("CommunityDetailInfoLayer");
        IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityDetailInfoLayer"),self.m_data,"nearByList"));
    end
end


CommunityContactsListItem.s_controlFuncMap =
{   [CommunityContactsListItem.s_controls.btnInvite] 	            = CommunityContactsListItem.onBtnInviteClick,
	[CommunityContactsListItem.s_controls.btnAddfriend] 	            = CommunityContactsListItem.onBtnAddFriendClick,
    [CommunityContactsListItem.s_controls.headBg] 	            = CommunityContactsListItem.onHeadBgClick,
};

return CommunityContactsListItem;