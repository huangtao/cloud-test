require("isolater/common/commonController");

SuggestionController = class(CommonController);

SuggestionController.s_cmds =
{
	goBack 			= 1, -- 返回
}

SuggestionController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

SuggestionController.resume = function(self)
	CommonController.resume(self);
end

SuggestionController.pause = function(self)
	CommonController.pause(self);
	
end

SuggestionController.dtor = function(self)
end

SuggestionController.onGoBack = function(self)
	self.m_state:popState();
end

SuggestionController.s_cmdConfig = 
{
	[SuggestionController.s_cmds.goBack] 			= SuggestionController.onGoBack,
};