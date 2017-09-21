require("core/object");
require("core/dict");
require("common/httpFileGrap");
require("globalConfig");
require("gameData/dataInterfaceBase");
require("core/eventDispatcher");

ServerConfig = class(DataInterfaceBase);

-------------------------------------------------------------
ServerConfig.s_dictName = "ServerConfig"; --serverConfig dict名称
ServerConfig.s_dict_config = "config";    --ip、port配置
ServerConfig.s_dict_cdn = "cdn";          --cdn配置
ServerConfig.s_dict_timestamp = "timestamp"; --时间戳

ServerConfig.s_dict_defend_attack_switch = "defend_attack_switch"; --防攻击开关
ServerConfig.s_dict_defend_attack_config_url = "defend_attack_config_url";       --防攻击配置请求url
ServerConfig.s_dict_defend_attack_proxy_webserver_iplist = "proxy_web_server_ip_list"; --防攻击代理服务器ip列表
ServerConfig.s_dict_defend_attack_internal_iplist = "defend_attack_inertnal_ip_list"; --防攻击连接的内网ip列表

ServerConfig.s_maxCdnDownloadCount = 10;  --cdn配置最大下载重试次数

ServerConfig.s_maxBestIpPortTryCount = 3; --最优ip、port重试次数
ServerConfig.s_maxNormalIpPortTryCount = 1; --主ip、port重试次数
ServerConfig.s_maxBackupIpPortTryCount = 1; --备份ip、port重试次数

ServerConfig.s_maxRedirectionTryCount = 1;  --重定向最大重试次数
ServerConfig.s_maxNormalIpPortSelectNum = 10; --主ip、port最大选取数目


ServerConfig.s_maxProxyWebServerUrlTryCount = 3; --防攻击服务器请求次数

-------------------------------------------------------------
ServerConfig.__loadNetWorkConfig = function(self)
    if NETWORK_TYPE == 1 then--测试环境

        ServerConfig.defaultConfig = 
        {
            version = 1;
            cdn = "http://365.oa.com/cdn/static/site/dongbei.mobile.json";

            hall = 
            {   
                [1] = {ip="192.168.203.219",port=10101};--东北棋牌的（暂时用一个）
            };

            php = 
            {
                [1] = {url="http://192.168.200.21/dfqp/"};
            };

            telemsg = 
            {
                [1] = "100016:";
            };

            mobile = 
            {
                [1]= "10657520612850158";
            };

            unicom = 
            {
                [1]= "1065507716335460";
            };

            telecom = 
            {
                [1]= "1065905710038460";
            };
        };

    elseif NETWORK_TYPE == 2 then ----预发布环境
        ServerConfig.defaultConfig = 
        {
            version = 1;
            cdn = "http://uchead.static.17c.cn/dfqp/static/site-test/dongbeitest.mobile.json";

            hall = 
            {   
                [1] = {ip="120.132.147.29",port=9950};--东北棋牌的
            };

            php = 
            {
                [1] = {url="http://pcususus01.ifere.com/ddfqp/"};
            };

            telemsg = 
            {
                [1] = "100016:";
            };

            mobile = 
            {
                [1]= "10657520612850158";
            };

            unicom = 
            {
                [1]= "1065507716335460";
            };

            telecom = 
            {
                [1]= "1065905710038460";
            };
        };

    elseif NETWORK_TYPE == 4 then --大厅测试环境

        ServerConfig.defaultConfig = 
        {
            version = 1;
            cdn = "http://192.168.203.204/cdn/static/site/union.mobile.json";

            hall = 
            {   
                [1] = {ip="192.168.203.220",port=10101}; --大厅server ip|port 区别于地区
                [2] = {ip="192.168.203.220",port=20202};
            };

            php = 
            {
                [1] = {url="http://192.168.203.204/dfqp/"};
            };

            telemsg = 
            {
                [1] = "100016:";
            };

            mobile = 
            {
                [1]= "10657520612850158";
            };

            unicom = 
            {
                [1]= "1065507716335460";
            };

            telecom = 
            {
                [1]= "1065905710038460";
            };
        };

    else --正式环境 (3)

        ServerConfig.defaultConfig = 
        {
            version = 1;

            cdn = RegionConfigDataInterface.getInstance():getRegionOnlineCdnUrl() or "http://uchead.static.17c.cn/dfqp/static/site/dongbei.mobile.json";

            hall = RegionConfigDataInterface.getInstance():getRegionOnlineIpPort();

            --备份ip，port
            hall_backup = {

            };

            php = 
            {
                [1] = {url="http://mvsnspus01.ifere.com/ddfqp/"};
            };

            telemsg = 
            {
                [1] = "100016:";
            };

            mobile = 
            {
                [1]= "10657520612850158";
            };

            unicom = 
            {
                [1]= "1065507716335460";
            };

            telecom = 
            {
                [1]= "1065905710038460";
            };
        };
    end
