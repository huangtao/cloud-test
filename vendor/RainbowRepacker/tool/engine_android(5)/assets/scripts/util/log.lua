require("globalConfig");
require("coreex/systemex");
require("util/TableLib");
require("util/StringLib");
require("util/NumberLib");
require("libs/json_wrap");
require("globalConstant");

Log = class();

Log.s_tab = "";
Log.s_writeFileName = "LOG_ALLFILE";
Log.s_errorFileName = "LOG_LUA_ERROR";

Log.s = function(tag,...)
	Log.base(0x0000FF,"SOCKET--",tag,...);--蓝色
end

Log.v = function(tag,...)
	Log.base(0x00FF00,"VERBORSE--",tag,...); --绿色
end 

Log.i = function(tag,...)
	Log.base(0x00FFFF,"INFO--",tag,...); --绿青
end

Log.e = function(tag,...)
	Log.base(0xFF0000,"ERROR--",tag,...); --红色
	Log.crash(tag,...); 
end

Log.w = function(tag,...)
	Log.base(0xFF00FF,"WARN--",tag,...); --粉色
end

Log.d = function(tag,...)
	Log.base(0xFFFF00,"DEBUG--",tag,...); --黄色
end

Log.a = function(tag,...)
	Log.base(0xFFFFFF,"ASSERT--",tag,...); --白色
end

Log.sWF = function(tag,...)
	Log.s(tag,...);
end

Log.vWF = function(tag,...)
	Log.v(tag,...);
end

Log.dWF = function(tag,...)
	Log.d(tag,...);
end

Log.iWF = function(tag,...)
	Log.i(tag,...);
end

Log.eWF = function(tag,...)
	Log.v(tag,...);
end

Log.wWF = function(tag,...)
	Log.w(tag,...);
end

Log.aWF = function(tag,...)
	Log.a(tag,...);
end

--------------------------------------
Log.recordMechine = function(tag, ...)
	Log.d(tag,...);
	Log.__asyncWriteFile(tag,...);
end

Log.record = function(tag, ...)
	Log.v(tag, ...);	
end

Log.addModuleCache = function(moduleName,...)
	Log.v(tag, ...);
end

Log.uploadModuleCache = function(tag)
	--do nothing only for compatible
end

Log.writeLuaCrashError = function(crashInfo)
	local fileName = Log._getLogFileFullPath(Log.s_errorFileName);
	local f = io.open(fileName, "a+");
	if f then
		f:write("\n\n\n");
		f:write(os.date("%Y-%m-%d %H:%M:%S\n")..crashInfo);
		f:close();
	end
end

--------------------------------------------------------------------
Log.crash = function(tag,...)
	if not _DEBUG then 
		return;
	end
	
	local strInfo = Log.__getStrInfo("ERROR--",tag,...);
	error("--业务逻辑错误 请及时周知开发--" .. strInfo);
end

Log.base = function(color,tagPrefix,tag,...)
	if not _DEBUG then 
		return;
	end
	
	local strInfo = Log.__getStrInfo(tagPrefix,tag,...);
	System.setWin32ConsoleColor(color);
	print_string(strInfo);
	Log.__asyncWriteFile(Log.s_writeFileName, tag, ...);
end

--@brief 转换成字符串
Log.__getStrInfo = function(tagPrefix,tag,...)
	local strInfo = Log.__getData(tagPrefix,tag,...);
	return strInfo;
end

Log.onEventClose = function()
	if Log.log_chan then
		print_string("Log.onEventClose");
		Log.log_chan:close();
		Log.log_chan = nil;
	end
end

--@brief 写文件
Log.__asyncWriteFile = function(tag,...)
	if not _DEBUG then 
		return;
	end

	local datePreFix = os.date("%Y-%m-%d %H:%M:%S") or "";
	local strInfo = string.format("%s%s%s%s",datePreFix , " : ", Log.__getData("",tag, ...) , "\n");

	if not Log.log_chan then
		local pool = ThreadPool.instance();
	    Log.log_chan = Chan.create();
	    Log.log_chan:put(strInfo, false);

	    local param = {
	    	chanId = Log.log_chan.id;
	    	logFilePath = Log._getLogFileFullPath(tag);
		}
		local strParam = json.encode(param);
	    pool:lua_task(
	        function(strParam)
	        	local param = cjson.decode(strParam);
	            local log_chan = Chan.get_by_id(param.chanId);
	            local file = io.open(param.logFilePath, "w+");
	        	while true do
	            	local strInfo = log_chan:take(true); --阻塞
	            	if strInfo and file then
			            file:write(strInfo);
			        else
			        	break;
			        end
		        end

		        if file then 
		        	file:close();
		        end
	        end, 
	        function()
	        end,
	       	strParam);
	else
		if strInfo then
			Log.log_chan:put(strInfo, false);
		end
	end
end

--@brief 获取log文件路径
Log._getLogFileFullPath = function(fileName)
	if string.isEmpty(Log.logPath) then
		Log.logPath = System.getStorageLogPath();
		if NativeEvent.s_platform == kPlatformIOS then
			Log.logPath = NativeEvent.getInstance():getWriteLogPath();
		end
	end

	local dateFileName = fileName or os.date("%Y_%m_%d") or "";
	local fileFullPath = string.format("%s%s%s%s", Log.logPath, "/log_" , dateFileName , ".log");
	return fileFullPath;
end

--@brief 转换为字符串
Log.__getData = function(tagPrefix,tag,...)
	tag = tag or "";
	tagPrefix = tagPrefix or "INFO--";
	
	local strArr = {};
	table.insert(strArr, "");
	for _,v in pairs({...}) do
		local tempType = type(v); 
		if typeof(v,DrawingBase) then
			table.insert(strArr, "THIS IS AN DRAWING OBJECT");
		elseif tempType == "table" then
			table.insert(strArr, Log.__loadTable(v, 1) );
		else
			table.insert(strArr, tostring(v) );
		end
		table.insert(strArr, " ");
	end
	
	return string.format("%s%s: %s", tagPrefix, tag, table.concat(strArr));
end

local s_max_nest = 10;
--@brief 加载table
Log.__loadTable = function(t, nest)
	if type(t) ~= "table" then 
		return t;
	end 

	if t.ispb__ then
		return "isPB";
	end

	if nest > s_max_nest then
		return "MAX NESTING";
	end

	local tab = Log.s_tab;
	Log.s_tab = Log.s_tab.."    ";
	local strArr = {};
	table.insert(strArr, "");
	for k,v in pairs(t) do 
		if v ~= nil then 
			local key = Log.s_tab;
			if type(k) == "string" then
				key =  string.format("%s[\"%s\"] = ", key, tostring(k) );
			else 
				key =  string.format("%s[%s] = ", key, tostring(k) );
			end 
			
			table.insert(strArr, key);
			if type(v) == "table" then 
				table.insert(strArr, Log.__loadTable(v, nest+1) );
			elseif type(v) == "string" then 
				table.insert(strArr, string.format("\"%s\";\n",tostring(v)));
			else 
				table.insert(strArr, string.format("%s;\n",tostring(v)));
			end 
		end 
	end 
	Log.s_tab = tab;
	local str = string.format("\n%s{\n%s%s};\n", Log.s_tab, table.concat(strArr), Log.s_tab);
	
	return str;
end