require("ui/adapter");
local historySuggestionListItem = require(ViewPath .. "hall/suggestion/historySuggestionListItem");

SuggestionListAdapter = class(Adapter);

SuggestionListAdapter.ctor = function(self, data, scene)
	self.m_views = {};
	self.m_changedItems = {};
	self.m_data = data or {};
	self.m_headImageKey = {};
	self.m_scene = scene;
end

SuggestionListAdapter.perloadAll = function(self)
	for i=1,self:getCount() do 
		self:getView(i);
	end
end

SuggestionListAdapter.updateData = function(self, index, dataItem)
	if self.m_views[index] then
		self.m_changedItems[ self.m_views[index] ] = index;
		self.m_views[index]:updateItem(dataItem,index);
	end
	
	Adapter.updateData(self,index,dataItem);
end

SuggestionListAdapter.getView = function(self, index)
	local view = self.m_views[index];

	if view and self.m_changedItems[view] then
		self.m_changedItems[view] = nil;
		delete(view);
		self.m_views[index] = nil;
	end

    if self.m_views[index] then 
        self.m_views[index]:setVisible(true);
    else
		self.m_views[index] = new(SuggestionListItem, self, self.m_data[index], index);
	end

	return self.m_views[index];
end

SuggestionListAdapter.releaseView = function(self, v)	
	local index = self.m_changedItems[v];
	if index then
		self.m_changedItems[v] = nil;
		delete(v);
		self.m_views[index] = nil;
	else
		v:setVisible(false);
	end
end

SuggestionListAdapter.dtor = function(self)
    for _,v in pairs(table.verify(self.m_views)) do 
        delete(v);
    end

    self.m_views = nil;
    self.m_changedItems = nil;
	self.m_headImageKey = nil;
end

-------------------- ranklistitem ---------------------------
SuggestionListItem = class(Node);

SuggestionListItem.onMyBtnClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	self.m_adapter.itemClickFunc(self.m_adapter.m_scene);
end

SuggestionListItem.ctor = function(self, adapter, dataItem, index)
	if not dataItem then
		return;
	end
	self.m_adapter = adapter;
	
	self:initItemView();
	self:updateItem(dataItem,index);
end

SuggestionListItem.initItemView = function ( self )
	self:setFillParent(true,false);

	local view = SceneLoader.load(historySuggestionListItem);
	self.childFrameView = view:getChildByName("childFrameView");
	self.question = self.childFrameView:getChildByName("question");
	self.answer = self.childFrameView:getChildByName("answer");
	self.time = self.childFrameView:getChildByName("time");

	self:addChild(view);
	self:setSize(view:getSize());
end

SuggestionListItem.updateItem = function ( self, dataItem, index )
	--XXX 不符合格式时 是否需要直接返回？根据模块需求，自行修改是否放行，确认后请把此注释删除。
	if not table.isTable(dataItem) then return; end
	local statusText = "";
	local replayText = "";
	if not self.childFrameView then
		self:initItemView();
	end
	if not dataItem.reply or dataItem.reply=="" then
		replayText = "收到，我们将尽快为您处理。";
	else 
		replayText = "" .. (dataItem.reply or "");
	end	

	self.question:setText(string.format("%s", dataItem.question or "--" ));
	self.answer:setText(replayText);
	self.time:setText(formatTime(dataItem.time));
end

function formatTime(time)
	local days = "";
    if tonumber(time) then
        local timeNum = time;
        timeNum = math.abs(timeNum);
        local formatStr = "%Y" .. "-" .. "%m" .. "-" .. "%d" .. "  " .. "%H" .. ":".. "%M" .. ":" .. "%S";
        days = os.date(formatStr,timeNum);
    end
    return days;
end 