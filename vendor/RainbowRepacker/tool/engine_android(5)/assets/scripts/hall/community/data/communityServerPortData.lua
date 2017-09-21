require("gameData/gameData")

local CommunityServerPortData = class(GameData);

CommunityServerPortData.s_maxDomainRequestCount = 10;
CommunityServerPortData.s_maxIpPortRequestCount = 3;

CommunityServerPortData.initData = function (self)
    self.m_localVersion = -1;
    self.m_domainList = {};
    self.m_dominIndex = 0;
    self.m_curRequestDomainCount = 0;
    self.m_curRequestIpPortCount = 0;
    self.m_friend_des = "";
end

CommunityServerPortData.ctor = function (self)
     EventDispatcher.getInstance():register(HttpModule.s_event,self,self.onHttpRequestCallBack);
     ImSdkHelper.getInstance():setObserver(self);
end

CommunityServerPortData.dtor = function (self)
    self:__cleanUpTimer();
    EventDispatcher.getInstance():unregister(HttpModule.s_event,self,self.onHttpRequestCallBack);
    ImSdkHelper.getInstance():clearObserver(self);
end

CommunityServerPortData.__getDefaultImDomain = function(self)
    if NETWORK_TYPE == NETWORK_TYPE_TEST then--测试环境
        return "http://192.168.200.21/dfqp/index.php?action=externals.imdir";

    elseif NETWORK_TYPE == NETWORK_TYPE_PREPUBLISH then ----预发布环境
        return "http://pcususus01.ifere.com/ddfqp/index.php?action=externals.imdir";
        
    else

        return "http://mvsnspus01.ifere.com/ddfqp/index.php?action=externals.imdir";
    end
end

CommunityServerPortData.requestFriendDes = function(self, friend_des)
    self.m_isImLoginSuccess = false;
    self.m_friend_des = friend_des or self.m_friend_des;
    self:requestImDomain(friend_des)
    self:__requestIpAndPort(self:__getImDomain());
end

--@brief 请求域名地址
--@param friend_des:密匙
CommunityServerPortData.requestImDomain = function(self, friend_des)
    --self.m_isImLoginSuccess = false;
    --self.m_friend_des = friend_des or self.m_friend_des;

    if table.isEmpty(self.m_domainList) or not self.m_isTouched then
        local param = {
            ["cli_ver"] = self:getLocalVersion();
        };
        OnlineSocketManager.getInstance():sendMsg(PHP_GET_EXTERNAL_IMDOMAIN, param );
    end
    
    --self:__requestIpAndPort(self:__getImDomain());
end

--@brief 获取域名回调
CommunityServerPortData.onGetImDomainCallBack = function(self, isSuccess, info)
    Log.v("CommunityServerPortData,onGetImDomainCallBack", "info = ", info);

    if isSuccess and not table.isEmpty(info) then 
        self.m_curRequestDomainCount = 0;
        self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.data);
    else
        self.m_curRequestDomainCount = number.valueOf(self.m_curRequestDomainCount) + 1;
        if self.m_curRequestDomainCount <= CommunityServerPortData.s_maxDomainRequestCount then
            self:requestImDomain(self.m_friend_des);
        else
            Log.v("CommunityServerPortData.onGetImDomainCallBack 获取域名失败");
        end
    end   
end

--@brief 请求 ip、port
CommunityServerPortData.__requestIpAndPort = function(self,url)
    Log.v("CommunityServerPortData.__requestIpAndPort","url = ", url , " self.m_isImLoginSuccess = ", self.m_isImLoginSuccess); 

    if not self.m_isImLoginSuccess then
        local param = { cid = kUserInfoData:getUserCid() };
        HttpModule.getInstance():setUrl(HttpModule.s_cmds.GetPortId, url);
        HttpModule.getInstance():execute(HttpModule.s_cmds.GetPortId, param);
    end
end

--@brief 获取ip、port信息回调
CommunityServerPortData.onGetPortIdkCallBack = function(self, isSuccess, data)
    Log.v("CommunityServerPortData.onGetPortIdkCallBack","isSuccess = ",isSuccess,"data =",data)
    if isSuccess and not table.isEmpty(data) and not table.isEmpty(data.result) then
        self.m_curRequestIpPortCount = 0;
        self.m_ip  = GetStrFromJsonTable(data.result, "ip", "");
        self.m_port = GetNumFromJsonTable(data.result, "port", 0);

        Log.v("ip = ", self.m_ip, " port = ", self.m_port);
        self:__initImSdk(self.m_ip, self.m_port);
    else
        self.m_curRequestIpPortCount = number.valueOf(self.m_curRequestIpPortCount) + 1;
        if self.m_curRequestIpPortCount <= CommunityServerPortData.s_maxIpPortRequestCount then
            self:__requestIpAndPort(self:__getImDomain());
        else
            Log.v("CommunityServerPortData.onGetPortIdkCallBack 获取ip port 失败");
        end
    end
