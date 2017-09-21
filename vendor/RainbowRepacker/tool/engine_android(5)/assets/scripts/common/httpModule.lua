require("gameBase/httpManager");
require("libs/json_wrap");
require("util/log");
require("common/syncNativeEvent");


HttpModule = class();

HttpModule.s_event = EventDispatcher.getInstance():getUserEvent();

HttpModule.getInstance = function()
	if not HttpModule.s_instance then 
		HttpModule.s_instance = new(HttpModule);
	end
	return HttpModule.s_instance;
end

HttpModule.releaseInstance = function()
	delete(HttpModule.s_instance);
	HttpModule.s_instance = nil;
end

HttpModule.ctor = function(self)
	self.m_httpManager = new(HttpManager,HttpModule.s_config,HttpModule.postDataOrganizer,HttpModule.urlOrganizer);
	self.m_httpModuleEvent = self.m_httpManager:getHttpManagerEvent();
	EventDispatcher.getInstance():register(self.m_httpModuleEvent,self,self.onHttpResponse);
end

HttpModule.dtor = function(self)
	EventDispatcher.getInstance():unregister(self.m_httpModuleEvent,self,self.onHttpResponse);
	self.m_httpModuleEvent = nil;

	delete(self.m_httpManager);
	self.m_httpManager = nil;
end

HttpModule.postDataOrganizer = function(method,data,requestType,zipType)
    if requestType == "action" then

    	local paramStr = "";
    	local isReFormat = true;
    	if zipType == "zlib" then 
    		if type(data) == "table" then
    			data.action = method;
    		end 
    		local jsonStr = json.encode(data);
    		local isCompress,compressStr = HttpModule.compressPhpInfo(jsonStr);
    		if isCompress then 
    			isReFormat = false;
    			paramStr = compressStr;
 			end 
    	end 

    	if isReFormat then
	        paramStr = "action=" .. method;
	        for k,v in pairs(data) do
	            if k and v then
	                paramStr = paramStr .. "&" .. k .. "=" .. v;
	            end
	        end
	    end 
	    Log.d("action = " ,paramStr);
	    return paramStr;

    elseif requestType == "nothing" then
        return "";
    else    	
    	local post_data = HttpModule.postOrganizerData(method,data);
        Log.d("api = " ,json.encode(post_data));
        return "api=".. json.encode(post_data);
    end
end 

HttpModule.compressPhpInfo = function(info)
	if not info then 
		return false,info;
	end 

	local compressStr;
	local isCompress;
	local isNeedCompress = NativeEvent.s_platform == kPlatformAndroid or NativeEvent.s_platform == kPlatformIOS;
	if isNeedCompress then 
		isCompress,compressStr = SyncNativeEvent.getInstance():syncZipBase64CheckJsonFormatForLua(info);
		if not isCompress then 
			compressStr = info;
		end
	end 

	return isCompress,compressStr;
end 

HttpModule.postOrganizerData = function(method,data)
	dict_load(kDFQPGame);
	local userId = dict_get_int(kDFQPGame,kUserId,0);

	local post_data = {};
	--用户Key
    post_data.appkey = "0"; --sina平台appkey
    post_data.appid = kClientInfo:getAppId();  --后期添加
    post_data.mid = userId;
    post_data.username = string.format("user_%d",post_data.mid);
    post_data.time = os.time();
    post_data.sitemid = kClientInfo:getSitemid();
    post_data.api = kClientInfo:getApi();
    post_data.langtype = kClientInfo:getLangtype(); --1:简体 2:繁体
    post_data.deviceno = kClientInfo:getDeviceId();
    post_data.version = kClientInfo:getApkVersion();
    post_data.mtkey = kClientInfo:getMtKey().."";
   
    post_data.sid = kClientInfo:getSid(); --Android游客:7 sina用户:2 博雅通行证:12 QQ用户:3
   
    if method and not string.find( method, "#") then
    	 post_data.method = method;
    end

    if data then
        post_data.param = data;
    end

    local signature = HttpModule.joins(post_data.mtkey,post_data);
    post_data.sig = string.upper(md5_string(signature));

    return post_data;
end

 
HttpModule.joins = function(mtkey,t)
  return Joins(t,mtkey);
end

HttpModule.urlOrganizer = function(url,method,httpType)
	if httpType == kHttpGet then
		return url;
	end

	if  string.find(method, "#") then
		local indexs =  string.find( method, "#");
	    local m = "";
	    local p = "";
	    if indexs then
	        m = string.sub(method , 1 , indexs-1);
	        p = string.sub(method , indexs + 1 );
	    end
	    if m ~="" and p ~= "" then
    	 	url = url .. "?m=".. m .. "&p=" .. p;
    	elseif m ~= "" and p == "" then 
    		url = url .. "?m=" .. m;
    	elseif m == "" and p ~= "" then 
    		url = url .. "?m=" .. p;
    	end  
    -- else
    -- 	url=url.."?m="..method;
    end

	return url;
