-- 口令对象基类

PasswordTypeObject = class();

PasswordTypeObject.ctor = function(self)   
end

PasswordTypeObject.dtor = function(self)
end

PasswordTypeObject.init = function(self, data)
	self.m_data = data;
end

------------------------口令数据逻辑------------------------------
-- virtual 
-- 生成口令邀请数据
PasswordTypeObject.generateData = function(self)
	return {};
end

-- virtual
-- 解析口令邀请数据
PasswordTypeObject.analyseData = function(self, data)
	return data;
end

------------------------口令弹框逻辑------------------------------
--virtual
PasswordTypeObject.showVersion = function(self, isSupported)
end

-- virtual
PasswordTypeObject.getTitle = function(self)
	return nil;
end

-- virtual
PasswordTypeObject.getBtnText = function(self)
	return nil;
end

-- virtual
PasswordTypeObject.getMessage = function(self)
	return nil;
end

-- virtual
PasswordTypeObject.getInfo = function(self)
	return nil;
end

-- virtual
PasswordTypeObject.getTips = function(self)
	return nil;
end

-- virtual
PasswordTypeObject.executeOnShow = function(self, obj, func, sourceType)
	-- donothing	
end

-- virtual
PasswordTypeObject.executeOnConfirm = function(self, obj, func, sourceType)
	-- donothing

	-- callback
	if obj and func then
		func(obj);
	end 
end

PasswordTypeObject.executeOnClose = function(self)
	-- donothing
end

------------------------邀请弹框逻辑------------------------------
-- virtual
PasswordTypeObject.shareByWechat = function(self, password, ...)
	-- donothing
	return nil;
end

-- virtual
PasswordTypeObject.shareByQQ = function(self, password, ...)
	-- donothing
	return nil;
end

-- virtual
PasswordTypeObject.shareByMessage = function(self, password, ...)
	-- donothing
	return nil;
end

-- virtual
PasswordTypeObject.shareByQr = function(self, password, ...)
	-- donothing
	return nil, nil;
end