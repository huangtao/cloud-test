require("gameData/dataInterfaceBase")
require("hall/privateRoom/data/privateRoomDataInterface");
require("hall/password/inviteMessageView")

CommunityDataInterface = class(DataInterfaceBase);

CommunityDataInterface.Delegate = {
    onGetFriendListCallBack             =       "onGetFriendListCallBack";
    onGetKnowListCallBack               =       "onGetKnowListCallBack";
    onGetNearByListCallBack             =       "onGetNearByListCallBack";
    onGetMessageListCallBack            =       "onGetMessageListCallBack";
    onSendTextOrVideoCallBack           =       "onSendTextOrVideoCallBack";
    onRequestAddFriendCallBack          =       "onRequestAddFriendCallBack";
    onDeleteFriendCallBack              =       "onDeleteFriendCallBack";
    onGetNewChatMessageCallBack         =       "onGetNewChatMessageCallBack";
    onPushKickoutCallBack               =       "onPushKickoutCallBack";
    onGetUserDetailInfoCallBack         =       "onGetUserDetailInfoCallBack";
    onRefreshUnReadMessageNumCallBack   =       "onRefreshUnReadMessageNumCallBack";
    onHandleAddFriendCallBack           =       "onHandleAddFriendCallBack";
    onGetMaybeFamiliarCallBack          =       "onGetMaybeFamiliarCallBack";
    onRequestMessageListAdCallBack      =       "onRequestMessageListAdCallBack";
    onSendInviteFriendCallBack          =       "onSendInviteFriendCallBack";
    onCustomGetUserInfoCallBack         =       "onCustomGetUserInfoCallBack";
    onGetVideoDataCallBack              =       "onGetVideoDataCallBack";
    onGetRecordAudioFinishCallBack      =       "onGetRecordAudioFinishCallBack";
    onAddFriendResultCallBack           =       "onAddFriendResultCallBack";
    onGetSmsInviteFriendCallBack        =       "onGetSmsInviteFriendCallBack";
    onGetFriendsInviteList              =       "onGetFriendsInviteList";
    onGetFriendApplyMessageCallBack     =       "onGetFriendApplyMessageCallBack";
    onBeRemoveFromFriendCallBack        =       "onBeRemoveFromFriendCallBack";
    onOpenGpsFinishCallBack             =       "onOpenGpsFinishCallBack";

    onGetContactListCallBack = "onGetContactListCallBack";
    onInviteContactFriendsCallback = "onInviteContactFriendsCallback";

    -- 自动加好友
    onAutoAddFriendCallBack = "onAutoAddFriendCallBack";
    onHandleAutoAddFriendCallBack = "onHandleAutoAddFriendCallBack";
    onAutoAddFriendResultCallBack = "onAutoAddFriendResultCallBack";

    onInviteAnswerCallBack = "onInviteAnswerCallBack";
    onInviteNotifyCallBack = "onInviteNotifyCallBack";
    onGetProxyMessage = "onGetProxyMessage";
}

CommunityDataInterface.getInstance = function()
    if not CommunityDataInterface.s_instance then
        CommunityDataInterface.s_instance = new(CommunityDataInterface);
    end
    return CommunityDataInterface.s_instance;
end

CommunityDataInterface.cleanup = function()
    local lastObserverMap = CommunityDataInterface.getInstance():getObserverMap();
    delete(CommunityDataInterface.s_instance);
    CommunityDataInterface.s_instance = nil;

    CommunityDataInterface.getInstance():setObserverMap(lastObserverMap);
end

CommunityDataInterface.ctor = function(self)
    self.m_communityFriendListData = new(require("hall/community/data/communityFriendListData"), self); 
    self.m_communityKnowListData = new(require("hall/community/data/communityKnowListData"), self);
    self.m_communityNearByListData = new(require("hall/community/data/communityNearByListData"), self);
    self.m_communityMessageListData = new(require("hall/community/data/communityMessageListData"), self);
    self.m_communityServerPortData = new(require("hall/community/data/communityServerPortData"), self);
    self:__initData();
    ImSdkHelper.getInstance():setObserver(self);
    EventDispatcher.getInstance():register(Event.Call, self, self.onNativeEvent);
    EventDispatcher.getInstance():register(Event.Pause, self, self.onPause);
	EventDispatcher.getInstance():register(Event.Resume, self, self.onResume);
end

CommunityDataInterface.onPause = function (self)
    ImSdkHelper.getInstance():imPauseOrResume(0);
end

CommunityDataInterface.onResume = function (self)
    ImSdkHelper.getInstance():imPauseOrResume(1);
end


CommunityDataInterface.__initData = function (self)
    self:log("CommunityDataInterface.initData");
    self.m_friendListData = {};
    self.m_messageListData = {};
    self.m_setKonwToSeeIsShow = true;
end

CommunityDataInterface.dtor = function(self)
    delete(self.m_communityFriendListData);
    self.m_communityFriendListData = nil;

    delete(self.m_communityKnowListData);
    self.m_communityKnowListData = nil;

    delete(self.m_communityNearByListData);
    self.m_communityNearByListData = nil;

    delete(self.m_communityMessageListData);
    self.m_communityMessageListData = nil;

    delete(self.m_communityServerPortData);
    self.m_communityServerPortData = nil;

    ImSdkHelper.getInstance():clearObserver(self);
    ImSdkHelper.getInstance():imSdkQuit();
    EventDispatcher.getInstance():unregister(Event.Call, self, self.onNativeEvent);
    EventDispatcher.getInstance():unregister(Event.Pause, self, self.onPause);
	EventDispatcher.getInstance():unregister(Event.Resume, self, self.onResume);
