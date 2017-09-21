require("core/object");
require("util/TableLib");
require("common/animFactory");
require("common/syncNativeEvent");
require("php/phpCmd");

PhpManager = class();

PhpManager.TIME_OUT_DEFAULT = 6*1000;--默认超时时间
PhpManager.TIME_CLOCK_SPACE = 1; --定时器间隔时间

PhpManager.SUCCESS = 1;
PhpManager.ERROR = 2;
PhpManager.TIME_OUT = 3;

PhpManager.h_cmdIndex = PHP_CMD_CONSTANT + 0x0002; --php命令cmd起始值 

PhpManager.getInstance = function()
	if not PhpManager.s_instance then
		PhpManager.s_instance = new(PhpManager);
	end
	return PhpManager.s_instance;
end

PhpManager.releaseInstance = function()
	delete(PhpManager.s_instance);
	PhpManager.s_instance = nil;
end

PhpManager.ctor = function(self)
	self.m_phpCmdSendQueue = {}; --PHP命令发送队列
	self.m_phpCmdRecvQueue = {}; --PHP命令接收队列
	self.m_phpCmdSendSeq = 1; --发送的PHP序列号

	self:__startTimer();
end

PhpManager.dtor = function(self)
	self:__stopTimer();
	self.m_phpCmdSendSeq = 1;
	self.m_phpCmdSendQueue = {};
end

PhpManager.log = function(self,funcName,...)
	Log.record("PhpManager"," ",funcName," ",...);
end

--@brief 添加PHP命令发送请求
--@param param:php请求参数，此参数收到命令或超时时会一并传下去
--@param timeOut:php请求的超时时间
--@note: PHPManager会开启定时器，每隔一段时间来检查请求是否超时
--@return : 
--      #1:phpSendCmd: SEND_PHP_REQUEST_NEW, PHP命令发送接口
--		#2:经过封装后的数据包
PhpManager.generatePhpPacket = function(self, cmd, param, timeOut)
	if cmd < PHP_CMD_CONSTANT then
		self:log("PhpManager.addPhpRequest", "the php cmd must bigger than PHP_CMD_CONSTANT", "cmd = ", cmd);
		return nil;
	end

	--将请求加入队列中
	local seq = self:__addPhpRequestToQueue(cmd, param, timeOut);
	if seq == -1 then
		return nil;
	end

	--数据进行组装
	local phpSendCmd = SEND_PHP_REQUEST_NEW;
	local packetInfo = self:__getPhpJsonTable(cmd);
	packetInfo.cmd = cmd - PHP_CMD_CONSTANT; --subCmd
	packetInfo.seq = seq; --请求序列号，此序列号会带给Php，当php回复时会带给客户端
	for k, v in pairs( table.verify(param) ) do
		packetInfo[k] = v;
	end

	self:log("PhpManager.generatePhpPacket", "param -->", packetInfo);
	
	return phpSendCmd, packetInfo;
end

--@brief 将收到的Php命令加入到接收队列中
PhpManager.pushCmdToRecQueue = function(self, cmd, info)
	table.insert(self.m_phpCmdRecvQueue, {cmd = cmd, info = info});
end

--@brief 每1ms检查一次接收队列，并处理其中的数据(每次处理3条)
PhpManager.__checkAndHandlePhpRecvQueue = function(self)
	local arr = {};
	for i = 1, 3 do
		if self.m_phpCmdRecvQueue[1] then
			table.insert(arr, table.remove(self.m_phpCmdRecvQueue, 1) );
		end
	end

	for i=1, #arr do
		local phpCmd, phpInfo = self:__parsePhpPacket(arr[i].cmd, arr[i].info);
		OnlineSocketManager.getInstance():onReceivePhpPacket(phpCmd, phpInfo);
	end
end

--@brief 解析PHP数据包
--@param cmd: PHP命令接收接口 目前有2种 RESPONSE_PHP_REQUEST_NEW 和 RESPONSE_PHP_REQUEST
--@param info:数据包 2种接口对应的包数据结构不一样
--@return 
--		#1:phpCmd : cmd + PHP_CMD_CONSTANT;
--		#2:解析后的数据包
--			如果数据正常，则返回 { true, 数据的info层，此命令的请求参数(没有则为空表) };
--			如果数据错误，则返回 { false, 错误信息(包含errorTips, errorType, extraInfo)，此命令的请求参数(没有则为空表) }
-- WARNING ：请千万不要相信phpRequestParam 一定会有值 ！！！！！
PhpManager.__parsePhpPacket = function(self, cmd, info)
	if cmd ~= RESPONSE_PHP_REQUEST_NEW and cmd ~= RESPONSE_PHP_REQUEST then
		self:log("PhpManager.parsePhpPacket", "the php cmd must be RESPONSE_PHP_REQUEST_NEW or RESPONSE_PHP_REQUEST");
		return;
	end

	self:log("PhpManager.parsePhpPacket", info)

	local packetInfo = info;
	if cmd == RESPONSE_PHP_REQUEST_NEW then
		packetInfo = self:__parsePhpRequestNewCmd(info);
	end
	packetInfo.jsonStr = table.verify(packetInfo.jsonStr);--容错处理

	--获取php请求参数
	local phpRequestParam = self:__getPhpRequestParamBySeq(packetInfo.jsonStr.seq);
	local phpRequestSsid = self:__getPhpRequestSsidBySeq(packetInfo.jsonStr.seq);
	self:deletePhpRequestBySeq(packetInfo.jsonStr.seq);

	local phpCmd = PHP_CMD_CONSTANT + packetInfo.subCmd;
	self:log("PhpManager.parsePhpPacket", "action = ", PhpSocketCmdMap[phpCmd], " cmd = ", number.formatToHex(packetInfo.subCmd), "   packetInfo =", packetInfo);

	local errInfo = self:__generateErrorInfo(packetInfo, phpRequestSsid);

	if errInfo.errorTips then
		return phpCmd, {false, errInfo, phpRequestParam};
	else
		local info = packetInfo.jsonStr.info; 
		if info ~= nil and type(info) ~= "table" and not string.isEmpty(tostring(info)) then 	
			local temp = {};
			temp.info = info;
			packetInfo.jsonStr.info = temp;
		end
		return phpCmd, {true, table.verify(packetInfo.jsonStr.info),  phpRequestParam};
	end
