
--[[
	社交模块的逻辑类
]]

CommunityLogic = class(DataInterfaceBase);


CommunityLogic.Delegate = {

	onGetFriendsInviteList = "onGetFriendsInviteList";
    onSendInviteFriendCallBack = "onSendInviteFriendCallBack";
    onGetContactListCallBack = "onGetContactListCallBack";
    onInviteContactFriendsCallback = "onInviteContactFriendsCallback";
};

CommunityLogic.getInstance = function()
	if not CommunityLogic.s_instance then
		CommunityLogic.s_instance = new(CommunityLogic);
	end
	return CommunityLogic.s_instance;
end

CommunityLogic.releaseInstance = function()
	delete(CommunityLogic.s_instance);
	CommunityLogic.s_instance = nil;
end

CommunityLogic.ctor = function(self)
	CommunityIsolater.getInstance():setObserver(self);
end

CommunityLogic.dtor = function(self)
	CommunityIsolater.getInstance():clearObserver(self);
end

-------------------------------------------邀请模块-----------------------------------------------------------------
CommunityLogic.resetInvitedData = function(self)
    CommunityLogic.invitedListOnline = {};
    CommunityLogic.invitedListMessage = {};
end

CommunityLogic.resetSeletedData = function(self)
    CommunityLogic.selectedList = {};
end

CommunityLogic.hasSeletedData = function(self)
    return not table.isEmpty(CommunityLogic.selectedList)
end

--在线好友
CommunityLogic.isInvitedOnline = function(self, cid)
    return CommunityLogic.invitedListOnline[cid];
end

--通讯录好友
CommunityLogic.isInvitedMessage = function(self, number)
    return CommunityLogic.invitedListMessage[number];
end

CommunityLogic.isLimitedMessage = function(self)
    local invitedCount = #CommunityLogic.invitedListMessage;
    local seletedCount = #CommunityLogic.selectedList;
    return invitedCount + seletedCount >= 10;
end


CommunityLogic.selectInviteList = function(self, num, seleted)
    if seleted then
        self:_addToSelectedList(num);
    else
        self:_removeFromSelectedList(num);
    end

    Log.d("CommunityLogic.selectedList", CommunityLogic.selectedList);
end

CommunityLogic._addToSelectedList = function(self, number)
    table.insert(CommunityLogic.selectedList, number);
end

CommunityLogic._removeFromSelectedList = function(self, number)
    local list = {};
    for k, v in pairs(CommunityLogic.selectedList) do
        if v ~= number then 
            table.insert(list, v);
        end 
    end
    CommunityLogic.selectedList = list;
end

CommunityLogic.requestFriendsInviteList = function(self)
    ---发送请求 
    CommunityIsolater.getInstance():requestFriendsInviteList();
end

CommunityLogic.onGetFriendsInviteList = function ( self, isSuccess, data )
    if not isSuccess or not data then 
        return;
    end
    self:getFriendInviteList(data);
end


CommunityLogic.__isPlayerByCid = function (self,cid)
    local flag  = false;
    local info = GamePlayerManager2.getInstance():getPlayerByCid(cid);
    if not table.isEmpty(info) then
        flag = true;
    end
    return flag;
end

CommunityLogic.getFriendInviteList = function( self,listData )
    for k,v in ipairs(listData) do
        if self:__isPlayerByCid(v.cid) then
            table.remove(listData,k);
        end
    end
    self:execDelegate(CommunityLogic.Delegate.onGetFriendsInviteList, listData);
end

-- 兼容旧弹框， 邀请已经选择的好友
CommunityLogic.onSelectInviteFriends = function(self)
	local list = self:getSelectedList();
    Log.d("CommunityLogic.onSelectInviteFriends",list)
    if table.isEmpty(list) then
        return ;
    end

    local info = {};
    for k,v in pairs(list) do
        info[k] = {cid = v};
    end

    local data = PasswordIsolater.getInstance():generateData(PasswordConstants.TYPE_PRIVATE_ROOM);
    CommunityIsolater.getInstance():requestInviteFriend(info,data);
end



-- -- 邀请已经选择的好友
CommunityLogic.inviteFriends = function(self, data)
    if table.isEmpty(CommunityLogic.selectedList) then
        return;
    end
    local info = {};
    for k,v in pairs(CommunityLogic.selectedList) do
        info[k] = {cid = v};
        CommunityLogic.invitedListOnline[v] = true;
    end

    if self:_hasFriendsOnline(info) then
        CommunityIsolater.getInstance():requestInviteFriend(info, data);
    end
