require("common/commonScene")
require("hall/agency/agencyScene");
require("hall/agency/agencyController");
local agency = require(ViewPath .. "hall/agency/agency");

AgencyState = class(CommonState);

AgencyState.ctor = function(self)
	self.m_controller = nil;
end

AgencyState.getController = function(self)
	return self.m_controller;
end

AgencyState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(AgencyController, self, AgencyScene, agency);
	return true;
end

AgencyState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

AgencyState.gobackLastState = function(self)
	if self.m_controller then 
		local isExit =  self.m_controller:checkGoBack();
		if isExit then 
			StateMachine.getInstance():popState();
		end 
	else 
		StateMachine.getInstance():popState();
	end 
end

AgencyState.dtor = function(self)	
end
