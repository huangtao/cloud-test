
MsgProcessTools = class();

MsgProcessTools.m_socketCmdFuncMap = {};

MsgProcessTools.getInstance = function()
    if not MsgProcessTools.s_instance then 
        MsgProcessTools.s_instance = new(MsgProcessTools);
    end
    return MsgProcessTools.s_instance;
end

MsgProcessTools.releaseInstance = function()
    delete(MsgProcessTools.s_instance);
    MsgProcessTools.s_instance = nil;
end

MsgProcessTools.ctor = function(self)
    self.m_isProcessing = false;
    self.m_cmd_packetInfos = {};
    self.m_defaultMaxProcessTime = 30000;--默认30s为消息处理最长时间
    EventDispatcher.getInstance():register(Event.Pause,self,self.onPause);
    self.m_isOpen = true;
    self.m_startTime = 0;
    self.m_fristPacket = 0;
    self.m_isPause = false;
    self.m_animInts = {};
    self.m_isStartProcess = false;
end

MsgProcessTools.dtor = function(self)
    self:reset();
    EventDispatcher.getInstance():unregister(Event.Pause,self,self.onPause);
end

MsgProcessTools.reset = function(self)
    self.m_isProcessing = false;
    self:stopProcessingTimer();

    for k,v in pairs(self.m_animInts) do
        if v then
            delete(v);
            v = nil;
        end
    end
    self.m_animInts = nil;
    self.m_startTime = 0;
    self.m_fristPacket = 0;
    self.m_isPause = false;
    self.m_isStartProcess = false;
	self.m_cmd_packetInfos = {};
end

MsgProcessTools.startProcess = function(self)
    Log.d("MsgProcessTools.startProcess");
    self.m_isStartProcess = true;
    self:processNextPacketInfo();
end 

-- 是否需要关闭切换回游戏时，处理消息的buff时间，斗牛使用
MsgProcessTools.setSwitch = function(self,isOpen)
    self.m_isOpen = isOpen;
end

-- 接口抛弃
MsgProcessTools.isUpdateBuff = function(self,isUpdate)

end

MsgProcessTools.onPause = function(self)
    self.m_isPause = true;
end

--消息处理最长时间，最大不能超过 1min
MsgProcessTools.setMaxProcessTime = function(self,maxProcessTime)
    self.m_maxProcessTime = maxProcessTime;
end

--加入消息队列处理
MsgProcessTools.onPreHandlePacktInfo = function(self,obj, cmd, packetInfo,maxProcessTime)
    Log.d("MsgProcessTools.onPreHandlePacktInfo cmd", number.formatToHex(cmd));
    local packetInfoId = self:getPacketInfoId();

    if self:checkIsProcessing(obj,cmd, packetInfo, packetInfoId,maxProcessTime) then
        return;
    end

    self.m_isProcessing = true;
    self.m_processingPaketInfoId = packetInfoId;
    self:startProcessingTimer(maxProcessTime);
    self:handlePacketInfo(obj,cmd, packetInfo, packetInfoId);
end

--处理消息
MsgProcessTools.handlePacketInfo = function (self,obj, cmd, packetInfo, packetInfoId)
    Log.d("MsgProcessTools.handlePacketInfo cmd", number.formatToHex(cmd));
    local func = nil;
    local curObj = obj;
    while curObj do
        func = curObj.m_socketCmdFuncMap[cmd];
        if func then
            break;
        else
            curObj = curObj.super;
        end
    end
  
    if type(func) == "function" then        
        func(obj, packetInfo, packetInfoId);
    elseif type(func) == "string" then
        local funcSelf = nil;
        local curObj = obj;
        while curObj do
            funcSelf = curObj[func];
            if funcSelf then
                break;
            else
                curObj = curObj.super;
            end
        end
        if funcSelf then        
            funcSelf(obj, packetInfo, packetInfoId);
        end
    else
        Log.e("------MsgProcessTools.handlePacketInfo no handle Func cmd", number.formatToHex(cmd));
    end
