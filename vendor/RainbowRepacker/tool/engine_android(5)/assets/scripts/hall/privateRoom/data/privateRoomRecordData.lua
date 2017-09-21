require("gameData/gameData");
require("core/dict");

-- 私人房记录
local PrivateRoomRecordData = class(GameData);

PrivateRoomRecordData.RECORD_LIST_MAX_SIZE = 50; -- 列表最大数量
PrivateRoomRecordData.RECORD_LIST_MAX_REQUEST = 8; -- 最大请求次数

PrivateRoomRecordData.Delegate = {
    onGetPrivateRoomRecordListCallback = "onGetPrivateRoomRecordListCallback";
    onGetPrivateRoomRecordDetailCallback = "onGetPrivateRoomRecordDetailCallback";
};

PrivateRoomRecordData.ctor = function(self)   
end

PrivateRoomRecordData.dtor = function(self)
end

PrivateRoomRecordData.initData = function(self)
    self.m_recordList = {};
    self.m_recordDetail = {};
end

PrivateRoomRecordData.requirePrivateRoomRecordList = function(self)
    self.m_recordListRequestCount = 0;
    self:_requirePrivateRoomRecordList();
end

PrivateRoomRecordData.getPrivateRoomRecordList = function(self)
    self:execDelegate(PrivateRoomRecordData.Delegate.onGetPrivateRoomRecordListCallback, true, self.m_recordList);
end

PrivateRoomRecordData._requirePrivateRoomRecordList = function(self)
    self.m_recordListRequestCount = self.m_recordListRequestCount + 1;

    if self.m_recordListRequestCount <= PrivateRoomRecordData.RECORD_LIST_MAX_REQUEST then
        OnlineSocketManager.getInstance():sendMsg(PHP_PRIVATE_ROOM_RECORD_LIST, {end_time = self:_getRecordListMaxEndTime()});
    end
end

PrivateRoomRecordData.onGetPrivateRoomRecordListCallback = function(self, isSuccess, data, sendParam)
    if isSuccess then
        if not table.isEmpty(data) then
            self:updateData(true, data);
            self:_requirePrivateRoomRecordList();

            self:execDelegate(PrivateRoomRecordData.Delegate.onGetPrivateRoomRecordListCallback, isSuccess, self.m_recordList);
        end
    else
        self:execDelegate(PrivateRoomRecordData.Delegate.onGetPrivateRoomRecordListCallback, isSuccess, self.m_recordList);
    end
end

PrivateRoomRecordData.getPrivateRoomRecordDetailForce = function(self, tableKey)
    tableKey = tostring(tableKey or "") or "";
    OnlineSocketManager.getInstance():sendMsg(PHP_PRIVATE_ROOM_RECORD_DETAIL, {table_key = tableKey});
end

PrivateRoomRecordData.getPrivateRoomRecordDetail = function(self, tableKey)
    tableKey = tostring(tableKey or "") or "";
    OnlineSocketManager.getInstance():sendMsg(PHP_PRIVATE_ROOM_RECORD_DETAIL, {table_key = tableKey});
end

PrivateRoomRecordData.onGetPrivateRoomRecordDetailCallback = function(self, isSuccess, data, sendParam)
    if isSuccess and not table.isEmpty(sendParam) then
        self.m_recordDetail[sendParam.table_key] = self:_analyseDetailData(data);
        self:execDelegate(PrivateRoomRecordData.Delegate.onGetPrivateRoomRecordDetailCallback, true, self.m_recordDetail[sendParam.table_key]);
    else
        self:execDelegate(PrivateRoomRecordData.Delegate.onGetPrivateRoomRecordDetailCallback, false);
    end
end

PrivateRoomRecordData.updateMemData = function(self, data)
    local insertData = self:_analyseListData(data); 
    self.m_recordList = self:_insertData(self.m_recordList, insertData);
end

PrivateRoomRecordData.loadDictData = function(self, dict)
    local dataStr = dict:getString("recordList")
    self.m_recordList = json.decode(dataStr) or {};
end

