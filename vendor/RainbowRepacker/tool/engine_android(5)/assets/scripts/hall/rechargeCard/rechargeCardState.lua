require("common/commonScene")
require("hall/rechargeCard/rechargeCardController");
require("common/messageBox");

local rechargeCard = require(ViewPath .. "hall/rechargeCard/rechargeCard");

RechargeCardState = class(CommonState)

RechargeCardState.ctor = function(self)
	self.m_controller = nil;
end

RechargeCardState.getController = function(self)
	return self.m_controller;
end

RechargeCardState.load = function(self)
	CommonState.load(self);
    local RechargeCardScene = require("hall/rechargeCard/rechargeCardScene");
	self.m_controller = new(RechargeCardController, self, RechargeCardScene, rechargeCard);
	return true;
end

RechargeCardState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

RechargeCardState.gobackLastState = function(self)
	self.m_controller:onBack();
end

RechargeCardState.onExit = function(self)
	StateMachine.getInstance():popState();
end

RechargeCardState.onContinue = function(self)
end

RechargeCardState.onClose = function(self)
end

RechargeCardState.dtor = function(self)
end
