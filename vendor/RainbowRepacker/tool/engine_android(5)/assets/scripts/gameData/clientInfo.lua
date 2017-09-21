require("gameData/dataInterfaceBase");
require("core/eventDispatcher");
require("common/nativeEvent");
require("core/system");
require("util/StringLib");
require("util/TableLib");

ClientInfo = class(DataInterfaceBase);

ClientInfo.ePhoneCardType = {
	unknown = -1; --未知
	mobile = 1; --移动
	unicom = 2; --联通
	telecom= 3 --电信
}

ClientInfo.eNetworkType = {
	unknown = -1; -- -1为没有连接网络或者未知
	wifi = 1; 	  -- 1为wifi
	_2G = 2; 	  -- 2为2G 
	_3G = 3, 	  -- 3为3G
	_4G = 4; 	  -- 4为4G
}

ClientInfo.getInstance = function()
	if not ClientInfo.s_instance then
		ClientInfo.s_instance = new(ClientInfo);
	end
	
	return ClientInfo.s_instance;
end

ClientInfo.Delegate = {
};

ClientInfo.ctor = function(self)
	self.m_nativeInfoRequested = false;
end

ClientInfo.getPhoneInfo = function(self)
	local platform = System.getPlatform();	
	if not self.m_nativeInfoRequested then 
		if platform == kPlatformAndroid or platform == kPlatformIOS then
			local phoneStr = NativeEvent.getInstance():getPhoneInfo();
			Log.v("ClientInfo.getPhoneInfo", "phoneStr = ", phoneStr);
			if string.isEmpty(phoneStr) then
				self:__getPhoneWhenErr();
			else
				self:__parsePhoneInfo(phoneStr);
			end
		else 
			self:__setWin32PhoneInfo();
		end
	end
end

--为了保证数据正确性，进行容错处理
ClientInfo.__getPhoneWhenErr = function(self)
	Log.v("ClientInfo.__getPhoneWhenErr");
	self.m_osVersion = "android_";
	self.m_apkVersion = "";
	self.m_appId = RegionConfigDataInterface.getInstance():getRegionAppId();
	self.m_guid = "";

	local guidFilePath = System.getAndroidSdPath() .. "/.boyaa/scqp/uuid_file.key";
	local hFile, err = io.open(guidFilePath, "r");
	if hFile and not err then
		local uuidFileContent = hFile:read("*a");
		local uuidArr = string.split(uuidFileContent, "uuid=");
		if not table.isEmpty(uuidArr) then
			self.m_guid = uuidArr[2];
		end
		Log.d("ClientInfo.__getPhoneWhenErr--guid--uuidFileContent", uuidFileContent);
		Log.d("ClientInfo.__getPhoneWhenErr--guid--uuidArr", uuidArr);
		Log.d("ClientInfo.__getPhoneWhenErr--guid", self.m_guid);
	end

	if hFile then
		io.close(hFile);
	end

	if string.isEmpty(self.m_guid) then
		self.m_guid = System.getGuid();
	end
	self.m_guid = string.trim(self.m_guid);

	self.m_phoneModel 	= System.getPhoneModel();
	self:setPhoneModel(self.m_phoneModel);
	self.m_deviceId   	= System.getAndroidDeviceId();
	self.m_machineId  	= "";
	self.m_androidid  	= System.getAndroidId();
	self.m_phoneNum   	= "";
	self.m_phoneCardType = -1;
	self.m_imsi 	  	= System.getAndroidImsi();
	self.m_imei 	  	= System.getAndroidImei();
	self.m_iccid      	= System.getAndroidIccid();
	self.m_netType    	= NativeEvent.getInstance():getNetworkType();

	self.m_sdkVersion 	= "";
	self.m_versionCode    	= System.getAndroidVersionCode();

	self.m_channel_id  	= "";
	self.m_channel_key 	= "";
	self.m_factoryId    = "";

	if self.m_deviceId == nil or self.m_deviceId =="" then
		self.m_deviceId = self.m_machineId;
	end

	if self.m_deviceId == nil or self.m_deviceId =="" then
		self.m_deviceId =self.m_androidid;
	end
		
	if self.m_deviceId == nil or self.m_deviceId =="" then
		self.m_deviceId = System.getGuid();
	end

	self.m_signGuid 		= "";
	self.m_signDeviceId 	= "";
	self.m_signMacAddress	= "";
end

