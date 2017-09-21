-- TerminalInfo.lua
-- 终端设备相关信息，本类大部分返回值都是字符串！！
require("common/nativeEvent");

TerminalInfo = class();

TerminalInfo.eNetworkType = {
	unknown = -1; -- -1为没有连接网络或者未知
	wifi = 1; 	  -- 1为wifi
	_2G = 2; 	  -- 2为2G 
	_3G = 3, 	  -- 3为3G
	_4G = 4; 	  -- 4为4G
}


TerminalInfo.s_instance = nil;

TerminalInfo.getInstance = function()
	if not TerminalInfo.s_instance then
		TerminalInfo.s_instance = new(TerminalInfo);
	end
	return TerminalInfo.s_instance;
end

TerminalInfo.releaseInstance = function()
	if TerminalInfo.s_instance then
		delete(TerminalInfo.s_instance);
		TerminalInfo.s_instance = nil;
	end
end

TerminalInfo.s_dict_name 						= "TerminalInfoTable";

TerminalInfo.s_dict_key_phone_model 			= "phone_model";
TerminalInfo.s_dict_key_device_id 				= "device_id";
TerminalInfo.s_dict_key_sdk_version 			= "sdk_version";
TerminalInfo.s_dict_key_app_version_name 		= "app_version_name";
TerminalInfo.s_dict_key_app_version_code		= "app_version_code";
TerminalInfo.s_dict_key_manufacturer 			= "manufacturer";
TerminalInfo.s_dict_key_build_id				= "build_id";
TerminalInfo.s_dict_key_build_brand				= "build_brand";

TerminalInfo.s_dict_key_mac 					= "mac";
TerminalInfo.s_dict_key_network_type			= "network_type";

-- 内存信息相关
TerminalInfo.s_dict_key_total_memory			= "total_memory";
TerminalInfo.s_dict_key_avail_memory			= "avail_memory";
TerminalInfo.s_dict_key_is_low_memory			= "is_low_memory";
TerminalInfo.s_dict_key_memory_threshold		= "memory_threshold";

-- SD卡信息相关
TerminalInfo.s_dict_key_sdcard_state			= "sdcard_state";

-- 内部存储相关
TerminalInfo.s_dict_key_internal_update_path	= "internal_update_path";

-- 内置蓝牙应用
TerminalInfo.s_dict_key_bluetooth_app			= "bluetooth_app";

-- SD卡状态
TerminalInfo.s_sdcard_state_unknown				= 0;			-- 未知（除了可读可写，只读状态外的状态）
TerminalInfo.s_sdcard_state_writable			= 1;			-- 可读可写
TerminalInfo.s_sdcard_state_readonly			= 2;			-- 只读



TerminalInfo.ctor = function(self)
	--NativeEvent.getInstance():initLocalInfoForLua();
end

TerminalInfo.dtor = function(self)
end

-- 机器型号
TerminalInfo.getPhoneModel = function(self)
	local phoneModel = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_phone_model) or "";
	return phoneModel;
end

-- 设备号
TerminalInfo.getDeviceId = function(self)
	local deviceId = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_device_id) or "";
	return deviceId;
end

-- 系统版本号
TerminalInfo.getSDKVersion = function(self)
	local sdkVersion = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_sdk_version) or "";
	return sdkVersion;
end

-- 应用版本名称
TerminalInfo.getAppVersionName = function(self)
	local appVersionName = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_app_version_name) or "1.0.0";
	return appVersionName;
end

-- 应用版本号
TerminalInfo.getAppVersionCode = function(self)
	local appVersionCode = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_app_version_code) or "";
	return appVersionCode;
end

-- 厂商
TerminalInfo.getManufacturer = function(self)
	local manufacturer = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_manufacturer) or "";
	return manufacturer;
end

-- 用于相机设置
-- android.os.Build.ID
TerminalInfo.getBuildId = function(self)
	local id = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_build_id) or "";
	return id;
end

-- 用于相机设置
-- android.os.Build.BRAND
TerminalInfo.getBuildBrand = function(self)
	local brand = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_build_brand) or "";
	return brand;
end

-- MAC
TerminalInfo.getMac = function(self)
	NativeEvent.getInstance():getLocalMacAddressForLua();
	local mac = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_mac) or "";
	return mac;
end

-- 网络类型
-- -1为没有连接网络或者未知
-- 1为wifi
-- 2为2G
-- 3为3G
-- 4为4G
TerminalInfo.getNetWorkType = function(self)
	NativeEvent.getInstance():getNetWorkTypeForLua();
	local networkType = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_network_type) or "0";
	return number.valueOf(networkType , -1);
end

TerminalInfo.isNetWorkAvailable = function(self)
	return self:getNetWorkType() ~= -1;
end

