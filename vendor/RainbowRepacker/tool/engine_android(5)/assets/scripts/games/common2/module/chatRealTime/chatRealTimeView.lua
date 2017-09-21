require("games/common2/module/chatRealTime/chatRealTimeLogic");
require("util/timer");
require("uilibs/richText")

--[[
	实时对讲逻辑
]]
local ViewBase = require("games/common2/module/viewBase");

local ChatRealTimeView = class(ViewBase, false);

ChatRealTimeView.s_controls = 
{
	chatSwitch = ToolKit.getIndex();
    chatSwitchOpen = ToolKit.getIndex();
    chatSwitchClose = ToolKit.getIndex();
	tipsView = ToolKit.getIndex();
	messageContent = ToolKit.getIndex();
	clipView = ToolKit.getIndex();
	messageBg = ToolKit.getIndex();
	messageView = ToolKit.getIndex();
};


ChatRealTimeView.ctor = function(self,seat,viewConfig)
	super(self,viewConfig);
	self.m_seat = seat;
	self:setFillParent(true, true);
	ChatRealTimeLogic.getInstance();
	self:_startDelayTimer(1,self,self.onLoginSuccess);
end

ChatRealTimeView.dtor = function(self)
	self:onLogoutSuccess();
	
	self:_hideTips();
	self:_popMuteState();

	ChatRealTimeLogic.releaseInstance();
end

----------------------------------麦克风动画显示逻辑----------------------------------------------
ChatRealTimeView.showMicrophone = function(self)
	if not self.m_microphoneView then
		local microphoneView = require("games/common2/module/chatRealTime/microphoneView");
		self.m_microphoneView = new(microphoneView);
		self.m_chatSwitch:addChild(self.m_microphoneView);
	end

	self.m_microphoneView:show();
	self:_setChatSwitchState(true);

	self:_pushMuteState();
end

ChatRealTimeView.hideMicrophone = function(self)
	if self.m_microphoneView and self.m_microphoneView:getVisible() then
		self.m_microphoneView:hide();
		self:_popMuteState();
	end
end

ChatRealTimeView._pushMuteState = function(self)
	if not self.m_muteStateChange then
		self.m_mute = SettingIsolater.getInstance():getMute();
		SettingIsolater.getInstance():setMute(true);
		self.m_muteStateChange = true;
	end
end

ChatRealTimeView._popMuteState = function(self)
	if self.m_muteStateChange then
		SettingIsolater.getInstance():setMute(self.m_mute);
		self.m_muteStateChange = false;
	end
end

---------------------------------------语音动画逻辑-------------------------------------------
ChatRealTimeView.updateChatVoice = function(self,seat,uid,info,isFast)
	self:_log("updateChatVoice", info);
	info = table.verify(info);
	self.m_userNumber = 0;
	local userAdd = 0;
	for k, v in pairs(table.verify(info.list)) do
		if k ~= UserBaseInfoIsolater.getInstance():getUserId() then
			self:_log("updateChatVoice", "k", k, "v", v);
			local msgView = self:getChildByName(string.format("id_%s", k));
			local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(k);
			self:_log("updateChatVoice", "seat", seat)
			if v and seat and seat > 0 then
				if not msgView then
					local chatRealTimeMsg = require("games/common2/module/chatRealTime/chatRealTimeMsg");
					msgView = new(chatRealTimeMsg);
					msgView:setName(string.format("id_%s", k));
					self:addChild(msgView);
					userAdd = userAdd + 1;
				end

				local x, y, align = InteractionInfo.getInstance():getChatVoicePosNew(seat);
				self:_log("updateChatVoice", x, y, align);
				msgView:setPos(x, y);
				msgView:setAlign(align);
				msgView:show();
				self.m_userNumber = self.m_userNumber + 1;
			elseif msgView then
				msgView:hide();
			end
		end
	end

	self:_checkMessage(info.list, info.userId, self.m_userNumber, userAdd);
end

ChatRealTimeView.showMicroponeOpenTips = function(self,seat,uid,info,isFast)
	local userNumber = tonumber(self.m_userNumber) or 0;
	local playerNumer = PlayerSeat.getInstance():getCurGamePlayerMaxCount();
	self:_showMessage(string.format("#cFFFFFF实时对讲打开（%s/%s人正在对讲）", userNumber + 1, playerNumer));