PrivateRoomRecordData.saveDictData = function(self, dict)
    local strData = json.encode(self.m_recordList or {})
    dict:setString("recordList", strData)
end

PrivateRoomRecordData.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "PrivateRoomRecordData"..self.m_userId;
end

PrivateRoomRecordData._insertData = function(self, source, data)
    if not table.isEmpty(data) then
        local size = #data;
        for k, v in ipairs(table.verify(source)) do
            if size < PrivateRoomRecordData.RECORD_LIST_MAX_SIZE then
                table.insert(data, v);
                size = size + 1;
            else
                break;
            end
        end
        return data;
    end
    return source;
end

PrivateRoomRecordData._getRecordListMaxEndTime = function(self)
    if not table.isEmpty(self.m_recordList) then
        local item = self.m_recordList[1];
        if not table.isEmpty(item) then
            return item.time or 0;
        end
    end
    return 0;
end


----------------------------------------------------------------------------------
-- 约牌记录
PrivateRoomRecordData._analyseListData = function(self, data)
    local tmp = {};
    for k,v in pairs(table.verify(data)) do
        local item = self:_analyseListItem(v);
        table.insert(tmp, item);
    end
    return tmp; 
end

PrivateRoomRecordData._analyseListItem = function(self, data)
    local item = table.verify(data);
    local tmp = {
        tableKey = tostring(item.table_key or "") or "",
        time = tonumber(item.end_time) or 0,
        gameId = tonumber(item.game_id) or 0,
        gameName = tostring(item.game_name or "") or "",
        roundsTotal = tonumber(item.game_count) or 0,
        roundsCurrent = tonumber(item.real_count) or 0,
        otherPlayers = tostring(item.other_players or "") or "",
        propNum = tonumber(item.my_score) or 0,
        propType = tonumber(item.money_type) or 0,
    };
    return tmp;
end

----------------------------------------------------------------------------------
-- 玩牌详情
PrivateRoomRecordData._analyseDetailData = function(self, data)
    local item = table.verify(data);
    local roundsCurrent = tonumber(item.curr_count) or 0;
    local tmp = {
        gameId = tonumber(item.game_id) or 0,
        gameName = tostring(item.game_name or "") or "",
        roundsTotal = tonumber(item.game_count) or 0,
        roundsCurrent = roundsCurrent,
        time = tonumber(item.time) or 0,
        propType = tonumber(item.money_type) or 0,
        data = self:_analyseDetailList(item.data, roundsCurrent),
    };
    return tmp;
end

PrivateRoomRecordData._analyseDetailList = function(self, data, roundsNum)
    local tmp = {};
    for k, v in pairs(table.verify(data)) do
        local item = self:_analyseDetailListItem(v, roundsNum);
        table.insert(tmp, item);
    end
    return tmp;
end

PrivateRoomRecordData._analyseDetailListItem = function(self, data, roundsNum)
    local item = table.verify(data);
    local tmp = {
        mid = tonumber(item.mid) or 0,
        nick = tostring(item.nick or "") or "",
        sex = tonumber(item.sex) or 0,
        icon = tostring(item.icon or "") or "",
        winCount = tonumber(item.win_count) or 0,
        propNum = tonumber(item.total_score) or 0,
        propList = self:_analyseDetailListItemScore(item.scores, roundsNum),
    };
    return tmp;
end

PrivateRoomRecordData._analyseDetailListItemScore = function(self, data, roundsNum)
    local tmp = {};
    local list = table.verify(data);
    for i = 1, roundsNum do
        local num = tonumber(list[i]) or 0;
        table.insert(tmp, num);
    end
    return tmp;
end

PrivateRoomRecordData.s_socketCmdFuncMap = {
    [PHP_PRIVATE_ROOM_RECORD_LIST]  = PrivateRoomRecordData.onGetPrivateRoomRecordListCallback;
    [PHP_PRIVATE_ROOM_RECORD_DETAIL] = PrivateRoomRecordData.onGetPrivateRoomRecordDetailCallback;
};

return PrivateRoomRecordData;