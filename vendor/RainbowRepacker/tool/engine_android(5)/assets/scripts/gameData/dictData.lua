require("core/dict");
require("core/object");
require("common/socketHandlerBase");

--磁盘数据Util

DictData = class(SocketHandlerBase);

DictData.ctor = function(self)
	self:ctorOperation();
end

DictData.dtor = function(self)
	self:dtorOperation();
end

DictData.ctorOperation = function(self)
	self:loadData();
end

DictData.dtorOperation = function(self)
	self:saveData();
end

--virtual
DictData.loadDictData = function(self, dict)
	--body
end

--virtual
DictData.saveDictData = function(self, dict)
	--body 
end

DictData.getLocalDictName = function(self)
	return nil;
end

DictData.loadData = function(self)
	local dictName = self:getLocalDictName();
	if not dictName then
		return;
	end

	local dict = new(Dict,dictName);
	dict:load();
	self:loadDictData(dict);
	delete(dict);
end

DictData.saveData = function(self)
	local dictName = self:getLocalDictName();
	if not dictName then
		return;
	end

	local dict = new(Dict,dictName);
	dict:delete();
	self:saveDictData(dict);
	dict:save();
	delete(dict);
end