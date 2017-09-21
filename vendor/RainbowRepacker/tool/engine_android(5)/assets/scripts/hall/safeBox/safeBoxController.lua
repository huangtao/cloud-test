require("isolater/common/commonController");

SafeBoxController = class(CommonController);

SafeBoxController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

SafeBoxController.resume = function(self)
	CommonController.resume(self);
end

SafeBoxController.pause = function(self)
	CommonController.pause(self);
end

SafeBoxController.dtor = function(self)
end

SafeBoxController.initViewData =function(self)
end


SafeBoxController.onGoBack = function(self)
	self.m_state:popState();
end

SafeBoxController.s_cmds =
{
	goBack = 1,
}

SafeBoxController.s_cmdConfig = 
{
	[SafeBoxController.s_cmds.goBack] = SafeBoxController.onGoBack,
};