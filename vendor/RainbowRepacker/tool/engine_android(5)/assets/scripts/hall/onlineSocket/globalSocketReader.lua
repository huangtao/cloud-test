require("common/commonSocketReader");
require("hall/onlineSocket/globalSocketCmd");

GlobalSocketReader = class(CommonSocketReader);

--广播支付获取银币
GlobalSocketReader.onBroadcastPayMoney = function(self,pid)
	local info = {};
	info.type = self.m_socket:readShort(pid,0); --广播类型
	info.data = self.m_socket:readString(pid); 
	return info;
end

GlobalSocketReader.onServerKickout = function(self,packetId)
end

GlobalSocketReader.onPhpKickout = function(self,packetId)
    local info = {};
    info.uid = self.m_socket:readInt(packetId,0);
    info.msg = self.m_socket:readString(packetId);
    info.errorType = self.m_socket:readInt(packetId,-1);
    return info;
end

GlobalSocketReader.onMultiDeviceLogin = function(self,packetId)
	local ret = {};
	ret.mid = self.m_socket:readInt(packetId,0);
	Log.eWF("MultiDeviceLogin ","GlobalSocketReader.onMultiDeviceLogin","ret = ",ret);
	return ret;
end

GlobalSocketReader.onHallLoginSuccess = function(self,packetId) 
	local info = {};
	info.ret = self.m_socket:readByte(packetId,0);

	if info.ret == 1 then
		info.gameType 	= self.m_socket:readShort(packetId,0);
		info.svid 		= self.m_socket:readInt(packetId, -1);
		info.roomId 	= self.m_socket:readInt(packetId,0);
		info.roomLevel 	= self.m_socket:readShort(packetId,0);
	else

	end

	info.matchInfo = {};
	info.matchState = self.m_socket:readByte(packetId,0);
	if info.matchState == 1 then
		info.matchInfo.gameId = self.m_socket:readShort(packetId, 0);
		info.matchInfo.matchId = self.m_socket:readInt(packetId, -1);
		info.matchInfo.svid = self.m_socket:readInt(packetId, 0);
		info.matchInfo.matchType = self.m_socket:readShort(packetId,0);
	end

    info.objectInfo = {};

    local objectJsonString = self.m_socket:readString(packetId, "");
    if objectJsonString ~= "" then
        info.objectInfo =  table.verify(json.decode(objectJsonString));
    end

    info.onlookerInfo = {};
    info.onlookerType = self.m_socket:readByte(packetId,0);--1:围观重连
    if info.onlookerType == 1 then 
    	info.onlookerInfo.userId = self.m_socket:readInt(packetId,0);--被围观者id
    	info.onlookerInfo.gameId = self.m_socket:readInt(packetId,0);--被围观游戏gameId
    	info.onlookerInfo.roomLevel = self.m_socket:readInt(packetId,0);--被围观游戏roomLevel
    end 

	Log.d("wanpg-----GlobalSocketReader.onHallLoginSuccess--大厅登录成功--",info);
	return info;
end

--php实时推送消息给客户端
GlobalSocketReader.onPhpPushMessage = function (self,packetId)
	local info = {};
	info.ret = self.m_socket:readString(packetId);

	Log.i("GlobalSocketReader.onPushMessage:",info);

	return  info;

end


GlobalSocketReader.onReciveBroadcastMessage = function (self,packetId)
	local info = {};
	info.ret=self.m_socket:readString(packetId);

	Log.i("GlobalSocketReader.onReciveBroadcastMessage:",info);

	return  info;
end

GlobalSocketReader.onGetUserVipInfo = function(self,packetId)
	local info = {};
	info.mid = self.m_socket:readInt(packetId,-1);
	info.propNum = self.m_socket:readInt(packetId,0);
	info.propDetail = {};
	
	for i =1,tonumber(info.propNum) do
		local tmp = {};
		--todo
		tmp = self.m_socket:readString(packetId);
		table.insert(info.propDetail,json.decode(tmp));
	end
	
	Log.v("--------------GlobalSocketReader.onGetUserVipInfo --------------------",info);
	return info;
end