end

-------------------------------------登录配置相关-----------------------

--@brief 请求des加密串
CommunityDataInterface.requestFriendDes = function (self,friend_des)
     --self.m_communityServerPortData:requestImDomain(friend_des);
     self.m_communityServerPortData:requestFriendDes(friend_des);
end

CommunityDataInterface.isImLoginSuccess = function (self)
    return self.m_communityServerPortData:isImLoginSuccess();
end


-------------------------------------好友操作相关-----------------------

--@brief 获取好友列表
--@param isForceUpdate: 是否强制刷新
CommunityDataInterface.getFriendList = function(self,isForceUpdate,rankType)
    UBReport.getInstance():report(UBConfig.kHallCommunityRefresh);
    return self.m_communityFriendListData:getFriendList(isForceUpdate,rankType);
end

--@brief 获取好友信息
CommunityDataInterface.getFriendDataByCid = function(self, cid)
    return self.m_communityFriendListData:getFriendDataByCid(cid);
end

--@brief 获取好友好友列表回调
CommunityDataInterface.onGetFriendListCallBack = function(self, isSuccess, friendListData,type)
    self:notify(CommunityDataInterface.Delegate.onGetFriendListCallBack, isSuccess, friendListData,type);
end

--@brief 好友列表排序
CommunityDataInterface.friendListSort = function (self, type)
    self.m_communityFriendListData:friendListSort(type);
end

--@brief 自定义获取用户信息
--@note cid、mid 2选一就行了
CommunityDataInterface.requestUserInfoCustom = function(self, cid, mid, extraParam)
    local info = {};
    info.cid = cid;
    info.mid = mid;
	info.fields = "mid,nick,icon,exp,money,sex,diamond,is_friend,city,max_rank,cid"; --表明需要拉取这些字
    if not string.isEmpty(extraParam) then
		info.fields = string.concat(info.fields, extraParam);
	end

	OnlineSocketManager.getInstance():sendMsg(PHP_GET_USERINFO,info);
end

--@brief获取好友cid 回调
CommunityDataInterface.onCustomGetUserInfoCallBack = function (self,isSuccess,data,sendParam)
    self:log("CommunityDataInterface.onCustomGetUserInfoCallBack -> ", "isSuccess = ",isSuccess,"info = ",info);

	self:notify(CommunityDataInterface.Delegate.onCustomGetUserInfoCallBack, isSuccess, data, table.verify(sendParam) );
end

--@brief 请求好友信息
CommunityDataInterface.requestFriendInfo = function(self,dst_cid)
    ImSdkHelper:imSdkFriendInfo(dst_cid,kUserInfoData:getUserCid());
end

--@brief 获取好友信息回调
CommunityDataInterface.onIMGetFriendInfoCallBack =  function (self, isSuccess, strInfo)
    if isSuccess then
        local data = json.decode(strInfo);
        if table.isEmpty(data) then
            self:notify(CommunityDataInterface.Delegate.onGetUserDetailInfoCallBack, false);
            return;
        end

        local listData = {};
        listData.cid = tonumber(data.cid) or 0; --cid
        listData.mid = tonumber(data.mid) or 0; --mid
        listData.regionid = tonumber(data.regionid) or 0; -- 地区id
        listData.nickname = tostring(data.nickname) or ""; --姓名
        listData.sex = tostring(data.sex) or "0"; --性别
        listData.avatar_url = tostring(data.avatar_url) or "";
        listData.gold = tonumber(data.gold) or 0; --银币
        listData.diamond = tonumber(data.diamond) or 0; --钻石
        listData.dinstance = tonumber(data.dinstance) or 0;--距离
        listData.client_version = tonumber(data.client_version) or 0; --sdk版本号
        listData.is_friend = tonumber(data.is_friend); --是否为好友
        listData.is_online = tonumber(data.is_online) or 0; --s是否在线
        listData.experience = tonumber(data.experience) or 0;-- 经验值
        listData.level     = tonumber(data.level) or 0; -- 等级
        listData.master_points = tonumber(data.master_points) or 0; --大师分
        listData.city   = tostring(data.city) or "辽宁大连"; --城市
        listData.is_vip  = tonumber(data.is_vip) or 0;           --是否vip 

        self:notify(CommunityDataInterface.Delegate.onGetUserDetailInfoCallBack, true, listData );
    else
        self:notify(CommunityDataInterface.Delegate.onGetUserDetailInfoCallBack, false);
    end
end

--@brief 请求添加好友
CommunityDataInterface.requestAddFriend = function(self, dst_cid, msg, otherPlayerCidList)
    otherPlayerCidList = json.encode( { cid_list = otherPlayerCidList or {} } );
    ImSdkHelper:imSdkAddFriend(dst_cid, msg, os.time(), kUserInfoData:getUserCid(), otherPlayerCidList);
end

--@brief 添加好友消息回调
CommunityDataInterface.onIMAddFriendCallBack = function(self, isSuccess, strInfo)
    -- 加好友处理
    local info = table.verify(json.decode(strInfo))[1];

    if not table.isEmpty(info) then 
        local msg = table.verify(json.decode(info.msg));
        if msg.add_friend_type and msg.add_friend_type == ImSdkConstants.eAddFriendType.AUTO then
            self:notify(CommunityDataInterface.Delegate.onAutoAddFriendCallBack,isSuccess, info);
            return;
        end
    end

    local msg = isSuccess and "发送成功，等待验证" or  "发送失败，请稍后重试";
    self:notify(CommunityDataInterface.Delegate.onRequestAddFriendCallBack,isSuccess,msg);
