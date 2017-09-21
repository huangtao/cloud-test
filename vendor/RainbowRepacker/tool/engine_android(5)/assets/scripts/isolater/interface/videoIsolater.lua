require("gameData/dataInterfaceBase");
require("hall/gameData/videosdk/videosdkHelper");

--[[
    语音对讲中间层
--]]
VideoIsolater = class(DataInterfaceBase);

VideoIsolater.Delegate = {
    onVideoCmdLogin = "onVideoCmdLogin";
    onVideoCmdMicrophoneOpen = "onVideoCmdMicrophoneOpen";
    onVideoCmdMicrophoneClose = "onVideoCmdMicrophoneClose";
    onVideoCmdUsersStatusChange = "onVideoCmdUsersStatusChange";
    onVideoCmdMicrophoneOpenError = "onVideoCmdMicrophoneOpenError";
};

VideoIsolater.getInstance = function()
    if not VideoIsolater.s_instance then
        VideoIsolater.s_instance = new(VideoIsolater);
    end

    return VideoIsolater.s_instance;
end

VideoIsolater.releaseInstance = function()
    delete(VideoIsolater.s_instance);
    VideoIsolater.s_instance = nil;
end

VideoIsolater.ctor = function(self)
    VideoSDKHelper.getInstance():setObserver(self);
end 

VideoIsolater.dtor = function(self)
    VideoSDKHelper.getInstance():clearObserver(self);
end

--[[
    @brief 登入房间，登入同一个房间的玩家才能进行语音对讲
    @param gameId (number) 游戏id
    @param roomId (number) 桌子id
    @note 登入同一个房间的玩家必须游戏id和桌子id相同
--]]
VideoIsolater.login = function(self, gameId, roomId)
    VideoSDKHelper.getInstance():login(gameId, roomId);
end

--[[
    @brief 登出房间，登出房间后无法进行语音对讲
--]]
VideoIsolater.logout = function(self)
    VideoSDKHelper.getInstance():logout(); 
end

--[[
    @brief 请求开启麦克风，传输语音给其他玩家
--]]
VideoIsolater.openMicrophone = function(self)
    VideoSDKHelper.getInstance():openMicrophone(); 
end

--[[
    @brief 请求关闭麦克风，停止发送语音给其他玩家
--]]
VideoIsolater.closeMicrophone = function(self)
    VideoSDKHelper.getInstance():closeMicrophone();
end

--[[
    @brief 判断语音是否已登录
--]]
VideoIsolater.isLogined = function(self)
    return VideoSDKHelper.getInstance():isLogined(); 
end

--[[
    @brief 刷新用户语音开关状态
--]]
VideoIsolater.refreshUsersStatus = function(self, isLogined)
    VideoSDKHelper.getInstance():refreshUsersStatus(isLogined);
end

------------------------------------------------------------------------
--[[
    @brief 登入房间回调
    @param isSuccess (boolean) 登入房间是否成功，true为成功，false为失败
--]]
VideoIsolater.onVideoCmdLogin = function(self, isSuccess)
    self:notify(VideoIsolater.Delegate.onVideoCmdLogin, isSuccess);
end

--[[
    @brief 打开麦克风回调
    @param isSuccess (boolean) 打开麦克风是否成功，true为成功，false为失败
--]]
VideoIsolater.onVideoCmdMicrophoneOpen = function(self, isSuccess)
    self:notify(VideoIsolater.Delegate.onVideoCmdMicrophoneOpen, isSuccess);
end

--[[
    @brief 关闭麦克风回调
    @param isSuccess (boolean) 关闭麦克风是否成功，true为成功，false为失败
--]]
VideoIsolater.onVideoCmdMicrophoneClose = function(self, isSuccess)
    self:notify(VideoIsolater.Delegate.onVideoCmdMicrophoneClose, isSuccess);
end

--[[
    @brief 玩家状态变化
    @param data (table) 玩家状态列表
--]]
VideoIsolater.onVideoCmdUsersStatusChange = function(self, data, userId)
    self:notify(VideoIsolater.Delegate.onVideoCmdUsersStatusChange, data, userId)
end 

--[[
    @brief 请求上麦失败，应用没有麦克风权限
--]]
VideoIsolater.onVideoCmdMicrophoneOpenError = function(self)
    self:notify(VideoIsolater.Delegate.onVideoCmdMicrophoneOpenError);
end

-------------------------------兼容老框架-----------------------------------

--[[
    @brief 设置声音
    @param volume (number) 音量，取值区间[0,1]
    @note 弃用，兼容老框架
--]]
VideoIsolater.setAudioVolume = function(self, volume)
end

--[[
    @brief 是否支持语音对讲
    @param networkType (number) 网络类型  -1:无网络 1:wifi 2:2G 3:3G 4:4G
    @return (boolean) 是否支持，true为支持，false为不支持
    @note 弃用，兼容老框架
--]]
VideoIsolater.isNetWorkSupportByType = function(self, networkType)
    return false;
end

--[[
    @brief 当前网络类型是否支持语音对讲
    @return (boolean) 是否支持，true为支持，false为不支持
    @note 弃用，兼容老框架
--]]
VideoIsolater.isNetWorkSupport = function(self)
    return false;
end
