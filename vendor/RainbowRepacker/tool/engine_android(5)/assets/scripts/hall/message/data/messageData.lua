require("gameData/gameData");
require("core/dict");
require("hall/message/data/messageConstants");

--系统公告
local MessageData = class(GameData);

MessageData.Delegate = {
    refreshMsg = "refreshMsgCallback";  
};

MessageData.ctor = function(self)   
end

MessageData.dtor = function(self)
end

MessageData.initData = function(self)
    self.m_unReadSysNum = 0;
    self.m_msgData = {};
end

------------------------------------------------------------------------
--获取某种消息
MessageData.getMsgData = function(self)
    self:requestData();

    local msgData = self:_formatData(self.m_msgData);
    return msgData;
end

MessageData.addMsgData = function(self, data)
    if table.isEmpty(data) then
        return;
    end

    local item = {
        awards = self:_analysisDataAwards(data.awards),
        title = tostring(data.title) or "error",
        id = tostring(data.id);
        body = tostring(data.body) or "error",
        time = tostring(data.time) or "0",
        msgType = tostring(data.type), 
        opened = MessageConstants.eMsgStatus.CLOSE,
        extend = data.extend,
        is_html = number.valueOf(data.is_html);
        html_url = string.valueOf(data.html_url); 
    };

    if not item.id then
        return;
    end

    if (not table.isEmpty(item.awards)) then
         item.msgType = MessageConstants.eMsgType.AWARD;
    elseif (not table.isEmpty(item.extend)) then
        item.msgType = MessageConstants.eMsgType.QRCODE;
    else
        item.msgType = MessageConstants.eMsgType.TEXT;
    end

    if table.isEmpty(self.m_msgData[item.id]) then
        item.opened = MessageConstants.eMsgStatus.CLOSE;
        self.m_unReadSysNum = self.m_unReadSysNum + 1;  
    else 
        item.opened = self.m_msgData[item.id].opened or MessageConstants.eMsgStatus.CLOSE;
    end
    
    self.m_msgData[item.id] = item;

    local msgData = self:_formatData(self.m_msgData);
    
    self:saveData();

    self:execDelegate(MessageData.Delegate.refreshMsg, true, msgData);
end

MessageData.addAnnounceData = function(self, data)
    self:deleteAnnounceData();

    local item = data;
    item.id = MessageConstants.ANNOUNCE_ID;

    item.opened = MessageConstants.eMsgStatus.OPENED;
    item.msgType = MessageConstants.eMsgType.ANNOUNCE;
    item.isDeleted = false;

    self.m_msgData[item.id] = item;

    self:saveData();
end

MessageData.deleteAnnounceData = function(self)
    if self.m_msgData[MessageConstants.ANNOUNCE_ID] then
        self.m_msgData[MessageConstants.ANNOUNCE_ID].isDeleted = true;
    end
    self:saveData();
end

MessageData.getMsgById = function(self, id)
    if not id then
        return nil;
    end

    return table.verify(self.m_msgData[id]);
end

--获取某种消息的未读条数
MessageData.getUnReadCount = function(self)
    return number.valueOf(self.m_unReadSysNum);
end

MessageData.hasNewMessage = function(self)
    if number.valueOf(self.m_unReadSysNum) > 0 then
        return true;
    else
        for k, v in pairs(self.m_msgData) do
            if v.msgType == MessageConstants.eMsgType.AWARD and v.opened == MessageConstants.eMsgStatus.OPENED then
                return true;
            end
        end
        return false;
    end
end

--根据id删除消息
MessageData.deleteMsgByIds = function(self, ids)
    if table.isEmpty(ids) then
        return;
    end

    for k,v in pairs(ids) do
        local id = tostring(v);
    	if id then
            if self.m_msgData[id] then
                self.m_msgData[id].isDeleted = true;
            end
        end
    end
    self:saveData();
end

--清空某种类型的消息
MessageData.clearMsg = function(self)
	self.m_unReadSysNum = 0;
    self.m_msgData = {};

    self:saveData();
end

--清空所有消息
MessageData.clear = function(self)
    self:initData();
    self:saveData();
end

MessageData.openMessage = function(self, id)
    if not id then 
        return; 
    end

    local data = self.m_msgData[id];

    if not data then
        return;
    end

    if data.opened == MessageConstants.eMsgStatus.CLOSE then
        data.opened = MessageConstants.eMsgStatus.OPENED;
        self.m_unReadSysNum  = self.m_unReadSysNum - 1;
        self:saveData();
    end
end 

MessageData.readMessage = function(self, id, isDelete)
    if not id then 
        return; 
    end

    local data = self.m_msgData[id];

    if not data then
        return;
    end

    if data.opened == MessageConstants.eMsgStatus.CLOSE then
        data.opened = MessageConstants.eMsgStatus.READED; 
        self.m_unReadSysNum  = self.m_unReadSysNum - 1;
        self:saveData();
    end

    if isDelete then
        self:deleteMsgByIds({id});
    end
