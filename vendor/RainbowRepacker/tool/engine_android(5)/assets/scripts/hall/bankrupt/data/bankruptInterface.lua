require("core/object");
require("gameData/dataInterfaceBase");
require("hall/onlineSocket/onlineSocketManager");
require("hall/bankrupt/socket/bankruptSocketCmd");
require("hall/bankrupt/socket/bankruptSocketReader");
require("hall/bankrupt/socket/bankruptSocketWriter");

BankruptDataInterface = class(DataInterfaceBase);

BankruptStatus = {
 	Fake = -1;
 	None = 0;
 	Real = 1;
};

BankruptDataInterface.Delegate = {	
	onGetBankruptConfig = "onGetBankruptConfig";
	onGetBankruptCount = "onGetBankruptCount";
	onGetBankruptMoney = "onGetBankruptMoney";
    onFreshView = "_checkBankrupt";
};

BankruptDataInterface.getInstance = function()
    if not BankruptDataInterface.s_instance then
        BankruptDataInterface.s_instance = new(BankruptDataInterface);
    end

    return BankruptDataInterface.s_instance;
end

BankruptDataInterface.cleanup = function()
	local lastObserverMap = BankruptDataInterface.getInstance():getObserverMap();
	delete(BankruptDataInterface.s_instance);
	BankruptDataInterface.s_instance = nil;
	
	kBankruptDataInterface = BankruptDataInterface.getInstance();
	kBankruptDataInterface:setObserverMap(lastObserverMap);
end

-----------------------------------------------------------------
BankruptDataInterface.ctor = function(self)
	self.m_bankruptConfig = {};

	self:_initSocketManager();		
	self:_createSocketReader();
	self:_createSocketWriter();
end

BankruptDataInterface.dtor = function(self)
	self.m_bankruptConfig = {};

	self.m_isTouched = nil;
	self.m_lastRefreshTime = nil;

    self.m_socket:removeSocketReader(self.m_socketReader);
    self.m_socket:removeSocketWriter(self.m_socketWriter);

	delete(self.m_socketReader);
	self.m_socketReader = nil;
	delete(self.m_socketWriter);
	self.m_socketWriter = nil;
end
-----------------------------------------------------------------
--获取破产配置
BankruptDataInterface.getBankruptConfig = function(self)
	if self:_isNeedRefresh() then
		self.m_socket:sendMsg(SEND_BANKRUPT_CONFIG);
	end
	return self:_formatData(self.m_bankruptConfig); 
end

--获取破产次数
BankruptDataInterface.requestBankruptCount = function(self,hasShard)
	hasShard = hasShard or 0;
    self.m_socket:sendMsg(SEND_BANKRUPT_COUNT,{userId = kUserInfoData:getUserId() ,hasShard = hasShard}); 
end

--获取破产补助
BankruptDataInterface.requestBankruptMoney = function(self)
	self.m_socket:sendMsg(SEND_BANKRUPT_MONEY,kUserInfoData:getUserId());
end

--获取破产下限
BankruptDataInterface.getBankruptLowestMoney = function(self)
	self:getBankruptConfig();
	return self.m_local_data.minLimit or  RegionConfigDataInterface.getInstance():getDefautBankruptMoney();
end 

--获取破产等待时间的配置
BankruptDataInterface.getBankruptTimesInterval = function(self)
	local config = self:getBankruptConfig();
	config.intervals = table.verify(config.intervals);

	return config.intervals;
end 
-----------------------------------------------------------------
--此次破产的破产补助
BankruptDataInterface.setCurBankruptReward = function(self,money)
	self.m_curBankruptReward = money;
end

--当前是否可以免CD 0:否，1：可以
BankruptDataInterface.getCurBankruptReward = function(self)
	return tonumber(self.m_curBankruptReward) or 0;
end

--当前是否可以免CD
BankruptDataInterface.setCurCanCutCD = function(self,canCutCD)
	self.m_curCanCutCD = canCutCD;
end

BankruptDataInterface.getCurCanCutCD = function(self)
	return tonumber(self.m_curCanCutCD) or 0;
end

--当前第几次破产
BankruptDataInterface.setCurBankruptCount = function(self,curBankruptCount)
	self.m_curBankruptCount = curBankruptCount;
end

BankruptDataInterface.getCurBankruptCount = function(self)
	return self.m_curBankruptCount or 0;
end

--当前是否还有破产补助可以领
BankruptDataInterface.isBankruptRewardRemain = function(self)
	local curCount = self:getCurBankruptCount();
	local intervals = self:getBankruptTimesInterval();

	return curCount <= #intervals;
