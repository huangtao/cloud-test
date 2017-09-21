local ViewBase = require("games/common2/module/viewBase");

local MatchFailTipsView = class(ViewBase,false);

MatchFailTipsView.ctor = function(self,seat,viewConfig)
	super(self);
	self.m_ctrls = MatchFailTipsView.s_controls;
	self:setFillParent(true,true);

	self.m_viewConfig = viewConfig;
end

MatchFailTipsView.dtor = function(self)
	self.m_viewConfig = nil;
end

----------------------------------------------------------------------------
MatchFailTipsView.showTips = function(self,seat,uid,info,isFast)
	info = table.verify(info);

	local MatchFailTipsDialog = require("games/common2/match/module/matchFailTips/matchFailTipsDialog");
	local failTipsDialog = new(MatchFailTipsDialog,self.m_viewConfig);
	failTipsDialog:setAlign(kAlignCenter);
	self:addChild(failTipsDialog);

	failTipsDialog:showDialog(info.msg);

	self.m_data = info;
	self.m_failTipsDialog = failTipsDialog;
end

MatchFailTipsView.onMatchStart = function(self)
	if self.m_data and self.m_data.errorType == 6 then 
		if self.m_failTipsDialog then 
			self.m_failTipsDialog:hideDialog();
		end 
	end 
end

MatchFailTipsView.s_actionFuncMap = {
	[MatchMechineConfig.ACTION_NS_SHOW_FAIL_TIPS]				= "showTips";
	[MatchMechineConfig.ACTION_START]                       	= "onMatchStart";
};

return MatchFailTipsView;