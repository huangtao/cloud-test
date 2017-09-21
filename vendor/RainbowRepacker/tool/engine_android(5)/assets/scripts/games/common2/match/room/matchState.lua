require("games/common2/match/config/matchAnimConfig");
require("games/common2/match/room/matchScene");
require("games/common2/match/room/matchController");
require("games/common2/plugin/pluginManager");
require("games/common2/room/commonGameState2");

MatchState = class(CommonGameState2);

MatchState.load = function(self)
	CommonGameState2.load(self);
    
    local gameId = self:getBundleData(); --状态跳转时传的第一个参数
	self:_initGameMatchConfig(gameId);

	local isSuccess,gameController,gameScene,gameLayout = self:_getGameSceneConfig();
	if not isSuccess then 
		GameInfoIsolater.getInstance():startGame(GameInfoIsolater.getInstance():getHallGameType());
		return;
	end

	local controller = PluginManager.bind(gameController, MatchController);
	local scene = PluginManager.bind(gameScene,MatchScene);

	self:loadView(controller,scene, gameLayout);

	return true;
end

MatchState.run = function(self)
	CommonGameState2.run(self);
	local controller = self:getController();
	controller:initMatchRoom();
end

MatchState.stop = function(self)
	local controller = self:getController();
	controller:releaseMatchRoom();
	CommonGameState2.stop(self);
end

MatchState._initGameMatchConfig = function(self,gameId)
	GameMatchConfig = require("games/common2/match/room/gameMatchConfig");

	local gamePkg = GameInfoIsolater.getInstance():getGamePackageName(gameId); 
	if gamePkg == nil or gamePkg =="" then
        Log.e("MatchState._getGameMatchConfig","This game isn't exist !!! gameId = ",gameId);
        return;
    end
    local filePath = string.format("games/%s/%sMatchConfig", gamePkg, gamePkg);
    local isSuccess ,config = pcall(require,filePath);
    if not isSuccess then
        Log.e("MatchState._getGameMatchConfig","open File error. fileName = ", fileName);
        return;
    end

    if table.isEmpty(config) then 
    	Log.e("MatchState._getGameMatchConfig","matchConfig is nil !!! gameId = ",gameId);
    	return;
    end

    GameMatchConfig = Copy(config);

    GameMatchConfig.matchLogFileName = gamePkg.."_match";
end

MatchState._getGameSceneConfig = function(self)
	if table.isEmpty(GameMatchConfig) then 
		return;
	end 

	local config = GameMatchConfig.scene;
    local controller = config.controller;
    local scene = config.scene;
    local layoutConfig = config.sceneLayout;

    local gameController,gameScene,gameLayout;

    if type(controller) == "table" and controller[1] then
		local _controller = require(controller[1]);
		if table.isEmpty(_controller) then
			_controller = _G[controller[2]];
		end
		gameController = _controller;
	end 

	if type(scene) == "table" and scene[1] then
		local _scene = require(scene[1]);
		if table.isEmpty(_scene) then
			_scene = _G[scene[2]];
		end
		gameScene = _scene;
	end

	if type(layoutConfig) == "table" and layoutConfig[1] then
		local _layout = require(layoutConfig[1]);
		if table.isEmpty(_layout) then
			_layout = _G[layoutConfig[2]];
		end
		gameLayout = _layout;
	end

	local isSuccess = gameController and gameScene;

	return isSuccess,gameController,gameScene,gameLayout;
end