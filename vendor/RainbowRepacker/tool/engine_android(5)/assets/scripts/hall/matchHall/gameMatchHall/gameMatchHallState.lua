require("common/commonState")
require("hall/matchHall/gameMatchHall/gameMatchHallScene");
require("hall/matchHall/gameMatchHall/gameMatchHallController");


GameMatchHallState = class(CommonState);

GameMatchHallState.ctor = function ( self )
	self.m_controller = nil;
end

GameMatchHallState.getController = function ( self )
	return self.m_controller;
end

GameMatchHallState.load = function ( self )
	CommonState.load(self);
	local match_hall_layout = require(ViewPath .. "hall/matchHall/match_hall_layout");
	self.m_controller = new (GameMatchHallController, self, GameMatchHallScene, match_hall_layout);
	return true;
end

GameMatchHallState.unload = function ( self )
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end
