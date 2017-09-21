local ChatItem = class(Node)

ChatItem.ctor = function(self,data)

	data = table.verify(data);
	data.world = tostring(data.world) or "";
	data.direction = tostring(data.direction) or "left";
	self.m_data = data;
	self.IMAGE = require("qnFiles/qn_res_alias_map");
	self.m_bottomImagePath = self.IMAGE.chat_bottom_right;
	if data.direction == "left" then
		self.m_bottomImagePath = self.IMAGE.chat_bottom_left;
	end
	self.m_offsetX,self.m_offsetY = 0,14;
	self:init();
end

ChatItem.init = function(self)
	local offsetX,offsetY = 20,19;
	--创建text
	self.m_text = UIFactory.createText(self.m_data.world , 26, 0, 0, kAlignCenter, 255, 230, 155);
    self.m_text:setAlign(kAlignCenter);
    self.m_text:setPos(nil,-3);
	
	--创建底图
	local w,h = self.m_text:getSize();
	self.m_bottomImage = UIFactory.createImage(self.m_bottomImagePath,nil,nil,31,31,31,31);
	self.m_bottomImage:setSize(offsetX*2 + w,offsetY*2 + h);
	self.m_bottomImage:addChild(self.m_text);

	--容器大小
	local w,h = self.m_bottomImage:getSize();
	self:setSize(self.m_offsetX*2 + w,self.m_offsetY*2 + h);
	self:addChild(self.m_bottomImage);
end

ChatItem.dtor = function(self)

end

return ChatItem;