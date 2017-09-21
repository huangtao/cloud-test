--[[
    社交sdk帮助类
    wiki url : http://365.oa.com/wiki/index.php?title=%E7%A4%BE%E4%BA%A4%E6%A8%A1%E5%9D%97_%E6%8E%A5%E5%8F%A3%E6%96%87%E6%A1%A3
]]


require("gameData/dataInterfaceBase")
require("hall/community/imSdk/imSdkConstants");

ImSdkHelper = class(DataInterfaceBase);

ImSdkHelper.Delegate = {
    onGetPlayAudioFinishCallBack = "onGetPlayAudioFinishCallBack";
    onGetRecordAudioFinishCallBack = "onGetRecordAudioFinishCallBack";
    onOpenGpsFinishCallBack = "onOpenGpsFinishCallBack";
}

ImSdkHelper.s_event_IMSDK_callback = EventDispatcher.getInstance():getUserEvent();

ImSdkHelper.getInstance = function()
	if not ImSdkHelper.s_instance then
		ImSdkHelper.s_instance = new(ImSdkHelper);
	end
	return ImSdkHelper.s_instance;
end

ImSdkHelper.releaseInstance = function() 
	delete(ImSdkHelper.s_instance);
	ImSdkHelper.s_instance = nil;
end

ImSdkHelper.ctor = function(self)
    EventDispatcher.getInstance():register(ImSdkHelper.s_event_IMSDK_callback, self, self.onGetImSdkCallBack);
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

ImSdkHelper.dtor = function(self)
	self:imSdkQuit();

    EventDispatcher.getInstance():unregister(ImSdkHelper.s_event_IMSDK_callback, self, self.onGetImSdkCallBack);
    EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

--@brief 初始化IMSDK
--@param ip 远端server ip   
--@param port 远端server port
--@param dbPath 本地数据库路径
--@param audioPath 录音数据库路径
ImSdkHelper.imSdkInit = function(self, ip, port, dbPath, audioPath)
    self:log("imSdkInit", "ip = ", ip, "port = ", port, "dbPath = ", dbPath, "audioPath = ", audioPath);
    local result;
    ip = string.valueOf(ip);
    port = number.valueOf(port);
    dbPath = string.valueOf(dbPath);
    audioPath = string.valueOf(audioPath); 

    result = self:callImFunc(im_init, ip, port, dbPath, audioPath);
    self:log("imSdkInit", "result = ", result);
    return result
end


--@brief 退出IMSDK
ImSdkHelper.imSdkQuit = function(self)
    local result = self:callImFunc(im_destory);
    self:log("imSdkQuit","result = ",result);
    return result;
end


--@brief 暂停或恢复心跳
--@param status 0:暂停 1:恢复
ImSdkHelper.imPauseOrResume = function(self, status)
    local result = self:callImFunc(im_resume, status);
    self:log("imPauseOrResume","result = ", result);
    return result;
end

--@brief 登入IMSDK
--@param cid mine cid
--@param sig singature that get from php
--@param hallVersion 大厅版本号
--@param dlog 纬度
--@param dlat 经度
ImSdkHelper.imSdkLogin = function(self, cid, sig, hallVersion, dlog, dlat)
    self:log("imSdkLogin", "cid = ", cid, "sig = ", sig, "hallVersion = ", hallVersion,"dlog = ",dlog,"dlat = ",dlat);
    cid = number.valueOf(cid);
    sig = string.valueOf(sig);
    hallVersion = number.valueOf(hallVersion);
    dlog = number.valueOf(dlog);
    dlat = number.valueOf(dlat);
    local result = self:callImFunc(im_login, cid,sig,hallVersion,dlog,dlat);
    self:log("imSdkLogin","result = ", result);
    return result;
end

-------------------------------------好友列表相关--------------------------------

