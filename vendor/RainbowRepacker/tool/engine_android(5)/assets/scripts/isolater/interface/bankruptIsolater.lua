require("gameData/dataInterfaceBase");
require("hall/bankrupt/data/bankruptInterface");
require("hall/gameData/pay/payConfig");
require("hall/userInfo/data/userInfoData");

BankruptIsolater = class(DataInterfaceBase);

BankruptIsolater.Delegate = {
	 
};

BankruptIsolater.getInstance = function()
	if not BankruptIsolater.s_instance then
		BankruptIsolater.s_instance = new(BankruptIsolater); 
	end
	return BankruptIsolater.s_instance;
end

BankruptIsolater.ctor = function(self)
	kBankruptDataInterface:setObserver(self);
end

BankruptIsolater.dtor = function(self)
	kBankruptDataInterface:clearObserver(self);
end
------------- 破产相关 -----------------------------------------------
--检查是否破产
--接入金条场后游戏中尽量不用使用该接口（700大厅+）
--游戏中最好使用RoomPropertyData.checkIsBankrupt
BankruptIsolater.checkIsBankrupt = function(self,money,propertyId)
	propertyId = propertyId or UserPropertyIsolater.getInstance():getPropertySilverCoinID();
	if propertyId == UserPropertyIsolater.getInstance():getPropertySilverCoinID() then 
		return kBankruptDataInterface:checkIsBankrupt(money);
	else
		return false;
	end 
end

--房间里面是否显示破产
BankruptIsolater.isShowBankruptPayInRoom = function(self)
	return kBankruptDataInterface:IsShowBankruptPayInRoom();
end

--判断自己是否破产
--接入金条场后游戏中不用使用该接口（700大厅+）
--游戏中麻烦使用RoomPropertyData.isMineBankrupt
BankruptIsolater.isMineBankrupt = function(self)
	local money = kUserInfoData:getMoney();
	return self:checkIsBankrupt(money);
end

--获取破产支付的参数
BankruptIsolater.getRoomBankruptParams = function(self)
	local param = {
		scene = PayConfig.eGoodsListId.RoomPay,
		gameid = kGameManager:getCurGameId();
		level = kGameManager:getCurRoomLevelId();
	};
	if kUserInfoData:getIsPayPrivilege() then 
		param.difMoney = 0;
		local levelData = kGameManager:getGameLevelInfo(param.gameid,param.level);
		if levelData.minMoney then
	    	param.difMoney = number.valueOf(levelData.minMoney) - kUserInfoData:getMoney();
	    	param.difMoney = param.difMoney <= 0 and 0 or param.difMoney;
	    end						
	end
	return param;
end
------------- 破产相关 -----------------------------------------------