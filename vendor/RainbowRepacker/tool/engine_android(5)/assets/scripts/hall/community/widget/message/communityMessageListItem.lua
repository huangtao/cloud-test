local communityMessageListItem = require(ViewPath.."hall/community/message/communityMessageListItem");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
local CommunityMessageListItem = class(CommonGameLayer,false);

CommunityMessageListItem.s_isItemOffset = false;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end



CommunityMessageListItem.s_controls = { 
    messageListView = getIndex();
    friendMsgView = getIndex();
    refuseBtn = getIndex();
    agreeBtn = getIndex();
    nickAndidView = getIndex();
    name = getIndex;
    headBg = getIndex();
    describe = getIndex();
    sex = getIndex();
    time = getIndex();
    redDot  = getIndex();
    redNum = getIndex();
    dot  = getIndex();
    moveView = getIndex();
    bg = getIndex();
    btnDelete = getIndex();
};

CommunityMessageListItem.ctor = function(self,data,msgListView)
    super(self, communityMessageListItem);
    self:setSize( self.m_root:getSize() );
    self:setFillParent(false, false);

    self.m_ctrl = CommunityMessageListItem.s_controls;
    self.m_msgListView = msgListView;
    self.m_data = data;
    self.m_redDot = self:findViewById(self.m_ctrl.redDot);
    self.m_redNum = self:findViewById(self.m_ctrl.redNum);
    self.m_dot    = self:findViewById(self.m_ctrl.dot);
    self.m_headBg = self:findViewById(self.m_ctrl.headBg);
    self.m_bg = self:findViewById(self.m_ctrl.bg);
    self.m_sex = self:findViewById(self.m_ctrl.sex);
    self.m_name = self:findViewById(self.m_ctrl.name);
    self.m_nickAndidView = self:findViewById(self.m_ctrl.nickAndidView);
    self.m_btnDelete = self:findViewById(self.m_ctrl.btnDelete);
    self:refreshRedDot(data);
    self.m_deleteBgWidth =  self.m_btnDelete:getSize();
    self.m_dx = 0;
    self.m_dy = 0;
    self.m_direction = 0;
    self.m_timer = 0;
    CommunityDataInterface.getInstance():setRankLayerListItemMove(false);
end

CommunityMessageListItem.dtor = function(self)    
    self:stopCheckTimer();
    ImageCache.getInstance():cleanRef(self);

    local x = self:getPos();
    if x < 0 then
        CommunityMessageListItem.s_isItemOffset = false;
    end
end

CommunityMessageListItem.refreshRedDot = function (self,data)
   self.m_data = data;
   self:setPos(0,nil);
   self.m_bg:setVisible(false);
   self:__refreshViewStatus();
   local unreadNum = CommunityDataInterface.getInstance():getFriendChatUnreadNum(data.cid);
   if unreadNum > 0 then
       self.m_redDot:setVisible(true);  
       self.m_redNum:setText(tostring(unreadNum));
       self.m_redNum:setVisible(false);
       --if unreadNum > 99 then
       --    self.m_dot:setVisible(true);
       --else
           self.m_dot:setVisible(false); 
       --end
       if not self:isNormalChatMessage() then
           local x = self.m_nickAndidView:getPos() + self.m_nickAndidView:getSize();
           self.m_redDot:setPos(x,nil);
           self.m_redDot:setVisible(false); 
       else
           self.m_redDot:setPos(80,nil); 
       end
   else
       self.m_redDot:setVisible(false); 
   end
end

CommunityMessageListItem.isNormalChatMessage = function(self)
    return self.m_data.msg_type ~= ImSdkConstants.msgType.FRIEND and true or false;
end

CommunityMessageListItem.getTextSize = function(self, label)
    local text = new(Text, label:getText(), nil, nil, nil, nil, 30);
    local w,h = text:getSize();
    delete(text);
    return w,h;
end

