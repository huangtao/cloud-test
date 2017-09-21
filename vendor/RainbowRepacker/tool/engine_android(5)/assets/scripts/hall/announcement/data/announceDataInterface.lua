require("gameData/dataInterfaceBase");

AnnounceDataInterface = class(DataInterfaceBase);
AnnounceDataInterface.s_maxRequestStopServerCount = 1;
AnnounceDataInterface.eStatusType = {
   PRORUPTION = 0; --突发性停服
   PLAN = 1;       --计划性停服
}

AnnounceDataInterface.eConfig = {
    [AnnounceDataInterface.eStatusType.PRORUPTION] = {
      title  = "紧急停服公告",
      content = "因为运营商机房故障，导致部分玩家登录异常或支付失败，对此我们深表歉意。为了充分保障大家的账户安全，我们决定进行紧急停服维护。有任何疑问，请致电官方客服"
    };
    [AnnounceDataInterface.eStatusType.PLAN] = {
      title = "停服维护公告",
      content = "为了给您提供更好的游戏体验，我们决定进行停服维护。在停服维护期间游戏将无法登陆，还请各位玩家谅解。有任何疑问，请致电官方客服"
    };
}

--弹出公告
AnnounceDataInterface.Delegate = {
    refreshAnnouncement = "refreshAnnouncement";
    onStopServerCallBack = "onStopServerCallBack";
};

AnnounceDataInterface.getInstance = function(self)
    if not AnnounceDataInterface.s_instance then
        AnnounceDataInterface.s_instance = new(AnnounceDataInterface);
    end

    return AnnounceDataInterface.s_instance;
end 

AnnounceDataInterface.ctor = function(self)
    self.m_announceData = new(require("hall/announcement/data/announceData"), self); 
    EventDispatcher.getInstance():register(HttpModule.s_event,self,self.onHttpRequestCallBack);
    self.m_curRequestStopServerCount = 0;
end

AnnounceDataInterface.dtor = function(self)
    ImageCache.getInstance():cleanRef(self);
    delete(self.m_announceData);
    self.m_announceData = nil;
    EventDispatcher.getInstance():unregister(HttpModule.s_event,self,self.onHttpRequestCallBack);
end

--获取弹出公告信息
AnnounceDataInterface.getAnnounceData = function(self)
    self.m_announceData:getAnnounce();
end

--通知弹出公告更新
AnnounceDataInterface.refreshAnnouncement = function(self,announceData)
    Log.i("AnnounceDataInterface.refreshAnnouncement","announceData = ",announceData);
    if kLoginDataInterface:getIsStopServer() then
        --停服时，不弹公告
        return;
    end

    --如果是图片公告确保已经下载好图片再推送出去。
    local is_html = number.valueOf(announceData.is_html)
    if is_html == 2 then
        local content = announceData.content;
        if not content then
            return nil;
        end

        local __info =  json.decode(content);
        local __imagePath = __info.htmlpic;

        ImageCache.getInstance():request(__imagePath, self, self.__onImageDownloaded,announceData);
    else
        self:notify(AnnounceDataInterface.Delegate.refreshAnnouncement,table.verify(announceData));
    end
    
end

--图片下载成功后再推送数据
AnnounceDataInterface.__onImageDownloaded = function(self,url,fileName,announceData)
    self:notify(AnnounceDataInterface.Delegate.refreshAnnouncement,table.verify(announceData));
end

AnnounceDataInterface.getAnnounceShowData = function (self)
    self.m_announceData:getAnnounceShowData();
end

AnnounceDataInterface.isShowed = function (self)
    return self.m_announceData:isShowed();
end

AnnounceDataInterface.isEmpty = function(self)
    return self.m_announceData:isEmpty();
end

AnnounceDataInterface.clear = function(self)
    self.m_announceData:clear();
end

AnnounceDataInterface.insertTemporaryData = function(self,data)
    self.m_announceData:insertTemporaryData(data);
