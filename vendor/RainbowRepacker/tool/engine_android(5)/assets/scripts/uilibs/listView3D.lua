require("ui/node");

ListView3D = class(Node);

ListView3D.eDirection = {
	LEFT = 1,
	RIGHT = 2,
}

ListView3D.ctor = function(self)
	self:reset();

	self:setSize(500, 400);

	self:setEventDrag(self,self.onEventDrag);
end

ListView3D.dtor = function(self)

end

ListView3D.reset = function(self)
	self.m_maxx = 180;
	self.m_maxy = 80;
	self.m_endAngle = 0;
	self.m_angleSum = 0;
	self.m_currentAngle =0;
	self.m_isRotating = false;
	self.m_itemList = {};
	self.m_itemMap = {};
	self.m_additionAngle = 0;
    self.m_startX = 0;
end

ListView3D.toNextItem = function(self)
    local itemCount = #self.m_itemList;
	if itemCount <= 1 then
	    return;
	end

    local nextIndex = self.m_startIndex % itemCount + 1;
	if itemCount <= 2 then
	    self:startRotation(nextIndex, ListView3D.eDirection.RIGHT);
	else
	    self:startRotation(nextIndex);
	end
end

ListView3D.toLastItem = function(self)
	local itemCount = #self.m_itemList;
	if itemCount <= 1 then
	    return;
	end

    local nextIndex = (self.m_startIndex - 1) == 0 and itemCount or self.m_startIndex - 1;
	if itemCount <= 2 then
	    self:startRotation(nextIndex, ListView3D.eDirection.LEFT);
	else
	    self:startRotation(nextIndex);
	end
end

ListView3D.onEventDrag = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if #self.m_itemList <= 1 then
		return;
	end

	if finger_action == kFingerDown then
		self.m_startX = x;
		self.m_isMove = false;
		self.m_additionTime = os.clock();
		self.m_additionAngle = 0;
		self.m_additionDeltaIndex = 0;
	elseif finger_action == kFingerMove then
		local px = x - self.m_startX;
		if (px > 10 or px < -10) then
            local additionAngle = Math2D.radianToAngle(px / 400);

			self.m_endAngle = self.m_endAngle - self.m_additionAngle + additionAngle;
			self.m_isMove = true;
       		self:moveMenu();

			local itemCount = #self.m_itemList;
			local angleSize = 360 / itemCount;
			local deltaIndex = math.floor(additionAngle / angleSize);
			local remainder = additionAngle % angleSize;
			if math.abs(remainder) >= (angleSize / 2) then
				deltaIndex = deltaIndex +  (remainder > 0 and 1 or -1);
			end
			self.m_additionDeltaIndex = deltaIndex;
            deltaIndex = -deltaIndex;

            local endIndex = self.m_startIndex + deltaIndex;
            endIndex = (endIndex - 1) % itemCount + 1;
            
            local endItem = self.m_itemList[endIndex];
            self:checkSelectedItem(endItem);

   			self.m_additionAngle = additionAngle;
			--Log.d("benny", "additionAngle", additionAngle, "deltaIndex", deltaIndex, "startIndex", self.m_startIndex, "endIndex", endIndex);
		end
	elseif finger_action == kFingerUp or finger_action == kFingerCancel then
		if self.m_isMove then
			local itemCount = #self.m_itemList;
			local angleSize = 360 / itemCount;
			local deltaTime = os.clock() - self.m_additionTime;
			local v = self.m_additionAngle / deltaTime;
			local a = v > 0 and -40 or 40;
			local s = v * v / a / 2;
            local px = x - self.m_startX;
			local additionAngle = Math2D.radianToAngle(px / 400);
			local deltaIndex = self.m_additionDeltaIndex + math.floor(additionAngle / angleSize);

			self.m_endAngle = self.m_endAngle - self.m_additionAngle + deltaIndex * angleSize;
			deltaIndex = -deltaIndex;

			local endIndex = self.m_startIndex + deltaIndex;
            endIndex = (endIndex - 1) % itemCount + 1;
            
            local endItem = self.m_itemList[endIndex];
            self:checkSelectedItem(endItem);

			self.m_isRotating = true;
			self:statrTimer();
			self.m_startIndex = endIndex;
			Log.d("benny", "v", v, "a", a, "s", s, "deltaIndex", deltaIndex);
		end
	end