GlobalSocketReader.onGetUserVipError = function(self,packetId)
	local info = {};
	info.errorType = self.m_socket:readShort(packetId,-1);
	info.errorId = self.m_socket:readShort(packetId,-1);

	Log.v("--------------GlobalSocketReader.onGetUserVipError --------------------",info);
	return info;
end

--server定时推送的消息

GlobalSocketReader.onGetUserVipExpired = function(self,packetId)
	local info = {};
	info.mid = self.m_socket:readInt(packetId,-1);
	info.propNum = self.m_socket:readInt(packetId,0);
	info.propType = self.m_socket:readInt(packetId,0);
	
	Log.v("--------------GlobalSocketReader.onGetUserVipExpired --------------------",info);
	return info;
end

GlobalSocketReader.onServerBroadPhpUseProps = function (self, packetId)
	local info = {};
	info.mid = self.m_socket:readInt(packetId, -1);
	info.propNum = self.m_socket:readInt(packetId, -1);

	info.propType = self.m_socket:readInt(packetId, -1);
	info.propUseNum = self.m_socket:readInt(packetId, -1);
	info.propTarget = self.m_socket:readString(packetId, "");

	return info;
end

GlobalSocketReader.onServerBroadRefreshUserInfo = function(self,packetId)
	local info = {};
	info.money = self.m_socket:readInt64(packetId,kUserInfoData:getMoney());
	info.gameInfo = self.m_socket:readString(packetId);
	info.extendInfo = self.m_socket:readString(packetId);

	return info;
end

GlobalSocketReader.onServerBroadVipKick = function(self, packetId)
	local info = {};
	info.errorcode = self.m_socket:readInt(packetId, -1);
	info.vipuid = self.m_socket:readInt(packetId, -1);
	info.vipname = self.m_socket:readString(packetId);
	info.kickuid = self.m_socket:readInt(packetId, -1);
	info.kickname = self.m_socket:readString(packetId);
	info.kickType = self.m_socket:readInt(packetId, -1);  --踢人者使用的道具类型  1表示使用vip特权，2表示使用踢人卡
	return info;
end

GlobalSocketReader.onServerPushUserInfo = function(self, packetId)
    local info = {};
    info.userMid = self.m_socket:readInt(packetId, -1); --指定用户的mid
    info.propertyArr = {};

    local typeNum = self.m_socket:readInt(packetId, 0); --改变类型的数目
    for index=1, typeNum do
        local propertyId = self.m_socket:readInt(packetId, -1);
        local num = self.m_socket:readInt64(packetId, 0);
        table.insert(info.propertyArr, { propertyId = propertyId, num = num } );
    end

    return info;
end

GlobalSocketReader.s_severCmdFunMap = {
	
	[SERVER_KICK_OUT] 						= GlobalSocketReader.onServerKickout;
	[PHP_KICK_OUT]                  		= GlobalSocketReader.onPhpKickout;

	[RESPONSE_BROADCAST_PAY_MONEY]			= GlobalSocketReader.onBroadcastPayMoney;

	[HALL_LOGIN_SUCCESS] 					= GlobalSocketReader.onHallLoginSuccess;
	[SERVER_MULTI_DEVICE_LOGIN] 			= GlobalSocketReader.onMultiDeviceLogin;
    [PHP_MSG_TO_CLIENT] 					= GlobalSocketReader.onPhpPushMessage;
    [PHP_RADIO_TO_CLIENT] 					= GlobalSocketReader.onReciveBroadcastMessage;

    [SERVER_USER_VIP_INFO]					= GlobalSocketReader.onGetUserVipInfo; 
    [SERVER_USER_VIP_ERROR] 				= GlobalSocketReader.onGetUserVipError;  
    [SERVER_USER_VIP_EXPIRED] 				= GlobalSocketReader.onGetUserVipExpired;

    [SERVER_COMMAND_BROAD_PHP_USE_PROPS] 	= GlobalSocketReader.onServerBroadPhpUseProps;  -- 广播php使用道具
    [SERVER_COMMAND_BROAD_REFRESH_USERINFO] = GlobalSocketReader.onServerBroadRefreshUserInfo;
    [SERVER_COMMAND_VIPKICK_SUCCESS]        = GlobalSocketReader.onServerBroadVipKick;
    [SERVER_COMMAND_PUSH_USERINFO]          = GlobalSocketReader.onServerPushUserInfo;
};
