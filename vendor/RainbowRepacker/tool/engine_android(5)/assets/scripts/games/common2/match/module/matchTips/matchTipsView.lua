local ViewBase = require("games/common2/module/viewBase");

local MatchTipsView = class(ViewBase,false);

MatchTipsView.s_controls = {
	txtNotification		= 1;
	bg					= 2;
}

MatchTipsView.ctor = function ( self,seat,viewConfig)
	super(self, viewConfig);
	self.m_ctrls = MatchTipsView.s_controls;
	self:setFillParent(true,true);

	self:_initViews();
end

MatchTipsView.dtor = function ( self )
end

MatchTipsView.parseConfig = function(self, config)
    config = table.verify(config);

    if config.align then 
    	self.m_bg:setAlign(config.align);
    end 

    if config.x or config.y then 
		self.m_bg:setPos(config.x,config.y);
	end 

	self.m_isShow = config.isShow;

	self.m_color = table.verify(config.color);
end 
---------------------------------------------------------------------------
MatchTipsView.showMatchBaseChipInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	if info.isShow ~= 0 then
		local msg = "";
		if MatchIsolater.getInstance():getIsJustStart() then 
			msg = string.concat("当前底注：", info.baseScore, "，低于", info.weedOutScore, "将被淘汰。");
			MatchIsolater.getInstance():setIsJustStart(false);
		else 
			msg = string.concat("底注将增长至", info.baseScore, "，低于", info.weedOutScore, "将被淘汰。");
		end
		self:_showText(msg);
	end
end

MatchTipsView.hideMatchTips = function(self)
	self:_showText("");
end
------------------------------------------------------------------------
MatchTipsView._initViews = function ( self)
	self.m_r, self.m_g, self.m_b = 254, 207, 141;
	self.m_bg = self:findViewById(self.m_ctrls.bg);
	self.m_txtNotification = self:findViewById(self.m_ctrls.txtNotification);

	self.m_bg:setAlign(kAlignTop);
	self.m_bg:setPos(nil,80);

	self:hideMatchTips();
end

MatchTipsView._showText = function ( self, text )
	local color = {self.m_r, self.m_g, self.m_b};
	if not table.isEmpty(self.m_color) then 
		color = self.m_color;
	end 
	self.m_txtNotification:setText(text or "", nil, nil,unpack(color));

	if text and text ~= "" and self.m_isShow then 
		self.m_bg:setVisible(true);
	else 
		self.m_bg:setVisible(false);
	end 
end
----------------------------------------------------------------------------
MatchTipsView.s_controlConfig = {
	[MatchTipsView.s_controls.bg]					= {"bg"};
	[MatchTipsView.s_controls.txtNotification]		= {"bg", "txtNotification"};
};

MatchTipsView.s_actionFuncMap = {
	[MatchMechineConfig.ACTION_START]                		= "hideMatchTips";
    [MatchMechineConfig.ACTION_GET_BASECHIP_INFO]			= "showMatchBaseChipInfo";
};

return MatchTipsView;