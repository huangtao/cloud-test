local communityMessageLayer = require(ViewPath.."hall/community/message/communityMessageLayer");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
require("hall/community/data/timeHandler");
require("hall/community/data/communityScheduler");

local NVerticalListView = require("ui2/NVerticalListView");

local CommunityMessageLayer = class(CommonGameLayer,false);



CommunityMessageLayer.Delegate = {
}
CommunityMessageLayer.s_event_changeToPressSpeakLayer = EventDispatcher.getInstance():getUserEvent();
local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityMessageLayer.s_controls =
{
    messageListView = getIndex(),
    btnReturn = getIndex(),
    name = getIndex(),
    checkView = getIndex(),
    btnMaterial = getIndex(),
    btnCleanUp = getIndex(),
    btnMore = getIndex(),
    btnSend = getIndex(),
    btnChat  = getIndex(),
    chatBg = getIndex(),
    inputEdit = getIndex(),
    contentView = getIndex(),
    recordView = getIndex(),
    recordBg = getIndex(),
    recordFg = getIndex(),
    chatView = getIndex(),
    messageView = getIndex(),
    speakView = getIndex(),
    inputBg = getIndex(),
    btnCheck = getIndex(),
    speakBg = getIndex(),
    notMessage = getIndex(),
    speakHintText = getIndex(),
    recordHintImage = getIndex(),
    hintText = getIndex(),
};

CommunityMessageLayer.ctor = function(self)
	super(self,communityMessageLayer);
   
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
	self.m_ctrls = CommunityMessageLayer.s_controls;
    self:__findViews();
    self:__initInputEdit();
    self.m_refreshTime = AppData.getInstance():getRightTimeWithServer();
    CommunityDataInterface.getInstance():setObserver(self);
    EventDispatcher.getInstance():register(CommunityMessageLayer.s_event_changeToPressSpeakLayer, self, self.onMicrophoneTimeOver);
    CommunityScheduler.getInstance():scheduleUpdate(self,self.createMessageListItemTimer);
    self.m_messageList = {};
    self.m_hintText:setScrollBarWidth(0);
end

CommunityMessageLayer.__initInputEdit = function(self)
    self.m_inputEdit:setHintText("限制50个字",132,135,126);
	self.m_inputEditWidth,self.m_inputEditHeight = self.m_inputEdit:getSize();
	self.m_inputEdit:setClip(0,0,self.m_inputEditWidth,self.m_inputEditHeight);
    self.m_inputEdit:setMaxLength(50);
    self.m_inputEdit:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEND);
    self.m_inputEdit:setFilterSensitiveWordFlag(true);
end

CommunityMessageLayer.__findViews = function(self)
    self.m_contentView = self:findViewById(self.s_controls.contentView);
    self.m_inputEdit = self:findViewById(self.s_controls.inputEdit);
    self.m_btnSend = self:findViewById(self.s_controls.btnSend);
    self.m_speakBg = self:findViewById(self.s_controls.speakBg);
    self.m_chatTypeBg = self:findViewById(self.m_ctrls.chatBg);
    self.m_inputBg = self:findViewById(self.m_ctrls.inputBg);
    self.m_recordView = self:findViewById(self.m_ctrls.recordView);
    self.m_checkView = self:findViewById(self.m_ctrls.checkView);
    self.m_notMessage = self:findViewById(self.m_ctrls.notMessage);
    self.m_recordHintImage = self:findViewById(self.m_ctrls.recordHintImage);
    self.m_speakHintText = self:findViewById(self.m_ctrls.speakHintText);
    self.m_recordHintImage = self:findViewById(self.m_ctrls.recordHintImage);
    self.m_recordBg = self:findViewById(self.m_ctrls.recordBg);
    self.m_hintText = self:findViewById(self.m_ctrls.hintText);
end

CommunityMessageLayer.__createMessageScrollView = function(self)
    if not self.m_messageScrollView then
        local w,h = self.m_contentView:getSize();
    	self.m_messageScrollView = UIFactory.createScrollView(0,0,w,h, true);
        self.m_messageScrollView :setSize(w,h);
    	self.m_contentView:addChild(self.m_messageScrollView);
    end
end

