require("gameBase/socketReader");
require("util/log");
require("php/phpCmd");

CommonSocketReader = class(SocketReader);

CommonSocketReader.ctor = function(self)
	self.m_logFileName = "CommonSocketReader";
end

--@brief parse packet 加入对父类配置指令的处理
CommonSocketReader.readPacket = function(self, socket, packetId, cmd)
	self.m_socket = socket;

	local packetInfo = nil;
	local isValidPacket = true;

	if cmd == RESPONSE_PHP_REQUEST then
		packetInfo = CommonSocketReader.onResponsePhpRequest(self, packetId);
	elseif cmd == RESPONSE_PHP_REQUEST_NEW then 
		packetInfo = CommonSocketReader.onResponsePhpRequestNew(self, packetId);
	else
	    local func = nil;
	    local curObj = self;
	    while curObj and curObj.s_severCmdFunMap do
	        func = curObj.s_severCmdFunMap[cmd];
	        if func then
	            break;
	        else
	            curObj = curObj.super;
	        end
	    end

		if type(func) == "function" then
	    	packetInfo = func(self, packetId);
	    elseif type(func) == "string" then
	        local funcSelf = nil;
	        local curObj = self;
	        while curObj do
	            funcSelf = curObj[func];
	            if funcSelf then
	                break;
	            else
	                curObj = curObj.super;
	            end
	        end
	        if funcSelf then
	            packetInfo = funcSelf(self, packetId, cmd);
	        else
	        	isValidPacket = false
	        end
	    else
	    	isValidPacket = false;
	    end
	end

	return packetInfo, isValidPacket;
end


--@brief 读取PHP数据包 处理0x0024指令
CommonSocketReader.onResponsePhpRequest = function(self, pid)
	local info = {};

	info.flag = self.m_socket:readInt(pid,0);
	info.subCmd = self.m_socket:readInt(pid,0);
	local jsonStr = self.m_socket:readString(pid);
	info.jsonStr = json.decode(jsonStr);

	return info;
end

--@brief 读取PHP数据包
CommonSocketReader.onResponsePhpRequestNew = function(self, pid)
	local info = {};

	info.mid = self.m_socket:readInt(pid,0);
	info.subCmd = self.m_socket:readInt(pid,0);
	info.compressType = self.m_socket:readInt(pid,0);
	info.compressInfo = self.m_socket:readString(pid);

	return info;
end

CommonSocketReader.log = function(self,funcName,...)
	local logFileName = self:getLogFileName();
	if logFileName then 
		Log.addModuleCache(logFileName,funcName,"data =",...);
	end
end

CommonSocketReader.getLogFileName = function(self)
	
end