--@brief 获取好友列表 -> 后端
--@param cid mine cid
ImSdkHelper.imSdkGetFriendList = function(self, cid)
    self:log("imSdkGetFriendList", "cid = ", cid);
    cid = number.valueOf(cid);
    local strFriendList = self:callImFunc(im_get_friend_list, cid);
    self:log("imSdkGetFriendList","strFriendList = ", strFriendList);
    return strFriendList;
end

--@brief  加好友 -> 后端
--@param  dst_cid 对方cid
--@param  msg 附加消息
--@param  time 当前时间
--@param  cid mine cid
ImSdkHelper.imSdkAddFriend = function(self, dst_cid, msg, time, cid, otherPlayerCidList)
    self:log("imSdkAddFriend","dst_cid =",dst_cid, "cid=",cid,"otherPlayerCidList = ",otherPlayerCidList);
    dst_cid = number.valueOf(dst_cid); 
    msg = string.valueOf(msg);
    time = number.valueOf(time);
    cid = number.valueOf(cid);
    otherPlayerCidList = string.valueOf(otherPlayerCidList);
    local result = self:callImFunc(im_add_friend, dst_cid,otherPlayerCidList,msg,time,cid);
    self:log("imSdkAddFriend","result = ", result);
    return  result;
end

--@brief 删好友 -> 后端
--param dst_cid 对方cid
--param cid mine cid
ImSdkHelper.imSdkDeleteFriend = function(self, dst_cid, cid)
    self:log("imSdkDeleteFriend", "dst_cid = ", dst_cid,"cid = ",cid); 
    dst_cid = number.valueOf(dst_cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_del_friend, dst_cid,cid);
    self:log("imSdkDeleteFriend","result = ",result);
    return result;
end

--@brief 处理被加好友请求 -> 后端
--@param dst_cid 对方cid
--@param status 返回好友消息处理 1添加 2拒绝
--@param appendMsg 附加消息
--@param time 当前时间
--@param cid mine cid
ImSdkHelper.imSdkHandleFriend = function(self,dst_cid,nickname,status,appendMsg,time,cid)
    self:log("imSdkHandleFriend", "dst_cid = ", dst_cid,"status = ",status,"appendMsg = ",appendMsg,"time = ",time,"cid = ",cid);
    dst_cid = number.valueOf(dst_cid);
    status = number.valueOf(status);
    appendMsg = string.valueOf(appendMsg);
    time = number.valueOf(time);
    cid = number.valueOf(cid);
    nickname = string.valueOf(nickname);
    local result  = self:callImFunc(im_answer_beadded_friend, dst_cid,nickname,status,appendMsg,time,cid);
    self:log("imSdkHandleFriend","result",result);
    return result;
end

--@brief  获取指定人信息信息 -> 后端
--@param dst_cid 对方cid
--@param cid mine cid
ImSdkHelper.imSdkFriendInfo = function(self, dst_cid,cid)
    self:log("imSdkFriendInfo", "dst_cid = ", dst_cid, "cid = ",cid);
    dst_cid = number.valueOf(dst_cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_get_userinfo, dst_cid,cid);
    self:log("imSdkFriendInfo","result = ",result);
    return result;
end

--@brief 获取好友本地数据 -> DB
--@param cid mine cid
ImSdkHelper.imGetLocalFriendList = function(self, cid)
    self:log("imGetLocalFriendList", "cid = ", cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_get_local_friend_list, cid);
    self:log("imGetLocalFriendList","result = ",result);
    return result;
end

--@brief 删除好友本地数据 -> DB
--@note 此接口会删除好友相关的所有数据  好友列表、消息列表、会话列表
--param dst_cid 对方cid
--param cid mine cid
ImSdkHelper.imDeleteLocalFriendInfo = function(self, dst_cid, cid)
    self:log("imDeleteLocalFriendInfo", "dst_cid = ", dst_cid, "cid = ", cid);
    dst_cid = number.valueOf(dst_cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_del_local_friend_info, dst_cid, cid);
    self:log("imDeleteLocalFriendInfo","result = ",result);
    return result;