CommunityMessageLayer.dtor = function(self) 
    CommunityDataInterface.getInstance():setChatLayerStatus();
    
    CommunityDataInterface.getInstance():clearObserver(self);
    EventDispatcher.getInstance():unregister(CommunityMessageLayer.s_event_changeToPressSpeakLayer, self, self.onMicrophoneTimeOver);
    CommunityScheduler.getInstance():unscheduleUpdate(self,self.createMessageListItemTimer);
    self:__cleanMsgDetAnim();
    self:stopHintTimer();
end

CommunityMessageLayer.onAdImageClick = function (self,finger_action,x,y,drawing_id_first,drawing_id_current)
    if finger_action ~= kFingerDown and finger_action ~= kFingerMove then 
        CommunityDataInterface.getInstance():jumpOtherState(self.m_adData);
    end
end

CommunityMessageLayer.__initListItemPos = function (self)
    if not self.m_messageListView then
        return;
    end
    for index = 1, self.m_messageListView:getItemCount() do
        local item = self.m_messageListView:getItem(index);
        local x  = item:getPos();
        if x~= 0 then
            item:setPos(0,nil);
        end
        if item.m_bg:getVisible() then
            item.m_bg:setVisible(false);
        end
    end
end

CommunityMessageLayer.showMessageList = function(self)
    self.m_messageList = CommunityDataInterface.getInstance():getMessageList(true);
    CommunityDataInterface.getInstance():setChatLayerStatus();
    self:__createMessageListAdapter();
    self:__initListItemPos();
    self:__setViewStatus(true);
    local isShow = table.isEmpty(self.m_messageList) and true or false;
    self.m_notMessage:setVisible(isShow);
end