end

--最长消息处理时间优先选用每条消息自带的最大时间，其次是设置的最大时间，最后选用默认值
MsgProcessTools.startProcessingTimer = function(self,maxProcessTime)
    Log.d("MsgProcessTools.startProcessingTimer");
    self:stopProcessingTimer();

    maxProcessTime = tonumber(maxProcessTime);
    local time1 = tonumber(self.m_maxProcessTime);
    local time = maxProcessTime and maxProcessTime or (time1 and time1 or self.m_defaultMaxProcessTime);
    time = (time > 0 and time < self.m_defaultMaxProcessTime*2) and time or self.m_defaultMaxProcessTime;
    Log.d("MsgProcessTools.startProcessingTimer","time = ",time);

    local remainTime = math.ceil(time/1000);
    self.m_processingTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 0,  1000, 0);
    self.m_processingTimer:setDebugName("AnimInt|MsgProcessTools|processingTimer");
    self.m_processingTimer:setEvent(self, function()
        remainTime = remainTime - 1;
        Log.d("MsgProcessTools.startProcessingTimer","handle remainTime = ",remainTime);

        if remainTime == 0 then
            self:onProcessingTimerEvent();
        end 
    end);
end

--消息已经处理30s+,则处理清空堆栈信息，直接重连   
MsgProcessTools.onProcessingTimerEvent = function(self)
    Log.d("MsgProcessTools.onProcessingTimerEvent");

    if _DEBUG then
        local msg = "MsgProcessTools.processingTimerEvent,processingPaketInfoId = "..number.formatToHex(self.m_processingPaketInfoId);
        error(msg);
    end
    
    self:clearCmdPacketInfos();
    self:doNextPacketInfo();

    SocketIsolater.getInstance():reopenSocket();
end

MsgProcessTools.stopProcessingTimer = function(self)
    Log.d("MsgProcessTools.stopProcessingTimer");
    delete(self.m_processingTimer);
    self.m_processingTimer = nil;
end

--检测是否有消息正在处理，如果有则把消息加入队列等待处理
MsgProcessTools.checkIsProcessing = function(self, obj,cmd, packetInfo, packetInfoId,maxProcessTime)
    Log.d("MsgProcessTools.checkIsProcessing self.m_isStartProcess",self.m_isStartProcess);
    Log.d("MsgProcessTools.checkIsProcessing self.m_isProcessing", self.m_isProcessing);
    Log.d("MsgProcessTools.checkIsProcessing cmd", number.formatToHex(cmd));
    Log.d("MsgProcessTools.checkIsProcessing packetInfoId", packetInfoId);
    if (not self.m_isStartProcess) or self.m_isProcessing then 
        local cmd_packetInfo = {};
        cmd_packetInfo.id = packetInfoId;
        cmd_packetInfo.time = os.time();
        cmd_packetInfo.obj = obj;
        cmd_packetInfo.cmd = cmd;
        cmd_packetInfo.packetInfo = packetInfo;
        cmd_packetInfo.maxProcessTime = maxProcessTime;
        table.insert(self.m_cmd_packetInfos, cmd_packetInfo);
        Log.d("MsgProcessTools.checkIsProcessing save info, cmd = ",number.formatToHex(cmd));
        return true;
    end
    return false;
end

