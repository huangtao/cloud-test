require("core/object");

DataInterfacePool = class();

DataInterfacePool.getInstance = function()
	if not DataInterfacePool.s_instance then
		DataInterfacePool.s_instance = new(DataInterfacePool);
	end

	return DataInterfacePool.s_instance;
end

DataInterfacePool.ctor = function(self)
	self.m_interfaceMap = {};
end

DataInterfacePool.addDataInterface = function(self, dataInterface)
	if not dataInterface then
		return;
	end

	if self:__getDataInterfaceIndex(dataInterface) == -1 then
		table.insert(self.m_interfaceMap, dataInterface);
	end
end

DataInterfacePool.removeDataInterface = function(self, dataInterface)
	if not dataInterface then
		return;
	end

	local index = self:__getDataInterfaceIndex(dataInterface);
	if index ~= -1 then
		table.remove(self.m_interfaceMap, index);
	end
end

DataInterfacePool.clearObserver = function(self, observerObj)
	if not observerObj then
		return;
	end

	for _, v in pairs(self.m_interfaceMap) do
		v:clearObserver(observerObj);
	end
end

DataInterfacePool.__getDataInterfaceIndex = function(self, dataInterface)
	for k, v in pairs(self.m_interfaceMap) do
		if v == dataInterface then
			return k;
		end
	end

	return -1;
end



require("gameData/dictData");

DataInterfaceBase = class(DictData);

DataInterfaceBase.Delegate = {
};

DataInterfaceBase.cleanup = function()
	--subclass override me if need
end

DataInterfaceBase.ctor = function(self)
	self.m_observerMap = {};
end

DataInterfaceBase.ctorOperation = function(self)
	DataInterfacePool.getInstance():addDataInterface(self);
	self:initData();
	self:loadData();
end

DataInterfaceBase.dtor = function(self)
	DataInterfacePool.getInstance():removeDataInterface(self);
end

DataInterfaceBase.initData = function(self)

end

--@brief 设置监听器，level 为0
DataInterfaceBase.setObserver = function(self, observerObj)
	if not observerObj then 
		return;
	end

	if self:__getObserverIndex(observerObj) == -1 then
		local item = {
			obj = observerObj;
			level = 0;
		}

		table.insert(self.m_observerMap, item);
	end
end

--@brief 设置优先级监听器
--@param priorityLevel:优先级,默认为1
DataInterfaceBase.setObserverPriority = function(self, observerObj, priorityLevel)
	if not observerObj then
		return;
	end

	if self:__getObserverIndex(observerObj) == -1 then
		local item = {
			obj = observerObj;
			level = number.valueOf(priorityLevel, 1);
		}

		table.insert(self.m_observerMap, item);
	end
end

--#issue FIXME later, this should have a base class that auto call clearObserver to avoid forget call it
DataInterfaceBase.clearObserver = function(self, observerObj)
	if not observerObj then
		return;
	end
	
	local index = self:__getObserverIndex(observerObj);
	if index ~= -1 then
		table.remove(self.m_observerMap, index);
	end
end

DataInterfaceBase.__getObserverIndex = function(self, observerObj)
	for k, v in pairs(self.m_observerMap) do
		if v.obj == observerObj then
			return k;
		end
	end

	return -1;
end

--@brief 通知观察者们
--@note 如果监听器设置的level大于0，并且返回值为true，则会停止分发事件
DataInterfaceBase.notify = function(self, func, ...)
	local observers = self:__sortObserversByLevel(self.m_observerMap);
 	for _, observer in pairs(observers) do
 		local obj = observer.obj;
 		if obj and obj[func] and self:__isExist(obj) then
 			local isBreak = obj[func](obj, ...);
 			if isBreak and number.valueOf(observer.level) > 0 then
 				Log.v("DataInterfaceBase.notify excuse break ~~");
 				break;
 			end
 		end
 	end
end

DataInterfaceBase.__isExist = function(self, obj)
	for k, v in pairs(self.m_observerMap) do
		if v.obj == obj then
			return true;
		end
	end

	return false;
end

DataInterfaceBase.__sortObserversByLevel = function(self, observerMap)
	observerMap = table.verify(observerMap);
	table.sort(observerMap, function(a, b)
		if a and b then
			return a.level > b.level;
		end
	end);

	local ret = {};
	for k, v in ipairs(observerMap) do
		table.insert(ret, v);
	end

	return ret;
end

DataInterfaceBase.getObserverMap = function(self)
	return self.m_observerMap;
end

DataInterfaceBase.setObserverMap = function(self, newObserverMap)
	self.m_observerMap = table.verify(newObserverMap);
end