end


ServerConfig.getInstance = function()
    if not ServerConfig.s_instance then
        ServerConfig.s_instance = new(ServerConfig);
    end
    return ServerConfig.s_instance;
end

ServerConfig.releaseInstance = function()
    delete(ServerConfig.s_instance);
    ServerConfig.s_instance = nil;
end

ServerConfig.cleanup = function()
    ServerConfig.releaseInstance();
    ServerConfig.getInstance();
end

ServerConfig.ctor = function(self)
    EventDispatcher.getInstance():register(HttpModule.s_event,self,self.onHttpRequestCallBack);

    self:__loadNetWorkConfig();
    self:__loadServerConfig();
    self:__reset();
end

ServerConfig.dtor = function(self)
    EventDispatcher.getInstance():unregister(HttpModule.s_event,self,self.onHttpRequestCallBack);
end

--@brief 清除配置文件 切换环境的时候会进行调用
ServerConfig.clearServerConfig = function(self)
    local dict = new(Dict,ServerConfig.s_dictName);
    dict:delete();
    dict:save();
    delete(dict);
    dict = nil;
    self.m_cdnConfig = nil;  
end

--@brief 加载服务器配置文件
ServerConfig.__loadServerConfig = function(self)
    local dict = new(Dict,ServerConfig.s_dictName);
    dict:load();
    
    local cdn = dict:getString(ServerConfig.s_dict_cdn);
    local timestamp = dict:getString(ServerConfig.s_dict_timestamp);
    local cdnConfigString = dict:getString(ServerConfig.s_dict_config);

    self.m_defendAttackSwitch = dict:getInt(ServerConfig.s_dict_defend_attack_switch, 0);
    self.m_defendAttackProxyWebServerUrl = dict:getString(ServerConfig.s_dict_defend_attack_config_url) or "";

    local strDefendAttackProxyWebServerIpList = dict:getString(ServerConfig.s_dict_defend_attack_proxy_webserver_iplist) or "";
    if not string.isEmpty(strDefendAttackProxyWebServerIpList) then
        self.m_defendAttackProxyWebServerIpConfig = json.decode(strDefendAttackProxyWebServerIpList) or {};
    end

    local strDefendAttackInternalIpList = dict:getString(ServerConfig.s_dict_defend_attack_internal_iplist) or ""; 
    if not string.isEmpty(strDefendAttackInternalIpList) then
        self.m_defendAttackInternalServerIpConfig = json.decode(strDefendAttackInternalIpList) or {};
    end

    self.m_cdn = string.isEmpty(cdn) and ServerConfig.defaultConfig.cdn or cdn;
    if not string.isEmpty(cdnConfigString) and not string.isEmpty(timestamp) then
        self.m_cdnConfig = json.decode(cdnConfigString);
    end

    self.m_cdnConfig = self.m_cdnConfig or ServerConfig.defaultConfig;
    self.m_cdnConfig.hall = self:__generateRandomIpSequence(self.m_cdnConfig.hall);

    delete(dict);
    dict = nil;
end

--@brief 保存服务器配置文件
ServerConfig.__saveServerConfig = function(self)
    if string.isEmpty(self.m_cdn) or table.isEmpty(self.m_cdnConfig) then
        return;
    end

    local dict = new(Dict, ServerConfig.s_dictName);
    dict:load();

    local cdnConfigString = json.encode(self.m_cdnConfig);
    dict:setString(ServerConfig.s_dict_timestamp, os.time() or "");
    dict:setString(ServerConfig.s_dict_cdn, self.m_cdn);
    dict:setString(ServerConfig.s_dict_config, cdnConfigString or "");
    dict:setInt(ServerConfig.s_dict_defend_attack_switch, self.m_defendAttackSwitch);
    dict:setString(ServerConfig.s_dict_defend_attack_config_url, self.m_defendAttackProxyWebServerUrl or "");
    dict:setString(ServerConfig.s_dict_defend_attack_proxy_webserver_iplist, json.encode(self.m_defendAttackProxyWebServerIpConfig) or "");
    dict:setString(ServerConfig.s_dict_defend_attack_internal_iplist, json.encode(self.m_defendAttackInternalServerIpConfig) or "");

    dict:save();
    delete(dict);
    dict = nil;
