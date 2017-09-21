require("core/eventDispatcher");
require("common/nativeEvent");
require("gameData/dataInterfaceBase");
require("gameData/clientInfo");
require("hall/gameData/videosdk/videosdkConstants");
require("hall/userInfo/data/userInfoData");
require("hall/setting/data/settingDataInterface");

VideoSDKHelper = class(DataInterfaceBase);

VideoSDKHelper.Delegate = {
    onVideoCmdLogin = "onVideoCmdLogin";
    onVideoCmdMicrophoneOpen = "onVideoCmdMicrophoneOpen";
    onVideoCmdMicrophoneClose = "onVideoCmdMicrophoneClose";
    onVideoCmdUsersStatusChange = "onVideoCmdUsersStatusChange";
    onVideoCmdMicrophoneOpenError = "onVideoCmdMicrophoneOpenError";
    -- onVideoCmdNetworkChange = "onVideoCmdNetworkChange";
};

VideoSDKHelper.getInstance = function()
    if not VideoSDKHelper.s_instance then
        VideoSDKHelper.s_instance = new(VideoSDKHelper);
    end

    return VideoSDKHelper.s_instance;
end

VideoSDKHelper.releaseInstance = function()
    delete(VideoSDKHelper.s_instance);
    VideoSDKHelper.s_instance = nil;
end

VideoSDKHelper.ctor = function(self)
    EventDispatcher.getInstance():register(Event.Call, self, self.onNativeEvent);

    self:reset();
end 

VideoSDKHelper.dtor = function(self)
    EventDispatcher.getInstance():unregister(Event.Call, self, self.onNativeEvent);

    self:_deleteAllTimer();
end

VideoSDKHelper.reset = function(self)
	self.m_isLogined = false; -- 保证开关麦克风和登出请求在登入之后
	self.m_isLogining = false; -- 保证不会同时存在多个登入请求
    self.m_isMicrophoneOpened = false; -- 保证关闭麦克风请求在开启麦克风之后
    self.m_isMicrophoneOperating = false; -- 保证麦克风操作是原子操作
    self:resetUserList();
end

VideoSDKHelper.resetUserList = function(self)
	if not table.isEmpty(self.m_userList) then
		for k, v in pairs(self.m_userList) do
			self.m_userList[k] = false;
		end
		self:refreshUsersStatus();
	end

	self.m_userList = {};
end

VideoSDKHelper.login = function(self, gameId, roomId)
	self.m_gameId = gameId;
	self.m_roomId = roomId;
	
	self.m_loginCount = 1;
	
	self:_login(self.m_gameId, self.m_roomId);
end

VideoSDKHelper.logout = function(self)
	self:_log("VideoSDKHelper.logout", "isLogined", self.m_isLogined);
	
	self:reset();
	
	self:_deleteAllTimer();
	
	NativeEvent.getInstance():videoLogout();

end

VideoSDKHelper.openMicrophone = function(self)
	self:_log("VideoSDKHelper.openMicrophone", "isLogined", self.m_isLogined, "isOperating", self.m_isMicrophoneOperating);
	
	if not self.m_isLogined and not self.m_isMicrophoneOperating then
		self:_log("VideoSDKHelper.openMicrophone", "return");
		return;
	end

	self:_createTimeoutTimer(self.onVideoCmdMicrophoneOperateFail);
	
	self.m_isMicrophoneOpened = true;
	self.m_isMicrophoneOperating = true;

	UBReport.getInstance():report(UBConfig.kVideoMicrophoneUse, string.format("gameId%s_roomId%s", self.m_gameId or "", self.m_roomId or ""))
	
	dict_set_string(VideoSDKConstants.DICT_NAME, VideoSDKConstants.KEY_NETWORK_TIPS, kTextChatRealTimeOperateTipsNetwork);
	NativeEvent.getInstance():videoOpenMicrophone();
end

VideoSDKHelper.closeMicrophone = function(self)
	self:_log("VideoSDKHelper.closeMicrophone", "isLogined", self.m_isLogined, "isOperating", self.m_isMicrophoneOperating, 
		"isOpened", self.m_isMicrophoneOpened);
	
	if not self.m_isLogined and not self.m_isMicrophoneOpened and not self.m_isMicrophoneOperating then
		self:_log("VideoSDKHelper.closeMicrophone", "return");
		return;
	end

	self:_createTimeoutTimer(self.onVideoCmdMicrophoneOperateFail);
	
	self.m_isMicrophoneOpened = false;
	
	UBReport.getInstance():report(UBConfig.kVideoMicrophoneUseEnd, string.format("gameId%s_roomId%s", self.m_gameId or "", self.m_roomId or ""))
	
	NativeEvent.getInstance():videoCloseMicrophone();
end

VideoSDKHelper.isLogined = function(self)
	return self.m_isLogined;
end

VideoSDKHelper.refreshUsersStatus = function(self, isLogined)
	local userId = isLogined and self.m_userListFinalUserId or nil;
	self:notify(VideoSDKHelper.Delegate.onVideoCmdUsersStatusChange, self.m_userList, userId);