end

--@brief 初始化ImSdk
CommunityServerPortData.__initImSdk = function (self, ip, port)
    local result = ImSdkHelper.getInstance():imSdkInit(ip, port, self:__getDBAndAudioPath());
    --初始化接口 0代表成功 其他代表失败
    if result ~= 0 then
        self:__reInitImSdk();
    end
end

CommunityServerPortData.isImLoginSuccess = function (self)
    return self.m_isImLoginSuccess
end

--@brief 初始化回调 请求登入
CommunityServerPortData.onIMInitCallBack = function (self, isSuccess)
    if isSuccess then
        self:__requestImSdkLogin();
    end
end

CommunityServerPortData.__reInitImSdk = function(self)
    Log.v("CommunityServerPortData.__reInitImSdk");

    self:__cleanUpTimer();
    self.m_timer = AnimFactory.createAnimInt(kAnimNormal, 0, 1 ,60000, 0);
    self.m_timer:setDebugName("CommunityServerPortData|__reInitImSdk");
    self.m_timer:setEvent(self, function(self)
        self:__cleanUpTimer();
        self:__initImSdk(self.m_ip, self.m_port);
    end );
end

--@brief 请求imsdk登录
CommunityServerPortData.__requestImSdkLogin = function(self)
    Log.v("__requestImSdkLogin", " self.m_friend_des = ", self.m_friend_des,"location = ",location);
    local lat, lon = CommunityDataInterface.getInstance():getCurrentLocation();
    ImSdkHelper.getInstance():imSdkLogin(kUserInfoData:getUserCid(), self.m_friend_des, kGameManager:getGameVersion(States.Hall), lat, lon);
end

--@brief 登录成功回调
CommunityServerPortData.onIMLoginCallBack = function(self)
    Log.v("onIMLoginCallBack");
    self.m_isImLoginSuccess = true;
end

CommunityServerPortData.__cleanUpTimer = function (self)
    delete(self.m_timer);
    self.m_timer = nil;
end

CommunityServerPortData.showNoticeView = function (self,msg)
    Toast.getInstance():showTextView(msg,width or 640, height or 60,kAlignCenter,"",30,200,175,115);
end

--@获取域名
CommunityServerPortData.__getImDomain = function(self)
    if not table.isEmpty(self.m_domainList) then
        self.m_dominIndex = number.valueOf(self.m_dominIndex)%(#self.m_domainList) + 1;
        return self.m_domainList[self.m_dominIndex];
    else
        return self:__getDefaultImDomain();
    end
end

--@brief 根据用户cid来获取db和audio存储路径
CommunityServerPortData.__getDBAndAudioPath = function(self)
    local userCid = kUserInfoData:getUserCid();
    local dbPath = System.getStorageUserPath()..userCid..".db";
    local audioPath = System.getStorageAudioPath()..userCid.."/";
    return dbPath, audioPath;
end 

CommunityServerPortData.loadDictData = function(self, dict)
    local networkType = dict:getInt("NETWORK_TYPE", NETWORK_TYPE_ONLINE); --默认为正式环境
    if networkType == NETWORK_TYPE then
        --环境相同
        self.m_localVersion = dict:getInt("version", -1);
        local strData = dict:getString("domainList") or "";
        local data = json.decode(strData);
        if table.isTable(data) then
            self.m_domainList = data;
        end
    else
        --环境不相同
        self.m_localVersion = -1;
        self.m_domainList = {};
    end
end

CommunityServerPortData.saveDictData = function(self, dict)
    dict:setInt("version", self:getLocalVersion() );
    dict:setInt("NETWORK_TYPE", NETWORK_TYPE);
    local domainList = json.encode(self.m_domainList) or {};
    if domainList then
        dict:setString("domainList", domainList);
    end
end

CommunityServerPortData.getLocalVersion = function(self)
    return self.m_localVersion or -1;
end

CommunityServerPortData.updateMemData = function(self, serverVersion, data)
    if table.isEmpty(data) then
        return;
    end

    self.m_localVersion = serverVersion;
    self.m_domainList = table.verify(data);

    self:__requestIpAndPort(self:__getImDomain());
end

CommunityServerPortData.getLocalDictName = function(self)
    return "CommunityServerPortData";
end

CommunityServerPortData.onHttpRequestCallBack = function(self,command,...)
    if CommunityServerPortData.s_httpRequestCallBackFuncMap[command] then
        CommunityServerPortData.s_httpRequestCallBackFuncMap[command](self,...);
    end 
end

CommunityServerPortData.s_socketCmdFuncMap = {
    [PHP_GET_EXTERNAL_IMDOMAIN] = CommunityServerPortData.onGetImDomainCallBack;
};

CommunityServerPortData.s_httpRequestCallBackFuncMap = {
    [HttpModule.s_cmds.GetPortId] = CommunityServerPortData.onGetPortIdkCallBack;
};

return CommunityServerPortData;