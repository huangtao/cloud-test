--[[
    VIP表情
]]
local VipExpressItem = class(Node);

VipExpressItem.ctor = function(self, fileName)
	self:setSize(154, 154);
    local file = "games/common/chat/face_bg.png"
    self.m_bg = UIFactory.createImage(file);
	self:addChild(self.m_bg);
	self.m_bg:setAlign(kAlignCenter);

	local button = UIFactory.createImage(fileName);
    local height  = fileName.height;
    local width  = fileName.width;
    width = (width >  140) and 140 or width;
    height = (height >  142) and 142 or height;
    button:setSize(width,height);
	self.m_bg:addChild(button);
	button:setAlign(kAlignCenter);
end

return VipExpressItem;