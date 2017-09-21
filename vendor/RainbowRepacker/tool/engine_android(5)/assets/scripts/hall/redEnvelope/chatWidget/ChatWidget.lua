require("gameBase/gameLayer");
local ChatWidget = class(Node)

ChatWidget.ctor = function(self,p_w,p_h,p_align)
	
	self.m_itemAlign = p_align;
	self.m_currentY = 0;
	self.m_items = {};

    self:setSize(p_w,p_h);

end

ChatWidget.dtor = function(self)
	
end

ChatWidget.addItem = function(self,p_item)

	local __w,__h = p_item:getSize();

	if self.m_currentY + __h > self.m_height then
		self:__popItem(self.m_currentY + __h - self.m_height);
		self.m_currentY = self.m_height - __h;
	else
		
	end

	p_item:setAlign(self.m_itemAlign);
	p_item:setPos(0,self.m_currentY);
	self:addChild(p_item);

	table.insert(self.m_items,p_item);

    self.m_currentY = self.m_currentY + __h;
end

ChatWidget.__popItem = function(self,p_y)
	local __needDeleteItems = {};
	for i = #self.m_items,1,-1 do
		local__,__lastY = self.m_items[i]:getPos();
		self.m_items[i]:setPos(nil,__lastY - p_y);

		if __lastY - p_y < 0 then
			local __item = table.remove(self.m_items, i);
			local anim = __item:addPropTransparency(0, kAnimNormal, 1000, 0, 1, 0.01);
			if anim then
				anim:setDebugName("ChatWidget anim");
				anim:setEvent(nil,function()
				self:removeChild(__item,true);
				end);
			end 
			
		end
	end 
end

return ChatWidget;