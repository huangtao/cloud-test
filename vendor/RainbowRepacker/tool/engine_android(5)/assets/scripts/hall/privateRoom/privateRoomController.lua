require("isolater/common/commonController");

PrivateRoomController = class(CommonController);

PrivateRoomController.s_cmds = 
{
	GoBack = 1,
};

PrivateRoomController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

PrivateRoomController.resume = function(self)
	CommonController.resume(self);
	require("hall/floatBall/data/floatBallDataInterface");
    FloatBallDataInterface:getInstance():setSceneName("privateRoom");
end

PrivateRoomController.pause = function(self)
	CommonController.pause(self);
end

PrivateRoomController.dtor = function(self)
end

PrivateRoomController.onGoBack = function(self)
	self.m_state:popState();
end

PrivateRoomController.s_cmdConfig = 
{
	[PrivateRoomController.s_cmds.GoBack] = PrivateRoomController.onGoBack,
};


