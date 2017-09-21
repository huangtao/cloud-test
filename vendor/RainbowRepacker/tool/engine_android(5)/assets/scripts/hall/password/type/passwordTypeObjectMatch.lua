require("hall/password/type/passwordTypeObject");
require("hall/password/jump/jumpInterfaceMatchHall");
require("hall/userInfo/data/userInfoData");
require("hall/gameData/share/shareDataInterface");
require("hall/matchHall/gameMatchHall/data/matchHallDataInterface")

local PasswordTypeObjectMatch = class(PasswordTypeObject);

------------------------口令弹框------------------------------
-- virtual
PasswordTypeObjectMatch.executeOnShow = function(self, obj, func, sourceType)
    if obj and func then
        func(obj);
    end

    if not table.isEmpty(self.m_data) then
        local matchId = tonumber(self.m_data.code) or 0;

        if MatchHallDataInterface.getInstance():checkInvitationalById(matchId) then
            StateMachine.getInstance():pushState(States.Invitational)
            InvitationalDataInterface.getInstance():enterMatch({code = matchId})
        else    
            JumpInterfaceMatchHall.getInstance():enterMacthHallScene(matchId);
            JumpInterfaceMatchHall.releaseInstance();
        end
    end
end

------------------------邀请弹框------------------------------
-- virtual
PasswordTypeObjectMatch.shareByWechat = function(self, password, shareEntry, rewardlist)
    local wechatData = table.verify(self:_getShareContentWechat(password, shareEntry, rewardlist));
    if not table.isEmpty(wechatData) then
        WeixinShareUtil.getInstance():weixinSendWebPageWithPassword(wechatData.password, wechatData.url, wechatData.title, wechatData.desc, wechatData.share_icon, false);
    end
end

------------------------------------private-----------------------------------------
PasswordTypeObjectMatch._getShareContentWechat = function(self, password, shareEntry, rewardlist)
    local matchData = MatchHallDataInterface.getInstance():getMatchData();
    local title, desc = self:_getWeChatDesc(matchData, rewardlist);
    local weiChatInfo = ShareDataInterface.getInstance():getWeiXinChatInfo();
    local data = {};
    if table.isTable(weiChatInfo) then
        data.url = self:_getFreindUrl(shareEntry, matchData, rewardlist);
        data.desc       = desc or weiChatInfo.desc or "";
        data.title      = title or weiChatInfo.title or "";
        data.share_icon = weiChatInfo.share_icon or "";
        data.password = password;
    end
   
    Log.d("PasswordTypeObjectMatch._getShareContentWechat", data.url, data.title, data.desc);
    return data;
end

PasswordTypeObjectMatch._getFreindUrl = function (self, shareEntry, matchData, rewardlist)
    local mid = kUserInfoData:getUserId();
    local nickName = kUserInfoData:getNickname();
    local sex = kUserInfoData:getSex();
    local rewardDesc = self:_getChampionRewardDesc(rewardlist);

    local wechatUrl = string.format("%sindex.php?action=h5.match", ServerConfig.getInstance():getHostUrl() or "");
    if not string.isEmpty(wechatUrl) then
        local urlParam = {
            shareEntry = shareEntry,
            nickName = nickName,
            configId = matchData.configid or 0,
            matchName = matchData.name or "",
            sex = sex,
            rewardDesc = rewardDesc,
            matchId = matchData.id or 0,
        }

        for k, v in pairs(urlParam) do
            if k and v then
                local strFormat = "%s&%s=%s";
                if string.endsWith(wechatUrl, "?") then
                    strFormat = "%s%s=%s"
                end
                wechatUrl = string.format(strFormat, wechatUrl, string.valueOf(k), string.valueOf(v));
            end
        end
    end

    return wechatUrl;
end



PasswordTypeObjectMatch._getWeChatDesc = function(self, matchData, rewardlist)
    local title = "我刚报名了"..(matchData.name or "").."，快来和我一起比赛拿大奖吧！";
    local str = "冠军大奖为"..(self:_getChampionRewardDesc(rewardlist) or "").."，和我一起向大奖冲击吧！";

    return title, str;
end

PasswordTypeObjectMatch._getChampionRewardDesc = function (self, rewardlist)
    local str = "";
    if not table.isEmpty(rewardlist) then
        str = rewardlist[1].desc;
    end
    return str;
end

return PasswordTypeObjectMatch;
