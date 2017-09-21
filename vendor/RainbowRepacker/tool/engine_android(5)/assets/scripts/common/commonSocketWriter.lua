require("gameBase/socketWriter");
require("util/log");
require("php/phpCmd");

CommonSocketWriter = class(SocketWriter);

CommonSocketWriter.ctor = function(self)
	self.m_logFileName = "CommonSocketWriter";
end

--@override
--@brief 加入对父类配置的指令处理
CommonSocketWriter.writePacket = function(self, socket, packetId, cmd, info)
	self.m_socket = socket;

	if cmd == SEND_PHP_REQUEST then
		CommonSocketWriter.onSendPhpRequest(self, packetId, info);
		return true;
	elseif cmd == SEND_PHP_REQUEST_NEW then  
		CommonSocketWriter.onSendPhpRequestNew(self, packetId, info);
		return true;
	else
	    local func = nil;
	    local curObj = self;
	    while curObj and curObj.s_clientCmdFunMap do
	        func = curObj.s_clientCmdFunMap[cmd];
	        if func then
	            break;
	        else
	            curObj = curObj.super;
	        end
	    end

		if type(func) == "function" then
	    	func(self, packetId, info);
	    	return true;
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
	            funcSelf(self, packetId, info, cmd);
		        return true;
	        end
	    end
		Log.w("Not such writer cmd = ", number.formatToHex(cmd), " in current socketWriter");	
	end
	return false;
end

--@brief 写PHP数据包 处理0x0023指令
CommonSocketWriter.onSendPhpRequest = function(self, packetId, info)
	local jsonstr = json.encode(info);
	local infoCmd = table.verify(info).cmd or 0;
	Log.d("CommonSocketWriter packetId ==",packetId);
	Log.d("CommonSocketWriter ","info.cmd == " , number.formatToHex(cmd));
	Log.d("CommonSocketWriter jsonstr == ",jsonstr);
	self.m_socket:writeString(packetId,jsonstr);	
end

--@brief 写PHP数据包 先进行zip压缩，在Base64后进行传送
CommonSocketWriter.onSendPhpRequestNew = function(self, packetId, info)
	local isNeedCompress = NativeEvent.s_platform == kPlatformAndroid or NativeEvent.s_platform == kPlatformIOS;
	local jsonstr = json.encode(info);
	if isNeedCompress then 
		local isSuccess,resultStr = PhpManager.getInstance():compressPhpInfo(jsonstr);
		if isSuccess then 
			jsonstr = resultStr;
		else
			isNeedCompress = false;
		end
	end 

	local compressType = isNeedCompress and 1 or 0;
	
	self.m_socket:writeInt(packetId,info.mid);
	self.m_socket:writeInt(packetId,info.cmd);
	self.m_socket:writeInt(packetId,compressType);--1压缩	
	self.m_socket:writeString(packetId,jsonstr);
end

CommonSocketWriter.log = function(self,funcName,...)
	local logFileName = self:getLogFileName();
	if logFileName then 
		Log.addModuleCache(logFileName,funcName,"data =",...);
	end
end

CommonSocketWriter.getLogFileName = function(self)
	
end

CommonSocketWriter.s_clientCmdFunMap = {
	[SEND_PHP_REQUEST] = CommonSocketWriter.onSendPhpRequest;
	[SEND_PHP_REQUEST_NEW] = CommonSocketWriter.onSendPhpRequestNew;
};