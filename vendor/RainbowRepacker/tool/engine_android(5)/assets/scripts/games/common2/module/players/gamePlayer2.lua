
require("games/common2/data/commonPlayerInfoHandler2");

--[[
	记录玩家的基本信息
]]
GamePlayer2 = class();

GamePlayer2.ctor = function(self)
	-- body
	-- self.m_nick  		--玩家昵称
	-- self.m_avatar_s  	--玩家头像小
	-- self.m_avatar_m  	--玩家头像中
	-- self.setAvatar_b  	--玩家头像大
	-- self.m_sex			--玩家性别
	-- self.m_level	 		--玩家等级
	-- self.m_exp  			--玩家经验
	-- self.m_money	 		--玩家银币(对于德州来说，这就是房间内银币)
	-- self.m_totalMoney	--玩家总银币(对于德州来说)
	-- self.m_loseCount  	--玩家输的局数
	-- self.m_winCount		--玩家赢的局数
	-- self.m_drawCount		--玩家平的局数
	-- self.m_mid			--玩家ID
	-- self.m_seatId		--玩家座位id，server控制的
	-- self.m_isReady		--玩家准备状态
	-- self.m_isAi			--玩家ai状态
	-- self.m_diamond		--玩家钻石
	-- self.m_playFlag		--玩家当前状态
	-- self.m_clientSeatId	--客户端转换后的seatId(也就是移动后的座位Id)

	self.m_info = {};
end

GamePlayer2.dtor = function(self)
	self.m_info = {};
end

GamePlayer2.setUserInfo = function(self,infoMap)
	if type(infoMap) == "table" then 
		for k,v in pairs(infoMap) do 
			self:_set(k,v);
		end 
	end 
end
GamePlayer2.getUserInfo = function(self)
    return self.m_info;
end

GamePlayer2.clear = function(self)
    self.m_info = {};
end

GamePlayer2.setInfoByType = function(self,key,value)
	self:_set(key,value);
end
GamePlayer2.getInfoByType = function(self,key,defaultValue)
	return self:_get(key,defaultValue);
end
-------------------------------------------------------------------
GamePlayer2._set = function(self,key,value)
    if key then 
        self.m_info[key] = value;
    end 
end

GamePlayer2._get = function(self,key,defaultValue)
    if key and self.m_info[key] then 
        return self.m_info[key];
    else
        return defaultValue;
    end 
end
-------------------------------------------------------------------
GamePlayer2.setMid = function(self, mid)
	-- body
	self.m_mid = number.valueOf(mid,0);
end

GamePlayer2.getMid = function(self)
	-- body
	return self.m_mid or 0;
end

GamePlayer2.setCid = function(self, cid)
	self.m_cid = number.valueOf(cid, 0);
end

GamePlayer2.getCid = function(self)
	return self.m_cid and self.m_cid > 0 and self.m_cid or self:getMid();
end

GamePlayer2.setSeatId = function(self, seatId)
	-- body
	self.m_seatId = tonumber(seatId);
end

GamePlayer2.getSeatId = function(self)
	-- body
	return self.m_seatId or 0;
end

GamePlayer2.setIsReady = function(self, isReady)
	-- body
	self.m_isReady = isReady;
end

GamePlayer2.isReady = function(self)
	-- body
	return self.m_isReady or false;
end

GamePlayer2.setNick = function(self, nick)
	-- body
	self.m_nick = nick or "";
end

GamePlayer2.getNick = function(self)
	-- body
	if self:__checkIsDuringDefenseCheatTime() then
		return "匿名" .. self:getSeatId();
	else
		return self.m_nick or "user";
	end
end

GamePlayer2.setAvatar_s = function(self, avatar)
	-- body
	self.m_avatar_s = UserBaseInfoIsolater.getInstance():formatUserHeadUrl(avatar);
end

GamePlayer2.getAvatar_s = function(self)
	-- body
	if self:__checkIsDuringDefenseCheatTime()  then
		return "";
	else
		return self.m_avatar_s or "";
	end
end

GamePlayer2.setAvatar_m = function(self, avatar)
	-- body
	self.m_avatar_m = UserBaseInfoIsolater.getInstance():formatUserHeadUrl(avatar);
end

GamePlayer2.getAvatar_m = function(self)
	-- body
	if self:__checkIsDuringDefenseCheatTime() then
		return "";
	else
		return self.m_avatar_m or "";
	end
end

GamePlayer2.setAvatar_b = function(self, avatar)
	-- body
	self.m_avatar_b = UserBaseInfoIsolater.getInstance():formatUserHeadUrl(avatar);
end

GamePlayer2.getAvatar_b = function(self)
	-- body
	if self:__checkIsDuringDefenseCheatTime() then
		return "";
	else
		return self.m_avatar_b or "";
	end
end

GamePlayer2.getAvatar = function(self)
	-- body
	if self:__checkIsDuringDefenseCheatTime()  then
		return "";
	else
		return self.m_avatar_s or self.m_avatar_m or self.m_avatar_b or "";
	end
end

GamePlayer2.setSex = function(self, sex)
	-- body
	self.m_sex = sex or 0;
end

GamePlayer2.getSex = function(self)
	-- body
	if self:__checkIsDuringDefenseCheatTime()  then
		return 0;
	else
		return self.m_sex or 0;
	end
end

GamePlayer2.setLevel = function(self, level)
	-- body
	self.m_level = tonumber(level);
end

GamePlayer2.getLevel = function(self)
	-- body
	return self.m_level or 0;
end

GamePlayer2.setExp = function(self, exp)
	-- body
	self.m_exp = tonumber(exp);
end

GamePlayer2.getExp = function(self)
	-- body
	return self.m_exp or 0;
end

