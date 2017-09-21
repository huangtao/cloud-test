

--[[
	管理玩家的个人信息
]]


GamePlayerManager2 = class(DataInterfaceBase);

GamePlayerManager2.Delegate = {
    onPlayerInfoChanged 		= "onPlayerInfoChanged";
    onPlayerPropertyChanged 	= "onPlayerPropertyChanged";
    onPlayerIdentityChanged 	= "onPlayerIdentityChanged";
};

GamePlayerManager2.getInstance = function()
	if not GamePlayerManager2.s_instance then
		GamePlayerManager2.s_instance = new(GamePlayerManager2);
	end
	return GamePlayerManager2.s_instance;
end

GamePlayerManager2.releaseInstance = function()
	CommonPlayerInfoHandler2.releaseInstance();
	kGamePlayerManager2 = nil;
	delete(GamePlayerManager2.s_instance);
	GamePlayerManager2.s_instance = nil;

	local pkg = package.loaded;
	pkg["games/common2/module/players/gamePlayerManager2"] = nil;
end


GamePlayerManager2.ctor = function(self)
	self.m_playerInfo = {};
	self.m_simpleInfo = {};
	UserIdentityIsolater.getInstance():setObserver(self);
	self:initMySelData();
end

GamePlayerManager2.dtor = function(self)
	self:reset(true);
	UserIdentityIsolater.getInstance():clearObserver(self);
end

--初始化
GamePlayerManager2.init = function(self, playerNum)
	self:reset();
end

--数据重置
GamePlayerManager2.reset = function(self,isClean)
	local tb = {self.m_playerInfo,self.m_lookerInfo};
	for _,val in pairs(tb) do
		for k, v in pairs(table.verify(val))do
			delete(v);
			v = nil;
		end
	end
	self.m_playerInfo = {};
	self.m_lookerInfo = {};
	self.m_simpleInfo = {};
	if not isClean then
		self:initMySelData();
	end
end

GamePlayerManager2.initMySelData = function(self)
	local info = self:getSelfData();

	self:addPlayer(info,PlayerSeat.getInstance():getMyLocalSeat());
end

GamePlayerManager2.getPlayerByMid = function(self, mid)
	for k,v in pairs(self.m_playerInfo) do
		if v and v:getMid() == mid then
			return Copy(v);
		end
	end
end

--根据用户mid计算此id对应的local seatid
GamePlayerManager2.getLocalSeatByMid = function(self, mid)
	if mid == UserBaseInfoIsolater.getInstance():getUserId() then
		return PlayerSeat.getInstance():getMyLocalSeat();
	end
	local info = self:getPlayerByMid(mid);
	if info then
		return PlayerSeat.getInstance():getLocalSeat(info:getSeatId());
	end
	return -1;
end

-- 根据用户mid获得用户的serverId
GamePlayerManager2.getServerIdByMid = function(self, mid)
	local info = self:getPlayerByMid(mid);
	if info then 
		return info:getSeatId();
	end

	return -1;
end

--根据用户mid获得此id对应的头像链接 [+] by ZedLi 2014.11.26
GamePlayerManager2.getAvatarByMid = function(self,mid)
	local info = self:getPlayerByMid(mid);
	if info then
		return info.Avatar_b;
	end
end

--添加用户
GamePlayerManager2.addPlayer = function(self, playerInfo, seat)
	seat = seat or PlayerSeat.getInstance():getLocalSeat(playerInfo:getSeatId());
	if PlayerSeat.getInstance():isSeatLegal(seat) and playerInfo.m_info then
		playerInfo:setClientId(seat);
		self.m_playerInfo[seat] = playerInfo;
		local data = {seatId = seat, sex = playerInfo:getSex(),nick = playerInfo:getNick()};
		self.m_simpleInfo[playerInfo:getMid()] = data;
		return true, seat;
	end
	return false;
end

-- 获取本地对应位置的用户信息
GamePlayerManager2.getPlayerBySeat = function(self, localSeat)
	return Copy(self.m_playerInfo[localSeat]);
end

-- 通过svr的seatid获取对应的用户信息
GamePlayerManager2.getPlayerBySeatId = function(self, seatid)
	return self:getPlayerBySeat(PlayerSeat.getInstance():getLocalSeat(seatid));
end