end

ChatRealTimeView.showMicroponeCloseTips = function(self,seat,uid,info,isFast)
	self:_showMessage("#cFFFFFF你已关闭实时对讲");
end

ChatRealTimeView._checkMessage = function(self, list, userId, userNumber, userAdd)
	self:_log("_checkMessage", "list", list, "userId", userId, "userNumber", userNumber, "userAdd", userAdd);
	list = table.verify(list); 
	userId = tonumber(userId) or 0;

	if userId <= 0 or userId == UserBaseInfoIsolater.getInstance():getUserId() then
		return;
	end

	if userAdd == 1 then
		if list[userId] then
			local player = GamePlayerManager2.getInstance():getPlayerByMid(userId);
			if player then
				local result = self:_showMessage(string.format("#cFFFFFF%s#cFFB03E正在实时对讲", player:getNick()));
				if result and not(self.m_microphoneView and self.m_microphoneView:getVisible()) then
					self:_setChatSwitchState(false);
				end
			end
		else
			-- 玩家刚进房间的情况
			for k, v in pairs(list) do
				if v then
					local player = GamePlayerManager2.getInstance():getPlayerByMid(k);
					if player then
						local result = self:_showMessage(string.format("#cFFFFFF%s#cFFB03E正在实时对讲", player:getNick()));
						if result and not(self.m_microphoneView and self.m_microphoneView:getVisible()) then
							self:_setChatSwitchState(false);
						end
						break;
					end
				end
			end
		end
	elseif userNumber > 1 then
		local result = self:_showMessage(string.format("#cFFFFFF%s个房内玩家#cFFB03E正在实时对讲", userNumber));
		if result then
			self:_setChatSwitchState(true);
		end
	end
end

ChatRealTimeView.onRefreshVoicePos = function(self,seat,uid,info,isFast)
	local msgView = self:getChildByName(string.format("id_%s", uid));
	if msgView and msgView:getVisible() then
		local x, y, align = InteractionInfo.getInstance():getChatVoicePosNew(seat);
		self:_log("updateChatVoice", x, y, align);
		msgView:setPos(x, y);
		msgView:setAlign(align);
	end
end

-- 玩家头像位置变化需要刷新语音动画
ChatRealTimeView.refreshChatVoice = function(self,seat,uid,info,isFast)
	local isLogined = info;
	self:_log("refreshChatVoice", "isLogined", isLogined);
	ChatRealTimeLogic.getInstance():refreshUsersStatus(isLogined);
end

-- PrivateRoomIsolater callback 创建房间时需要获取tableId再请求登录语音
ChatRealTimeView.onReceivePrivateRoomInfo = function(self,seat,uid,info,isFast)
	ChatRealTimeLogic.getInstance():checkLogin(info);
end

--------------------------------------------------------------------------------------------------
-- ChatRealTimeView.monitoringAction = function(self,action,seat,uid,info,isFast)
--     if self.s_actionFuncMap and type(self.s_actionFuncMap[action])=="function" then
--         self.s_actionFuncMap[action](self,seat,uid,info,isFast);
--     end
-- end

---------------------------------------实时对讲按钮逻辑-------------------------------------------
ChatRealTimeView.parseConfig = function(self, config)
	self:_log("initChatRealTimeBtn");
	config = config or {
		["x"] = 280;
		["y"] = 15;
		["align"] = kAlignTopLeft;
	};
	self.m_chatSwitch = self:findViewById(ChatRealTimeView.s_controls.chatSwitch);
	self.m_chatSwitch:setPos(config.x, config.y);
	self.m_chatSwitch:setAlign(config.align);

	self:_initAlign(config.align);

	self:_initTipsView();
	self:_initClipView();
	self:_initMessage();
end

ChatRealTimeView.onChatSwitchClick = function(self)
	if self.m_microphoneView and self.m_microphoneView:getVisible() then
		self:_requestCloseMicrophone();
	else
		self:_requestOpenMicrophone();
	end

	self:_hideTips();
	UBReport.getInstance():report(UBConfig.kVideoChatSwitchClick);