-- 资产
GamePlayer2.setMoney = function(self, money,propertyId)
	propertyId = propertyId or RoomPropertyData.getInstance():getCurPropertyId();
	if propertyId == UserPropertyIsolater.getInstance():getPropertyDiamondID() then 
		self:setDiamond(money);

	elseif propertyId == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then 
		self:setCrystal(money);

	elseif propertyId == UserPropertyIsolater.getInstance():getJifenID() then 
		self:_set("jifen",money);

	else 
		self:setGold(money);
	end 
end

GamePlayer2.getMoney = function(self)
	local propertyId = RoomPropertyData.getInstance():getCurPropertyId();
	if propertyId == UserPropertyIsolater.getInstance():getPropertyDiamondID() then 
		return self:getDiamond();

	elseif propertyId == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then 
		return self:getCrystal();

	elseif propertyId == UserPropertyIsolater.getInstance():getJifenID() then 
		return self:_get("jifen",0);

	else 
		return self:getGold();
	end
end

--银币
GamePlayer2.setGold = function(self,gold)
	self.m_gold = tonumber(gold);
end
GamePlayer2.getGold = function(self)
	return self.m_gold or 0;
end

GamePlayer2.setCity = function(self,city)
	self.m_city = city;
end

GamePlayer2.getCity = function(self)
	local city = self.m_city or RegionConfigIsolater.getInstance():getRegionDefaultCity();
    if city == "" then 
        city = RegionConfigIsolater.getInstance():getRegionDefaultCity();
    end
    return city;
end

GamePlayer2.setTotalMoney = function(self, value)
	self.m_totalMoney = value;
end
GamePlayer2.getTotalMoney = function(self)
	return self.m_totalMoney or 0;
end

GamePlayer2.setLoseCount = function(self, count)
	-- body
	self.m_loseCount = tonumber(count);
end

GamePlayer2.getLoseCount = function(self)
	-- body
	return self.m_loseCount or 0;
end

GamePlayer2.setWinCount = function(self, count)
	-- body
	self.m_winCount = tonumber(count);
end

GamePlayer2.getWinCount = function(self)
	-- body
	return self.m_winCount or 0;
end

GamePlayer2.setDrawCount = function(self, count)
	-- body
	self.m_drawCount = tonumber(count);
end

GamePlayer2.getDrawCount = function(self)
	-- body
	return self.m_drawCount or 0;
end

GamePlayer2.setIsAi = function(self, isAi)
	-- body
	self.m_isAi = isAi;
end

GamePlayer2.isAi = function(self)
	-- body
	return self.m_isAi or false;
end

GamePlayer2.setDiamond = function(self, diamond)
	-- body
	self.m_diamond = diamond or 0;
end

GamePlayer2.getDiamond = function(self)
	-- body
	return self.m_diamond or 0;
end

GamePlayer2.setCrystal = function(self, crystal)
	self.m_crystal = number.valueOf(crystal);
end

GamePlayer2.getCrystal = function(self)
	return self.m_crystal or 0;
end

GamePlayer2.setIdentity = function(self,identity )
	-- body
	self.m_identity = identity or 0;
end
GamePlayer2.getIdentity = function(self )
	-- body
	return self.m_identity or 0;
end

-- 德州中的玩家状态
GamePlayer2.setPlayFlag = function(self, playFlag)
	self.m_playFlag = playFlag;
end
GamePlayer2.getPlayFlag = function(self)
	return self.m_playFlag;
end

-- 德州中玩家是否弃牌
GamePlayer2.setIsFold = function(self, isFold)
	self.m_isFold = isFold;
end
GamePlayer2.getIsFold = function(self)
	return self.m_isFold or 0;
end

-- 是否显示底牌
GamePlayer2.setReponse = function(self, reponse)
	self.m_reponse = reponse;
end
GamePlayer2.getReponse = function(self)
	return self.m_reponse or 0;
end

-- 客户端座位ID
GamePlayer2.setClientId = function(self, seatId)
	self.m_clientSeatId = seatId;
end
GamePlayer2.getClientId = function(self)
	return self.m_clientSeatId;
end

GamePlayer2.formatUserInfo = function(jsonStr)
	local userInfo = CommonPlayerInfoHandler2.getInstance():parseUserLoginInfo(jsonStr);
	Log.d("GamePlayer2.formatUserInfo---",userInfo);
	local gp = new(GamePlayer2);
	gp:setMid(userInfo.userId or 0);
	gp:setNick(userInfo.nickName or "");
	gp:setAvatar_s(userInfo.avatar_s or "");
	gp:setAvatar_m(userInfo.avatar_m or "");
	gp:setAvatar_b(userInfo.avatar_b or "");
	gp:setSex(userInfo.sex or 0);
	gp:setLevel(userInfo.level or 0);
	gp:setExp(userInfo.exp or 0); 
	gp:setLoseCount(userInfo.loseCount or 0);
	gp:setWinCount(userInfo.winCount or 0);
	gp:setDrawCount(userInfo.drawCount or 0);	
	gp:setIdentity(userInfo.m_identity or 0);
	gp:setCity(userInfo.city or "");
	gp:setCid(userInfo.cid or gp:getMid() );
	gp:setMoney(userInfo.money or 0);
	gp:setDiamond(userInfo.diamond or 0);
	gp:setCrystal(userInfo.crystal or 0);
	if userInfo.gold then --机器人无gold这个字段
		gp:setGold(userInfo.gold or 0);
	else 
		gp:setMoney(userInfo.money or 0); --机器人重新刷新资产
	end
	gp:setUserInfo(userInfo);
	return gp;
end

GamePlayer2.__checkIsDuringDefenseCheatTime = function(self)
	return GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime() 
			and self:getMid() ~= UserBaseInfoIsolater.getInstance():getUserId();
end