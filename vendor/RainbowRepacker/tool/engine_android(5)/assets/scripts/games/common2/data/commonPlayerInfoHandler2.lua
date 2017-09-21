require("isolater/interface/userBaseInfoIsolater");
require("isolater/interface/userPropertyIsolater");
require("isolater/interface/userIdentityIsolater");
require("isolater/interface/userExpInfoIsolater");
require("isolater/interface/userGameInfoIsolater");
require("isolater/interface/gameInfoIsolater");

CommonPlayerInfoHandler2 = class();

--[[
	处理进入房间需要的用户信息，拼装自己的信息，解析server透传的userinfo信息
]]
CommonPlayerInfoHandler2.getInstance = function()
	if not CommonPlayerInfoHandler2.s_instance then
		CommonPlayerInfoHandler2.s_instance = new(CommonPlayerInfoHandler2);
	end
	return CommonPlayerInfoHandler2.s_instance;
end

CommonPlayerInfoHandler2.releaseInstance = function()
	delete(CommonPlayerInfoHandler2.s_instance);
	CommonPlayerInfoHandler2.s_instance = nil;
end
----------------------------------------------------------------
CommonPlayerInfoHandler2.ctor = function(self)
end

CommonPlayerInfoHandler2.dtor = function(self)
end
----------------------------------------------------------------
--获取玩家进入房间所需的信息
--返回table
CommonPlayerInfoHandler2.getUserLoginInfo = function(self,gameId)
	local commonInfo = self:_getCommonInfo(gameId);
	local extendInfo = self:_getExtendInfo(gameId);
	commonInfo = CombineTables(commonInfo, extendInfo);

	return table.verify(commonInfo);
end

--获取玩家进入房间所需的信息
--返回json字符串
CommonPlayerInfoHandler2.getUserLoginJsonInfo = function(self,gameId)
	local info = self:getUserLoginInfo(gameId);
	return self:encodeUserLoginJsonInfo(info)
end

CommonPlayerInfoHandler2.encodeUserLoginJsonInfo = function(self, info)
	local jsonData = json.encode(info);
	if not jsonData then --防止有非法字符，导致程序crash
		local commonInfo = self:_getCommonInfo(gameId);
		local extendInfo = self:_getExtendInfo(gameId);
		local commonJson = json.encode(commonInfo);
		local extendJson = json.encode(extendInfo);

		if not extendJson then 
			if commonJson then 
				jsonData = commonJson;
			else
				commonInfo.nick = "user";
				jsonData = json.encode(commonInfo);
			end 
		else
			info.nick = "user";
			jsonData = json.encode(info);
		end  
	end
	return jsonData or "[]";
end

--解析玩家进入房间所带的信息
--返回table
CommonPlayerInfoHandler2.parseUserLoginInfo = function(self,jsonStr)
	local userInfo = {};
	if jsonStr then
		if string.len(jsonStr) > 2 then
			userInfo =  table.verify(json.decode(jsonStr));
		end
	end

	local commonInfo = self:_parseCommonInfo(userInfo);
	local extendInfo = self:_parseExtendInfo(userInfo);
	commonInfo = CombineTables(commonInfo,extendInfo);
	return table.verify(commonInfo);
