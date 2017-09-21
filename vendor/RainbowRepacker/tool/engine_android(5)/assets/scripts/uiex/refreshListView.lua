require("core/constants");
require("core/object");
require("core/global");
require("ui/scrollableNode");

RefreshListView = class(ScrollableNode,false);

RefreshListView.s_defaultScrollBarWidth = 8;
RefreshListView.s_defaultMaxClickOffset = 5;

RefreshListView.setDefaultScrollBarWidth = function(width)
	RefreshListView.s_scrollBarWidth = width or RefreshListView.s_defaultScrollBarWidth;
end

RefreshListView.setDefaultMaxClickOffset = function(maxClickOffset)
	RefreshListView.s_maxClickOffset = maxClickOffset or RefreshListView.s_defaultMaxClickOffset;
end

RefreshListView.ctor = function(self, x, y, w, h, autoAlignToItemEdge, isMultiItems)
	super(self,kVertical,self.s_scrollBarWidth or self.s_defaultScrollBarWidth);
	self.m_autoAlignToItemEdge = autoAlignToItemEdge;
	self.m_isMultiItem = isMultiItems;

	self.m_diff = 0;
	self.m_views = {};
	self.m_adapter = nil;
	self.m_itemLength = 0;
	self.m_itemEdgeLength = 0;
	self.m_nShowLines = 0;
	self.m_nTotalLines = 0;
	self.m_nItemsPerLine = 1;

	self.m_maxClickOffset = self.s_maxClickOffset or self.s_defaultMaxClickOffset;

	self:setPos(x,y);
	self:setSize(w or 1,h or 1);
	self:setClip();

	self:setEventDrag(self,self.onEventDrag);
	self:setEventTouch(self,self.onEventTouch);

	self.m_itemEventCallback = {};
	self.m_scrollCallback = {};
end

RefreshListView.setMaxClickOffset = function(self, offset)
	self.m_maxClickOffset = offset or self.s_maxClickOffset or self.s_defaultMaxClickOffset;
end

RefreshListView.setScrollBarWidth = function(self, width)
	width = width or self.s_scrollBarWidth or self.s_defaultScrollBarWidth;
	ScrollableNode.setScrollBarWidth(self,width);
end

RefreshListView.setDirection = function(self, direction)
	if (not direction) or self.m_direction == direction then
		return;
	end

	self.m_direction = direction;

    self:updateItemLength();
    self:updateLineInfo();
	self:setClip();
	ScrollableNode.setDirection(self,self.m_direction);
	self:releaseAllViews();
	self:initViews();
end

RefreshListView.scrollTo = function(self, diff)
	-- body
	self:stop();
	self:requireAndShowViews(diff);
end

RefreshListView.setPos = function(self, x, y)
	ScrollableNode.setPos(self,x,y);
	self:setClip();
end

RefreshListView.setSize = function(self, w, h)
	ScrollableNode.setSize(self,w,h);
	self:setClip();
	self:updateLineInfo();
	self:requireAndShowViews(self.m_diff);
end

RefreshListView.setAlign = function(self, align)
	ScrollableNode.setAlign(self,align);
	self:setClip();
end

RefreshListView.setFillRegion = function(self, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY)
	ScrollableNode.setFillRegion(self, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY);
	self:setClip();
end

RefreshListView.setFillParent = function(self, doFillParentWidth, doFillParentHeight)
	ScrollableNode.setFillParent(self,doFillParentWidth,doFillParentHeight);
	self:setClip();
end

RefreshListView.setClip = function(self)
	local clipX,clipY,clipW,clipH;
	local x,y = self:getUnalignPos();
	local width,height = self:getSize();
	if self:hasAdapter() then 
		if self.m_direction == kVertical then	
			if self.m_autoAlignToItemEdge then
				clipH = self:getFrameLength();
				clipY = y + (height - clipH)/2;
			else
				clipH = height;
				clipY = y;
			end

			if self.m_isMultiItem then 
				clipW = width - width % self.m_itemEdgeLength;
				clipX = x + (width - clipW)/2;
			else
				clipW = width;
				clipX = x;
			end
		else
			if self.m_autoAlignToItemEdge then
				clipW = self:getFrameLength();
				clipX = x + (width - clipW)/2;
			else
				clipW = width;
				clipX = x;
			end

			if self.m_isMultiItem then 
				clipH = height - height % self.m_itemEdgeLength;
				clipY = y + (height - clipH)/2;
			else
				clipH = height;
				clipY = y;
			end
		end
	else
		clipX = x;
		clipY = y;
		clipW = width;
		clipH = height;
	end

	ScrollableNode.setClip(self,clipX,clipY,clipW,clipH);
end

