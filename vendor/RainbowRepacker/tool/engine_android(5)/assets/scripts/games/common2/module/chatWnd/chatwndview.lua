
require(RoomChatConfig.s_chatPathPrefix.."data/roomChatLogic");
require(RoomChatConfig.s_chatPathPrefix.."anim/animExtraSideBtn2");

local ViewBase = require("games/common2/module/viewBase");

local ChatWndView = class(ViewBase,false);

ChatWndView.s_controls = {
	popupLayer = ToolKit.getIndex();
	animLayer = ToolKit.getIndex();
};

ChatWndView.ctor = function(self, seat, layoutConfig)
    super(self,layoutConfig);
	self.m_ctrls = ChatWndView.s_controls;
    self:setFillParent(true,true);
    self:_getBaseView();
    self:_createChatLogic();
    self.m_seat = seat;
end 

ChatWndView.dtor = function(self)
	delete(self.m_chatLogic);
	self.m_chatLogic = nil;
end
-----------------------------------------------------------------------------

ChatWndView._createChatLogic = function(self)
	self.m_chatLogic = new(RoomChatLogic,self);
end

ChatWndView._getBaseView = function(self)
	self.m_popupLayer = self:findViewById(self.m_ctrls.popupLayer);
	self.m_animLayer = self:findViewById(self.m_ctrls.animLayer);
	RoomChatConfig.setChatAnimPosGetFunc(self,self.getChatFaceAnimPos);
	RoomChatConfig.setChatMsgAnimPosGetFunc(self,self.getChatMsgAnimPos);
end

ChatWndView.getChatFaceAnimPos = function(self,seat)
	return InteractionInfo.getInstance():getChatFaceAnimPos(seat);
end

ChatWndView.getChatMsgAnimPos = function(self,seat)
	return InteractionInfo.getInstance():getChatMsgAnimPos(seat);
end

ChatWndView._initBtns = function(self,btn,config)
	config = table.verify(config);
	
	if btn and typeof(btn,DrawingBase) then
		if not string.isEmpty(config.file) then
			btn:setFile(config.file);

			local res = btn.m_res;
			if res then
				local width, height = res:getWidth(), res:getHeight();
				btn:setSize(width,height);
			end
		end 
		btn:setAlign(config.align);
		btn:setPos(config.x,config.y);
		btn:setVisible(config.visible);
	end 
end

ChatWndView._createChatWindow = function(self)
	if not self.m_chatFaceWindow then 		
		local popupWnd = RoomChatConfig.getChatPopupWnd();
		if popupWnd and typeof(popupWnd,DrawingBase) then
			self.m_chatFaceWindow = popupWnd;
		    self.m_chatFaceWindow:setDelegate(self);
		    self.m_popupLayer:addChild(self.m_chatFaceWindow);
		end 
	end 
end

ChatWndView._showChatWnd = function(self)
	self:_createChatWindow();
	if self.m_chatFaceWindow then
		self.m_chatFaceWindow:show(1);
	end 
end

ChatWndView._onHidChatWnd = function(self)
	if self.m_chatFaceWindow then
		self.m_popupLayer:removeChild(self.m_chatFaceWindow);
		delete(self.m_chatFaceWindow);
		self.m_chatFaceWindow = nil;
	end
end

ChatWndView._isPlayChatTextAnim = function(self)
	local config = RoomChatConfig.getChatLayerConfig();
	local chatTextConfig = table.verify(config.chatText);

	return chatTextConfig.visible;
end

--是否显示聊天、表情
ChatWndView._checkIsShowChat = function(self)
	local shieldChat = SettingIsolater.getInstance():getShieldChat();
	return not shieldChat;
end
-----------------------------------------------------------------------------
ChatWndView.onChatBtnClick = function(self)
	if self:_isPlayChatTextAnim() then
		AnimExtraSideBtn2.sideBtnDelete();
    	AnimExtraSideBtn2.startSideBtnAnim(self.m_chatTextBtn,false,self, self._showChatWnd);
    else 
    	self:_showChatWnd();
    end 
end
-----------------------------------------------------------------------------
ChatWndView.onRequestVipCharge = function(self,obj,param,goodInfo)
	local action = GameMechineConfig.ACTION_RECHARGE;
	local data = {scene=PayIsolater.eGoodsListId.VipCharge};
	MechineManage.getInstance():receiveAction(action,data);
end

ChatWndView.onChatWndClosed = function(self) 
	if self:_isPlayChatTextAnim() then   
   		AnimExtraSideBtn2.startSideBtnAnim(self.m_chatTextBtn,true);
   	end 
end

--发送聊天文字
ChatWndView.requestSendChatText = function(self, obj, chatStr, index)
	self:playChatTextAnim(self.m_seat,chatStr,index);
	self.m_chatLogic:requestChatText(chatStr, index);
end 

