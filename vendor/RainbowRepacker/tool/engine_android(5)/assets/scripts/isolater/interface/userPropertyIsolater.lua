require("gameData/dataInterfaceBase");
require("hall/userInfo/data/userInfoData");

--用户资产信息
UserPropertyIsolater = class(DataInterfaceBase);

UserPropertyIsolater.Delegate = {
	refreshUserProperty = "refreshUserProperty";
};

UserPropertyIsolater.getInstance = function()
	if not UserPropertyIsolater.s_instance then
		UserPropertyIsolater.s_instance = new(UserPropertyIsolater); 
	end
	return UserPropertyIsolater.s_instance;
end

UserPropertyIsolater.ctor = function(self)
	kUserInfoData:setObserver(self);
end

UserPropertyIsolater.dtor = function(self)
	kUserInfoData:clearObserver(self);
end
------------------------------------------------------------------------
--银币
UserPropertyIsolater.setMoney = function(self,money)
	kUserInfoData:setMoney(money);
end
UserPropertyIsolater.getMoney = function(self)
	return kUserInfoData:getMoney();
end

--保险箱中的银币
UserPropertyIsolater.setSafeBoxCurMoney = function(self,money)
    kUserInfoData:setSafeBoxCurMoney(money);
end 
UserPropertyIsolater.getSafeBoxCurMoney = function(self)
    return kUserInfoData:getSafeBoxCurMoney();
end

UserPropertyIsolater.setSafeBoxCurCrystal = function(self,crystal)
    kUserInfoData:setSafeBoxCurCrystal(crystal);
end 
UserPropertyIsolater.getSafeBoxCurCrystal = function(self)
    return kUserInfoData:getSafeBoxCurCrystal();
end

--用户总银币
UserPropertyIsolater.getTotalMoney = function(self)  
    return kUserInfoData:getTotalMoney();
end

UserPropertyIsolater.getTotalCrystal = function(self)  
    return kUserInfoData:getTotalCrystal();
end

--钻石
UserPropertyIsolater.setDiamond = function(self,diamond)
	kUserInfoData:setDiamond(diamond);
end
UserPropertyIsolater.getDiamond = function(self)
	return kUserInfoData:getDiamond();
end

--金条
UserPropertyIsolater.setCrystal = function(self, crystal)
	kUserInfoData:setCrystal(crystal);
end
UserPropertyIsolater.getCrystal = function(self)
	return kUserInfoData:getCrystal();
end
------------------------------------------------------------------------
--刷新用户资产
UserPropertyIsolater.refreshUserProperty = function(self,propertyType,curNum,lastNum)
	self:notify(UserPropertyIsolater.Delegate.refreshUserProperty,propertyType,curNum,lastNum);
end

--检查资产类型是否是银币
UserPropertyIsolater.checkIsGold = function(self,propertyType)
    return propertyType == self:getPropertySilverCoinID();
end

--检查资产类型是否是金条
UserPropertyIsolater.checkIsCrystal = function(self,propertyType)
    return propertyType == self:getPropertyGoldBarID();
end

--检查资产类型是否是钻石
UserPropertyIsolater.checkIsDiamond = function(self,propertyType)
	return propertyType == self:getPropertyDiamondID();
end

--根据后台服务器给的货币ID设置货币数量
--默认为银币
UserPropertyIsolater.setMoneyById = function(self, moneyId, money)
    moneyId = moneyId or self:getPropertySilverCoinID();
    kUserInfoData:setMoneyById(moneyId, money);
end

--根据后台服务器给的货币ID获取货币数量   isAllGold：专门为银币是存在， true 则返回所有的银币数（包括保险箱）
UserPropertyIsolater.getMoneyById = function(self,moneyId,isAllGold)
    return kUserInfoData:getMoneyById(moneyId,isAllGold);
end

--获取银币id
UserPropertyIsolater.getPropertySilverCoinID = function(self)
    return RechargeDataInterface.getInstance():getPropertySilverCoinID();
end

--获取金条id
UserPropertyIsolater.getPropertyGoldBarID = function(self)
    return RechargeDataInterface.getInstance():getPropertyGoldBarID();
end

--获取钻石id
UserPropertyIsolater.getPropertyDiamondID = function(self)
    return RechargeDataInterface.getInstance():getPropertyDiamondID();
end

--获取积分id
UserPropertyIsolater.getJifenID = function(self)
    return RechargeDataInterface.getInstance():getJifenID();
end

--获取资产别名
UserPropertyIsolater.getProperyAliasById = function(self, propertyId)
    return RechargeDataInterface.getInstance():getProperyAliasById(propertyId);
end