CommunityMessageLayer.showFriendChatList = function(self, friendData)
    self.m_friendData = friendData;
    self:findViewById(self.m_ctrls.name):setText(tostring(self.m_friendData.nickname))
    CommunityDataInterface.getInstance():setChatLayerStatus(self.m_friendData.cid);
    self:__setViewStatus(false);
    self:__createMessageScrollView();
    local friendChatList = CommunityDataInterface.getInstance():getFriendChatList(self.m_friendData.cid) or {};
    if #friendChatList == 0 then
        self.m_needTime = true;
    else
        local diffTime = tonumber(AppData.getInstance():getRightTimeWithServer()) - tonumber(friendChatList[#friendChatList].msg_time);
        if diffTime >= 5*60 then
            self.m_needTime = true;
        end
    end

    self:__setCurrentMessageType(ImSdkConstants.msgType.AUDIO);
    self:__setSendMessageType();
    self:__cleanMsgDetAnim();
    
    self:__cleanUpWithFriendList();
    self.m_msgDetAnim = AnimFactory.createAnimInt(kAnimNormal, 0, 1 ,1, 0);
    self.m_msgDetAnim:setDebugName("CommunityMessageLayer|msgDetAnim");
    self.m_msgDetAnim:setEvent(self,function(self)
        self:__asyncLoadFriendChatList(friendChatList);
    end);
    self.m_inputEdit:setText("限制50个字",self.m_inputEditWidth,self.m_inputEditHeight,132,135,126);
end

CommunityMessageLayer.__cleanMsgDetAnim = function(self)
    delete(self.m_msgDetAnim);
	self.m_msgDetAnim = nil;
end

CommunityMessageLayer.__cleanUpWithFriendList = function (self)
    if self.m_messageScrollView then
        self.m_messageScrollView:removeAllChildren(true);
        if self.scroller then
            local min,max = self.scroller:getRegularOffsetRange();
            if min < 0 then
               self.scroller:setOffset(max);
            end
        end
    end
end

--异步加载会话列表
CommunityMessageLayer.__asyncLoadFriendChatList = function(self, friendChatList)
    if table.isEmpty(friendChatList) then
        return;
    end
  	local length = #friendChatList;
	for i, v in pairs(friendChatList) do
        local timeStr = "";
		if i == 1 then 
			timeStr = TimeHandler.formatHandler(v.msg_time,0);
		elseif i>1 and i<= length -1 then
			timeStr = TimeHandler.formatHandler(friendChatList[i+1].msg_time,v.msg_time);
		end
        v.timeStr = timeStr;
        if v.msg_status == ImSdkConstants.msgStatus.SENDING then
           v.msg_status = ImSdkConstants.msgStatus.FAILED_SEND;
        end
		self:updateView(v);
	end
end


CommunityMessageLayer.onGetMessageListCallBack = function(self, isSuccess, messageList)
    Log.v("CommunityMessageLayer.onGetMessageListCallBack", "messageList = ", messageList);
    if isSuccess then
        self.m_messageList = messageList;
        self:__createMessageListAdapter(messageList);
        local isShow = table.isEmpty(messageList) and true or false;
        self.m_notMessage:setVisible(isShow);
    end
end

CommunityMessageLayer.__setViewStatus = function(self, isShowMessageList)
    self:findViewById(self.m_ctrls.messageView):setVisible(isShowMessageList);
    self:findViewById(self.m_ctrls.chatView):setVisible(not isShowMessageList);
end

CommunityMessageLayer.__createMessageListAdapter = function(self)
    if not self.m_messageListView then
        local parent = self:findViewById(self.m_ctrls.messageListView);
        local w,h = parent:getSize();
        self.m_messageListView = NVerticalListView.create();
        parent:addChild(self.m_messageListView);
        self.m_messageListView:setAlign(kAlignCenter);
        self.m_messageListView:setSize(w,h);
        self.m_itemIndex = 0;
        self.m_createItemFinish = false;
    else
        self:__updateItem();
    end
    if #self.m_messageList == 0 then
        self.m_messageListView:setFingerActionEnabled(false);
    else
        self.m_messageListView:setFingerActionEnabled(true);
    end
end
 
CommunityMessageLayer.createMessageListItemTimer = function(self)
    if self.m_createItemFinish or not self.m_messageListView then
        return;
    end
    local len = #self.m_messageList;
    self.m_messageListView:addInvokeOnStop(function ()
        self.m_itemIndex = self.m_itemIndex+1;
        if self.m_itemIndex <= len then
            self:__createMsgListItem(self.m_messageList[self.m_itemIndex]);
            if self.m_itemIndex == len then
                self.m_createItemFinish = true;
            end
        end
    end)
    if len == 0 then
        self.m_notMessage:setVisible(true);
        self.m_createItemFinish = true;
    end
end


CommunityMessageLayer.__createMsgListItem = function (self,v)
    local item = new(require("hall/community/widget/message/communityMessageListItem"),v,self.m_messageListView);
    item:setEventTouch({self,item},self.onMsgListItemClick);
    self.m_messageListView:addItem(item);

end

CommunityMessageLayer.__updateItem = function (self)
    local data  = self.m_messageList;
    local itemCount = self.m_messageListView:getItemCount();
    local len = #data;
    for index = 1, itemCount do
        self.m_messageListView:addInvokeOnStop(function () 
            local actualIndex = index;
            local obj = data[actualIndex];
            if obj then
                local item = self.m_messageListView:getItem(actualIndex)
                item:refreshRedDot(obj);
            end
        end)
    end
   
    if len > itemCount then --添加
        for index = itemCount+1, len do
            self.m_messageListView:addInvokeOnStop(function ()
                local actualIndex = index;
                local obj = data[actualIndex];
                if obj then
                    self:__createMsgListItem(obj);
                end
            end)
        end             
    elseif len < itemCount then --删除    
        for index = itemCount, len+1, -1 do
            self.m_messageListView:addInvokeOnStop(function ()
                self.m_messageListView:removeItem(index, true);
            end);
        end
    end

    if len == 0 then
        self.m_notMessage:setVisible(true);
    end
end

CommunityMessageLayer.onHandleAddFriendCallBack = function (self,isSuccess)
    if isSuccess then
        LoadingView.getInstance():hidden();   
    end
end

CommunityMessageLayer.onBtnReturnClick = function (self)
    self:showMessageList();
end

CommunityMessageLayer.onBtnSendClick = function(self)
    if not CommunityDataInterface.getInstance():isFriend(self.m_friendData.cid) then
        self:showToast("啊哦，对方同您解除了好友关系，好友间才能发消息哦",true);
        return;
    end
    if self:checkMessage() then
        local content = string.trim(self.m_inputEdit:getText());
        
        local param  = {};
        param.avatar_url = self.m_friendData.avatar_url or "";
        param.sex = self.m_friendData.sex or "2";
        param.cid = self.m_friendData.cid or 0 ;
        param.nickname = self.m_friendData.nickname or "" ;

        param.msg_sessionid = tostring(AppData.getInstance():getRightTimeWithServer());
        param.msg_content = content;
        param.msg_type = ImSdkConstants.msgType.TEXT;
        param.msg_send_type = ImSdkConstants.sendMsgType.SEND_TYPE;
        param.msg_file_path = "";
        param.msg_key = ""
        param.msg_status = ImSdkConstants.msgStatus.SENDING;
        CommunityDataInterface.getInstance():sendText(param);
        self:updateSendMessage(param);
    	self.m_inputEdit:setText("限制50个字",self.m_inputEditWidth,self.m_inputEditHeight,132,135,126);
        UBReport.getInstance():report(UBConfig.kHallCommunityPrivateTextFinish);
    end
end


CommunityMessageLayer.onFinishEditText = function(self,p_string,flag)
    local str = string.trim(self.m_inputEdit:getText());
    if string.isEmpty(str) then
        self.m_inputEdit:setText("限制50个字",self.m_inputEditWidth,self.m_inputEditHeight,132,135,126);
    else
        self.m_inputEdit:setText(str,self.m_inputEditWidth,self.m_inputEditHeight,255,255,255);
        if flag == EditText.s_EX_CLOSE_DONE then
            self:onBtnSendClick();
        end
    end
end
CommunityMessageLayer.getTextSize = function(self, label)
    local text = new(Text, label:getText(), nil, nil, nil, nil, 28);
    local w,h = text:getSize();
    delete(text);
    return w,h;
end

CommunityMessageLayer.checkMessage = function(self)
	local messageStr = self.m_inputEdit:getText();
	if string.isEmpty(string.trim(messageStr)) then
		local msg = kTextFirstSpeak;
        self:showToast(msg);
		return false;
	end
	
	return true;
end

CommunityMessageLayer.updateView = function(self,data)
    if string.checkEmpty(data.timeStr) then
        local chatTime = new(require("hall/community/widget/message/communityChatTime"), data.timeStr);
        self.m_messageScrollView:addChild(chatTime);
    end
    self.m_communintyChatItem = new(require("hall/community/widget/message/communityChatItem"), data);
    self.m_messageScrollView:addChild(self.m_communintyChatItem);
    self.m_messageScrollView:createScroller();
    self.scroller = self.m_messageScrollView.m_scroller;
    local min,max = self.scroller:getRegularOffsetRange();
    if min<0 then
       self.scroller:setOffset(min);
    end
end

CommunityMessageLayer.onBtnChatClick = function(self)
    self:__setSendMessageType();
end

CommunityMessageLayer.__setSendMessageType = function (self)
    local messageType = self:__getCurrentMessageType();
    local image = "";
    if messageType == ImSdkConstants.msgType.TEXT then
        self:__setCurrentMessageType(ImSdkConstants.msgType.AUDIO);
        image = community_pin_map["keyboard.png"];
        self:__setInputType(false);
    elseif messageType == ImSdkConstants.msgType.AUDIO then
        self:__setCurrentMessageType(ImSdkConstants.msgType.TEXT);
        image = community_pin_map["talkback.png"];
        self:__setInputType(true);
    end
    self.m_chatTypeBg:setFile(image);
    self.m_chatTypeBg:setSize(self.m_chatTypeBg.m_res:getWidth(),self.m_chatTypeBg.m_res:getHeight());
end

CommunityMessageLayer.__setInputType = function (self ,currentInputType)
    self.m_inputEdit:setVisible(currentInputType);
    self.m_btnSend:setVisible(currentInputType);
    self.m_inputBg:setVisible(currentInputType);
    self.m_speakBg:setVisible(not currentInputType);
end

CommunityMessageLayer.__setCurrentMessageType = function (self,currentMessageType)
    self.m_currentMessageType = currentMessageType;
end

CommunityMessageLayer.__getCurrentMessageType = function (self)
    return self.m_currentMessageType;
end

--更新聊天消息
CommunityMessageLayer.updateSendMessage = function(self,data)  
    if table.isEmpty (data) then
        return;
    end
    local interval = AppData.getInstance():getRightTimeWithServer() - (self.m_refreshTime or 0);
    if interval >  5*60 then --五分钟后标示时间
        self.m_needTime = true;
    end
    local param = data;
    if self.m_needTime then --需要创建时间
        param.timeStr = os.date("%H:%M",AppData.getInstance():getRightTimeWithServer())
        self:updateView(param);
        self.m_needTime = false;
    else --不需要创建时间
        param.timeStr = "";
        self:updateView(param);
    end
    self.m_refreshTime = AppData.getInstance():getRightTimeWithServer();
end

--delegate
CommunityMessageLayer.onGetNewChatMessageCallBack = function(self,isSuccess,friendCid, messageList)
    local message = messageList[#messageList];
    if isSuccess then
        if self.m_friendData and message.cid == self.m_friendData.cid then
            message.msg_send_type = ImSdkConstants.sendMsgType.RECV_TYPE;
		    self:updateSendMessage(message);
	    end
    end
end

CommunityMessageLayer.onEmptyFunc = function (self)
end

CommunityMessageLayer.onBtnMoreClick = function(self)
    local msg = "暂未开放，敬请期待";
    self:showToast(msg);
end

CommunityMessageLayer.showLoading = function(self,msg )
   LoadingView.getInstance():hidden();
   LoadingView.getInstance():showText(msg);
end

---------------------------------------按住说话逻辑-------------------------------------------
CommunityMessageLayer.__stopPlayingVoice = function (self)
    if self.m_communintyChatItem then
        self.m_communintyChatItem:voiceEnd();
    end
end

CommunityMessageLayer.onPressSpeakClick = function (self,finger_action, x, y, drawing_id_first, drawing_id_current)
   
    if finger_action == kFingerDown then
	    self.m_speakBg:setColor(128, 128, 128);
        self:__stopPlayingVoice();
	    self:showMicrophone();
        self.m_pressSpeakView:microphoneStart();
        CommunityDataInterface.getInstance():imStartAudioRecord(); --开始录音
        self.m_microphoneTimeOver = false;
        self.m_recordBg:setVisible(false);  
        self.m_isCancel = true;
    elseif finger_action == kFingerMove then
        if not self.m_microphoneTimeOver then
            if x > 340 and x < 1136 and y > 550 then   --有效局域
                self:setIsVisibleMicrophone(true);  
                self.m_recordBg:setVisible(false);  
                self.m_isCancel = true; 
                self.m_speakHintText:setText("松开 结束");
            else --无效局域 
                self.m_isCancel = false;
                self:setIsVisibleMicrophone(false);
                self.m_recordHintImage:setFile(community_pin_map["recordCancel.png"]);
                self.m_recordHintImage:setSize(self.m_recordHintImage.m_res:getWidth(),self.m_recordHintImage.m_res:getHeight());
                self.m_speakHintText:setText("松开手指取消发送");
                self.m_hintText:setText("松开手指取消发送",nil,nil,255,85,85);
                self.m_recordBg:setVisible(true); 
            end
        end
    elseif finger_action == kFingerUp or finger_action == kFingerCancel then
        if not self.m_microphoneTimeOver then
	        self:__stopAudioRecord();
        end
    end
end

CommunityMessageLayer.setIsVisibleMicrophone = function (self,visible)
    if self.m_pressSpeakView then
        self.m_pressSpeakView:setIsVisible(visible);
    end
end

CommunityMessageLayer.showMicrophone = function(self)
	if not self.m_pressSpeakView then
		self.m_pressSpeakView = new(require("hall/community/widget/message/communityPressSpeakLayer"));
		self.m_pressSpeakView:setDelegate(self);
		self.m_recordView:addChild(self.m_pressSpeakView);
	end
	self.m_pressSpeakView:show();
    self.m_speakHintText:setText("松开 结束");
end

CommunityMessageLayer.hideMicrophone = function(self)
    self.m_speakHintText:setText("按住说话");
	if self.m_pressSpeakView then
		self.m_pressSpeakView:hide();
	end
end

CommunityMessageLayer.__stopAudioRecord = function (self)
    self.m_recordBg:setVisible(false);
    self.m_speakBg:setColor(255, 255, 255);
    self:hideMicrophone();
	CommunityDataInterface.getInstance():imStopAudioRecord();--停止录音
end

CommunityMessageLayer.onMicrophoneTimeOver = function(self)
    --时间到直接发送
    self.m_microphoneTimeOver = true;
    self.m_isCancel = true;
    self:__stopAudioRecord();
end

--@delegate 录制音频回调
CommunityMessageLayer.onGetRecordAudioFinishCallBack = function(self, filePath, fileTime, fileSize)
    if not self.m_isCancel then
        return;
    end
    if not CommunityDataInterface.getInstance():isFriend(self.m_friendData.cid) then
        self:showToast("啊哦，对方同您解除了好友关系，好友间才能发消息哦",true);
        return;
    end
    if not string.isEmpty(filePath) then
        self:hideMicrophone();
        local param = {};
        param.avatar_url = self.m_friendData.avatar_url or "";
        param.sex = self.m_friendData.sex or "2";
        param.cid = self.m_friendData.cid or 0 ;
        param.nickname = self.m_friendData.nickname or "" ;
        param.msg_sessionid = tostring(AppData.getInstance():getRightTimeWithServer());
        param.msg_type = ImSdkConstants.msgType.AUDIO;
        param.msg_send_type = ImSdkConstants.sendMsgType.SEND_TYPE;
        param.msg_content = fileTime;
        param.msg_file_path = filePath;
        param.msg_key = ""
        param.msg_content_ext = fileSize;
        param.msg_status = ImSdkConstants.msgStatus.SENDING;
        CommunityDataInterface.getInstance():sendAudio(param);
        self:updateSendMessage(param);
        UBReport.getInstance():report(UBConfig.kHallCommunityPrivateAudioFinish);
    else
        self.m_recordHintImage:setFile(community_pin_map["recordHint.png"]);
        self.m_hintText:setText("录音时间太短",nil,nil,255,255,255);
        self.m_recordHintImage:setSize(self.m_recordHintImage.m_res:getWidth(),self.m_recordHintImage.m_res:getHeight());
        self.m_recordBg:setVisible(true); 
        self.m_HintTimer = new(Timer,"CommunityMessageLayer|m_HintTimer",0.5,self,self.showRecordHint);
    end
    self.m_isCancel = true;
end

CommunityMessageLayer.stopHintTimer = function(self)
	if self.m_HintTimer then
        delete(self.m_HintTimer);
    end
	self.m_HintTimer = nil;
end

CommunityMessageLayer.showRecordHint = function(self)
    self:stopHintTimer();
    self.m_recordBg:setVisible(false);
end


----------------------------------------点击查找详情-----------------------------
CommunityMessageLayer.onBtnCheckClick = function (self)
   self:__setCheckInfoIsShow();
end

CommunityMessageLayer.__setCheckInfoIsShow = function(self)
    local isShow = self.m_checkView:getVisible();
    self.m_checkView:setVisible(not isShow);
end

CommunityMessageLayer.onBtnMaterialClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityPrivateMaterial);
    self:__setCheckInfoIsShow();
    IBaseDialog.remove("CommunityDetailInfoLayer");
    local data = CommunityDataInterface.getInstance():getFriendDataByCid(self.m_friendData.cid);
    if table.isEmpty(data) then
        data = self.m_friendData;
    end

    IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityDetailInfoLayer"), data, "friendChatList"));
end

CommunityMessageLayer.onBtnCleanUpClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallCommunityPrivateCleanUp);
   self:__cleanUpWithFriendList();
   self.m_needTime = true;
   CommunityDataInterface.getInstance():clearAllChatMessageWithFriend(self.m_friendData.cid);
   self:__setCheckInfoIsShow();
end

CommunityMessageLayer.onCheckBgClick = function (self,finger_action)
    if finger_action == kFingerUp then
        self:__setCheckInfoIsShow();
    end
end

CommunityMessageLayer.showToast = function (self,msg,isFriendToast)
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    local size = 30;
    if isFriendToast then
        size = 26;
    end
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",size,200,175,115);
    Toast.setDefaultDisplayTime();
end

CommunityMessageLayer.s_controlConfig =
{
	[CommunityMessageLayer.s_controls.messageListView] 			= {"messageView","messageView","messageListView"},
    [CommunityMessageLayer.s_controls.btnReturn]                = {"messageView","chatView","topView","btnReturn"},
    [CommunityMessageLayer.s_controls.name] 			        = {"messageView","chatView","topView","name"},
    [CommunityMessageLayer.s_controls.btnCheck] 		        = {"messageView","chatView","topView","btnCheck"},
    [CommunityMessageLayer.s_controls.checkView] 		        = {"messageView","chatView","checkView"},
    [CommunityMessageLayer.s_controls.btnMaterial] 		        = {"messageView","chatView","checkView","btnMaterial"},
    [CommunityMessageLayer.s_controls.btnCleanUp] 	            = {"messageView","chatView","checkView","btnCleanUp"},
    [CommunityMessageLayer.s_controls.btnMore] 			        = {"messageView","chatView","bottomView","btnMore"}, 
    [CommunityMessageLayer.s_controls.btnSend] 			        = {"messageView","chatView","bottomView","btnSend"},
    [CommunityMessageLayer.s_controls.btnChat] 			        = {"messageView","chatView","bottomView","btnChat"},
    [CommunityMessageLayer.s_controls.chatBg] 			        = {"messageView","chatView","bottomView","btnChat","bg"}, 
    [CommunityMessageLayer.s_controls.inputEdit] 			    = {"messageView","chatView","bottomView","inputBg","inputEdit"}, 
    [CommunityMessageLayer.s_controls.speakView] 			    = {"messageView","chatView","bottomView","speakBg","speakView"}, 
    [CommunityMessageLayer.s_controls.speakHintText] 			= {"messageView","chatView","bottomView","speakBg","speakView","speakHintText"}, 
    [CommunityMessageLayer.s_controls.inputBg] 			        = {"messageView","chatView","bottomView","inputBg"}, 
    [CommunityMessageLayer.s_controls.speakBg] 			        = {"messageView","chatView","bottomView","speakBg"}, 
    [CommunityMessageLayer.s_controls.contentView] 			    = {"messageView","chatView","contentView"}, 
    [CommunityMessageLayer.s_controls.recordView] 			    = {"messageView","chatView","recordView"}, 
    
    [CommunityMessageLayer.s_controls.chatView] 			    = {"messageView","chatView"}, 
    [CommunityMessageLayer.s_controls.messageView] 			    = {"messageView","messageView"},
    [CommunityMessageLayer.s_controls.notMessage] 			    = {"messageView","messageView","notMessage"},
    [CommunityMessageLayer.s_controls.recordBg] 			    = {"messageView","chatView","recordView","recordBg"},  
    [CommunityMessageLayer.s_controls.recordHintImage] 			= {"messageView","chatView","recordView","recordBg","recordHintImage"},  
    [CommunityMessageLayer.s_controls.hintText] 			= {"messageView","chatView","recordView","recordBg","hintText"},   
};

CommunityMessageLayer.s_controlFuncMap =
{
	[CommunityMessageLayer.s_controls.btnReturn] 	        = CommunityMessageLayer.onBtnReturnClick,
	[CommunityMessageLayer.s_controls.btnMaterial] 	        = CommunityMessageLayer.onBtnMaterialClick,
    [CommunityMessageLayer.s_controls.btnCleanUp] 	        = CommunityMessageLayer.onBtnCleanUpClick,
    [CommunityMessageLayer.s_controls.btnMore] 	            = CommunityMessageLayer.onBtnMoreClick,
    [CommunityMessageLayer.s_controls.btnSend] 	            = CommunityMessageLayer.onBtnSendClick,
    [CommunityMessageLayer.s_controls.btnChat] 	            = CommunityMessageLayer.onBtnChatClick,
    [CommunityMessageLayer.s_controls.inputEdit] 	        = CommunityMessageLayer.onFinishEditText,
    [CommunityMessageLayer.s_controls.speakView] 	        = CommunityMessageLayer.onPressSpeakClick,
    [CommunityMessageLayer.s_controls.btnCheck] 	        = CommunityMessageLayer.onBtnCheckClick,
    [CommunityMessageLayer.s_controls.checkView] 	        = CommunityMessageLayer.onCheckBgClick,
};

return CommunityMessageLayer;