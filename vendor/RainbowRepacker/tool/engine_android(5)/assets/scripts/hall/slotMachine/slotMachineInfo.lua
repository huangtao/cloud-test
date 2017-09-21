
if SlotMachineInfo then
    return--in case of data asymmetric
end
require("util/StringLib");
require("gameData/gameData");
require("core/eventDispatcher");

SlotMachineInfo = class(DataInterfaceBase);

SlotMachineInfo.Delegate = {
    onGetSlotMachineConfigCallBack = "onGetSlotMachineConfigCallBack";
    onGetSlotMachineRecordCallBack = "onGetSlotMachineRecordCallBack";
    onGetSlotMachineRewardCallBack = "onGetSlotMachineRewardCallBack";
    onGetSlotMachineGameSwitchCallBack = "onGetSlotMachineGameSwitchCallBack";
}

SlotMachineInfo.getInstance = function()
    if not SlotMachineInfo.s_instance then
        SlotMachineInfo.s_instance = new(SlotMachineInfo);
    end

    return SlotMachineInfo.s_instance;
end

SlotMachineInfo.releaseInstance = function()
    delete(SlotMachineInfo.s_instance);
    SlotMachineInfo.s_instance = nil;
    kSlotMachineInfo = nil;
end

function SlotMachineInfo:cleanup()
    self:releaseInstance();
    kSlotMachineInfo = SlotMachineInfo.getInstance();
end

function SlotMachineInfo:initData()
    self.m_config = {};
    self.m_record = {};
    self.m_betConfig = {};
    self.m_lastBet = -1;
    self.m_localVersion = -1;
end

function SlotMachineInfo:loadDictData(dict)
    local str = dict:getString("config");
    self.m_lastBet = dict:getDouble("last_bet", -1);
    local info = json.decode(str) or {};

    self:__updateMemData(info);
end

function SlotMachineInfo:saveDictData(dict)
    local info = json.encode(self.m_config);
    if info then
        dict:setString("config", info);
        dict:setDouble("last_bet", self.m_lastBet);
    end
end

function SlotMachineInfo:getLocalDictName()
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "slot_machine_info" .. self.m_userId;
end

--------------------------------------switch-----------------------------------

--switch
function SlotMachineInfo:requestSwitch()
    if self.m_switch==nil then--no need to request if login asigned it a value
        OnlineSocketManager.getInstance():sendMsg(PHP_SLOT_MACHINE_SWITCH);   
    end
end

function SlotMachineInfo:updateSwitch(isSuccess, info, sendParam)
    if not isSuccess or table.isEmpty(info) then
        return;
    end

    self:setSwitch(info.switch, info.autoplay)
    self:requestConfig();
end

function SlotMachineInfo:setSwitch(switch, autoPlay)
    self.m_switch = switch or 0;
    self.m_autoPlay = autoPlay or 0;
end

function SlotMachineInfo:getSwitch()
    return self.m_switch or 0;
end

--switch
function SlotMachineInfo:isOpen()
    return self.m_switch==1 and self.m_config.list and #self.m_config.list>0;
end

function SlotMachineInfo:getAutoPlay()
    return self.m_autoPlay == 1;
end

function SlotMachineInfo:requestGameSwitch()
    if self.m_gameSwitch==nil then
        OnlineSocketManager.getInstance():sendMsg(PHP_SLOT_MACHINE_GAME_SWITCH,{hall_ver = kGameManager:getGameVersion(GameType.HALL)});   
    end
end

function SlotMachineInfo:updateGameSwitch(isSuccess, info, sendParam)
    if not isSuccess or table.isEmpty(info) then
        self:notify(SlotMachineInfo.Delegate.onGetSlotMachineGameSwitchCallBack, false)
        return
    end
    self:setGameSwitch(info.switch)
    self:notify(SlotMachineInfo.Delegate.onGetSlotMachineGameSwitchCallBack, true)
end

function SlotMachineInfo:setGameSwitch(switch)
    self.m_gameSwitch = tonumber(switch) or 0;
end

function SlotMachineInfo:getGameSwitch()
    return self.m_gameSwitch or 0;
