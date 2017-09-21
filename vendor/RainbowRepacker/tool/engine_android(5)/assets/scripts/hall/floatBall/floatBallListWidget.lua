local FloatBallListWidget = class(Node)

FloatBallListWidget.ctor = function(self,data)
	data = table.verify(data);
	self.m_w = data.w or 0;
	self.m_h = data.h or 0;
	
	self:setSize(self.m_w,self.m_y);
	self.m_dragLayer = new(Node);
	self.m_dragLayer:setSize(self.m_w,self.m_h);
	self.m_dragLayer:setLevel(11);
	self:addChild(self.m_dragLayer);

	self.m_overlap = 0.3;

	self.m_scaleRate = data.scale or 0.9;
	self.m_scalePerY = self.m_scaleRate/self.m_h/2;

	self.m_opacityScale = data.opacityScale or 1.0;
	self.m_opacityScalePerY = self.m_opacityScale/self.m_h/2;
	self.m_opacityMinOffset = 0.5;
	self.m_middleY = self.m_h/2;
	self.m_max_level = 10;

	self.m_items = {};
	self.m_item_w = 0;
	self.m_item_h = 0;
	self.m_middleItem = nil;
	self.m_dragLayer:setEventDrag(self, self.__onEventDrag);	
end

FloatBallListWidget.dtor = function(self)

end

FloatBallListWidget.addItem = function(self,p_item)

	p_item:setAlign(kAlignTop);
	table.insert(self.m_items,p_item);
	self:addChild(p_item);
	local __itemNum = #self.m_items;
	local __,__h = p_item:getSize();
	if __itemNum == 1 then
		p_item:setPos(0,self.m_middleY - __h/2);
		p_item:setLevel(self.m_max_level);
		self.m_item_w = __;
		self.m_item_h = __h;
		self:__setLight(1);
		self.m_middleItem = 1;
		return;
	end
	self:__updateByOffsetY(0);
end

FloatBallListWidget.getMiddleObject = function(self)
    return self.m_items[self.m_middleItem];
end

FloatBallListWidget.setMiddleByObject = function(self,p_object)
	local __targetIndex = nil;
	for kk,vv in pairs(self.m_items) do
        if vv == p_object then
            __targetIndex = kk;
            break;
        end
    end

    if not __targetIndex then
    	return;
    end

	local __,__y = p_object:getPos();
	local __direct = self.m_middleY > __y and 1 or -1 ; 
	local __step = self.m_item_h/2;
	__step = __step * __direct;
	local __flag = 1;
	while(true) do
		self:__updateByOffsetY(__step);
		if __targetIndex == self.m_middleItem then
			self:__setMiddle();
			return;
		end

		__flag = __flag + 1;
		if __flag > 1000 then
			break;
		end
	end
  
end

FloatBallListWidget.__refreshProByIndex = function(self,p_index,isNext)

	local __lastIndex = self:__getLastIndex(p_index);
	if isNext  then
		__lastIndex = self:__getNextIndex(p_index);
	end
	local __last_x,__last_y = self.m_items[__lastIndex]:getPos();
	local __last_w,__last_h = self.m_items[__lastIndex]:getSize();
	local __last_level = self.m_items[__lastIndex]:getLevel();
	local __posY = 0
	local __scaleY = 0;
	local __h = 0;

	if isNext then
			__scaleY = __last_y;
			local __scaleRate = (1 - math.abs(__last_y - self.m_middleY) * self.m_scalePerY);
			__scaleRate = __scaleRate * __scaleRate;
			__h = __scaleRate *self.m_item_h;
			__posY = __last_y - __h + __h*self.m_overlap;
			self:__setUnlight(p_index,__scaleY);
			self.m_items[p_index]:setPos(0,__posY);
		else	
			__scaleY = __last_y+__last_h;
			local __scaleRate = (1 - math.abs(__last_y - self.m_middleY) * self.m_scalePerY);
			__scaleRate = __scaleRate*__scaleRate;
			__h = (1 - math.abs(__last_y - self.m_middleY) * self.m_scalePerY)*self.m_item_h;
			__posY = __last_y + __last_h - __h*self.m_overlap;
			self:__setUnlight(p_index,__scaleY);
			self.m_items[p_index]:setPos(0,__posY);
		end

		self.m_items[p_index]:setLevel(__last_level -1);
end

FloatBallListWidget.__getLastIndex = function(self,p_index)
	local __upIndex = 0;
	if p_index%2 == 0 then
		__upIndex = p_index - 2 ;
	else
		__upIndex = p_index + 2;
	end
	if p_index == 2 then
		__upIndex = 1 
	end
	if __upIndex < 0 then
		__upIndex = 0;
	end
	if __upIndex > #self.m_items then
		__upIndex = 0;
	end
	return __upIndex;