end

--@brief 增加本地好友数据 -> DB
--@param strFriendInfo 好友信息
--@param cid mine cid
ImSdkHelper.imAddLocalFriendInfo = function(self,strFriendInfo,cid)
    self:log("imAddLocalFriendInfo", "strFriendInfo = ", strFriendInfo);
    strFriendInfo = string.valueOf(strFriendInfo); 
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_add_local_friend_info, strFriendInfo,cid);
    self:log("imAddLocalFriendInfo","result = ",result);
    return result;
end

--brief邀请好友 支持批量邀请 
--@param cidList 邀请对象cid 
--@param data 组装需要的数据 不同的房间可带上不同参数
--@param time 当前时间
--@param cid mine cid 
ImSdkHelper.imSdkInviteFriend = function (self,cidList,data,time,cid)
    local result;
    self:log("ImSdkHelper.imSdkInviteFriend","cidList = ",cidList, "data = ",data, "time = ",time, "cid = ", cid);
    cidList = string.valueOf(cidList);
    data = string.valueOf(data);
    time = number.valueOf(time);
    cid = number.valueOf(cid);
    result = self:callImFunc(im_invite_friend_join_game, cidList,data,time,cid);
    self:log("ImSdkHelper.imSdkInviteFriend","result = ",result);
    return result;
end

ImSdkHelper.imSdkInviteFriendAnswer = function(self, cid, dst_cid, nickname, status, msg, time)
    local result;
    self:log("imSdkInviteFriendAnswer", "dst_cid = ", dst_cid,"cid = ",cid,"status = ",status,"appendMsg = ",appendMsg,"time = ",time);
    dst_cid = number.valueOf(dst_cid);
    status = number.valueOf(status);
    msg = string.valueOf(msg);
    time = number.valueOf(time);
    cid = number.valueOf(cid);
    nickname = string.valueOf(nickname);
    result = self:callImFunc(im_answer_invited, cid, dst_cid, nickname, status, msg, time);
    self:log("imSdkInviteFriendAnswer","result",result);
    return result;
end
--------------------------自定义消息透传-------------------------------------------------------
--@param cidList 消息透传对象cid 
--@param data 需要透传的消息
--@mtype 透传的消息类型
--@param time 当前时间
--@param cid 自己cid 
ImSdkHelper.imSdkSendProxyMessage = function(self,cidList,data,mtype,time,cid)
    local result;
    self:log("ImSdkHelper.imSdkSendProxyMessage","cidList = ",cidList, "data = ",data,"mtype = ",mtype, "time = ",time, "cid = ", cid);
    cidList = string.valueOf(cidList);
    data = string.valueOf(data);
    mtype = number.valueOf(mtype);
    time = number.valueOf(time);
    cid = number.valueOf(cid);
    result = self:callImFunc(im_send_proxy_message, cidList,data,mtype,time,cid);
    self:log("ImSdkHelper.imSdkSendProxyMessage","result = ",result);
    return result;
end
----------------------------------------------会话列表(点击消息tab显示的列表)------------------

--@brief 获得会话列表 -> DB
--@brief cid mine cid 
--@brief msgListMaxNum 消息列表最大数
ImSdkHelper.imSdkGetChatMsgList = function(self, cid, msgListMaxNum)
    self:log("imSdkGetChatMsgList","cid =",cid, "msgListMaxNum = ",msgListMaxNum);
    cid = number.valueOf(cid);
    msgListMaxNum = number.valueOf(msgListMaxNum);
    local strChatMessageList = self:callImFunc(im_get_msg_chat_list, cid,msgListMaxNum);
    self:log("strChatMessageList = ", strChatMessageList);
    return strChatMessageList;
end