ClientInfo.__parsePhoneInfo = function(self, phoneStr)
	local phoneData = json.decode(phoneStr);
	if table.isEmpty(phoneData) then
		Log.v("ClientInfo.__parsePhoneInfo", " get native login info error");
		self.m_nativeInfoRequested = false;
		return;
	end

	self.m_nativeInfoRequested = true;

	Log.v("ClientInfo.__parsePhoneInfo", " get native login info success");
	if System.getPlatform() == kPlatformAndroid then
		self.m_osVersion = "android_" .. phoneData.releaseVersion;
		self.m_apkVersion = phoneData.versionName;
		self.m_appId = phoneData.appid;
		kAppId = tonumber(self.m_appId) or RegionConfigDataInterface.getInstance():getRegionAppId();
		Log.v("ClientInfo.__parsePhoneInfo", "appid = ", self.m_appId);

	elseif System.getPlatform() == kPlatformIOS then
		self.m_osVersion = "IOS_" .. phoneData.releaseVersion;
		self.m_apkVersion = phoneData.versionName;
		if self.m_apkVersion == "" then
			self.m_apkVersion = dict_get_string("android_app_info","version_name") or "";
		end
	end

	self.m_guid 	=  phoneData.uuid ;
	self.m_phoneModel 	=  phoneData.phoneModel ;
	self:setPhoneModel(self.m_phoneModel);
	self.m_deviceId   	=  phoneData.deviceId ;
	self.m_machineId  	=  phoneData.machineId ;
	self.m_androidid  	=  phoneData.androidid ;
	self.m_phoneNum   	=  phoneData.phoneNum ;
	self.m_phoneCardType = number.valueOf(phoneData.phoneCardType ,-1);
	self.m_imsi 	  	=  phoneData.imsi;
	self.m_imei 	  	=  phoneData.imei;
	self.m_iccid      	=  phoneData.iccid;
	self.m_netType    	= number.valueOf(phoneData.networkType ,-1);---1:offline;1:wifi;2:3G;3:2G

	self.m_sdkVersion 	=  phoneData.sdkVersion;
	self.m_versionCode  = number.valueOf( phoneData.versionCode, 1);
	
	self.m_channel_id  	=  phoneData.channel_id;
	self.m_channel_key 	=  phoneData.channel_key;
	self.m_factoryId    =  phoneData.factoryid or "";

	self.m_signGuid 		= phoneData.signUuid;
	self.m_signDeviceId 	= phoneData.signDeviceId;
	self.m_signMacAddress	= phoneData.signMacAddress;
end

ClientInfo.__setWin32PhoneInfo = function(self)
	self.m_nativeInfoRequested = true;

	self.m_phoneModel="PC123456";
	self.m_apkVersion="";
	self:setPhoneModel(self.m_phoneModel);
	self.m_guid = self:__getGuidStrAndName();
	if not string.isEmpty(s_guid) then 
		self.m_guid = self.m_guid .. s_guid;
	end 
	Log.d("getPhoneInfo",self.m_guid);
	self.m_deviceId = self:__getGuidStrAndName();
	self.m_machineId = "";
	self.m_androidid="";
	self.m_phoneNum = "";
	self.m_phoneCardType = -1;
	self.m_imsi = "";
	self.m_imei="";
	self.m_iccid = "";
	self.m_netType = 1;
	self.m_osVersion = "android_4.0.0";
	self.m_sdkVersion="8";
	self.m_versionCode=1;
	self.m_channel_id="";
	self.m_channel_key="";
end

ClientInfo.__getGuidStrAndName = function(self)
	local guid_str = "";
	local str = "";
	if System.getPlatform() == kPlatformAndroid or System.getPlatform() == kPlatformIOS then 
		guid_str = System.getGuid();
		str = self.m_phoneModel;
		Log.v("LoginParamData.__getGuidStrAndName guid_str:",guid_str ,"self.m_guid:" ,self.m_guid," str:",str);
	else
		guid_str = System.getWindowsGuid(); 
		if guid_str then
			if string.len(guid_str) > 4 then
				str = string.sub(guid_str, 2, 9);
			else
				str = guid_str;
			end
		end
	end
	if str then
		local sum,eS,cS = string.count(str);
		if (eS + cS * 2) > 12 then
			str = string.subStrFromEnd(str, 12);
		end
	end
	return guid_str , str;
end

ClientInfo.getNetworkType = function(self)
	self.m_netType = NativeEvent.getInstance():getNetworkType();
	return self.m_netType or -1;
end

--网络环境
--1：wifi  2:2G  3:3G  4:4G  -1:未知或无网络
ClientInfo.getNetworkName = function(self)
	self:getNetworkType();
	if self.m_netType then
		if self.m_netType == 1 then
			return "wifi";
		elseif self.m_netType == 2 then
			return "2G";
		elseif self.m_netType == 3 then
			return "3G";
		elseif self.m_netType == 4 then 
			return "4G";
		end
	end
	return "unknown";
end

ClientInfo.setPhoneModel = function(self, phoneModel)
    self.m_phoneModel = phoneModel;
end

--移动终端设备机型
ClientInfo.getPhoneModel = function(self)
	return self.m_phoneModel or "";
end