end

--@brief 获取cdn地址
ServerConfig.getCdn = function(self)
    return self.m_cdn or ServerConfig.defaultConfig.cdn or "";
end

--@brief 设置cdn地址
ServerConfig.setCdn = function(self, cdnSite, cdnSiteVersion)
    self:log("ServerConfig.setCdn", "cdnSite = ", cdnSite, "cdnSiteVersion = ", cdnSiteVersion);
    if not string.isEmpty(cdnSite) and not string.isEmpty(cdnSiteVersion) then
        local newCdn = string.concat(cdnSite, "?v=", cdnSiteVersion);
        if self.m_cdn ~= newCdn then
            self.m_cdn = newCdn;
            self:__downloadCdn(newCdn);
        end
    end
end

--@brief 设置server推荐ip、port
--@note 用于server来控制前端连接的ip、port，从而进行重定向
ServerConfig.setServerRecommendIpPort = function(self, ip, port)
    self:log("ServerConfig.setServerRecommendIpPort", "ip = ", ip, "port = ", port);
    if ip and port then
        self.m_bestIpPort = nil;
        self.m_recommendIpPort = {["ip"] = ip, ["port"] = port};
        self:__reset();
        self:__reopenSocket();
    end
end

--@brief 设置唯一请求ip、port
--@note 当设置了这个ip、port后，则任何时候请求都将采用此ip、port
ServerConfig.setUniqueConnectIpPort = function(self, ip, port)
    self.m_uniqueIp = ip;
    self.m_uniquePort = port;
    self:__reopenSocket();
end

--@brief 设置防攻击代理服务器地址
ServerConfig.setDefendAttackProxyWebServerUrl = function(self, proxy_web_url)
    self:log("ServerConfig.setDefendAttackProxyWebServerUrl", " proxy_web_url = ", proxy_web_url);
    if not string.isEmpty(proxy_web_url) then
        self.m_defendAttackProxyWebServerUrl = proxy_web_url;
        self:__saveServerConfig();
    end
end

--@brief 获取防攻击代理服务器地址
ServerConfig.getDefendAttackProxyWebServerUrl = function(self)
    return self.m_defendAttackProxyWebServerUrl or "";
end

--@brief 获取防攻击代理服务器开关
ServerConfig.getDefendAttackSwitch = function(self)
    return (self.m_defendAttackSwitch == 1) and not table.isEmpty(self.m_defendAttackProxyWebServerIpConfig);
end

--@brief 是否已经请求过防攻击服务器开关了
ServerConfig.hasRequestedDefendAttackSwitch = function(self)
    return self.m_hasRequestDefendAttackSwitchFlag;
end

--@brief 获取防攻击内网ip、port
ServerConfig.getDefendAttackInternalIpPort = function(self)
    return self:__randomGetIpPort(self.m_defendAttackInternalServerIpConfig or {});
end

--@brief 判断连接的是否是防攻击代理服务器ip
ServerConfig.checkIsDefendAttackProxyWebServerIp = function(self, ip, port)
    for k, v in pairs( table.verify(self.m_defendAttackProxyWebServerIpConfig) ) do
        if string.valueOf(v.ip) == string.valueOf(ip) and number.valueOf(v.port) == number.valueOf(port) then
            return true;
        end
    end

    return false;
end

--@brief 请求防攻击配置
ServerConfig.requestDefendAttackConfig = function(self)
    if not self:hasRequestedDefendAttackSwitch() then
        self.m_defendAttackProxyWebServerUrlRequestCount = number.valueOf(self.m_defendAttackProxyWebServerUrlRequestCount, 0) + 1;
        if self.m_defendAttackProxyWebServerUrlRequestCount <= self.s_maxProxyWebServerUrlTryCount then    
            local url = self:getDefendAttackProxyWebServerUrl() .. "?app=" .. RegionConfigDataInterface.getInstance():getRegionAppId();
            self:log("ServerConfig.requestDefendAttackConfig", " url = ", url);
            -- local url = "http://mvsnspus01.ifere.com/svr_proxy/index.php?app=203001";
            HttpModule.getInstance():setUrl(HttpModule.s_cmds.DefendAttackConfig, url);
            HttpModule.getInstance():execute(HttpModule.s_cmds.DefendAttackConfig);
        end
    end
end