end

--@brief 请求删除好友
CommunityDataInterface.requestDeleteFriend = function(self, dst_cid)
    self.m_deleteFriendCid = dst_cid;
    ImSdkHelper:imSdkDeleteFriend(dst_cid, kUserInfoData:getUserCid());
end

--@brief 删除好友消息回调
CommunityDataInterface.onIMDeleteFriendCallBack = function(self, isSuccess, strInfo)
    if isSuccess then
        self.m_communityMessageListData:localDeleteMessageItem(self.m_deleteFriendCid);
        self.m_communityFriendListData:localDeleteFriendFromList(self.m_deleteFriendCid);
        self:notify(CommunityDataInterface.Delegate.onDeleteFriendCallBack, true, self.m_deleteFriendCid);
    else
        self:notify(CommunityDataInterface.Delegate.onDeleteFriendCallBack, false);
    end
end

--@brief 处理好友请求
CommunityDataInterface.requestHandleAddFriendMessage = function(self, dst_cid, status, appendMsg)
    self.m_lastHandleFriendCid = dst_cid;
    ImSdkHelper:imSdkHandleFriend(dst_cid, kUserInfoData:getNickname(), status, appendMsg, os.time(), kUserInfoData:getUserCid());
end

--@brief 处理好友请求消息回调
CommunityDataInterface.onIMHandleAddFriendCallBack = function(self, isSuccess, strInfo)
    -- 加好友处理
    local info = table.verify(json.decode(strInfo))[1];

    if not table.isEmpty(info) then 
        local msg = table.verify(json.decode(info.msg));
        if msg.add_friend_type and msg.add_friend_type == ImSdkConstants.eAddFriendType.AUTO then
            self:notify(CommunityDataInterface.Delegate.onHandleAutoAddFriendCallBack,isSuccess, info);
            return;
        end
    end

    self:deleteOneMessageItem(self.m_lastHandleFriendCid);
    if isSuccess then
        self:notify(CommunityDataInterface.Delegate.onHandleAddFriendCallBack, true);
    else
        self:notify(CommunityDataInterface.Delegate.onHandleAddFriendCallBack, false);
    end
end

--@brief 服务端推送添加加好友反馈结果消息
CommunityDataInterface.onIMPushAddFriendResultCallBack = function(self,isSuccess,data)
    self:log("onIMPushAddFriendResultCallBack", " data = ", data);
    -- 加好友处理
    if isSuccess then
        local listData = table.verify(json.decode(data))[1];

        if not table.isEmpty(listData) then
            local info = {
                cid = tonumber(listData.cid),
                msg = tostring(listData.msg),  
                time = tonumber(listData.time),  
                result = tonumber(listData.result),
                nickname = tostring(listData.nickname) or "",
            };
            local msg = table.verify(json.decode(info.msg));
            if msg.add_friend_type and msg.add_friend_type == ImSdkConstants.eAddFriendType.AUTO then
                self:notify(CommunityDataInterface.Delegate.onAutoAddFriendResultCallBack,isSuccess, info);
            else
                self:notify(CommunityDataInterface.Delegate.onAddFriendResultCallBack, true, info);
            end
            return;
        end
    end

    self:notify(CommunityDataInterface.Delegate.onAddFriendResultCallBack, false);
end

--@brief 推送新的好友消息
CommunityDataInterface.onIMPushNewFriendInfoCallBack = function(self, isSuccess, strInfo)
    if isSuccess then
        local friendInfoList = json.decode(strInfo);
        if not table.isEmpty(friendInfoList) then
            local friendInfo = friendInfoList[1];
            self.m_communityFriendListData:localAddFriendToFriendList(friendInfo.cid, friendInfo);
        end
    end
end

--@brief 服务器推送删除好友消息
CommunityDataInterface.onIMPushDelFriendMessageCallBack = function(self, isSuccess, strData)
    local data = json.decode(strData)
    if isSuccess and not table.isEmpty(data) then
        self.m_communityMessageListData:localDeleteMessageItem(data.cid);
        self.m_communityFriendListData:localDeleteFriendFromList(data.cid);
        self:notify(CommunityDataInterface.Delegate.onBeRemoveFromFriendCallBack, data.cid);
    end
end

---------------------------------音频--------------------------------
--@brief开始播放录音
CommunityDataInterface.imStartAudioRecord = function (self)
    ImSdkHelper.getInstance():imStartAudioRecord();
end

--@delegate 录制音频完成回调
CommunityDataInterface.onGetRecordAudioFinishCallBack = function(self, filePath, fileTime, fileSize)
    self:notify(CommunityDataInterface.Delegate.onGetRecordAudioFinishCallBack, filePath, fileTime, fileSize);
end

--@brief停止播放录音
CommunityDataInterface.imStopAudioRecord = function (self)
    ImSdkHelper.getInstance():imStopAudioRecord();
end

--@brief开始播放音频
CommunityDataInterface.imStartAudioPlay = function (self,audioPath)
    ImSdkHelper.getInstance():imStartAudioPlay(audioPath);
end

--@delegate 播放音频完成回调
CommunityDataInterface.onGetPlayAudioFinishCallBack = function(self)
end

