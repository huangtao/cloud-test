
local MatchGameOverDetailLayer = class(Node);

MatchGameOverDetailLayer.ctor = function(self)
	self:setFillParent(true, true);
	self.m_detailViews = {};

	self:setEventTouch(self,self.onMaskClick);
end

MatchGameOverDetailLayer.showDetailLayer = function(self,data)
	self:setVisible(true);
	self:removeAllChildren();
	self.m_detailViews = {};

    self:_createDetailView(data);
end

MatchGameOverDetailLayer.hideDetailLayer = function(self)
	self:closeDetailView();
	self:setVisible(false);
end


MatchGameOverDetailLayer.closeDetailView = function(self)
	for k,v in pairs(self.m_detailViews) do 
		v:closeDetailView();
	end 
end

MatchGameOverDetailLayer._createDetailView = function(self,data)
	data = table.verify(data);
	for k,v in pairs(data) do 
		local MatchGameOverDetail =  require("games/common2/match/module/matchGameOver/matchGameOverDetail");
		local gameOverDetailView = new(MatchGameOverDetail,v);
		local pos = table.verify(v.pos);
		gameOverDetailView:setAlign(pos.align or kAlignCenter);
        gameOverDetailView:setPos(pos.x,pos.y);
		self:addChild(gameOverDetailView);

		table.insert(self.m_detailViews,gameOverDetailView);
	end 
end

MatchGameOverDetailLayer.onMaskClick = function(self,finger_action)
	if finger_action == kFingerUp then
		self:closeDetailView();
	end 
end

return MatchGameOverDetailLayer;