--@brief 防攻击配置请求回调
ServerConfig.onGetDefendAttackConfigCallBack = function(self, isSuccess, data)
    self:log("ServerConfig.onGetDefendAttackConfigCallBack", "isSuccess = ", isSuccess, "data = ", data);
    if isSuccess and not table.isEmpty(data) then
        self.m_hasRequestDefendAttackSwitchFlag = true;
        if GetNumFromJsonTable(data, "flag", 0) == 1 and not table.isEmpty(data.internalIpList)  and not table.isEmpty(data.proxyWebServerIpList) then
            self.m_defendAttackSwitch = 1;
            self.m_defendAttackProxyWebServerIpConfig = {};
            self.m_defendAttackInternalServerIpConfig = {};

            --代理服务器ip、port
            for k, v in pairs(data.proxyWebServerIpList) do
                local ip = GetStrFromJsonTable(v, "ip", "");
                local port = GetStrFromJsonTable(v, "port", "0");
                table.insert(self.m_defendAttackProxyWebServerIpConfig, {ip=ip, port=port} );
            end

            --内网ip、port(数据的最终流向)
            for k, v in pairs(data.internalIpList) do
                local ip = GetStrFromJsonTable(v, "ip", "");
                local port = GetStrFromJsonTable(v, "port", "0");
                table.insert(self.m_defendAttackInternalServerIpConfig, {ip=ip, port=port} );
            end

            if not OnlineSocketManager.getInstance():isSocketOpen() then
                self:log("ServerConfig.onGetDefendAttackConfigCallBack begin reopenSocket");
                self:__reopenSocket();
            end
        else
            self.m_defendAttackSwitch = 0;
        end

        self:__saveServerConfig();
    else
        self:requestDefendAttackConfig();
    end
end

--@brief 获取cdn配置
ServerConfig.getConfig = function(self)
    return self.m_cdnConfig or ServerConfig.defaultConfig or {};
end

--@brief 设置cdn配置
ServerConfig.setConfig = function(self, cdn, cdnConfig, isForceReopenSocket)
    self:log("ServerConfig.setConfig", "cdn= ", cdn, "cdnConfig = ", cdnConfig);
    if table.isEmpty(cdnConfig) then
        return;
    end

    self.m_cdn = string.isEmpty(cdn) and self.m_cdn or cdn or "";
    self.m_cdnConfig = cdnConfig;
    self.m_cdnConfig.hall = self:__generateRandomIpSequence(self.m_cdnConfig.hall);

    self:__saveServerConfig();
    self:__reset(true);

    isForceReopenSocket = isForceReopenSocket or (isForceReopenSocket == nil); --默认为需要打开
    if isForceReopenSocket or not OnlineSocketManager.getInstance():isSocketOpen() then
        self:__reopenSocket();
    end
end

--@brief 获取php url
ServerConfig.getHostUrl = function(self)
    self:log("serverConfig.getHostUrl");
    if not table.isEmpty(self.m_cdnConfig) and not table.isEmpty(self.m_cdnConfig.php) then
        local phpConfig = self.m_cdnConfig.php;
        for i=1, #phpConfig do
            if not table.isEmpty(phpConfig[i]) and not string.isEmpty(phpConfig[i].url) then
                return phpConfig[i].url;
            end
        end
    end

    self:__downloadCdn(self:getCdn());
    return ServerConfig.defaultConfig.php[1].url or "";
end

--@brief 重定向接口，一般情况都是连接到备份服务器后，后端控制重定向到主服务器
ServerConfig.redirectionIpPort = function (self, data)
    self:log("redirectionIpPort","data = ", data);
    
    if table.isEmpty(data) or string.isEmpty(data.usage) or table.isEmpty(data.config)then
        return;
    end

    self.m_curRedirectionCount = number.valueOf(self.m_curRedirectionCount, 0);
    if self.m_curRedirectionCount < ServerConfig.s_maxRedirectionTryCount then
        self.m_curRedirectionCount = self.m_curRedirectionCount + 1;
        local ip, port = self:__randomGetIpPort( data.config[data.usage] );
        self:setServerRecommendIpPort(ip, port);
    end
end