--@brief停止播放音频
CommunityDataInterface.imStopAudioPlay = function (self)
    ImSdkHelper.getInstance():imStopAudioPlay();
end

--@brief开启gps
CommunityDataInterface.imOpenGps = function (self)
    ImSdkHelper.getInstance():imOpenGps();
end

--@brief 开启GPS回调
CommunityDataInterface.onOpenGpsFinishCallBack = function (self,isSuccess,lon,lat)
    self:notify(CommunityDataInterface.Delegate.onOpenGpsFinishCallBack,isSuccess,lon,lat);
end

--@brief获取音频数据
CommunityDataInterface.imGetAudioData = function (self, msg_key)
    ImSdkHelper.getInstance():imSdkGetAudioData(tostring(msg_key), kUserInfoData:getUserCid());
end

--@brief 获取音频数据回调
CommunityDataInterface.onGetVideoDataCallBack = function(self, isSuccess, file_path, key)
    self:notify(CommunityDataInterface.Delegate.onGetVideoDataCallBack, isSuccess, file_path, key);
end

----------------------------------消息-------------------------------------

--@delegate 好友申请消息回调
CommunityDataInterface.onGetFriendApplyMessageCallBack = function(self, applyInfo)
    self:notify(CommunityDataInterface.Delegate.onGetFriendApplyMessageCallBack, applyInfo);
end

--@delegate 好友申请消息回调 自动加好友
CommunityDataInterface.onGetAutoFriendApplyMessageCallBack = function(self, applyInfo)
    self:requestHandleAddFriendMessage(applyInfo.cid, 1, applyInfo.msg_content);
end

--@brief 获取消息
--@param isForceUpdate:是否强制拉取
CommunityDataInterface.getMessageList = function(self, isForceUpdate)
    return self.m_communityMessageListData:getMessageList(isForceUpdate);
end

--@brief 获取消息列表回调
CommunityDataInterface.onGetMessageListCallBack = function(self, isSuccess, listData)
    self:notify(CommunityDataInterface.Delegate.onGetMessageListCallBack, isSuccess, listData);
end

--@brief 删除和指定人的消息
CommunityDataInterface.deleteOneMessageItem = function(self, dst_cid)
    self.m_communityMessageListData:localDeleteMessageItem(dst_cid);
end

--@brief 判断是否有新消息
CommunityDataInterface.hasNewMessage = function(self)
    return self.m_communityMessageListData:hasNewMessage();
end

--@brief 获取和指定朋友的聊天信息
CommunityDataInterface.getFriendChatList = function(self, dst_cid)
    return self.m_communityMessageListData:getFriendChatList(dst_cid);
end

--@brief 设置消息为已读状态
CommunityDataInterface.setChatMessageToReaded = function(self, dst_cid)
    self.m_communityMessageListData:setChatMessageToReaded(dst_cid);
end

CommunityDataInterface.onRefreshUnReadMessageNumCallBack = function(self)
    self:notify(CommunityDataInterface.Delegate.onRefreshUnReadMessageNumCallBack);
end

--@brief 获取某个会话下还有多少未读消息
CommunityDataInterface.getFriendChatUnreadNum = function(self, dst_cid)
    return self.m_communityMessageListData:getFriendChatUnreadNum(dst_cid);
end

--@brief 清空和指定朋友的所有聊天消息
CommunityDataInterface.clearAllChatMessageWithFriend = function(self, dst_cid)
    self.m_communityMessageListData:clearAllChatMessageWithFriend(dst_cid);
end

--@brief 标识聊天列表是否为显示状态
--@param dst_cid:好友的cid  如果dst_cid不为空 则代表聊天窗口为显示状态，反之则为隐藏状态
CommunityDataInterface.setChatLayerStatus = function(self, dst_cid)
    if not dst_cid then
        CommunityDataInterface.getInstance():imStopAudioPlay();
    end
    self.m_communityMessageListData:setChatLayerStatus(dst_cid);
end

--@brief 发送文本消息
CommunityDataInterface.sendText = function(self, data)
    local params = {
        cid = tonumber(data.cid) or 0,
        nickname = tostring(data.nickname) or "",
        avatar_url = tostring(data.avatar_url)or "",
        sex  = tostring(data.sex) or "2",
        user_msg_unread_num = 0,
        msg_content =  tostring(data.msg_content) or "",
        msg_content_ext = "",
        msg_time = tostring(data.msg_sessionid),
        msg_sessionid = tostring(data.msg_sessionid),

        msg_send_type = ImSdkConstants.sendMsgType.SEND_TYPE,
        msg_type = ImSdkConstants.msgType.TEXT,
        msg_readed = ImSdkConstants.msgReaded.READED,
        msg_status = ImSdkConstants.msgStatus.SENDING,
        msg_file_path = "",
        msg_key = "",
    }
    self.m_sessionid = params.msg_sessionid;
    self.m_dstCid  = params.cid;
    self.m_communityMessageListData:localInsertTextOrVideoToListMsgData(params);
    ImSdkHelper.getInstance():imSdkSendMsg( json.encode(params), kUserInfoData:getUserCid());
end

