require("core/dict");
require("util/TableLib");
require("util/ImageCache");
require("gameData/gameData");
require("hall/php/phpSocketCmd");
require("hall/moreGames/data/moreGamesConstants");
require("gameData/clientInfo");

-- 更多游戏列表数据
local MoreGamesListConfig = class(GameData);

MoreGamesListConfig.Delegate = {
	onGetMoreGamesListCallBack = "onGetMoreGamesListCallBack";
};

MoreGamesListConfig.ctor = function(self)
end 

MoreGamesListConfig.dtor = function(self)
end 

--override
MoreGamesListConfig.initData = function(self)
	self.m_gameList = {}; --游戏列表
end

MoreGamesListConfig.loadDictData = function(self, dict)
	local strGameList = dict:getString("gameList") or "";
	local gameList = json.decode(strGameList);
	gameList = table.verify(gameList);

	self:analysisData(gameList);
end

MoreGamesListConfig.saveDictData = function(self, dict)
	local strGameList = json.encode(self.m_gameList or {});
	if strGameList then
		dict:setString("gameList", strGameList);
	end
end

MoreGamesListConfig.getLocalDictName = function(self)
	return "MoreGamesListConfig_1";
end

MoreGamesListConfig.setGameList = function(self,isSuccess,info)
	Log.d("MoreGamesListConfig.setGameList","isSuccess = ",isSuccess,"info = ",info);

	if not isSuccess then
		self:execDelegate(MoreGamesListConfig.Delegate.onGetMoreGamesListCallBack, false);
	else 
		self:updateData(true, info);
		self:execDelegate(MoreGamesListConfig.Delegate.onGetMoreGamesListCallBack,true, self:getGameList());	
	end 
end

MoreGamesListConfig.updateMemData = function(self, gamesConfig)
	self:analysisData(gamesConfig);
end

--config是一维数组
MoreGamesListConfig.analysisData = function (self,config)
	config = table.verify(config);

	local last = Copy(self.m_gameList);

	self.m_gameList = {};
	for k,v in pairs(config) do
		v.id = tonumber(v.id) or 0;              --id
		v.game_pkg = tostring(v.game_pkg or "") or ""; --Lua包名(客户端安装路径)
		v.icon = tostring(v.icon or "") or "";         --子游戏图标
		v.iconcomming = tostring(v.iconcomming or "") or ""; --字游戏图标(黑白)
		v.display = tonumber(v.display) or 0; --显示位置(0为大厅 1为更多游戏  2为固定游戏位 3为推荐游戏)
		v.position = tonumber(v.position) or 0; --当display为固定位置是游戏的排列位置
		v.isnew = tonumber(v.isnew) or 0; -- 是否新游戏（0为否 1为是）
		v.desc = tostring(v.desc or "") or ""; --游戏下载描述
		v.name = tostring(v.name or "") or ""; --游戏名称
		v.isFirstOpen = v.isFirstOpen or 1;
		
		table.insert(self.m_gameList,v);
	end

	if #last > 0 then 
		for _,v in pairs(last) do 
			for _,game in pairs(self.m_gameList) do 
				if v.id == game.id then 
                    game.isFirstOpen = v.isFirstOpen;
					break;
				end 
			end 
		end
	end 
end

-------------------------------- public ----------------------------------
MoreGamesListConfig.getGameList = function (self)
	for k,v in pairs(self.m_gameList) do 
		local state = kGameManager:getInitStatus(v.id);
		v.gameDownloadStatus = state and MoreGamesDownloadStatus.Successed or MoreGamesDownloadStatus.None;
	end 

	--排序
	local comp = function(a,b)
		if a and b and not string.isEmpty(a.game_pkg) and not string.isEmpty(b.game_pkg) and 
			number.isNum(a.isnew) and number.isNum(b.isnew) and
			number.isNum(a.isFirstOpen) and number.isNum(b.isFirstOpen) and
			number.isNum(a.gameDownloadStatus) and number.isNum(b.gameDownloadStatus) then
			local aIsNew = a.isnew == 1 and a.isFirstOpen == 1;
			local bIsNew = b.isnew == 1 and b.isFirstOpen == 1;
			local aIsDownload = a.gameDownloadStatus == MoreGamesDownloadStatus.Successed;
			local bIsDownload = b.gameDownloadStatus == MoreGamesDownloadStatus.Successed;
			if aIsNew and not bIsNew then
				return true;
			elseif not aIsNew and bIsNew then
				return false;
			elseif aIsDownload and not bIsDownload then
				return true;
			elseif not aIsDownload and bIsDownload then
				return false;
			else
				local sortA = kGameManager:getGameConfigSortByPkg(a.game_pkg);
				local sortB = kGameManager:getGameConfigSortByPkg(b.game_pkg);
				return sortA<sortB;
			end
		else
			return false;
		end
	end
	table.sort(self.m_gameList, comp);

	return self.m_gameList or {};
end

--更新下载状态
MoreGamesListConfig.updateGameDownloadStatus = function(self,gameId,status)
	local gamedata = table.verify(self.m_gameList);
	for k,v in pairs(gamedata) do 
		if v.id == gameId then 
			v.gameDownloadStatus = status;
		end 
	end 
	self:saveData();
end

MoreGamesListConfig.getDataByDownloadStatus = function(self,status)
	local gamedata = table.verify(self.m_gameList);
	local data = {};
	for k,v in pairs(gamedata) do 
		if v.gameDownloadStatus and v.gameDownloadStatus == status then
			table.insert(data,v);
		end 
	end

	return data;
end

--更新新游戏状态
MoreGamesListConfig.updateOpenStatus = function(self)
	local gamedata = table.verify(self.m_gameList);
	for k,v in pairs(gamedata) do 
		v.isFirstOpen = 0;
	end 
	self:saveData();
end

--获取新游戏状态
MoreGamesListConfig.getOpenStatus = function(self)
	local gamedata = table.verify(self.m_gameList);
	for k,v in pairs(gamedata) do 
		if v.isnew == 1 and v.isFirstOpen == 1 then 
			return true;
		end 
	end
	return false;
end

MoreGamesListConfig.s_socketCmdFuncMap = {
};

return MoreGamesListConfig;