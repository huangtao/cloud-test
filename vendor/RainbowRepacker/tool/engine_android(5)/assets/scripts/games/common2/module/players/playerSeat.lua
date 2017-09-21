
--[[
	处理本地座位号转换、校验
]]

PlayerSeat = class(DataInterfaceBase);

PlayerSeat.getInstance = function()
	if not PlayerSeat.s_instance then
		PlayerSeat.s_instance = new(PlayerSeat);
	end
	return PlayerSeat.s_instance;
end

PlayerSeat.releaseInstance = function()
	kPlayerSeat = nil;
	delete(PlayerSeat.s_instance);
	PlayerSeat.s_instance = nil;
	local pkg = package.loaded;
	pkg["games/common2/module/players/playerSeat"] = nil;
end
-------------------------------------------------------------------------
PlayerSeat.ctor = function(self)
	self:reset();
	self.m_playerNum = 1;
end

PlayerSeat.dtor = function(self)

end

--数据重置
PlayerSeat.reset = function(self)
	self.m_myServerSeatId = -1;
	self.m_playerInfo = {};
end
-------------------------------------------------------------------------
--设置当前游戏的最多能容纳的玩家数
PlayerSeat.setCurGamePlayerMaxCount = function(self,playerNum)
	self.m_playerNum = number.valueOf(playerNum,1);
end

PlayerSeat.getCurGamePlayerMaxCount = function(self)
	return number.valueOf(self.m_playerNum,1);
end

--设置我本地的座位号
PlayerSeat.setMyLocalSeat = function(self,localSeat)
	self.m_myLocalSeat = localSeat;
end

PlayerSeat.getMyLocalSeat = function(self)
	return number.valueOf(self.m_myLocalSeat,1);
end

--设置我在server的座位id
PlayerSeat.setMyServerSeatId = function(self, serverSeatId)
	self.m_myServerSeatId = serverSeatId;
	local mySeatId = self:getLocalSeat(serverSeatId);
	self:setMyLocalSeat(mySeatId);
end

PlayerSeat.getMyServerSeatId = function(self)
	return self.m_myServerSeatId;
end

PlayerSeat.getOnlookerSeat = function(self)
	return 10000;
end

--------------------------------------------------------------------------
-- 根据server座位id计算此id对应的本地座位号
PlayerSeat.getLocalSeat = function(self, seatId)
	local svrSeatId = self:getMyServerSeatId();
	if not svrSeatId or svrSeatId  == -1 then 	-- 如果玩家没有坐下，那就使用玩家在server端的id
		return seatId;
	end
	local myLocalSeat = self:getMyLocalSeat();
	local maxCount = self:getCurGamePlayerMaxCount();

	seatId = number.valueOf(seatId, -1);
	local localSeat = ((seatId - svrSeatId) % maxCount + myLocalSeat) % maxCount;
	if localSeat == 0 then 
		localSeat = maxCount;
	end
	return localSeat;
end

-- 根据本地座位id计算次id对应的local seatId 
PlayerSeat.getServerSeat = function(self, localSeat)
	local svrSeatId = self:getMyServerSeatId();
	if not svrSeatId or svrSeatId == -1 then 
		return localSeat;
	end
	local myLocalSeat = self:getMyLocalSeat();
	local maxCount = self:getCurGamePlayerMaxCount();

	localSeat = number.valueOf(localSeat, -1);
	local seatId = (localSeat - myLocalSeat + svrSeatId) % maxCount;

	return seatId;
end

-- --------------------------------------------------------------------------
--根据初始化的参数，判断此localseat是否合法
PlayerSeat.isSeatLegal = function(self, localSeat)
	if type(localSeat) ~= "number" then
		return false;
	end
	local maxCount = self:getCurGamePlayerMaxCount();
	if localSeat >=1 and localSeat <= maxCount then
		return true;
	end
	return false;
end

--根据当前的localseat计算下家的位置
PlayerSeat.getNextSeat = function(self, localSeat)
	local curSeat = localSeat + 1;
	local maxCount = self:getCurGamePlayerMaxCount();
	if curSeat > maxCount then
		return 1;
	end 
	return curSeat;
end

--根据当前的localseat计算上家的位置
PlayerSeat.getLastSeat = function(self, localSeat)
	local curSeat = localSeat - 1;
	if curSeat <= 0 then
		return self:getCurGamePlayerMaxCount();
	end 
	return curSeat;
end

--当前这个玩家是不是自己
PlayerSeat.isPlayerSelf = function(self,userId)
	if userId == UserBaseInfoIsolater.getInstance():getUserId() then 
		return true;
	else 
		return false;
	end 
end

-- 后续抛弃使用
kPlayerSeat = PlayerSeat.getInstance();
-----------------------------------------------------------------------------------------