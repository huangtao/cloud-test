require("core/constants");
require("core/object");
require("core/res");
require("ui/node");


NewListView = class(Node);

NewListView.ctor = function(self, width, height, direction)
	-- body
	self.m_w = tonumber(width) or 0;
	self.m_h = tonumber(height) or 0;
	self.m_direct = tonumber(direction) or kVertical;
	self:setSize(self.m_w, self.m_h);
	self:setEventTouch(self, self.onEventTouch);
	self:setEventDrag(self, self.onEventDrag);
	self:init();
end

NewListView.dtor = function(self)
	-- body
end

NewListView.onEventTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	-- body
end
NewListView.onEventDrag = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	-- body
	-- kFingerDown		= 0;
	-- kFingerMove		= 1;
	-- kFingerUp		= 2;
	-- kFingerCancel	= 3;
	if finger_action == kFingerDown then
		self.m_downX = x;
		self.m_downY = y;
	elseif finger_action == kFingerMove then
		if self.m_downX and self.m_downY then
			self:update(x-self.m_downX, y-self.m_downY)
		end
	else
		if self.m_downX and self.m_downY then
			self:update(x-self.m_downX, y-self.m_downY)
		end
		self.m_downX = nil;
		self.m_downY = nil;
	end
end

NewListView.setAdapter = function(self, adapter)
	-- body
	if typeof(adapter, BaseAdapter) then
		self.m_adapter = adapter;
	else
		self.m_adapter = nil;
	end
	self:refresh();
end

------------------- private ---------------------------
NewListView.init = function(self)
	-- body
	self.m_showViewMap = {};
	self.m_hideViewMap = {};
	self.m_adapter = nil;

	self.m_containerView = new(Node);
	self:addChild(self.m_containerView);
	self.m_containerView:setSize(self.m_w, self.m_h);
	self.m_containerView:setPos(0,0);
end


NewListView.refresh = function(self)
	-- body
	self:removeAllChildren(true);
	self.m_showViewMap = {};
	self.m_hideViewMap = {};
	self.m_offset = 0;
	if self.m_adapter then
		--此时开始添加view
		--这是第一次添加view
		local totalCount = self.m_adapter:getCount();
		local tmpH = 0;
		self.m_startIndex = 1;
		for i = 1, totalCount do
			Log.d("正在绘制绘制绘制");
			local itemView = self.m_adapter:getView(i, table.remove(self.m_hideViewMap, 1));
			table.insert(self.m_showViewMap, itemView);
			self.m_containerView:addChild(itemView);
			local w,h = itemView:getSize();
			tmpH = tmpH + h;
			itemView:setPos(0, tmpH);
			if tmpH > self.m_h then
				self.m_endIndex = i;
				self.m_containerView:setSize(self.m_w, tmpH);
				break;
			end
		end

		self.m_containerView:setClip(0, 0, self.m_w, self.m_h);
	end
end

NewListView.update = function(self, disX, disY)
	-- body
	--disY小于0手指往上滑  disY大于0手指往下滑
	--disX小于0手指往左滑  disX大于0手指往右滑

			Log.d("正在滑动滑动");
	local x,y = self.m_containerView:getPos();
	local totalW, totalH = self.m_containerView:getSize();
	local newX = x;

	local newY = y + disY;
	self.m_containerView:setPos(newX, newY);

	local clipX = 0 - newX;
	local clipY = 0 - newY;

	--先检测是否有需要移除的
	local viewFirst = self.m_showViewMap[1];
	local viewLast = self.m_showViewMap[#self.m_showViewMap];
	local w1,h1 = viewFirst:getSize();
	local w2,h2 = viewLast:getSize();
	if newY < 0 then
		--先判断上面是否有移除的
		if h1 + newY <= 0 then
			--此时移除上面的
			local viewTmp = table.remove(self.m_showViewMap, 1);
			self.m_containerView:removeChild(viewTmp);
			table.insert(self.m_hideViewMap, viewTmp);
		end
	else
		--先判断底部是否有移除的
	end
	self.m_containerView:setClip(clipX, clipY, self.m_w, self.m_h);
end


BaseAdapter = class();

BaseAdapter.ctor = function(self)
	-- body
end

BaseAdapter.dtor = function(self)
	-- body
end

--返回需要的view
BaseAdapter.getView = function(self, position, itemView)
	-- body
	return itemView;
end

--返回item参数
BaseAdapter.getItem = function(self, position)
	-- body
end

--返回数据的数量
BaseAdapter.getCount = function(self)
	-- body
	return 0;
end