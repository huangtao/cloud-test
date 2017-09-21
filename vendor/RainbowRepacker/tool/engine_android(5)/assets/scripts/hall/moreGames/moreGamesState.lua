require("common/commonScene")
require("hall/moreGames/moreGamesScene");
require("hall/moreGames/moreGamesController");
local moreGames = require(ViewPath .. "hall/moreGames/moreGames");

MoreGamesState = class(CommonState);

MoreGamesState.ctor = function(self)
	self.m_controller = nil;
end

MoreGamesState.getController = function(self)
	return self.m_controller;
end

MoreGamesState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(MoreGamesController, self, MoreGamesScene, moreGames);
	return true;
end

MoreGamesState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

MoreGamesState.dtor = function (self)
end