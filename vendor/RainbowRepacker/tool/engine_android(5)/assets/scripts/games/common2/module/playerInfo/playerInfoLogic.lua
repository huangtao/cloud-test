
PlayerInfoLogic = class(DataInterfaceBase);
 
PlayerInfoLogic.Delegate = {
	onUsePropsEvent = "onUsePropsEvent";
};

PlayerInfoLogic.getInstance = function()
	if not PlayerInfoLogic.s_instance then
		PlayerInfoLogic.s_instance = new(PlayerInfoLogic);
	end
	return PlayerInfoLogic.s_instance;
end

PlayerInfoLogic.releaseInstance = function()
	delete(PlayerInfoLogic.s_instance);
	PlayerInfoLogic.s_instance = nil;
end

PlayerInfoLogic.ctor = function(self)	
	self.m_socket = SocketIsolater.getInstance():getSocket();
end

PlayerInfoLogic.dtor = function(self)

end

-- 使用道具
PlayerInfoLogic.onUsePropsEvent = function(self,cmd,data)
	self:notify(PlayerInfoLogic.Delegate.onUsePropsEvent,cmd,data);
end

-- 获取踢人卡道具数量
PlayerInfoLogic.getKickPropNum = function(self)
	return PropIsolater.getInstance():getPropNumByPropType(PropIsolater.propTypeMap.TYPE_VIP_KICK);
end

-- 获取踢人卡道具数量
PlayerInfoLogic.checkIsFriend = function(self,cid)
	return CommunityIsolater.getInstance():checkIsFriend(cid);
end

--获取玩家本地座位号
PlayerInfoLogic.getMyLocalSeat = function(self)
	return PlayerSeat.getInstance():getMyLocalSeat();
end

PlayerInfoLogic.s_kickCD = 8; -- 踢人冷却时间8s
PlayerInfoLogic.checkKickEnable = function(self)
	local timeKickNow = os.time();

	if self.m_timeKick and (timeKickNow - self.m_timeKick) <= PlayerInfoLogic.s_kickCD then
		return false;
	end
	self.m_timeKick = timeKickNow;
	return true;
end

-- PlayerInfoLogic.s_socketCmdFuncMap = 
-- {
-- };