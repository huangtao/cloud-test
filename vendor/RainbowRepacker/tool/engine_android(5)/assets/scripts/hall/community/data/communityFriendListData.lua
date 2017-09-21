require("gameData/gameData")
require("hall/community/imSdk/imSdkHelper");

local CommunityFriendListData = class(GameData);

CommunityFriendListData.Delegate = {
    onGetFriendListCallBack = "onGetFriendListCallBack";
    onGetFriendsInviteList = "onGetFriendsInviteList";
}

CommunityFriendListData.ctor = function(self)
    ImSdkHelper.getInstance():setObserver(self);
end

CommunityFriendListData.dtor = function(self)
    ImSdkHelper.getInstance():clearObserver(self);
end

CommunityFriendListData.initData = function(self)
    self.m_friendListData = {};
    self.m_isTouched = false;
    self.m_rankType = "在线";
    self.m_isFriendMap = {};
end

--@brief 获取好友列表
CommunityFriendListData.getFriendList = function(self, isForceUpdate,rankType)
    local ret = ImSdkConstants.eReturnType.TYPE_OK;
    if isForceUpdate then
        ret = ImSdkHelper.getInstance():imSdkGetFriendList( kUserInfoData:getUserCid() );
    end

    if self.m_rankType ~= rankType then
        self:__sortWithType(rankType,self.m_friendListData);
        self.m_rankType = rankType;
    end
    
    local bRet = ret == ImSdkConstants.eReturnType.TYPE_OK and true or false;
    return Copy(self.m_friendListData), bRet;
end

--@brief 获取好友列表回调
CommunityFriendListData.onIMGetFriendListCallBack = function(self, isSuccess, strInfo)
    self:onIMPushFriendListCallBack(isSuccess, strInfo);
end

--@brief  推送好友列表
CommunityFriendListData.onIMPushFriendListCallBack = function(self, isSuccess, strInfo)
    Log.d("CommunityFriendListData.onIMPushFriendListCallBack","isSuccess = ",isSuccess);
    if isSuccess then
        self.m_friendListData = {};
        local data = table.verify( json.decode(strInfo) );
        self:__sortWithType(self.m_rankType, table.verify(data.friend_list));
        for k, v in pairs( table.verify(data.friend_list) ) do
            table.insert(self.m_friendListData, self:__formatFriendInfo(v) );
            self.m_isFriendMap[v.cid] = self:__formatFriendInfo(v);
        end
        self:execDelegate(CommunityFriendListData.Delegate.onGetFriendListCallBack, true, Copy(self.m_friendListData) ,self.m_rankType);
        self:saveData();
    else
        self:execDelegate(CommunityFriendListData.Delegate.onGetFriendListCallBack, false);
    end
end

--@brief 推送好友上下线消息
--@上下线通知插入内存中
CommunityFriendListData.onIMPushFriendOnlineStatusCallBack = function(self,isSuccess,strData)
    if isSuccess then
        local data = table.verify( json.decode(strData) );
        local item = table.verify( data[1] );
        for k,v in pairs(self.m_friendListData) do
            if item.friend_cid == v.cid then
                v.is_online = item.offline;
            end
        end
        self:__sortWithType(self.m_rankType,self.m_friendListData);
        self:execDelegate(CommunityFriendListData.Delegate.onGetFriendListCallBack, true, Copy(self.m_friendListData),self.m_rankType);
    end
end


--@brief 删除好友 -> DB
--@step 1: remove friend from self.m_friendListData
--      2: remove friend from db
--      3: notify refresh ui
CommunityFriendListData.localDeleteFriendFromList = function(self, friend_cid)
    if not friend_cid then
        return;
    end

    local isDone = false;
    for k, v in pairs(self.m_friendListData) do
        if tonumber(v.cid) == friend_cid then
            table.remove(self.m_friendListData, k);
            self.m_isFriendMap[v.cid] = nil;
            isDone = true;
            break;
        end
    end

    ImSdkHelper.getInstance():imDeleteLocalFriendInfo(friend_cid, kUserInfoData:getUserCid() );

    if isDone then
        self:execDelegate(CommunityFriendListData.Delegate.onGetFriendListCallBack, true, Copy(self.m_friendListData),self.m_rankType);
    end
end

--@brief 添加好友 -> DB
CommunityFriendListData.localAddFriendToFriendList = function(self, friend_cid, friendInfo)
    Log.d("CommunityFriendListData.localAddFriendToFriendList","friend_cid = ",friend_cid);
    if not friend_cid or table.isEmpty(friendInfo) then
        return;
    end

    if self:isFriend(friend_cid) then
        return;
    end

    local newFriendInfo = self:__formatFriendInfo(friendInfo);
    table.insert(self.m_friendListData, newFriendInfo);
    self.m_isFriendMap[friend_cid] = newFriendInfo;
    Log.d("CommunityFriendListData.localAddFriendToFriendList ==> imAddLocalFriendInfo");
    ImSdkHelper.getInstance():imAddLocalFriendInfo(json.encode(newFriendInfo),kUserInfoData:getUserCid()); 
    self:__sortWithType(self.m_rankType,self.m_friendListData);
    self:execDelegate(CommunityFriendListData.Delegate.onGetFriendListCallBack, true, Copy(self.m_friendListData),self.m_rankType); 