end

MessageData.getMsgDataById = function(self, id)
    if not id then 
        return nil; 
    end

    return self.m_msgData[id];
end

MessageData.updateAwards = function(self, id, newAwards)
    if not id or not newAwards then 
        return; 
    end

    local data = self.m_msgData[id];

    if not data then
        return;
    end

    data.awards = newAwards;
    if data.opened == MessageConstants.eMsgStatus.CLOSE then
        data.opened = MessageConstants.eMsgStatus.OPENED; 
        self.m_unReadSysNum  = self.m_unReadSysNum - 1;    
    end
    self:saveData();
end

----------------------------------------------------------------------------------

MessageData.loadDictData = function(self, dict)
    local data = table.verify(json.decode(dict:getString("sys_msg")));
    self.m_unReadSysNum = dict:getInt("unread_sys_num");
   
    self.m_msgData = {};

    for k,v in pairs(data) do
        if v then
            v.awards = json.decode(v.awards);
            local id = tostring(v.id);
            if id then
                self.m_msgData[id] = v;
            end
        end
    end
end

MessageData.saveDictData = function(self, dict)
    for k,v in pairs(self.m_msgData) do
        if v then
            v.awards = json.encode(v.awards) or "";
        end
    end

    local data = json.encode(self.m_msgData) or "";
    dict:setString("sys_msg", data);
    dict:setInt("unread_sys_num",self.m_unReadSysNum);
    
    for k,v in pairs(self.m_msgData) do
        if v then
            v.awards = json.decode(v.awards);
        end
    end
end

MessageData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "new_msg_data_" .. self.m_userId;
end

MessageData.getMsgMaxId = function (self)
    local id = -1;
    for k,v in pairs(table.verify(self.m_msgData)) do
        local tmpId = number.valueOf(v.id);
        if tmpId > id then
            id = tmpId;
        end
    end
    return id;
end

MessageData.getMsgMinIdList = function (self, diffNum)
    if table.isEmpty(self.m_msgData) then
       return false; 
    end
    local tmp = {};
    for k, v in pairs(self.m_msgData) do
        table.insert(tmp, v);
    end
    table.sort(tmp, function (a, b)
        if a and b then
            return number.valueOf(a.id) < number.valueOf(b.id);
        end 
    end);
    local idList = {};
    local count = 0;
    for k, v in ipairs(tmp) do
        local tmpId = number.valueOf(v.id);
        if tmpId ~= -1 then
            table.insert(idList, tmpId);
            count = count + 1;
            if count == diffNum then
                break;    
            end
        end
    end
    return idList;
end


MessageData.requestData = function(self)
    if self:_isNeedRefresh() then
        Log.i("MessageData.requestData");
        OnlineSocketManager.getInstance():sendMsg(PHP_GET_MESSAGE,{id = self:getMsgMaxId()});
    end
end

MessageData.__formatConstants = function (self, data)
    if table.isEmpty(data) then
       return;
    end
    self.m_timeLimit = (data.timeLimit or 90)*24*24*60;
    self.m_maxMsgNum = data.maxMsgNum or MessageConstants.SIZE_LIMIT;
    self.m_isNewMsg  = data.isNewMsg or 0;
end

MessageData.onGetMessageDataCallback = function(self,isSuccess,data)
    Log.i("MessageData.onGetMessageDataCallback","isSuccess = ",isSuccess,"data = ",data);
    local tmp = {};
    if not table.isEmpty(data) then
        tmp = table.verify(data.data);
    end
    if isSuccess then
        self:__formatConstants(data);
        self:updateData(true, tmp);
    end 
    local msgData = self:_formatData(self.m_msgData);
    self:execDelegate(MessageData.Delegate.refreshMsg, isSuccess, msgData);
end

MessageData.updateMemData = function(self, data)
    local announceData = self.m_msgData[MessageConstants.eMsgType.ANNOUNCE];
    self:_analysisData(data);

    if announceData then
        self.m_msgData[MessageConstants.eMsgType.ANNOUNCE] = announceData;
    end
end

MessageData._isNeedRefresh = function(self)
    if not self.m_lastRefreshTime then 
        self.m_lastRefreshTime = os.time();
        return true;
    else
        return false;
    end 
end

MessageData._checkData = function(self, array)
    local isChanged = false;
    local curTime = AppData.getInstance():getRightTimeWithServer();
    local tmp = {};
    
    for k,v in pairs(array) do
        if not v.isDeleted and (v.msgType == MessageConstants.eMsgType.ANNOUNCE or 
            curTime <= number.valueOf(v.time) + (self.m_timeLimit or MessageConstants.TIME_LIMIT)) then
            table.insert(tmp,v);
        else
            isChanged = true;
        end
    end
    self.m_unReadSysNum = 0;
    self.m_msgData = {};
    for k,v in pairs(tmp) do
        if v.id then
            self.m_msgData[v.id] = v;

            if v.opened == MessageConstants.eMsgStatus.CLOSE then
                self.m_unReadSysNum = self.m_unReadSysNum + 1;
            end
        end
    end

    if isChanged then
        self:saveData();
    end
