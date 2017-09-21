
--[[
	普通表情
]]

local ExpressItem = class(Node);

ExpressItem.ctor = function(self, fileName)
	self:setSize(154, 154);
	if type(fileName) == "table" then 
		self.m_playIndex = fileName.playIndex;
	end 
	local file = "games/common/chat/face_bg.png"
	self.m_bg = UIFactory.createImage(file);
	self:addChild(self.m_bg);
	self.m_bg:setAlign(kAlignCenter);

	local button = UIFactory.createImage(fileName);
	self:addChild(button);
	button:setAlign(kAlignCenter);
end

ExpressItem.getPlayIndex = function(self)
	return self.m_playIndex;
end

return ExpressItem;