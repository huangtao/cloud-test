require("gameBase/gameScene");

GameScene.pause = function(self)
	if not self.m_controller then
		return;
	end

	self:setPickable(false);
end

GameScene.resume = function(self)
	if not self.m_controller then
		return;
	end

	self:setPickable(true);
end

GameScene.stop = function(self)
	if not self.m_controller then
		return;
	end

	self:setVisible(false);
end

GameScene.run = function(self)
	if not self.m_controller then
		return;
	end
	
	self:setVisible(true);
	self:setPickable(false);
end