-- 内存相关
-- 全部内存信息，返回一个table
TerminalInfo.getTotalMemoryInfos = function(self)
	NativeEvent.getInstance():getTotalMemoryInfosForLua();
	local totalMemory = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_total_memory) or "";
	local availMemory = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_avail_memory) or "";
	local isLowMemory = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_is_low_memory) or "";
	local threshold = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_memory_threshold) or "";

	local tab = {};
	tab.totalMemory = totalMemory;
	tab.availMemory = availMemory;
	tab.isLowMemory = isLowMemory;
	tab.threshold = threshold;

	return tab;

end

-- 机身总内存MB，如果Java端出异常，可能返回"0"
TerminalInfo.getTotalMemory = function(self)
	NativeEvent.getInstance():getTotalMemoryForLua();
	local totalMemory = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_total_memory) or "";
	self.m_totalMemory = number.valueOf(totalMemory);
	return totalMemory;
end

-- 剩余内存MB
TerminalInfo.getAvailMemory = function(self)
	NativeEvent.getInstance():getAvailMemoryForLua();
	local availMemory = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_avail_memory) or "";
	return availMemory;
end

-- 是否低内存状态 "true" or "false"
TerminalInfo.getIsLowMemory = function(self)
	NativeEvent.getInstance():getIsLowMemoryForLua();
	local isLowMemory = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_is_low_memory) or "";
	return isLowMemory;
end

-- 低内存状态阈值MB
TerminalInfo.getMemoryThreshold = function(self)
	NativeEvent.getInstance():getMemoryThresholdForLua();
	local threshold = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_memory_threshold) or "";
	self.m_threshold = number.valueOf(threshold);
	return threshold;
end

-- 判断当前内存是否适合游戏（播放动画，加载图片）
-- return 适合返回true 不适合返回false
TerminalInfo.checkLowMemoryForGame = function(self)

	if NativeEvent.s_platform == kPlatformWin32 then
		-- win32 平台直接返回true
		return true;
	end

	if not self.m_totalMemory then
		self:getTotalMemory();
	end

	if not self.m_threshold then
		self:getMemoryThreshold();
	end

	local totalMemory = self.m_totalMemory;
	local threshold = self.m_threshold;
	local availMemory = number.valueOf(self:getAvailMemory());

	if totalMemory == nil or totalMemory == 0 then
		-- 如果无法获取机身总内存，判断可用内存是否为阈值的2.5倍
		if availMemory > threshold * 2.5 then
			return true;
		else
			return false;
		end

	else

		local temp;
		-- 如果可以获取机身内存，根据总内存容量分别判断
		if totalMemory <= 512 then
			temp = math.max(totalMemory * 0.25, threshold);
		elseif totalMemory <= 1024 then
			temp = math.max(totalMemory * 0.2, threshold * 2);
		elseif totalMemory <= 2048 then
			temp = math.max(totalMemory * 0.1, threshold * 2);
		else
			temp = math.max(totalMemory * 0.1, threshold);
		end

		if availMemory > temp then
			return true;
		else
			return false;
		end
	end

	return false;

end

-- 获取SD卡的挂载状态
-- SD卡状态
-- TerminalInfo.s_sdcard_state_unknown			= 0;			-- 未知（除了可读可写，只读状态外的状态）
-- TerminalInfo.s_sdcard_state_writable			= 1;			-- 可读可写
-- TerminalInfo.s_sdcard_state_readonly			= 2;			-- 只读
TerminalInfo.getSDCardState = function(self)
	NativeEvent.getInstance():getSDCardStateForLua();
	local state = dict_get_int(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_sdcard_state, TerminalInfo.s_sdcard_state_unknown);
	return state;
end

-- 判断SD卡是否可写
-- @return true 可写， false不可写
TerminalInfo.isSDCardWritable = function(self)
	return self:getSDCardState() == TerminalInfo.s_sdcard_state_writable;
end

-- 获取ROM上面的升级文件存储路径，用于当SD不可写的情况
-- /data/data/包名/app_apkUpdate/
TerminalInfo.getInternalUpdatePath = function(self)
	NativeEvent.getInstance():getInternalUpdatePathForLua();
	local path = dict_get_string(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_internal_update_path) or "";
	return path;
end

-- 判断当前系统下是否有自带蓝牙应用
-- return Boolean
TerminalInfo.isAndroidBluetoothAppExist = function(self)
	NativeEvent.getInstance():isAndroidBluetoothAppExistForLua();
	local isExist = dict_get_int(TerminalInfo.s_dict_name, TerminalInfo.s_dict_key_bluetooth_app, kFalse);
	Log.i("isAndroidBluetoothAppExist == " .. tostring(isExist));
	return (isExist == kTrue)
end

kTerminalInfo = TerminalInfo.getInstance();
