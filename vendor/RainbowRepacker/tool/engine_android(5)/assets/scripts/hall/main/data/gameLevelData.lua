--[[
@作者：王金鹏
@功能：存储游戏的房间等级列表，用作选房间用

@modify by 王金鹏
@modify @ 2014-11-26
@新加功能  整合房间内配置与数据管理
]]

require("gameData/gameData");
require("hall/php/phpSocketCmd");
require("hall/gameData/appData");

GameLevelData = class(GameData);

GameLevelData.Delegate = {
	onGetGameLevelCallBack = "onGetGameLevelCallBack";
	onGetGameLevelPlayerCountCallBack = "onGetGameLevelPlayerCountCallBack";
	onGetGameLevelPlayerNumCallBack = "onGetGameLevelPlayerNumCallBack";
}

GameLevelData.initData = function(self)
	self.m_data = {};
	self.m_levelList = {};
	self.m_gotLevelStatus = {};	
	self.m_gameLevelStrPrefix = "gameId_";
	self.m_playerNums = {};
	self.m_allWaitGameIds = {};  --ID作为KEY值。
	self.waitTime = 5*60;  --5分钟 
	self.m_allLevels = {};
end

--@brief 获取列表人数
GameLevelData.requestGameLevelPlayerNum = function(self, game_id)

	if self:isNeedWait(game_id) then
		Log.v("GameLevelData.requestGameLevelPlayerNum","please wait");
		return;
	end

	local param = { 
		["game_id"] = game_id,
	};
	OnlineSocketManager.getInstance():sendMsg(PHP_GAME_LEVEL_COUNT, param);

end

--拉取人数
GameLevelData.onGetGameLevelPlayerCountCallBack = function(self,isSuccess,info,param)
	Log.v("GameLevelData.onGetGameLevelPlayerCountCallBack", "isSuccess = ",isSuccess ,"info = ",info,"param = ",param);	
	if isSuccess then
		local data = table.verify(info);
		if data.game_id then
			self:addToWait(data.game_id);
			self.m_playerNums[data.game_id] = data.level_cnt;
			self:execDelegate(GameLevelData.Delegate.onGetGameLevelPlayerNumCallBack);
		end
	end

end

GameLevelData.getGameLevelPlayerNum = function(self, game_id,levelId)

	game_id = tonumber(game_id);
	levelId = tostring(levelId);  --json解析出来的只支持表，不支持数组

	if not game_id or not levelId then
		return 0;
	end

	if self.m_playerNums[game_id] and  self.m_playerNums[game_id][levelId] then
		return self.m_playerNums[game_id][levelId] or 0;
	else
		return 0;	
	end
end
--根据GameId获取所有的levelId
GameLevelData.getLevelIdsByGameId = function(self,game_id)
	return self.m_allLevels[game_id] or {};
end

--是否需要等待
GameLevelData.isNeedWait = function(self, game_id)
	if not self.m_allWaitGameIds[game_id] then
		self.m_allWaitGameIds[game_id] = os.time();
		return false;
	else
		if 	os.time() - self.m_allWaitGameIds[game_id] > self.waitTime then
			self.m_allWaitGameIds[game_id] = nil;
			return false;
		else
			return true;	
		end
	end
end

--加入排队
GameLevelData.addToWait = function(self, game_id)
	self.m_allWaitGameIds[game_id] = os.time();
end

--@brief 请求游戏房间列表
GameLevelData.__requestGamelevelList = function(self, game_id, islevel_500)
	if table.isEmpty( self:__getGameLevelList(game_id) ) or not self:isGotGameLevel(game_id) then

		local timestamp = 0;
		local __gameVer = 0;
		local __hall_version = 0;

		if self.m_levelList[game_id] then
			timestamp = self.m_levelList[game_id].timestamp or 0;
			__gameVer = self.m_levelList[game_id].gameVer or 0;
			__hall_version = self.m_levelList[game_id].hall_version or 0;
			if __hall_version ~= kGameManager:getGameVersion(GameType.HALL) or __gameVer ~= kGameManager:getGameVersion(game_id) then
				timestamp = 0;
			end
		end


		local param = { 
			["game_id"] = game_id,
			["islevel_500"] = islevel_500,
			["hall_version"] = kGameManager:getGameVersion(GameType.HALL),
			["gameVer"] = kGameManager:getGameVersion(game_id),
			["current_ver"] = timestamp,
		};
		OnlineSocketManager.getInstance():sendMsg(PHP_GAME_LEVEL_LIST, param);
	end
end

