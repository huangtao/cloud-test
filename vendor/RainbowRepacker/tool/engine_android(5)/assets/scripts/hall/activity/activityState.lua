require("common/commonScene")
require("hall/activity/activityScene");
require("hall/activity/activityController");
require("common/messageBox");

local activity = require(ActivityViewPath .. "activity")

ActivityState = class(CommonState)

ActivityState.ctor = function(self)
	self.m_controller = nil;
end

ActivityState.getController = function(self)
	return self.m_controller;
end

ActivityState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(ActivityController, self, ActivityScene, activity);
	return true;
end

ActivityState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

ActivityState.gobackLastState = function(self)
	self.m_controller:onBack();
end

ActivityState.onExit = function(self)
	StateMachine.getInstance():popState();
end

ActivityState.onContinue = function(self)
end

ActivityState.onClose = function(self)
end

ActivityState.dtor = function(self)
end