--移除玩家,seat本地座位号
GamePlayerManager2.removePlayer = function(self, seat)
	if seat and seat ~= PlayerSeat.getInstance():getMyLocalSeat() then
		local playerInfo = self.m_playerInfo[seat];
		if playerInfo then
			self.m_simpleInfo[playerInfo:getMid()] = nil;
			delete(playerInfo);
			playerInfo = nil;
			self.m_playerInfo[seat] = nil;
		end
	end
end

--根据mid移除用户
GamePlayerManager2.removePlayerByMid = function(self, mid)
	local localSeat = self:getLocalSeatByMid(mid);
	self:removePlayer(localSeat);
end

--移除其它所有的用户
GamePlayerManager2.removeOtherPlayers = function(self)
	local player = Copy(self.m_playerInfo)
	for k,v in pairs(table.verify(player)) do
		self:removePlayer(v:getClientId());
	end
	player = nil;
end

--获得所有的用户
GamePlayerManager2.getAllPlayer = function(self)
	return Copy(self.m_playerInfo);
end

--获得所有其它的用户
GamePlayerManager2.getOtherPlayers = function(self)
	local data = {};
	for k,v in pairs(self.m_playerInfo) do
		if v:getMid() ~= UserBaseInfoIsolater.getInstance():getUserId() then
			table.insert(data,v);
		end
	end
	return data;
end

--获得所有其它的用户
GamePlayerManager2.getOtherSimplePlayers = function(self)
	local data = {};
	for k,v in pairs(self.m_simpleInfo) do
		if k ~= UserBaseInfoIsolater.getInstance():getUserId() then
			data[k] = v;
		end
	end
	return data;
end


--更新用户信息
GamePlayerManager2.updatePlayerInfo = function(self, seat, infoMap)
	local player = self.m_playerInfo[seat];
	if not player then
		return;
	end
	for k,v in pairs(infoMap) do
		if v and v.key then
			local key = v.key;
			local value = v.value;
			if key == "money" then
				local propertyId = v.propertyId or RoomPropertyData.getInstance():getCurPropertyId(); --没传propertyId则默认为银币
				player:setMoney(value,propertyId);
 
				if self:isPlayerSelf(player:getMid()) then
					local money = number.valueOf(UserPropertyIsolater.getInstance():getMoneyById(propertyId));
					if money ~= value then
						UserPropertyIsolater.getInstance():setMoneyById( propertyId , value);
					end
				end 
			elseif key == "diamond" then
				player:setDiamond(value);
				if self:isPlayerSelf(player:getMid()) then
					local diamond = number.valueOf(UserPropertyIsolater.getInstance():getDiamond());
					if diamond ~= value then
						UserPropertyIsolater.getInstance():setDiamond(value);
					end
				end
			elseif key == "crystal" then -- 金条
				player:setCrystal(value);
				if self:isPlayerSelf(player:getMid()) then
					local crystal = number.valueOf(UserPropertyIsolater.getInstance():getCrystal());
					if crystal ~= value then
						UserPropertyIsolater.getInstance():setCrystal(value);
					end
				end
			elseif key == "exp" then
				player:setExp(value);
				if self:isPlayerSelf(player:getMid()) then
					UserExpInfoIsolater.getInstance():setExp(value);
				end 

			elseif key == "result" then
				if not PrivateRoomIsolater.getInstance():isInPrivateRoom() then
					-- 私人场不增加战绩
					local recordItemType = UserGameInfoIsolater.eRecordItemType.Draw;
					value = number.valueOf(value);
					if value > 0 then
						player:setWinCount(player:getWinCount() + 1);
						recordItemType = UserGameInfoIsolater.eRecordItemType.Win;
					elseif value == 0 then
						player:setDrawCount(player:getDrawCount() + 1);
						recordItemType = UserGameInfoIsolater.eRecordItemType.Draw;
					else
						player:setLoseCount(player:getLoseCount() + 1);
						recordItemType = UserGameInfoIsolater.eRecordItemType.Lose;
					end  

					if self:isPlayerSelf(player:getMid()) then--此处更新自己全局的胜负率
						UserGameInfoIsolater.getInstance():refreshGameRecordItemValue( GameInfoIsolater.getInstance():getCurGameId(), recordItemType);
					end
				end
			elseif key == "ready" then
				player:setIsReady(value);
			elseif key == "ai" then
				Log.wWF("record_bug_ai ","GamePlayerManager2.updatePlayerInfo","seat = ",seat,"userId = ",player:getMid(),"isAi = ",value);
				player:setIsAi(value);
			elseif key == "identity" then
				player:setIdentity(value);
			elseif key == "level" then
				player:setLevel(value);  -- 等级
			else 
				player:setInfoByType(key,value);
			end
		end
	end

	self:notify(GamePlayerManager2.Delegate.onPlayerInfoChanged,seat, player);
