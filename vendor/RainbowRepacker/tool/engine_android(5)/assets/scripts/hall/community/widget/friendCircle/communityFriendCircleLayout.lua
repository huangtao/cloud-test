local communityFriendCircleLayout = require(ViewPath.."hall/community/friendCircle/communityFriendCircleLayout");

local NVerticalListView = require("ui2/NVerticalListView");


CommunityFriendCircleLayout = class(CommonGameLayer,false);




local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityFriendCircleLayout.s_controls =
{
    --messageListView = getIndex(),
};

CommunityFriendCircleLayout.ctor = function(self)
	super(self,communityFriendCircleLayout);
   
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
	self.m_ctrls = CommunityFriendCircleLayout.s_controls;
   
end



CommunityFriendCircleLayout.dtor = function(self) 
    
end




 
CommunityFriendCircleLayout.s_controlConfig =
{
	--[CommunityFriendCircleLayout.s_controls.messageListView] 			= {"messageView","messageView","messageListView"},
};

CommunityFriendCircleLayout.s_controlFuncMap =
{
	--[CommunityFriendCircleLayout.s_controls.btnReturn] 	        = CommunityFriendCircleLayout.onBtnReturnClick,
};