end

VideoSDKHelper.setMicrophoneState = function(self, state)
	self.m_microphoneState = state;
end

VideoSDKHelper.getMicrophoneState = function(self)
	return self.m_microphoneState;
end

-- VideoSDKHelper.isNetWorkSupport = function(self)
-- 	local ret = true;
-- 	local networkType = NativeEvent.getInstance():getNetworkType();
--     if networkType == -1 or (networkType == 2 and not Region_video_support_2G) then
--     	ret = false;
--     end
--     self:_log("VideoSDKHelper.isNetWorkSupport", "networkType", networkType, "ret", ret);
--     return ret;
-- end

-- VideoSDKHelper.isNetWorkSupportByType = function(self, networkType)
-- 	local ret = true;
--     if networkType == -1 or (networkType == 2 and not Region_video_support_2G) then
--     	ret = false;
--     end
--     self:_log("VideoSDKHelper.isNetWorkSupportByType", "networkType", networkType, "ret", ret);
--     return ret;
-- end

-----------------------------------------------------------------------------------
-- 未定义指令
VideoSDKHelper.onVideoCmdUndefine = function(self, data)
	-- donothing
end

-- 登录成功
VideoSDKHelper.onVideoCmdLoginSuccess = function(self, data)
	self:_deleteTimer();
    self.m_isLogined = true;
    self.m_isLogining = false;
    self:notify(VideoSDKHelper.Delegate.onVideoCmdLogin, self.m_isLogined);
    self:refreshUsersStatus(true);
end

-- 登录失败
VideoSDKHelper.onVideoCmdLoginFail = function(self, data)
	self.m_isLogined = false;
	self.m_isLogining = false;
	self:notify(VideoSDKHelper.Delegate.onVideoCmdLogin, self.m_isLogined);

	self._onTimer();
end

-- 麦克风开启回调
VideoSDKHelper.onVideoCmdMicrophoneOpen = function(self, data)
	self:_deleteTimeoutTimer();
	self.m_isMicrophoneOperating = false;
	self:notify(VideoSDKHelper.Delegate.onVideoCmdMicrophoneOpen, true);
end

-- 麦克风关闭回调
VideoSDKHelper.onVideoCmdMicrophoneClose = function(self, data)
	self:_deleteTimeoutTimer();
	self.m_isMicrophoneOperating = false;
	self:notify(VideoSDKHelper.Delegate.onVideoCmdMicrophoneClose, true);
end

-- 麦克风操作失败回调
VideoSDKHelper.onVideoCmdMicrophoneOperateFail = function(self, data)
	self:_deleteTimeoutTimer();
	self.m_isMicrophoneOperating = false;
	if self.m_isMicrophoneOpened then
		self:notify(VideoSDKHelper.Delegate.onVideoCmdMicrophoneOpen, false);	
	else
		self:notify(VideoSDKHelper.Delegate.onVideoCmdMicrophoneClose, false);
	end
end

VideoSDKHelper.onVideoCmdUsersStatusChange = function(self, data)
	local isEnable = tonumber(data.isEnable.__value) or 0;
	local userId = tonumber(data.userId.__value);
	if not userId then
		return;
	end

	self.m_userList[userId] = isEnable == 1;
	self.m_userListFinalUserId = userId;

	if self.m_isLogined then
		self:notify(VideoSDKHelper.Delegate.onVideoCmdUsersStatusChange, self.m_userList, userId);
	end
end

-- 麦克风开启错误，权限问题
VideoSDKHelper.onVideoCmdMicrophoneOpenError = function(self, data)
	self:notify(VideoSDKHelper.Delegate.onVideoCmdMicrophoneOpenError);
end

-- 操作被阻塞
VideoSDKHelper.onVideoCmdDialogShowing = function(self, data)
	self:_deleteTimeoutTimer();
end

-- -- 网络状态改变
-- VideoSDKHelper.onVideoCmdNetworkChange = function(self, data)
-- 	local networkType = tonumber(data.networkType.__value) or -1;
-- 	self:notify(VideoSDKHelper.Delegate.onVideoCmdNetworkChange, networkType);
-- end

-- 用户离开
VideoSDKHelper.onVideoCmdUserLeave = function(self, data)
	audio_exit_record();
	kMusicPlayer:play(kMusicPlayer:getCurSoundIndex(), true)
	audio_enter_record();
end

-- 指令处理
VideoSDKHelper.videoResultCallback = function(self, isSuccess, data, result)
    self:_log("VideoSDKHelper.videoResultCallback", "result", result, data);
    if not (isSuccess and data and data.cmd) then
        return;
    end

    local cmd = tostring(data.cmd.__value) or "";
    local func = VideoSDKHelper.s_cmdEventFuncMap[cmd];
    if func then
    	func(self, data);
    end
end