end

-- 是否为玩家自己
GamePlayerManager2.isPlayerSelf = function(self,userId)
	if userId == UserBaseInfoIsolater.getInstance():getUserId() then 
		return true;
	else 
		return false;
	end 
end

--获取现有的用户数量
GamePlayerManager2.getPlayerSize = function(self)
	return table.getSize(self.m_playerInfo);
end

-- 获取自己的用户信息
GamePlayerManager2.getSelfData = function(self, mySeatId, money, isReady)
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local selfUserInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(curGameId);
	local myInfo = GamePlayer2.formatUserInfo(selfUserInfo);
	myInfo:setMid(UserBaseInfoIsolater.getInstance():getUserId());
	myInfo:setSeatId(mySeatId);
	if isReady ~= nil then
		myInfo:setIsReady(isReady);
	end
	if money then
		myInfo:setMoney(money);
	end
	return myInfo;
end

-- 设置信息
GamePlayerManager2.setInfoByType = function(self,uid,key,value)
	local seatid = self:getLocalSeatByMid(uid);
	if self.m_playerInfo[seatid] then
		self.m_playerInfo[seatid]:setInfoByType(key,value);
	end
end

-- 根据key获取信息
GamePlayerManager2.getInfoByType = function(self,uid,key)
	local seatid = self:getLocalSeatByMid(uid);
	if self.m_playerInfo[seatid] then
		return self.m_playerInfo[seatid]:getInfoByType(key);
	end
	return nil;
end

-- 机器人ID，自定义生成规则
GamePlayerManager2.getRobotId = function(self,playerId)
	self.m_robotPlayerIds = table.verify(self.m_robotPlayerIds);
	local playerIdTmp = self.m_robotPlayerIds[playerId];
	if not playerIdTmp then		
		local function _createRobotId()
			local isSame = false;
			math.randomseed(tostring(os.time()):reverse():sub(1, 6));
			playerIdTmp = math.random(1000000, 3000000) + math.random(1, 20000);	
			local function _getDiffRobotId()
				for k,v in pairs(self.m_robotPlayerIds) do
					if v == playerIdTmp then
						isSame = true;
						break;
					end
				end
				if isSame then
					math.randomseed(tostring(os.time()):reverse():sub(1, 6));
					playerIdTmp = playerIdTmp + math.random(1, 1000);

					_getDiffRobotId();
				end
			end 
			_getDiffRobotId();
			

			for k,v in pairs(table.verify(self.m_playerInfo)) do 
				if v then 
					if v:getCid() == playerIdTmp then 
						isSame = true;
						break;
					end 
				end 
			end

			if isSame then
				_createRobotId();
			end 
		end
		_createRobotId(); 

		self.m_robotPlayerIds[playerId] = playerIdTmp;
	end
	return playerIdTmp;
end

--@brief 获得其他玩家cid
--@param cidList 包含自己cid以及添加好友cid
--@note 过滤自己cid以及添加好友cid 
GamePlayerManager2.getOtherPlayerCidList = function(self,cidList)
	-- body
    local flag = false;
    if table.isEmpty(cidList) then
        return;
    end
    local otherPlayerCidList = {};
	for k,v in pairs(table.verify(self.m_playerInfo)) do
		flag = false;
        if v then
            local tmpCid  = v:getCid();
			for index,obj in pairs(table.verify(cidList)) do	   
                if tmpCid == obj then
                   flag = true;
                   break;
                end
			end
            if not flag then
                table.insert(otherPlayerCidList,{cid = tmpCid});
            end
		end
	end
    return otherPlayerCidList;
end


GamePlayerManager2.getPlayerByCid = function(self, cid)
	for k, v in pairs(self.m_playerInfo) do
		if v and v:getCid() == cid then
			return Copy(v);
		end
	end