end

ListView3D.init = function(self, viewClass, data)
	self:removeAllChildren();
	self:reset();

	if table.isEmpty(data) then
		return;
	end

	local viewWidth, viewHeight = self:getSize();
	for i = 1, #data do
		local dataItem = data[i];
		dataItem.i = i;
		local view = new(viewClass, dataItem);
		local btn = new(Button, "isolater/bg_blank.png", "isolater/bg_blank.png");
		self.m_defaultWidth, self.m_defaultHeight = view:getSize();
        btn:setSize(self.m_defaultWidth, self.m_defaultHeight);
		view:setName("view");
		btn:addChild(view);
		self.m_itemList[i] = btn;
		self.m_itemMap[btn.m_drawingID] = i;

		btn:setOnClick(self, self.onItemClick, nil, btn, dataItem);
		local itemWidth, itemHeight = btn:getSize();
		btn:setPos((viewWidth - itemWidth)/2, (viewHeight - itemHeight)/2);
		self:addChild(btn);
	end
	self.m_startIndex = #self.m_itemList;
	self:startRotation(1);
end

ListView3D.onItemClick = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, btn, data)
    local itemIndex = self.m_itemMap[btn.m_drawingID];
	if itemIndex == self.m_startIndex then
		self:checkSelectedItemFocal(btn);
	else
		self:startRotation(itemIndex);
	end
end

ListView3D.statrTimer = function(self)
	self:stopTimer();    --self.m_swfInfo["fps"] = 24
	self.m_animTimer = new(AnimInt , kAnimRepeat, 0, 1 , 50, -1);
 	self.m_animTimer:setEvent(self, self.onTimer);
end

ListView3D.onTimer = function(self)
	self:moveMenu();
end

ListView3D.stopTimer = function(self)
	if self.m_animTimer then
		delete(self.m_animTimer);
		self.m_animTimer = nil;
	end
end

ListView3D.startRotation = function(self, index, direction)
	if not index and index < 1 and index > #self.m_itemList then
		return;
	end
	
	local endIndex = index;
	if not self.m_startIndex then
		self.m_startIndex = endIndex;
	end

	
	local endItem = self.m_itemList[endIndex];

	self:checkSelectedItem(endItem);

	local startIndex = self.m_startIndex;
	local itemNum = #self.m_itemList;
	local angleSize = 360 / itemNum;

	local deltaIndex = endIndex - startIndex;
	local splitNum = itemNum / 2;

	local deltaIndexFromStartToEnd = deltaIndex;
	if math.abs(deltaIndex) > splitNum then
		deltaIndexFromStartToEnd = deltaIndex < 0 and itemNum + deltaIndex or -(itemNum - deltaIndex);
	end

    local deltaAngle;
	if direction then
		local tmpA = deltaIndexFromStartToEnd < 0 and itemNum + deltaIndexFromStartToEnd or deltaIndexFromStartToEnd;
		local tmpB = deltaIndexFromStartToEnd < 0 and -deltaIndexFromStartToEnd or itemNum-deltaIndexFromStartToEnd;
		deltaAngle = ListView3D.eDirection.RIGHT == direction and angleSize * tmpA or -angleSize * tmpB;
	else
		deltaAngle = angleSize * deltaIndexFromStartToEnd;
	end
	
	deltaAngle = -deltaAngle;

    if self.m_isRotating then
        self.m_endAngle = self.m_endAngle + deltaAngle;
    else
        self.m_endAngle = deltaAngle;
    end
    
    self.m_isRotating = true;
	self:statrTimer();

	self.m_startIndex = endIndex;
end

