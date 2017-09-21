local communityChatItem = require(ViewPath.."hall/community/message/communityChatItem");
local communityChatVoiceLeftAnim_pin_map = require("qnFiles/qnPlist/hall/communityChatVoiceLeftAnim_pin");
local communityChatVoiceRightAnim_pin_map = require("qnFiles/qnPlist/hall/communityChatVoiceRightAnim_pin");
local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
require("uiex/spannableText");
require("uiex/newTextView")
local CommunityPressSpeakLayer = require("hall/community/widget/message/communityPressSpeakLayer");

local CommunityChatItem =  class(CommonGameLayer,false);
local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityChatItem.msgTextSize = 28;

CommunityChatItem.s_controls = 
{
	view = getIndex();
	tagImage = getIndex();
    headBg= getIndex();
    chatBg = getIndex();
    voiceView = getIndex();
    voice    = getIndex();
    time = getIndex();
    redRot = getIndex();
    head_frame = getIndex();
};


CommunityChatItem.ctor = function(self,data)
	super(self,communityChatItem);
    self:setFillParent(true,false);
	self.m_ctrls = CommunityChatItem.s_controls;
    self.m_data = data;
    local count = string.count(self.m_data.msg_content);
    local size = 100;
    if count > 24 then
        size = math.modf(count/24) *40+100; --根据内容多少算宽度
    end
    self:setSize(1016,size)

	self:findViews();
	self:init();
    CommunityDataInterface.getInstance():setObserver(self);
    EventDispatcher.getInstance():register(Event.Pause,self,self.onPause);
end

CommunityChatItem.dtor = function(self)
	self.m_data = nil;
    self:cleanCheckTimer();
    self:__cleanTimerAnim();
    ImageCache.getInstance():cleanRef(self);
    CommunityDataInterface.getInstance():clearObserver(self);

    EventDispatcher.getInstance():unregister(Event.Pause,self,self.onPause);
end

CommunityChatItem.onPause = function(self)
    if self.m_playing then
        self:voiceEnd();
        CommunityDataInterface.getInstance():imStopAudioPlay();
    end
end

CommunityChatItem.findViews = function(self)
	self.m_view = self:findViewById(self.m_ctrls.view);
	self.m_tagImage = self:findViewById(self.m_ctrls.tagImage);
    self.m_headBg = self:findViewById(self.m_ctrls.headBg);
    self.m_chatBg = self:findViewById(self.m_ctrls.chatBg);
    self.m_voice  = self:findViewById(self.m_ctrls.voice);
    self.m_voiceView = self:findViewById(self.m_ctrls.voiceView);
    self.m_time  = self:findViewById(self.m_ctrls.time);
    self.m_redRot = self:findViewById(self.m_ctrls.redRot);
    self:findViewById(self.m_ctrls.head_frame):setLevel(2);
end

CommunityChatItem.init = function(self) 
   
    local time = number.valueOf(self.m_data.msg_content);
    if self.m_data.msg_type  ==  ImSdkConstants.msgType.AUDIO and time then
        self.m_data.msg_content = math.ceil(time/1000);
        if self.m_data.msg_content > CommunityPressSpeakLayer.DEFAULT_TIME_LIMIT then
           self.m_data.msg_content = CommunityPressSpeakLayer.DEFAULT_TIME_LIMIT; 
        end
    end

	if string.checkEmpty(self.m_data.msg_content) then
		self:showContent();
	end
end

