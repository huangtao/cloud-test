require("gameData/gameData")

local CommunityMessageListData = class(GameData);

CommunityMessageListData.Delegate = {
    onGetMessageListCallBack            = "onGetMessageListCallBack";
    onGetChatMessageListCallBack        = "onGetChatMessageListCallBack";
    onGetNewChatMessageCallBack         = "onGetNewChatMessageCallBack";
    onRefreshUnReadMessageNumCallBack   = "onRefreshUnReadMessageNumCallBack";
    onGetVideoDataCallBack              = "onGetVideoDataCallBack";
    onGetFriendApplyMessageCallBack     = "onGetFriendApplyMessageCallBack";
    onGetAutoFriendApplyMessageCallBack = "onGetAutoFriendApplyMessageCallBack";
}

CommunityMessageListData.initData = function(self)
    self.m_listMsgData = {};
    self.m_listFriendChatData = {};
end

CommunityMessageListData.ctor = function(self)
    ImSdkHelper.getInstance():setObserver(self);
end

CommunityMessageListData.dtor = function(self)
    ImSdkHelper.getInstance():clearObserver(self);
end

--@brief 获取消息
CommunityMessageListData.getMessageList = function(self, isForceUpdate)
    if not table.isEmpty(self.m_listMsgData) then
        return self.m_listMsgData;
    end
    if isForceUpdate then
        local strData = ImSdkHelper.getInstance():imSdkGetChatMsgList(kUserInfoData:getUserCid(),ImSdkConstants.msgListMaxNum);
        local data = json.decode(strData) or {};
        self:__addMessages(data.chat_msg_list);    
    end
    return self.m_listMsgData;
end

