require("gameData/dataInterfaceBase");

ActivityDataInterface = class(DataInterfaceBase);

ActivityDataInterface.Delegate = {
	onGetActivityUrlCallBack = "onGetActivityUrlCallBack";
	onGetActivityCountCallBack = "onGetActivityCountCallBack";
}

ActivityDataInterface.getInstance = function()
	if not ActivityDataInterface.s_instance then
		ActivityDataInterface.s_instance = new(ActivityDataInterface);
	end

	return ActivityDataInterface.s_instance;
end

ActivityDataInterface.cleanup = function()
    local lastObserverMap = ActivityDataInterface.getInstance():getObserverMap();
    delete(ActivityDataInterface.s_instance);
    ActivityDataInterface.s_instance = nil;

    ActivityDataInterface.getInstance():setObserverMap(lastObserverMap);
end


ActivityDataInterface.ctor = function(self)
	self.m_activityUrl = "";
	self.m_activityNum = 0;
	self.m_hasShowActivity = false;
end

ActivityDataInterface.dtor = function(self)
end

--@override
ActivityDataInterface.getLocalDictName = function(self)
	self.m_userId = self.m_userId or kUserInfoData:getUserId();
	return "ActivityDataInterface" .. self.m_userId;
end

--@override
ActivityDataInterface.loadDictData = function(self, dict)
	self.m_activityUrl = dict:getString("activityUrl") or "";
end

--@override
ActivityDataInterface.saveDictData = function(self, dict)
	dict:setString("activityUrl", self.m_activityUrl or "");
end

--请求活动数目
ActivityDataInterface.requestActivityCount = function(self)
	local data = {
		deviceno = kClientInfo:getDeviceId();
		networkstate = kClientInfo:getNetworkName();
		osversion = kClientInfo:getPhoneModel() .. "," .. kClientInfo:getOSVersion();
		macid = kClientInfo:getMachineId();
		guid = kClientInfo:getGuid();
	};

	OnlineSocketManager.getInstance():sendMsg(PHP_ACTIVITY_NUMBER, data);	
end

--活动数目回调
ActivityDataInterface.onGetActivityCountCallBack = function(self, isSuccess,data)
	Log.d("ActivityDataInterface.onGetActivityCountCallBack","isSuccess = ",isSuccess,"data = ",data);
	if not isSuccess then
		self:notify(ActivityDataInterface.Delegate.onGetActivityCountCallBack, false);
	else
		self.m_activityNum = tonumber(data.number) or 0;
		self.m_hasShowActivity = false;

		local url = tostring(data.url) or "";
		self:notify(ActivityDataInterface.Delegate.onGetActivityCountCallBack, true, self.m_activityNum, url);
	end
end

--请求活动地址
ActivityDataInterface.requestActivityUrl = function(self, w, h)
	--#issue为何需要这么多参数呢
	local data = {
		w = tonumber(w) or 0;
		h = tonumber(h) or 0;
		deviceno = kClientInfo:getDeviceId();
		networkstate = kClientInfo:getNetworkName();
		osversion = kClientInfo:getPhoneModel() .. "," .. kClientInfo:getOSVersion();
		macid = kClientInfo:getMachineId();
		guid = kClientInfo:getGuid();
	};

	OnlineSocketManager.getInstance():sendMsg(PHP_ACTIVITY_LISTS, data, 6000);
end

--活动地址回调
ActivityDataInterface.onGetActivityUrlCallBack = function(self, isSuccess, data)
	Log.d("ActivityDataInterface.onGetActivityUrlCallBack","isSuccess = ",isSuccess,"data = ",data);

	local str;
	if isSuccess then 
		if not table.isEmpty(data) and not string.isEmpty(data.url) then
			isSuccess = true;
			str = "";
			self.m_activityUrl = data.url;
			self:saveData();
		end
	else
		str = data.errorTips or "活动列表获取失败";
	end

	self:notify(ActivityDataInterface.Delegate.onGetActivityUrlCallBack, isSuccess, str, self.m_activityUrl);
end

--设置活动地址
ActivityDataInterface.setActivityUrl = function(self, url)
   if url and url ~= "" then 
   		self.m_activityUrl = url;
   		self:saveData();
   end 
end

--获取活动地址
ActivityDataInterface.getActivityUrl = function(self)
	return self.m_activityUrl;
end

--设置是否显示过活动的标记
ActivityDataInterface.setIsShowActivity = function(self, hasShow)
	self.m_hasShowActivity = hasShow;
end

--判断是否有未读的活动
ActivityDataInterface.hasUnReadActivity = function(self)
	return (not self.m_hasShowActivity) and self.m_activityNum > 0; 
end


--填充api参数公共字段
ActivityDataInterface.genTreeMap=function(self, t)
    -- api
    t.api = kClientInfo:getApi();
    -- mid
    t.mid = (kUserInfoData:getUserId() == 0) and (kClientInfo:getImsi()) or (kUserInfoData:getUserId());
    -- mtkey
    t.mtkey = kClientInfo:getMtKey();
    -- sid
    t.sid = kClientInfo:getSid();
    -- sig 外部生成
    -- time
    t.time = os.time();
    -- deviceno
    t.deviceno = kClientInfo:getDeviceId();
    -- macid
    t.macid = md5_string(kClientInfo:getMachineId() or "0");
    -- openudid
    t.openudid = 0;
    -- version
    t.version = kClientInfo:getApkVersion();
    -- osversion
    t.osversion = string.concat(kClientInfo:getDeviceId() , "," , kClientInfo:getOSVersion());
    -- networkstate
    local _, type, name = kClientInfo:getNetworkType();
    if type == 1 then
        t.networkstate = "Wifi";
    else
        type = kClientInfo:getPhoneCardType();
        t.networkstate = self:__getSimType(type);
    end;
    -- sitemid
    t.sitemid=kClientInfo:getSitemid();
    -- appid
    t.appid=kUserInfoData:getAppId();
    -- appkey
    t.appkey=kClientInfo:getAppkey();
end

ActivityDataInterface.__getSimType = function(self, type)
	local SIM_TYPE = {
	"中国移动",
	"中国联通",
	"中国电信",
	};
	return SIM_TYPE[type];
end

ActivityDataInterface.s_socketCmdFuncMap = {
	[PHP_ACTIVITY_NUMBER] 		         = ActivityDataInterface.onGetActivityCountCallBack;
	[PHP_ACTIVITY_LISTS]				 = ActivityDataInterface.onGetActivityUrlCallBack;
};