

local ViewBase = require("games/common2/module/viewBase");

local reportView = class(ViewBase, false);

reportView.ctor = function(self,seat)
	super(self);
	self.m_seat = seat;
    self:setFillParent(true, true);
end

reportView.dtor = function(self)
end

reportView.showReportView = function(self,seat,uid,info,isFast)
	if self.m_reportView then
		self:removeChild(self.m_reportView,true);
		delete(self.m_reportView);
		self.m_reportView = nil;
	end
	if info and info.whichItem and info.uid then
		local isPlaying = (self.m_mainState == GameMechineConfig.STATUS_PLAYING) and true or false; 
		self.m_reportView = LayerManagerIsolater.getInstance():show("commonReport",info.uid,info.whichItem,isPlaying,info.isDefaultSelected);
		self:addChild(self.m_reportView);
		self.m_reportView:setFillParent(true,true);
	end
end

reportView.s_stateFuncMap = {
}

reportView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_OPEN_REPORT]	= "showReportView";
};

return reportView;