--@brief 发送语音消息
CommunityDataInterface.sendAudio = function(self, data)
    local params = {
        cid = tonumber(data.cid) or 0,
        nickname = tostring(data.nickname) or "",
        avatar_url = tostring(data.avatar_url) or "",
        sex  = tostring(data.sex) or "2",
        user_msg_unread_num = 0,
        msg_content = tostring(data.msg_content) or "",
        msg_content_ext = tostring(data.msg_content_ext) or "";
        msg_time = tostring(data.msg_sessionid),
        msg_sessionid = tostring(data.msg_sessionid),
        msg_send_type = ImSdkConstants.sendMsgType.SEND_TYPE,
        msg_type = ImSdkConstants.msgType.AUDIO,
        msg_readed = ImSdkConstants.msgReaded.READED,
        msg_status = ImSdkConstants.msgStatus.SENDING,     
        msg_key = "",
        msg_file_path = tostring(data.msg_file_path) or "",
    };
    self.m_sessionid = params.msg_sessionid;
    self.m_dstCid  = params.cid;
    self.m_communityMessageListData:localInsertTextOrVideoToListMsgData(params);
    local isSuccess = ImSdkHelper.getInstance():imSdkSendAudioMsg(json.encode(params),kUserInfoData:getUserCid());
    return isSuccess;
end

CommunityDataInterface.onGetNewChatMessageCallBack = function(self, isSuccess, friend_cid, newMessage)
    self:notify(CommunityDataInterface.Delegate.onGetNewChatMessageCallBack, isSuccess, friend_cid, newMessage);
end

--@brief 发送文本或音频消息回调
CommunityDataInterface.onIMSendTextOrVideoCallBack = function(self,isSuccess,data)
    local status = ImSdkConstants.msgStatus.FAILED_SEND;
    if isSuccess then
        data = json.decode(data);
        self:notify(CommunityDataInterface.Delegate.onSendTextOrVideoCallBack,true,data);
        status = ImSdkConstants.msgStatus.SUCC_SEND;
    else
        self:notify(CommunityDataInterface.Delegate.onSendTextOrVideoCallBack,false,data);
        status = ImSdkConstants.msgStatus.FAILED_SEND;
    end
    ImSdkHelper.getInstance():imSdkUpdateMsgItemStatus(status,self.m_sessionid,self.m_dstCid,kUserInfoData:getUserCid());
end

--@brief 服务端推送账号异地登陆消息
CommunityDataInterface.onIMPushKickoutMessageCallBack = function(self,isSuccess,strData)
    if isSuccess then
        local data  = json.decode(strData);
        for k, v in pairs( table.verify(data)) do
            v.time = tonumber(v.time); --时间
            v.remote_ip = tostring(v.remote_ip); --ip
        end
        ImSdkHelper.getInstance():imSdkQuit();
    end
end

-----------------------------------认识的人相关---------------------------------

--@brief 获取认识的人
--@param isForceUpdate：是否强制拉取
CommunityDataInterface.getKnowList = function(self, isForceUpdate)
   local result, data = self.m_communityKnowListData:getKnowList(isForceUpdate);
   return result, data;
end

--@brief 获取认识的人列表回调
CommunityDataInterface.onGetKnowListCallBack = function(self, isSuccess, listData,page)
    self:notify(CommunityDataInterface.Delegate.onGetKnowListCallBack, isSuccess, Copy(listData),page );
end

------------------------------------附近的人相关------------------------------

--@brief 获取附近的人
--@param isForceUpdate:是否强制拉取
CommunityDataInterface.getNearByList = function(self, isForceUpdate,lat,lon)
    local result, data = self.m_communityNearByListData:getNearByList(isForceUpdate,lat,lon);
    return result, data
end

--@brief 获取附近的人列表回调
CommunityDataInterface.onGetNearByListCallBack = function(self, isSuccess, listData)
    self:notify(CommunityDataInterface.Delegate.onGetNearByListCallBack, isSuccess, listData);
end

--@brief 获取当前位置信息
CommunityDataInterface.getCurrentLocation = function (self)
    local location = ImSdkHelper.getInstance():imGetCurrentLocation() or "0,0"; --"39.26236,115,25236";
    local str = string.split(location,",");
    local lon = tonumber(str[1]) or 0;
    local lat = tonumber(str[2]) or 0;
    self:log("CommunityDataInterface.getCurrentLocation","lat = ",lat,"lon = ",lon);
    return lat, lon;
end

------------------------------------清楚地理位置---------------------------------
CommunityDataInterface.setCleanUpLocation = function (self,type,lat,lon)
    ImSdkHelper.getInstance():imSdkCleanUpLocation(type,lat,lon,kUserInfoData:getUserCid());
    self.m_communityNearByListData:init();
end

CommunityDataInterface.CleanUpNearByList= function (self)
    self.m_communityNearByListData:init();
end


-----------------------------------------推荐可能认识的人---------------------
CommunityDataInterface.requestMaybeFamiliar = function (self,lastCid)
    ImSdkHelper.getInstance():imSdkMaybeFamiliar(lastCid,kUserInfoData:getUserCid())
end

CommunityDataInterface.onGetMaybeFamiliarCallBack = function (self,isSuccess,data)
    if isSuccess then
        self:notify(CommunityDataInterface.Delegate.onGetMaybeFamiliarCallBack,isSuccess,data);
    else
        self:notify(CommunityDataInterface.Delegate.onGetMaybeFamiliarCallBack,false);
    end
end

--------------------------------------------消息列表广告----------------------
CommunityDataInterface.requestMessageListAd = function (self)
    OnlineSocketManager.getInstance():sendMsg(PHP_FRIENDS_AD, {});
end

