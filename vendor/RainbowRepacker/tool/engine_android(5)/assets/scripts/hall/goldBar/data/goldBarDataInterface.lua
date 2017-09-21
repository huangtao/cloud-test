require("gameData/dataInterfaceBase");
require("common/loadingView");
require('hall/goldBar/data/goldBarData');
--local OnlineSocketManager = require('hall/common/simpleVirtualServer/simpleVirtualServer');

GoldBarDataInterface = class(DataInterfaceBase);

GoldBarDataInterface.Delegate = {
    onGetGoldBarConfig = "onGetGoldBarConfig",
    onExchangeCallBack  = "onExchangeCallBack" ,
};

GoldBarDataInterface.getInstance = function()
    if not GoldBarDataInterface.s_instance then
        GoldBarDataInterface.s_instance = new(GoldBarDataInterface);
    end

    return GoldBarDataInterface.s_instance;
end

GoldBarDataInterface.releaseInstance = function()
    delete(GoldBarDataInterface.s_instance);
    GoldBarDataInterface.s_instance = nil;
end

GoldBarDataInterface.cleanup = function()
    local lastObserverMap = GoldBarDataInterface.getInstance():getObserverMap();
    delete(GoldBarDataInterface.s_instance);
    GoldBarDataInterface.s_instance = nil;
    GoldBarDataInterface.getInstance():setObserverMap(lastObserverMap);
end

GoldBarDataInterface.ctor = function(self)
    self.m_data = new(GoldBarData,self);                     
end 

GoldBarDataInterface.dtor = function(self)
    delete(self.m_data);
    self.m_data = nil;
end


GoldBarDataInterface.getGoldBarConfig = function(self, isMustUpdate)
   return self.m_data:getGoldBarConfig(isMustUpdate);
end

GoldBarDataInterface.onGetGoldBarConfig = function(self, isSuccess, data)
    self:notify(GoldBarDataInterface.Delegate.onGetGoldBarConfig, isSuccess, data);
end

--设置金条ICON红色标志
GoldBarDataInterface.setGoldBarRedState = function(self,p_state)
                                                    --p_state 0:不显示，1：显示
    self.m_local_data.redState = ""..p_state;
    self:saveData();
end

--得到金条ICON红色标志
GoldBarDataInterface.getGoldBarRedState = function(self)
    local _state = tonumber(self.m_local_data.redState) or 1;
    return _state;
end

--是否显示过
GoldBarDataInterface.isShowed = function(self)                                           
    self.m_local_data.isShowed = self.m_local_data.isShowed or false;
    return self.m_local_data.isShowed;
end

--设置是否显示过标志
GoldBarDataInterface.setIsShowed = function(self,p_isShowed)

    self.m_local_data.isShowed = p_isShowed;
    self:saveData();

end

--兑换
GoldBarDataInterface.exchangeGoldBar = function(self,p_num)
    LoadingView.getInstance():showText("正在兑换");
    local param = {
        crystal_num = p_num;
    };

    OnlineSocketManager.getInstance():sendMsg(PHP_GOLDBAR_EXCHANGE, param, 6000);
end

--兑换回调。
GoldBarDataInterface.onExchangeCallBack = function(self, isSuccess, data, sendParam )
    LoadingView.getInstance():hidden();
    if isSuccess then
        --刷新银币
        local moneyId = RechargeDataInterface.getInstance():getPropertySilverCoinID();
        local money = UserInfoData.getInstance():getMoneyById(moneyId) - number.valueOf(data.money);
        kUserInfoData:setMoneyById(moneyId,money);
        --刷新金条
        local goldBarId = RechargeDataInterface.getInstance():getPropertyGoldBarID();
        local goldBar = UserInfoData.getInstance():getMoneyById(goldBarId) + number.valueOf(data.crystal);
        kUserInfoData:setMoneyById(goldBarId,goldBar);
        --刷新最大值
        self.m_data:refreshMaxLimit(tonumber(data.remain_money)or 0 );
    end
    self:notify(GoldBarDataInterface.Delegate.onExchangeCallBack, isSuccess, data,sendParam);
end

--获得最大值
GoldBarDataInterface.getMaxLimit = function(self)
    return self.m_data:getMaxLimit();
end

-------------------------------------------------------------------
--virtual
GoldBarDataInterface.loadDictData = function(self, dict)
    self.m_local_data = table.verify(json.decode(dict:getString("GoldBarDataInterface_Data")));
end

--virtual
GoldBarDataInterface.saveDictData = function(self, dict)
    local data = json.encode(self.m_local_data) or "";
    dict:setString("GoldBarDataInterface_Data", data);
end

GoldBarDataInterface.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "GoldBarDataInterface_Data"..self.m_userId;
end

GoldBarDataInterface.s_socketCmdFuncMap = {
    [PHP_GOLDBAR_EXCHANGE]                           = GoldBarDataInterface.onExchangeCallBack;
};
