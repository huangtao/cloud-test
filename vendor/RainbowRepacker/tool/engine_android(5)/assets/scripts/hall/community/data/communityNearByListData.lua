require("gameData/gameData")

local CommunityNearByListData = class(GameData);

CommunityNearByListData.Delegate = {
    onGetNearByListCallBack = "onGetNearByListCallBack";
}

CommunityNearByListData.ctor = function(self)
    ImSdkHelper.getInstance():setObserver(self);
    self:init();
end

CommunityNearByListData.init = function (self)
    self.m_listBtnData = {};
    self.m_listData  = {};
end

CommunityNearByListData.dtor = function(self)
    ImSdkHelper.getInstance():clearObserver(self);
end

CommunityNearByListData.getNearByList = function(self, isForceUpdate,lat,lon)
    local ret = ImSdkConstants.eReturnType.TYPE_OK;
    if isForceUpdate then
       ret = ImSdkHelper.getInstance():imSdkGetNearByList(lat,lon,kUserInfoData:getUserCid());
    end
    
    local bRet = ret == ImSdkConstants.eReturnType.TYPE_OK and true or false;
    return bRet, Copy(self.m_listData);
end

CommunityNearByListData.getAddFriendBtnStatus = function (self,cid)
    local addFriend = false;
    for k,v in pairs(self.m_listBtnData) do
        if cid == v.cid then
            addFriend = v.addFriend;
            break;
        end
    end
    return addFriend;
end

CommunityNearByListData.setNearByAddFriendBtnStatus = function (self,data)
    if table.isEmpty(data) then
        return;
    end
    table.insert(self.m_listBtnData,data);   
end

CommunityNearByListData.refreshNearByAddFriendBtnStatus = function (self,cid)
    if not cid  then
        return;
    end
    for k,v in pairs(table.verify(self.m_listBtnData)) do
        if v.cid == cid then
            v.addFriend = false; 
        end
    end
end

CommunityNearByListData.onIMGetNearByListCallBack = function(self,isSuccess, strInfo) 
    if isSuccess then
        local data = json.decode(strInfo);
        if table.isEmpty(data) then
            return;
        end
        self.m_listData = {};
        for k, v in pairs( table.verify(data.user_list) ) do
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
            v.is_online = tonumber(v.is_online); --当前在线状态 1 为在线 0为不在线
            if v.is_friend  == 0 then
                 v.addFriend = self:getAddFriendBtnStatus(v.cid);
            end
            table.insert(self.m_listData,v);
        end
        self:execDelegate(CommunityNearByListData.Delegate.onGetNearByListCallBack, true, Copy(self.m_listData));
    else
        self:execDelegate(CommunityNearByListData.Delegate.onGetNearByListCallBack, false);
    end
end
        
return CommunityNearByListData;