CommunityDataInterface.onMessageListAdCallBack = function (self,isSuccess,info)
    Log.i("CommunityDataInterface.onMessageListAdCallBack","isSuccess = ",isSuccess,"info = ",info);
    if isSuccess then 
		self:notify(CommunityDataInterface.Delegate.onRequestMessageListAdCallBack, info);	
	end 
end

CommunityDataInterface.jumpOtherState = function (self,data)
    local jumpCodeStr = nil;
	if not table.isEmpty(data) then
		jumpCodeStr = data.jumpcode;
	end
	if string.isEmpty(jumpCodeStr) then
		jumpCodeStr = '{"cmd":1021}';
	end
	local jumpInfo = json.decode(jumpCodeStr);
	if not table.isEmpty(jumpInfo) then
		local isNeedBackToHall = CommonJumpLogic.getInstance():executeJsCall(jumpInfo);
		if isNeedBackToHall then
			GameManager.getInstance():startGame(GameType.HALL);
		end
	end
end

--------------------------房间邀请好友-------------------------------
--@请求邀请好友
CommunityDataInterface.requestInviteFriend = function (self,cidlist,data)
    ImSdkHelper.getInstance():imSdkInviteFriend(cidlist, data, os.time(),kUserInfoData:getUserCid());
end

CommunityDataInterface.requestHandleInviteFriendMessage = function(self, dst_cid, status, appendMsg)
    ImSdkHelper.getInstance():imSdkInviteFriendAnswer(kUserInfoData:getUserCid(), dst_cid, kUserInfoData:getNickname(), status, appendMsg, os.time());
end

CommunityDataInterface.onIMGetInviteFriendCallBack = function (self,isSuccess, data)
    Log.i("CommunityDataInterface.onSendInviteFriendCallBack","isSuccess = ",isSuccess,"data = ",data);
	local msg = isSuccess and "好友邀请发送成功" or "好友邀请发送失败";
    self:notify(CommunityDataInterface.Delegate.onSendInviteFriendCallBack,isSuccess,msg);
end

--@推送邀请好友消息
CommunityDataInterface.onIMPushInviteFriendCallBack = function (self,isSuccess,data)
   self:log("onInviteFriendMsgCallBack","isSuccess = ",isSuccess,"data = ", data);
    local data = json.decode(data);
    if isSuccess and not table.isEmpty(data) then
        local param = {};
        param.avatar_url = tostring(data.avatar_url);
        param.sex = tostring(data.sex);
        param.cid = tonumber(data.cid);
        param.nickname = tostring(data.nickname);
        param.time = tostring(data.time);

        local info = json.decode(data.msg) or {}; 
        if info.type == ImSdkConstants.fromInvite.PRIVATE_ROOM then
            self:privateRoomFriendInvite(param,info) ;
        elseif info.type == ImSdkConstants.fromInvite.MATCH then
            self:matchFriendInvite(param,info);
        end
    end
end

--@邀请回复回调
CommunityDataInterface.onIMPushInviteAnswerCallBack = function(self, isSuccess, data)
    self:log("onIMPushInviteAnswerCallBack","isSuccess = ",isSuccess,"data = ", data);
    self:notify(CommunityDataInterface.Delegate.onInviteAnswerCallBack,isSuccess,data);
end

--@通知被邀请人对方回复结果
CommunityDataInterface.onIMPushInviteNotifyCallBack = function(self,isSuccess,data)
    self:log("onIMPushInviteNotifyCallBack","isSuccess = ",isSuccess,"data = ", data);
    if isSuccess then
        local info = table.verify(json.decode(data))[1];
        if not table.isEmpty(info) then
            local param = {
                cid = tonumber(info.cid);
                nickname = tostring(info.nickname);
                result = tonumber(info.result);
                msg = tostring(info.msg);
                time = tostring(info.time);
            };
            self:notify(CommunityDataInterface.Delegate.onInviteNotifyCallBack,isSuccess,param);
        end
    end
end
------------------------自定义消息透传----------------------------------------------
CommunityDataInterface.requestSendProxyMessage = function (self,cidlist,mtype,data)
    self:log("requestSendProxyMessage", "cidlist = ", cidlist, " mtype = ", mtype, " data = ", data);
    cidlist = table.verify(cidlist);
    cidlist = json.encode( {cid_list = cidlist} );
    local info = json.encode(data);
    ImSdkHelper.getInstance():imSdkSendProxyMessage(cidlist,info,mtype, os.time(),kUserInfoData:getUserCid());
end

--@接收透传的自定义消息
CommunityDataInterface.onIMPushProxyMessageCallBack = function(self,isSuccess,data)
    self:log("onIMPushProxyMessageCallBack","isSuccess = ",isSuccess,"data = ", data);
    if isSuccess then 
        local info = table.verify(json.decode(data))[1];
        if not table.isEmpty(info) then 
            local mtype = tonumber(info.type);
            local data = table.verify(json.decode(info.msg));
            self:notify(CommunityDataInterface.Delegate.onGetProxyMessage,isSuccess,mtype,data);
        end 
    end 
end
---------------------------是否是好友-----------------------------
CommunityDataInterface.isFriend  = function (self,cid)
    return self.m_communityFriendListData:isFriend(cid);
end

----------------------------获取在线好友数------------------------
CommunityDataInterface.requestFriendsInviteList = function (self,num)
    self.m_communityFriendListData:requestFriendsInviteList(num);
end

CommunityDataInterface.onGetFriendsInviteList = function (self,isSuccess,data)
    self:notify(CommunityDataInterface.Delegate.onGetFriendsInviteList,isSuccess,data);
end 

