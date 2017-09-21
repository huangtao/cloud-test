require("gameData/gameData");
require("core/dict");

local MoraGameConfig = class(GameData);

MoraGameConfig.Delegate = {
    onRequestConfigCallback = "onRequestConfigCallback";
    onRequestRecordCallback = "onRequestRecordCallback";
};

MoraGameConfig.ctor = function(self)   
end

MoraGameConfig.dtor = function(self)
end

MoraGameConfig.initData = function(self)
    self.m_configData = {};
    self.m_localVersion = -1;
    self.m_lastBet = 1;
    self.m_rewardData = {};
end

MoraGameConfig.getLocalVersion = function(self)
    return self.m_localVersion or -1;
end

MoraGameConfig.getLastBet = function (self)
    return self.m_lastBet;
end

MoraGameConfig.setLastBet = function (self, lastBet)
     if self.m_lastBet ~= lastBet then
        self.m_lastBet = lastBet;
        local dictName = self:getLocalDictName();
        if not dictName then
            return;
        end
        local dict = new(Dict, dictName);
        dict:setInt("lastBet", self.m_lastBet, 1);
        dict:save();
        delete(dict);
    end
end

MoraGameConfig.requestSwitch = function (self)
    if self.m_switch == nil then
        OnlineSocketManager.getInstance():sendMsg(PHP_MORA_GAME_SWITCH); 
    end
end

MoraGameConfig.onSwitchCallBack = function (self, isSuccess, data)
    self:log("onSwitchCallBack","isSuccess = ",isSuccess,"data = ", data);
    if not isSuccess or table.isEmpty(data) then
        return;
    end
    self.m_switch = data.info;
end

MoraGameConfig.isOpen = function(self)
   return self.m_switch == 1;
end

MoraGameConfig.requestConfig = function(self)
    local param = {
        ["cli_ver"] = self:getLocalVersion();
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_MORA_GAME_CONFIG, param);
end

MoraGameConfig.getConfig = function (self)
    return self.m_configData or {};
end

MoraGameConfig.onConfigCallBack = function (self, isSuccess, info)
    self:log("onConfigCallBack","isSuccess = ",isSuccess,"info = ", info);
    if isSuccess and not table.isEmpty(info) then
        self:updateDataByCompareVersion(info.ver, info.isrefresh, info.data);
    else
        self:execDelegate(MoraGameConfig.Delegate.onRequestConfigCallback, false);    
    end
end

MoraGameConfig.requestReward = function (self, bet, gesture)
    local param = {
        ["bet"] = bet;
        ["gesture"] = gesture;
    };
    OnlineSocketManager.getInstance():sendMsg(PHP_MORA_GAME_REWARD, param);
end

MoraGameConfig.onRewardCallBack = function (self, isSuccess, info)
    self:log("onRewardCallBack","isSuccess = ",isSuccess,"info = ", info);
    if isSuccess and not table.isEmpty(info) then
        self.m_rewardData = self:__analyseRewardData(info); 
        if self.m_rewardData.status == 1000 then
            kUserInfoData:setMoneyById(self.m_rewardData.moneytype, self.m_rewardData.money);
        elseif self.m_rewardData.status == 1001 then
            Toast.getInstance():showText("亲 您的道具数量不足!", 50, 30, kAliginCenter, "", 30, 250, 210, 70);
        else
            Toast.getInstance():showText("出错了，请重试", 50, 30, kAliginCenter, "", 30, 250, 210, 70);
        end
    end
end

MoraGameConfig.__analyseRewardData = function (self, info)
    local data = {
        status = number.valueOf(info.status);
        rewardMoney = number.valueOf(info.rewardMoney);
        computer = number.valueOf(info.computer);
        iswin = number.valueOf(info.iswin);
        moneytype = number.valueOf(info.moneytype);
        gesture = number.valueOf(info.gesture);
        money = number.valueOf(info.money);
    };
    return data;
end

MoraGameConfig.getRewardData = function (self)
    return self.m_rewardData or {};
end

MoraGameConfig.setRewardData = function (self)
    self.m_rewardData = {};
end

MoraGameConfig.requestRecord = function (self)
    OnlineSocketManager.getInstance():sendMsg(PHP_MORA_GAME_RECORD);