CommunityMessageListItem.__refreshViewStatus = function(self)
    local isNormalChatMessage = self:isNormalChatMessage();
    self:findViewById(self.m_ctrl.messageListView):setVisible(isNormalChatMessage);
    self:findViewById(self.m_ctrl.friendMsgView):setVisible(not isNormalChatMessage);
    self:findViewById(self.m_ctrl.time):setText(TimeHandler.formatHandler(self.m_data.msg_time or os.time(),0))
    if isNormalChatMessage then
        self.m_name:setText(self.m_data.nickname);
        local text = "";
        if self.m_data.msg_type == ImSdkConstants.msgType.AUDIO then
            text = "[".."语音".."]";
        else
            text = string.subUtfStrByCn(self.m_data.msg_content or "", 1, 27, "...");
        end
        self:findViewById(self.m_ctrl.describe):setText(text);
        local image = self.m_data.sex == "2" and community_pin_map["female.png"] or community_pin_map["male.png"] ;
        self.m_sex:setFile(image);
        local x = self.m_name:getPos() + self:getTextSize(self.m_name) + 5;
        self.m_sex:setPos(x,nil);
        --....
    else
        UBReport.getInstance():report(UBConfig.kHallCommunityMessageReadApply);
        self.m_data.is_friend = 0;
        self.m_redDot:setVisible(false);
        self.m_nickAndidView:setText(self.m_data.nickname.."["..self.m_data.cid.."]".."请求加您为好友");
    end
    self:setHeadImage(kUserInfoData:getHallHeadBySex(self.m_data.sex));
    ImageCache.getInstance():request(self.m_data.avatar_url, self, self.onUpdateHeadImage);
end

CommunityMessageListItem.onUpdateHeadImage = function(self, url, imagePath)
    if not url or not imagePath then
        return;
    end
    self.hasLoadHead = true;
    self:setHeadImage(imagePath);

end

CommunityMessageListItem.setHeadImage = function(self, image)
    if self.m_headImage then
        self.m_headBg:removeChild(self.m_headImage);
    end
    delete(self.m_headImage);
    self.m_headImage = new(Mask, image, community_pin_map["mask.png"]);
    self.m_headBg:addChild(self.m_headImage);    
    self.m_headImage:setAlign(kAlignCenter);
end

--滑动处理事件
CommunityMessageListItem.onMoveViewClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
   
	if finger_action == kFingerDown then
        self.m_data.m_isClick = 0;
        self.m_direction = 0;
        self.m_dx = 0;
        self.m_dy = 0;
		self.m_touchx = x;
        self.m_touchy = y;
        self:startCheckTimer();
        self.m_msgListView:setFingerActionEnabled(false,false);
        self.m_timer = os.time();
	elseif finger_action == kFingerMove then
        self.m_data.m_isClick = 1;
    	self.m_dx = x - self.m_touchx;
        self.m_dy = y - self.m_touchy;
        if self.m_direction == 0 then
            if math.abs(self.m_dx) > 0 and math.abs(self.m_dx) > math.abs(self.m_dy)  then --水平动
                self.m_direction = 1;
            elseif  math.abs(self.m_dy) > 0 and math.abs(self.m_dy) > math.abs(self.m_dx) then --上下动
                self.m_msgListView:setFingerActionEnabled(true,true);        
                self.m_direction = 2;
            end
        end
	elseif finger_action == kFingerUp or finger_action == kFingerCancel then
        self.m_direction = 0;
        self.m_data.m_isClick = 2;
        self:stopCheckTimer();
        self.m_msgListView:setFingerActionEnabled(true,false);     
	end
    if math.abs(self.m_dx) > 20 or math.abs(self.m_dy) > 20 or CommunityMessageListItem.s_isItemOffset then
        self:stopCheckTimer();
    end
    if self.m_direction <= 1 then
        if finger_action == kFingerUp and os.time()-self.m_timer < 2 then
            if math.abs(self.m_dx) < 20 and math.abs(self.m_dy) < 20 then
                if not CommunityMessageListItem.s_isItemOffset and self:isNormalChatMessage() then
                    UBReport.getInstance():report(UBConfig.kHallCommunityRankBtnWord);
                    UBReport.getInstance():report(UBConfig.kHallCommunityMessagePrivate);
                    self:stopCheckTimer();
                    CommunityDataInterface.getInstance():setChatMessageToReaded(self.m_data.cid);
                    local CommunityScene = require("hall/community/communityScene");
                    EventDispatcher.getInstance():dispatch(CommunityScene.s_event_changeToFriendChatLayout, self.m_data);
                end
            end
        end
        for index=1,self.m_msgListView:getItemCount() do
            local item = self.m_msgListView:getItem(index);
            if item.m_data.cid == self.m_data.cid then
                item.m_bg:setVisible(true);
                if self:isNormalChatMessage() then
                    if item.m_data.m_isClick == 1 then
                        item:dragListItem();
                    elseif item.m_data.m_isClick ==2 then
                        item:recurrenceAxiom();
                    end
                end
            else
                item.m_bg:setVisible(false);
                if finger_action == kFingerDown then
                    item:recurrenceAxiom(true);
                end
            end
        end
    end