--@brief 插入内容到会话列表中 -> DB
--@param content 插入内容
--@param cid mine cid 
ImSdkHelper.imSdkInsertChatMsgList = function(self, content, cid)
    self:log("imSdkInsertChatMsgList", "content = ", content, "fcid = ", cid);
    content = string.valueOf(content);
    cid  = number.valueOf(cid);
    local result = self:callImFunc(im_insert_msg_chat_record, content,cid);
    self:log("imSdkInsertChatMsgList","result =",result);
    return result
end

--@brief 更新会话未读数目 -> DB
--@param dst_cid 对方cid
--@param num 未读消息数据
--@param cid mine cid
ImSdkHelper.imSdkUpdataChatMsgUnread = function(self, dst_cid,num,cid)
    self:log("imSdkUpdataChatMsgUnread", "dst_cid = ", dst_cid, "cid = ", cid, "num = ", num);
    dst_cid = number.valueOf(dst_cid);
    num = number.valueOf(num);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_update_msg_chat_unread, dst_cid,num,cid);
    self:log("imSdkUpdataChatMsgUnread", "result = ", result);
    return result;
end

--@brief 更新会话未读数目 -> DB
--@param dst_cid 对方cid
--@param cid mine cid 
ImSdkHelper.imSdkGetSomeoneUnreadMsg = function(self, dst_cid,cid)
    self:log("imSdkUpdataChatMsgUnread", "dst_cid = ", dst_cid, "cid = ", cid);
    dst_cid = number.valueOf(dst_cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_get_unreadmsg_someone, dst_cid,cid);
    self:log("imSdkUpdataChatMsgUnread", "result = ", result);
    return result;
end

--@brief 删除和指定人的整个会话
--@param dst_cid 对方cid
--@param cid mine cid
ImSdkHelper.imSdkDeleteChatMsg = function(self, dst_cid, cid)
    self:log("imSdkDeleteChatMsg", "dst_cid = ", dst_cid, "cid = ", cid);
    dst_cid = number.valueOf(dst_cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_del_msg_chat_record, dst_cid,cid);
    self:log("imSdkDeleteChatMsg", "result = ", result);
    return result;
end

--@brief 删除和指定人的加好友消息
--@param dst_cid 对方cid
--@param cid mine cid
ImSdkHelper.imSdkDeleteAddFriendMsg = function (self,dst_cid, cid)
    self:log("imSdkDeleteAddFriendMsg", "dst_cid = ", dst_cid, "cid = ", cid);
    dst_cid = number.valueOf(dst_cid);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_del_friend_add_info, dst_cid, cid);
    self:log("imSdkDeleteAddFriendMsg","result = ",result);
    return result;
end

------------------------------------消息列表相关 (和某个人具体的聊天信息)------------------------------------

--@brief 发送会话消息 -> 后端
--@note 包含语音以及音频
--@param content 内容
--@param cid mine cid 
ImSdkHelper.imSdkSendMsg = function(self, content,cid)
    self:log("imSdkSendMsg", "content = ", content,"cid = ", cid);
    content = string.valueOf(content);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_send_text, content,cid);
    self:log("imSdkSendMsg", "result = ", result);
    return result;
end

--@brief 发送语音消息 -> 后端
--@note 语音
--@param content 内容
--@param cid mine cid 
ImSdkHelper.imSdkSendAudioMsg = function(self, content,cid)
    self:log("imSdkSendAudioMsg", "content = ", content,"cid = ", cid);
    content = string.valueOf(content);
    cid  = number.valueOf(cid);
    local result = self:callImFunc(im_send_audio_message, content,cid);
    self:log("imSdkSendAudioMsg", "result = ", result);
    return (result == ImSdkConstants.eReturnType.TYPE_OK) and true or false;
end

