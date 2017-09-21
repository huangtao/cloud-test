require("core/dict");
require("util/TableLib");
require("util/ImageCache");
require("gameData/gameData");
require("hall/php/phpSocketCmd");
require("gameData/clientInfo");

-- 游戏列表数据，包含排序信息
local HallGameListConfig = class(GameData, false);

HallGameListConfig.VERSION = "0";

HallGameListConfig.Delegate = {
	onGetGameListCallBack = "onGetGameListCallBack";
	onGameListUpdated = "onGameListUpdated";

	onGetMoreGamesListCallBack = "onGetMoreGamesListCallBack";
    onMoreGamesListUpdate = "onMoreGamesListUpdate";
}


HallGameListConfig.PAGE_NUM = 4;
HallGameListConfig.s_maxTryCount = 5;
HallGameListConfig.s_hallGameLimit = 8; -- 大厅子游戏不大于8个

HallGameListConfig.defaultCofig = RegionConfigDataInterface.getInstance():getRegionDefaultGamesConfig();

HallGameListConfig.ctor = function(self,...)
local HallGameListConfigSort = require("hall/main/data/hallGameListConfigSort");
	self.m_gameListConfigSort = new(HallGameListConfigSort, self);
	super(self,...);
end 

HallGameListConfig.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);

	delete(self.m_gameListConfigSort);
	self.m_gameListConfigSort = nil;
end 

--override
HallGameListConfig.initData = function(self)
	self.m_gameList = {}; --游戏列表
	self.m_gamePageList = {}; --游戏分页后的列表 4个为一页
end

HallGameListConfig.loadDictData = function(self, dict)
	self.m_clientVersion = number.valueOf(dict:getInt("version"..HallGameListConfig.VERSION), -1);
	self.m_hallVersion = number.valueOf(dict:getInt("hallVersion"..HallGameListConfig.VERSION), -1);
	local str = dict:getString("configList"..HallGameListConfig.VERSION) or "";
	local list = json.decode(str);
	list = table.isEmpty(list) and HallGameListConfig.defaultCofig or list;
	self:analysisData(list);
end

HallGameListConfig.saveDictData = function(self, dict)
	local str = json.encode(self:_getAllGameList());
	if str then
		dict:setString("configList"..HallGameListConfig.VERSION, str);
		dict:setInt("version"..HallGameListConfig.VERSION, number.valueOf(self.m_clientVersion, -1));
		dict:setInt("hallVersion"..HallGameListConfig.VERSION, number.valueOf(self.m_hallVersion, -1));
	end
end

HallGameListConfig.getLocalDictName = function(self)
	return "HallGameListConfig";
end

HallGameListConfig.requestData = function(self, isForce)
	if not self.m_isTouched or table.isEmpty(self.m_gameList) or isForce then
		self.m_tryCount = number.valueOf(self.m_tryCount, 0) + 1;

		local param = {};
		param.hall_version = kGameManager:getGameVersion(GameType.HALL);
	    --IOS不需要传branch，否则PHP返回数据会出现错误
	    param.branch = kBranch;
		if System.getPlatform() == kPlatformIOS then
		    param.branch=nil;
		end
		param.enable_special_game = 1; --此位标识特殊游戏位，1为返回，0为不返回--包括私人房，比赛场
		param.guid = kClientInfo:getGuid();
		param.lastLoginMid = kLoginDataInterface:getLastMid();--用户上次登录的Mid, 用于游戏列表白名单控制
        -- 大厅版本号不同重现拉取数据
        if param.hall_version ~= self.m_hallVersion then
	        self.m_clientVersion = -1;
        end

		param.cli_ver = self.m_clientVersion; -- 带本地版本号

		OnlineSocketManager.getInstance():sendMsg(PHP_HALLVIEW_CONFIG, param);
	end
end

HallGameListConfig.onGetGameListCallBack = function(self,isSuccess,info)
	if isSuccess then
		if not table.isEmpty(info) then
		    self.m_tryCount = 0;
		    local clientVersion = self.m_clientVersion;
		    local serverVersion = number.valueOf(info.ver);

		    -- 根据版本号进行更新
		    if clientVersion < serverVersion then
			    self.m_clientVersion = serverVersion;
                self.m_hallVersion = kGameManager:getGameVersion(GameType.HALL);
			    self:updateData(true, info.info);
			    self:execDelegate(HallGameListConfig.Delegate.onGetGameListCallBack, true, Copy(self.m_gamePageList));	
				self:execDelegate(HallGameListConfig.Delegate.onGetMoreGamesListCallBack, true, Copy(self.m_gameListMore));
		    end
        end
	else 
		self:execDelegate(HallGameListConfig.Delegate.onGetGameListCallBack, false);
		self:execDelegate(HallGameListConfig.Delegate.onGetMoreGamesListCallBack, false);
		if number.valueOf(self.m_tryCount, 0) <= HallGameListConfig.s_maxTryCount then
			self:requestData();
		end
	end 
end

HallGameListConfig.updateMemData = function(self, data)
	if table.isEmpty(data) then
		return;
	end

	self:analysisData(data);
end

HallGameListConfig.analysisDataItem = function(self, data)
    if not table.isEmpty(data) then
		data.id = tonumber(data.id) or 0;              --id
		data.game_pkg = tostring(data.game_pkg or "") or ""; --Lua包名(客户端安装路径)
		data.display = tonumber(data.display) or 0; --显示位置(0为大厅 1为更多游戏  2为固定游戏位 3为推荐游戏)
		data.icon = tostring(data.icon or "") or "";         --子游戏图标
		data.iconcomming = tostring(data.iconcomming or "") or ""; --字游戏图标(黑白)
		data.position = tonumber(data.position) or 0; --当display为固定位置是游戏的排列位置
		data.isnew = tonumber(data.isnew) or 0; -- 是否新游戏（0为否 1为是）
		data.desc = tostring(data.desc or "") or ""; --游戏下载描述
		data.name = tostring(data.name or "") or ""; --游戏名称
		data.isMatch = number.valueOf(data.isMatch); --是否有比赛
		data.isPrivate = number.valueOf(data.isPrivate); --是否有私人房
    end
    return data;
