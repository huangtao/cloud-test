

GameProcessManager2 = class();

GameProcessManager2.getInstance = function()
	-- body
	if not GameProcessManager2.s_instance then
		GameProcessManager2.s_instance = new(GameProcessManager2);
	end
	return GameProcessManager2.s_instance;
end

GameProcessManager2.releaseInstance = function()
	kGameProcessManager2 = nil;
	delete(GameProcessManager2.s_instance);
	GameProcessManager2.s_instance = nil;
	local pkg = package.loaded;
	pkg["games/common2/data/gameProcessManager2"] = nil;
end

GameProcessManager2.reset = function(self)
	self.m_gameCommonConfig = {};
end

GameProcessManager2.ctor = function(self)
	self.m_gameCommonConfig = {};
end

GameProcessManager2.dtor = function(self)
end

--获取游戏的基本config   数据来源类似  game/eqs/eqsConfig
GameProcessManager2.setGameConfig = function(self, config)
	self.m_gameCommonConfig = config;
    -- ExpressionDataManager.getInstance():setExpConfig(config.expressionConfig);
end

--获取游戏的基本config   数据来源类似  game/eqs/eqsConfig
GameProcessManager2.getGameConfig = function(self)
	return table.verify(self.m_gameCommonConfig);
end

-- 后续抛弃使用
kGameProcessManager2 = GameProcessManager2.getInstance();