end

MoraGameConfig.onRecordCallBack = function (self, isSuccess, info)
    self:log("onRecordCallBack","isSuccess = ",isSuccess,"info = ", info);
    if isSuccess then
        local data = self:__analyseRecordList(info);
        self:execDelegate(MoraGameConfig.Delegate.onRequestRecordCallback, isSuccess, data);
    else
        self:execDelegate(MoraGameConfig.Delegate.onRequestRecordCallback, false);
    end
end



MoraGameConfig.__analyseRecordList = function (self, data)
    local tmp = {};
    for k,v in pairs(table.verify(data)) do
        local item = self:__analyseRecordData(v);
        table.insert(tmp, 1, item);
    end
    return tmp;
end

MoraGameConfig.__analyseRecordData = function (self,data)
    local item = {
        moneytype = number.valueOf(data.moneytype);
        gesture = number.valueOf(data.gesture);
        iswin = number.valueOf(data.iswin);
        reward = number.valueOf(data.reward);
    };
    return item;
end

MoraGameConfig.loadDictData = function(self, dict)
    self.m_localVersion = dict:getInt("version", -1);
    self.m_lastBet = dict:getInt("lastBet", 1)
    local strData = dict:getString("config");
    self.m_configData = json.decode(strData);
end

MoraGameConfig.saveDictData = function(self, dict)
    dict:setInt("version", self:getLocalVersion());
    dict:setInt("lastBet", self:getLastBet());
    local strData = json.encode(self.m_configData or {})
    dict:setString("config", strData)
end

MoraGameConfig.getLocalDictName = function(self)
     self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "MoraGameConfig" .. self.m_userId;
end

MoraGameConfig.updateMemData = function(self, serverVersion, data)
    if table.isEmpty(data) then
        return;
    end
    self.m_localVersion = serverVersion;
    self.m_configData = self:__analyseConfigList(data); 
    self:execDelegate(MoraGameConfig.Delegate.onRequestConfigCallback, true, self.m_configData);
end

MoraGameConfig.__analyseConfigList = function (self, data)
    local tmp = {};
    for k,v in pairs(table.verify(data)) do
        local item = self:__analyseConfigData(v);
        table.insert(tmp, item);
    end
    return tmp;
end

MoraGameConfig.isMoneyEnough = function (self, index, isPlay)
    if table.isEmpty(self.m_configData) then
        return false;
    end
    local betData = self.m_configData[index];
    local cash = kUserInfoData:getMoneyById(betData.moneytype);

    local leastMoney = math.max(betData.bet, betData.moneylimit);
    if betData.moneytype == RechargeDataInterface.getInstance():getPropertySilverCoinID() then
        local bankruptMoney = BankruptDataInterface.getInstance():getBankruptLowestMoney();
        leastMoney = math.max( bankruptMoney + betData.bet, betData.moneylimit);
    end

    if cash < leastMoney then
        if isPlay then
            local propertyAlias = RechargeDataInterface.getInstance():getProperyAliasById(betData.moneytype);
            Toast.getInstance():showText("您需要达到"..leastMoney.. propertyAlias .."，才可以继续猜拳。", 50, 30, kAliginCenter, "", 30, 250, 210, 70)
        end
    else
        return true;
    end
end

MoraGameConfig.__analyseConfigData = function(self, data)
    local item = {
        bet = number.valueOf(data.bet);
        moneylimit = number.valueOf(data.moneylimit);
        moneytype = number.valueOf(data.moneytype);
    };
    return item; 
end

MoraGameConfig.log = function(self, ...)
    Log.v("MoraGameConfig", ...);
end

MoraGameConfig.s_socketCmdFuncMap = {
    [PHP_MORA_GAME_SWITCH]  = MoraGameConfig.onSwitchCallBack;
    [PHP_MORA_GAME_CONFIG]  = MoraGameConfig.onConfigCallBack;
    [PHP_MORA_GAME_REWARD]  = MoraGameConfig.onRewardCallBack;
    [PHP_MORA_GAME_RECORD]  = MoraGameConfig.onRecordCallBack;
};

return MoraGameConfig;