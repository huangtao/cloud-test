FileUtil = class();

FileUtil.s_tab = "";

FileUtil.read = function(filePath)
	if not filePath then 
		return;
	end

	local file = io.open(filePath, "r");
	if file then
		io.close(file);
		local isSuccess,content = pcall(dofile,filePath);
		if isSuccess then 
			return content;
		end 
	end
end

FileUtil.write = function(filePath,content)
	if not filePath then 
		return;
	end 

	local file = io.open(filePath,"w");
	if not file then 
		return;
	end 

	file:write("return ");
	FileUtil._writeValue(file, content);
	io.close(file);
end

FileUtil.isFileExist = function(filePath)
	if not filePath then 
		return false;
	end 

	local file = io.open(filePath, "r");
	if file then 
		io.close(file);
		return true;
	end
	return false;
end

FileUtil.isImageExist = function(fileName)
	if not fileName then 
		return;
	end 

	local m_resID = res_alloc_id();
    local result = res_create_image(0, m_resID, fileName, kRGBA8888, kFilterNearest);
    res_delete(m_resID);

    return result ~= -1
end

FileUtil.getFileName = function(path)
	if string.isEmpty(path) then
		return "";
	end

	path = string.gsub(path, "\\", "/");
	if path[#path] == '/' then
		path = string.sub(path, 0, #path - 1);
	end
	local ret = ToolKit.split(path, "/");
	return ret[#ret];
end

-------------------------------------------------
FileUtil._writeTable = function(file,src)
	if type(src) ~= "table" then 
		return;
	end 

	local tab = FileUtil.s_tab;
	FileUtil.s_tab = FileUtil.s_tab .. "	";

	file:write("{\n");
	for k,v in pairs(src) do 
		if type(k) == "string" or type(k) == "number" then
			file:write(FileUtil.s_tab);
			FileUtil._writeKey(file,k);
			FileUtil._writeValue(file,v);			
		end 
	end 
	file:write(tab.."}");
	FileUtil.s_tab = tab;
end

FileUtil._writeString = function(file,value)
	file:write("\"");
	file:write(value);
	file:write("\"");
end 

FileUtil._writeBoolean = function(file,value)
	file:write(tostring(value));
end

FileUtil._writeNumber = function(file,value)
	file:write(value);
end

FileUtil._writeKey = function(file,key)
	file:write("[");
	if type(key) == "string" then 
		FileUtil._writeString(file,key);
	else 
		FileUtil._writeNumber(file,key);
	end
	file:write("] = ");
end 

FileUtil._writeValue = function(file,v)
	if type(v) == "table" then 
		FileUtil._writeTable(file,v);
	elseif type(v) == "string" then
		FileUtil._writeString(file,v);
	elseif type(v) == "boolean" then
		FileUtil._writeBoolean(file,v);	
	elseif type(v) == "number" then	
		FileUtil._writeNumber(file,v);
	else 
		FileUtil._writeString(file,tostring(v));
	end
	file:write(";\n");
end