end

CommunityMessageListItem.startCheckTimer = function(self)
	self:stopCheckTimer();
	self.m_checkTimer = new(Timer,"CommunityMessageListItem|startCheckTimer",2,self,self.onCheckTimeout);
end 

CommunityMessageListItem.stopCheckTimer = function(self)
	if self.m_checkTimer then
        delete(self.m_checkTimer);
    end
	self.m_checkTimer = nil;
end

CommunityMessageListItem.onCheckTimeout = function(self)
	self:stopCheckTimer();
    self:onHeadBgClick();
end

CommunityMessageListItem.dragListItem = function (self)
    local tmpx = 0;
    local dx  = 0;
    tmpx = self:getPos();
    local isMove  = CommunityMessageListItem.s_isItemOffset;
    if self.m_dx <= 0  then
        if tmpx >  - self.m_deleteBgWidth  then
            if self.m_dx >  - self.m_deleteBgWidth then
		        self:setPos(self.m_dx,nil);
            else
                self:setPos(-self.m_deleteBgWidth,nil);    
            end 
        end
    else
        if tmpx < 0  then
            if self.m_dx <  self.m_deleteBgWidth then
               if isMove then
                    dx = self.m_dx - self.m_deleteBgWidth;
               else
                    dx = self.m_dx;
               end
               self:setPos(dx,nil); 
            else
                self:setPos(0,nil);    
            end 
        end
    end 
end

CommunityMessageListItem.recurrenceAxiom  = function (self, isDirectBackToZero) --回归到原点
    local rankListAnim; 
    local tmpx = 0;
    local endX = 0;
    local maxDis = 90;
    tmpx = self:getPos();
    if tmpx == 0 then
        return;
    end

    if isDirectBackToZero then
        if not self:checkAddProp(0) then
            self:removeProp(0);
        end
        self:setPos(0);
        self.m_dx = 0;
        return;
    end

    if self.m_dx <= -maxDis then --回位
        endX = -self.m_deleteBgWidth;
        rankListAnim = self:addPropTranslate(1, kAnimNormal, 100, 0, 0, -self.m_deleteBgWidth-tmpx);
    else
        endX = 0;
        if CommunityMessageListItem.s_isItemOffset then
            tmpx = -self.m_deleteBgWidth;
        end
        rankListAnim = self:addPropTranslate(1, kAnimNormal, 100, 0, 0,-tmpx);
    end    
    if rankListAnim then
        rankListAnim:setDebugName("CommunityMessageListItem|rankListAnim");
        rankListAnim:setEvent(self, function ()
            self:removeProp(1);
            if endX >= 0 then
                CommunityMessageListItem.s_isItemOffset = false;
            else
                CommunityMessageListItem.s_isItemOffset = true;
            end
            self:setPos(endX,nil)
            self.m_dx = 0; 
        end);
    end
end