-- 原生回调
VideoSDKHelper.onNativeEvent = function(self, param, ...)
    if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self, ...);
    end
end
----------------------------------------------------------------------
VideoSDKHelper._login = function(self, gameId, roomId)
	if self.m_isLogined or self.m_isLogining then
		return;
	end

	self:_log(string.format("第%s次尝试登录", self.m_loginCount));

	local appId = gameId; -- 以gameId作为appId
	local userId = kUserInfoData:getUserId();
	local support2G = RegionConfigDataInterface.getInstance():getVideoSupport2GFlag() and 1 or 0;
	local networkType = VideoSDKConstants.VersionMap[NETWORK_TYPE];

	dict_set_int(VideoSDKConstants.DICT_NAME, VideoSDKConstants.KEY_APP_ID, appId);
	dict_set_int(VideoSDKConstants.DICT_NAME, VideoSDKConstants.KEY_USER_ID, userId);
	dict_set_int(VideoSDKConstants.DICT_NAME, VideoSDKConstants.KEY_ROOM_ID, roomId);
	dict_set_int(VideoSDKConstants.DICT_NAME, VideoSDKConstants.KEY_SUPPORT_2G, support2G);
	dict_set_int(VideoSDKConstants.DICT_NAME, VideoSDKConstants.KEY_VERSION, networkType[1]);

	self:_log("VideoSDKHelper.login","appId",appId,"userId",userId,"roomId",roomId, "support2G", support2G, 
		"networkType", NETWORK_TYPE, "version", networkType[2]);

	self:_createTimer();

	self.m_isLogining = true;

	NativeEvent.getInstance():videoLogin();
end

-----------------------------------------------------------------------------
VideoSDKHelper._createTimer = function(self)
    self:_deleteTimer();
	self.m_timer = new(Timer, "video_sdk", 15, self, self._onTimer);
end

VideoSDKHelper._deleteTimer = function(self)
	if self.m_timer then
		delete(self.m_timer);
		self.m_timer = nil;
	end
end

VideoSDKHelper._onTimer = function(self)
	if not self then
		return;
	end

	self:_deleteTimer();
	self.m_loginCount = self.m_loginCount + 1;

	self.m_isLogining = false;
	if self.m_loginCount <= 5 then
		self:_login(self.m_gameId, self.m_roomId);
	end
end

VideoSDKHelper._createTimeoutTimer = function(self, func)
	self:_log("VideoSDKHelper._createTimeoutTimer");
	self:_deleteTimeoutTimer();
	self.m_timeoutTimer = new(Timer, "video_sdk_timeout", 8, self, self._onTimeout, func);
end

VideoSDKHelper._onTimeout = function(self, func)
	if not self then
		return;
	end
	self:_log("VideoSDKHelper._onTimeout");

	self:_deleteTimeoutTimer();

	if func then
		func(self);
	end
end

VideoSDKHelper._deleteTimeoutTimer = function(self)
	self:_log("VideoSDKHelper._deleteTimeoutTimer");
	if self.m_timeoutTimer then
		delete(self.m_timeoutTimer);
		self.m_timeoutTimer = nil;
	end
end

VideoSDKHelper._deleteAllTimer = function(self)
	self:_deleteTimer();
    self:_deleteTimeoutTimer();
end

VideoSDKHelper._log = function(self, ...)
	Log.d("VideoSDK", ...);
end

VideoSDKHelper.s_cmdEventFuncMap = {
	[VideoSDKConstants.CMD_UNDEFINE] = VideoSDKHelper.onVideoCmdUndefine;
	[VideoSDKConstants.CMD_LOGIN_SUCCESS] = VideoSDKHelper.onVideoCmdLoginSuccess;
	[VideoSDKConstants.CMD_LOGIN_FAIL] = VideoSDKHelper.onVideoCmdLoginFail;
	[VideoSDKConstants.CMD_MICROPHONE_OPEN] = VideoSDKHelper.onVideoCmdMicrophoneOpen;
	[VideoSDKConstants.CMD_MICROPHONE_CLOSE] = VideoSDKHelper.onVideoCmdMicrophoneClose;
	[VideoSDKConstants.CMD_MICROPHONE_OPERATE_FAIL] = VideoSDKHelper.onVideoCmdMicrophoneOperateFail;
	[VideoSDKConstants.CMD_USERS_STATUS_CHANGE] = VideoSDKHelper.onVideoCmdUsersStatusChange;
	[VideoSDKConstants.CMD_MICROPHONE_OPEN_ERROR] = VideoSDKHelper.onVideoCmdMicrophoneOpenError;
	[VideoSDKConstants.CMD_DIALOG_SHOWING] = VideoSDKHelper.onVideoCmdDialogShowing;
	[VideoSDKConstants.CMD_USER_LEAVE] = VideoSDKHelper.onVideoCmdUserLeave;
};

VideoSDKHelper.s_nativeEventFuncMap = {
    ["videoResultCallback"] = VideoSDKHelper.videoResultCallback;
};