--显示消息内容
CommunityChatItem.showContent = function(self)
	--历史消息不显示 后面的loading
	self:showTagImage();
    local w,h  = self:getSize();
	local spannableText;
    local image = "";
    local chatBgx = 120;
    local headurl = "";
    local headBgx = 40;
	
	if self.m_data.msg_send_type == ImSdkConstants.sendMsgType.RECV_TYPE then 
        image = community_pin_map["other_speak.png"];
        headurl = self.m_data.avatar_url or "";
        self.m_headBg:setAlign(kAlignLeft);
        self.m_chatBg:setAlign(kAlignLeft);
        if self.m_data.msg_type ==  ImSdkConstants.msgType.AUDIO then
            self.m_voiceView:setAlign(kAlignLeft);    
            self.m_voiceView:setVisible(true);
            self.m_voice:setFile(community_pin_map["other3.png"]);
            self.m_time:setText(tostring(self.m_data.msg_content).. self.m_time:getText()); 
            self.m_time:setAlign(kAlignRight);
            self.m_time:setColor(255,255,255);
            self.m_time:setVisible(true);
            self.m_redRot:setAlign(kAlignRight);
            if string.isEmpty(self.m_data.msg_file_path) then
                self.m_redRot:setVisible(true);
            end
        else
            self.m_voiceView:setVisible(false);
            self.m_time:setVisible(false);
        end
	else 
        image = community_pin_map["oneself_speak.png"];
        self.m_data.sex = kUserInfoData:getSex();
        headurl = kUserInfoData:getAvatar_s();
        self.m_headBg:setAlign(kAlignRight);
        self.m_chatBg:setAlign(kAlignRight);
        if self.m_data.msg_type ==  ImSdkConstants.msgType.AUDIO then
            self.m_voiceView:setVisible(true);
            self.m_voiceView:setAlign(kAlignRight);
            self.m_voice:setFile(community_pin_map["myself3.png"]);
            self.m_time:setText(tostring(self.m_data.msg_content).. self.m_time:getText()); 
            self.m_time:setAlign(kAlignLeft);
            self.m_time:setColor(154,255,232);
            self.m_time:setVisible(true);
            self.m_redRot:setAlign(kAlignLeft);
        else
            self.m_voiceView:setVisible(false);
            self.m_time:setVisible(false);
        end
	end
    if self.m_data.msg_type == ImSdkConstants.msgType.TEXT then
        self:__showMultilineMsgContent(self.m_data.msg_content);
    end
    self:setEventTouch(self,self.onMsgItemClick);
    self.m_chatBg:setFile(image)
    self.m_headBg:setPos(headBgx,nil);
    self.m_chatBg:setPos(chatBgx,nil);
   
    self:setHeadImage(kUserInfoData:getHallHeadBySex(self.m_data.sex));

    ImageCache.getInstance():request(headurl, self, self.onUpdateHeadImage);
    self:__resetChatBgSize();
end

CommunityChatItem.onMsgItemClick = function (self,finger_action,x,y,drawing_id_first,drawing_id_current)
    
    if finger_action == kFingerDown or finger_action == kFingerMove  then
	    return;
    end
    local x0, y0 = self.m_chatBg:getAbsolutePos();
    local w, h = self.m_chatBg:getSize();

    if (x >= x0 and x <= x0 + w) and (y >= y0 and y <= y0 + h) then 
        if self.m_data.msg_status == ImSdkConstants.msgStatus.SUCC_SEND then -- 发送成功 点击播放或者拿语音
            if self.m_data.msg_type == ImSdkConstants.msgType.AUDIO then
                if not self.m_playing then
                    if string.isEmpty(self.m_data.msg_file_path)then
                        CommunityDataInterface.getInstance():imGetAudioData(tostring(self.m_data.msg_key)); --如果不存在
                    else
                        self:voiceStart();
                        CommunityDataInterface.getInstance():imStartAudioPlay(tostring(self.m_data.msg_file_path)); --播放音频    
                    end 
                    self.m_playing = true;
                else
                    self:voiceEnd();
                end
            end
        elseif self.m_data.msg_status == ImSdkConstants.msgStatus.FAILED_SEND then --发送失败 点击重发
            self:resendMessage();
        end
    end
end
--发送失败 从新发送
CommunityChatItem.resendMessage = function (self)
    local param = {};
    param.avatar_url = self.m_data.avatar_url or "";
    param.sex = self.m_data.sex or "2";
    param.nickname = self.m_data.nickname or "";
    param.cid = self.m_data.cid or "0";
    param.msg_sessionid = self.m_data.msg_sessionid;
    param.msg_send_type = ImSdkConstants.sendMsgType.SEND_TYPE;
    param.msg_status = ImSdkConstants.msgStatus.SENDING;
    param.msg_content = self.m_data.msg_content;
    if self.m_data.msg_type == ImSdkConstants.msgType.TEXT then
        param.msg_type = ImSdkConstants.msgType.TEXT;
        param.msg_file_path = "";
        param.msg_key = ""
        CommunityDataInterface.getInstance():sendText(param);
    elseif self.m_data.msg_type == ImSdkConstants.msgType.AUDIO then    
        param.msg_type = ImSdkConstants.msgType.AUDIO;
        param.msg_file_path = self.m_data.msg_file_path;
        param.msg_key = self.m_data.msg_key;
        CommunityDataInterface.getInstance():sendAudio(param);
    end
    self.m_data.msg_status = ImSdkConstants.msgStatus.SENDING
    self:showTagImage();
end


