require("ui/scrollableNode");

ScrollableNode.updateScrollBar = function(self)
	if not (self:needScrollBar() 
		and ScrollableNode.isAllLengthVaild(self)
		and ScrollableNode.isViewBiggerThanFrame(self)) then

		ScrollableNode.releaseScrollBar(self);
		return;
	end

	if ScrollableNode.hasScrollBar(self) then
		self.m_scrollBar:setFrameLength(self:getFrameLength());
   		self.m_scrollBar:setViewLength(self:getViewLength());
   		ScrollableNode.updateScrollBarStartPos(self)
   	else
   		ScrollableNode.createScrollBar(self);
   	end
end

ScrollableNode.createScrollBar = function(self)
	local frameLength = self:getFrameLength();
	local viewLength = self:getViewLength();

	self.m_scrollBar = new(ScrollBar,self.m_direction,frameLength,viewLength);
    ScrollableNode.addChild(self,self.m_scrollBar);
    ScrollableNode.updateScrollBarStartPos(self)
    ScrollableNode.updateScrollBarPosAndSize(self);
    self.m_scrollBar:setLevel(1);
    self.m_scrollBar:setVisibleImmediately(false);
end

ScrollableNode.updateScrollBarStartPos = function(self)
    if not ScrollableNode.needScrollBar(self) then
        ScrollableNode.releaseScrollBar(self);
        return;
    end
    
	if not ScrollableNode.hasScrollBar(self) then
		return;
	end

	local frameOffsetX, frameOffsetY = self:getFrameOffset();
    if self.m_direction == kVertical then
    	self.m_scrollBar:setStartPos(frameOffsetY);
    else
    	self.m_scrollBar:setStartPos(frameOffsetX);
    end
end