end

FloatBallListWidget.__getNextIndex = function(self,p_index)
	local __nextIndex = 0;
	if p_index%2 == 0 then
		__nextIndex = p_index + 2;
	else
		__nextIndex = p_index -2;
	end

	if __nextIndex == -1 then
		__nextIndex = 2    
	end

    if  __nextIndex > #self.m_items then
        __nextIndex = 0;
    end

	return __nextIndex;
	
end
FloatBallListWidget.__setLight = function(self,p_index)
	local p_object = self.m_items[p_index];
	if not p_object then

		return;
	end
	self.m_middleItem = p_index;
	p_object:setLevel(self.m_max_level);
	if p_object.m_lightImage then
		p_object.m_lightImage:setVisible(true);
	end

	p_object:setColor(255,255,255);
	p_object:setSize(self.m_item_w,self.m_item_h);
end

FloatBallListWidget.__setUnlight = function(self,p_index,p_y)
	local p_object = self.m_items[p_index];
	if not p_object then
		return;
	end

	if p_object.m_lightImage then
		p_object.m_lightImage:setVisible(false);
	end
	local __,__h = p_object:getSize();
    local __offsetY = p_y - self.m_middleY;
	__offsetY = math.abs(__offsetY)
	local __scaleSizeRate = (1 - __offsetY*self.m_scalePerY);
	__scaleSizeRate = __scaleSizeRate*__scaleSizeRate;
	p_object:setSize(self.m_item_w*__scaleSizeRate,self.m_item_h*__scaleSizeRate);
	local __scaleColorStrong = (1 - __offsetY*self.m_opacityScalePerY );
	__scaleColorStrong = __scaleColorStrong*__scaleColorStrong* self.m_opacityMinOffset;
	p_object:setColor(255*__scaleColorStrong,255*__scaleColorStrong,255*__scaleColorStrong);

end

FloatBallListWidget.__init = function(self)

end 

FloatBallListWidget.__updateByOffsetY = function(self,p_y)
	local __canMove = self:__sureMiddleItem(p_y);

	if not __canMove then
		return false;
	end

	self:__refreshNext(self.m_middleItem);
	self:__refreshLast(self.m_middleItem);
	return true;
end

FloatBallListWidget.__refreshNext = function(self,p_index)
	local __next = self:__getNextIndex(p_index);
	if __next == 0 then
		return ;
	end
	self:__refreshProByIndex(__next);
	self:__refreshNext(__next);
end

FloatBallListWidget.__refreshLast = function(self,p_index)
	local __last = self:__getLastIndex(p_index);
	if __last == 0 then
		return ;
	end
	self:__refreshProByIndex(__last,true);
	self:__refreshLast(__last);

end

FloatBallListWidget.__sureMiddleItem = function(self,p_y)
	local __,__posY = self.m_items[self.m_middleItem]:getPos();
	local __posY = __posY + p_y;

	local __nextMiddleIndex = -1;
	if __posY >= self.m_middleY - self.m_item_h and __posY < self.m_middleY then
	elseif __posY >= self.m_middleY then
		__nextMiddleIndex = self:__getLastIndex(self.m_middleItem);
		__posY = __posY - self.m_item_h;
	elseif __posY < self.m_middleY - self.m_item_h then
		__nextMiddleIndex = self:__getNextIndex(self.m_middleItem);
		__posY = __posY + self.m_item_h;
	end

	if __nextMiddleIndex == 0 then
		return false;
	elseif __nextMiddleIndex == -1 then
		self.m_items[self.m_middleItem]:setPos(0,__posY);
	else
		self.m_middleItem = __nextMiddleIndex;
		self.m_items[self.m_middleItem]:setPos(0,__posY);
		self:__setLight(__nextMiddleIndex);
	end
	return true;

end

FloatBallListWidget.__setMiddle = function(self)
	local  __,__y = self.m_items[self.m_middleItem]:getPos();
	local __offsetY = self.m_middleY - self.m_item_h/2 - __y ;
	self:__updateByOffsetY(__offsetY);
end

FloatBallListWidget.__onEventDrag = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action == kFingerDown then
    	self.m_max_move = 0;
		self.m_startX = x;
		self.m_startY = y;
    elseif finger_action == kFingerMove then
		local __movY = y - self.m_startY;
		local __movX = x - self.m_startX;
		local __move_distance = math.sqrt(__movY*__movY + __movX*__movX);
		self.m_max_move = __move_distance > self.m_max_move and __move_distance or self.m_max_move;
		if __move_distance > 2 then
			self:__updateByOffsetY(__movY)
		end 
		self.m_startY = y;
		self.m_startX = x;
    else
    	if self.m_max_move <= 2 then
    	else
    		self:__setMiddle();
    	end
    end
end

return FloatBallListWidget;