CommunityChatItem.onGetVideoDataCallBack = function (self,isSuccess,msg_file_path,msg_key)
    if isSuccess then
        if msg_key == self.m_data.msg_key then
            self:voiceStart();
            self.m_data.msg_file_path = msg_file_path;
            CommunityDataInterface.getInstance():imStartAudioPlay(tostring(msg_file_path)); --播放音频
            self.m_redRot:setVisible(false);
        end
    else
        local msg = "获取声音数据失败";
        self:showNoticeView(msg);
    end
end

CommunityChatItem.showNoticeView = function(self,msg,width ,height,isFriendToast)
    local size  = 30;
    if isFriendToast then
        size = 26;
    end
    Toast.setDefaultDisplayTime(ImSdkConstants.toastDisplayTime);
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",size,200,175,115);
    Toast.setDefaultDisplayTime();
end 

CommunityChatItem.onUpdateHeadImage = function(self, url,imagePath)
    if not url or not imagePath then
        return;
    end
    self.hasLoadHead = true;
    self:setHeadImage(imagePath);
end

CommunityChatItem.setHeadImage = function(self,image)
	if self.m_headImage then
		self.m_headBg:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, community_pin_map["mask.png"]);
	self.m_headBg:addChild(self.m_headImage);
	self.m_headImage:setAlign(kAlignCenter);
end

--发送消息时更新状态
CommunityChatItem.onSendTextOrVideoCallBack = function(self, isSendSuccess, data) 
    if isSendSuccess then
        if data[1].client_sessionid == self.m_data.msg_sessionid then
            self.m_data.msg_status = ImSdkConstants.msgStatus.SUCC_SEND; --消息发送成功
            self:showTagImage();
        end
	else
        if data == "send message error" then
            self.m_data.msg_status = ImSdkConstants.msgStatus.FAILED_SEND;--消息发送失败
		    self:showTagImage();
            self:showNoticeView("消息发送失败！",nil,nil,true)
        end
	end
end

CommunityChatItem.__showMultilineMsgContent = function(self,content)
    local maxWidth = 680;
    local startX = 0;
    self.m_textView = new(NewTextView, maxWidth, 0, kAlignTopLeft , "",CommunityChatItem.msgTextSize,255,255,255);
    self.m_textView:setText(content);
    self.m_textView:setAlign(kAlignLeft);
    if self.m_data.msg_send_type == ImSdkConstants.sendMsgType.RECV_TYPE then
        startX = 20;
    else
        startX = 15;
    end
    self.m_textView:setPos(startX,nil);
    self.m_chatBg:addChild(self.m_textView);   
end

--0:什么都不显示，1：显示loading  2:显示错误
CommunityChatItem.showTagImage = function(self)
	if self.anim then
		self.m_tagImage:removeProp(0);
	end
    self.m_tagImage:setPickable(false);
    self:__cleanTimerAnim();
	if self.m_data.msg_status == ImSdkConstants.msgStatus.SUCC_SEND then
        self.m_tagImage:setVisible(false);
	elseif self.m_data.msg_status == ImSdkConstants.msgStatus.SENDING then ---显示loading
		self.m_tagImage:setVisible(true);
		self.m_tagImage:setFile("hall/common/loading.png");
		self.m_tagImage:setSize(self.m_tagImage.m_res:getWidth(),self.m_tagImage.m_res:getHeight());
		self.m_tagImage:setColor(0,0,0);
		self.anim= self.m_tagImage:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
        self.m_timer = AnimFactory.createAnimInt(kAnimNormal, 0, 1 ,20000, 0); --30s超时
        self.m_timer:setDebugName("CommunityChatItem|showTagImage");
        self.m_timer:setEvent(self,function(self)
            self.m_data.msg_status = ImSdkConstants.msgStatus.FAILED_SEND; --消息发送失败
            self:showTagImage();
        end);
	elseif self.m_data.msg_status == ImSdkConstants.msgStatus.FAILED_SEND then 
        self.m_tagImage:setVisible(true);
		self.m_tagImage:setColor(255,255,255);
		self.m_tagImage:setFile(community_pin_map["sendFail.png"]);
		self.m_tagImage:setSize(self.m_tagImage.m_res:getWidth(),self.m_tagImage.m_res:getHeight());
        self.m_tagImage:setPickable(true);
        self.m_tagImage:setEventTouch(self,self._onTouchTagImage);
	end
    
    if self.m_data.msg_send_type == ImSdkConstants.sendMsgType.RECV_TYPE then
        self.m_tagImage:setAlign(kAlignRight);
    else
        self.m_tagImage:setAlign(kAlignLeft);
    end
end

CommunityChatItem._onTouchTagImage = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action == kFingerUp then
        self:resendMessage();
    end
end

