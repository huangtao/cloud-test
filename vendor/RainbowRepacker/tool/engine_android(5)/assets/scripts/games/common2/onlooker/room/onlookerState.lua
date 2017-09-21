require("games/common2/room/commonGameState2");
require("games/common2/plugin/pluginManager");
require("statesConfig");

OnlookerState = class(CommonGameState2);

OnlookerState.load = function(self)
	CommonGameState2.load(self);
    
    local lastStateSceneConfig = self:getBundleData(); 

	lastStateSceneConfig = table.verify(lastStateSceneConfig);
	local gameController = lastStateSceneConfig.controller;
	local gameScene = lastStateSceneConfig.scene;
	local param = table.verify(lastStateSceneConfig.param);
	if not (gameController or gameScene) then 
		return;
	end

	local OnlookerController = require("games/common2/onlooker/room/onlookerController");
	local OnlookerScene = require("games/common2/onlooker/room/onlookerScene");

	local controller = PluginManager.bind(gameController, OnlookerController);
	local scene = PluginManager.bind(gameScene,OnlookerScene);

	self:loadView(controller,scene,unpack(param));

	return true;
end

OnlookerState.run = function(self)
	CommonGameState2.run(self);
	local controller = self:getController();
	controller:initOnlookerRoom();
end

OnlookerState.stop = function(self)
	local controller = self:getController();
	controller:releaseOnlookerRoom();
	CommonGameState2.stop(self);
end


OnlookerState.unload = function(self)
	CommonGameState2.unload(self);
	
	local _,_,lastStatesConfig,lastStatesMapConfig = self:getBundleData(); 
	if not table.isEmpty(lastStatesConfig) then 
		States = Copy(lastStatesConfig);
	end 

	if not table.isEmpty(lastStatesMapConfig) then 
		StatesMap = Copy(lastStatesMapConfig);
	end 
end