--@brief 获取音频文件 -> DB
--@param key 发送消息时的msg_key
--@param cid mine cid 
ImSdkHelper.imSdkGetAudioData = function(self, key,cid)
    self:log("imSdkGetAudioData", "key = ", key,"cid = ", cid);
    key = string.valueOf(key);
    cid  = number.valueOf(cid);
    local result = self:callImFunc(im_get_audio_data, key,cid);
    self:log("imSdkGetAudioData", "result = ", result);
    return result;
end

--@brief 刷新音频文件 -> DB
--@param dst_cid 对方cid
--@param filePath 文件路径
--@param key 消息key
--@param cid mine cid
ImSdkHelper.imSdkUpdateAudioPath = function(self, dst_cid, filePath, key, cid)
    self:log("imSdkUpdateAudioPath", "dst_cid = ", dst_cid,"filePath = ", filePath,"key = ",key,"cid =", cid);
    dst_cid = number.valueOf(dst_cid);
    filePath = string.valueOf(filePath);
    key = string.valueOf(key);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_update_audio_path, dst_cid,filePath,key,cid);    
    self:log("imSdkUpdateAudioPath","result = ",result);
end

--@brief 获得消息列表 -> DB
--@param dst_cid 对方cid
--@param cid mine cid 
--@param friendChatListMaxNum 好友之间最大数
ImSdkHelper.imSdkGetMsgList = function(self, dst_cid, cid, friendChatListMaxNum)
    self:log("imSdkGetMsgList", "dst_cid = ", dst_cid, "cid = ", cid, "friendChatListMaxNum = ",friendChatListMaxNum);
    dst_cid = number.valueOf(dst_cid);
    cid  = number.valueOf(cid);
    friendChatListMaxNum = number.valueOf(friendChatListMaxNum);
    local strMsgList = self:callImFunc(im_get_msg_list, dst_cid, cid, friendChatListMaxNum);
    self:log("imSdkGetMsgList","strMsgList = ", strMsgList);
    return strMsgList;
end

--@brief 插入一条记录到消息列表中 -> DB
--@param messageItemInfo 消息内容
--@param cid mine cid
ImSdkHelper.imSdkInsertMsgItem = function(self, messageItemInfo,cid)
    self:log("imSdkInsertMsgItem", "messageItemInfo = ", messageItemInfo,"cid =",cid);
    messageItemInfo = string.valueOf(messageItemInfo);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_insert_msg_record, messageItemInfo,cid);
    self:log("imSdkInsertMsgItem", "result = ", result);
    return result;
end

--@brief 删除指定的消息 -> DB
--@param dst_cid 对方cid
--@param sessionid 唯一标识id
--@param cid mine cid
ImSdkHelper.imSdkDeleteMsgItem = function(self, dst_cid,sessionid,cid)
    self:log("imSdkDeleteMsgItem", "dst_cid = ", dst_cid, "cid = ", cid, "sessionid = ", sessionid);
    dst_cid = number.valueOf(dst_cid);
    sessionid = string.valueOf(sessionid);
    cid = number.valueOf(cid);
    result = self:callImFunc(im_del_msg_record, dst_cid,sessionid,cid);
    self:log("imSdkDeleteMsgItem", "result = ",result);
    return result;
end

--@brief 更新消息发送状态 -> DB
--@param status : 消息状态
--@param sessionid : 消息唯一标识
--@param dst_cid 对方cid
--@param cid mine cid
ImSdkHelper.imSdkUpdateMsgItemStatus = function(self, status, sessionid, dst_cid, cid)
    self:log("imSdkUpdateMsgItemStatus", "status = ", status, "sessionid = ", sessionid, "dst_cid = ", fcid, "cid =", cid);
    status = number.valueOf(status);
    sessionid = string.valueOf(sessionid);
    dst_cid = number.valueOf(dst_cid);
    cid  = number.valueOf(cid);
    local result = self:callImFunc(im_update_msg_status, status, sessionid, dst_cid, cid);
    self:log("imSdkUpdateMsgItemStatus","result = ",result);
    return result;
end


