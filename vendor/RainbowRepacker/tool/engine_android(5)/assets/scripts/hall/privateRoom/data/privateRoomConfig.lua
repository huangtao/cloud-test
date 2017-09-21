require("gameData/gameData");
require("core/dict");

-- 私人房配置
local PrivateRoomConfig = class(GameData);

PrivateRoomConfig.Delegate = {
    onGetPrivatRoomConfigCallback = "onGetPrivatRoomConfigCallback";
    onRequestPrivatRoomConfigCallback = "onRequestPrivatRoomConfigCallback";  
};

PrivateRoomConfig.ctor = function(self)   
end

PrivateRoomConfig.dtor = function(self)
end

PrivateRoomConfig.initData = function(self)
    self.m_data = {};
    self.m_localVersion = -1;
end

PrivateRoomConfig.getLocalVersion = function(self)
    return self.m_localVersion or -1;
end

PrivateRoomConfig.requestData = function(self, typeList)
     OnlineSocketManager.getInstance():sendMsg(PHP_PRIVATE_ROOM_CONFIG, {typeList = typeList, hall_version = kGameManager:getGameVersion(GameType.HALL), cli_ver = self:getLocalVersion()});
end

PrivateRoomConfig.getData = function(self, typeList)
    if table.isEmpty(self.m_data) then
        self:requestData(typeList);
    else
        self:execDelegate(PrivateRoomConfig.Delegate.onGetPrivatRoomConfigCallback, true, self:_getGameListByTypeList(typeList));
    end
end

-- 私人房大厅红点提示标记
PrivateRoomConfig.getOpenFlagHall = function(self)
    return self.m_openFlagHall;
end

PrivateRoomConfig.setOpenFlagHall = function(self, flag)
    self.m_openFlagHall = flag;
    self:saveData();
end

-- 私人房实时对讲提示标记
PrivateRoomConfig.getOpenFlagVideo = function(self)
    return self.m_openFlagVideo;
end

PrivateRoomConfig.setOpenFlagVideo = function(self, flag)
    self.m_openFlagVideo = flag;
    self:saveData();
end

-- 私人房积分房提示标记
PrivateRoomConfig.getOpenFlagScore = function(self)
    return self.m_openFlagScore;
end

PrivateRoomConfig.setOpenFlagScore = function(self, flag)
    self.m_openFlagScore = flag;
    self:saveData();
end

-- 判断是否开启实时对讲功能
PrivateRoomConfig.isOpenVideo = function(self, gameId, tableType)
    gameId = number.valueOf(gameId);
    tableType = number.valueOf(tableType, -1);
    for k, v in pairs(self.m_data) do        
        if gameId == v.id then
            for k1, v1 in pairs(table.verify(v.configList)) do
                if tableType == v1.tableType then
                    return v1.isOpenVideo == 1;
                end
            end
        end
    end
end

PrivateRoomConfig.isGameSupportPrivateRoomFeature = function(self, gameId, tableType)
    local ret = false;
    if gameId and tableType then
        if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_MONEY then
            ret = HallFeatureManager.getInstance():isGameSupportPrivateRoomSilverCoinFeature(gameId);
        elseif tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then
            ret = HallFeatureManager.getInstance():isGameSupportPrivateRoomGoldBarFeature(gameId);
        elseif tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE then
            ret = HallFeatureManager.getInstance():isGameSupportPrivateRoomScoreFeature(gameId);
        end
    end
    return ret;
end

PrivateRoomConfig.onGetPrivateRoomConfig = function(self, isSuccess, info, sendParam)
    Log.v("PrivateRoomConfig.onGetPrivateRoomConfig","isSuccess = ",isSuccess,"info = ",info,"sendParam = ",sendParam);
    if isSuccess then
        self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.data);
    end
    if not table.isEmpty(sendParam.typeList) then
        self:execDelegate(PrivateRoomConfig.Delegate.onGetPrivatRoomConfigCallback, isSuccess, self:_getGameListByTypeList(sendParam.typeList));
    else
        self:execDelegate(PrivateRoomConfig.Delegate.onRequestPrivatRoomConfigCallback, isSuccess, self.m_data);
    end
end

PrivateRoomConfig.loadDictData = function(self, dict)
    self.m_localVersion = dict:getInt("version", -1);
    self.m_openFlagVideo = dict:getBoolean("openFlagVideo", false);
    self.m_openFlagScore = dict:getBoolean("openFlagScore", false);
    self.m_openFlagHall = dict:getBoolean("openFlagHall", false);
    local dataStr = dict:getString("configList")
    self.m_data = self:_analyseJsonData(json.decode(dataStr) or {});
