require("ui/adapter");
local gameHelpTabListItem = require(ViewPath .. "hall/gamehelp/gameHelpTabListItem");

local GameHelpTabAdapter = class(Adapter);

-------------------- GameHelpTabListItem ---------------------------
local GameHelpTabListItem = class(Node);

GameHelpTabListItem.onItemClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	self.adapter:setSelect(self, true);
	self.adapter.itemClickFunc(self.adapter.scene,self.index);
end

GameHelpTabListItem.ctor = function(self, adapter, data, index)

	self.adapter = adapter;
	-- self.data = data;
	self.index = index;
	self.view = SceneLoader.load(gameHelpTabListItem);
	self:setSize(self.view:getSize());

	local tab_btn = self.view:getChildByName("left_tab_btn");

	local tab_text = tab_btn:getChildByName("left_tab_text");
	Log.d("GameHelpTabListItem ",data);
	tab_text:setText((data or ""));
	tab_btn:setOnClick(self, self.onItemClick);
	-- tab_btn:set  -- 此处设置button的背景
	self:addChild(self.view);
	self.adapter:setSelect(self, (index == self.adapter.m_checkItemIndex) and true or false);
end


GameHelpTabAdapter.ctor = function(self, data, selectIndex, scene, itemClickFunc)
	self.m_views = {};
	self.m_changedItems = {};
	self.m_data = data;
	if selectIndex then
		self.m_checkItemIndex = selectIndex;
	end
	self.scene = scene;
	self.itemClickFunc = itemClickFunc;
end

GameHelpTabAdapter.perloadAll = function(self)
	for i=1,self:getCount() do 
		self:getView(i);
	end
end

GameHelpTabAdapter.updateData = function(self, index, dataItem)
	if self.m_views[index] then
		self.m_changedItems[ self.m_views[index] ] = index;
	end
	
	Adapter.updateData(self,index,dataItem);
end

GameHelpTabAdapter.changeData = function(self, data)
	for k,v in pairs(table.verify(self.m_views)) do 
		self.m_changedItems[v] = k;
	end

	Adapter.changeData(self,data);
end

GameHelpTabAdapter.getView = function(self, index)
	local view = self.m_views[index];
	Log.d("here getView");
	if view and self.m_changedItems[view] then
		self.m_changedItems[view] = nil;
		delete(view);
		self.m_views[index] = nil
	end

    if self.m_views[index] then 
        self.m_views[index]:setVisible(true);
    else
    	Log.d("here getView index",self.m_data[index]);
		self.m_views[index] = new(GameHelpTabListItem, self, self.m_data[index], index);
	end
	return self.m_views[index];
end

GameHelpTabAdapter.releaseView = function(self, v)	
	local index = self.m_changedItems[v];
	if index then
		self.m_changedItems[v] = nil;
		delete(v);
		self.m_views[index] = nil;
	else
		v:setVisible(false);
	end
end

GameHelpTabAdapter.dtor = function(self)
    for _,v in pairs(table.verify(self.m_views)) do 
        delete(v);
    end

    self.m_views = nil;
    self.m_changedItems = nil;
end

GameHelpTabAdapter.setSelect = function(self, item, isChecked)
	if not item then
		return;
	end

	if isChecked then
		if self.m_checkItem then
			local tab_btn1 = self.m_checkItem.view:getChildByName("left_tab_btn");
			tab_btn1:getChildByName("selImg"):setVisible(false);
			tab_btn1:getChildByName("left_tab_text"):setColor(118,72,18);
			--tab_btn1:setFile("hall/common/btns/285x70_blue.png");
		end

		local tab_btn2 = item.view:getChildByName("left_tab_btn");
		tab_btn2:getChildByName("selImg"):setVisible(true);
		tab_btn2:getChildByName("left_tab_text"):setColor(255,235,186);
		--tab_btn2:setFile("hall/common/btns/285x70_green.png");
		self.m_checkItem = item;
	else
		local tab_btn3 = item.view:getChildByName("left_tab_btn");
		tab_btn3:getChildByName("selImg"):setVisible(false);
		tab_btn3:getChildByName("left_tab_text"):setColor(118,72,18);
		--tab_btn3:setFile("hall/common/btns/285x70_blue.png");
	end
end

return GameHelpTabAdapter;

