require("common/commonScene");
require("hall/community/communityController");
local communityMainLayout = require(ViewPath.."hall/community/communityMainLayout");

CommunityState = class(CommonState);

CommunityState.ctor = function(self)

end

CommunityState.dtor = function(self)
	
end

CommunityState.load = function(self)
	CommonState.load(self);
    local CommunityScene = require("hall/community/communityScene");
	self.m_controller = new(CommunityController, self, CommunityScene, communityMainLayout);
	return true;
end

CommunityState.unload = function(self)
	CommonState.unload(self);
	delete(self.m_controller);
	self.m_controller = nil;
end

CommunityState.getController = function(self)
	return self.m_controller;
end

CommunityState.gobackLastState = function(self)
    if MessageBox.isShowing() then
		MessageBox.hide();
		return;
    end
	self.m_controller:onBackClick();
end