end

PrivateRoomConfig.saveDictData = function(self, dict)
    dict:setInt("version", self:getLocalVersion());
    local strData = json.encode(self.m_data or {})
    dict:setString("configList", strData)
    dict:setBoolean("openFlagVideo", self.m_openFlagVideo);
    dict:setBoolean("openFlagScore", self.m_openFlagScore);
    dict:setBoolean("openFlagHall", self.m_openFlagHall);
end

PrivateRoomConfig.getLocalDictName = function(self)
    return "PrivateRoomConfig";
end

PrivateRoomConfig.updateMemData = function(self, serverVersion, data)
    if table.isEmpty(data) then
        return;
    end

    self.m_localVersion = serverVersion;
    self.m_data = self:_analyseData(data); 
end

----------------------------------------------------------------------------------
PrivateRoomConfig._analyseJsonData = function(self, data)
    for k,v in pairs(table.verify(data)) do
        v.configList = self:_analyseJsonDataGameType(v.configList)
    end
    return data;
end

PrivateRoomConfig._analyseJsonDataGameType = function(self, data)
    local tmp = {};
    for k,v in pairs(table.verify(data)) do
        local tableType = tonumber(k) or 0;
        tmp[tableType] = v;
    end
    return tmp;
end


PrivateRoomConfig._analyseData = function(self, data)
    local tmp = {};
    for k,v in pairs(table.verify(data)) do
        local id = tonumber(k) or 0;
        local item = self:_analyseDataGame(v, id);
        table.insert(tmp, item);
    end
    return tmp; 
end

PrivateRoomConfig._analyseDataGame = function(self, data, id)
    data = table.verify(data);
    local tmp = {
        id = id,
        name = tostring(data.name or "") or "";
        configList = self:_analyseDataGameType(data.data);
    };
    return tmp;
end

PrivateRoomConfig._analyseDataGameType = function(self, data)
    local tmp = {};
    for k,v in pairs(table.verify(data)) do
        v = table.verify(v);
        local tableType = tonumber(k) or 0;
        local item = {
            baseChip = table.verify(v.jetton),
            icon = tostring(v.icon or "") or "",
            isOpenEscape = escape == 1,
            intolimit = tonumber(v.intolimit) or 0, -- 进房限制
            isOpenVideo = tonumber(v.intercom) or 0,
            tableType = tonumber(v.type) or 0,
            name = tostring(v.name or "") or "",
            rounds = table.verify(v.rounds),
            times = table.verify(v.times),
            subgameminversion = tonumber(v.subgameminversion) or 0,
            subgamemaxversion = tonumber(v.subgamemaxversion) or 0,
            gameExtParams = table.verify(v.gameExtParams), --扩展字段，交由游戏去解析(用于透传游戏特殊信息，便于自定义展示界面)
        };
        tmp[tableType] = item;
    end
    return tmp;
end

PrivateRoomConfig._getGameListByTypeList = function(self, typeList)
    local tmp = {};
    local info = Copy(self.m_data)
    for k, v in pairs(table.verify(info)) do
        local gameId = v.id;

        if not gameId then
            break;
        end

        local flag = false;
        local configList = {};
        for _, v1 in pairs(table.verify(typeList)) do
            local config = v.configList[v1];
            if not table.isEmpty(config) then
                local isGameSupport = self:isGameSupportPrivateRoomFeature(gameId, config.tableType);
                local gameVersion = kGameManager:getGameVersion(gameId);
                local subgameminversion = config.subgameminversion;
                local subgamemaxversion = config.subgamemaxversion;
                local isHallSupport = gameVersion == 0 or ((subgameminversion == 0 or gameVersion >= subgameminversion) and 
                    (subgamemaxversion == 0 or gameVersion <= subgamemaxversion));
                if isHallSupport and isGameSupport then
                    flag = true;
                    table.insert(configList, config);
                end
            end
        end

        if flag then
            v.configList = configList;
            table.insert(tmp, v);
        end
    end

    return tmp;
end

PrivateRoomConfig.s_socketCmdFuncMap = {
    [PHP_PRIVATE_ROOM_CONFIG]  = PrivateRoomConfig.onGetPrivateRoomConfig;
};


return PrivateRoomConfig;