end

ChatRealTimeView._requestOpenMicrophone = function(self)
	ChatRealTimeLogic.getInstance():requestOpenMicrophone();
end

ChatRealTimeView._requestCloseMicrophone = function(self, pushState)
	ChatRealTimeLogic.getInstance():requestCloseMicrophone(pushState);
end

ChatRealTimeView.onLoginSuccess = function(self,action,seat,uid,info,isFast)
	self:_log("onLoginSuccess");
	ChatRealTimeLogic.getInstance():requestVideoLogin();
end

ChatRealTimeView.onLogoutSuccess = function(self,action,seat,uid,info,isFast)
	self:_log("onLogoutSuccess");
	
	-- 登出先关闭语音开关
	if self.m_microphoneView and self.m_microphoneView:getVisible() then
		self:_requestCloseMicrophone(true);
	end

	ChatRealTimeLogic.getInstance():requestVideoLogout();
end

ChatRealTimeView._setChatSwitchState = function(self, isOpened)
	local chatSwitchOpen = self:findViewById(self.s_controls.chatSwitchOpen);
	local chatSwitchClose = self:findViewById(self.s_controls.chatSwitchClose);
	chatSwitchOpen:setVisible(not isOpened)
	chatSwitchClose:setVisible(isOpened);
	local btnShow = isOpened and chatSwitchClose or chatSwitchOpen;
	local messageContent = self:findViewById(self.s_controls.messageContent);
	messageContent:setSize(btnShow:getSize());
end	

ChatRealTimeView._initAlign = function(self, align)
	local alignView = kAlignLeft;
	if align == kAlignRight or align == kAlignTopRight or align == kAlignBottomRight then
		alignView = kAlignRight;
	end

	local chatSwitchOpen = self:findViewById(self.s_controls.chatSwitchOpen);
	local chatSwitchClose = self:findViewById(self.s_controls.chatSwitchClose);
	local messageContent = self:findViewById(self.s_controls.messageContent);
	local clipView = self:findViewById(self.s_controls.clipView);
	local messageBg = self:findViewById(self.s_controls.messageBg);
	local messageView = self:findViewById(self.s_controls.messageView);
	local fill, leftX, topY, rightX, bottomX = messageView:getFillRegion();
	chatSwitchOpen:setAlign(alignView);
	chatSwitchClose:setAlign(alignView);
	messageContent:setAlign(alignView);
	clipView:setAlign(alignView == kAlignLeft and kAlignRight or kAlignLeft);
	messageBg:setAlign(alignView);
	messageBg:setMirror(alignView == kAlignLeft, false);
	messageView:setFillRegion(fill, alignView == kAlignLeft and leftX or rightX, topY, 
		alignView == kAlignLeft and rightX or leftX, bottomX);
end

-----------------------------------tips view------------------------------------------
ChatRealTimeView._initTipsView = function(self)
	if not PrivateRoomIsolater.getInstance():getOpenFlagVideo() then
		self:_showTips();
		PrivateRoomIsolater.getInstance():setOpenFlagVideo(true)
	end
end	

ChatRealTimeView._showTips = function(self)
	self:findViewById(self.s_controls.tipsView):setVisible(true);
	self.m_timer = new(Timer, "ChatRealTimeView._showTips", 15, self, self._hideTips);
end

ChatRealTimeView._hideTips = function(self)
	self:findViewById(self.s_controls.tipsView):setVisible(false);
	if self.m_timer then
		delete(self.m_timer);
		self.m_timer = nil;
	end
end	

-----------------------------------message view------------------------------------------
ChatRealTimeView._initClipView = function(self)
	local clipView = self:findViewById(self.s_controls.clipView);
	clipView:setClip2(true, 0, 0, clipView:getSize());
end

ChatRealTimeView._initMessage = function(self)
	local messageView = self:findViewById(self.s_controls.messageView); 
	self.m_message = new(RichText, "", 24, 24, kAlignLeft, nil, 24)
	messageView:addChild(self.m_message);

    local messageBg = self:findViewById(self.s_controls.messageBg);
