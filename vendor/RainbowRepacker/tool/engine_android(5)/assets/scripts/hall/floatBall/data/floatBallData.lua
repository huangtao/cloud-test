
local FloatBallData = class(GameData);

FloatBallData.Delegate = {
    onGetFloatBallConfigCallBack = "onGetFloatBallConfigCallBack";
}

FloatBallData.s_tryCount = 3;

FloatBallData.s_maxShowCount = 5;
FloatBallData.s_minShowCount = 3;

FloatBallData.initData = function(self)
    self.m_redBubbleShow = false;
    self.m_config = {};
end

FloatBallData.requestData = function(self, isForceUpdate)
    if not self.m_isTouched or table.isEmpty(self.m_config) or isForceUpdate then
        local param = { 
            hall_version = kGameManager:getGameVersion(GameType.HALL),
            version = kClientInfo:getApkVersion() 
        };
        OnlineSocketManager.getInstance():sendMsg(PHP_GET_FLOATBALL_CONFIG, param);
    end
end

FloatBallData.getFloatBallConfig = function(self)
    self:requestData();

    self:_filterFloatBallConfig();

    local maxShowCount = self:_getMaxShowCount();
    local list = {};
    for k, v in ipairs(self.m_config) do
        if #list < maxShowCount then
            table.insert(list, v);
        else
            break;
        end
    end

    return list;
end

FloatBallData._filterFloatBallConfig = function(self)
    local newConfig = {};
    for k, v in pairs(self.m_config) do
        if self:_isValidInfo(v) then
            table.insert(newConfig, v);
        end
    end

    self.m_config = newConfig;
end

FloatBallData._isValidInfo = function(self, itemInfo)
    if itemInfo.starttime <= 0 then
        return true;
    else
        --开始时间小于当前server时间
        if itemInfo.starttime < kAppData:getRightTimeWithServer() then
            return false;
        end
    end

    return true;
end

FloatBallData._getMaxShowCount = function(self)
    return FloatBallData.s_maxShowCount;
end

FloatBallData.onGetFloatBallConfigCallBack = function(self, isSuccess, info)
   if  isSuccess then
        self.m_curTryCount = 0;
        self:updateData(true, info);
        self:execDelegate(FloatBallData.Delegate.onGetFloatBallConfigCallBack, true);
   else
        self.m_curTryCount = number.valueOf(self.m_curTryCount, 0) + 1;
        if self.m_curTryCount <= FloatBallData.s_tryCount then
            self:requestData();
        end
   end
end

--@override
FloatBallData.updateMemData = function(self, info)
    self:_analysisData(info);
end

FloatBallData._analysisData = function(self, info)
    local newConfig = {};
    for k, v in pairs(info) do
        v.btnid = number.valueOf(v.id) or 0;
        v.image = string.valueOf(v.image);
        v.jumpcode = string.valueOf(v.jumpcode);
        v.rank =  number.valueOf(v.rank, 100);
        v.title = string.valueOf(v.title);
        v.desc = string.valueOf(v.desc);
        v.starttime = number.valueOf(v.starttime); --时间小于0，则代表永远有效
        table.insert(newConfig, v);
    end

    table.sort(newConfig, function(a, b)
        if a and b then
            return a.rank < b.rank;
        end
    end);

    self:_checkHasNewItem(self.m_config, newConfig);

    self.m_config = newConfig;
end

FloatBallData._checkHasNewItem = function(self, config, newConfig)
    for k, v in pairs(newConfig) do
        local finded = false;
        for k1, v1 in pairs(config) do
            if v.btnid == v1.btnid then
                finded = true;
                break;
            end
        end

        if not finded then
            self.m_redBubbleShow = true;
            return;
        end
    end
end

FloatBallData.setRedBubbleStatus = function(self, isShow)
    self.m_redBubbleShow = isShow;

    self:saveData();
end

FloatBallData.getRedBubbleStatus = function(self)
    return self.m_redBubbleShow;
end

FloatBallData.loadDictData = function(self, dict)
    local strConfig = dict:getString("config");
    local config = json.decode(strConfig);
    if not table.isEmpty(config) then
        self.m_config = config;
    end

    local iBubbleShow = dict:getInt("redBubbleShow", 0);
    self.m_redBubbleShow = (iBubbleShow == 1) and true or false;
end

FloatBallData.saveDictData = function(self, dict)
    local strConfig = json.encode(self.m_config);
    if strConfig then
        dict:setString("config", strConfig);
    end

    dict:setInt("redBubbleShow", self.m_redBubbleShow and 1 or 0);
end

FloatBallData.getLocalDictName = function(self)
    return "FloatBallData";
end

FloatBallData.s_socketCmdFuncMap = {
    [PHP_GET_FLOATBALL_CONFIG] = FloatBallData.onGetFloatBallConfigCallBack;
}

return FloatBallData;