CommunityMessageListItem.onBtnDeleteClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityDelChat);
    MessageBox.show("删除提示",  "确定删除这条消息吗？", "确定",  "取消", true, self, self.okClick);
end

CommunityMessageListItem.okClick = function(self)
	if not self.m_data.cid then
		return;
	end
    CommunityDataInterface.getInstance():clearAllChatMessageWithFriend(self.m_data.cid);
end

CommunityMessageListItem.onAgreeBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityMessageAgree);
    self:agreeOrRefuseAddFriend(ImSdkConstants.HandleFriendRequestType.AGREE);
end

CommunityMessageListItem.onRefuseBtnBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityMessageRefuse);
    self:agreeOrRefuseAddFriend(ImSdkConstants.HandleFriendRequestType.REFUSE);
end

CommunityMessageListItem.agreeOrRefuseAddFriend = function(self, status)
    LoadingView.getInstance():showText("正在处理中...",70,90);
    CommunityDataInterface.getInstance():requestHandleAddFriendMessage(self.m_data.cid, status);
end

CommunityMessageListItem.s_controlConfig =
{   
    [CommunityMessageListItem.s_controls.time] = {"messageListView","time"};
    [CommunityMessageListItem.s_controls.sex] = {"messageListView","sex"};
    [CommunityMessageListItem.s_controls.describe] = {"messageListView","describe"};
    [CommunityMessageListItem.s_controls.headBg] = {"messageListView","headView", "headBg"};
    [CommunityMessageListItem.s_controls.name] = {"messageListView","name"};

    [CommunityMessageListItem.s_controls.nickAndidView] = {"friendMsgView","nickAndidView"};
    [CommunityMessageListItem.s_controls.agreeBtn] = {"friendMsgView", "agreeBtn"};
    [CommunityMessageListItem.s_controls.refuseBtn] = {"friendMsgView","refuseBtn"}; 
    [CommunityMessageListItem.s_controls.friendMsgView] = {"friendMsgView"}; 
    [CommunityMessageListItem.s_controls.messageListView] = {"messageListView"}; 
    [CommunityMessageListItem.s_controls.redDot] = {"redDot"}; 
    [CommunityMessageListItem.s_controls.redNum] = {"redDot","redNum"}; 
    [CommunityMessageListItem.s_controls.dot]    = {"redDot","dot"}; 
    [CommunityMessageListItem.s_controls.moveView]    = {"moveView"}; 
    [CommunityMessageListItem.s_controls.bg]    = {"bg"}; 
    [CommunityMessageListItem.s_controls.btnDelete]    = {"btnDelete"}; 
    
};

CommunityMessageListItem.onHeadBgClick = function (self)
    local type = "";
    if self:isNormalChatMessage() then
        type = "messageList";
    else
        type = "addMessage";
    end
    IBaseDialog.remove("CommunityDetailInfoLayer");
    local data = CommunityDataInterface.getInstance():getFriendDataByCid(self.m_data.cid);
    if table.isEmpty(data) then
        data = self.m_data;
    end
    IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityDetailInfoLayer"),data,type));
end

CommunityMessageListItem.onNativeHeadBgClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityMessageHead);
    UBReport.getInstance():report(UBConfig.kHallCommunityDetailInfo);
    self:onHeadBgClick()
end

CommunityMessageListItem.s_controlFuncMap =
{
    [CommunityMessageListItem.s_controls.headBg] = CommunityMessageListItem.onNativeHeadBgClick,
    [CommunityMessageListItem.s_controls.moveView] = CommunityMessageListItem.onMoveViewClick,
    [CommunityMessageListItem.s_controls.btnDelete] = CommunityMessageListItem.onBtnDeleteClick,
    [CommunityMessageListItem.s_controls.agreeBtn] = CommunityMessageListItem.onAgreeBtnClick,
    [CommunityMessageListItem.s_controls.refuseBtn] = CommunityMessageListItem.onRefuseBtnBtnClick,
}

return CommunityMessageListItem;