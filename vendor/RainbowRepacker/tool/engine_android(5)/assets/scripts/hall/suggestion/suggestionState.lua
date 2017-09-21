require("common/commonScene")
require("hall/suggestion/suggestionController");
local suggestion = require(ViewPath .. "hall/suggestion/suggestion");

SuggestionState = class(CommonState);

SuggestionState.ctor = function(self)
	self.m_controller = nil;
end

SuggestionState.getController = function(self)
	return self.m_controller;
end

SuggestionState.load = function(self)
	CommonState.load(self);
	RadioButton.setDefaultImages({"hall/common/checkbox_uncheck.png","hall/common/checkbox_checked.png"});
    local SuggestionScene = require("hall/suggestion/suggestionScene");
	self.m_controller = new (SuggestionController, self, SuggestionScene, suggestion);
	RadioButton.setDefaultImages();
	return true;
end

SuggestionState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

SuggestionState.gobackLastState =  function(self)
    if MessageBox.isShowing() then
		MessageBox.hide();
		return;
	end

	StateMachine.getInstance():popState();
end

SuggestionState.dtor = function (self)
end