--------------------------------------附近的人--------------
--@brief 附近的人
--@param lat 经度
--@param lon 纬度
--@param cid mine cid
ImSdkHelper.imSdkGetNearByList = function (self,lat,lon,cid)
     self:log("imSdkGetNearByList","cid =", cid,"lat = ",lat,"lon = ",lon);
     lat = number.valueOf(lat);
     lon = number.valueOf(lon);
     cid = number.valueOf(cid);
     local result = self:callImFunc(im_search_user_nearby, lat,lon,cid);
     self:log("imSdkGetNearByList","result =", result);
     return result;
end

--@brief 清楚地理位置
--@param operate_type 0 设置位置信息 1 清楚地理位置
--@param lat 经度
--@param lon 纬度
--@param cid mine cid 
ImSdkHelper.imSdkCleanUpLocation = function(self,operate_type,lat,lon,cid)
    self:log("imSdkCleanUpLocation","operate_type =", operate_type,"lat = ",lat, "lon = ",lon,"cid =",cid);  
    operate_type = number.valueOf(operate_type);
    lat = number.valueOf(lat);
    lon = number.valueOf(lon);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_set_user_location, operate_type,lat,lon,cid);
    self:log("imSdkCleanUpLocation","result = ", result);
    return result;
end

--------------------------------------认识的人--------------
--@brief 认识的人
--@param conent 从原生获取到的联系人
--@param cid mine cid
ImSdkHelper.imSdkGetKnowList = function (self,content,cid)
    self:log("imSdkGetKnowList","content = ",content,"cid =", cid);
    content = string.valueOf(content);
    cid = number.valueOf(cid);
    local result = self:callImFunc(im_match_contracts, content,cid);
    self:log("imSdkGetKnowList","result = ",result);
    return result;
end

--@brief 推荐可能认识的人
--@param lastCid 上次推荐过的cid
--@param cid mine cid
ImSdkHelper.imSdkMaybeFamiliar = function (self,lastCid,cid)
    self:log("imSdkMaybeFamiliar","lastCid = ",lastCid,"cid =", cid);
    lastCid = number.valueOf(lastCid);
    cid  = number.valueOf(cid);
    local result = self:callImFunc(im_get_maybe_familiar_user, lastCid,cid);
    self:log("imSdkMaybeFamiliar", "result = ", result);
    return result;
end

--------------------------------------原生系统相关接口------------------------------
--获取当前地理位置
ImSdkHelper.imGetCurrentLocation = function (self)
    self:log("ImSdkHelper.imGetCurrentLocation");
    local result = NativeEvent.getInstance():imGetCurrentLocation();
    self:log("ImSdkHelper.imGetCurrentLocation","result = ",result);
    return result;   
end

--获取手机联系人
ImSdkHelper.imGetContractsInfo = function (self)
    local data = NativeEvent.getInstance():imGetContractsInfo();
    self:log("ImSdkHelper.imGetContractsInfo","data = ",data);
    return data or "";   
end

--停止播放录音
ImSdkHelper.imStopAudioRecord = function (self)
    NativeEvent.getInstance():imStopAudioRecord();
end

--开始播放录音
ImSdkHelper.imStartAudioRecord = function (self)
    NativeEvent.getInstance():imStartAudioRecord();
end

--@brief开始播放音频
--@param audioPath 音频路径  
ImSdkHelper.imStartAudioPlay = function (self,audioPath)
    self:log("ImSdkHelper.imStartAudioPlay","audioPath = ",audioPath);
    dict_set_string(ImSdkConstants.dict.DICT_NAME, ImSdkConstants.dict.KEY_SESSIONID,audioPath);
    NativeEvent.getInstance():imStartAudioPlay();
end

--停止播放音频
ImSdkHelper.imStopAudioPlay = function (self)
    NativeEvent.getInstance():imStopAudioPlay();
end