end

--当前离领取破产补助的剩余时间
BankruptDataInterface.setCurLeftTime = function(self,time)
	self.m_curLeftTime = time;
end 

BankruptDataInterface.getCurLeftTime = function(self) 
	return self.m_curLeftTime or 30*60;
end 

--本次破产需等待的总时间
BankruptDataInterface.getCurTotalTime = function(self) 
	local temp = self:getCurBankruptCount();
 
	return self:getTotalTimeByCount(temp);
end 

--第n次破产需等待的总时间（秒）
BankruptDataInterface.getTotalTimeByCount = function(self,count)
	local intervals = self:getBankruptTimesInterval();
	local temp = #intervals;

	count = tonumber(count) or 1;
	count = count <= 1 and 1 or count;
	count = count >= temp and temp or count;

	local time = intervals[count];
	time = time or 30;
	local totalTime = time*60;

	return totalTime;
end

BankruptDataInterface.setVipActualTime = function(self,acturalTime)
	self.m_vipActuralTime = acturalTime;
end

BankruptDataInterface.getVipActualTime = function(self)
	return tonumber(self.m_vipActuralTime) or 0;
end
-----------------------------------------------------------------
--自己的破产状态
-- 0:没有破产；1：真破产；-1：假破产
BankruptDataInterface.getBankruptStatus = function(self)
	if not kLoginDataInterface:getIsLoginSuccess() then
		return BankruptStatus.None;
	end 

	local totalMoney = kUserInfoData:getTotalMoney();
	local curMoney = kUserInfoData:getMoney();
	local lowestMoney = self:getBankruptLowestMoney();

	if curMoney >= lowestMoney then 
		return BankruptStatus.None;
	else
		if totalMoney >= lowestMoney then 
			return BankruptStatus.Fake;
		else 
			return BankruptStatus.Real;
		end
	end 

	return BankruptStatus.None;
end 

--根据金币检查是否破产
BankruptDataInterface.checkIsBankrupt = function(self,money)
	money = number.valueOf(money);
	local lowestMoney = number.valueOf(self:getBankruptLowestMoney());
	if money <= 0 then
		return true;
	end
	if money < lowestMoney then
		return true;
	end
	return false;
end

BankruptDataInterface.isMineBankrupt = function(self)
	local money = kUserInfoData:getMoney();
	return self:checkIsBankrupt(money);
end
-----------------------------------------------------------------------------
BankruptDataInterface.setBankruptPaySceneSatus = function(self,status)
	self.m_isHideBankruptPayInRoom = status == 0; --//(房间里面)是否破产时弹出充值界面 0:不弹 1:弹
end

BankruptDataInterface.IsShowBankruptPayInRoom = function(self)
	return not self.m_isHideBankruptPayInRoom;
end
-----------------------------------------------------------------
BankruptDataInterface._onGetBankruptConfig = function(self,config)
	Log.v("BankruptDataInterface._onGetBankruptConfig","packetInfo = ",config);
	self.m_isTouched = true;

	config.lowestMoney = config.lowestMoney or self.m_local_data.minLimit or RegionConfigDataInterface.getInstance():getDefautBankruptMoney();
	if (tonumber(config.lowestMoney) or 0) ~=  (tonumber(self.m_local_data.minLimit) or 0) then
		self.m_local_data.minLimit = tonumber(config.lowestMoney) or 0;
		self:saveData();
	end 

	self.m_bankruptConfig = self:_formatData(config);

	self:notify(BankruptDataInterface.Delegate.onGetBankruptConfig,self.m_bankruptConfig);
end

BankruptDataInterface._onGetBankruptCount = function(self,packetInfo)
	Log.v("BankruptDataInterface._onGetBankruptCount","packetInfo = ",packetInfo);
	if not kLoginDataInterface:getIsLoginSuccess() then
		return;
	end 

	self:_setCurBankruptInfo(packetInfo)

	self:notify(BankruptDataInterface.Delegate.onGetBankruptCount);
end