RefreshListView.setAdapter = function(self, adapter)
    self:releaseAllViews();

    if self.m_adapter ~= adapter then
		delete(self.m_adapter);
    	self.m_adapter = adapter;
    end

    if not adapter then 
    	return;
    end

    if not typeof(adapter,Adapter) then
    	FwLog("The param must be an Adapter in setAdapter");
    	return;
    end

    adapter:setEventListener(self);

    --The following calls must be in order 
    self:updateItemLength();
    self:updateLineInfo();
    self:setClip();
   	ScrollableNode.recreate(self);
    self:initViews();
end

RefreshListView.getAdapter = function(self)
	-- body
	return self.m_adapter;
end

RefreshListView.onAppendData = function(self)
	self:updateLineInfo();
	self:update();
	self:requireAndShowViews(self.m_diff);
end

RefreshListView.onChangeData = function(self)
	self:releaseAllViews();
	self:updateItemLength();
	self:updateLineInfo();
    self:setClip();
   	ScrollableNode.recreate(self);
    self:initViews();
end

RefreshListView.onUpdateData = function(self, index)
	local i = index - self.m_beginIndex;
	local x,y;
	if self.m_views[i] then
		x,y = self.m_views[i]:getPos();
		self:removeChild(self.m_views[i]);
	    self.m_adapter:releaseView(self.m_views[i]);
	else
		x,y = 0, index * self.m_itemLength;
	end
	self:updateLineInfo();
	self:update();
	
	self.m_views[i] = self.m_adapter:getView(index);
	self.m_views[i]:setPos(x,y);
	self:addChild(self.m_views[i]);
	self:requireAndShowViews(self.m_diff);
end

RefreshListView.setOnItemClick = function(self, obj, func)
	self.m_itemEventCallback.obj = obj;
	self.m_itemEventCallback.func = func;
end

RefreshListView.setOnScroll = function(self, obj, func)
	self.m_scrollCallback.obj = obj;
	self.m_scrollCallback.func = func;
end

RefreshListView.setShowingIndex = function(self, index)
	local frameOffsetX,frameOffsetY = self:getFrameOffset();
	local lineIndex = math.ceil(index/self.m_nItemsPerLine) - 1;

	self:getScroller():setReboundFrames(0);
	if self.m_direction == kVertical then
		local destDiff = lineIndex * self.m_itemLength + frameOffsetY;
		self:onEventDrag(kFingerDown, 0, self.m_diff, 0, 0);
		self:onEventDrag(KfingerUp, 0, -destDiff, 0, 0);
	else
		local destDiff = lineIndex * self.m_itemLength + frameOffsetX;
		self:onEventDrag(kFingerDown,self.m_diff, 0, 0, 0);
		self:onEventDrag(KfingerUp,-destDiff, 0, 0, 0);
	end
	self:getScroller():setReboundFrames();
end

RefreshListView.dtor = function(self)
	self:releaseAllViews();
	
    delete(self.m_adapter);
    self.m_adapter = nil;
end

RefreshListView.addHeadView = function(self, headView)
	-- body
	self.m_headView = headView;
	-- if self.m_headView
	-- table.insert()
	self:addChild(self.m_headView);
	self:show();
end

RefreshListView.addFootView = function(self, footViewType)
	-- body
	self.m_footViewType = footViewType;
	self.m_isShowFoot = true;
	if self.m_footView then
		delete(self.m_footView);
		self.m_footView = nil;
	end
end

RefreshListView.setOnFootClick = function(self, obj, callback)
	-- body
	self.m_footCBObj = obj;
	self.m_footCBFunc = callback;
end

RefreshListView.setFootViewVisible = function(self, isShowFoot)
	-- body
	-- if self.m_footView then
	-- 	self.m_footView:setVisible(isShowFoot);
	-- end
	self.m_isShowFoot = isShowFoot;
end

---------------------------------private functions-----------------------------------------

--virtual

RefreshListView.reviseSize = function(self)
	ScrollableNode.reviseSize(self);
	self:setClip();
end

RefreshListView.revisePos = function(self)
	ScrollableNode.revisePos(self);
	self:setClip();
end

RefreshListView.getFrameLength = function(self)
	local unitLength = self:getUnitLength();
	local width,height = self:getSize();

	if self.m_direction == kVertical then
		return height - height % unitLength;
	else
		return width - width % unitLength;
	end
end

RefreshListView.getViewLength = function(self)
	return self.m_nTotalLines * self.m_itemLength;
end

RefreshListView.getUnitLength = function(self)
	return self.m_autoAlignToItemEdge and self.m_itemLength or 1;
end

RefreshListView.getFrameOffset = function(self)
	local width,height = self:getSize();
	if self.m_direction == kVertical then
		return (width - self.m_nItemsPerLine*self.m_itemEdgeLength)/2,
			(height - self:getFrameLength())/2;
	else
		return (width - self:getFrameLength())/2,
			(height - self.m_nItemsPerLine*self.m_itemEdgeLength)/2;
	end