--期望处理完消息的时间， 时间到了会去处理消息队列的下一条消息
MsgProcessTools.expectProcessCompleteTime = function(self, packetInfoId, time)
    Log.d("MsgProcessTools.expectProcessCompleteTime packetInfoId", packetInfoId);
    if not packetInfoId then
        error("------no packetInfoId is bug");
    end
    time = time or 1;
    if self.m_isPause and self.m_isOpen then
        local endTime = os.time();
        if self.m_fristPacket == 0 then
            time = 1;
            self.m_fristPacket = 1;
        else
            local buffTime = (endTime - self.m_startTime);
            if buffTime <= 1 then
                time = 1;
            else
                self.m_fristPacket = 0;
                self.m_isPause = false;
            end
        end
        self.m_startTime = endTime;
    end
    if time == 1 then
        self:processComplete(packetInfoId);
        return;
    end
    local msgAnimInt = AnimFactory.createAnimInt(kAnimNormal, 0, 0, time or 10, -1);
    msgAnimInt:setDebugName("AnimInt|MsgProcessTools|expectProcessCompleteTime");
    msgAnimInt:setEvent(nil, function (obj,anim_type, anim_id, repeat_or_loop_num)
        Log.d("MsgProcessTools.expectProcessCompleteTime anim Event call function");
        self:processComplete(packetInfoId , anim_id);
    end);
    self.m_animInts[msgAnimInt:getID()] = msgAnimInt;
end

MsgProcessTools.processComplete = function(self, packetInfoId , animId)
    Log.d("MsgProcessTools.processComplete packetInfoId", packetInfoId);
    Log.d("MsgProcessTools.processComplete self.m_processingPaketInfoId", self.m_processingPaketInfoId);
    if self.m_processingPaketInfoId == packetInfoId then
        self:doNextPacketInfo(animId);
    end
end

MsgProcessTools.doNextPacketInfo = function(self , animId)
    Log.d("MsgProcessTools.doNextPacketInfo");
    if self.m_animInts[animId] then
        delete(self.m_animInts[animId]);
        self.m_animInts[animId] = nil;
    end

    self:stopProcessingTimer();

    self:processNextPacketInfo();
end

--直接处理下一条消息
MsgProcessTools.processNextPacketInfo = function(self)
    Log.d("MsgProcessTools.processNextPacketInfo #self.m_cmd_packetInfos", #self.m_cmd_packetInfos);
    self.m_isProcessing = false;

    if #self.m_cmd_packetInfos > 0 then
        self.m_isProcessing = true;
        
        local cmd_packetInfo = table.remove(self.m_cmd_packetInfos, 1);
        self.m_processingPaketInfoId = cmd_packetInfo.id;
        self:startProcessingTimer(cmd_packetInfo.maxProcessTime);
        Log.d("MsgProcessTools.processNextPacketInfo self.m_processingPaketInfoId", self.m_processingPaketInfoId);
        Log.d("MsgProcessTools.processNextPacketInfo cmd_packetInfo.cmd", number.formatToHex(cmd_packetInfo.cmd));
        self:handlePacketInfo(cmd_packetInfo.obj,cmd_packetInfo.cmd, cmd_packetInfo.packetInfo, cmd_packetInfo.id);
    end
end

--获取缓存消息的唯一id
MsgProcessTools.getPacketInfoId = function (self)
    self.m_packetInfoId = (self.m_packetInfoId or 0) + 1;
    return self.m_packetInfoId;
end

--清除等待处理的消息
MsgProcessTools.clearCmdPacketInfos = function(self)
    self:stopProcessingTimer();
    Log.d("MsgProcessTools.clearCmdPacketInfos");
    self.m_cmd_packetInfos = {};
end

--插入接下来就要处理的消息到消息队列
MsgProcessTools.insertNextPacketInfo = function(self,obj, cmd, packetInfo)
    Log.d("MsgProcessTools.insertPacketInfo cmd", number.formatToHex(cmd));
    local cmd_packetInfo = {};
    cmd_packetInfo.id = self:getPacketInfoId();
    cmd_packetInfo.time = os.time();
    cmd_packetInfo.obj = obj;
    cmd_packetInfo.cmd = cmd;
    cmd_packetInfo.packetInfo = packetInfo;
    table.insert(self.m_cmd_packetInfos, 1, cmd_packetInfo);    
end

-- 获取当前消息堆栈未处理的消息数量
MsgProcessTools.getSurplusMsgNum = function(self)
    return #table.verify(self.m_cmd_packetInfos);
end