end

GamePlayerManager2.getLocalSeatByCid = function(self, cid)
	local info = self:getPlayerByCid(cid);
	if info then
		return PlayerSeat.getInstance():getLocalSeat(info:getSeatId());
	end
	return -1;
end

-- -- 德州添加用户，位置未移动前
-- GamePlayerManager2.addNotMovePlayer = function(self, playerInfo)
-- 	local seat = playerInfo:getSeatId();
-- 	local clientId = self:getLocalSeat(seat);
-- 	playerInfo:setClientId(clientId);
-- 	Log.d("GamePlayerManager2.addNotMovePlayer, clientId", clientId, "seat:", seat);
-- 	--if self:isSeatLegal(clientId) then 
-- 		self.m_playerInfo[seat + 1] = playerInfo;
-- 		self:notify(GamePlayerManager2.Delegate.onPlayerInfoChanged,seat + 1, playerInfo);
-- 		self:removeLooker(playerInfo:getMid());
-- 		return true, seat + 1;
-- 		--return true, seat + 1;
-- 	--end
-- 	--return false;
-- end

-- -- 直接坐下
-- GamePlayerManager2.addMovePlayer = function(self, playerInfo, isSit)
-- 	local seat = playerInfo:getSeatId();
-- 	local clientId = self:getLocalSeat(seat);
-- 	playerInfo:setClientId(clientId);
-- 	Log.d("GamePlayerManager2, clientId", clientId, "seat:", seat);
-- 	--if self:isSeatLegal(clientId) then 
-- 		self.m_playerInfo[seat + 1] = playerInfo;
-- 		self:notify(GamePlayerManager2.Delegate.onPlayerInfoChanged,clientId, playerInfo);
-- 		self:removeLooker(playerInfo:getMid());
-- 		--return true, seat + 1;
-- 	--end
-- 	--return false;
-- end

-- 用户站起
GamePlayerManager2.standUpPlayer = function(self, mid)
	local localSeat = self:getLocalSeatByMid(mid);
	local playerInfo = Copy(self.m_playerInfo[localSeat]);
	if playerInfo == nil then 
		return;
	end
	self:removePlayer(localSeat);
	self.m_lookerInfo = self.m_lookerInfo or {};
	table.insert(self.m_lookerInfo, playerInfo);
end

-- 添加旁观者
GamePlayerManager2.addLookPlayer = function(self, playerInfo)
	if playerInfo == nil then 
		return;
	end
	local mid = playerInfo:getMid();
	local localSeat = self:getLocalSeatByMid(mid);	
	self.m_lookerInfo = self.m_lookerInfo or {};
	table.insert(self.m_lookerInfo, playerInfo);
	self:removeRoomPlayer(localSeat);
end

-- 查找旁观者
GamePlayerManager2.getLookerByMid = function(self, mid)
	if self.m_lookerInfo == nil or #self.m_lookerInfo == 0 then 
		return nil;
	end
	for i = 1, #self.m_lookerInfo do 
		local v = self.m_lookerInfo[i];
		if v and v:getMid() == mid then 
			return Copy(v);
		end
	end
	return nil;
end

--移除旁观者
GamePlayerManager2.removeLooker = function(self, mid)
	if self.m_lookerInfo == nil or #self.m_lookerInfo == 0 then 
		return;
	end
	for i = 1, #self.m_lookerInfo do 
		local v = self.m_lookerInfo[i];
		if v and v:getMid() == mid then 
			local user = table.remove(self.m_lookerInfo, i);
			delete(user);
			break;
		end
	end
end

-- 德州玩家站起玩家退出房间
GamePlayerManager2.removeRoomPlayer = function(self, mid)
	local playerInfo = self:getPlayerByMid(mid);
	local localSeat = self:getLocalSeatByMid(mid);	
	if playerInfo then 
		self:removePlayer(localSeat);
		if localSeat < 0 or localSeat > 8 then 
			return;
		end
	end
end

GamePlayerManager2.getSimpleInfo = function(self,uid)
	return self.m_simpleInfo[uid];
end

-- 请注意，不要直接使用kGamePlayerManager2！！！
kGamePlayerManager2 = GamePlayerManager2.getInstance();