end

function SlotMachineInfo:isOpenGameSwitch()
    return self:getGameSwitch() == 1
end

---------------------------------------------------config------------------------------
--config
function SlotMachineInfo:requestConfig()
    if self.m_switch==1 then
        OnlineSocketManager.getInstance():sendMsg(PHP_SLOT_MACHINE_CONFIG, {cli_ver = self.m_localVersion}); 
    end  
end

function SlotMachineInfo:updateConfig(isSuccess, data, sendParam)
    local ret = self:__updateMemData(data);
    if ret then
        self:saveData();
    end

    self:notify(SlotMachineInfo.Delegate.onGetSlotMachineConfigCallBack, isSuccess);
end

function SlotMachineInfo:__updateMemData(data)
    if not (data and data.ver and (tonumber(data.ver) or -2)>self.m_localVersion and data.isrefresh == 1) then
        return;
    end

    self.m_localVersion = tonumber(data.ver) or -1;
    data.list = data.list or {};
    self.m_betConfig = {};
    for i = 1, #data.list do
        local info = data.list[i] or {};
        info.pid = tonumber(info.pid) or 1; --物品Id
        info.bet = tonumber(info.bet) or 1; --底注
        info.limit = tonumber(info.limit) or 0; --银币限制
        info.conf  = info.conf or {}; --中奖牌型，及赔率
        local maxRatio = 0;
        for ii = 1, #info.conf do
            info.conf[ii].combination = tostring(info.conf[ii].combination) or ""; --牌型
            info.conf[ii].ratio = tonumber(info.conf[ii].ratio) or 1;   --赔率
            maxRatio = math.max(maxRatio, info.conf[ii].ratio);
        end
        self.m_betConfig[#self.m_betConfig+1] = {pid = info.pid; bet = info.bet; max = maxRatio; limit=info.limit};
    end
    self.m_config = data;
    self.m_configUpdated = true;

    return data;
end

function SlotMachineInfo:getConfig()
    return self.m_config.list;
end

function SlotMachineInfo:getBetConfig()
    return self.m_betConfig;
end

function SlotMachineInfo:getLastBetIndex()
    if self.m_lastBet==-1 and #self.m_betConfig>0 then
        local ret = 1;
        local money = kUserInfoData:getMoney();
        for i = 2, #self.m_betConfig do
            if money>=self.m_betConfig[i].bet and self.m_betConfig[i].bet>self.m_betConfig[ret].bet and money>=self.m_betConfig[i].limit then
                ret = i;
            end 
        end
        self:setLastBet(ret);
    elseif self.m_lastBet==-1 then
        return 1;
    end
    return self.m_lastBet;
end

function SlotMachineInfo:setLastBet(bet)
    if self.m_lastBet~=bet then
        self.m_lastBet = bet;
        local dictName = self:getLocalDictName();
        if not dictName then
            return;
        end

        local dict = new(Dict, dictName);
        dict:setDouble("last_bet", self.m_lastBet);
        dict:save();
        delete(dict);
    end
end

function SlotMachineInfo:isConfigUpdated()
    return self.m_configUpdated==true;
end

function SlotMachineInfo:setConfigUpdated(flag)
    self.m_configUpdated = flag;
end

function SlotMachineInfo:getBetLimit(index)
    local bet = self.m_betConfig[index] or {};
    return bet.limit or 0;
end

-- money is enough but in the safebox
function SlotMachineInfo:isMoneyLocked(index)
    index = index or 1;
    local total = kUserInfoData:getTotalMoney();
    local bet = self.m_betConfig[index] or {};
    return total>=(bet.bet or 1) and total>=(bet.limit or 0) and (bet.pid or 1)== UserPropertyIsolater.getInstance():getPropertySilverCoinID();
end

function SlotMachineInfo:isMoneyEnough(index)
    index = index or 1;
    local bet = self.m_betConfig[index] or {};
    local cash = kUserInfoData:getMoney();
    return cash>=(bet.bet or 1) and cash>=(bet.limit or 0);
end


----------------------------------------------------reward--------------------------------------

--reward
function SlotMachineInfo:requestReward(index, lucky)
    index = index or 1;
    local param = self.m_betConfig[index] or {}; --regard as a timer when no config 
    local mid = kUserInfoData:getUserId();
    OnlineSocketManager.getInstance():sendMsg(PHP_SLOT_MACHINE_REWARD, {mid=mid; pid=param.pid; bet=param.bet;luckCard=lucky or 1;});   
end

function SlotMachineInfo:updateReward(isSuccess, data, sendParam)
    if not isSuccess or table.isEmpty(data) then
        self:notify(SlotMachineInfo.Delegate.onGetSlotMachineRewardCallBack, false, GameString.get("slotMachineCheckNet") );
        return;
    end

    if data.status == 1000 then
        data.rewardMoney = tonumber(data.rewardMoney) or 0;
        data.rewardCardType = tostring(data.rewardCardType) or "";
        data.pid = tonumber(data.pid) or 0;
        local combination = string.split(data.rewardCardType, ",") or {};
        data.combination = {};
        for i = 1, #combination do
            data.combination[i] = tonumber(combination[i]);
        end

        self.m_lastReward = data;

        if not table.isEmpty(data.up) then
            if data.pid == UserPropertyIsolater.getInstance():getPropertySilverCoinID() then
                kUserInfoData:setMoney(data.up.money);
            elseif data.pid == UserPropertyIsolater.getInstance():getPropertyGoldBarID() then
                kUserInfoData:setCrystal(data.up.totalCrystal);
            end    
        end        

        self:notify(SlotMachineInfo.Delegate.onGetSlotMachineRewardCallBack, true, Copy(self.m_lastReward) );
    elseif data.status == 1001 then
        local msg = string.format(GameString.get("slotMachineLossOfProp"), "");
        self:notify(SlotMachineInfo.Delegate.onGetSlotMachineRewardCallBack, false, msg);
    else
        self:notify(SlotMachineInfo.Delegate.onGetSlotMachineRewardCallBack, false, GameString.get("slotMachineGetError"));
    end
end

function SlotMachineInfo:getLastReward()
    return self.m_lastReward;
end

function SlotMachineInfo:clearLastReward()
    self.m_lastReward = nil;
end

------------------------------------------record------------------------------

--record
function SlotMachineInfo:requestRecord()
    local mid = kUserInfoData:getUserId();
    OnlineSocketManager.getInstance():sendMsg(PHP_SLOT_MACHINE_RECORD, {mid = mid});   
end

function SlotMachineInfo:updateRecord(isSuccess, data, sendParam)
    if not isSuccess then
        self:notify(SlotMachineInfo.Delegate.onGetSlotMachineRecordCallBack, false);
        return;
    end
    
    data = table.verify(data);
    for i = 1, #data do
        local list = data[i];
        list.bet = tonumber(list.bet) or 0;
        list.isluck = tonumber(list.isluck) or 0;
        list.pid = tonumber(list.pid) or 1;
        list.combination = tostring(list.combination) or "";
        list.ratio = tonumber(list.ratio) or 0;
        list.reward = tonumber(list.reward) or 0;
        list.time = tonumber(list.time) or 0;
    end
    self.m_record = data;
    
    self:notify(SlotMachineInfo.Delegate.onGetSlotMachineRecordCallBack, true, Copy(data) );
end

function SlotMachineInfo:getRecord()
    return Copy(self.m_record);
end


SlotMachineInfo.s_socketCmdFuncMap = {
    [PHP_SLOT_MACHINE_SWITCH] = SlotMachineInfo.updateSwitch;
    [PHP_SLOT_MACHINE_CONFIG] = SlotMachineInfo.updateConfig;
    [PHP_SLOT_MACHINE_REWARD] = SlotMachineInfo.updateReward;
    [PHP_SLOT_MACHINE_RECORD] = SlotMachineInfo.updateRecord;
    [PHP_SLOT_MACHINE_GAME_SWITCH] = SlotMachineInfo.updateGameSwitch;
};

kSlotMachineInfo = SlotMachineInfo.getInstance();
