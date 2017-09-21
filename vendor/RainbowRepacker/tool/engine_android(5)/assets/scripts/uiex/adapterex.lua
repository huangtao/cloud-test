require("ui/adapter");

Adapter.getTmpView = function(self, index)
    return nil;
end

CacheAdapter.getTmpView = function(self,index)
    local view = self.m_views[index];

	if view and self.m_changedItems[view] then
		self.m_changedItems[view] = nil;
		delete(view);
		self.m_views[index] = nil
	end

    if not self.m_views[index] then 
		self.m_views[index] =  Adapter.getView(self,index);
		self.m_views[index]:setVisible(false);
	end

	return self.m_views[index];
end

Adapter.updateAll = function(self, data)
	-- body
	if data then
		self.m_data = data;
	end
	if not self.m_data then
		return;
	end
	for k,v in pairs(self.m_data) do
		self:updateData(k,v);
	end
end

Adapter.setData = function(self, data)
	-- body
	self.m_data = data;
end


Adapter.getIndex = function(self, index)
	-- body
	return self.m_data[index], self.m_views[index];
end