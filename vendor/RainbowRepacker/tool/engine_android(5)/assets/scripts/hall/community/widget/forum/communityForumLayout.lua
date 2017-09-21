local communityForumLayout = require(ViewPath.."hall/community/forum/communityForumLayout");

local NVerticalListView = require("ui2/NVerticalListView");


CommunityForumLayout = class(CommonGameLayer,false);




local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

CommunityForumLayout.s_controls =
{
    --messageListView = getIndex(),
};

CommunityForumLayout.ctor = function(self)
	super(self,communityForumLayout);
   
    self:setEventTouch(self, self.onEmptyFunc);
    self:setEventDrag(self, self.onEmptyFunc);
	self.m_ctrls = CommunityForumLayout.s_controls;
   
end



CommunityForumLayout.dtor = function(self) 
    
end




 
CommunityForumLayout.s_controlConfig =
{
	--[CommunityForumLayout.s_controls.messageListView] 			= {"messageView","messageView","messageListView"},
};

CommunityForumLayout.s_controlFuncMap =
{
	--[CommunityForumLayout.s_controls.btnReturn] 	        = CommunityForumLayout.onBtnReturnClick,
};

