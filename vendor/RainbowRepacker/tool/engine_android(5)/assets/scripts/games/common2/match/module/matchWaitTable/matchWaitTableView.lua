local ViewBase = require("games/common2/module/viewBase");

local MatchWaitTableView = class(ViewBase,false);

MatchWaitTableView.s_controls = {
	waitingView 		= 1;
	waitingLoading 		= 2;
	loading_1			= 3;
	loading_2			= 4;
	loading_3			= 5;
}

MatchWaitTableView.ctor = function ( self,seat,viewConfig)
	super(self, viewConfig);
	self.m_ctrls = MatchWaitTableView.s_controls;
	self:setFillParent(true,true);

	self:_initViews();
end

MatchWaitTableView.dtor = function ( self )
	self:stopAnimTimer();
end

MatchWaitTableView.parseConfig = function(self, config)
    config = table.verify(config);

    if config.align then 
    	self.m_waitView:setAlign(config.align);
    end 

    if config.x or config.y then 
		self.m_waitView:setPos(config.x,config.y);
	end 
end 
---------------------------------------------------------------------------
MatchWaitTableView.showMatchWaitingTips = function(self)
	self.m_waitView:setVisible(true);
	self:_changeLoadingState(true);
end

MatchWaitTableView.hideMatchTips = function(self)
	self.m_waitView:setVisible(false);
	self:_changeLoadingState(false);
end
------------------------------------------------------------------------
MatchWaitTableView._initViews = function ( self)
	self.m_waitView = self:findViewById(self.m_ctrls.waitingView);
	local loadingView = self:findViewById(self.m_ctrls.waitingLoading);
	loadingView:setVisible(false);

	self:hideMatchTips();
end

MatchWaitTableView._changeLoadingState = function(self, isLoading)	
	if isLoading then
		self:startAnimTimer();
	else
		self:stopAnimTimer();
	end
end

MatchWaitTableView.startAnimTimer = function(self)
	self:stopAnimTimer();

	self.m_showLoadingIndex = 1;
	self:showMatchLoadingImg(1);

	self.m_animTimer = Clock.instance():schedule(function(dt)
            self:onTimerEvent();
        end,1);
end

MatchWaitTableView.stopAnimTimer = function(self)
	if self.m_animTimer then 
        self.m_animTimer:cancel();
    end 
	self.m_animTimer = nil;

	self.m_showLoadingIndex = 0;
	self:showMatchLoadingImg(0);
end

MatchWaitTableView.onTimerEvent = function(self)
	self.m_showLoadingIndex = number.valueOf(self.m_showLoadingIndex);

	self.m_showLoadingIndex = self.m_showLoadingIndex + 1;
	self.m_showLoadingIndex = self.m_showLoadingIndex > 3 and 1 or self.m_showLoadingIndex;

	self:showMatchLoadingImg(self.m_showLoadingIndex);
end

MatchWaitTableView.showMatchLoadingImg = function(self,index)
	index = number.valueOf(index);

	local loadings = {
		self:findViewById(self.m_ctrls.loading_1);
		self:findViewById(self.m_ctrls.loading_2);
		self:findViewById(self.m_ctrls.loading_3);
	};

	for k,v in ipairs(loadings) do 
		v:setVisible(k <= index);
	end 
end
----------------------------------------------------------------------------
MatchWaitTableView.s_controlConfig = {
	[MatchWaitTableView.s_controls.waitingView]			= {"wait"};
	[MatchWaitTableView.s_controls.waitingLoading]		= {"wait","tips","icon"};
	[MatchWaitTableView.s_controls.loading_1]			= {"wait","tips","loading","img_1"};
	[MatchWaitTableView.s_controls.loading_2]			= {"wait","tips","loading","img_2"};
	[MatchWaitTableView.s_controls.loading_3]			= {"wait","tips","loading","img_3"};
};

MatchWaitTableView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_WAIT_TABLE]					= "showMatchWaitingTips";
    [MatchMechineConfig.ACTION_GAME_OVER]					= "hideMatchTips";
    [MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY]			= "hideMatchTips";
    [MatchMechineConfig.ACTION_ROUND_OVER]					= "hideMatchTips";
};

return MatchWaitTableView;