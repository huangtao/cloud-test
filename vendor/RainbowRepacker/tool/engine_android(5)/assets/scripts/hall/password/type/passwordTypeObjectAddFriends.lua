require("hall/password/type/passwordTypeObject");
require("hall/gameData/txtMgr");
require("hall/userInfo/data/userInfoData");
require("hall/community/data/communityDataInterface");
require("hall/password/jump/jumpInterfaceMatchHall");

local PasswordTypeObjectAddFriends = class(PasswordTypeObject);

------------------------口令数据------------------------------
-- virtual 
PasswordTypeObjectAddFriends.generateData = function(self)
	local data = {
    	nick = kUserInfoData:getNickname(),
    	mid = kUserInfoData:getUserId(),
    	cid = kUserInfoData:getUserCid(),
    };
    return data;
end

-- virtual
PasswordTypeObjectAddFriends.analyseData = function(self, data)
	data.mid = tonumber(data.mid) or 0;
    data.nick = tostring(data.nick or "") or "";
    data.cid = tonumber(data.cid) or 0;
	return data;
end

------------------------口令弹框------------------------------
-- virtual
PasswordTypeObject.getTitle = function(self)
    return "好友口令";
end

-- virtual
PasswordTypeObjectAddFriends.getBtnText = function(self)
	return "立即参加比赛";
end

-- virtual
PasswordTypeObjectAddFriends.getMessage = function(self)
	local str = string.format("你接受了玩家%s(id:%s)的邀请加入游戏。玩牌也能赢大奖，快去看看吧~", self.m_data.nick, self.m_data.cid);
	return str;
end

-- virtual
PasswordTypeObjectAddFriends.getTips = function(self)
	return "TA已经在你的好友列表中，常联系啊~";
end

-- virtual
PasswordTypeObjectAddFriends.executeOnShow = function(self, obj, func, sourceType)
	JumpInterfaceMatchHall.getInstance();

	-- 自动加好友
    local msg = json.encode({add_friend_type = ImSdkConstants.eAddFriendType.AUTO});
    CommunityDataInterface.getInstance():requestAddFriend(self.m_data.cid, msg);
end

-- virtual
PasswordTypeObjectAddFriends.executeOnConfirm = function(self, obj, func, sourceType)
	-- enter match hall
    JumpInterfaceMatchHall.getInstance():enterMacthHallScene();

	-- callback
	if obj and func then
		func(obj);
	end 
end

-- virtual
PasswordTypeObjectAddFriends.executeOnClose = function(self)
	JumpInterfaceMatchHall.releaseInstance();
end

------------------------邀请弹框------------------------------
-- virtual
PasswordTypeObjectAddFriends.shareByWechat = function(self, password, isShareSwitchOpen)
    local text = self:_getShareContent(password);
    if not string.isEmpty(text) then
        PasswordDataInterface.getInstance():setTextToClipboard(text);
        WeixinShareUtil.getInstance():openWeiXin();
    end
end

-- virtual
PasswordTypeObjectAddFriends.shareByMessage = function(self, password, hasContact)
    local text = self:_getShareContent(password);
    return text;
end

------------------------------------private-----------------------------------------
PasswordTypeObjectAddFriends._getShareContent = function(self, password)
    local content = table.verify(TxtMgr.getInstance():getDescByKey("token_content_format"));
    local urlMap = table.verify(content.url);
    local region = kClientInfo:getRegionId();
    local url = urlMap[tostring(region) or ""] or "";

    local appName = RegionConfigDataInterface.getInstance():getRegionProductName();
    local addFriend = content.add_friends or "";
    local addFriendStr = string.gsub(addFriend, "{app}", appName);
    addFriendStr = string.gsub(addFriendStr, "{token}", string.format("约会口令%s", password or ""));
    addFriendStr = string.gsub(addFriendStr, "{url}", url);
    return addFriendStr;
end

PasswordTypeObjectAddFriends._getShowContent = function(self, password)
    local content = table.verify(TxtMgr.getInstance():getDescByKey("token_content_format"));
    local appName = RegionConfigDataInterface.getInstance():getRegionProductName();
    local gamePrefix = content.game_prefix or "";
    local gameSuffix = content.game_suffix or "";
    local gamePrefixStr = string.gsub(gamePrefix, "{app}", appName);
    local gameSuffixStr = string.gsub(gameSuffix, "{token}", password or "");
    return gamePrefixStr, gameSuffixStr;
end

return PasswordTypeObjectAddFriends;