--@比赛邀请
CommunityDataInterface.matchFriendInvite = function (self,param,data)
    if kGameManager:isInRoom() then
        local color = "#cFFFC1B";
        local color2 = "#cFFFFFF";
        local nickStr = string.format("%s%s%s",color,data.nick or "",color2);
        local gameNameStr = string.format("%s%s%s",color,data.match_name or "",color2);
        str = string.format("%s刚发来邀请:我刚刚报名了%s,一起来比赛吧!",nickStr,gameNameStr);
        local info = {};
        info.content = str;
        info.type = BroadcastDataInterface.getInstance():getMatchInviteRadioType();
        BroadcastDataInterface.getInstance():addRadioMsg(info);

        return;
    end
    self:log("matchFriendInvite","收到好友邀请");
    if data then 
        local info = {};
        info.mid = data.mid;
        info.cid = data.cid;
        info.time = data.sendtime;
        info.nick = data.nick or "";
        info.matchId = data.match_id;
        info.matchName = data.match_name;
        info.matchEntyfee = data.match_entyfee;
        info.matchCoin = data.match_coin;
        info.matchCcsq = data.match_ccsq;

        local moneyTxt = "";
     	if info.matchEntyfee and string.len(string.trim(info.matchEntyfee)) > 0 then 
			moneyTxt = string.concat("(报名费：", info.matchEntyfee, ")");
     	else 
			if info.matchCoin > 0 then
				moneyTxt = string.concat("(报名费：", info.matchCoin, "银币)");
			elseif info.matchCcsq > 0 then 
				moneyTxt = string.concat("(报名费：参赛券*", info.matchCcsq, ")");
			else
				moneyTxt = "(免费)";
			end
     	end
        info.message = string.concat("您的好友",info.nick,"邀请您一同参加",info.matchName, moneyTxt);
        kAppData:setCurMatchInfo(info);

        local callbackobj = {};
        callbackobj.onAgree = function()
            if kUserInfoData:getMoney() < (info.matchCoin or 0) then 
                Toast.getInstance():showText(string.concat(nick,kTextNoSufficientMoney), 50,30,kAlginCenter,"",24,255,255,255);
                return ;
            end
            
            MatchHallDataInterface.getInstance():setSignMatchId(info.matchId);
            EventDispatcher.getInstance():dispatch(HallController.s_matchListDispatch);
	        Log.d("callbackobj.onAgree");
            self:requestHandleInviteFriendMessage(info.cid, 1);
        end
        callbackobj.onRefuse = function()
            Log.d("callbackobj.onRefuse"); 
            self:requestHandleInviteFriendMessage(info.cid, 2);
        end

        local instance = MessageBox.show(nil,info.message,"同意","拒绝",true,callbackobj,callbackobj.onAgree,callbackobj,callbackobj.onRefuse);
        IPopDialogManager.getInstance():addPopDialog(instance, 100, MessageBox.hide);
	end
end

--@房间邀请
CommunityDataInterface.privateRoomFriendInvite = function (self,param,data)
    if kGameManager:isInRoom() then
        -- 好友正在玩牌
        self:requestHandleInviteFriendMessage(param.cid, 2, ImSdkConstants.eInviteFriendErrorType.GAME_PLAYING);

        local color = "#cFFFC1B";
        local color2 = "#cFFFFFF";
        local nickStr = string.format("%s%s%s",color,data.nick or "",color2);
        local gameNameStr = string.format("%s%s%s%s",color,data.gameName or "","私人房",color2);
        local tableIdStr = string.format("%s%s%s",color,data.tableId or "",color2);
        str = string.format("%s刚发来邀请:我刚刚开了%s,房间号%s,一起来玩吧!",nickStr,gameNameStr,tableIdStr);
        local info = {};
        info.content = str;
        info.type = BroadcastDataInterface.getInstance():getPrivateInviteRadioType();

        BroadcastDataInterface.getInstance():addRadioMsg(info);
        return;
    end
   
	self:log("roomFriendInvite","收到好友邀请");
	if data then 
	    local callbackobj = {};
	    callbackobj.onAgree = function()
            Log.d("roomFriendInvite callbackobj.onAgree"); 
            self:requestHandleInviteFriendMessage(param.cid, 1);
            return true;
	    end
	    callbackobj.onRefuse = function()
	        Log.d("roomFriendInvite callbackobj.onRefuse"); 
	        self:requestHandleInviteFriendMessage(param.cid, 2);	            	
            return true;
	    end
	    InviteMessageView.showDialog(data, callbackobj, callbackobj.onAgree, callbackobj, callbackobj.onRefuse);
    end 
end

CommunityDataInterface.getFriendListOffline = function(self)
    return self.m_communityFriendListData:getFriendListOffline(cidlist);
end

------------------------短信邀请好友------------------
CommunityDataInterface.requestSmsInviteFriend = function (self,phone)
    local data = {};
    data.app = kClientInfo:getAppId();
    data.ssid  = kUserInfoData:getSsid();
    data.action = "friends.sendInviteMsg";
    data.type = 1;
    data.phone = tostring(phone);
    
    self:log("requestSmsInviteFriend","data = ",data);
    OnlineSocketManager.getInstance():sendMsg(PHP_SMS_INVITE_FRIEND,data);
end

CommunityDataInterface.onGetSmsInviteFriendCallBack = function (self,isSuccess)
    self:log("onGetSmsInviteFriendCallBack","isSuccess = ",isSuccess);
    if isSuccess then
        self:notify(CommunityDataInterface.Delegate.onGetSmsInviteFriendCallBack,isSuccess);
    end
