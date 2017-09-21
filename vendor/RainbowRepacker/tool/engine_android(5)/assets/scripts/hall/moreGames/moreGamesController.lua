require("isolater/common/commonController");

MoreGamesController = class(CommonController);

MoreGamesController.s_cmds = 
{
	GoBack = 1,
};

MoreGamesController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

MoreGamesController.dtor = function(self)
end

MoreGamesController.onGoBack = function(self)
	StateMachine.getInstance():popState();
end

MoreGamesController.onBackPressed = function(self)
	local canExit = self:updateView(MoreGamesScene.s_cmds.CheckCanExit);
	if canExit then 
		self:onGoBack();
	end 
end

MoreGamesController.s_cmdConfig = 
{
	[MoreGamesController.s_cmds.GoBack] = MoreGamesController.onGoBack,
};