ListView3D.moveMenu = function(self)
	local itemCount = #self.m_itemList;	
	local depthArray = {};
	local angle = 360 / itemCount;
	for i = 1, itemCount do
		local item = self.m_itemList[i];
		
		local itemAngle = self.m_angleSum + self.m_currentAngle + angle * i - 90;
		local localX = Math2D.cosD(itemAngle)*self.m_maxx;
		local localY = -Math2D.sinD(itemAngle)*self.m_maxy;
		local funcValueY = self:getPropVal(localY, .7, 1);
		
		depthArray[i] = item;
		
		local scaleWidth = self.m_defaultWidth * funcValueY;
		local scaleHeight = self.m_defaultHeight * funcValueY;
		local color = 255 * self:getPropVal(localY, .5, 1);
		item:setSize(scaleWidth , scaleHeight);
		item:setColor(color, color, color);

		local view = item:getChildByName("view");
		self:_callViewFuncSafe(view, "setScale", funcValueY);

        local viewWidth, viewHeight = self:getSize();
        local itemWidth, itemHight = item:getSize();
		item:setPos(localX + (viewWidth - itemWidth)/2, localY + (viewHeight - itemHight)/2);
	end
	self:arrange(depthArray);
	local deltaAngle = (self.m_endAngle - self.m_currentAngle)*.2;

	local maxSpeed = itemCount > 0 and 30 / itemCount or 30;
	deltaAngle = deltaAngle > maxSpeed and maxSpeed or deltaAngle;
	deltaAngle = deltaAngle < -maxSpeed and -maxSpeed or deltaAngle;
	self.m_currentAngle = self.m_currentAngle + deltaAngle;
	if self.m_currentAngle == self.m_endAngle then
		self:stopTimer();
        self.m_angleSum = self.m_angleSum + self.m_endAngle;  
        self.m_endAngle = 0;
        self.m_currentAngle = 0;
        self.m_isRotating = false;
		return;
	end

	if math.abs(self.m_currentAngle-self.m_endAngle) < 0.5 then
		self.m_currentAngle = self.m_endAngle;
	end
end

ListView3D.arrange = function(self,depthArray)
	table.sort(depthArray, function(a,b) return a.m_alignY < b.m_alignY end);
    for i = #depthArray,1,-1 do
		local item = depthArray[i]
		item:setLevel(i);
	end
end

ListView3D.getChildByLevel = function(self,level)
	for _,v in pairs(self.m_children) do 
        if v:getLevel() == level then
        	return v;
        end
    end
end

ListView3D.checkSelectedItem = function(self, item)
	for _, v in pairs(self.m_children) do 
		local view = v:getChildByName("view");
		self:_callViewFuncSafe(view, "setSelected", v == item);
    end
end

ListView3D.checkSelectedItemFocal = function(self, item)
	local view = item:getChildByName("view");
	self:_callViewFuncSafe(view, "onFocal");
end

ListView3D.getPropVal = function(self,y,n1, n2)
	return ((y+2*self.m_maxy)/self.m_maxy-1)/2*(n2-n1)+n1
end

ListView3D._callViewFuncSafe = function(self, view, funcName, ...)
	if view and view[funcName] then
		view[funcName](view, ...);
	end
end

ListView3D.moveWithSpeed = function(self)
	
end
---------------------------------------------------------------------------
Math2D = {};
function Math2D.angleToRadian(angle) 
	return angle*(math.pi / 180);
end

function Math2D.radianToAngle(radian) 
	return radian*(180/math.pi);
end

function Math2D.sinD(angle) 
	return math.sin(Math2D.angleToRadian(angle));
end

function Math2D.cosD(angle) 
	return math.cos(Math2D.angleToRadian(angle));
end

function Math2D.atan2D(y, x) 
	return Math2D.radianToAngle(math.atan2(y, x));
end

function Math2D.getDistance(ax,ay,bx,by)
	return math.sqrt((ax-bx)^2 + (ay-by)^2);
end