end

--判断php是否回复了请求
AnnounceDataInterface.hasPhpResponsed = function(self)
    Log.v("AnnounceDataInterface.hasPhpResponsed");
    return self.m_curRequestStopServerCount >= 1 and true or false;
end

AnnounceDataInterface.onSocketClosed = function (self, packetInfo)
    Log.v("AnnounceDataInterface.onSocketClosed", "packetInfo = ", packetInfo);
    if packetInfo.socket_close_type == OnlineSocketManager.getInstance():getServerCloseSocketTypeValue() then
        --server主动断开连接
        self:requestStopServer(AnnounceDataInterface.eStatusType.PRORUPTION);
    end
end

--请求停服公告信息
AnnounceDataInterface.requestStopServer = function(self, type, param)
    Log.v("AnnounceDataInterface.requestStopServer","type = ",type);
    if self.m_curRequestStopServerCount < AnnounceDataInterface.s_maxRequestStopServerCount then
        self.m_requestParam = param;
        local url = "https://notice01.ifere.com/notice.php?p=nice&a="..kUserInfoData:getAppId().."&t="..type;
        HttpModule.getInstance():setUrl(HttpModule.s_cmds.AnnouncementStopServer,url);
        HttpModule.getInstance():execute(HttpModule.s_cmds.AnnouncementStopServer);
    end
end

--停服公告信息回调
AnnounceDataInterface.onStopServerCallBack = function (self, isSuccess, data)
    Log.v("AnnounceDataInterface.onStopServerCallBack","isSuccess = ",isSuccess,"data = ",data);
    if  isSuccess and not table.isEmpty(data) then
        self.m_curRequestStopServerCount = number.valueOf(self.m_curRequestStopServerCount) + 1;

        if GetNumFromJsonTable(data, "code", 0) == -1 then
            --data.code 存在值，则代表没有停服(默认返回值为-1)
            if LoginDataInterface.getInstance():getLoginState() ~= LoginConstants.eLoginState.PhpKickout then
                self:notify(AnnounceDataInterface.Delegate.onStopServerCallBack,false, nil, self.m_requestParam);
            end
        else
            local temp = {};
            temp.type = GetNumFromJsonTable(data, "type", AnnounceDataInterface.eStatusType.PRORUPTION);
            temp.title = GetStrFromJsonTable(data, "title", "");
            temp.content = GetStrFromJsonTable(data, "content", "");

            local defaultInfo = AnnounceDataInterface.eConfig[temp.type] or {};
            if string.isEmpty(temp.title) then
                temp.title = defaultInfo.title or temp.title;
            end

            if string.isEmpty(temp.content) then
                temp.content = defaultInfo.content or temp.content;
            end

            self.m_serverStopAnnounceInfo = temp;

            kLoginDataInterface:setLoginState(LoginConstants.eLoginState.ServerStop);
            self:notify(AnnounceDataInterface.Delegate.onStopServerCallBack, true, self.m_serverStopAnnounceInfo, self.m_requestParam);
        end
    else
        self:notify(AnnounceDataInterface.Delegate.onStopServerCallBack,false, nil, self.m_requestParam);
    end
end

AnnounceDataInterface.getServerStopAnnounceInfo = function(self)
    return self.m_serverStopAnnounceInfo;
end

AnnounceDataInterface.onHttpRequestCallBack = function(self,command,...)
    if AnnounceDataInterface.s_httpRequestCallBackFuncMap[command] then
        AnnounceDataInterface.s_httpRequestCallBackFuncMap[command](self,...);
    end 
end

AnnounceDataInterface.s_httpRequestCallBackFuncMap = {
    [HttpModule.s_cmds.AnnouncementStopServer] = AnnounceDataInterface.onStopServerCallBack,
};


AnnounceDataInterface.s_socketCmdFuncMap = {
    [SOCKET_USER_CLOSED] = AnnounceDataInterface.onSocketClosed;
}
