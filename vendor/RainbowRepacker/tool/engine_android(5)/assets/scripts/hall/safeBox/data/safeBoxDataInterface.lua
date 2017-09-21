require("gameData/dataInterfaceBase");

SafeBoxDataInterface = class(DataInterfaceBase);

local DEFAULT_SAFEBOX_CONFIG = {
	safebox = {
		min = 20000,
		maxfee = 500000,
		step = 1000,
		fee = {},
	},
	crystalsafebox = {
		min = 200,
		maxfee = 500000,
		step = 100,
		fee = {},
	},
	safeboxfree = 1,
}

SafeBoxDataInterface.Delegate = {
	onUpdateSafeBoxCallBack = "onUpdateSafeBoxCallBack";
}

SafeBoxDataInterface.getInstance = function()
	if not SafeBoxDataInterface.s_instance then
		SafeBoxDataInterface.s_instance = new(SafeBoxDataInterface);
	end

	return SafeBoxDataInterface.s_instance;
end

--@brief 获取是否不收手续费
SafeBoxDataInterface.isFree = function(self)
	return self.m_config.safeboxfree == 1;
end

--@brief 获取现金的最小临界值
SafeBoxDataInterface.getLowestCashMoney = function(self)
	return self.m_config.safebox.min;
end

--@brief 获取每次增加/减少金钱的变化数
SafeBoxDataInterface.getMoneyChangeStep = function(self)
	return self.m_config.safebox.step;
end

SafeBoxDataInterface.getCrystalLowestCash = function(self)
	return self.m_config.crystalsafebox.min;
end

SafeBoxDataInterface.getCrystalChangeStep = function(self)
	return self.m_config.crystalsafebox.step;
end

--@获取存储金钱的变化数来获取服务费比例
SafeBoxDataInterface.getFeeRatioByMoneyDiff = function(self, moneyDiff)
	return moneyDiff > 1000000 and self.m_config.safebox.fee["1000000"] or self.m_config.safebox.fee["0"];
end

SafeBoxDataInterface.getFeeRatioByDiff = function(self, diff, index)
	local fee = (index == 1) and self.m_config.safebox.fee or self.m_config.crystalsafebox.fee
	local key, val = nil, nil
	for k,v in pairs(fee) do
		if tonumber(k) < diff and (not key or tonumber(k) > tonumber(key)) then
			key = k
			val = v
		end
	end
	return val or 0
end

--@brief 获取收取的服务费的最大值
SafeBoxDataInterface.getMaxServiceFeeMoney = function(self)
	return self.m_config.safebox.maxfee;
end

SafeBoxDataInterface.getMaxServiceFeeCrystal = function(self)
	return self.m_config.crystalsafebox.maxfee;
end

SafeBoxDataInterface.getMaxServiceFee = function(self, index)
	return (index == 1) and self:getMaxServiceFeeMoney() or self:getMaxServiceFeeCrystal()
end

SafeBoxDataInterface.requestSafeBoxConfig = function(self)
	if not self.m_isTouchedSafeBoxConfig then
		local params = { cli_ver = number.valueOf(self.m_localVersion, -1) };
		OnlineSocketManager.getInstance():sendMsg(PHP_GET_SAFEBOX_CONFIG, params);
	end
end

SafeBoxDataInterface.onGetSafeBoxConfigCallBack = function(self, isSuccess, info)
	Log.v("SafeBoxDataInterface.onGetSafeBoxConfigCallBack", info);
	if isSuccess and not table.isEmpty(info) then
		if number.valueOf(info.ver) > number.valueOf(self.m_localVersion) or number.valueOf(info.isrefresh) == 1 then
			local config = info.data;
			if table.isEmpty(config) or table.isEmpty(config.safebox) or table.isEmpty(config.crystalsafebox) or not config.safeboxfree then
				return;
			end

			self.m_localVersion = number.valueOf(info.ver);

			self.m_config = {
				safebox = {
					min = number.valueOf(config.safebox.min);
					step = number.valueOf(config.safebox.step);
					fee = table.verify(config.safebox.fee);
					maxfee = number.valueOf(config.safebox.maxfee);
				},

				crystalsafebox  = {
					min = number.valueOf(config.crystalsafebox.min);
					step = number.valueOf(config.crystalsafebox.step);
					fee = table.verify(config.crystalsafebox.fee);
					maxfee = number.valueOf(config.crystalsafebox.maxfee);
				},

				safeboxfree = number.valueOf(config.safeboxfree);
			}
			self.m_isTouchedSafeBoxConfig = true;

			self:saveData();
		end
	end
end

SafeBoxDataInterface.loadDictData = function(self, dict)
	local ver = dict:getInt("localVer", -1);
	local strConfig = dict:getString("safeBoxConfig")
	local config = json.decode(strConfig);
	if not table.isEmpty(config) then
		self.m_localVersion = ver;
		self.m_config = config;
	else
		self.m_config = DEFAULT_SAFEBOX_CONFIG;
	end
end

SafeBoxDataInterface.saveDictData = function(self, dict)
	dict:setInt("localVer", self.m_localVersion or -1);
	dict:setString("safeBoxConfig", json.encode(self.m_config) or "");
end

SafeBoxDataInterface.getLocalDictName = function(self)
	return "SafeBoxDataInterface";
end

--@brief 更新保险箱
--@param opType:1表示存入   2表示取出
--@param moneyDiff:存入(或取出)的银币数
--@param moneyType:710大厅扩展字段 货币类型 0或者不传为银币， 1为金条
SafeBoxDataInterface.updateSafeBox = function(self, opType, moneyDiff, moneyType)
	local param = {
		["mid"] = kUserInfoData:getUserId(),
		["type"] = opType,
		["money"] = moneyDiff,
		["money_type"] = moneyType,
	};
	OnlineSocketManager.getInstance():sendMsg(PHP_UPDATE_SAFEBOX, param, self, self.onUpdateSafeBoxCallBack);
end

SafeBoxDataInterface.onUpdateSafeBoxCallBack = function(self, isSuccess, data)
	Log.d("SafeBoxDataInterface.onUpdateSafeBoxCallBack","isSuccess = ",isSuccess,"data = ",data);
	if isSuccess then
		if not table.isEmpty(data) and data.totalmoney and data.safebox then
			if data.money_type and data.money_type == 1 then
				kUserInfoData:setSafeBoxCurCrystal(data.safebox);
				kUserInfoData:setCrystal(data.totalmoney);
			else
				kUserInfoData:setSafeBoxCurMoney(data.safebox);
				kUserInfoData:setMoney(data.totalmoney);
			end
		else
			isSuccess = false;
		end
	end

	self:notify(SafeBoxDataInterface.Delegate.onUpdateSafeBoxCallBack, isSuccess, data);
end


SafeBoxDataInterface.s_socketCmdFuncMap = {
	[PHP_UPDATE_SAFEBOX] 		        = SafeBoxDataInterface.onUpdateSafeBoxCallBack;
	[PHP_GET_SAFEBOX_CONFIG]			= SafeBoxDataInterface.onGetSafeBoxConfigCallBack;
};