end

RefreshListView.needScroller = function(self)
	return self:hasAdapter();
end

RefreshListView.updateItemLength = function(self)
	if not self:hasAdapter() then
		self.m_itemLength = 0;
		self.m_itemEdgeLength = 0;
		return;
	end
	local view = self.m_adapter:getView(1); -- 本处不担心数组越界?
	if not view then
	 	return;
	end
	local itemWidth ,itemHeight = view:getSize();
	self.m_adapter:releaseView(view);

	if self.m_direction == kVertical then
		self.m_itemLength = itemHeight;
		self.m_itemEdgeLength = itemWidth;
	else
		self.m_itemLength = itemWidth;
		self.m_itemEdgeLength = itemHeight;
	end
end

RefreshListView.hasAdapter = function(self)
	return self.m_adapter ~= nil;
end

RefreshListView.initViews = function(self)
	self.m_views = {};
	self.m_beginIndex = 0;
	self.m_offset = 0;
	
	self:requireAndShowViews(0);
end

RefreshListView.releaseAllViews = function(self)
	for _,v in ipairs(self.m_views) do 
		self:removeChild(v);
		self.m_adapter:releaseView(v);
	end

	self.m_views = {};
end

RefreshListView.updateLineInfo = function(self)
	if not self:hasAdapter() then
		self.m_nShowLines = 0;
		self.m_nItemsPerLine = 1;
		return;
	end

	local width,height = self:getSize(self);
	self.m_nShowLines = math.ceil(self:getFrameLength() / self.m_itemLength);

	if self.m_isMultiItem then
		if self.m_direction == kVertical then
			self.m_nItemsPerLine = math.floor(width / self.m_itemEdgeLength);
		else
			self.m_nItemsPerLine = math.floor(height / self.m_itemEdgeLength);
		end
	else
		self.m_nItemsPerLine = 1;
	end

	local count = self.m_adapter:getCount();
	if self.m_footViewType then
		count = count + 1;
	end
	self.m_nTotalLines = math.ceil(count / self.m_nItemsPerLine);
	self.m_nShowLines = self.m_nTotalLines > self.m_nShowLines and self.m_nShowLines or self.m_nTotalLines;
end

RefreshListView.requireAndShowViews = function(self, diff)
    if not self:hasAdapter() then 
        return;
    end
    
	self:requestViews(diff);
	self:show();
end

RefreshListView.getCurTouchViewAndIndex = function(self, x, y)
	local frameLength = self:getFrameLength();
	local frameOffsetX,frameOffsetY = self:getFrameOffset();
	local width,height = self:getSize();

	if x < frameOffsetX or y < frameOffsetY or x > width or y > height then
		return;
	end

	local curPos = (self.m_direction == kVertical) and y or x;
	local frameOffset = (self.m_direction == kVertical) and frameOffsetY or frameOffsetX;
	local itemOffset = (self.m_direction == kVertical) and x or y;

	local diff = curPos - frameOffset - self.m_diff;
	if curPos < 0 or curPos > frameLength then
		return;
	end

	local lineIndex = math.ceil(diff / self.m_itemLength);
    local itemIndex = math.ceil( (itemOffset - (frameOffsetX + frameOffsetY - frameOffset)) / self.m_itemEdgeLength);
	local index = (lineIndex-1)*self.m_nItemsPerLine + itemIndex;
	local view = self.m_views[index-self.m_beginIndex*self.m_nItemsPerLine];
	return view,index;
end

