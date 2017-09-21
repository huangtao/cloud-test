require("common/commonState")
require("hall/invitational/invitationalScene")
require("hall/invitational/invitationalController")

local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");

local invitational_layout = require(ViewPath .. "hall/invitational/invitational_layout")

InvitationalState = class(CommonState)

InvitationalState.ctor = function(self)
	self.m_controller = nil
end

InvitationalState.getController = function(self)
	return self.m_controller
end

InvitationalState.load = function(self)
	CommonState.load(self)
	self.m_controller = new(InvitationalController, self, InvitationalScene, invitational_layout)
	return true
end

InvitationalState.unload = function(self)
	CommonState.unload(self)
	delete(self.m_controller)
	self.m_controller = nil
end

InvitationalState.gobackLastState = function(self)
	if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden()
		return
	end

	if BaseLoginDialog.isDialogShowing() then
		BaseLoginDialog.hideTopDialog();
		return;
	end
	StateMachine.getInstance():pushState(States.GameMatchHall)
end

InvitationalState.dtor = function(self)
	
end
