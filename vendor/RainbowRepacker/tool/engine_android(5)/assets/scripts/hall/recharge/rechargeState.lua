require("common/commonScene")
require("hall/recharge/rechargeScene")
require("hall/recharge/rechargeController")

local recharge = require(RechargeViewPath .. "recharge")

RechargeState = class(CommonState)

RechargeState.ctor = function(self)
	self.m_controller = nil;
end

RechargeState.getController = function(self)
	return self.m_controller;
end

RechargeState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(RechargeController,self,RechargeScene,recharge);
	return true;
end

RechargeState.resume = function(self)
	CommonState.resume(self);
end

RechargeState.pause =function(self)	
	CommonState.pause(self);
end

RechargeState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

RechargeState.dtor = function(self)
	
end
