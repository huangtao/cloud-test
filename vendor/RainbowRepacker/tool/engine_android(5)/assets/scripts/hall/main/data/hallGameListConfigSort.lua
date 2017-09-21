require("core/dict");
require("util/TableLib");
require("util/ImageCache");
require("gameData/gameData");
require("hall/php/phpSocketCmd");
require("gameData/clientInfo");

-- 游戏配置数据，包含游戏配置信息
local HallGameListConfigSort = class(GameData);

HallGameListConfigSort.VERSION = "0";

HallGameListConfigSort.Delegate = {
	onGetGameConfigSortCallBack = "onGetGameConfigSortCallBack";
}

HallGameListConfigSort.s_maxTryCount = 5;

HallGameListConfigSort.ctor = function(self)
end 

HallGameListConfigSort.dtor = function(self)
end 

--override
HallGameListConfigSort.initData = function(self)
	self.m_gameConfigSort = {};
end

HallGameListConfigSort.loadDictData = function(self, dict)
	local str = dict:getString("configSortList"..HallGameListConfigSort.VERSION) or "";
	local list = table.verify(json.decode(str));
	self:analysisData(list);
end

HallGameListConfigSort.saveDictData = function(self, dict)
	local str = json.encode(self:getGameConfigSort());
	if str then
		dict:setString("configSortList"..HallGameListConfigSort.VERSION, str);
	end
end

HallGameListConfigSort.getLocalDictName = function(self)
	return "HallGameListConfigSort";
end

HallGameListConfigSort.requestData = function(self)
	if not self.m_isTouched or table.isEmpty(self.m_gameConfigSort) then
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

		OnlineSocketManager.getInstance():sendMsg(PHP_HALLVIEW_CONFIG_SORT, param);
	end
end

HallGameListConfigSort.onGetGameConfigSortCallBack = function(self, isSuccess, info)
	if isSuccess then
		self:updateData(true, info);
		self:execDelegate(HallGameListConfigSort.Delegate.onGetGameConfigSortCallBack);
	else 
		if number.valueOf(self.m_tryCount, 0) <= HallGameListConfigSort.s_maxTryCount then
			self:requestData();
		end
	end 
end

HallGameListConfigSort.updateMemData = function(self, data)
	if table.isEmpty(data) then
		return;
	end

	self:analysisData(data);
end

HallGameListConfigSort.analysisDataItem = function(self, data)
    if not table.isEmpty(data) then
		data.game_pkg = tostring(data.game_pkg or "") or ""; --Lua包名(客户端安装路径)
		data.sort = tonumber(data.sort) or 1;                --排序值
    end
    return data;
end

HallGameListConfigSort.analysisData = function (self, data)
	self.m_gameConfigSort = {};
	if not table.isEmpty(data) then
		for k, v in pairs(data) do
			local item = self:analysisDataItem(v);
			self.m_gameConfigSort[item.game_pkg] = item; 
		end
	end
	return self.m_gameConfigSort;
end

-------------------------------- public ----------------------------------
-- 请求游戏排序数据
HallGameListConfigSort.requestGameConfig = function(self)
	self:requestData();
end

-- 获取游戏排序列表
HallGameListConfigSort.getGameConfigSort = function(self)
	return self.m_gameConfigSort or {};
end

-- 根据游戏Pkg获取游戏排序值
HallGameListConfigSort.getGameConfigSortByPkg = function(self, pkg)
	local sort = 0;
	local list = self:getGameConfigSort();	
	local data = list[pkg];
	if not table.isEmpty(data) then
		sort = data.sort;
	end
	return sort or 0;
end

HallGameListConfigSort.s_socketCmdFuncMap = {
	[PHP_HALLVIEW_CONFIG_SORT] = HallGameListConfigSort.onGetGameConfigSortCallBack;
};

return HallGameListConfigSort;