BankruptDataInterface._setCurBankruptInfo = function(self,info)
	info = table.verify(info);
	info.curCount = tonumber(info.curCount) or 0;
	info.leftTime = tonumber(info.leftTime) or 0;
	info.vipExpires = tonumber(info.vipExpires) or 0;
	info.vipActualTime = tonumber(info.vipActualTime) or 0;
	info.get_money = tonumber(info.get_money) or 0;
	info.shard_cd_flag = tonumber(info.shard_cd_flag) or 0;

	self:setCurBankruptCount(info.curCount);
	self:setCurLeftTime(info.leftTime);
	self:setVipActualTime(info.vipActualTime);
	self:setCurBankruptReward(info.get_money);
	self:setCurCanCutCD(info.shard_cd_flag);

	local isPayUser = kUserInfoData:getIsPayUser();
	if info.vipExpires == 0 or info.vipExpires < -1 then --过期--TODO
		if isPayUser then 
			kUserInfoData:setIdentity(UserInfoData.eIdentity.Rmb);
		else 
			kUserInfoData:setIdentity(UserInfoData.eIdentity.Normal);
		end 
		kUserInfoData:setVipTime(0);		
	else --没有过期
		if isPayUser then 
			kUserInfoData:setIdentity(UserInfoData.eIdentity.RmbAndVip);
		else 
			kUserInfoData:setIdentity(UserInfoData.eIdentity.Vip);
		end
		kUserInfoData:setVipTime(info.vipExpires);
	end
end

BankruptDataInterface._onGetBankruptMoney = function(self,packetInfo)
	Log.v("BankruptDataInterface._onGetBankruptMoney","packetInfo = ",packetInfo);
	local flag = packetInfo.flag;
	local isSuccess = flag == 1;
	local errType = packetInfo.errType;
	if isSuccess then 
		self:setCurBankruptReward(packetInfo.brokeMoney);
		-- local money = packetInfo.money or kUserInfoData:getMoney(); --!!!此处server发过的money是不准确的 不要用
		local money = kUserInfoData:getMoney() + packetInfo.brokeMoney;
		kUserInfoData:setMoney(money);
	else 
		--self:setCurBankruptReward(0);	
	end

	--TODO
	self:notify(BankruptDataInterface.Delegate.onGetBankruptMoney,isSuccess,errType);
end

-----------------------------------------------------------------
BankruptDataInterface._initSocketManager = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
end 

BankruptDataInterface._createSocketReader = function(self)
	self.m_socketReader = new(BankruptSocketReader);
	self.m_socket:addSocketReader(self.m_socketReader);
end

BankruptDataInterface._createSocketWriter = function(self)
	self.m_socketWriter = new(BankruptSocketWriter);
	self.m_socket:addSocketWriter(self.m_socketWriter);
end

BankruptDataInterface._isNeedRefresh = function(self)
	if self.m_isTouched then 
		return false;
	else
		if not self.m_lastRefreshTime then 
			self.m_lastRefreshTime = os.time();
			return true;
		else 
			local curTime = os.time();
			local lastTime = self.m_lastRefreshTime;
			local time = curTime - lastTime;
			if time >= 30 then 
				self.m_lastRefreshTime = os.time();
				return true
			else 
				return false;
			end 
		end
	end 
end 

BankruptDataInterface._formatData = function(self,info)
	info = table.verify(info);
	info.lowestMoney = tonumber(info.lowestMoney) or RegionConfigDataInterface.getInstance():getDefautBankruptMoney();
	info.curBankruptTime = tonumber(info.curBankruptTime) or 0;
	info.intervals = table.verify(info.intervals);

	return info;
end

BankruptDataInterface.freshView = function(self) --刷新界面
    self:notify(BankruptDataInterface.Delegate.onFreshView);
end

BankruptDataInterface.isHaveDialog = function(self) --刷新界面
    return self.m_isHaveDialog or false;
end

BankruptDataInterface.setIsHaveDialog = function(self,p_isHaveDialog)
    self.m_isHaveDialog = p_isHaveDialog;
end

-------------------------------------------------------------------
--virtual
BankruptDataInterface.loadDictData = function(self, dict)
    self.m_local_data = table.verify(json.decode(dict:getString("BankruptDataInterface_Data")));
end

--virtual
BankruptDataInterface.saveDictData = function(self, dict)
    local data = json.encode(self.m_local_data) or "";
    dict:setString("BankruptDataInterface_Data", data);
end

BankruptDataInterface.getLocalDictName = function(self)
    self.m_userId = self.m_userId or kUserInfoData:getUserId();
    return "BankruptDataInterface_Data"..self.m_userId;
end

-----------------------------------------------------------------------------
BankruptDataInterface.s_socketCmdFuncMap = {
	[RESPONSE_BANKRUPT_CONFIG]				= BankruptDataInterface._onGetBankruptConfig;
	[RESPONSE_BANKRUPT_MONEY] 				= BankruptDataInterface._onGetBankruptMoney;
	[RESPONSE_BANKRUPT_COUNT] 				= BankruptDataInterface._onGetBankruptCount;
};
-----------------------------------------------------------------------------
kBankruptDataInterface = BankruptDataInterface.getInstance();