end

---设置附近的人 按钮状态
CommunityDataInterface.setNearByAddFriendBtnStatus = function (self,data)
    self.m_communityNearByListData:setNearByAddFriendBtnStatus(data);
end

CommunityDataInterface.refreshNearByAddFriendBtnStatus = function (self,cid)
    self.m_communityNearByListData:refreshNearByAddFriendBtnStatus(cid);
end

--设置认识的人 邀请状态
CommunityDataInterface.setKnowInviteBtnStatus = function (self,data)
    self.m_communityKnowListData:setKnowInviteBtnStatus(data);
end

--设置认识的人 加好友状态
CommunityDataInterface.setKnowAddFriendBtnStatus = function (self,data)
    self.m_communityKnowListData:setKnowAddFriendBtnStatus(data);
end

CommunityDataInterface.refreshKnowAddFriendBtnStatus = function (self,cid)
    self.m_communityKnowListData:refreshKnowAddFriendBtnStatus(cid);
end

----------------------------other--------------------------


CommunityDataInterface.setRankLayerListItemMove = function (self,isMove)
    self.m_setRankLayerListItemMove = isMove;
end

CommunityDataInterface.isRankLayerListItemMove = function (self)
    return self.m_setRankLayerListItemMove;
end


CommunityDataInterface.setKonwToSeeIsShow = function (self,isShow)
    self.m_setKonwToSeeIsShow = isShow;
end

CommunityDataInterface.getKonwToSeeIsShow = function (self)
    return self.m_setKonwToSeeIsShow;
end

CommunityDataInterface.setFriendRankLayout = function (self,layout)
    self.m_layout = layout;
end

CommunityDataInterface.getFriendRankLayout = function (self)
    return self.m_layout;
end

CommunityDataInterface.log = function(self, ...)
    Log.v("CommunityDataInterface", ...);
end

--------------------------------------通讯录------------------------------------
CommunityDataInterface.getContactList = function(self)
    if self.m_contactData then
        self:notify(CommunityDataInterface.Delegate.onGetContactListCallBack, self.m_contactData);
    else
        NativeEvent.getInstance():getContacts();
    end
end

CommunityDataInterface.onGetContactListCallBack = function(self, isSuccess, info, result)
    if isSuccess then
        Log.d("CommunityDataInterface.onGetContactListCallBack", "info", info)
        self.m_contactData = self:_analysisDataContact(info);
        Log.d("CommunityDataInterface.onGetContactListCallBack", self.m_contactData);
        self:notify(CommunityDataInterface.Delegate.onGetContactListCallBack, self.m_contactData);
    end
end

CommunityDataInterface.inviteContactFriends = function(self, info, text)
    Log.d("CommunityDataInterface.inviteContactFriends", info, text);
    local content = string.format("#boyaa#%s", text);

    local data = {
        msg = content;
        phone = json.encode(info);
    };
    Log.d("CommunityDataInterface.inviteContactFriends", "data", data);
    OnlineSocketManager.getInstance():sendMsg(PHP_SMS_INVITE_FRIEND_LIST, data);
end

CommunityDataInterface.onInviteContactFriendsCallback = function(self, isSuccess, info)
    Log.d("CommunityDataInterface.onInviteContactFriendsCallback", isSuccess);
    self:notify(CommunityDataInterface.Delegate.onInviteContactFriendsCallback, isSuccess, info);
end

CommunityDataInterface._analysisDataContact = function(self, data)
    local tmp = {};
    Log.d("CommunityDataInterface._analysisDataContact", data);
    local contactList = table.verify(data.contract_list).__value;
    contactList = table.verify(json.decode(contactList));
    for k, v in ipairs(contactList) do
        local item = {
            name = tostring(v.name or "") or "",
            phoneNumber = tostring(v.phone_number or "") or "",
        };
        item.phoneNumber = item.phoneNumber:removeAll(" ");
        table.insert(tmp, item);
    end
    return tmp;
end

-------------------------通过从个人信息界面扫二维码直接进社交场景-------------------------
CommunityDataInterface.scanQRCodeToCommunity = function (self, cid)
    if not cid then
        Toast.getInstance():showText("无效ＩＤ", 50,30,kAlginCenter,"",24,255,255,255);
        return ;
    end
    StateMachine.getInstance():pushState(States.Community);
    IBaseDialog.remove("CommunityAddFriendLayer");
 	IBaseDialog.pushDialog(new(require("hall/community/widget/friend/friendList/communityAddFriendLayer"), cid));
end 


CommunityDataInterface.onNativeEvent = function(self, param, ...)
    if self.s_nativeEventFuncMap[param] then
      self.s_nativeEventFuncMap[param](self, ...);
    end
end


CommunityDataInterface.s_socketCmdFuncMap = {
    [PHP_FRIENDS_AD]      = CommunityDataInterface.onMessageListAdCallBack;
    [PHP_GET_USERINFO]    = CommunityDataInterface.onCustomGetUserInfoCallBack;
    [PHP_SMS_INVITE_FRIEND]   = CommunityDataInterface.onGetSmsInviteFriendCallBack;
    [PHP_SMS_INVITE_FRIEND_LIST] = CommunityDataInterface.onInviteContactFriendsCallback;
};

CommunityDataInterface.s_nativeEventFuncMap = {
    ["getContacts"] = CommunityDataInterface.onGetContactListCallBack;
};