ClientInfo.getVersionCode = function(self)
	return self.m_versionCode or 1;
end 

ClientInfo.getApkVersion = function(self)
	if string.isEmpty(self.m_apkVersion) then
		return kGameManager:getHallDependentApkVersion();
	else 
		return self.m_apkVersion or "";
	end
end

--获取应用安装时间
ClientInfo.getApkInstallTime = function(self)
	--android 则优先使用android传过来的安装时间
	--ios，win32 则直接使用dict里面保存的时间

	dict_load("apkInstallInfo");
	local installTime = dict_get_int("apkInstallInfo", "installTime", 0);
	if installTime <= 0 then
		installTime = os.time();
		dict_set_int("apkInstallInfo", "installTime", installTime);
		dict_save("apkInstallInfo");
	end

	Log.v("ClientInfo.getApkInstallTime", "dict installTime", installTime);

	if System.getPlatform() == kPlatformAndroid then
		local shareperfernceTime = number.valueOf( NativeEvent.getInstance():getApkInstallTime() );
		Log.v("ClientInfo.getApkInstallTime", "shareperfernceTime = ", shareperfernceTime);
		installTime = shareperfernceTime > 0 and shareperfernceTime or installTime;
	end

	Log.v("ClientInfo.getApkInstallTime", "final installTime = ", installTime);
	return installTime;
end

ClientInfo.getApkMd5 = function(self)
	if System.getPlatform() ~= kPlatformAndroid then
		return "";
	end

	if not string.isEmpty(self.m_apkMd5) then
		return self.m_apkMd5;
	end
	self.m_apkMd5 = NativeEvent.getInstance():getApkMd5();
	return self.m_apkMd5;
end

--移动终端设备操作系统
ClientInfo.getOSVersion = function(self)
	return self.m_osVersion or "4.0.0";
end 

--客户端将Imsi传给PHP，php根据imsi进行匹配，在登录回调接口中返回operator字段代表手机卡类型
--优先相信本地数据
ClientInfo.setPhoneCardType = function(self, cardType)
	Log.v("ClientInfo.setPhoneCardType cardType = ", cardType, " local cardType = ", self:getPhoneCardType() );
	if self:getPhoneCardType() ~= ClientInfo.ePhoneCardType.unknown then
		return;
	end

	if cardType == ClientInfo.ePhoneCardType.mobile then
		self.m_phoneCardType = ClientInfo.ePhoneCardType.mobile;

	elseif cardType == ClientInfo.ePhoneCardType.unicom then
		self.m_phoneCardType = ClientInfo.ePhoneCardType.unicom;

	elseif cardType == ClientInfo.ePhoneCardType.telecom then
		self.m_phoneCardType = ClientInfo.ePhoneCardType.telecom;
	end
end

--移动终端设备所使用的网络运营商(1:移动, 2:联通, 3:电信)
ClientInfo.getPhoneCardType = function(self)
	return self.m_phoneCardType or -1;
end

--判断是否有手机卡
ClientInfo.hasPhoneCard = function(self)
	local phoneCardType = self:getPhoneCardType();
	if phoneCardType == ClientInfo.ePhoneCardType.unknown then
		return false;
	else
		return true;
	end
end

--移动终端设备号
ClientInfo.getImsi = function(self)
	return self.m_imsi or "";
end

ClientInfo.getImei = function(self)
	return self.m_imei or "";
end

ClientInfo.getIccid = function(self)
	return self.m_iccid or "";
end 

--iOS厂商ID(获取不到时传空或不传)
ClientInfo.getFactoryId = function(self)
	return self.m_factoryId or "";
end

ClientInfo.getSignGuid = function(self)
	return self.m_signGuid or "";
end

--客户端安全码【安卓客户端必填】
ClientInfo.getSignDeviceId = function(self)
	return self.m_signDeviceId or "";
end

--客户端安全码(针对物理网卡地址)
ClientInfo.getSignMacAddress = function(self)
	return self.m_signMacAddress or "";
end

ClientInfo.getGuid = function(self)
	return self.m_guid or "";
end

ClientInfo.getDeviceId = function(self)
	return self.m_deviceId or "";
end

--物理网卡地址
ClientInfo.getMachineId = function(self)
	return self.m_machineId or "";
end

ClientInfo.getPhoneNum = function(self)
	local num = self.m_phoneNum or "";
	if num == "" then 
		num = self:getPhoneNumSms();
	end 
	return num;
end 

ClientInfo.getAppId = function(self)
	return self.m_appId or RegionConfigDataInterface.getInstance():getRegionAppId();
end

ClientInfo.getRegionIdByAppId = function(self)
	return number.valueOf(self.m_appId) / 100000;
end

ClientInfo.getRegionId = function(self)
	return self.m_regionId or 0;
end 

