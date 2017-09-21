require("gameData/gameData")

local CommunityKnowListData = class(GameData);

CommunityKnowListData.Delegate = {
    onGetKnowListCallBack = "onGetKnowListCallBack";
    onGetMaybeFamiliarCallBack = "onGetMaybeFamiliarCallBack";
}

CommunityKnowListData.ctor = function(self)
    ImSdkHelper.getInstance():setObserver(self);
    self:__init();
end

CommunityKnowListData.__init = function (self)
    self.m_listInviteData = {};
    self.m_listAddFiendData = {};
    self.m_knowListData = {};
end

CommunityKnowListData.dtor = function(self)
    ImSdkHelper.getInstance():clearObserver(self);
end

CommunityKnowListData.getKnowList = function(self, isForceUpdate)
    local ret = ImSdkConstants.eReturnType.TYPE_OK;
    if isForceUpdate then
        local data = ImSdkHelper.getInstance():imGetContractsInfo();
        if not string.isEmpty(data) then
            ret = ImSdkHelper.getInstance():imSdkGetKnowList(data, kUserInfoData:getUserCid());
        else
            ret = ImSdkConstants.eReturnType.TYPE_ERROR;
        end
    end

    local bRet = ret == ImSdkConstants.eReturnType.TYPE_OK and true or false;
    return bRet, Copy(self.m_knowListData);
end

CommunityKnowListData.getKnowInviteBtnStatus = function (self,phone_number)
    local invite = false;
    for k,v in pairs(self.m_listInviteData) do
        if phone_number == v.phone_number then
            invite = v.invite;
            break;
        end
    end
    return invite;
end

CommunityKnowListData.setKnowInviteBtnStatus = function (self,data)
    if table.isEmpty(data) then
        return;
    end
    
    table.insert(self.m_listInviteData,data); 
    for k, v in pairs( table.verify(self.m_knowListData)) do  
        if data.phone_number == v.phone_number then
            self.m_knowListData[k].invite = data.invite;
            break;
        end
    end  
end

CommunityKnowListData.getKnowAddFriendBtnStatus = function (self,cid)
    Log.v("m_listAddFiendData",self.m_listAddFiendData)
    local addFriend = false;
    for k,v in pairs(self.m_listAddFiendData) do
        if cid == v.cid then
            addFriend = v.addFriend;
            break;
        end
    end
    return addFriend;
end

CommunityKnowListData.setKnowAddFriendBtnStatus = function (self,data)
    if table.isEmpty(data) then
        return;
    end
    table.insert(self.m_listAddFiendData,data); 
    for k, v in pairs( table.verify(self.m_knowListData)) do  
        if data.cid == v.cid then
            self.m_knowListData[k].addFriend = data.addFriend;
            break;
        end
    end
end

CommunityKnowListData.refreshKnowAddFriendBtnStatus = function (self,cid)
    if not cid  then
        return;
    end
    for k,v in pairs(table.verify(self.m_listAddFiendData)) do
        if v.cid == cid then
            self.m_listAddFiendData[k].addFriend = false; 
            self.m_listAddFiendData[k].is_friend = 0; 
        end
    end
    for k,v in pairs(table.verify(self.m_knowListData)) do
        if v.cid == cid then
            self.m_knowListData[k].addFriend = false; 
            self.m_knowListData[k].is_friend = 0; 
        end
    end
end


--联系人 分页发送 每页15个
CommunityKnowListData.onIMMatchContactFriendCallBack = function(self,isSuccess, strInfo) 
    if isSuccess then
        local data = table.verify( json.decode(strInfo) );
        if data.page == 1 then   --如果当前第一也 就清空
            self.m_knowListData = {};
        end
        for k, v in pairs( table.verify(data.contact_list) ) do
            v.phone_number = string.gsub(tostring(v.phone_number), " ","");  --手机号
            v.phone_number = string.gsub(tostring(v.phone_number), "-","");  --手机号
            v.name = tostring(v.name) --名字
            v.regist_status = tonumber(v.regist_status)--注册状态
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
            v.is_friend = tonumber(v.is_friend)or 0; -- 是否是好友
            v.level = tonumber(v.level) or 0; --根据类型排名
            v.master_points = tonumber(v.master_points) or 0; --大师分
            v.experience = tonumber(v.experience) or 0; --经验
            v.is_online = tonumber(v.is_online); --当前在线状态 1 为在线 0为不在线
            if v.regist_status == 0 then
                v.invite = self:getKnowInviteBtnStatus(v.phone_number);
            end
            if v.is_friend == 0 then
                v.addFriend = self:getKnowAddFriendBtnStatus(v.cid);
            end
            table.insert(self.m_knowListData,v);
        end
        self:execDelegate(CommunityKnowListData.Delegate.onGetKnowListCallBack, true, self.m_knowListData,data.page);
    else
        self:execDelegate(CommunityKnowListData.Delegate.onGetKnowListCallBack, false);
    end
end
        

CommunityKnowListData.onIMGetMaybeFamiliarCallBack = function(self,isSuccess, strInfo) 
    if isSuccess then
        local data = json.decode(strInfo);
        local mayBeFamiliarData = {};
        for k,v in pairs(table.verify(data)) do
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
            v.common_friend_num = tonumber(v.common_friend_num);--共同好友数
            table.insert(mayBeFamiliarData,v);
        end

        if table.isEmpty( mayBeFamiliarData[1] ) then
            self:execDelegate(CommunityKnowListData.Delegate.onGetMaybeFamiliarCallBack, false);
        else
            self:execDelegate(CommunityKnowListData.Delegate.onGetMaybeFamiliarCallBack, true, mayBeFamiliarData[1]);
        end
    else
        self:execDelegate(CommunityKnowListData.Delegate.onGetMaybeFamiliarCallBack, false);
    end
end

return CommunityKnowListData;