--开启gps
ImSdkHelper.imOpenGps = function (self)
    NativeEvent.getInstance():imGetGotoGps();
end

--Java回调
ImSdkHelper.onGetImSdkJavaResultCallBack = function(self, status, jsonTable)
    self:log("onGetImSdkJavaResultCallBack","status = ",status,"jsonTable = ",jsonTable);
    if status and not table.isEmpty(jsonTable) then
        local cmd = GetNumFromJsonTable(jsonTable, "cmd", -1);
        if cmd == ImSdkConstants.eCmds.IMSDK_CMD_PLAY_AUDIO_FINISH then

            self:notify(ImSdkHelper.Delegate.onGetPlayAudioFinishCallBack);

        elseif cmd == ImSdkConstants.eCmds.IMSDK_CMD_RECORD_AUDIO_FINISH then
            
            local recordPath = GetStrFromJsonTable(jsonTable, "recordPath", "");
            local fileTime = GetNumFromJsonTable(jsonTable, "fileTime", 0);
            local fileSize = GetNumFromJsonTable(jsonTable, "fileSize", 0);
            self:notify(ImSdkHelper.Delegate.onGetRecordAudioFinishCallBack, recordPath, fileTime, fileSize);
        end
    end
end

ImSdkHelper.onOpenGpsResultCallBack = function (self, status, jsonTable)
    self:log("onOpenGpsResultCallBack","jsonTable = ",jsonTable);
    if status and not table.isEmpty(jsonTable) then
        local result = GetNumFromJsonTable(jsonTable, "getResult", 0);
        local isSuccess = result == 1 and true or false;
        local lon = GetStrFromJsonTable(jsonTable, "jingdu", "0");
        local lat = GetStrFromJsonTable(jsonTable, "weidu", "0");
        self:notify(ImSdkHelper.Delegate.onOpenGpsFinishCallBack,isSuccess,tonumber(lon),tonumber(lat));
    end
end

--imsdk so 回调
ImSdkHelper.onGetImSdkCallBack = function(self, protoId, jsonData)
    self:log("onGetImSdkCallBack", "protoId = ", protoId);
    if protoId and ImSdkHelper.s_imSdkProtoIdFuncMap[protoId] then

        local t = json.decode(jsonData) or {};
        self:log("onGetImSdkCallBack", "data = ", t);
        local isSuccess = (t.result == 1) and true or false;
        local config = ImSdkHelper.s_imSdkProtoIdFuncMap[protoId];
        local delegate = config[1];
        self:log("onGetImSdkCallBack", "delegate is --> ", delegate);
        self:notify(delegate, isSuccess, t.description);
    else
        self:log("onGetImSdkCallBack", "error protoId that not handled protoId = ", protoId);
    end
end

ImSdkHelper.onNativeEvent = function(self,param,...)
    if self.s_nativeEventFuncMap[param] then
        self.s_nativeEventFuncMap[param](self,...);
    end
end

ImSdkHelper.log = function(self, ...)
    Log.v("ImSdkHelper", ...);
end

ImSdkHelper.callImFunc = function(self, func, ...)
    if func then
        return func(...);
    end
    return -1;
end

ImSdkHelper.s_nativeEventFuncMap = {
    [ImSdkConstants.kImSdkJavaResultCallBack] = ImSdkHelper.onGetImSdkJavaResultCallBack;
    [ImSdkConstants.kImSdkIosResultCallBack] = ImSdkHelper.onOpenGpsResultCallBack;
}