end

HttpModule.execute = function(self,command,data,isShowLoading)
	local show = isShowLoading or (isShowLoading == nil);
	if show then 
		-- Loading.play();
	end 
	self.m_httpManager:execute(command,data);
end

HttpModule.onHttpResponse = function(self,command,errorCode,data)
	-- Loading.release();
	
	local errMsg = nil;
	if errorCode == HttpErrorType.NETWORKERROR then
		errMsg = GameString.get("netWorkError") or "";
	elseif  errorCode == HttpErrorType.TIMEOUT then
		errMsg = GameString.get("netWorkTimeout") or "";
	elseif  errorCode == HttpErrorType.JSONERROR then	
		errMsg = GameString.get("netWorkJsonError") or "";
	end
	Log.d("HttpModule.onHttpResponse ", " command = ", command, " errorCode = ", errorCode, " data = ", json.encode(data));
	EventDispatcher.getInstance():dispatch(HttpModule.s_event,command,errMsg == nil, errMsg or data);
end

HttpModule.getConfigMap = function(self)
	return self.m_httpManager:getConfigMap();
end

HttpModule.setConfigMap = function(self,configMap)
	self.m_httpManager:setConfigMap(configMap);
end

HttpModule.setUrl = function(self, command, newUrl)
    if command and newUrl then
        local config = HttpModule.s_config[command];
        if config then
            config[1] = newUrl;
        end
    end
end

HttpModule.getHttpCmdId = function()
    HttpModule.s_curId = number.valueOf(HttpModule.s_curId);
    HttpModule.s_curId = HttpModule.s_curId + 1;
    return HttpModule.s_curId;
end

HttpModule.s_cmds = 
{
    SendFeedback = HttpModule.getHttpCmdId(),
	GetFeedback  = HttpModule.getHttpCmdId(),
	CloseTicket  = HttpModule.getHttpCmdId(),
    UploadError  = HttpModule.getHttpCmdId(),
    UploadSerLog = HttpModule.getHttpCmdId(),
	UploadDReport = HttpModule.getHttpCmdId(),
	GetPortId    = HttpModule.getHttpCmdId(),
	GetGoodsClassify = HttpModule.getHttpCmdId(),
    PayRechargeCard = HttpModule.getHttpCmdId(),
    AnnouncementStopServer = HttpModule.getHttpCmdId();
    DefendAttackConfig = HttpModule.getHttpCmdId();
};

HttpModule.s_config = 
{
    [HttpModule.s_cmds.SendFeedback] = {
		"https://feedback.boyaagame.com/api/api.php",
		"Feedback.sendFeedback",
	},	

	[HttpModule.s_cmds.GetFeedback] = {
		"https://feedback.boyaagame.com/api/api.php",
		"Feedback.mGetFeedback",
		kHttpPost,
		5000,
	},

	[HttpModule.s_cmds.CloseTicket] = {
		"https://feedback.boyaagame.com/api/api.php",
		"Feedback.mCloseTicket",
	},

    [HttpModule.s_cmds.UploadError] = {
        ServerConfig.getInstance():getHostUrl(),
        "report.stat",
        kHttpPost,
        5000,
        "action",
    },
    [HttpModule.s_cmds.UploadSerLog] = {
        ServerConfig.getInstance():getHostUrl(),
        "report.srvlog",
        kHttpPost,
        5000,
        "action",
        "zlib",
    },
	[HttpModule.s_cmds.UploadDReport] = {
		ServerConfig.getInstance():getHostUrl() .. "/index.php",
		"report.clickEvent",
		kHttpPost,
		5000,
		"action",
	},
	[HttpModule.s_cmds.GetPortId] = {
	    "http://192.168.202.26/im_dir.php", --must be reset by setUrl before excute http request
		"",
		kHttpPost,
		5000,
	},
    [HttpModule.s_cmds.GetGoodsClassify] = {
        ServerConfig.getInstance():getHostUrl(),
        "shop.getgoodsbase",
        kHttpPost,
        5000,
        "action",
    },
    [HttpModule.s_cmds.PayRechargeCard] = {
        "http://192.168.204.70/kkpromo_test/api.php?m=recharge&p=add", --must be reset by setUrl before excute http request
        "",
        kHttpGet,
        5000,
        "action"
    },
    [HttpModule.s_cmds.AnnouncementStopServer] = {
        "https://notice01.ifere.com/notice.php?p=nice&a=203001", --must be reset by setUrl before excute http request
        "",
        kHttpGet,
        5000,
        "action"
    },
    [HttpModule.s_cmds.DefendAttackConfig] = {
        "", --url 动态设置
        "",
        kHttpGet,
        5000,
    },
};