end

CommunityLogic._hasFriendsOnline = function(self, info)
    local friendOfflineList = CommunityIsolater.getInstance():getFriendListOffline();

    local allOffline = true;
    for k, v in pairs(info) do
        local cid = number.valueOf(v.cid);
        local friend = friendOfflineList[cid];
        if friend then
            self:showToast(string.format("好友【%s】刚刚下线，无法成功邀请", friend.nick));
        else
            allOffline = false;
        end       
    end

    return not allOffline;
end

CommunityLogic.onSendInviteFriendCallBack = function(self,isSuccess, msg)
    msg = msg or "";
    if msg ~= "" then
        self:showToast(msg);
    end

    self:execDelegate(CommunityLogic.Delegate.onSendInviteFriendCallBack);
end

-- interface回调
CommunityLogic.onInviteNotifyCallBack = function(self, isSuccess, data)
    if isSuccess then
        if data.result == 1 then
            self:showToast(string.format("好友【%s】同意了您的邀请", data.nickname));
        else
            if data.msg == ImSdkConstants.eInviteFriendErrorType.GAME_PLAYING then
                self:showToast(string.format("好友【%s】正在玩牌中，无法成功邀请", data.nickname));
            else
                self:showToast(string.format("好友【%s】谢绝了您的邀请", data.nickname));
            end
        end
    end
end