CommunityChatItem.__cleanTimerAnim = function(self)
    if self.m_timer then
        delete(self.m_timer);
    end
	self.m_timer = nil;
end

CommunityChatItem.__resetChatBgSize = function (self)
    if self.m_chatBg then
        if self.m_data.msg_type ==  ImSdkConstants.msgType.AUDIO then
            local time  = tonumber(self.m_data.msg_content);
            if time > 1 then
                self.m_chatBg:setSize(self.m_chatBg.m_res:getWidth()+ (time-1)*3 ,nil)
            end
        else
            local w, h = self.m_textView:getSize();
	        local rW, rH = w, h;
	        if w >= 600 then
		        rW = 600 + 110;
	        elseif w < 80 then
		        rW = 102; 
	        else
		        rW =w+55;
	        end
	        if h > 90 then
		        rH = 90 + 40;
	        elseif h < 30 then
		        rH = 30 + 40;
	        else
		        rH = h + 40;
	        end
	        self.m_chatBg:setSize(rW, rH);
	        self:setSize(rW, nil);
        end
    end
end

CommunityChatItem.voiceStart = function(self)
    self.m_voiceView:setVisible(true);
    self:voiceEnd();
    if self.m_data.msg_send_type == ImSdkConstants.sendMsgType.SEND_TYPE then
        self.m_animFrame = new(AnimFrameNew, communityChatVoiceLeftAnim_pin_map, 200,-1);
    else
        self.m_animFrame = new(AnimFrameNew, communityChatVoiceRightAnim_pin_map, 200,-1);
    end
    self.m_animFrame:playInNode(self.m_voiceView, self.m_voice:getSize());
    self.m_voice:setVisible(false);

    self:cleanCheckTimer();
    self.m_checkTimer = new(Timer,"CommunityChatItem|voiceStart",tonumber(self.m_data.msg_content),self,self.voiceEnd);

end

CommunityChatItem.cleanCheckTimer = function (self)
    if self.m_checkTimer then
        delete(self.m_checkTimer);
    end
	self.m_checkTimer = nil;
end

CommunityChatItem.voiceEnd = function(self)
    self:cleanCheckTimer();
    self.m_voice:setVisible(true); 
    CommunityDataInterface.getInstance():imStopAudioPlay();
    if self.m_parent then
        for _,v in pairs( table.verify(self.m_parent.m_children) ) do
            v.m_playing = false;
            if v.m_animFrame then
                local parent = v.m_animFrame:getParent();
                if parent then
                    parent:removeChild(v.m_animFrame);
                end
                delete(v.m_animFrame);
                v.m_animFrame = nil;
                v.m_voice:setVisible(true);
            end
        end
    end
end

CommunityChatItem.onHeadBgClick = function (self)
    local data = {};
    IBaseDialog.remove("CommunityDetailInfoLayer");
    if self.m_data.msg_send_type == ImSdkConstants.sendMsgType.RECV_TYPE then 
        data = CommunityDataInterface.getInstance():getFriendDataByCid(self.m_data.cid) ;
    else
        data.cid  = kUserInfoData:getUserCid();
        data.sex  = kUserInfoData:getSex();
        data.gold = kUserInfoData:getMoney();
        data.diamond = kUserInfoData:getDiamond();
        data.nickname = kUserInfoData:getNickname();
        data.experience = kUserInfoData:getExp();
        data.city = kUserInfoData:getCity();
        data.avatar_url = kUserInfoData:getAvatar_b();
    end
    
    IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityDetailInfoLayer"), data, "chatItemClickHeadBg"));
end

CommunityChatItem.s_controlConfig = 
{
	[CommunityChatItem.s_controls.view]     = {"view"};
	[CommunityChatItem.s_controls.tagImage] = {"view","chatBg","tagImage"};
    [CommunityChatItem.s_controls.headBg]   = {"view","headBg"};
    [CommunityChatItem.s_controls.head_frame] = {"view","headBg","head_frame"};
    [CommunityChatItem.s_controls.chatBg]   = {"view","chatBg"};
    [CommunityChatItem.s_controls.voiceView]= {"view","chatBg","voiceView"};  
    [CommunityChatItem.s_controls.voice]    = {"view","chatBg","voiceView","voice"};  
    [CommunityChatItem.s_controls.time]     = {"view","chatBg","time"}; 
    [CommunityChatItem.s_controls.redRot]   = {"view","chatBg","redRot"}; 
    
    
}

CommunityChatItem.s_controlFuncMap =
{
    [CommunityChatItem.s_controls.headBg]           = CommunityChatItem.onHeadBgClick,
}

return CommunityChatItem;