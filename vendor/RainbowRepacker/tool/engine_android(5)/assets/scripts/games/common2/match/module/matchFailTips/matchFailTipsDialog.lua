local MatchFailTipsDialog = class(IBaseDialog, false);
----------------------------------------------
local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

MatchFailTipsDialog.s_controls = {
	shield 			= getIndex();
	bg 				= getIndex();
	tips			= getIndex();
	confirmBtn		= getIndex();
};

MatchFailTipsDialog.ctor = function(self,viewConfig)
	super(self, viewConfig);

	self.m_ctrls = MatchFailTipsDialog.s_controls;
end

MatchFailTipsDialog.dtor = function(self)
	self.m_isShowing = nil;
end

MatchFailTipsDialog.isShowing = function(self)
    return self.m_isShowing;
end

MatchFailTipsDialog.showDialog = function(self,info)
    self.m_isShowing = true;

    info = tostring(info);
	local tips = self:findViewById(self.m_ctrls.tips);
	tips:setText(info);

    IBaseDialog.pushDialog(self);
end

MatchFailTipsDialog.hideDialog = function(self)
    self.m_isShowing = false;
    IBaseDialog.hide();
end

MatchFailTipsDialog.isCancelable = function(self)
    self:onConfirmBtnClick();

    return IBaseDialog.isCancelable(self);
end
---------------------------------------------------------------------------------
MatchFailTipsDialog.onEmpty = function(self)
end

MatchFailTipsDialog.onConfirmBtnClick = function(self)
	local action = MatchMechineConfig.ACTION_NS_FORCE_EXIT;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchFailTipsDialog.onConfirmBtnClick");

    self:hideDialog();
end

MatchFailTipsDialog.s_controlConfig = {
	[MatchFailTipsDialog.s_controls.shield]			= {"shiled"};
	[MatchFailTipsDialog.s_controls.bg]				= {"bg"};
	[MatchFailTipsDialog.s_controls.tips]			= {"bg","tips"};
	[MatchFailTipsDialog.s_controls.confirmBtn]		= {"bg","confirmBtn"}
};

MatchFailTipsDialog.s_controlFuncMap =
{    
	[MatchFailTipsDialog.s_controls.shield]			= MatchFailTipsDialog.onEmpty;
	[MatchFailTipsDialog.s_controls.bg] 				= MatchFailTipsDialog.onEmpty;
    [MatchFailTipsDialog.s_controls.confirmBtn] 		= MatchFailTipsDialog.onConfirmBtnClick; 
};

return MatchFailTipsDialog;