CommunityLogic.requestHandleAddFriendMessage = function ( self, data, mtype )
	CommunityIsolater.getInstance():requestHandleAddFriendMessage(data.ucid, mtype);

    local info = {};
    info.dcid = data.ucid;--目标
    info.scid = UserBaseInfoIsolater.getInstance():getUserCid();--谁发起的
    info.mtype = mtype;--处理类型：加、拒绝

    Log.d("CommunityLogic.requestHandleAddFriendMessage","info = ",info);
    
    local cidList = {};
    local all = GamePlayerManager2.getInstance():getAllPlayer();
    for k,v in pairs(all) do 
        local cid = v:getCid();
        if cid ~= info.dcid and cid ~= info.scid then 
            cidList[#cidList+1] = {cid = v:getCid()};
        end 
    end 
    Log.d("CommunityLogic.requestHandleAddFriendMessage","cidList = ",cidList);
    self:requestSendProxyMessage(cidList,ImSdkConstants.eProxyMessageType.ANSWER_FRIEND_REQUEST,info);

    local dseat = GamePlayerManager2.getInstance():getLocalSeatByCid(data.ucid); 
    local sseat =  PlayerSeat.getInstance():getMyLocalSeat();
    self:playAnswerFriendApplyAnim(mtype == 1,sseat,dseat);
end

CommunityLogic.handleProxyAnswerFriendApply = function(self,data)
    data = table.verify(data);

    local dseat = GamePlayerManager2.getInstance():getLocalSeatByCid(data.dcid); 
    local sseat = GamePlayerManager2.getInstance():getLocalSeatByCid(data.scid); 
    self:playAnswerFriendApplyAnim(data.mtype == 1,sseat,dseat);
end

CommunityLogic.playAnswerFriendApplyAnim = function(self,isAgree,sseat,dseat)
    sseat = number.valueOf(sseat,-1);
    dseat = number.valueOf(dseat,-1);

    if sseat ~= -1 and dseat ~= -1 then --双方都在桌子上才播动画
        local info = {};
        info.seat =  sseat;
        info.dseat = dseat;
        local action = isAgree and GameMechineConfig.ACTION_NS_ENVELOP_AGREE_ANIM or GameMechineConfig.ACTION_NS_ENVELOP_REFUSE_ANIM;
        MechineManage.getInstance():receiveAction(action,info);
    end
end
----------------------------------------------通讯录逻辑---------------------------------------------
CommunityLogic.getContactList = function(self)
    CommunityIsolater.getInstance():getContactList();
end

CommunityLogic.onGetContactListCallBack = function(self, data)
    self:execDelegate(CommunityLogic.Delegate.onGetContactListCallBack, data);
end

-- 邀请已经选择的好友
CommunityLogic.inviteContactFriends = function(self, text)
    if table.isEmpty(CommunityLogic.selectedList) then
        return;
    end

    for k,v in pairs(CommunityLogic.selectedList) do
        CommunityLogic.invitedListMessage[v] = true;
    end

    CommunityIsolater.getInstance():inviteContactFriends(CommunityLogic.selectedList, text);
end

CommunityLogic.onInviteContactFriendsCallback = function(self, isSuccess, info)
    if isSuccess then
        self:showToast("短信发送成功");
        self:execDelegate(CommunityLogic.Delegate.onInviteContactFriendsCallback);
    else
        self:showToast("短信发送失败");
    end
end

---------------------------------------------- 好友逻辑 --------------------------------------------

--@brief 添加好友
CommunityLogic.requestAddFriend = function(self,dst_cid,msg)
    dst_cid = number.valueOf(dst_cid);

    if self:checkIsAlreadApply(dst_cid) then
        return;
    end
    local info = {
        ucid = UserBaseInfoIsolater.getInstance():getUserCid();
        ducid = dst_cid;
    };
    self:onFriendApply(info);
    if dst_cid >= 9000000 and dst_cid < 10000000 then
        local action = GameMechineConfig.ACTION_NS_ADDFRIENDRESULT;
        local data = {msg = "好友请求发送成功"};
        MechineManage.getInstance():receiveAction(action,data);
    else
        local otherPlayerCidList = GamePlayerManager2.getInstance():getOtherPlayerCidList(info);
        CommunityIsolater.getInstance():requestAddFriend(dst_cid,"",otherPlayerCidList);
    end
end

-- 检查是否已经加过好友了
CommunityLogic.checkIsAlreadApply = function(self,userId)
    if not userId then 
        return true;
    end 
    self.m_applyList = table.verify(self.m_applyList);
    for k,v in ipairs(self.m_applyList) do 
        if v == userId then 
            self:showSystemMsg("好友请求已发送，对方未回应");
            return true;
        end 
    end 
    table.insert(self.m_applyList,userId);
    return false;
end

-- 校验是否可以加好友，播放信封动画
CommunityLogic.onFriendApply = function(self, info)
    Log.d("CommunityLogic","onFriendApply","info = ",info);
    if table.isEmpty(info) then
        return;
    end
    info = table.verify(info);
    info.seat = GamePlayerManager2.getInstance():getLocalSeatByCid(info.ucid); -- 请求方
    info.dseat = GamePlayerManager2.getInstance():getLocalSeatByCid(info.ducid); -- 接收方
    
    if info.dseat == 1 and info.seat == -1 then
        -- 房间只有自己，收到加好友请求时，弹框
        local action = GameMechineConfig.ACTION_NS_FRIENDAPPLY;
        MechineManage.getInstance():receiveAction(action,info);
        return;
    elseif info.seat == -1 or info.dseat == -1 then
        if GameInfoIsolater.getInstance():isInMatchRoom() 
            and info.ducid == UserBaseInfoIsolater.getInstance():getUserCid() then --比赛赛前等待收到加好友，弹框
            local action = GameMechineConfig.ACTION_NS_FRIENDAPPLY;
            MechineManage.getInstance():receiveAction(action,info);
        end  
        return;              
    end
    if self:checkIsExsitApplyData(info) then 
        return;
    end
    self.m_envelops = table.verify(self.m_envelops);
    table.insert(self.m_envelops, info);
    local action = GameMechineConfig.ACTION_NS_ENVELOPANIM;
    MechineManage.getInstance():receiveAction(action,info);
	return;
end

-- 检查是否已经加过好友
CommunityLogic.checkIsExsitApplyData = function(self,info)
    self.m_envelops = table.verify(self.m_envelops);
    info = table.verify(info);

    for k,v in pairs(self.m_envelops) do
        if v.uid == info.uid and info.duid == UserBaseInfoIsolater.getInstance():getUserId() then --我请求加别人为好友
            self:showSystemMsg("好友请求已发送，对方未回应");
            return true;
        elseif v.uid == UserBaseInfoIsolater.getInstance():getUserId() and v.duid == info.duid then --别人请求加我为好友
            return true;
        end 
    end
    table.insert(self.m_envelops,info);
    return false;
end

-- 加好友结果
CommunityLogic.onRequestAddFriendCallBack = function(self, isSuccess, msg)
    Log.d("CommunityLogic","onRequestAddFriendCallBack","isSuccess = ",isSuccess,"msg = ",msg);
    self:showSystemMsg(msg);
    local action = GameMechineConfig.ACTION_NS_ADDFRIENDRESULT;
    local data = {isSuccess = isSuccess, msg = msg};
    MechineManage.getInstance():receiveAction(action,data);
end

--@brief 同意添加好友
CommunityLogic.agreeAddFriend = function(self, messageId)
    CommunityIsolater.getInstance():agreeAddFriend(messageId);
end

--@brief 拒绝添加好友
CommunityLogic.refuseAddFriend = function(self, messageId)
    CommunityIsolater.getInstance():refuseAddFriend(messageId);
end

-- 同意、拒绝加好友的结果
CommunityLogic.onAddFriendResultCallBack = function(self,isSuccess,data)
    Log.d("CommunityLogic","onAddFriendResultCallBack","isSuccess = ",isSuccess,"data = ",data);
    if isSuccess then
        data = table.verify(data);
        self.m_applyList = table.verify(self.m_applyList);
        local key;
        for k,v in ipairs(self.m_applyList) do 
            if v == data.cid then 
                key = k;
                break;
            end 
        end 
        if key then
            table.remove(self.m_applyList,key);
        end 
        
        local str = data.result == 1 and "%s已添加你为好友" or "%s拒绝加你为好友";
        self:showSystemMsg(string.format(str, data.nickname or ""));

        local sseat = GamePlayerManager2.getInstance():getLocalSeatByCid(data.cid); -- 反馈者信息
        local dseat = PlayerSeat.getInstance():getMyLocalSeat();
        self:playAnswerFriendApplyAnim(data.result == 1,sseat,dseat);

        local action = GameMechineConfig.ACTION_NS_ADDFRIEND_CALLBACK;
        local info = {isAgree = data.result == 1, cid = data.cid};
        MechineManage.getInstance():receiveAction(action,info);
    end
end

CommunityLogic.onGetFriendApplyMessageCallBack = function ( self, applyInfo)
    Log.d("CommunityLogic","onGetFriendApplyMessageCallBack","applyInfo = ",applyInfo);
    if GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime() then 
        return;
    end
	local info = {
		ucid = applyInfo.cid;
		ducid = applyInfo.real_cid;
		nickname = applyInfo.nickname;
		head = applyInfo.avatar_url;
		sex = applyInfo.sex;
        msg = "玩家"..applyInfo.nickname.."请求加您为好友";
	}

	self:onFriendApply(info); 
end

CommunityLogic.onGetFriendListCallBack = function(self,isSuccess, friendListData,type)
    if isSuccess then 
        local action = GameMechineConfig.ACTION_NS_REFRESH_FRIENDS_LIST;
        MechineManage.getInstance():receiveAction(action);
    end 
end
-----------------------------------邀请弹框状态逻辑--------------------------------

CommunityLogic.checkInviteViewState = function(self)
    if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
        local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
        if table.isEmpty(privateRoomInfo) then
            return;
        end
        if privateRoomInfo.autoReady then
            local action = GameMechineConfig.ACTION_AUTO_READY;
            MechineManage.getInstance():receiveAction(action);
        end

        if privateRoomInfo.isCreator then
            self:showToast("若15分钟内未开局，房间将自动解散");
        end
    end
end

-------------------------------------------------------------------------------------------------------
CommunityLogic.requestSendProxyMessage = function (self,cidlist,mtype,data)
    Log.d("CommunityLogic","requestSendProxyMessage","cidlist = ",cidlist,"data = ",data);
    CommunityIsolater.getInstance():requestSendProxyMessage(cidlist,mtype,data)
end

CommunityLogic.onGetProxyMessage = function(self,isSuccess,mtype,data)
    Log.d("CommunityLogic","onGetProxyMessage","isSuccess = ",isSuccess,"mtype = ",mtype,"data = ",data);
    if not isSuccess then 
        return;
    end 

    if mtype == ImSdkConstants.eProxyMessageType.ANSWER_FRIEND_REQUEST then --透传的回复好友信息
         self:handleProxyAnswerFriendApply(data);
    end 
end 
-------------------------------------------------------------------------------------------------------

CommunityLogic.showToast = function(self,msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

CommunityLogic.showSystemMsg = function(self,msg)
    if GameInfoIsolater.getInstance():isInMatchRoom() then
        local curState = MatchMechine.getInstance():getStates();
        if curState == MatchMechineConfig.STATUS_LOADING then 
            local chatInfo = {
                sendFlag = -1,
                msgInfo = msg,
            }
            MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_GET_CHAT_MSG, chatInfo);
        else
            self:showToast(msg);
        end 
    else
        self:showToast(msg);
    end
end

CommunityLogic.execDelegate = function(self,func,...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate, ...);
    end
end