require("gameData/gameData")

--商城Tabs配置

local RechargeTabsConfig = class(GameData);

RechargeTabsConfig.TABS = {
	TAB_MONEY = 1;
	TAB_VIP = 2;
	TAB_PROP = 3;
	TAB_HOT = 4;
	TAB_CRYSTAL = 12;
}

-- 商城Tabs跳转映射
RechargeTabsConfig.TABS_JUMP_MAP = {
	[1] = RechargeTabsConfig.TABS.TAB_MONEY,
	[2] = RechargeTabsConfig.TABS.TAB_VIP,
	[3] = RechargeTabsConfig.TABS.TAB_PROP,
	[4] = RechargeTabsConfig.TABS.TAB_CRYSTAL,
}

RechargeTabsConfig.Delegate = {
	onGetRechargeTabsCallBack = "onGetRechargeTabsCallBack";
};

RechargeTabsConfig.initData = function(self)
	self.m_localVersion = -1;
	self.m_tabsConfig = {};
end

RechargeTabsConfig.requestData = function(self)
	if not self.m_isTouched or table.isEmpty(self.m_tabsConfig) then
		local param = { ["cli_ver"] = self:getLocalVersion() };
		OnlineSocketManager.getInstance():sendMsg(PHP_MARKET_TABS, param);
	end
end

RechargeTabsConfig.onGetRechargeTabsCallBack = function(self, isSuccess, info, sendParam)
	if isSuccess then
		self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.data);
	else
		self:execDelegate(RechargeTabsConfig.Delegate.onGetRechargeTabsCallBack, false);
	end
end

RechargeTabsConfig.updateMemData = function(self, version, data)
	if not (table.isTable(data) and version) then
		self:execDelegate(RechargeTabsConfig.Delegate.onGetRechargeTabsCallBack, false);
		return;
	end

	self.m_localVersion = tonumber(version) or -1;
	self:__analysisData(data);
	self:execDelegate(RechargeTabsConfig.Delegate.onGetRechargeTabsCallBack, true, Copy(self.m_tabsConfig) )
end

RechargeTabsConfig.__analysisData = function(self, data)
	if table.isEmpty(data) then
		return;
	end

	self.m_tabsConfig = {};
	for index, v in pairs(data) do
		local item = {};
		item.tid = tonumber(v.tid) or 0;  --tab id
		item.tname = tostring(v.tname) or ""; -- tab name
		item.index = tonumber(index) or 0;
		table.insert(self.m_tabsConfig, item);
	end

	table.sort(self.m_tabsConfig, function(a, b)
			if a and b then
				return a.index < b.index;
			end
		end);
end

RechargeTabsConfig.getTabsConfig = function(self)
	self:requestData();
	return Copy(self.m_tabsConfig) or {};
end

RechargeTabsConfig.getDefaultTabId = function(self)
	return self.m_tabsConfig[1] and self.m_tabsConfig[1].tid or RechargeTabsConfig.TABS.TAB_MONEY;
end

RechargeTabsConfig.loadDictData = function(self, dict)
	self.m_localVersion = dict:getInt("version", -1);
	local strTabsConfig = dict:getString("tabsConfig") or "";
	local tabsConfig = json.decode(strTabsConfig);
	if not table.isEmpty(tabsConfig) then
		self.m_tabsConfig = tabsConfig;
	end
end

RechargeTabsConfig.saveDictData = function(self, dict)
	dict:setInt("version", self:getLocalVersion() );
	local strTabsConfig = json.encode(self.m_tabsConfig);
	if strTabsConfig then
		dict:setString("tabsConfig", strTabsConfig);
	end
end

RechargeTabsConfig.getLocalDictName = function(self)
	return "RechargeTabsConfig";
end

RechargeTabsConfig.getLocalVersion = function(self)
	return tonumber(self.m_localVersion) or -1;
end

RechargeTabsConfig.s_socketCmdFuncMap = {
	[PHP_MARKET_TABS] = RechargeTabsConfig.onGetRechargeTabsCallBack;
}


return RechargeTabsConfig;