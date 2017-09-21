--[[
	结算时头像上的破产动画
]]

AnimBankrupt = class(Node);


AnimBankrupt.ctor = function (self)
	local pochan_swf_info = require("games/common2/animation/pochan_swf_info");
	local pochan_swf_pin = require("games/common2/animation/pochan_swf_pin");
	self.m_swfNode = new(SwfPlayer,pochan_swf_info,pochan_swf_pin);
	self:setSize(self.m_swfNode:getSize());
	self.m_swfNode:setAlign(kAlignCenter);
	self.m_swfNode:setPos(0,0);
	self:addChild(self.m_swfNode);
end

AnimBankrupt.play = function (self)
	self.m_swfNode:play(1,true);
end

AnimBankrupt.stop = function (self)
	if self.m_swfNode then
		delete(self.m_swfNode);
		self.m_swfNode = nil;
	end
end

AnimBankrupt.release = function (self)
	self:stop();
end

AnimBankrupt.dtor = function(self)
    self:release();
end