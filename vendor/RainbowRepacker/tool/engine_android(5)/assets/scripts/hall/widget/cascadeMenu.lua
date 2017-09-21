--[Comment]
-- 级联菜单（暂支持个人信息页城市菜单）
CascadeMenu = class(Node);

--[Comment]
-- data:数据源
-- w:宽度
-- h:高度
-- background:背景 
CascadeMenu.ctor = function ( self, data, w, h, background )
	-- body

	if not data then return; end

	self.m_data = data;					-- 数据源
	self.m_width = w;					-- 菜单宽度
	self.m_height = h;					-- 菜单高度
	self.m_background = background;		-- 菜单背景


	self.m_pro = "";					-- 省份
	self.m_city = "";					-- 城市

	self:initViews();
end

--[Comment]
-- 选择后隐藏并销毁菜单界面 
CascadeMenu.hide = function ( self )
	-- body
	self:setVisible(false);
end
--[Comment]
-- 显示级联菜单
CascadeMenu.show = function ( self )
	self:setVisible(true);
end
--[Comment]
-- 级联菜单
CascadeMenu.dtor = function ( self )
	-- body
	delete(self.m_listViewLeft);
	self.m_listViewLeft = nil;

	delete(self.m_content);
	self.m_content = nil;

	delete(self.m_listViewRight);
	self.m_listViewRight = nil;

	delete(self.m_bg2);
	self.m_bg2 = nil;

end

--[Comment]
-- 初始化菜单界面
CascadeMenu.initViews = function ( self )
	-- body
	self:setAlign(kAlignCenter);
	self:setFillParent(true, true);

	-- 添加遮罩
	self.m_shield = new(Image, self.m_background, nil, nil, 0, 0, 0, 0);
	
	self.m_shield:setFillParent(true, true);
	self.m_shield:setAlign(kAlignCenter);
	self:addChild(self.m_shield);
	self.m_shield:setLevel(-1);
	self.m_shield:setEventTouch(self, self.onCloseCallback);
	self.m_shield:setEventDrag(self, self.onEmptyFunc);

	-- 添加容器
	self.m_content = new(Node);
	self.m_content:setSize(self.m_width, self.m_height);
	self.m_content:setAlign(kAlignCenter);
	self.m_content:setPos(0, 15);
	self:addChild(self.m_content);

	-- 添加背景
	self.m_maskingImg = new(Image, "hall/common/popupWindow/popupWindow_bg_55_55_55_55.png", nil, nil, 55, 55, 55, 55);
	self.m_maskingImg:setSize(self.m_width, self.m_height);
	self.m_maskingImg:setAlign(kAlignCenter);
	self.m_maskingImg:setEventTouch(self, self.onEmptyFunc);
	self.m_maskingImg:setEventDrag(self, self.onEmptyFunc);
	self.m_content:addChild(self.m_maskingImg);

	self.m_maskingContentImg = new(Image, "hall/userInfo/hall/maskingBg.png", nil, nil, 55, 55, 55, 55);
	self.m_maskingContentImg:setSize(self.m_width - 14, self.m_height - 14); -- 调整大小
	self.m_maskingContentImg:setAlign(kAlignCenter);
	self.m_maskingImg:addChild(self.m_maskingContentImg);

	-- 添加一级菜单ListView
	self.m_listViewLeft = new(ListView, 0, 0, self.m_width / 2, self.m_height, true);
	self.m_listViewLeft:setFillRegion(true, 18, 50, self.m_width / 2, 50);
	self.m_listViewLeft:setScrollBarWidth(0);
	self.m_adapterLeft = new(CacheAdapter, SimpleListItemView, self:_operateData(self.m_data));
	self.m_listViewLeft:setAdapter(self.m_adapterLeft);
	self.m_listViewLeft:setOnScroll(self,self.onScrollCallbackLeft);				--设置点击回调函数
	self.m_content:addChild(self.m_listViewLeft);

	-- 添加二级菜单ListView
	local x1, y1 = self.m_listViewLeft:getPos();
	self.m_listViewRight = new(ListView, x1 + self.m_width / 2, y1, self.m_width / 2, self.m_height, true);
	self.m_listViewRight:setFillRegion(true, self.m_width / 2, 50, 18, 50);
	self.m_listViewRight:setScrollBarWidth(0);
	self.m_adapterRight = new(CacheAdapter, SimpleListItemView, self:_operateData(self.m_data[1].children));
	self.m_listViewRight:setAdapter(self.m_adapterRight);
	self.m_listViewRight:setOnScroll(self,self.onScrollCallbackRight);				--设置点击回调函数
	self.m_content:addChild(self.m_listViewRight);

	-- 选择框
	self.m_selImg = new(Image, "hall/common/item_sel_l40_r40_t40_b40.png", nil, nil, 40, 40, 40, 40);
	self.m_selImg:setSize(self.m_width + 100, 140);
	self.m_selImg:setAlign(kAlignCenter);
	self.m_content:addChild(self.m_selImg);
end

