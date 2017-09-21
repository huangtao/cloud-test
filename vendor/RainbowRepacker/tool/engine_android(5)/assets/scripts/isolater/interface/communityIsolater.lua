--社交中间层
require("gameData/dataInterfaceBase");
require("hall/community/data/communityDataInterface");


CommunityIsolater = class(DataInterfaceBase);

CommunityIsolater.Delegate = {
    onRequestAddFriendCallBack = "onRequestAddFriendCallBack";
    onHandleAddFriendCallBack = "onHandleAddFriendCallBack";
    onDeleteFriendCallBack = "onDeleteFriendCallBack";
    onCustomGetUserInfoCallBack = "onCustomGetUserInfoCallBack";
    onSendInviteFriendCallBack = "onSendInviteFriendCallBack";
    onGetFriendsInviteList = "onGetFriendsInviteList";
    onGetFriendApplyMessageCallBack = "onGetFriendApplyMessageCallBack";
    onAddFriendResultCallBack  = "onAddFriendResultCallBack";
    onGetContactListCallBack = "onGetContactListCallBack";
    onInviteContactFriendsCallback = "onInviteContactFriendsCallback";
    onInviteAnswerCallBack = "onInviteAnswerCallBack";
    onInviteNotifyCallBack = "onInviteNotifyCallBack";
    onGetProxyMessage = "onGetProxyMessage";
    onGetFriendListCallBack = "onGetFriendListCallBack";
}

CommunityIsolater.getInstance = function()
    if not CommunityIsolater.s_instance then
        CommunityIsolater.s_instance = new(CommunityIsolater);
    end
    return CommunityIsolater.s_instance;
end

CommunityIsolater.ctor = function(self)
    CommunityDataInterface.getInstance():setObserver(self);
end

CommunityIsolater.dtor = function(self)
    CommunityDataInterface.getInstance():clearObserver(self);
end

-----------------------------------好友相关-----------------------
--[[
    @brief 请求加好友
    @param cid 对方的cid
    @param msg 附加信息
    @param otherPlayerCidList 除自己以外其他玩家cid列表
    @note  otherPlayerCidList普通加好友可以不传，房间玩牌时邀请其他玩家 
--]]
CommunityIsolater.requestAddFriend = function(self, cid, msg,otherPlayerCidList)
    if not cid then
        return;
    end
    CommunityDataInterface.getInstance():requestAddFriend(cid,msg,otherPlayerCidList);
end

--[[
    @brief 添加好友回调
    @param isSuccess 是否发送成功
    @param msg 发送成功或发送失败    
--]]
CommunityIsolater.onRequestAddFriendCallBack = function(self, isSuccess, msg)
    self:notify(CommunityIsolater.Delegate.onRequestAddFriendCallBack, isSuccess, msg);
end

--[[
    @brief 同意添加好友
    @param cid 对方cid
--]]
CommunityIsolater.agreeAddFriend = function(self, cid)
    self:requestHandleAddFriendMessage(cid, ImSdkConstants.eFriendApplyOp.AGREE);
end

--[[
    @brief 拒绝添加好友
    @param cid 对方cid
--]]
CommunityIsolater.refuseAddFriend = function(self, cid)
    self:requestHandleAddFriendMessage(cid, ImSdkConstants.eFriendApplyOp.REFUSE);
end

--[[
    @brief 同意或拒绝添加好友
    @param cid 对方cid
    @param operateType 操作类型：1 同意 2拒绝
--]]
CommunityIsolater.requestHandleAddFriendMessage = function(self, cid, operateType)
    if not (cid and operateType) then
        return;
    end

    CommunityDataInterface.getInstance():requestHandleAddFriendMessage(cid, operateType);   
end

--[[
    @brief 处理添加好友回调（同意或者拒绝）
    @param isSuccess 处理是否成功    
    @data 暂时没用上
--]]
CommunityIsolater.onHandleAddFriendCallBack = function(self, isSuccess, data)
    self:notify(CommunityIsolater.Delegate.onHandleAddFriendCallBack, isSuccess, "处理好友消息成功");
end

--[[
    @brief 请求删除好友    
    @param cid 对方cid
--]]
CommunityIsolater.requestDelFriend = function(self, cid)
    if not cid then
        return;
    end

    CommunityDataInterface.getInstance():requestDeleteFriend(cid);
