
--[[
	实时对讲逻辑类
]]

ChatRealTimeLogic = class();


ChatRealTimeLogic.Delegate = {
};

ChatRealTimeLogic.getInstance = function()
	if not ChatRealTimeLogic.s_instance then
		ChatRealTimeLogic.s_instance = new(ChatRealTimeLogic);
	end
	return ChatRealTimeLogic.s_instance;
end

ChatRealTimeLogic.releaseInstance = function()
	delete(ChatRealTimeLogic.s_instance);
	ChatRealTimeLogic.s_instance = nil;
end

ChatRealTimeLogic.ctor = function(self)
	VideoIsolater.getInstance():setObserver(self);
end

ChatRealTimeLogic.dtor = function(self)
	VideoIsolater.getInstance():clearObserver(self);
end

ChatRealTimeLogic.checkLogin = function(self, info)
	if not self:isLogined() then
		self:requestVideoLogin();
	end
end

-- 请求登录，没有tableId时不请求登录语音
ChatRealTimeLogic.requestVideoLogin = function(self)
	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local roomId = GameInfoIsolater.getInstance():getCurTableId();
	if roomId and roomId > 0 then
		VideoIsolater.getInstance():login(gameId, roomId);
	end
end

-- 请求登出
ChatRealTimeLogic.requestVideoLogout = function(self)
	VideoIsolater.getInstance():logout();
end

-- 请求打开麦克风
ChatRealTimeLogic.requestOpenMicrophone = function(self)
	if not self:isLogined() then
		self:showToast(kTextChatRealTimeLoginTips);
	elseif not self:canOpenMicrophone() then
		Toast.setDefaultDisplayTime(2000);
		self:showToast(kTextChatRealTimeOperateTips);
		Toast.setDefaultDisplayTime();
	else
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SHOW_MICROPHONE);
		VideoIsolater.getInstance():openMicrophone();
	end
end

-- 请求关闭麦克风
ChatRealTimeLogic.requestCloseMicrophone = function(self, pushState)
	if not self:isLogined() then
		self:showToast(kTextChatRealTimeLoginTips);
	else
		self.m_microphoneState = pushState;
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_HIDE_MICROPHONE);
		VideoIsolater.getInstance():closeMicrophone();
	end
end

-- 刷新用户状态
ChatRealTimeLogic.refreshUsersStatus = function(self, isLogined)
	if self:isLogined() then
		VideoIsolater.getInstance():refreshUsersStatus(isLogined);
	end
end

-----------------------------------------------------------------------------
-- interface 回调
ChatRealTimeLogic.onVideoCmdLogin = function(self, isSuccess)
	self:_log("onVideoCmdLogin", isSuccess);

	if self.m_microphoneState then
		self:requestOpenMicrophone();
	end
end

-- interface 回调
ChatRealTimeLogic.onVideoCmdMicrophoneOpen = function(self, isSuccess)
	self:_log("onVideoCmdMicrophoneOpen", isSuccess);

	if isSuccess then
		if not self.m_microphoneState then
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SHOW_MICROPHONE_OPEN_TIPS);
		end
		self.m_microphoneState = false;
	else
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_HIDE_MICROPHONE);
		self:showToast(kTextChatRealTimeOpenFailTips);
	end
end

-- interface 回调
ChatRealTimeLogic.onVideoCmdMicrophoneClose = function(self, isSuccess)
	self:_log("onVideoCmdMicrophoneClose", isSuccess);

	if isSuccess then
		if not self.m_microphoneState then
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SHOW_MICROPHONE_CLOSE_TIPS);
		end
	else
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SHOW_MICROPHONE);
		self:showToast(kTextChatRealTimeCloseFailTips);
	end
end

-- interface 回调
ChatRealTimeLogic.onVideoCmdUsersStatusChange = function(self, data, userId)
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_UPDATE_CHAT_VOICE, {list = data, userId = userId});
end

-- interface 回调 麦克风无法开启
ChatRealTimeLogic.onVideoCmdMicrophoneOpenError = function(self)
	self:showToast(kTextChatRealTimeOpenErrorTips);
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_HIDE_MICROPHONE);
end

-- -- interface 回调 网络状态改变
-- ChatRealTimeLogic.onVideoCmdNetworkChange = function(self, networkType)
-- 	local isSupport = VideoIsolater.getInstance():isNetWorkSupportByType(networkType);
-- 	local action = GameMechineConfig.ACTION_NS_VIDEO_ENABLE;
-- 	MechineManage.getInstance():receiveAction(action,isSupport);
-- end

-------------------------------------------------------------------------------------
-- 选择连续上麦间隔时间(5s)
ChatRealTimeLogic.canOpenMicrophone = function(self)
	local time = os.time();
	if self.m_lastTime and time - self.m_lastTime < 5 then
		return false;
	else
		self.m_lastTime = time;
		return true;
	end
end

ChatRealTimeLogic.isLogined = function(self)
	return VideoIsolater.getInstance():isLogined();
end

ChatRealTimeLogic.showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

ChatRealTimeLogic._log = function(self, ...)
	Log.d("ChatRealTimeLogic", ...);
end