ImSdkHelper.s_imSdkProtoIdFuncMap = {
    [ImSdkConstants.eProtoId.INIT]                      = { "onIMInitCallBack" };
    [ImSdkConstants.eProtoId.LOGIN]                     = { "onIMLoginCallBack" };
    [ImSdkConstants.eProtoId.GET_FRIEND_LIST]           = { "onIMGetFriendListCallBack" };
    [ImSdkConstants.eProtoId.SEND_TEXT_OR_VIDEO]        = { "onIMSendTextOrVideoCallBack" };
    [ImSdkConstants.eProtoId.ADD_FRIEND]                = { "onIMAddFriendCallBack" };
    [ImSdkConstants.eProtoId.DELETE_FRIEND]             = { "onIMDeleteFriendCallBack" };
    [ImSdkConstants.eProtoId.HANDLE_ADD_FRIEND]         = { "onIMHandleAddFriendCallBack" };
    [ImSdkConstants.eProtoId.GET_VIDEO_INFO]            = { "onIMGetVideoInfoCallBack" };
    [ImSdkConstants.eProtoId.MATCH_CONTACT_FRIEND]      = { "onIMMatchContactFriendCallBack" };
    [ImSdkConstants.eProtoId.GET_FRIEND_INFO]           = { "onIMGetFriendInfoCallBack" };
    [ImSdkConstants.eProtoId.GET_NEARBY_LIST]           = { "onIMGetNearByListCallBack" };
    [ImSdkConstants.eProtoId.PUSH_FRIEND_LIST]          = { "onIMPushFriendListCallBack" };
    [ImSdkConstants.eProtoId.PUSH_ONLINE_OFFLINE]       = { "onIMPushFriendOnlineStatusCallBack" };
    [ImSdkConstants.eProtoId.PUSH_TEXT_MESSAGE]         = { "onIMPushTextMessageCallBack" };
    [ImSdkConstants.eProtoId.PUSH_VIDEO_MESSAGE]        = { "onIMPushVideoMessageCallBack" };
    [ImSdkConstants.eProtoId.PUSH_ADD_FRIEND_MSG]       = { "onIMPushAddFriendMessageCallBack" };
    [ImSdkConstants.eProtoId.PUSH_DEL_FRIEND_MSG]       = { "onIMPushDelFriendMessageCallBack" };
    [ImSdkConstants.eProtoId.PUSH_ADD_FRIEND_RESULT]    = { "onIMPushAddFriendResultCallBack" };
    [ImSdkConstants.eProtoId.PUSH_KICKOUT_MSG]          = { "onIMPushKickoutMessageCallBack" };
    [ImSdkConstants.eProtoId.PUSH_OFFLINE_MSG_OR_VIDEO] = { "onIMPushOfflineMsgOrVideoCallBack" };
    [ImSdkConstants.eProtoId.PUSH_OFFLINE_ADD_FRIEND]   = { "onIMPushOfflineAddFriendMessageCallBack" };
    [ImSdkConstants.eProtoId.PUSH_NEW_FRIEND_INFO]      = { "onIMPushNewFriendInfoCallBack" };
    [ImSdkConstants.eProtoId.GET_MAYBE_FAMILIAR]        = { "onIMGetMaybeFamiliarCallBack" };
    [ImSdkConstants.eProtoId.INVITEFRIEND]              = { "onIMGetInviteFriendCallBack" };
    [ImSdkConstants.eProtoId.PUSH_INVITEFRIEND]         = { "onIMPushInviteFriendCallBack" };
    [ImSdkConstants.eProtoId.PUSH_INVITED_ANSWER] = { "onIMPushInviteAnswerCallBack" };
    [ImSdkConstants.eProtoId.PUSH_INVITED_RESULT] = { "onIMPushInviteNotifyCallBack" };
    [ImSdkConstants.eProtoId.SEND_PROXY_MESSAGE] = {"onIMPushProxyMessageCallBack"};
}


--@brief im sdk call lua
--@param protoId 协议id reference ImSdkConstants.eProtoID
--@param jsonData it's json
function IMgetResult(protoId, jsonData)
    Log.v("IMgetResult", "protoId = ", protoId);
    EventDispatcher.getInstance():dispatch(ImSdkHelper.s_event_IMSDK_callback, protoId, jsonData);
end 




