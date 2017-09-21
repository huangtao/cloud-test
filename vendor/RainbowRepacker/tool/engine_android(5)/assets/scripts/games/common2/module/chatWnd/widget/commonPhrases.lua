
--[[
	常用聊天
]]

local CommonPhrases = class(Node);

local chatExpression_pin_map = require("qnFiles/qnPlist/games/chatExpression_pin2");

CommonPhrases.ctor = function(self,data)
	local text = UIFactory.createText(data.str,25,data.width,data.height,kAlignLeft,118,72,18);
    text:setPos(10,0);
	self.m_checkBg = UIFactory.createImage(chatExpression_pin_map["checked_bg.png"],nil,nil,20,20,20,20);
	self.m_checkBg:setSize(470 , data.height);
	self.m_checkBg:setAlign(kAlignCenter);
	self:addChild(self.m_checkBg);
	self.m_checkBg:setVisible(false);

	local line = UIFactory.createImage("games/common/chat/chat_lin.png");
	line:setSize(450, 2);

	self:setSize(470,data.height);
	self:addChild(text);

	self:addChild(line);
	line:setAlign(kAlignBottom);
end

CommonPhrases.showCheckBg = function(self , isVisible)
	self.m_checkBg:setVisible(isVisible);
	self.m_checkBg:setPos(0,0);
end

return CommonPhrases;