--发送聊天表情
ChatWndView.requestSendChatFace = function(self,obj,page,faceIndex,vipType)
	if vipType == 1 then
		ReportIsolater.getInstance():reportWithVal(UBConfig.kChatClick9, string.format("gameId%s_levelId%s_faceIndex%s", GameInfoIsolater.getInstance():getCurGameId(),
			GameInfoIsolater.getInstance():getCurRoomLevelId(), faceIndex));
	else
		ReportIsolater.getInstance():reportWithVal(UBConfig.kChatClick10, string.format("gameId%s_levelId%s_faceIndex%s", GameInfoIsolater.getInstance():getCurGameId(),
			GameInfoIsolater.getInstance():getCurRoomLevelId(), faceIndex));
	end

	self:playChatFaceAnim(self.m_seat,page,faceIndex,vipType);
	self.m_chatLogic:requestChatFace(page,faceIndex,vipType);
end 

--用户弹出文字聊天动画
--注意这个seat是本地位置号，传递来的时候，先转成本地座位号
ChatWndView.playChatTextAnim = function(self,localseat,str,index)	
	if not str then
		return ;
	end

	if not self:_checkIsShowChat() then 
		return;
	end

    if not PlayerSeat.getInstance():isSeatLegal(localseat) then
	    return ;
    end

	local playerinfo = GamePlayerManager2.getInstance():getPlayerBySeat(localseat);
	
	if not playerinfo then 
		return;
	end

	local uid = playerinfo:getMid();
	local curState = MechineManage.getInstance():getStates(uid);
	if (not curState) or curState == GameMechineConfig.STATUS_NONE 
		or curState == GameMechineConfig.STATUS_RECONNECT then 
		return;
	end 

	local config = table.verify(RoomChatConfig.getChatTextConfig());
	index = number.valueOf(index);
	local localMsg = table.verify(config.text)[index];
	local msg = localMsg or str;

	if (index > 0) and (not localMsg) then
		-- 常用消息，本地匹配不到
		return;
	end 

	self.m_animLayer:removeAllChildren(true);
	local animRoot = RoomChatConfig.playChatTextAnim(localseat,msg)
	if animRoot and typeof(animRoot,DrawingBase) then 
		self.m_animLayer:addChild(animRoot);
	end

	if index > 0 then
		-- 常用聊天消息，不保存到聊天记录中
		return;
	end
	local nick = playerinfo:getNick();
	if localseat == PlayerSeat.getInstance():getMyLocalSeat() then
		-- 如果是玩家自己，不记录昵称
		nick = nil;
	end
	RoomChatTextRecord.getInstance():addChat(nick,msg,localseat);
end 

--弹出表情聊天动画
ChatWndView.playChatFaceAnim = function(self,localseat,page,faceIndex,vipType)
	if not page or not faceIndex then
		return ;
	end

	if not self:_checkIsShowChat() then 
		return;
	end

	if not PlayerSeat.getInstance():isSeatLegal(localseat) then
		return ;
	end

	local playerinfo = GamePlayerManager2.getInstance():getPlayerBySeat(localseat);
	if not playerinfo then 
		return;
	end

	local uid = playerinfo:getMid();
	local curState = MechineManage.getInstance():getStates(uid);
	if (not curState) or  curState == GameMechineConfig.STATUS_NONE 
		or curState == GameMechineConfig.STATUS_RECONNECT then 
		return;
	end

	self.m_animLayer:removeAllChildren(true);
	local animRoot = RoomChatConfig.playChatFaceAnim(localseat,vipType, (page-1)*9+ faceIndex);
	if animRoot and typeof(animRoot,DrawingBase) then 
		self.m_animLayer:addChild(animRoot);
	end
end

ChatWndView.onReceiveText = function(self,seat,uid,info,isFast)
	if not self:isDuringDefenseCheatTime() then
		if info and info.uid and info.msg then
			local index = number.valueOf(info.index);
			self.m_chatLogic:onReceiveText(info.uid,info.msg,index);
		end
	end
end

ChatWndView.onReceiveFace = function(self,seat,uid,info,isFast)
	if not self:isDuringDefenseCheatTime() then
		self.m_chatLogic:onReceiveFace(info);
	end
end

-- 提供给外部调用
ChatWndView.onSendChatMsg = function (self, seat, uid, info, isFast)
	if info then
		self:playChatTextAnim(seat,info);
		self.m_chatLogic:requestChatText(info);
	end
end

function ChatWndView:onGameLogin()
	RoomChatTextRecord.getInstance():reset();
end

function ChatWndView:onGameOver()
	self:_onHidChatWnd();
end

ChatWndView.isDuringDefenseCheatTime = function(self)
	return GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime();
end

-----------------------------------------------------------------------------
ChatWndView.s_controlConfig = 
{	
	[ChatWndView.s_controls.popupLayer]			= {"popupLayer"};
	[ChatWndView.s_controls.animLayer]			= {"animLayer"};
};

ChatWndView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_RECEIVE_CHAT]          = "onReceiveText";
	[GameMechineConfig.ACTION_RECEIVE_FACE]          = "onReceiveFace";
	[GameMechineConfig.ACTION_NS_CLICKACHAT]         = "onChatBtnClick";
	[GameMechineConfig.ACTION_NS_SEND_CHAT]		 	 = "onSendChatMsg";
	[GameMechineConfig.ACTION_NS_HID_CHATWND]		 = "_onHidChatWnd";
	
};

ChatWndView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGOUT]		 	 	 = "onGameLogin";
	[GameMechineConfig.STATUS_GAMEOVER]				 = "onGameOver";
};

return ChatWndView;