local communityCleanUpLayout = require(ViewPath.."hall/community/friend/nearbylist/communityCleanUpLayout");
local CommunityNearByLayer = require("hall/community/widget/friend/nearbyList/communityNearByLayer");
local CommunityCleanUpLayout = class(IBaseDialog,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityCleanUpLayout.s_controls = { 
    confirmBtn = getIndex();
    btnCancel = getIndex();
    closeBtn = getIndex();
};

CommunityCleanUpLayout.ctor = function(self, data)
    super(self, communityCleanUpLayout);
    self:setSize( self.m_root:getSize() );
    self:setFillParent(false, false);
    self.m_ctrl = CommunityCleanUpLayout.s_controls;
    
    self.m_confirmBtn = self:findViewById(self.m_ctrl.confirmBtn);
    self.m_btnCancel = self:findViewById(self.m_ctrl.btnCancel);
    self.m_closeBtnl = self:findViewById(self.m_ctrl.closeBtn);
    self:setEventDrag(self,self.empty);
    self:setEventTouch(self,self.empty);
end

CommunityCleanUpLayout.empty = function (self)

end

CommunityCleanUpLayout.onBtnConfirmClick = function (self)
    self:hide();
    EventDispatcher.getInstance():dispatch(CommunityNearByLayer.s_onConfirmCleanUpLocationEvent);
end

CommunityCleanUpLayout.onBtnCloseClick = function (self)
    self:hide();
end

CommunityCleanUpLayout.s_controlConfig =
{   
    [CommunityCleanUpLayout.s_controls.confirmBtn]             = {"cleanUplocal","cleanupBg","confirmBtn"};
    [CommunityCleanUpLayout.s_controls.btnCancel]              = {"cleanUplocal","cleanupBg","btnCancel"};
    [CommunityCleanUpLayout.s_controls.closeBtn]               = {"cleanUplocal","cleanupBg","closeBtn"};
};

CommunityCleanUpLayout.s_controlFuncMap =
{
    [CommunityCleanUpLayout.s_controls.confirmBtn] 	                = CommunityCleanUpLayout.onBtnConfirmClick,
	[CommunityCleanUpLayout.s_controls.btnCancel] 	                = CommunityCleanUpLayout.onBtnCloseClick,
    [CommunityCleanUpLayout.s_controls.closeBtn] 	                = CommunityCleanUpLayout.onBtnCloseClick,
};

return CommunityCleanUpLayout;