end

--[[
    @biref 删除好友回调
    @param isSuccess删除好友消息是否发送成功
--]]
CommunityIsolater.onDeleteFriendCallBack = function(self, isSuccess)
    local msg  = isSuccess and "删除好友消息发送成功" or "删除好友消息发送失败";
    self:notify(CommunityIsolater.Delegate.onDeleteFriendCallBack, isSuccess, msg);
end

--[[
    @brief 根据cid判断是否为好友    
    @param cid 对方cid
--]]
CommunityIsolater.checkIsFriend = function(self, cid)
    return CommunityDataInterface.getInstance():isFriend(cid);
end

--[[
    @brief 好友申请回调     
    @param applyInfo = {
                            cid 自己cid
                            real_cid 对方real_cid
                            nickname 昵称
                            avatar_url 头像
                            sex 性别
                        }    
--]]
CommunityIsolater.onGetFriendApplyMessageCallBack = function(self, applyInfo)
    Log.d("CommunityIsolater.onGetFriendApplyMessageCallBack applyInfo = ",applyInfo);
    self:notify(CommunityIsolater.Delegate.onGetFriendApplyMessageCallBack, applyInfo);
end

--[[
    @brief 服务端推送添加加好友反馈结果消息
    @param isSuccess 添加好友是否成功
    @param data = {
                        cid 对方cid
                        msg 附加消息
                        time 处理时间  
                        result 同意或者拒绝  1 同意 2拒绝
                        nickname 对方昵称
                    }
--]]
CommunityIsolater.onAddFriendResultCallBack = function(self, isSuccess, data)
    self:notify(CommunityIsolater.Delegate.onAddFriendResultCallBack, isSuccess, data);
end

--@brief 获取好友好友列表回调
CommunityIsolater.onGetFriendListCallBack = function(self, isSuccess, friendListData,type)
    self:notify(CommunityIsolater.Delegate.onGetFriendListCallBack, isSuccess, friendListData,type);
end
------------------------------------ 好友信息相关-----------------------------
--[[
    @brief 根据用户公共cid来获取用户信息。其他信息同上
    @param extraParam: 扩展的参数请求(字符串类型)
    @note  详细信息已包含：mid,nick,icon,exp,money,sex,diamond,is_friend,city,max_rank
--]]
CommunityIsolater.requestUserInfoCustom = function(self, cid, extraParam)
    CommunityDataInterface.getInstance():requestUserInfoCustom(cid, nil, extraParam);
end

--[[
    @brief 自定义获取好友信息回调    
    @param isSuccess 是否成功获取
    @param info 用户资料
    @sendParam 扩展的参数请求
--]]
CommunityIsolater.onCustomGetUserInfoCallBack = function(self, isSuccess, info, sendParam)
    self:notify(CommunityIsolater.Delegate.onCustomGetUserInfoCallBack, isSuccess, info, sendParam);
end

-------------------------------------房间邀请相关----------------------------
--[[
    @brief 房间内邀请在线好友列表
    @param num 好友人数，默认20
--]]
CommunityIsolater.requestFriendsInviteList = function(self, num)
    CommunityDataInterface.getInstance():requestFriendsInviteList(num);
end

--[[
    @brief 房间内邀请在线好友列表回调    
    @param isSuccess 获取在线好友信息是否成功
    @param data = {
                    nick 好友昵称 
                    mid 好友mid
                    cid 好友cid
                    }
--]]
CommunityIsolater.onGetFriendsInviteList = function(self, isSuccess, data)
    Log.v("CommunityIsolater.onGetFriendsInviteList","data = ",data);
    self:notify(CommunityIsolater.Delegate.onGetFriendsInviteList, isSuccess, data);
end

--[[
    @brief 邀请好友加入牌局
    @param cidList: cid列表
    @param data: 邀请扩展信息    
--]]
CommunityIsolater.requestInviteFriend = function(self, cidList, data)
    if table.isEmpty(cidList) then
        return;
    end

    cidList = json.encode( {cid_list = cidList} );
    local info = json.encode(data);
    CommunityDataInterface.getInstance():requestInviteFriend(cidList, info);
