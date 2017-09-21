
GameRoomData = class(DataInterfaceBase);

GameRoomData.Delegate = {
	refreshGameRoomData = "refreshGameRoomData";
};

--[[
	记录房间的公共信息，比如房间等级、IP、配置等信息
]]
GameRoomData.getInstance = function()
	if not GameRoomData.s_instance then
		GameRoomData.s_instance = new(GameRoomData);
	end
	return GameRoomData.s_instance;
end

GameRoomData.releaseInstance = function()
	delete(GameRoomData.s_instance);
	GameRoomData.s_instance = nil;
end
------------------------------------------------------
GameRoomData.ctor = function(self)
	self.m_info = {};
	self.m_isNotify = true;
end

GameRoomData.dtor = function(self)
	self.m_info = {};
end

GameRoomData.setRoomInfo = function(self,infoMap)
	if type(infoMap) == "table" then 
		local isNotify = self.m_isNotify;
		self.m_isNotify = false;

		for k,v in pairs(infoMap) do 
			self:_set(k,v);
		end 
		
		self.m_isNotify = isNotify;
		if isNotify then 
			self:notify(GameRoomData.Delegate.refreshGameRoomData);
		end 
	end 
end
GameRoomData.getRoomInfo = function(self)
    return self.m_info;
end

GameRoomData.clear = function(self)
    self.m_info = {};
end

GameRoomData.setNotifyStatus = function(self,isNotify)
    self.m_isNotify = isNotify;
end

GameRoomData.setInfoByType = function(self,key,value)
	self:_set(key,value);
end

GameRoomData.getInfoByType = function(self,key,defaultValue)
	return self:_get(key,defaultValue);
end
------------------------------------------------------
GameRoomData.setGameId = function(self,gameId)
	self:_set("gameId",gameId);
end

GameRoomData.getGameId = function(self)
	return self:_get("gameId",0);
end

GameRoomData.setRoomLevel = function(self,roomLevel)
	if not roomLevel then 
		return;
	end
	self:_set("roomLevel",roomLevel);
end

GameRoomData.getRoomLevel = function(self)
	return self:_get("roomLevel",GameInfoIsolater.getInstance():getCurRoomLevelId());
end

GameRoomData.setBaseChip = function(self,baseChip)
	self:_set("baseChip",baseChip);
end

GameRoomData.getBaseChip = function(self)
	return self:_get("baseChip",0);
end

GameRoomData.setOperateTime = function(self,operateTime)
	self:_set("operateTime",operateTime);
end

GameRoomData.getOperateTime = function(self)
	return self:_get("operateTime",0);
end

GameRoomData.setRoomId = function(self,roomId)
	self:_set("roomId",roomId);
end

GameRoomData.getRoomId = function(self)
	return self:_get("roomId",0);
end

GameRoomData.setServerId = function(self,serverId)
	self:_set("serverId",serverId);
end

GameRoomData.getServerId = function(self)
	return self:_get("serverId",0);
end

GameRoomData.setRoomIp = function(self,roomIp)
	self:_set("roomIp",roomIp);
end

GameRoomData.getRoomIp = function(self)
	return self:_get("roomIp",0);
end

GameRoomData.setRoomPort = function(self,roomPort)
	self:_set("roomPort",roomPort);
end

GameRoomData.getRoomPort = function(self)
	return self:_get("roomPort",0);
end

GameRoomData.setHasIngame = function(self,hasIngame)
	self:_set("hasIngame",hasIngame);
end

GameRoomData.getHasIngame = function(self)
	return self:_get("hasIngame",0);
end

GameRoomData.setKickUserInfo = function(self,configInfo)
	self:_set("kickUserInfo",configInfo);
end

GameRoomData.getKickUserInfo = function(self)
	return table.verify(self:_get("kickUserInfo"));
end

--设置游戏的基本config   数据来源类似  game/eqs/eqsConfig
GameRoomData.setGameConfig = function(self, config)
	self:_set("gameCommonConfig",config);
end

--获取游戏的基本config   数据来源类似  game/eqs/eqsConfig
GameRoomData.getGameConfig = function(self)
	return table.verify(self:_get("gameCommonConfig"));
end

-- 出牌时间
GameRoomData.setOutCardTime = function(self,outCardTime)
	self:_set("outCardTime",outCardTime);
end

GameRoomData.getOutCardTime = function(self)
	return self:_get("outCardTime",0);
end

GameRoomData.setSelfOutCardTime = function (self,selfOutCardTime)
	self:_set("selfOutCardTime",selfOutCardTime);
end

GameRoomData.getSelfOutCardTime = function (self)
	return self:_get("selfOutCardTime",0);
end

-- 是否重连
GameRoomData.setIsReconnect = function (self, isReconnect)
	self:_set("isReconnect",isReconnect);
end

GameRoomData.getIsReconnect = function (self)
	return self:_get("isReconnect",false);
end

--当前房间玩法
GameRoomData.setCurRoomPlayType = function(self,playType)	 
	self:_set("curRoomPlayType",playType);
end 
GameRoomData.getCurRoomPlayType = function(self)
	local playType = self:_get("curRoomPlayType");
	playType = tonumber(playType) or -1;
	if playType < 0 then 
		local curGameId = GameInfoIsolater.getInstance():getCurGameId();
		local curLevelId = self:getRoomLevel();
		playType = GameInfoIsolater.getInstance():getPlayTypeByLevelId(curGameId,curLevelId) or 0;
	end
	return playType;
end

--当前房间货币类型
GameRoomData.setCurRoomPropertyId = function(self,propertyId)	
	self:_set("curRoomPropertyId",propertyId);
end
GameRoomData.getCurRoomPropertyId = function(self)
	local propertyId = self:_get("curRoomPropertyId");
	propertyId = tonumber(propertyId) or -1;
	if propertyId < 0 then
		local curGameId = GameInfoIsolater.getInstance():getCurGameId();
		local curLevelId = self:getRoomLevel();
		propertyId = GameInfoIsolater.getInstance():getMoneyTypeByLevelId(curGameId,curLevelId) or 0;
	end 
	return propertyId;
end
------------------------------------------------------
GameRoomData._set = function(self,key,value)
    if key then 
        self.m_info[key] = value;

        if self.m_isNotify then 
        	self:notify(GameRoomData.Delegate.refreshGameRoomData);
    	end 
    end 
end

GameRoomData._get = function(self,key,defaultValue)
    if key and self.m_info[key] then 
        return self.m_info[key];
    else
        return defaultValue;
    end 
end