end

--@brief 如果是命令RESPONSE_PHP_REQUEST_NEW返回的数据，则需要先解压
PhpManager.__parsePhpRequestNewCmd = function(self, info)
	local jsonStr = nil;
	if 1 == info.compressType then
		local isSuccess, unCompressInfo = self:uncompressPhpInfo(info.compressInfo);
		if isSuccess then
			jsonStr = json.decode(unCompressInfo);
		end
	else
		jsonStr = json.decode(info.compressInfo);
	end
	return {
		["flag"] = table.isTable(jsonStr) and 1 or 0;
		["jsonStr"] = table.verify(jsonStr);
		["subCmd"] = info.subCmd;
	};
end

--@brief 根据seq从请求队列中删除请求
PhpManager.deletePhpRequestBySeq = function(self, seq)
	if not seq then
		return;
	end

	self.m_phpCmdSendQueue[seq] = nil;
end

--@brief 解压方法：将php返回的数据先 unBase64 再 unGzip
PhpManager.uncompressPhpInfo = function(self,packetInfo)	
	local isSuccess,jsonStr = SyncNativeEvent.getInstance():syncUnBase64UngzipCheckJsonFormatForLua(packetInfo);
	return isSuccess,jsonStr;
end

--@brief 压缩方法：将数据先Gzip后 再 unBase64
PhpManager.compressPhpInfo = function(self,packetInfo)
	local isSuccess,jsonStr = SyncNativeEvent.getInstance():syncZipBase64CheckJsonFormatForLua(packetInfo);
	return isSuccess,jsonStr;
end

--@brief 获取Php命令cmd值
PhpManager.getPhpCmdValue = function(self)
	PhpManager.h_cmdIndex = PhpManager.h_cmdIndex + 1;
    return PhpManager.h_cmdIndex;
end

---------------------------------------------private---------------
--@brief 补全php指令的数据
PhpManager.__getPhpJsonTable = function(self, phpCmd)
	local info = {};
	info.timestamp = os.time();
	info.app = kClientInfo:getAppId();
	info.ssid = kUserInfoData:getSsid();
	info.mid = kUserInfoData:getUserId();
	info.isNew = 1; --代表是统一大厅
	info.action = self:_getActionByPhpCmd(phpCmd);
	info.hall_version = GameManager.getInstance():getGameVersion(GameType.HALL);

	return info;
end

--@brief 根据phpCmd获取action
PhpManager._getActionByPhpCmd = function(self, phpCmd)
	return PhpSocketCmdMap[phpCmd] or "";
end

--@brief 将php命令添加到发送队列中
PhpManager.__addPhpRequestToQueue = function(self, cmd, param, timeOut)
	if self:_isFilterPhpCmd(cmd, param) then
		return -1;
	end

	local seq = table.maxn(self.m_phpCmdSendQueue) or 0;
	self.m_phpCmdSendSeq = math.max(seq, self.m_phpCmdSendSeq) + 1;

	local info = {};
	info.cmd = cmd;
	info.param = param;
	timeOut = tonumber(timeOut) or 0;
	if timeOut <= 0 then
		timeOut = PhpManager.TIME_OUT_DEFAULT;
	end
	info.timeOut = timeOut;
    ---超时间时间 
    info.deadtime = Clock.system_now() + timeOut;
	info.ssid = kUserInfoData:getSsid();
	info.action = self:_getActionByPhpCmd(cmd);
	info.time = os.time();

	self.m_phpCmdSendQueue[self.m_phpCmdSendSeq] = info;
	return self.m_phpCmdSendSeq;
end

--@brief 过滤重复的php命令
PhpManager._isFilterPhpCmd = function(self, cmd, param)
	local result = false;
	for k, v in pairs(self.m_phpCmdSendQueue) do
		if v.cmd == cmd and table.equal(v.param, param) and (os.time()-v.time) <= 1 then
			Log.s("WARNING PhpManager._isFilterPhpCmd the param is same!!!!!!!!!!", "action = ", self:_getActionByPhpCmd(cmd), " param = ", param);
			result = true;
			break;
		end
	end
	return result;
