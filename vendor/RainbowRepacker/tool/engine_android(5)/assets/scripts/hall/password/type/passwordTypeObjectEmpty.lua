require("hall/password/type/passwordTypeObject");
-------------------------------------------------------------

local PasswordTypeObjectEmpty = class(PasswordTypeObject);

-- virtual
PasswordTypeObject.getTitle = function(self)
	return "无效口令";
end

-- virtual
PasswordTypeObjectEmpty.getBtnText = function(self)
	return "确  定";
end

return PasswordTypeObjectEmpty;
