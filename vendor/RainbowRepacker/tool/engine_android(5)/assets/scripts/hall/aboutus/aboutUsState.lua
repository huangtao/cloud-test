require("common/commonScene")
local AboutUsScene = require("hall/aboutus/aboutUsScene");
require("hall/aboutus/aboutUsController");
local aboutus = require(ViewPath .. "hall/aboutus/aboutus");

AboutUsState = class(CommonState);

AboutUsState.ctor = function(self)
	self.m_controller = nil;
end

AboutUsState.getController = function(self)
	return self.m_controller;
end

AboutUsState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(AboutUsController, self, AboutUsScene, aboutus);
	return true;
end

AboutUsState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

AboutUsState.gobackLastState = function(self)
	StateMachine.getInstance():popState();
end

AboutUsState.dtor = function(self)
	
end