end


MessageData._formatData = function(self, array)
    local tmp = {};
    
    for k,v in pairs(array) do
        if not v.isDeleted then
            table.insert(tmp,v);
        end
    end
    
    table.sort(tmp, function(a,b)
        local weightType = 10;  -- 类型权值
        local weightWeight = 10; -- 权值字段权值
        local weightTime = 1; -- 时间字段权值

        -- 类型字段
        local stateTypeA = a.msgType == MessageConstants.eMsgType.ANNOUNCE and 1 or 0;
        local stateTypeB = b.msgType == MessageConstants.eMsgType.ANNOUNCE and 1 or 0;
        
        -- 权值字段
        local stateWeightA = number.valueOf(a.weight) > number.valueOf(b.weight) and 1 or 0; -- weight相等时都为0
        local stateWeightB = number.valueOf(b.weight) > number.valueOf(a.weight) and 1 or 0;
        
        -- 时间字段
        local stateTimeA = number.valueOf(a.time) > number.valueOf(b.time) and 1 or 0; -- time相等时都为0
        local stateTimeB = number.valueOf(b.time) > number.valueOf(a.time) and 1 or 0;

        local valueA = stateTypeA*weightType + stateWeightA*weightWeight + stateTimeA*weightTime;
        local valueB = stateTypeB*weightType + stateWeightB*weightWeight + stateTimeB*weightTime;
        return valueA > valueB;
    end);

    self:_checkData(tmp);
    local maxMsgNum = self.m_maxMsgNum or MessageConstants.SIZE_LIMIT;
    if #tmp > maxMsgNum then
        local tmpReturn = {};
        for k,v in ipairs(tmp) do
            table.insert(tmpReturn,v);
            if k >= maxMsgNum then
                break;
            end
        end
        return table.verify(tmpReturn);
    else
        return table.verify(tmp); 
    end
end

MessageData.checkSurpassMaxMsg = function (self)
    local count = 0;
    for k,v in pairs(self.m_msgData) do
        count = count + 1;
    end
    local diffNum = (count - self.m_maxMsgNum) or 0;
    if diffNum > 0 then
        local idList = self:getMsgMinIdList(diffNum);
        if not table.isEmpty(idList) then
            for i = 1, diffNum do
                for k, v in pairs(self.m_msgData) do
                    if string.valueOf(idList[i]) == k then
                        self.m_msgData[k] = nil;           
                    end
                end
            end
        end
    end
end

MessageData.checkOverdueMsg = function (self)
    local curTime = AppData.getInstance():getRightTimeWithServer();
    for k, v in pairs(self.m_msgData) do
        if curTime > (number.valueOf(v.time) + (self.m_timeLimit or MessageConstants.TIME_LIMIT)) then
           self.m_msgData[k] = nil;
        end
    end
end

MessageData._analysisData = function(self, data)
    if table.isEmpty (data) or self.m_isNewMsg == 0 then
        return;
    end
    for k,v in pairs(table.verify(data)) do
        local item = {
            awards = self:_analysisDataAwards(json.decode(v.awards) or ""),
            title = tostring(v.title) or "error",
            id = tostring(v.id);
            body = tostring(v.body) or "error",
            time = tostring(v.time) or "0",
            msgType = tostring(v.type), 
            opened = MessageConstants.eMsgStatus.CLOSE,
            extend = json.decode(v.extend) or {}, 
            is_html = number.valueOf(v.is_html);
            html_url = string.valueOf(v.html_url); 
        };
       
        if (not table.isEmpty(item.awards)) then
            item.msgType = MessageConstants.eMsgType.AWARD;
        elseif (not table.isEmpty(item.extend)) then
            item.msgType = MessageConstants.eMsgType.QRCODE;
        else
            item.msgType = MessageConstants.eMsgType.TEXT;
        end
        
       
        if item.id then
            if table.isEmpty(self.m_msgData[item.id]) then
                item.opened = MessageConstants.eMsgStatus.CLOSE;
                self.m_unReadSysNum = self.m_unReadSysNum + 1;
            else
                item.opened = self.m_msgData[item.id].opened or MessageConstants.eMsgStatus.CLOSE;
            end
            self.m_msgData[item.id] = item;
        end
    end
    self:checkSurpassMaxMsg();
    self:checkOverdueMsg();
end

MessageData._analysisDataAwards = function(self, data)
    local tempData = {};
    if not table.isEmpty(data) then
        for k,v in pairs(data) do
            local item = {
                type = tostring(v.type) or "0", 
                num = tostring(v.num) or "0",
                havegot = tonumber(v.havegot) or 0,
            };
            table.insert(tempData, item);
        end 
    end
    return tempData;
end

MessageData.s_socketCmdFuncMap = {
    [PHP_GET_MESSAGE]                = MessageData.onGetMessageDataCallback;
};

return MessageData;