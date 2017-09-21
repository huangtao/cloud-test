require("common/commonState");
require("hall/privateRoom/privateRoomScene");
require("hall/privateRoom/privateRoomController");
local privateRoomLayout = require(ViewPath .. "hall/privateRoom/privateRoomLayout");

-- 注释
-- 作者：JasonWang

PrivateRoomState = class(CommonState);

PrivateRoomState.ctor = function(self)
	self.m_controller = nil;
end

PrivateRoomState.getController = function(self)
	return self.m_controller;
end

PrivateRoomState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(PrivateRoomController, self, PrivateRoomScene, privateRoomLayout);
	return true;
end

PrivateRoomState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

PrivateRoomState.gobackLastState = function(self)
	if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return true;
	end

	StateMachine.getInstance():popState();
end

PrivateRoomState.dtor = function(self)
	
end