RefreshListView.requestViews = function(self, diff)
	if self.m_nShowLines == 0 then
		return;
	end

	local frameLength = self:getFrameLength();
	local viewLength = self:getViewLength();
	local itemLength = self.m_itemLength;

    self.m_diff = diff;
    
    local nShowLines = self.m_nShowLines;
    
    local index;
    if diff >= 0 then
        index = 0;
        self.m_offset = diff;
    elseif diff < frameLength - viewLength then
        index = self.m_nTotalLines - nShowLines;
        self.m_offset = diff + (self.m_nTotalLines- nShowLines)*itemLength;
    else
        index = math.floor(-diff/itemLength);
        self.m_offset = diff + index * itemLength;
        if index + nShowLines < self.m_nTotalLines then 
            nShowLines = nShowLines +1;
        end
    end
   
    if index == self.m_beginIndex and math.ceil(#self.m_views/self.m_nItemsPerLine) == nShowLines then 
        return;
    end
    
    local itemDiff = (index - self.m_beginIndex) * self.m_nItemsPerLine;
    self.m_beginIndex = index;
    local beginItemIndex = index * self.m_nItemsPerLine;
    local nShowItems = nShowLines*self.m_nItemsPerLine;
    local temp = self.m_views;
    self.m_views = {};
    if itemDiff >= 0 then
        for i=itemDiff+1,#temp do
            self.m_views[i-itemDiff] = temp[i];
            temp[i] = nil;
        end
        for i=#self.m_views+1,nShowItems do
            self.m_views[i] = self.m_adapter:getView(i+beginItemIndex);
            if i+beginItemIndex == self.m_nTotalLines and self.m_footViewType then
            	if not self.m_footView then
            		self.m_footView = new(self.m_footViewType);
            	end
            	self.m_views[i] = self.m_footView;
            	self.m_footView:setVisible(self.m_isShowFoot);
            end
            if not self.m_views[i] then
                break;
            end
			self:addChild(self.m_views[i]);
        end
    else
        for i=1,nShowItems+itemDiff >= #temp and #temp or nShowItems+itemDiff do 
            self.m_views[i-itemDiff] = temp[i];
            temp[i] = nil;
        end
        for i=1,-itemDiff do
            self.m_views[i] = self.m_adapter:getView(i+beginItemIndex);
            if not self.m_views[i] then
                break;
            end
			self:addChild(self.m_views[i]);
        end
        for i=#self.m_views+1,nShowItems do
            self.m_views[i] = self.m_adapter:getView(i+beginItemIndex);
            if not self.m_views[i] then
                break;
            end
			self:addChild(self.m_views[i]);
        end
    end
    for _,v in pairs(temp) do  
		self:removeChild(v);
        self.m_adapter:releaseView(v);
    end
end

RefreshListView.show = function(self)	
	local frameOffsetX,frameOffsetY = self:getFrameOffset();

	local getScrollDirectionPos = function(i)
		return self.m_offset + self.m_itemLength*math.floor((i-1)/self.m_nItemsPerLine)
	end 

	local getFixDirectionPos = function(i)
		return (i-1)%self.m_nItemsPerLine*self.m_itemEdgeLength;
	end

	if self.m_direction == kVertical then
		local totalH = self.m_offset;
		for i,view in ipairs(self.m_views) do
			view:setPos(frameOffsetX + getFixDirectionPos(i), frameOffsetY + totalH);--getScrollDirectionPos(i, view));
			local w,h = view:getSize();
			totalH = totalH + h;
		end
	else
		for i,view in ipairs(self.m_views) do
			view:setPos(frameOffsetX + getScrollDirectionPos(i),
				frameOffsetY + getFixDirectionPos(i));
		end
	end
end

RefreshListView.isToTop = function(self)
	-- body
	return self.m_diff >= 0;
end

RefreshListView.getDiff = function(self)
	-- body
	return self.m_diff;
end

RefreshListView.onEventTouch = function()

end

RefreshListView.onEventDrag =  function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if self:hasScroller() then 
		self.m_scroller:onEventTouch(finger_action,x,y,drawing_id_first,drawing_id_current);
	end

	if finger_action == kFingerDown then
		self.m_startX = x;
		self.m_startY = y;
	elseif finger_action ~= kFingerMove then
		if 	math.abs(y-self.m_startY) < self.m_maxClickOffset and math.abs(x-self.m_startX) < self.m_maxClickOffset then
			if self.m_itemEventCallback.func and self:hasAdapter() then
			    local localX,localY = self:convertSurfacePointToView(x,y);
				local view,index = self:getCurTouchViewAndIndex(localX,localY);

				if view then 
					local viewX,viewY = view:convertSurfacePointToView(x,y);
					if index == self.m_nTotalLines and self.m_footViewType then
						if self.m_footCBObj and self.m_footCBFunc and self.m_isShowFoot then
							self.m_footCBFunc(self.m_footCBObj, self.m_adapter, view, index, viewX, viewY);
						end
					else
						self.m_itemEventCallback.func(self.m_itemEventCallback.obj,self.m_adapter,view,index,viewX,viewY);
					end
				end
			end
		end
	end
end

RefreshListView.onScroll = function(self, scroll_status, diff, totalOffset)
	ScrollableNode.onScroll(self, scroll_status, diff, totalOffset);

	self:requireAndShowViews(totalOffset);
	local itemIndex = self.m_beginIndex*self.m_nItemsPerLine + 1;
	if self.m_scrollCallback.func then
	    local itemIndex = self.m_beginIndex*self.m_nItemsPerLine + 1;
		self.m_scrollCallback.func(self.m_scrollCallback.obj,scroll_status,itemIndex,#self.m_views, totalOffset);
	end
end

RefreshListView.isTouchItem = function(self, sX, sY, eX, eY)
	-- body
	return math.abs(sY-eY) < self.m_maxClickOffset and math.abs(sX-eX) < self.m_maxClickOffset
end
