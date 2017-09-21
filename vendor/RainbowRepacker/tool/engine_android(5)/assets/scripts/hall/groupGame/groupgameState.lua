require("common/commonScene");
require("hall/groupGame/groupgameScene");
require("hall/groupGame/groupgameController");

local groupgame = require(ViewPath.."hall/groupGame/groupgame");

GroupGameState = class(CommonState);
GroupGameState.ctor = function(self)
	self.m_controller = nil;
end

GroupGameState.getController = function(self)
	return self.m_controller;
end

GroupGameState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(GroupGameController, self, GroupGameScene, groupgame);
	return true;
end

GroupGameState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

GroupGameState.gobackLastState = function(self)
	self.m_controller:onBack();
end

GroupGameState.onExit = function(self)
	StateMachine.getInstance():popState();
end

GroupGameState.onContinue = function(self)
end

GroupGameState.onClose = function(self)
end

GroupGameState.dtor = function(self)
end
