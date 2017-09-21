LayerShowTypeData = class();

LayerShowTypeData.getInstance = function()
	if not LayerShowTypeData.s_instance then
		LayerShowTypeData.s_instance = new(LayerShowTypeData);
	end
	return LayerShowTypeData.s_instance;
end

LayerShowTypeData.releaseInstance = function()
	delete(LayerShowTypeData.s_instance);
	LayerShowTypeData.s_instance = nil;
end

LayerShowTypeData.ctor = function(self)
	self:initData();
end

LayerShowTypeData.dtor = function(self)
	self.m_curShowType = nil;
end

LayerShowTypeData.setCurShowType = function(self,showType)
	self.m_curShowType = showType;
end

LayerShowTypeData.getCurShowType = function(self)
	return self.m_curShowType or self:getNormalType();
end

LayerShowTypeData.getNormalType = function(self)
	return self.m_showTypeConfig.normal;
end

LayerShowTypeData.getOnlookerType = function(self)
	return self.m_showTypeConfig.onlooker;
end

LayerShowTypeData.initData = function(self)
	local data = {};
	data.normal = "normal";
	data.onlooker = "onlooker";
	self.m_showTypeConfig = data;
end