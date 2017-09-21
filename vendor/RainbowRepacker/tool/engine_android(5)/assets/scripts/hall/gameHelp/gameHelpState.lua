require("common/commonScene")
require("hall/gameHelp/gameHelpController");
local gamehelp = require(ViewPath .. "hall/gamehelp/gamehelp");

GameHelpState = class(CommonState);

GameHelpState.ctor = function(self)
	self.m_controller = nil;
end

GameHelpState.getController = function(self)
	return self.m_controller;
end

GameHelpState.load = function(self)
	CommonState.load(self);
    local GameHelpScene = require("hall/gameHelp/gameHelpScene");
	self.m_controller = new(GameHelpController, self, GameHelpScene, gamehelp);
	return true;
end

GameHelpState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

GameHelpState.gobackLastState = function(self)
	NativeEvent.getInstance():closeSecrecy();
	StateMachine.getInstance():popState();
end

GameHelpState.dtor = function(self)
	
end


