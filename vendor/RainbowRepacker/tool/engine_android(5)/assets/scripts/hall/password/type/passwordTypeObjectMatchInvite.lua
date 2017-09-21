require("hall/password/type/passwordTypeObject");

local PasswordTypeObjectMatchInvite = class(PasswordTypeObject);

-- virtual 
PasswordTypeObjectMatchInvite.generateData = function(self)
    local info = table.verify(InvitationalDataInterface.getInstance():getCurMyMatchItemData());
    local data = {
        matchId = info.matchId,
    }
    return data
end

-- virtual
PasswordTypeObjectMatchInvite.analyseData = function(self, data)
    data.matchId = tonumber(data.matchId) or 0;
	return data;
end

-- virtual
PasswordTypeObjectMatchInvite.executeOnShow = function(self, obj, func, sourceType)
    if obj and func then
        func(obj);
    end

    StateMachine.getInstance():pushState(States.Invitational)
    InvitationalDataInterface.getInstance():enterMatch({code = self.m_data.matchId})
end

-- virtual
PasswordTypeObjectMatchInvite.shareByWechat = function(self, password, qrFileName)
    Log.v("PasswordTypeObjectMatchInvite.shareByWechat", password, qrFileName)
    local data = InvitationalDataInterface.getInstance():getCurMyMatchItemData()
    if not data or not password or not qrFileName then
        return
    end
    self:createShareLayer(data, qrFileName)
    self:offscreenRender()
end

PasswordTypeObjectMatchInvite.offscreenRender = function(self)
    if self.m_isScreening then
        return
    end
    self.m_isScreening = true
    local path = System.offscreenRender(self.m_shareLayer)
    if self.m_shareLayer then
        delete(self.m_shareLayer)
        self.m_shareLayer = self.m_shareLayer
    end
    if not string.isEmpty(path) then
        Clock.instance():schedule_once(function()
            Log.v("PasswordTypeObjectMatchInvite.offscreenRender====", path)
            self.m_isScreening = nil
            WeixinShareUtil.getInstance():weixinSendImage(path, false)
        end)
    end
end

--创建分享层
PasswordTypeObjectMatchInvite.createShareLayer = function(self, data, qrFileName)
    local InvitationalShare = require("hall/invitational/widget/invitationalShare")
    self.m_shareLayer = new(InvitationalShare)
    self.m_shareLayer:setName(kUserInfoData:getNickname())
    self.m_shareLayer:setTitle(data.matchName)
    self.m_shareLayer:setRoomId(data.matchId)
    self.m_shareLayer:setHead(data.headFileName)
    self.m_shareLayer:setQR(qrFileName)
end

-- virtual
PasswordTypeObjectMatchInvite.shareByQQ = function(self, password)
    local data = InvitationalDataInterface.getInstance():getCurMyMatchItemData()
    if not password or not data then
        return
    end
    local text = self:getQQShareContentText(data, password)
    PasswordDataInterface.getInstance():setTextToClipboard(text)
    WeixinShareUtil.getInstance():openQQ()
end

--获取分享内容
PasswordTypeObjectMatchInvite.getQQShareContentText = function(self, data, password)
    local appName = RegionConfigDataInterface.getInstance():getRegionProductName()
    local region = kClientInfo:getRegionId()
    local url = self:_getShareContent(password)
    local matchId = data.matchId or ""
    local token = "★"
    token = string.format("%s%s%s", token, password, token)
    return string.format("%s【邀请赛】比赛编号：%s，长按→复制这条消息，打开 %s 跟我一起玩！%s", appName, matchId, url, token)
end

-- virtual
PasswordTypeObjectMatchInvite.shareByQr = function(self, password)
    local wechatUrl = self:_getShareContent(password);
    return _, wechatUrl;
end

PasswordTypeObjectMatchInvite._getShareContent = function(self, password)
    local data = InvitationalDataInterface.getInstance():getCurMyMatchItemData()
    local url = InvitationalDataInterface.getInstance():getQcodeUrl() or ""
    local str = string.format("%s&matchid=%s", url, data and data.matchId or "");
    local urlWithPassword = PasswordDataInterface.getInstance():generateUrlWithPassword(str, password);
    return urlWithPassword;
end

return PasswordTypeObjectMatchInvite;
