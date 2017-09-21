-- 私人房约牌记录
local PrivateRoomRecordLayer = class(CommonGameLayer, false);

PrivateRoomRecordLayer.Delegate = {
	onRecordLayerClose = "onRecordLayerClose";
};

PrivateRoomRecordLayer.s_controls = 
{
	returnBtn = ToolKit.getIndex(),
	contentView = ToolKit.getIndex(),
	emptyView = ToolKit.getIndex(),
	listView = ToolKit.getIndex(),
	titleView = ToolKit.getIndex(),
};

PrivateRoomRecordLayer.s_cmds = 
{
};

PrivateRoomRecordLayer.ctor = function(self)
	local privateRoomRecordLayout = require(ViewPath.."hall/privateRoom/privateRoomRecordLayout");
	super(self, privateRoomRecordLayout);
	self:setFillParent(true, true);
	self:setEventTouch(self, function() end);
    self:setEventDrag(self, function() end);

	PrivateRoomDataInterface.getInstance():setObserver(self);

	self:_resetView();
	self:_initView();
end

PrivateRoomRecordLayer.dtor = function(self)
	PrivateRoomDataInterface.getInstance():clearObserver(self);
end

PrivateRoomRecordLayer.hasOpenLayer = function(self)
	local hasOpenLayer = false;

    if (self.m_recordDetail and self.m_recordDetail:getVisible()) then
    	self:onRecordSummaryLayerClose();
        hasOpenLayer = true;
    end

    return hasOpenLayer;
end

PrivateRoomRecordLayer.onReturnBtnClick = function(self)
	self:execDelegate(PrivateRoomRecordLayer.Delegate.onRecordLayerClose, true);
end

PrivateRoomRecordLayer.onGetPrivateRoomRecordListCallback = function(self, isSuccess, data)
	if isSuccess then
		self:_initListView(data);
	else

	end
end

PrivateRoomRecordLayer.onListItemClick = function(self, data)
	PrivateRoomDataInterface.getInstance():getPrivateRoomRecordDetail(data.tableKey);
end

PrivateRoomRecordLayer.onGetPrivateRoomRecordDetailCallback = function(self, isSuccess, data)
	if isSuccess then
		self:_initDetailView(data);
	else

	end
end
-----------------------------------------------------------
PrivateRoomRecordLayer._resetView = function(self)
	self:findViewById(self.s_controls.contentView):setVisible(false);
	self:findViewById(self.s_controls.emptyView):setVisible(false);
end

PrivateRoomRecordLayer._initView = function(self)
	local titleView = self:findViewById(self.s_controls.titleView);
	local fillRegion, topLeftX, topLeftY, bottomRightX, bottomRightY = titleView:getFillRegion();
	local viewWdith = System.getScreenScaleWidth() - topLeftX - bottomRightX;

	self.m_viewWidthConfig = {
		0.20 * viewWdith,
		0.10 * viewWdith,
		0.10 * viewWdith,
		0.20 * viewWdith,
		0.20 * viewWdith,
		0.20 * viewWdith
	};

	self:_initTitleView();

	PrivateRoomDataInterface.getInstance():getPrivateRoomRecordList(); -- 获取缓存数据
	PrivateRoomDataInterface.getInstance():requirePrivateRoomRecordList(); -- 拉取新数据
end

PrivateRoomRecordLayer._initTitleView = function(self)
	local titleView = self:findViewById(self.s_controls.titleView);
	local textConfig = {"结束时间", "游戏", "局数", "其他玩家", "我的战绩", ""};
	local pos = 0;
	titleView:removeAllChildren(true);
	for k, v in ipairs(self.m_viewWidthConfig) do
		if not string.isEmpty(textConfig[k]) then
			local text = UIFactory.createText(textConfig[k], 30, v, 30, kAlignCenter, 142, 92, 31)
			text:setAlign(kAlignLeft);
			text:setPos(pos);
			titleView:addChild(text);
		end
		pos = pos + v;
	end
end

PrivateRoomRecordLayer._initListView = function(self, data)
	local emptyView = self:findViewById(self.s_controls.emptyView);
	local contentView = self:findViewById(self.s_controls.contentView)
	emptyView:setVisible(false);
	contentView:setVisible(false);

	if table.isEmpty(data) then 
		emptyView:setVisible(true);
	else
		local listView = self:findViewById(self.s_controls.listView);
		if not self.m_adapter then
			local listItem = require("hall/privateRoom/widget/privateRoomRecordItem");
			listItem.setCallback(self, self.onListItemClick);
			listItem.setConfig(self.m_viewWidthConfig);
			self.m_adapter = UIFactory.createCacheAdapter(listItem, data);
			listView:setAdapter(self.m_adapter);
		else
			self.m_adapter:changeData(data);
		end

		contentView:setVisible(true);
	end
end

PrivateRoomRecordLayer._initDetailView = function(self, data)
	if not table.isEmpty(data) then 
		if not self.m_recordDetail then

			self.m_recordDetail = PrivateRoomDataInterface.getInstance():createRecordSummaryLayer(data);
			self.m_recordDetail:setDelegate(self);
			self:addChild(self.m_recordDetail);
		end
	end
end

PrivateRoomRecordLayer.onRecordSummaryLayerClose = function(self)
	if self.m_recordDetail then
		self.m_recordDetail:hide();
		delete(self.m_recordDetail);
		self.m_recordDetail = nil;
	end
end


PrivateRoomRecordLayer.s_controlConfig = {
	[PrivateRoomRecordLayer.s_controls.returnBtn] = {"topView", "returnBtn"};
	[PrivateRoomRecordLayer.s_controls.contentView] = {"contentView"};
	[PrivateRoomRecordLayer.s_controls.emptyView] = {"emptyView"};
	[PrivateRoomRecordLayer.s_controls.listView] = {"contentView", "listView"};
	[PrivateRoomRecordLayer.s_controls.titleView] = {"contentView", "titleView", "titleTextView"};
};

PrivateRoomRecordLayer.s_controlFuncMap = {
	[PrivateRoomRecordLayer.s_controls.returnBtn] = PrivateRoomRecordLayer.onReturnBtnClick;
};

PrivateRoomRecordLayer.s_cmdConfig = {
	
};

return PrivateRoomRecordLayer;