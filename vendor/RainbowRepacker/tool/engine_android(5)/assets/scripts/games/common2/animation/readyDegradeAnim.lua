ReadyDegradeAnim = class(Node);

ReadyDegradeAnim.ctor = function (self)
end

ReadyDegradeAnim.load = function(self)
	local readyDegradeAnim_swf_pin = require("games/common2/animation/readyDegradeAnim_swf_pin");
	local readyDegradeAnim_swf_info = require("games/common2/animation/readyDegradeAnim_swf_info");
	self.m_swfNode = new(SwfPlayer,readyDegradeAnim_swf_info,readyDegradeAnim_swf_pin);
	self:setSize(self.m_swfNode:getSize());
	self.m_swfNode:setAlign(kAlignCenter);
	self:addChild(self.m_swfNode);
end

ReadyDegradeAnim.play = function (self)
	self:stop();
	self:load();
	self.m_swfNode:play();
end

ReadyDegradeAnim.stop = function (self)
	if self.m_swfNode then
		delete(self.m_swfNode);
		self.m_swfNode = nil;
	end
end

ReadyDegradeAnim.release = function (self)
	self:stop();
end

ReadyDegradeAnim.dtor = function(self)
    self:release();
end