end

--[[
    @brief 邀请好友回调
    @param isSuccess 邀请好友是否成功
    @param msg 成功或者失败消息
--]]
CommunityIsolater.onSendInviteFriendCallBack = function(self, isSuccess, msg)
    Log.d("CommunityIsolater.onSendInviteFriendCallBack","isSuccess = ",isSuccess,"msg = ",msg)
    self:notify(CommunityIsolater.Delegate.onSendInviteFriendCallBack, isSuccess, msg);
end

--[[
    @brief 拒绝好友邀    
--]]
CommunityIsolater.refuseFriendInvite = function(self, cid)
    --body
end

--[[
    @brief 发送邀请好友进入游戏回调
    @param isSuccess 是否成功邀请
    @param data = {
                        cid 对方cid
                        nickname 对方昵称
                        result 同意或者拒绝
                        msg 附加消息
                        time 时间
                    }     
--]]
CommunityIsolater.onInviteAnswerCallBack = function(self, isSuccess, data)
    Log.d("CommunityIsolater.onInviteAnswerCallBack","isSuccess = ",isSuccess,"data = ",data)
    self:notify(CommunityIsolater.Delegate.onInviteAnswerCallBack, isSuccess, data);
end

--[[
    @brief 被邀请人对方回复结果  
    @param isSuccess 回复是否成功
    @param data = {
                        cid 对方cid
                        nickname 对方昵称
                        result 同意或者拒绝
                        msg 附加消息
                        time 时间
                    }  
--]]
CommunityIsolater.onInviteNotifyCallBack = function(self, isSuccess, data)
    Log.d("CommunityIsolater.onInviteNotifyCallBack","isSuccess = ",isSuccess,"data = ",data)
    self:notify(CommunityIsolater.Delegate.onInviteNotifyCallBack, isSuccess, data);
end

--[[
   @brief 获取离线好友列表信息
]]
CommunityIsolater.getFriendListOffline = function(self)
    return CommunityDataInterface.getInstance():getFriendListOffline();
end

--[[
    @brief 自定义消息透传
    @param cid列表cidlist 
    @param mtype 透传消息的类型
    @param data = {
                        dcid 对方cid
                        scid 自己cid
                        mtype 处理类型：加、拒绝
                    }
--]]
CommunityIsolater.requestSendProxyMessage = function (self,cidlist,mtype,data)
    CommunityDataInterface.getInstance():requestSendProxyMessage(cidlist,mtype,data);
end

--[[
    @brief 接收透传的自定义消息
    @param isSuccess 获取自定义信息是否成功
    @param mtype 处理类型：加、拒绝
    @param data 自定义消息体
--]]
CommunityIsolater.onGetProxyMessage = function(self,isSuccess,mtype,data)
    Log.d("CommunityIsolater.onGetProxyMessage","isSuccess = ",isSuccess,"mtype = ",mtype,"data = ",data)
    self:notify(CommunityIsolater.Delegate.onGetProxyMessage, isSuccess,mtype, data);
end
----------------------------------通讯录-------------------------------

--[[
    @brief 获取通讯录列表
    @return 列表内容
        t = {
            name 姓名
            phoneNumber 手机号
        } 
--]]
CommunityIsolater.getContactList = function(self)
    CommunityDataInterface.getInstance():getContactList();
end

--[[
    @brief 获取通讯录列表回调
    @param info = {
            name 姓名
            phoneNumber 手机号
        } 
--]]
CommunityIsolater.onGetContactListCallBack = function(self, info)
    self:notify(CommunityIsolater.Delegate.onGetContactListCallBack, info);
end

--[[
    @brief 短信邀请
    @param info 手机号码（可以多个号）
    @param text 短信内容
    @note 支持多个号邀请
--]]
CommunityIsolater.inviteContactFriends = function(self, info, text)
    CommunityDataInterface.getInstance():inviteContactFriends(info, text);
end

--[[
    @brief 短信邀请回调
    @param isSuccess 短信邀请是否成功
    @param info 暂为空
--]]
CommunityIsolater.onInviteContactFriendsCallback = function(self, isSuccess, info)
    self:notify(CommunityIsolater.Delegate.onInviteContactFriendsCallback, isSuccess, info);
end