-- 设置默认城市
CascadeMenu.setDefaultCity = function ( self, pro, city) 
	local indexPro = 0;
	local indexProView = 0;
	-- 高亮一级菜单
	if not self.m_data then return; end
	for k, v in ipairs(self.m_data) do
		if v.name == pro then 
			indexPro = k;
			indexProView = k + 2;
			self.m_leftCurrentIndex = indexProView;
			self.m_rightCurrentIndex = -1;
			self.m_pro = v.name;
			local scroller = self.m_listViewLeft:getScroller();
			if scroller then 
				scroller:setOffset((1 - indexPro) * 90);
			end
			break;
		end
	end
	if indexPro <= 2 then return; end
	if not self.m_data[indexPro].children then 
		self.m_listViewRight:setVisible(false);
		return;
	end

	-- 设置二级菜单数据源
	self.m_adapterRight:changeData(self:_operateData(self.m_data[indexPro].children)); -- 更新数据源

	local indexCityView = 0;
	for k, v in ipairs(self.m_data[indexPro].children) do
		if v.name == city then 
			--v.isFocused = true;
			indexCityView = k + 2;
			self.m_rightCurrentIndex = indexCityView;
			local scroller = self.m_listViewRight:getScroller();
			if scroller then 
				scroller:setOffset((1 - k) * 90);
			end
			break;
		end
	end
end

--[Comment]
-- 菜单点击事件 
-- adapter:适配器
-- view:视图
-- index:索引
CascadeMenu.onItemClick = function ( self, adapter, view, index, isClickParent)
	-- body
	local data = adapter:getData()[index];
	if not data then 
		return;
	end

	Log.d("is click parent : ", isClickParent);
	if isClickParent and data.children then
		-- 点击父菜单 
        local childrenData = adapter:getData()[index].children
		self.m_adapterRight:changeData(self:_operateData(childrenData)); -- 更新数据源
		
		self.m_pro = data.name; -- 更新省份
		self.m_city = childrenData[1].name;
		self.m_listViewRight:setVisible(true);
		self.m_onItemClickCallbackFunc(self.m_onItemClickCallbackObj, self.m_pro, self.m_city); -- 回调 
	elseif isClickParent and (not data.children) then
		self.m_pro = data.name;
		self.m_city = "";
		self.m_listViewRight:setVisible(false);
		self.m_onItemClickCallbackFunc(self.m_onItemClickCallbackObj, self.m_pro, self.m_city); -- 回调 
		--self:hide(); -- 隐藏菜单并销毁		
	else 
		if string.isEmpty(self.m_pro) then 
			self.m_pro = self.m_data[1].name;
		end
		-- 点击子菜单
		self.m_city = data.name; -- 更新城市
		self.m_onItemClickCallbackFunc(self.m_onItemClickCallbackObj, self.m_pro, self.m_city); -- 回调 
		--self:hide(); -- 隐藏菜单并销毁		

	end
end

--[Comment]
-- 设置菜单点击回调
CascadeMenu.setOnItemClickCallback = function ( self, obj, func )
	-- body
	self.m_onItemClickCallbackObj = obj;
	self.m_onItemClickCallbackFunc = func;
end

-- 设置关闭回调
CascadeMenu.setOnCloseCallback = function(self, obj, func)
	self.m_onCloseCallbackObj = obj;
	self.m_onCloseCallbackFunc = func;
end

CascadeMenu.onEmptyFunc = function(self)
	
end

CascadeMenu.onScrollCallbackLeft = function(self, scroll_status, itemIndex, nViews, diff, totalOffset)
    if scroll_status ~= kScrollerStatusStop then
        return;
    end
    
    local viewItem = itemIndex + 2;
    if self.m_leftCurrentIndex == viewItem then
    	return;
    end

    self.m_leftCurrentIndex = viewItem;
    self:onItemClick(self.m_adapterLeft, nil, self.m_leftCurrentIndex, true);
end

CascadeMenu.onScrollCallbackRight = function(self, scroll_status, itemIndex, nViews, diff, totalOffset)
    if scroll_status ~= kScrollerStatusStop then
        return;
    end
    
    local viewItem = itemIndex + 2;
    if self.m_rightCurrentIndex == viewItem then
    	return;
    end

    self.m_rightCurrentIndex = viewItem;
    self:onItemClick(self.m_adapterRight, nil, self.m_rightCurrentIndex, false);
end

-- 关闭弹框回调
CascadeMenu.onCloseCallback = function(self)
	if self.m_onCloseCallbackObj and self.m_onCloseCallbackFunc then
		self.m_onCloseCallbackFunc(self.m_onCloseCallbackObj, true);
	end
end

-- 操作数据：头尾插入两个空table
CascadeMenu._operateData = function(self, data)
	local tmpData = {{},{}};
	
	for _, v in ipairs(data) do
		local item = self:_operateDataItem(v);
		table.insert(tmpData, item);
	end
	table.insert(tmpData, {});
	table.insert(tmpData, {});
	return tmpData;
end

CascadeMenu._operateDataItem = function(self, data)
	local tmpData = {
		id = data.id,
		name = data.name,
		children = data.children;
	};
	return tmpData;
end

-- ----------------------------------------------- SimpleListItemView ------------------------
--[Comment]
-- 列表项视图
SimpleListItemView = class(Node);

--[Comment]
-- 列表项视图构造函数
-- data:数据源
SimpleListItemView.ctor = function ( self, data )
	-- body
	self:setFillParent(true, false);
	self:setSize(410, 90);
	self.m_data = data;
	self:initViews();
end

--[Comment]
-- 初始化界面
SimpleListItemView.initViews = function ( self )
	-- body
	if not self.m_data.name then
		return;
	end

	self.m_text = new(Text, self.m_data.name, nil, nil, nil, nil, 38, 118, 72, 18);
	self.m_text:setAlign(kAlignCenter);
	self:addChild(self.m_text);
end

SimpleListItemView.dtor = function ( self )
	-- body
	delete(self.m_text);
	self.m_text = nil;
end