end
----------------------------------------------------------------
--公共信息和GamePlayer中的公共信息一一对应
CommonPlayerInfoHandler2._getCommonInfo = function(self,gameId)
	local levelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
	local propertyId = GameInfoIsolater.getInstance():getMoneyTypeByLevelId(gameId,levelId) or 0;

	local commonInfo = {};
	commonInfo.userId = UserBaseInfoIsolater.getInstance():getUserId();
	commonInfo.cid = UserBaseInfoIsolater.getInstance():getUserCid();
	commonInfo.nickName = UserBaseInfoIsolater.getInstance():getNickname();
	commonInfo.sex = UserBaseInfoIsolater.getInstance():getSex();
	commonInfo.money = UserPropertyIsolater.getInstance():getMoneyById(propertyId);--根据货币类型取得的资产数据,游戏重启马上重连时levelId不正确故此时资产类型不准
	commonInfo.diamond = UserPropertyIsolater.getInstance():getDiamond();
	commonInfo.crystal = UserPropertyIsolater.getInstance():getCrystal();
	commonInfo.m_identity = UserIdentityIsolater.getInstance():getIdentity();
	commonInfo.avatar_s = UserBaseInfoIsolater.getInstance():getAvatar_s();
	commonInfo.avatar_m = UserBaseInfoIsolater.getInstance():getAvatar_m();
	commonInfo.avatar_b = UserBaseInfoIsolater.getInstance():getAvatar_b();
	commonInfo.level = UserExpInfoIsolater.getInstance():getLevel();
	commonInfo.exp = UserExpInfoIsolater.getInstance():getExp();
	commonInfo.loseCount =  UserGameInfoIsolater.getInstance():getGameRecordItemValue(gameId, UserGameInfoIsolater.eRecordItemType.Lose);
	commonInfo.winCount =  UserGameInfoIsolater.getInstance():getGameRecordItemValue(gameId, UserGameInfoIsolater.eRecordItemType.Win);
    commonInfo.drawCount =  UserGameInfoIsolater.getInstance():getGameRecordItemValue(gameId, UserGameInfoIsolater.eRecordItemType.Draw);
    commonInfo.appid = UserBaseInfoIsolater.getInstance():getAppId();
    commonInfo.city = UserBaseInfoIsolater.getInstance():getCity();
    commonInfo.gold = UserPropertyIsolater.getInstance():getMoney();

	return commonInfo;
end

CommonPlayerInfoHandler2._parseCommonInfo = function(self,userInfo)
	local commonInfo = {};

	commonInfo.userId = number.valueOf(userInfo.userId);
	commonInfo.cid = userInfo.cid or commonInfo.userId;
	commonInfo.nickName = userInfo.nickName or "user";
	commonInfo.sex = number.valueOf(userInfo.sex);
	commonInfo.money = number.valueOf(userInfo.money);
	commonInfo.diamond = number.valueOf(userInfo.diamond);
	commonInfo.crystal = number.valueOf(userInfo.crystal);
	commonInfo.m_identity = number.valueOf(userInfo.m_identity);
	commonInfo.avatar_s = userInfo.avatar_s or "";
	commonInfo.avatar_m = userInfo.avatar_m or "";
	commonInfo.avatar_b = userInfo.avatar_b or "";	
	commonInfo.level = number.valueOf(userInfo.level);
	commonInfo.exp = number.valueOf(userInfo.exp);
	commonInfo.loseCount =  number.valueOf(userInfo.loseCount);
	commonInfo.winCount =  number.valueOf(userInfo.winCount);
    commonInfo.drawCount =  number.valueOf(userInfo.drawCount);	
	commonInfo.appid =  number.valueOf(userInfo.appid);	
	commonInfo.city = userInfo.city or "";	
	commonInfo.gold = userInfo.gold; --机器人不添加该字段
	
	return commonInfo;
end

--获取游戏扩展信息
CommonPlayerInfoHandler2._getExtendInfo = function(self,gameId)
	local extendInfoHandler = self:_getExtendInfoHandler(gameId);
	if type(extendInfoHandler) == "table" and extendInfoHandler.getExtendInfo then 
		return table.verify(extendInfoHandler.getExtendInfo(gameId));
	else 
		return {};
	end 
end

--解析游戏扩展信息
CommonPlayerInfoHandler2._parseExtendInfo = function(self,userInfo)
	local extendInfoHandler = self:_getExtendInfoHandler(gameId);
	if type(extendInfoHandler) == "table" and extendInfoHandler.parseExtendInfo then 
		return table.verify(extendInfoHandler.parseExtendInfo(userInfo));
	else 
		return {};
	end
end

--xxPlayerInfoHandler中必须包含这两个静态方法：getExtendInfo、parseExtendInfo
--xx代表游戏包名
CommonPlayerInfoHandler2._getExtendInfoHandler = function(self,gameId)
	gameId = gameId or GameInfoIsolater.getInstance():getCurGameId();
	local filePath = GameInfoIsolater.getInstance():getGameCustomConfigWithKey(gameId, "_customPlayerInfoHandler");
	if filePath then
		return require(filePath);
	else
		return nil;
	end
end