end

CommunityFriendListData.__formatFriendInfo = function(self, v)
    v.cid = tonumber(v.cid) or 0; --cid
    v.mid = tonumber(v.mid) or 0; --mid
    v.regionid = tonumber(v.regionid) or 0; -- 地区id
    v.nickname = tostring(v.nickname) or ""; --昵称
    v.sex = tostring(v.sex) or "0"; --性别
    v.avatar_url = tostring(v.avatar_url) or "";
    v.gold = tonumber(v.gold) or 0; --银币
    v.diamond = tonumber(v.diamond) or 0; --钻石
    v.distance = tonumber(v.distance) or 0;-- 离我多远
    v.client_version = tonumber(v.client_version) or 0; --sdk版本号
    v.is_friend = tonumber(v.is_friend)or o; -- 是否是好友
    v.level = tonumber(v.level) or 0; --根据类型排名
    v.master_points = tonumber(v.master_points) or 0; --大师分
    v.experience = tonumber(v.experience) or 0; --经验
    v.is_online = tonumber(v.is_online) or 0; --当前在线状态 1 为在线 0为不在线
    v.city   = tostring(v.city) or ""; --城市
    v.is_vip  = tonumber(v.is_vip) or 0;           --是否vip 
    return v;
end


CommunityFriendListData.friendListSort = function (self,type) --好友排序
    self.m_rankType = type;
    self:__sortWithType(type,self.m_friendListData);
    self:execDelegate(CommunityFriendListData.Delegate.onGetFriendListCallBack, true, Copy(self.m_friendListData),type); 
end

--@brief 根据类型排序
CommunityFriendListData.__sortWithType = function (self,type,data) 
    if type == "在线" then
        table.sort(data, function(a, b)
            if a and b then
                return a.is_online > b.is_online;
            end
        end);
    elseif type == "银币" then
        table.sort(data, function(a, b)
            if a and b then
                return a.gold > b.gold;        
            end
        end);    
    elseif type == "钻石" then
        table.sort(data, function(a, b)
            if a and b then
                return a.diamond > b.diamond;
            end
        end);
    elseif type == "经验" then 
        table.sort(data, function(a, b)
            if a and b then
                return a.experience > b.experience;
            end
        end);   
    elseif type == "等级" then
        table.sort(data, function(a, b)
            if a and b then
                return a.level > b.level;
            end 
        end);
    elseif type == "大师分"  then
        table.sort(data, function(a, b)
            if a and b then
                return a.master_points > b.master_points;
            end
        end);            
    end
end

--@brief 判断是否是好友
CommunityFriendListData.isFriend = function (self,cid)
    if not cid then
        return;
    end
    Log.d("CommunityFriendListData.isFriend","self.m_isFriendMap = ",self.m_isFriendMap);
    return not table.isEmpty(self.m_isFriendMap[cid]) and true or false;
end

--@brief 获取好友信息
CommunityFriendListData.getFriendDataByCid = function(self, cid)
    if not cid then
        return {};
    end

    for k, v in pairs(self.m_friendListData) do
        if v.cid == cid then
            return Copy(v);
        end
    end

    return {};
end

--@brief 获取在线好友数 
CommunityFriendListData.requestFriendsInviteList = function (self, num)
    if table.isEmpty(self.m_friendListData) then
        self:execDelegate(CommunityFriendListData.Delegate.onGetFriendsInviteList, true, {});
        return;
    end

    local data = {};
    local total  = number.valueOf(num,20);
    local count  = 0;
    for k,v in pairs(self.m_friendListData) do
        if v.is_online > 0 then
           data[k] = {nick = tostring(v.nickname) or "",mid = tonumber(v.mid) or 0,cid = tonumber(v.cid) or tonumber(v.mid)};
           count = count + 1;
           if count >= total then
                break;
           end
        end
    end
    self:execDelegate(CommunityFriendListData.Delegate.onGetFriendsInviteList, true, data); 
end

CommunityFriendListData.getFriendListOffline = function (self)
    local data = {};
    for k,v in pairs(table.verify(self.m_friendListData)) do
        if v.is_online <= 0 then
            local cid = tonumber(v.cid) or tonumber(v.mid)
            data[cid] = {nick = tostring(v.nickname) or "",};
        end
    end
    return data;
end

CommunityFriendListData.loadDictData = function(self, dict)
	local strFriendListData = dict:getString("friendListData");
	local friendListData = json.decode(strFriendListData);
	if table.isTable(friendListData) then
		self.m_friendListData = friendListData;
	end
end

CommunityFriendListData.saveDictData = function(self, dict)
	dict:setString("friendListData", json.encode(self.m_friendListData) or "");
end

CommunityFriendListData.getLocalDictName = function(self)
	self.m_userCid = self.m_userCid or kUserInfoData:getUserCid();
	return "CommunityFriendListData" .. self.m_userCid;
end

return CommunityFriendListData;