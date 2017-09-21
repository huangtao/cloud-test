-- Author:Demon
-- Date:2016/1/11
-- Last modification:
-- Description:
-- Note:若需使用该类管理类接口，创建类时应 require("hall/report/hallLayerBase"); class(HallLayerBase,false)
--      HallLayerBase继承了CommonGameLayer

local __LAYER_CONFIG  = require("hall/widget/layerPathConfig"); 

LayerManagerIsolater = class();
LayerManagerIsolater.s_instance = nil;  

LayerManagerIsolater.getInstance = function()
	
	if not LayerManagerIsolater.s_instance then
		LayerManagerIsolater.s_instance = new(LayerManagerIsolater);
	end
	
	return LayerManagerIsolater.s_instance;
end	


function LayerManagerIsolater:ctor()
	self.layerPool = {};
end

LayerManagerIsolater.show = function(self,layerName,...)
	return self:__createInstance(layerName,...);
end

LayerManagerIsolater.hide = function(self,layerName,isAll)
	
	local isRemoveSucces = false;
	
	if isAll then
		while true do
			local wnd = self:__getWndFromPoolByName(layerName);
			if wnd then
				wnd:_close();
				isRemoveSucces = true;
			else
				return isRemoveSucces;
			end
		end
	else
		local wnd = self:__getWndFromPoolByName(layerName);
		if wnd then
			wnd:_close();
			isRemoveSucces = true;
			return isRemoveSucces;
		end
	end	
	
end

LayerManagerIsolater.hideAll = function(self)
	local tmpLayerPool = self.layerPool;
	self.layerPool = {};
	for k, v in pairs(table.verify(tmpLayerPool)) do
		for kk, vv in pairs(v) do
			vv:_close();
		end
	end
end

LayerManagerIsolater.hideByObj = function(self,obj)
	for k,v in pairs(table.verify(self.layerPool)) do
		for kk,vv in pairs(v) do
			if obj == vv then
				obj:_close();
				return true;
			end
		end
	end
	return false;
end

LayerManagerIsolater.isExist = function(self,layerName)
	if type(self.layerPool[layerName]) == type(table) and not(table.isEmpty(self.layerPool[layerName]))then
		local __n = #self.layerPool[layerName];
		return true,self.layerPool[layerName][__n];
	end
	return false;
end

LayerManagerIsolater.dtor = function(self)
	
end

LayerManagerIsolater.__createInstance = function(self,layerName,...)
	local arg = {...};
	if type(layerName) ~= "string" then
		Log.d("ReportFactory","参数错误");
	end

	local _wnd = nil;

	do
		local filePath = __LAYER_CONFIG[layerName];
		if type(filePath) == "string" then
			local __class = require(filePath);
			_wnd = new(__class,...);
		end
	end

	if not _wnd then
		Log.d("ReportFactory","没有对应的模块");
	end

	return _wnd;
end

LayerManagerIsolater.__addToPool= function(self,obj,layerName)
	self.layerPool[layerName] = self.layerPool[layerName] or {};
	if type(self.layerPool[layerName]) == type(table) then
		table.insert(self.layerPool[layerName],obj);
	end
end

LayerManagerIsolater.__getWndFromPoolByName= function(self,layerName)
	if type(self.layerPool[layerName]) == type(table) and not(table.isEmpty(self.layerPool[layerName]))then
        local maxn = table.maxn(self.layerPool[layerName]);
		return self.layerPool[layerName][maxn];	
	end
	return false;
end


LayerManagerIsolater.__removeFromPoolByName= function(self,layerName)
	if type(self.layerPool[layerName]) == type(table) and not(table.isEmpty(self.layerPool[layerName]))then
		return table.remove(self.layerPool[layerName]);
	end
	return false;
end

LayerManagerIsolater.__removeFromPoolByObject= function(self,p_obj)
	for k,v in pairs(table.verify(self.layerPool)) do
		for kk,vv in pairs(v) do
			if obj == vv then
				if #v == 1 then
					self.layerPool[k] = nil;
				else
					self.layerPool[k][kk] = nil;
				end
				return true;
			end
		end
	end
	return false;
end