ClientInfo.setRegionId = function(self, regionId)
	self.m_regionId  = regionId or 0;
end 

ClientInfo.getChannelId = function(self)
	self.m_channel_id = self.m_channel_id or "100000";
	self.m_channel_id = string.trim(self.m_channel_id);
	return self.m_channel_id or "";
end 

ClientInfo.getChannelKey = function(self)
	return self.m_channel_key or "";
end 

--通过短信获取到的手机号码
ClientInfo.setPhoneNumSms = function(self , phone)
	self.m_phoneNumSms = phone;
end 

ClientInfo.getPhoneNumSms = function(self)
	return self.m_phoneNumSms or "";
end

---------------------------------------临时变量------------------------------------------
--无用 只是为了兼容以前的绞肉机
ClientInfo.setMtkey = function(self,mtKey)
    self.m_mtKey = mtKey;
end 

ClientInfo.getMtKey = function(self)
    return self.m_mtKey or "";
end 

ClientInfo.setAppkey = function(self,appkey)
    self.m_appKey = appkey;
end 
ClientInfo.getAppkey = function(self)
    return self.m_appKey or "";
end 

--唯一标示的id
ClientInfo.setSitemid = function(self,sitemid)
    self.m_sitemid = sitemid;
end 

ClientInfo.getSitemid = function(self)
    return self.m_sitemid or "";
end

-- 登录类型 android为 7  sina为2
ClientInfo.setSid = function(self,sid)
    self.m_sid = sid;
end 

ClientInfo.getSid = function(self)
    return self.m_sid or 7;
end

ClientInfo.setApi = function(self,api)
   self.m_api = api;
end 
ClientInfo.getApi = function(self)
    return self.m_api or 1;
end

--1表示简体 为2表示繁体
ClientInfo.setLangtype = function(self,langtype)
    self.m_langtype = langtype;
end 

ClientInfo.getLangtype = function(self)
    return self.m_langtype or 1;
end
---------------------------------------------------------------------------------

ClientInfo.getNetWorkAvalible = function(self)
	return NativeEvent.getInstance():getNetWorkAvalible();
end


--------------------是否为虚拟机判断--------------------------

ClientInfo.isVirtual = function(self)
	if  (System.getPlatform() == kPlatformAndroid) and 
		( (number.valueOf(self.m_virtualCheckFlag, 0) == 0) or (not self.m_isVirtualChecking) )  then

		--1) android 平台
		--2) 本地checkFlag为0  证明未检查过
		--3) 没有正在检查中
		
		Log.v("ClientInfo.isVirtual", " start check");
		self.m_isVirtualChecking = true;
		local pool = ThreadPool(1, 1, false);
	  	pool:lua_task(
	        function()
	        	local test = NativeDevice.CpuInfo.bkptTest();
				if test > 0 then
					return cjson.encode( {false, 1} );--arm cpu 测试通过,判定为真机
				end
				
				local flgs = NativeDevice.CpuInfo.getFlags();

				if string.len(flgs) > 0 then
					if nil ~= string.find(flgs,"iWMMXt") then
						return cjson.encode( {true, 2} ); --有模拟器 cpu 标志,判定为模拟器
					end
					return cjson.encode( {false, 3} ); --无模拟器 cpu 标志,判定为真机
				else
					--ASUS_T00j
					--Dell Venue8 
					--acer A1-840FHD
					local models = {"ASUS_T00","Venue7","Venue8","A1-830","A1-840"};
					local model = NativeDevice.DeviceInfo.getModel();
					for _, v in pairs(models) do
						if nil ~= string.find(model,v,1,true) then
							return cjson.encode( {false, 4} ); --判断为特定型号真机
						end
					end
					return cjson.encode( {true, 5} );--所有条件判断均失败,判断为模拟器
				end
	        end, 
	        function(strResult)
	        	Log.v("ClientInfo.isVirtual check result = ", strResult);
	        	local data = cjson.decode(strResult);
	        	self.m_isVirtualChecking = false;
	        	if not table.isEmpty(data) then
	        		self.m_isVirtual = data[1];
	        		self.m_virtualCheckFlag = data[2];
	        		self:saveData();
	        	end
	        end);
	end
	return self.m_isVirtual, self.m_virtualCheckFlag;
end

ClientInfo.getLocalDictName = function(self)
	return "ClientInfo"
end

ClientInfo.loadDictData = function(self, dict)
	self.m_isVirtual = dict:getBoolean("isVirtual", false);	--默认为真机
	self.m_virtualCheckFlag = dict:getInt("virtualCheckFlag", 0);
end

ClientInfo.saveDictData = function(self, dict)
	dict:setBoolean("isVirtual", self.m_isVirtual or false);
	dict:setInt("virtualCheckFlag", self.m_virtualCheckFlag or 0);
end

kClientInfo = ClientInfo.getInstance();