--@brief 随机获取ip、port
ServerConfig.__randomGetIpPort = function(self, config)
    if table.isEmpty(config) then
        return nil;
    end

    local index = math.random(1,#config);
    local item = config[index] or {};
    return item.ip, item.port;
end

--@brief 生成随机的ip序列
ServerConfig.__generateRandomIpSequence = function(self, ipConfig)
    if table.isEmpty(ipConfig) then
        return {};
    end

    local newConfig = {};
    local count = #ipConfig;
    for i=1, count do
        newConfig[i] = table.remove(ipConfig, math.random(#ipConfig));
    end
    return newConfig;
end

--@brief 获取ip、port
ServerConfig.getIpPort = function(self)
    
    local ip, port = -1, -1;
    --如果设置了唯一ip、port则使用它
    if self.m_uniqueIp and self.m_uniquePort then
        self:log("ServerConfig.getIpPort unique ip");
        ip, port = self.m_uniqueIp, self.m_uniquePort;

    elseif self:getDefendAttackSwitch() then
        --防攻击开关开启,则从代理服务器上获取ip、port
        self:log("ServerConfig.getIpPort getIpPortFromProxyWebServer");
        ip, port = self:__getIpPortFromProxyWebServer();   
    
    else
        --从cdn配置上获取ip、port
        self:log("ServerConfig.getIpPort getIpPortFromCdn");
        ip, port = self:__getIpPortFromCdn();        
    end

    self.m_connectIp, self.m_connectPort = ip, port;

    return self.m_connectIp, self.m_connectPort;
end

--@brief 从防攻击代理服务器上获取ip、port
ServerConfig.__getIpPortFromProxyWebServer = function(self)
    self.m_ipPortIndex = number.valueOf(self.m_ipPortIndex, 0) + 1;
    self.m_ipPortIndex = self.m_ipPortIndex > #self.m_defendAttackProxyWebServerIpConfig and 1 or self.m_ipPortIndex;

    local config = self.m_defendAttackProxyWebServerIpConfig[self.m_ipPortIndex] or {};
    return config.ip, config.port;
end

--@brief 从cdn配置上获取ip、port
ServerConfig.__getIpPortFromCdn = function(self)
    self.m_ipPortIndex = number.valueOf(self.m_ipPortIndex, 0) + 1;

    Log.v("ServerConfig.__getIpPortFromCdn", " self.m_ipPortList = ", self.m_ipPortList, " index = ", self.m_ipPortIndex);
    if self.m_ipPortIndex > #self.m_ipPortList then
        self:__reset();
        self:__downloadCdn(self:getCdn());
        return self:__getIpPortFromCdn();
    else
        for i=self.m_ipPortIndex, #self.m_ipPortList do
            local v = self.m_ipPortList[i];
            if table.isTable(v) and not string.isEmpty(v.ip) and not string.isEmpty(v.port) then
                self.m_ipPortIndex = i;
                return v.ip, number.valueOf(v.port)
            end
        end
    end   
end

--@brief 重置数据
ServerConfig.__reset = function(self, isAbsoluteReset)
    if isAbsoluteReset then
        --重置最优和推荐端口，防止新的配置里面没有
        self.m_bestIpPort = nil;
        self.m_recommendIpPort = nil;
    end

    self:__resetIpPortList(isAbsoluteReset)
end

--@brief 重置ip、port列表
ServerConfig.__resetIpPortList = function(self, isAbsoluteReset)
    self.m_ipPortList = {};

    local ipPortList = self:__getIpPortList(isAbsoluteReset);
    for k, v in ipairs(ipPortList) do
        table.insert(self.m_ipPortList, v);
    end

    if not table.isEmpty(self.m_bestIpPort) then
        for i=1, ServerConfig.s_maxBestIpPortTryCount do
            table.insert(self.m_ipPortList, 1, self.m_bestIpPort);
        end
    end

    if not table.isEmpty(self.m_recommendIpPort) then
        for i=1, ServerConfig.s_maxBestIpPortTryCount do
            table.insert(self.m_ipPortList, 1, self.m_recommendIpPort);
        end
    end

    self.m_ipPortIndex = 0;
end

ServerConfig.__getIpPortList = function(self, isAbsoluteReset)
    if not isAbsoluteReset and not table.isEmpty(self.m_ipPortNormalList) then
        return self.m_ipPortNormalList;
    end

    local normalIpPortList = table.isTable(self.m_cdnConfig) and self.m_cdnConfig.hall or {}; 
    local partNormalIpPortList = {};
    for i=1, ServerConfig.s_maxNormalIpPortSelectNum do 
        if normalIpPortList[i] then
            partNormalIpPortList[i] = normalIpPortList[i];
        end
    end

    local backupIpPortList = table.isTable(self.m_cdnConfig) and self.m_cdnConfig.hall_backup or {};

    self.m_ipPortNormalList = {};
    self:__copyTable(self.m_ipPortNormalList, partNormalIpPortList, ServerConfig.s_maxNormalIpPortTryCount);
    self:__copyTable(self.m_ipPortNormalList, backupIpPortList, ServerConfig.s_maxBackupIpPortTryCount);

    return self.m_ipPortNormalList;
end

ServerConfig.__copyTable = function(self, dest, org, count)
    for i=1, count do
        for k, v in ipairs(org) do
            if not table.isEmpty(v) then
                table.insert(dest, v);
            end
        end
    end
end

--@brief socket 连接成功
ServerConfig.onSocketConnected = function(self)
    self:log("ServerConfig.onSocketConnected");
    
    if self:checkIsDefendAttackProxyWebServerIp(self.m_connectIp, self.m_connectPort) then
        --如果是代理服务器连接成功，则需要先发送一条消息(内网ip, port)给代理服务器
        local internalIp, internalPort = self:getDefendAttackInternalIpPort();
        OnlineSocketManager.getInstance():sendMsg(SERVER_DEFEND_ATTACK_SEND_IP_PORT, {ip = internalIp, port = internalPort});
    else
        self.m_bestIpPort = self.m_ipPortList[self.m_ipPortIndex];
        self:__reset();
    end    
end

ServerConfig.clearBestIpPortIndex = function(self)
    self:log("ServerConfig.clearBestIpPortIndex");
    if self.m_bestIpPort then
        self.m_bestIpPort = nil;
        self:__reset();
    end
end

--@brief 下载cdn
ServerConfig.__downloadCdn = function(self, cdnUrl)
    self:log("ServerConfig.__downloadCdn", "cdnUrl = ", cdnUrl);
    if string.isEmpty(cdnUrl) then
        return;
    end

    if self.m_isDownloadingCdnFile then
        return;
    end
    self.m_isDownloadingCdnFile = true;

    self.m_cdnDownloadCount = number.valueOf(self.m_cdnDownloadCount, 0) + 1;
    if self.m_cdnDownloadCount >= ServerConfig.s_maxCdnDownloadCount then
        return;
    end

    --取消上次下载
    if self.m_downloadingCdnUrl and self.m_downloadingCdnFile then
        HttpFileGrap.getInstance():cancleGrapFile(self.m_downloadingCdnUrl, self.m_downloadingCdnFile);
        System.removeFile(self.m_downloadingCdnFile);
    end

    --两次请求的CDN一样，则改变时间
    if cdnUrl == self.m_downloadingCdnUrl then
        local time = math.floor(os.time()/3600/24);
        cdnUrl = string.gsub(cdnUrl, "v=%w*", "v="..time);
    end

    local file = string.concat(System.getStorageXmlPath()  , "/serverConfig.json." , os.time());
    self.m_downloadingCdnUrl = cdnUrl;
    self.m_downloadingCdnFile = file;

    System.removeFile(file);

    self:log("ServerConfig.__downloadCdn", "grapFile --> cdnUrl = ", cdnUrl);
    HttpFileGrap.getInstance():grapFile(cdnUrl, file, 15000, self, self.__onGetCdn);
end

--@brief 获取cdn配置回调
ServerConfig.__onGetCdn = function(self, isSuccessed, file, url)
    self:log("ServerConfig.__onGetCdn", "isSuccessed = ", isSuccessed, "file = ", file, "url = ", url);

    self.m_isDownloadingCdnFile = false;
    if isSuccessed then
        local hFile, err = io.open(file, "r");
        if hFile and not err then
            local josnText = hFile:read("*a");
            io.close(hFile);
            if not string.isEmpty(josnText) then
                local cdnConfig = json.decode(josnText);
                if not table.isEmpty(cdnConfig) then
                    System.removeFile(file); 
                    self.m_cdnDownloadCount = ServerConfig.s_maxCdnDownloadCount; --cdn配置下载成功后，则本次启动期间不需要重复下载了
                    self:setConfig(url, cdnConfig, false);
                    return;
                end
            end
        end
    end

    self:__downloadCdn(self:getCdn());
end

ServerConfig.__reopenSocket = function(self)
    self:log("ServerConfig.__reopenSocket");
    OnlineSocketManager.getInstance():reopenSocket();
end

ServerConfig.log = function(self, ...)
    Log.i("serverConfig", ...);
end

ServerConfig.onHttpRequestCallBack = function(self,command,...)
    if command == HttpModule.s_cmds.DefendAttackConfig then
        self:onGetDefendAttackConfigCallBack(...);
    end 
end