end

--config是一维数组
HallGameListConfig.analysisData = function (self, config)
	if table.isEmpty(config) then
		return;
	end

	self.m_gameList = {};
	for k,v in pairs(config) do
		table.insert(self.m_gameList, self:analysisDataItem(v));
	end

	-- 初始化游戏
	self:execDelegate(HallGameListConfig.Delegate.onGameListUpdated, self.m_gameList);

	self:_sortGameList();
	self:_partitionGameList();
	self:_generatePageList();
end

-- 排序，只有在排序列表不为空时排序
HallGameListConfig._sortGameList = function(self)
	local gameConfigSort = self.m_gameListConfigSort:getGameConfigSort();
	if not table.isEmpty(gameConfigSort) then
		--排序
		local comp=function(a,b)
			if a and b and not string.isEmpty(a.game_pkg) and not string.isEmpty(b.game_pkg) then
				local sortA = self.m_gameListConfigSort:getGameConfigSortByPkg(a.game_pkg);
				local sortB = self.m_gameListConfigSort:getGameConfigSortByPkg(b.game_pkg);
				return sortA<sortB;
			else
				return false;
			end
		end
		
		table.sort(self.m_gameList, comp);
	end
end

-- 划分大厅游戏和更多游戏
HallGameListConfig._partitionGameList = function(self)
	-- 统计子游戏数量
    local gameCount = 0;
	for k,v in pairs(self.m_gameList) do
        gameCount = gameCount + 1;
	end

	-- 分类
	self.m_gameListPartition = {};
	self.m_gameListMore = {};
	local hallGameCount = 0; -- 游戏数量
	for k,v in pairs(self.m_gameList) do
        local isNotPrivateAndMatch = v.game_pkg ~= "games/private_room" and v.game_pkg ~= "games/match_room";

    	-- 配置为更多游戏 或 子游戏数量大于8同时排序在前7之外
	    if v.display == 1 or 
	    	(gameCount > HallGameListConfig.s_hallGameLimit and hallGameCount >= HallGameListConfig.s_hallGameLimit - 1 and isNotPrivateAndMatch) then 
	    	-- 更多游戏
		    table.insert(self.m_gameListMore, v);
	    else
	    	-- 大厅游戏
		    table.insert(self.m_gameListPartition, v);
		    hallGameCount = hallGameCount + 1;
	    end
	end

	-- 插入更多游戏
	if not table.isEmpty(self.m_gameListMore) then
		table.insert(self.m_gameListPartition, {id = -1, game_pkg = "games/more_games", moreGames = self.m_gameListMore, sort = 9999999});
	end
end

-- 生成分页数据
HallGameListConfig._generatePageList = function(self)
	-- 分页
	local size=#self.m_gameListPartition;
	local pageNum= HallGameListConfig.PAGE_NUM;
	local intValue,floatValue=math.modf(size/pageNum);
	local pageCount=intValue+(floatValue > 0 and 1 or 0);
	
	if pageCount <= 0 then
		return;
	end

	self.m_gamePageList = {};
	for i = 1, pageCount do
		self.m_gamePageList[i] = {};

		for j = 1, pageNum do
			if (i-1)*pageNum+j <= size then
				self.m_gamePageList[i][j] = self.m_gameListPartition[(i-1)*pageNum+j];
			else
				break;
			end
		end
	end
end

HallGameListConfig._getAllGameList = function(self)
	return self.m_gameList;
end

-- 重排序游戏列表
HallGameListConfig._resortGameList = function(self)
	local list = self:_getAllGameList();
	if not table.isEmpty(list) then
		self:_sortGameList();
		self:_partitionGameList();
		self:_generatePageList();

    	self:execDelegate(HallGameListConfig.Delegate.onGetGameListCallBack, true, Copy(self.m_gamePageList));	
		self:execDelegate(HallGameListConfig.Delegate.onGetMoreGamesListCallBack, true, Copy(self.m_gameListMore));
	end
end

-- 拉取游戏配置排序列表回调
HallGameListConfig.onGetGameConfigSortCallBack = function(self)
    self:_resortGameList();
end

-------------------------------- public ----------------------------------
-- 请求游戏列表
HallGameListConfig.requestGameList = function(self)
	self:requestData();

	self.m_gameListConfigSort:requestGameConfig();
end

-- 强制请求游戏列表
HallGameListConfig.forceRefreshGameList = function(self)
	self:requestData(true);
end

-- 获取所有游戏列表
HallGameListConfig.getGameList = function (self)
	return self:_getAllGameList();
end

-- 获取游戏列表分页数据
HallGameListConfig.getGamePageList = function (self)
	return self.m_gamePageList or {};
end

-- 根据游戏ID获取游戏数据
HallGameListConfig.getGameDataById = function(self, gameId)
	local list = self:_getAllGameList();
	local data = {};
	for k,v in pairs(list) do
		if v.id == gameId then
			data = v;
			break;
		end
	end
	return data or {};
end

HallGameListConfig.getGameConfigSortByPkg = function(self, pkg)
	return self.m_gameListConfigSort:getGameConfigSortByPkg(pkg);
end

HallGameListConfig.s_socketCmdFuncMap = {
	[PHP_HALLVIEW_CONFIG] = HallGameListConfig.onGetGameListCallBack;
};

return HallGameListConfig;