end

ChatRealTimeView._showMessage = function(self, msg)
	local messageContent = self:findViewById(self.s_controls.messageContent);	
	if messageContent:getVisible() then
		return false;
	end

	local messageBg = self:findViewById(self.s_controls.messageBg);
	local messageView = self:findViewById(self.s_controls.messageView);
	self.m_message:setText(msg, 24, 24);

	local _, leftX, _, rightX, _ = messageView:getFillRegion();
	local w, _ = self.m_message:getSize();
	messageBg:setSize(w + leftX + rightX);
    messageBg:setPos(0);

    local messageBgW = messageBg:getSize();
	local animation = require("animation");

	local func = function(value)
		messageBg:setPos(value.x)
	end

   	local action = animation.sequence(animation.prop("x", -messageBgW, 0, 0.5), 
	    animation.prop("x", 0, 0, 3.0), animation.prop("x", 0, -messageBgW, 0.5))
   	local animatorMessage = animation.Animator(action, func, kAnimNormal);

   	animatorMessage.on_stop = function(p_self)
   		self:_setChatSwitchState(true);
   		self:_hideMessage();
	end
    messageContent:setVisible(true);
	animatorMessage:start();

    return true;
end

ChatRealTimeView._hideMessage = function(self)
	local messageContent = self:findViewById(self.s_controls.messageContent);
	messageContent:setVisible(false);
end

ChatRealTimeView._log = function(self, ...)
	Log.d("ChatRealTimeView", ...);
end

ChatRealTimeView.s_controlConfig = 
{	
	[ChatRealTimeView.s_controls.chatSwitch]		= {"chatSwitch"};
	[ChatRealTimeView.s_controls.chatSwitchOpen]	= {"chatSwitch", "chatSwitchOpen"};
	[ChatRealTimeView.s_controls.chatSwitchClose]	= {"chatSwitch", "chatSwitchClose"};
	[ChatRealTimeView.s_controls.tipsView]			= {"tipsView"};
	[ChatRealTimeView.s_controls.messageContent]	= {"chatSwitch", "messageContent"};
	[ChatRealTimeView.s_controls.clipView]			= {"chatSwitch", "messageContent", "clipView"};	
	[ChatRealTimeView.s_controls.messageBg]			= {"chatSwitch", "messageContent", "clipView", "messageBg"};
	[ChatRealTimeView.s_controls.messageView]		= {"chatSwitch", "messageContent", "clipView", "messageBg", "messageView"};
};

ChatRealTimeView.s_controlFuncMap =
{
	[ChatRealTimeView.s_controls.chatSwitchOpen]		= ChatRealTimeView.onChatSwitchClick;
	[ChatRealTimeView.s_controls.chatSwitchClose]		= ChatRealTimeView.onChatSwitchClick;
};

ChatRealTimeView.s_stateFuncMap = {
	[GameMechineConfig.ACTION_LOGIN]                        = "onLoginSuccess";
};

ChatRealTimeView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_SHOW_MICROPHONE] 		= "showMicrophone";
	[GameMechineConfig.ACTION_NS_HIDE_MICROPHONE] 		= "hideMicrophone";
	[GameMechineConfig.ACTION_NS_UPDATE_CHAT_VOICE]		= "updateChatVoice";
	[GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE]	= "refreshChatVoice";
	[GameMechineConfig.ACTION_NS_LOGIN_VIDEO]			= "onLoginSuccess";
	[GameMechineConfig.ACTION_NS_LOGOUT_VIDEO]			= "onLogoutSuccess";
	[GameMechineConfig.ACTION_NS_REFRESH_HEADPOS]		= "onRefreshVoicePos";
	[GameMechineConfig.ACTION_NS_RECEIVE_PRIVATEROOMINFO] = "onReceivePrivateRoomInfo";
	[GameMechineConfig.ACTION_NS_SHOW_MICROPHONE_OPEN_TIPS] = "showMicroponeOpenTips";
	[GameMechineConfig.ACTION_NS_SHOW_MICROPHONE_CLOSE_TIPS] = "showMicroponeCloseTips";
};

return ChatRealTimeView;