--消息列表条数超过50移除最先发送那条
CommunityMessageListData.__removeOutOfData = function (self)
   if #self.m_listMsgData >= ImSdkConstants.msgListMaxNum then
       table.remove(self.m_listMsgData,#self.m_listMsgData);
   end     
end

--@brief 判断加好友消息是否已存在消息列表中
CommunityMessageListData.__isExistAddMessage = function (self,data)
    if table.isEmpty(data) then
        return false;
    end

    for _,v in ipairs(self.m_listMsgData) do
        if v.cid == data.cid then
            return true;
        end
    end

    return false;
end

--@brief 推送加好友信息
CommunityMessageListData.onIMPushAddFriendMessageCallBack = function(self, isSuccess, strData,online)
    Log.d("CommunityMessageListData.onIMPushAddFriendMessageCallBack","isSuccess = ",isSuccess,"strData = ",strData,"online = ",online);
    if isSuccess then
        local data = {};
        if not online then
            data = json.decode(strData) or {};
        else
            data = strData;
        end 

        local refresh = false;
        for k, v in ipairs(data) do
            if not self:__isExistAddMessage(v) then  
                local addFriendMsg = self:__formatData(v);
                addFriendMsg.msg_send_type = ImSdkConstants.sendMsgType.RECV_TYPE;
                addFriendMsg.msg_type = ImSdkConstants.msgType.FRIEND;
                addFriendMsg.msg_readed = ImSdkConstants.msgReaded.UNREADED;
                addFriendMsg.msg_status = ImSdkConstants.msgStatus.UNOPERATE;

                -- 自动加好友处理
                local isAutoAddFriend = false;
                if not table.isEmpty(addFriendMsg) then 
                    local msg = table.verify(json.decode(addFriendMsg.msg_content));
                    if msg.add_friend_type and msg.add_friend_type == ImSdkConstants.eAddFriendType.AUTO then
                        isAutoAddFriend = true;
                    end
                end
            

                if isAutoAddFriend then
                    -- 自动加好友处理
                    self:execDelegate(CommunityMessageListData.Delegate.onGetAutoFriendApplyMessageCallBack, addFriendMsg);
                else
                    if addFriendMsg.real_cid == kUserInfoData:getUserCid() then
                        --插入到self.m_listMsgData中
                        self:__addOneMessage(addFriendMsg);
                        --插入到db中
                        ImSdkHelper.getInstance():imSdkInsertChatMsgList(json.encode(addFriendMsg), kUserInfoData:getUserCid() );
                        refresh = true;
                    end
                    self:execDelegate(CommunityMessageListData.Delegate.onGetFriendApplyMessageCallBack, addFriendMsg);
                end
            end
        end
        --refresh ui
        if refresh then
            self:execDelegate(CommunityMessageListData.Delegate.onGetMessageListCallBack, true, Copy(self.m_listMsgData) );
            self:execDelegate(CommunityMessageListData.Delegate.onRefreshUnReadMessageNumCallBack);
        end
    else
        self:execDelegate(CommunityMessageListData.Delegate.onGetMessageListCallBack, false, Copy(self.m_listMsgData) );
    end
end

--@brief 推送离线加好友信息
--@true离线
CommunityMessageListData.onIMPushOfflineAddFriendMessageCallBack = function(self, isSuccess, strData)
    if isSuccess then
        local data = json.decode(strData) or {};
        self:onIMPushAddFriendMessageCallBack(isSuccess, data.beadded_list, true);
    end
end

--@brief 删除DB里面的指定消息  DB会删除这个会话下的所有聊天消息
--@step  1:remove from m_listMsgData
--       2:remove from m_listFriendChatData
--       3:call db to remove from db
--       4:refresh the ui
CommunityMessageListData.localDeleteMessageItem = function(self, dst_cid)
    if not dst_cid then
        return;
    end

    local isNeedUpdateMessageList = false;
    for k, v in pairs(self.m_listMsgData) do
        if tonumber(dst_cid) == self:__getFriendCid(v) then
            isNeedUpdateMessageList = true;
            if (v.msg_type == ImSdkConstants.msgType.FRIEND) then
                ImSdkHelper.getInstance():imSdkDeleteAddFriendMsg(dst_cid, kUserInfoData:getUserCid() );
            else
                ImSdkHelper.getInstance():imSdkDeleteChatMsg(dst_cid, kUserInfoData:getUserCid());
            end
            table.remove(self.m_listMsgData, k);
            self.m_listFriendChatData[dst_cid] = {};
            break;
        end 
    end
    if isNeedUpdateMessageList then
        self:execDelegate(CommunityMessageListData.Delegate.onGetChatMessageListCallBack, true, dst_cid, {});
        self:execDelegate(CommunityMessageListData.Delegate.onGetMessageListCallBack, true, Copy(self.m_listMsgData) );
        self:execDelegate(CommunityMessageListData.Delegate.onRefreshUnReadMessageNumCallBack);
    end
end

--@brief 判断是否有新消息
CommunityMessageListData.hasNewMessage = function(self)
    local unReadNum = 0;
    for k, v in pairs(self.m_listMsgData) do
        unReadNum = unReadNum + v.user_msg_unread_num;
    end
    return unReadNum;
end

--@brief 设置消息为已读状态
CommunityMessageListData.setChatMessageToReaded = function(self, dst_cid)
    if not dst_cid then
        return;
    end

    --refresh listMsgData
    for k, v in pairs(self.m_listMsgData) do
        if self:__getFriendCid(v) == dst_cid then
            v.user_msg_unread_num = 0;
        end
    end

    --refresh listFriendChatData and db
    for k, v in pairs( table.verify(self.m_listFriendChatData[dst_cid]) ) do
        v.msg_readed = ImSdkConstants.msgReaded.READED;
        --refresh db
        
    end
    ImSdkHelper.getInstance():imSdkUpdataChatMsgUnread(dst_cid,0,kUserInfoData:getUserCid());
    --refresh unread num
    self:execDelegate(CommunityMessageListData.Delegate.onRefreshUnReadMessageNumCallBack);
end

--@brief 获取某个会话下还有多少未读消息
CommunityMessageListData.getFriendChatUnreadNum = function(self, dst_cid)
    for k, v in pairs(self.m_listMsgData) do
        if self:__getFriendCid(v) == dst_cid then
            return v.user_msg_unread_num;
        end
    end
    return 0;
end

--@brief 标识聊天列表是否为显示状态
--@param dst_cid:好友的cid  如果dst_cid不为空 则代表聊天窗口为显示状态，反之则为隐藏状态
CommunityMessageListData.setChatLayerStatus = function(self, dst_cid)
    self.m_curChatFriendCid = dst_cid;
end

--@brief 判断是否正在和这个朋友聊天中
CommunityMessageListData.__checkIsChatingWithFriend = function(self, dst_cid)
    if self.m_curChatFriendCid and self.m_curChatFriendCid == dst_cid then
        return true;
    else
        return false;
    end
end

--@brief 获取好友聊天记录
CommunityMessageListData.getFriendChatList = function(self, dst_cid)
    if not dst_cid then
        return {};
    end

    self.m_listFriendChatData[dst_cid] = {};
    local strData = ImSdkHelper.getInstance():imSdkGetMsgList( dst_cid, kUserInfoData:getUserCid(),ImSdkConstants.friendChatListMaxNum);
    self:__addFriendChatMessages(dst_cid, json.decode(strData) );
    Log.v("CommunityMessageListData.getFriendChatList","strData = ",strData);
    return Copy( self.m_listFriendChatData[dst_cid] );
end

--@brief 清空和指定朋友的所有聊天消息
CommunityMessageListData.clearAllChatMessageWithFriend = function(self, dst_cid)
    if not dst_cid then
        return;
    end
    
    --refresh listMsgData unread num
    for k, v in pairs(self.m_listMsgData) do
        if self:__getFriendCid(v) == dst_cid then
            v.user_msg_unread_num = 0;
            break;
        end
    end

    self.m_listFriendChatData[dst_cid] = {};
    --此处应该通知db 提供一个一键删除的接口
    ImSdkHelper.getInstance():imSdkDeleteChatMsg(dst_cid,kUserInfoData:getUserCid()); 
    self:localDeleteMessageItem(dst_cid);
    
    --refresh ui
    self:execDelegate(CommunityMessageListData.Delegate.onRefreshUnReadMessageNumCallBack);
    self:execDelegate(CommunityMessageListData.Delegate.onGetChatMessageListCallBack, dst_cid, {});
end


--@brief 服务器推送在线音频消息
CommunityMessageListData.onIMPushVideoMessageCallBack = function(self, isSuccess, strData)
    if isSuccess then
        self:__pushTextMessageOrVideoAnalyseData(isSuccess, json.decode(strData) );
    end
end

--@brief 服务器推送离线文本或音频消息
--@离线推送是一个list
CommunityMessageListData.onIMPushOfflineMsgOrVideoCallBack = function (self, isSuccess, strData)
    if isSuccess then
        local data = json.decode(strData) or {};
        self:__pushTextMessageOrVideoAnalyseData(isSuccess, data.offline_msg_list );
    end
end

--@brief 推送文本聊天信息
CommunityMessageListData.onIMPushTextMessageCallBack = function(self, isSuccess, strData)
    self:__pushTextMessageOrVideoAnalyseData(isSuccess, json.decode(strData) );
end

--@brief 更新本地消息列表数
CommunityMessageListData.localInsertTextOrVideoToListMsgData = function(self,data)
    if table.isEmpty(data) then
        return;
    end

    local messageItem = self:__getMessageItem(data.cid);
    if table.isEmpty(messageItem) then
        self:__addOneMessage(data);
    else
        self:__refreshMsgData(data.cid,data);
    end
end


--@brief 推送文本，语言，在线 离线 数据分析
CommunityMessageListData.__pushTextMessageOrVideoAnalyseData = function(self, isSuccess, data)
    Log.v("CommunityMessageListData.__pushTextMessageOrVideoAnalyseData","data = ",data);

    if isSuccess then
        data = table.verify(data);

        table.sort(data, function(a, b)
            if a and b then
                return number.valueOf(a.msg_time) < number.valueOf(b.msg_time);
            end
        end);

        for k, v in pairs(data) do
            local chatMsg = self:__formatData(v);
            chatMsg.msg_send_type = ImSdkConstants.sendMsgType.RECV_TYPE;       
            chatMsg.msg_status = ImSdkConstants.msgStatus.SUCC_SEND;

            local friendCid = self:__getFriendCid(v);
            chatMsg.msg_readed = self:__checkIsChatingWithFriend(friendCid) and ImSdkConstants.msgReaded.READED
                                                                                 or  ImSdkConstants.msgReaded.UNREADED;
            --判断原来是否已经存在会话了
            --如果已经存在，则更新里面的文本，如果不存在 则新创建一个会话
            local messagItem = self:__getMessageItem(friendCid);
            if table.isEmpty(messagItem) then
                messagItem = Copy(chatMsg);
                if chatMsg.msg_readed == ImSdkConstants.msgReaded.UNREADED then
                    chatMsg.user_msg_unread_num = 1;
                    messagItem.user_msg_unread_num = 1;
                end
                self:__addOneMessage(messagItem);
                 --插入到db中
                ImSdkHelper.getInstance():imSdkInsertChatMsgList(json.encode(messagItem), kUserInfoData:getUserCid() );
            else
                messagItem.msg_content = chatMsg.msg_content;
                if chatMsg.msg_readed == ImSdkConstants.msgReaded.UNREADED then
                    messagItem.user_msg_unread_num = messagItem.user_msg_unread_num+1;
                    chatMsg.user_msg_unread_num = messagItem.user_msg_unread_num
                end
                
            end
            self:__refreshMsgData(friendCid,chatMsg);
            --insert to memory
            ImSdkHelper.getInstance():imSdkGetSomeoneUnreadMsg(friendCid,kUserInfoData:getUserCid());
            self:__addOneFriendChatMessage(self:__getFriendCid(v), chatMsg);

            --insert to db
            ImSdkHelper.getInstance():imSdkInsertMsgItem(Copy(json.encode(chatMsg)),kUserInfoData:getUserCid());

            --从db拉语音数据回调后才可通知
           
            self:execDelegate(CommunityMessageListData.Delegate.onGetNewChatMessageCallBack, true, friendCid, Copy( self:__getFriendChatList(friendCid) ) );
            self:execDelegate(CommunityMessageListData.Delegate.onRefreshUnReadMessageNumCallBack);
        end
        self:execDelegate(CommunityMessageListData.Delegate.onGetMessageListCallBack, true, Copy(self.m_listMsgData) );
    else
        self:execDelegate(CommunityMessageListData.Delegate.onGetNewChatMessageCallBack, false);
    end
end

--@brief 获取音频信息回调
CommunityMessageListData.onIMGetVideoInfoCallBack = function(self, isSuccess, strData)
    Log.v("CommunityMessageListData.onIMGetVideoInfoCallBack","isSuccess = ",isSuccess,"strData = ",strData);
    if isSuccess then
        local data = table.verify( json.decode(strData) );
        for k,v in pairs(data) do
            v.file_path = tostring(v.file_path);
            v.key       = tostring(v.key);
            v.cid       = tonumber(v.cid);
            local item = self:__getFriendChatItemWithKey(v.cid,v.key);
            if item then
                item.msg_file_path = v.file_path;
            end
            ImSdkHelper:getInstance():imSdkUpdateAudioPath(v.cid, v.file_path, v.key, kUserInfoData:getUserCid());
            self:execDelegate(CommunityMessageListData.Delegate.onGetVideoDataCallBack, true, v.file_path, v.key); 
        end
    else
        self:execDelegate(CommunityMessageListData.Delegate.onGetVideoDataCallBack,false);
    end
end

--@brief 根据msg_key来获取用户聊天item
CommunityMessageListData.__getFriendChatItemWithKey = function(self,cid,key)
    for k, v in pairs( self:__getFriendChatList(cid) ) do
        if v.msg_key == key then
            return v;
        end
    end
    return nil;
end

CommunityMessageListData.__getFriendCid = function(self, itemData)
    if table.isEmpty(itemData) then
        return -1;
    end

    return itemData.cid or -1;
end

CommunityMessageListData.__addMessages = function(self, messageList)
    self:__removeOutOfData();
    for k, v in ipairs( table.verify(messageList) ) do
        local data = self:__formatData(v); 
        if data.msg_type == ImSdkConstants.msgType.FRIEND then
            table.insert(self.m_listMsgData,1,data);   
        else
            table.insert(self.m_listMsgData,data); 
        end
    end
end

CommunityMessageListData.__addOneMessage = function(self, oneMessage)
    self:__removeOutOfData();
    if not table.isEmpty(oneMessage) then
        local data = self:__formatData(oneMessage);
        if data.msg_type == ImSdkConstants.msgType.FRIEND then
            table.insert(self.m_listMsgData,1,data);   
        else
            table.insert(self.m_listMsgData,data); 
        end
    end
end

CommunityMessageListData.__getMessageItem = function(self, dst_cid)
    for k, v in pairs(self.m_listMsgData) do
        if self:__getFriendCid(v) == dst_cid then
            return v;
        end
    end
    return {};
end

CommunityMessageListData.__getFriendChatList = function(self, dst_cid)
    if not dst_cid then
        return {};
    end

    return self.m_listFriendChatData[dst_cid] or {};
end

CommunityMessageListData.__addFriendChatMessages = function(self, dst_cid, friendChatList)
    if not dst_cid or table.isEmpty(friendChatList) then
        return;
    end

    self.m_listFriendChatData[dst_cid] = self.m_listFriendChatData[dst_cid] or {};
    for k, v in ipairs( table.verify(friendChatList.msg_list) ) do
        table.insert(self.m_listFriendChatData[dst_cid], self:__formatData(v) );
    end
end

CommunityMessageListData.__addOneFriendChatMessage = function(self, dst_cid, oneChatItem)
    if not dst_cid or not oneChatItem then
        return;
    end

    self.m_listFriendChatData[dst_cid] = self.m_listFriendChatData[dst_cid] or {};
    table.insert(self.m_listFriendChatData[dst_cid], self:__formatData(oneChatItem));
end

--@brief 刷新对方的昵称
CommunityMessageListData.__refreshMsgData = function(self,dst_cid,data)
    if not dst_cid then
        return;
    end
    for k, v in pairs(self.m_listMsgData) do
        if self:__getFriendCid(v) == dst_cid then
            self.m_listMsgData[k] = data;
        end
    end
    table.sort(self.m_listMsgData, function(a, b)
        if a and b then
            local r;
            local al = tonumber(a.msg_type);
            local bl = tonumber(b.msg_type);
            local aq = tonumber(a.msg_time);
            local bq = tonumber(b.msg_time);
            if al == bl then
                r = aq > bq;
            else
                r = al > bl;
            end
            return r;
        end
    end);
end

--@brief 格式化数据
CommunityMessageListData.__formatData = function(self, v)
    v.cid = tonumber(v.cid) or 0;
    v.nickname = tostring(v.nickname) or "";
    v.avatar_url = tostring(v.avatar_url) or "";
    v.msg_content = tostring(v.msg_content) or "";
    v.msg_time = tostring(v.msg_time) or "";
    v.sex = tostring(v.sex) or "";
    v.real_cid = tonumber(v.real_cid) or 0;
    v.msg_content_ext = tostring(v.msg_content_ext) or "";
    v.msg_sessionid = tostring(v.msg_sessionid) or "";
    v.user_msg_unread_num = tonumber(v.user_msg_unread_num) or 1;
    v.msg_send_type = tonumber(v.msg_send_type) or ImSdkConstants.sendMsgType.RECV_TYPE;
    v.msg_type = tonumber(v.msg_type) or ImSdkConstants.msgType.TEXT;
    v.msg_readed = tonumber(v.msg_readed) or ImSdkConstants.msgReaded.UNREADED;
    v.msg_status = tonumber(v.msg_status) or ImSdkConstants.msgStatus.SENDING;
    v.msg_file_path = tostring(v.msg_file_path) or "";
    v.msg_key = tostring(v.msg_key) or "";
  
    return v;
end

return CommunityMessageListData;