end

--@brief 根据seq获取php请求的发送参数
PhpManager.__getPhpRequestParamBySeq = function(self, seq)
	if not seq then
		return {};
	end

	local info = self.m_phpCmdSendQueue[seq];
	if not table.isTable(info) then
		return {};
	end

	return info.param or {};
end

--@brief 防止在登录之前发送了命令导致会话过期的问题。
PhpManager.__getPhpRequestSsidBySeq = function(self, seq)
	if not seq then
		return "-1";
	end
	local info = self.m_phpCmdSendQueue[seq];
	if not table.isTable(info) then
		return "-1";
	end

	return info.ssid;
end

--@brief 开启定时器
PhpManager.__startTimer = function(self)
	if not self.m_timer then
		self.m_timer = AnimFactory.createAnimInt(kAnimRepeat,0,1,1,-1);
		self.m_timer:setDebugName("AnimInt|PhpManager|self.m_timer");
		self.m_timer:setEvent(self, self.__onTimer);
	end
end

--@brief 停止定时器
PhpManager.__stopTimer = function(self)
	delete(self.m_timer);
	self.m_timer = nil;
end

--@brief 定时器回调
PhpManager.__onTimer = function(self)
	self:__checkAndHandlePhpRecvQueue();
	self:__onCheckTimeOutClockCallBack();
end

--@brief 检测php请求是否超时
PhpManager.__onCheckTimeOutClockCallBack = function(self)
	if table.isEmpty(self.m_phpCmdSendQueue) then
		return;
	end

	local timeOutSeqMap = {};
    local nowTickTime = Clock.system_now();--相对于engine启动的当前时间
	--根据消逝的时间和超时时间来判断请求是否超时
	for seq, v in pairs(self.m_phpCmdSendQueue) do
		if v then
            if v.deadtime < nowTickTime then
                table.insert(timeOutSeqMap, seq);
            end
		end
	end

	--对超时的命令根据seq进行排序 从小->大
	table.sort(timeOutSeqMap, function(seq1, seq2) 
			if seq1 and seq2 then
				return seq1 < seq2;
			end
		end);

	for _, seq in ipairs(timeOutSeqMap) do
		local data = self.m_phpCmdSendQueue[seq];
		self:log("PhpManager.__onCheckTimeOutClockCallBack", "TIME_OUT -->", data);
		if not table.isEmpty(data) then
			--通知给socket进行分发
			local errInfo = { errorType = PhpManager.TIME_OUT, errorTips = GameString.get("requestTimeout") };
			local param = {false, errInfo, data.param};
			OnlineSocketManager.getInstance():onReceivePhpPacket(data.cmd, param);
		end
		self.m_phpCmdSendQueue[seq] = nil;
	end
end

--@brief 获取通用错误信息
PhpManager.__generateErrorInfo = function(self, packetInfo, ssid)
	local errorType = self:__getErrorType(packetInfo);
	local errorTips = nil;

	local status = self:__getStatus(packetInfo);

	if packetInfo.flag == 0 then
		errorTips = GameString.get("requestError");
	elseif packetInfo.flag == 2 then 
		errorTips = GameString.get("requestTimeout");
	elseif status == 1 then
		errorTips = self:__getErrorMsg(packetInfo);
		if errorTips == "" then
			local majorType = string.sub(errorType,1,1);
			local minorType = string.sub(errorType,3,3);
			local errorType = string.format("phpError%s_%s",majorType,minorType);
			errorTips = GameString.get(errorType) or GameString.get("requestError");
		end

        if errorType == 2 and not string.isEmpty(ssid) then --会话超时
			self:__onSessionTimeOut();
		end
	end
	return { ["errorType"] = errorType, ["errorTips"] = errorTips, ["extraInfo"] = self:__getInfo(packetInfo)};
end

--@brief 获取返回信息的状态
PhpManager.__getStatus = function(self, packetInfo)
	return packetInfo.jsonStr and packetInfo.jsonStr.status or 1;
end

--@brief 获取错误的类型
PhpManager.__getErrorType = function(self, packetInfo)
	return packetInfo.jsonStr and packetInfo.jsonStr.type or "";
end

--@brief 获取错误的描述
PhpManager.__getErrorMsg = function(self, packetInfo)
	return packetInfo.jsonStr and packetInfo.jsonStr.msg or "";
end

--@brief 获取Info层
PhpManager.__getInfo = function(self, packetInfo)
	return packetInfo.jsonStr and packetInfo.jsonStr.info or {};
end

--@brief 当socket关闭15分钟以上session过期了,要重新请求登录php
PhpManager.__onSessionTimeOut = function(self)
	if kLoginDataInterface:getIsLoginSuccess() then
		--会话超时，只会在登录成功后需要进行提醒
		kLoginDataInterface:setLoginState(LoginConstants.eLoginState.SessionTimeOut);
		GameManager.getInstance():startGame(GameType.HALL);
	end
end