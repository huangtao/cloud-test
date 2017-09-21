require("hall/shortCutRecharge/shortCutRechargeScene");
require("hall/shortCutRecharge/shortCutRechargeController");
local shortCutRecharge = require(ViewPath.."hall/shortCutRecharge/shortCutRecharge");

ShortCutRechargeState = class(CommonState);


ShortCutRechargeState.ctor = function(self, ...)
	self.m_controller = nil;
	self.m_args = {...};
end

ShortCutRechargeState.getController = function(self)
	return self.m_controller;
end

ShortCutRechargeState.load = function(self)
	CommonState.load(self);
	self.m_controller = new(ShortCutRechargeController,self,ShortCutRechargeScene,shortCutRecharge,unpack(self.m_args));
	return true;
end

ShortCutRechargeState.resume = function(self)
	CommonState.resume(self);
end

ShortCutRechargeState.pause =function(self)	
	CommonState.pause(self);
end

ShortCutRechargeState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

ShortCutRechargeState.dtor = function(self)
	Log.uploadModuleCache("Pay");
end
