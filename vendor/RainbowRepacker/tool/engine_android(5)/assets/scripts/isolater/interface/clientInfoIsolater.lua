--[[
    当前设备信息中间层,提供了当前设备以及apk相关的一些接口
]]

require("gameData/clientInfo");

ClientInfoIsolater = class(DataInterfaceBase);


ClientInfoIsolater.ePhoneCardType = {
    unknown = ClientInfo.ePhoneCardType.unknown; --未知
    mobile  = ClientInfo.ePhoneCardType.mobile;  --移动
    unicom  = ClientInfo.ePhoneCardType.unicom;  --联通
    telecom = ClientInfo.ePhoneCardType.telecom; --电信
}

ClientInfoIsolater.eNetworkType = {
    unknown = ClientInfo.eNetworkType.unknown;  -- -1为没有连接网络或者未知
    wifi    = ClientInfo.eNetworkType.wifi;     -- 1为wifi
    _2G     = ClientInfo.eNetworkType._2G;      -- 2为2G 
    _3G     = ClientInfo.eNetworkType._3G,      -- 3为3G
    _4G     = ClientInfo.eNetworkType._4G;      -- 4为4G
}

ClientInfoIsolater.getInstance = function()
    if not ClientInfoIsolater.s_instance then
        ClientInfoIsolater.s_instance = new(ClientInfoIsolater);
    end

    return ClientInfoIsolater.s_instance;
end

--@brief 获取网络类型
--@return 网络类型 (int) 对应 eNetworkType
ClientInfoIsolater.getNetworkType = function(self)
    return kClientInfo:getNetworkType();
end

--@brief 网络环境
--@return 网络名字 (string) 1：wifi  2:2G  3:3G  4:4G  -1:未知或无网络
ClientInfoIsolater.getNetworkName = function(self)
    return kClientInfo:getNetworkName();
end

--@brief 获取电话号码
--@return 电话号码 (string) 无则为""
ClientInfoIsolater.getPhoneNum = function(self)
    return kClientInfo:getPhoneNum();
end 

--@brief 移动终端设备所使用的网络运营商
--@return 电话卡类型 (int) (1:移动, 2:联通, 3:电信)
ClientInfoIsolater.getPhoneCardType = function(self)
    return kClientInfo:getPhoneCardType();
end

--@brief 判断是否有手机卡
--@return (boolean)
ClientInfoIsolater.hasPhoneCard = function(self)
    return kClientInfo:hasPhoneCard();
end

--@brief 获取apk版本号
--@return (string)
ClientInfoIsolater.getApkVersion = function(self)
    return kClientInfo:getApkVersion();
end

--@brief 移动终端设备操作系统
--@return (string)
ClientInfoIsolater.getOSVersion = function(self)
    return kClientInfo:getOSVersion();
end 

--@brief 获取应用id 同一个地区不同平台的appid是不一致的
--@return (int)
ClientInfoIsolater.getAppId = function(self)
    return kClientInfo:getAppId();
end

--@brief 获取地区Id 一个地区id可以对应多个appid(如android|ios)
--@return (int)
ClientInfoIsolater.getRegionId = function(self)
    return kClientInfo:getRegionId();
end 

--@brief 获取渠道id
--@return (string)
ClientInfoIsolater.getChannelId = function(self)
    return kClientInfo:getChannelId();
end 

--@brief 获取api 没啥用
ClientInfoIsolater.getApi = function(self)
    return kClientInfo:getApi();
end

--@brief 移动终端设备号
--@return (string)
ClientInfoIsolater.getImsi = function(self)
    return kClientInfo:getImsi();
end

--@brief 获取guid guid和游客账号是一一对应的关系
--@return (string)
ClientInfoIsolater.getGuid = function(self)
    return kClientInfo:getGuid();
end

--@brief 判断网络是否可用
--@return (boolean)
ClientInfoIsolater.getNetWorkAvalible = function(self)
    return kClientInfo:getNetWorkAvalible();
end