require("core/dict");
require("util/TableLib");
require("gameData/gameData");
require("hall/php/phpSocketCmd");
require("gameData/clientInfo");

local HallModuleListConfig = class(GameData);

HallModuleListConfig.Delegate = {
	onGetModuleListCallBack = "onGetModuleListCallBack";
	onModuleListUpdated = "onModuleListUpdated";
}

-- HallModuleListConfig.defaultCofig = {
-- 	--id:子游戏id;
-- 	--url:子游戏安装/更新包地址;
-- 	--icon:子游戏图标;version:子游戏版本号;
-- 	--md5:包验证值;
-- 	--status:状态 0:敬请期待(游戏占位符) 1:无变化 2:可安装 3:可更新

-- 	[1]={["id"]=10000000,["game_pkg"]="games/agency"},
-- };

HallModuleListConfig.defaultCofig = {};

HallModuleListConfig.ctor = function(self)
end 

HallModuleListConfig.dtor = function(self)
end 

--override
HallModuleListConfig.initData = function(self)
	self.m_moduleList = {}; --游戏列表
end

HallModuleListConfig.loadDictData = function(self, dict)
	local strModuleList = dict:getString("moduleList") or "";
	local gameList = json.decode(strModuleList);
	gameList = table.isEmpty(gameList) and HallModuleListConfig.defaultCofig or gameList;
	self:analysisData(gameList);
end

HallModuleListConfig.saveDictData = function(self, dict)
	local strModuleList = json.encode( self.m_moduleList or {} );
	if strModuleList then
		dict:setString("moduleList", strModuleList);
	end
end

HallModuleListConfig.getLocalDictName = function(self)
	return "HallModuleListConfig";
end

HallModuleListConfig.requestData = function(self)
	if not self.m_isTouched or table.isEmpty(self.m_moduleList) then
		local param = {};
		param.hall_version = kGameManager:getGameVersion(GameType.HALL);
	    -- IOS不需要传branch，否则PHP返回数据会出现错误
	    param.branch = kBranch;
		if System.getPlatform() == kPlatformIOS then
		    param.branch=nil;
		end
		param.guid = kClientInfo:getGuid();
		
		OnlineSocketManager.getInstance():sendMsg(PHP_MODULELIST_CONFIG, param);
	end
end

HallModuleListConfig.onGetModuleListCallBack = function(self,isSuccess,info)
	Log.v("HallModuleListConfig.onGetModuleListCallBack", "isSuccess = ", isSuccess, "info = ", info);
	if not isSuccess then
		self:execDelegate(HallModuleListConfig.Delegate.onGetModuleListCallBack, false);
	else 
		self:updateData(true, info);
		self:execDelegate(HallModuleListConfig.Delegate.onGetModuleListCallBack, true);	
	end 
end

HallModuleListConfig.updateMemData = function(self, gamesConfig)
	self:analysisData(gamesConfig);
end

--config是一维数组
HallModuleListConfig.analysisData = function (self,config)
	config = table.verify(config);

	self.m_moduleList = {};
	for k,v in pairs(config) do
		v.id = tonumber(v.id) or 0;              --id
		v.game_pkg = tostring(v.game_pkg) or ""; --Lua包名(客户端安装路径)
		v.name = tostring(v.name) or "";
		v.url = tostring(v.url) or "";
		v.hash = tostring(v.hash) or "";
		v.size = tonumber(v.size) or 0;

		table.insert(self.m_moduleList, v);
	end

	self:execDelegate(HallModuleListConfig.Delegate.onModuleListUpdated, Copy(self.m_moduleList) );
end
----------public

HallModuleListConfig.getModuleList = function (self)
	return self.m_moduleList or {};
end

--根据游戏ID获取游戏配置
HallModuleListConfig.getModuleConfigById = function(self,gameId)
	local gamedata = self:getModuleList();
	local data = {};
	for k,v in pairs(gamedata) do
		if v.id == gameId then
			data = v;
			break;
		end
	end
	return data or {};
end

HallModuleListConfig.s_socketCmdFuncMap = {
	[PHP_MODULELIST_CONFIG]	 = HallModuleListConfig.onGetModuleListCallBack;
};

return HallModuleListConfig;