--@brief 获取游戏各房间级别信息
--@param game_id:游戏id
--@param islevel_500:是否返回快速场数据，不传或0不返回，1返回
GameLevelData.getGameLevelListByGameId = function(self, game_id, islevel_500)
	self:getCurrentGameLocalConfig(game_id);
	self:__requestGamelevelList(game_id, islevel_500);

	return self:__getGameLevelList(game_id);
end

GameLevelData.__getGameLevelList = function(self, gameId)
	local strgameId = gameId ;
	return self.m_levelList[strgameId] or {};	
end

--@brief 根据gameId和levelId来获取等级信息
GameLevelData.getGameLevelInfo = function(self, gameId, levelId)
	local levelList = self:__getGameLevelList(gameId) or {};
	for k,v in pairs(levelList.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do 
			if vv.levelId == levelId then
				return vv;
			end
		end
	end
	return {};
end

--@brief 判断场次是否存在
--@note  去场次列表里面查找，如果找到，则认为存在， 反之则认为不存在
GameLevelData.isLevelExist = function(self, gameId, levelId)
	local levelList = self:__getGameLevelList(gameId) or {};
	for k,v in pairs(levelList.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do 
			if vv.levelId == levelId then
				return true
			end
		end
	end
	return false;
end

GameLevelData.onGetGameLevelCallBack = function(self,isSuccess,info,param)
	Log.v("GameLevelData.onGetGameLevelCallBack", "isSuccess = ",isSuccess ,"info = ",info,"param = ",param);	
	if not isSuccess then
		if info.errorType ~= 8000 then  -- == 8000表示无须更新。
			self:execDelegate(GameLevelData.Delegate.onGetGameLevelCallBack, false, param.game_id or 0,{}); 
		else
			if param.game_id then
				self.m_gotLevelStatus[param.game_id] = true;
			end
		end
		return;
	end
	local data = table.verify(info);
	self:updateData(true, data);
	local isSuccess = self:isGotGameLevel(data.gameid);
	self:execDelegate(GameLevelData.Delegate.onGetGameLevelCallBack, isSuccess, data.gameid, Copy( self:__getGameLevelList(data.gameid) ) );
end

--@override
GameLevelData.updateMemData = function(self, data)
	self:__analysisGameLevelData(data, true);
end

GameLevelData.__analysisGameLevelData = function(self, p_data, isUpdate)
	if table.isEmpty(p_data) then
		return;
	end

	local gameId = p_data.gameid;

	local levels = p_data.levels;
	if not gameId or table.isEmpty(levels) then
		return;
	end


	--如果是从服务器拉到的数据要对源数据进行补全，记录当前的版本信息
	if isUpdate then
		p_data.gameVer = kGameManager:getGameVersion(gameId);
		p_data.hall_version = kGameManager:getGameVersion(GameType.HALL);
	end

	self.m_data = p_data;

	local _isExist = false;
	for kId,vId in pairs(self.m_existGameIds or {}) do
		if tonumber(gameId) == tonumber(vId) then
			_isExist = true;
		end
	end

	if not _isExist then
		table.insert(self.m_existGameIds,gameId);
	end

	local allLevelIds = {};
	local info = {};
	info.timestamp = p_data.timestamp;
	info.gameId = p_data.gameId;
	info.gameVer = p_data.gameVer or 0;
	info.hall_version = p_data.hall_version or 0;
	info.data = {};
	for k, v in pairs(levels or {}) do
		local tmpMode = {};
		tmpMode.tab_id = v.tab_id;
		tmpMode.tab_name = v.tab_name;
		tmpMode.tab_sort = v.tab_sort;
		tmpMode.tab_selImage = v.img_on;
		tmpMode.tab_disImage = v.img_off;
		tmpMode.tab_data = {};

		for kk,vv in pairs(v.data or {}) do
			local tmp = {}
			tmp.play_mode = tonumber(vv.play_mode) or 0;  --玩法 0标准玩法，>=1 其他玩法
			tmp.base_chip_type = tonumber(vv.base_chip_type) or 0; --底注类型 0银币，1金条
			tmp.gameId = gameId;
			tmp.levelId = tonumber(vv.level) or 0; --房间级别
			table.insert(allLevelIds,tmp.levelId);
			tmp.minMoney = tonumber(vv.min_money) or 0; --银币下限
			tmp.maxMoney = tonumber(vv.max_money) or 0;	--银币上限
			tmp.baseChip = tonumber(vv.base_chip) or 0; --底注
			tmp.playerNum = tonumber(vv.cnt) or 0; --人数
			tmp.isZuan = number.valueOf(vv.is_zuan) == 1 and true or false; --是否为钻石房
			tmp.levelName = tostring(levelname) or ""; --房间名称
			tmp.isMatch = number.valueOf(vv.match) == 1 and true or false; --是否为比赛场 1:是 0:否
			tmp.desc = tostring(vv.desc) or ""; --比赛场描述
			tmp.canExit = number.valueOf(vv.canExit) == 1 and true or false; --是否一局可退
			tmp.icon = tostring(vv.icon) or ""; --场次图片
			tmp.isSilver = number.valueOf(vv.is_silver);
			tmp.sort = tonumber(vv.sort) or 0; --场次排序

			local require_chips_continue = number.valueOf(vv.require_chips_continue, 0);
			local high_limit_exit = number.valueOf(vv.high_limit_exit, 0);
			tmp.exitMinMoney = require_chips_continue > 0 and require_chips_continue or tmp.minMoney; -- 退场下限(比银币下限低)
			tmp.exitMaxMoney = high_limit_exit > 0 and high_limit_exit or tmp.maxMoney; -- 退场上限(比银币上限高)

			tmp.min_chip = number.valueOf(vv.min_chip);
			tmp.max_chip = number.valueOf(vv.max_chip);
			tmp.min_buy_money = number.valueOf(vv.min_buy_money);
			tmp.max_buy_money = number.valueOf(vv.max_buy_money);
			tmp.auto_by_money = number.valueOf(vv.auto_by_money);
			tmp.defense_cfg   = table.verify(vv.defense_cfg);  --防作弊时间段配置
			for k, vvv in pairs(tmp.defense_cfg or {}) do
				vvv.startTime = tonumber(vvv.startTime) or 0;
				vvv.endTime = tonumber(vvv.endTime) or 0;
			end

			tmp.extra_info = table.verify(vv.extra_info);
			-- 屏弊免费场
			if tmp.levelId ~= 51 then
				table.insert(tmpMode.tab_data, tmp); 
			end

			tmp.descend_switch = tonumber(vv.descend_switch) or 0;--配桌降场开关', 0关， 1开
			tmp.descend_seconds = tonumber(vv.descend_seconds) or -1;--配桌等待的时间
			tmp.invitation = number.valueOf(vv.invitation) == 1 and true or false;
		end

		--每个tab补全数据
		if table.getn(tmpMode.tab_data) > 0 then
			tmpMode.base_chip_type = tmpMode.tab_data[1].base_chip_type;
			tmpMode.play_mode = tmpMode.tab_data[1].play_mode;
			if tonumber(tmpMode.base_chip_type) == 1 then
				tmpMode.play_mode = 0;      --服务器约定用这个
			end 
		end


		table.sort( tmpMode.tab_data, function(v1, v2)
			if v1 and v2 then
				return number.valueOf(v1.sort) < number.valueOf(v2.sort);
			end
		end );
		table.insert(info.data,tmpMode); 

	end

	table.sort( info.data, function(v11, v22)
		if v11 and v22 then
			return number.valueOf(v11.tab_sort) < number.valueOf(v22.tab_sort);
		end
	end );

	self.m_levelList[gameId] = info;
	self.m_allLevels[gameId] = allLevelIds;

	if isUpdate then
		self.m_gotLevelStatus[gameId] = true;
	end

	return true;
end

--@brief 判断是否在防作弊时间段内
GameLevelData.isDuringDefenseCheatTime = function(self, gameId, levelId)
	if not gameId or not levelId then
		return false;
	end

	local list = self:__getGameLevelList(gameId);
	local curTime = kAppData:getRightTimeWithServer();
	
	--后台配置的时间戳是相对于登录时的天数(如0~24)，如果跨天后则会导致判断有问题，此时需将
	--当前时间转换到登录时天数区间进行判断。
	local dayInterval = ToolKit.getDayInterval( kAppData:getLoginServerTime(), curTime );
	curTime = curTime - dayInterval*24*3600;

	for k,v in pairs(list.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do
			if vv.levelId == levelId then
				for _, value in pairs( table.verify(vv.defense_cfg) ) do
					if curTime >= value.startTime and curTime <= value.endTime then
						return true;
					end
				end
				break;
			end
		end

	end

	return false;
end

--@brief 钱币是否合法去玩
GameLevelData.isLegalToPlay = function(self, gameId, levelId, money)
	local list = self:getGameLevelInfo(gameId,levelId);
	local isLegal = false;
	money = number.valueOf(money);

	if money >= list.minMoney and ( list.maxMoney == -1 or money <= list.maxMoney) then
		isLegal = true;
	end
	return isLegal;
end

--根据银币获取玩家可以玩牌的场次
--@note 判断当前的场次是否可以继续玩，根据的是入场上下线来判断
GameLevelData.getPlayableLevelIdByLoginMoney = function(self, gameId, money, currentLevelId)
	return self:_getPlayableLevelIdByMoney(gameId, money, currentLevelId,false);
end

--根据银币获取玩家可以玩牌的场次
--@note 判断当前的场次是否可以继续玩，根据的是退场上下线来判断
GameLevelData.getPlayableLevelIdByExitMoney = function(self, gameId, money, currentLevelId)
	return self:_getPlayableLevelIdByMoney(gameId, money, currentLevelId,true);
end

--根据银币获取玩家可以玩牌的场次
--@note 判断当前的场次是否可以继续玩，根据的是退场上下线来判断
GameLevelData.getPlayableLevelIdWithMoney = function(self, gameId, money, currentLevelId)
	return self:_getPlayableLevelIdByMoney(gameId, money, currentLevelId,true);
end

--根据gameId,levelId 获取玩法信息
GameLevelData.getPlayTypeByLevelId = function(self,p_gameId,p_levelId)
	local _levelInfo = self:getGameLevelInfo(p_gameId,p_levelId);
	return _levelInfo.play_mode;  
end

--根据gameId,levelId 获取底注类型
GameLevelData.getMoneyTypeByLevelId =  function(self,p_gameId,p_levelId)
	local _levelInfo = self:getGameLevelInfo(p_gameId,p_levelId);
	return _levelInfo.base_chip_type; 
end

--根据银币获取玩家可以玩牌的场次
--isByExitMoney:是否根据退场银币,false则根据入场银币判断
GameLevelData._getPlayableLevelIdByMoney = function(self, gameId, money, currentLevelId,isByExitMoney)
	local levelIdList = self:_getALLPlayableLevelIdsByMoney(gameId, money, currentLevelId,isByExitMoney);

	if not table.isEmpty(levelIdList) then
		local isContainCurrentLevelId = false;
		for _, v in ipairs(levelIdList or {}) do
			if v.levelId == currentLevelId then
				isContainCurrentLevelId = true;
				break;
			end
		end

		local minId = levelIdList[1].levelId;
		local maxId = levelIdList[#levelIdList].levelId;
		if isContainCurrentLevelId then
			return currentLevelId;
		elseif currentLevelId < minId then
			return minId;
		elseif currentLevelId > maxId then
			return maxId
		end
	end

	return -1;
end

GameLevelData.getPlayableMaxLevelIdByMoney = function(self,gameId, money, currentLevelId,isByExitMoney)
	local levelIdList = self:_getALLPlayableLevelIdsByMoney(gameId, money, currentLevelId,isByExitMoney);
	if table.isEmpty(levelIdList) then
		return -1;
	else
		return 	levelIdList[#levelIdList].levelId;
	end
end

--得到所有的能玩的levelID
GameLevelData._getALLPlayableLevelIdsByMoney = function(self, gameId, money, currentLevelId,isByExitMoney)
	local list = self:__getGameLevelList(gameId);
	money = number.valueOf(money);
	currentLevelId = number.valueOf(currentLevelId);
	local currentLevelIdPlay = self:getPlayTypeByLevelId(gameId,currentLevelId);

	local levelIdList = {};
	local isInTab = false;
	for k, v in pairs(list.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do
			if currentLevelId == vv.levelId then
				if isByExitMoney then 
					if money >= vv.exitMinMoney and ( vv.maxMoney == -1 or money <= vv.exitMaxMoney ) then
						table.insert(levelIdList,  vv);
					end
				else 
					if money >= vv.minMoney and ( vv.maxMoney == -1 or money <= vv.maxMoney ) then
						table.insert(levelIdList,  vv);
					end
				end 
				isInTab = true;  --找到了所在tab
			else
				if money >= vv.minMoney and ( vv.maxMoney == -1 or money <= vv.maxMoney) and  currentLevelIdPlay == vv.play_mode then --必须是一样的玩法
					table.insert(levelIdList,  vv);
				end
			end
		end	

		if isInTab then
			break;
		else
			levelIdList = {};
		end
	end

	if not table.isEmpty(levelIdList) then
		table.sort(levelIdList, function(a, b)
			if a and b then
				return a.minMoney < b.minMoney;  --取入场最小值进行比较
			end
		end);
	end	

	return levelIdList;
end



--获取指定玩法相同的所有的levelId列表
GameLevelData.getLevelIdByPlayType = function(self,p_gameId,playType)
	local levelIdList = {};
	for k, v in pairs(list.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do
			if vv.play_mode == playType then
				table.insert(levelIdList,vv.levelId);
			end 
		end 
	end 

	return levelIdList;
end

--获取指定货币类型的所有的levelId列表
GameLevelData.getLevelIdByMoneyType = function(self,p_gameId,moneyType)
	local levelIdList = {};
	for k, v in pairs(list.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do
			if vv.base_chip_type == moneyType then
				table.insert(levelIdList,vv.levelId);
			end 
		end 
	end 

	return levelIdList;
end

-- --获取与指定levelId相同玩法、相同货币类型的所有的levelId列表（包含原来的场次id）
GameLevelData.getLevelIdMatchPlayTypeAndMoneyTypeByLevelId = function(self,p_gameId,p_levelId)
	local _levelInfo = self:getGameLevelInfo(p_gameId,p_levelId);
	local playType = _levelInfo.play_mode;
	local moneyType = _levelInfo.base_chip_type; 

	return self:getLevelIdByPlayTypeAndMoneyType(p_gameId,playType,moneyType);
end

--获取游戏中指定玩法和指定货币类型的所有的levelId列表
GameLevelData.getLevelIdByPlayTypeAndMoneyType = function(self,p_gameId,playType,moneyType)
	local list = self:__getGameLevelList(p_gameId);
	local levelIdList = {};
	for k, v in pairs(list.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do
			if vv.play_mode == playType and vv.base_chip_type == moneyType then
				table.insert(levelIdList,vv.levelId);
			end 
		end 
	end 

	if not table.isEmpty(levelIdList) then
		table.sort(levelIdList, function(a, b)
			if a and b then
				return a < b;  
			end
		end);
	end 

	return levelIdList;
end

--根据levelId判断是否获取到了游戏的场次列表
GameLevelData.isGotGameLevel = function(self, gameId)
	return self.m_gotLevelStatus[gameId];
end
-- 是否银元场
GameLevelData.isSilverRoom = function ( self, gameId, levelId )
	-- body
	local list = self:__getGameLevelList(gameId) or {};
	for k,v in pairs(list.data or {}) do
		for kk,vv in pairs(v.tab_data or {}) do
			if vv.levelId == levelId then
				if vv.isSilver == 1 then
					return true;
				end
				break;
			end
		end
	end
	return false;
end

GameLevelData.getCurrentGameLocalConfig = function(self,p_gameId)
	if self.m_levelList[p_gameId] then
		return;
	end
	self:__getGameLocalConfig(p_gameId);
end

GameLevelData.__getGameLocalConfig = function(self,p_gameId)
	local data = json.decode(self.m_existGameLevelConfigStr[p_gameId] or "") or {};
	if not table.isEmpty(data) then
		self:__analysisGameLevelData(data);
	end
end

--@override  原来这个函数把所有的东西都删除了重写，现在是覆盖。
GameLevelData.saveData = function(self)
	local dictName = self:getLocalDictName();
	if not dictName then
		return;
	end

	local dict = new(Dict,dictName);
	--dict:delete();  不能全部删除
	self:saveDictData(dict);
	dict:save();
	delete(dict);
end

--@override
GameLevelData.loadDictData = function(self, dict)
	--把所有存放的gameId解析出来
	--根据解析出来的gameId把对应的json字符串读出来，当需要的时候动态解析
	local existGameIds = dict:getString("existGameIds");
	self.m_existGameIds = json.decode(existGameIds) or {};

	self.m_existGameLevelConfigStr = {};
	for k,v in pairs(self.m_existGameIds or {}) do
		self.m_existGameLevelConfigStr[v] = dict:getString(self.m_gameLevelStrPrefix..v);	
	end		

end

--@override
GameLevelData.saveDictData = function(self, dict)
	--存对应表
	dict:setString("existGameIds", json.encode(self.m_existGameIds) or "");
	if self.m_data.gameid then
		dict:setString(self.m_gameLevelStrPrefix..self.m_data.gameid, json.encode(self.m_data) or "");
	end
end

--@override
GameLevelData.getLocalDictName = function(self)
	return "GameLevelDataV2";
end

GameLevelData.s_socketCmdFuncMap = {
	[PHP_GAME_LEVEL_LIST]	 = GameLevelData.onGetGameLevelCallBack;
	[PHP_GAME_LEVEL_COUNT]	 = GameLevelData.onGetGameLevelPlayerCountCallBack;
};
