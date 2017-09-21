require("gameData/dataInterfaceBase");
require("hall/safeBox/data/safeBoxDataInterface");
require("hall/main/data/hallDataInterface");

--[[
	保险箱操作
]]

SafeBoxIsolater = class(DataInterfaceBase);

SafeBoxIsolater.Delegate = {
	onUpdateSafeBoxCallBack = "onUpdateSafeBoxCallBack";
}

SafeBoxIsolater.getInstance = function()
	if not SafeBoxIsolater.s_instance then
		SafeBoxIsolater.s_instance = new(SafeBoxIsolater); 
	end
	return SafeBoxIsolater.s_instance;
end

SafeBoxIsolater.releaseInstance = function()
	delete(SafeBoxIsolater.s_instance);
	SafeBoxIsolater.s_instance = nil;
end

SafeBoxIsolater.ctor = function(self)
	SafeBoxDataInterface.getInstance():setObserver(self);
end

SafeBoxIsolater.dtor = function(self)
	SafeBoxDataInterface.getInstance():clearObserver(self);
end

-- 获取是否免手续费
SafeBoxIsolater.isFree = function(self)
	return SafeBoxDataInterface.getInstance():isFree();
end

-- 获取现金的最小临界值(获取存款的限制，银币低于这个值不能存款)
SafeBoxIsolater.getLowestCashMoney = function(self)
	return SafeBoxDataInterface.getInstance():getLowestCashMoney();
end

SafeBoxIsolater.getCrystalLowestCash = function(self)
	return SafeBoxDataInterface.getInstance():getCrystalLowestCash();
end

-- 获取每次增加/减少金钱的变化数
SafeBoxIsolater.getMoneyChangeStep = function(self)
	return SafeBoxDataInterface.getInstance():getMoneyChangeStep();
end

SafeBoxIsolater.getCrystalChangeStep = function(self)
	return SafeBoxDataInterface.getInstance():getCrystalChangeStep();
end

--更新保险箱
--opType:1表示存入   2表示取出
--moneyDiff:存入(或取出)的银币数
--moneyType:710大厅扩展字段 货币类型 0或者不传为银币， 1为金条
SafeBoxIsolater.updateSafeBox = function(self, opType, moneyDiff, moneyType)
	SafeBoxDataInterface.getInstance():updateSafeBox(opType, math.abs(moneyDiff), moneyType);
end

SafeBoxIsolater.onUpdateSafeBoxCallBack = function(self,isSuccess,data)
	self:notify(SafeBoxIsolater.Delegate.onUpdateSafeBoxCallBack, isSuccess, data);
end

--保险箱开关
SafeBoxIsolater.isSafeBoxSwitchOpen = function(self)
	--我们需要知道的是大厅的保险开关，所以写死为大厅的GAMEID
	return HallDataInterface.getInstance():isButtonDisplay(GameType.HALL, HallBottomButtonConfig.btnIds.safeBox)
end