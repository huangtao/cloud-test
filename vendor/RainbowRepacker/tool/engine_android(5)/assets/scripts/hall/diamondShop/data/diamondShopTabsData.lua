require("gameData/gameData")

local DiamondShopTabsData = class(GameData);

DiamondShopTabsData.Delegate = {
	onGetTabsDataCallBack = "onGetTabsDataCallBack";
};

DiamondShopTabsData.getTabsData = function(self)
	self:requestData();
	return self.m_tabsData or {};
end

DiamondShopTabsData.initData = function(self)
	self.m_tabsData = {};
end

DiamondShopTabsData.requestData = function(self)
	if (not self.m_isTouched) or table.isEmpty(self.m_tabsData)then
		Log.i("DiamondShopTabsData.requestData");
		OnlineSocketManager.getInstance():sendMsg(PHP_DIAMOND_DMDINIT,{},self, self.onGetTabsData);
	end
end

DiamondShopTabsData.onGetTabsData = function(self,isSuccess,info)
	Log.i("DiamondShopTabsData.onGetTabsData","isSuccess = ",isSuccess,"info = ",info);
	if isSuccess then
		self:updateData(true,info);
	end

	self:execDelegate(DiamondShopTabsData.Delegate.onGetTabsDataCallBack,isSuccess, Copy(self.m_tabsData) );
end

DiamondShopTabsData.updateMemData = function(self,data)
	if not table.isTable(data) then
		return;
	end

	self.m_tabsData = {};
	for k, v in pairs(data) do	
		if type(v) == "table" then 	
			v.id = tonumber(v.id) or 0;					--tab的id
			v.name = v.name or "";						--tab的名字
			v.showtype = tonumber(v.showtype) or 1;		--展示类型(1=>普通,2=>显示标签)
			v.begintime = tonumber(v.begintime) or 0;	--限时兑换的开始时间
			v.endtime = tonumber(v.endtime) or 0;		--限时兑换的结束时间
			v.active_icon = v.active_icon or "";		--选中时的tab背景的url
			v.unactive_icon = v.unactive_icon or "";	--未选中时的tab背景的url
			v.event_icon = v.event_icon or "";			--标签的url
			v.sort = tonumber(v.sort) or 0;				--排序

			table.insert(self.m_tabsData,v);
		end 
	end

	table.sort(self.m_tabsData, function(a, b)
		if type(a) == "table" and type(b) == "table" then 
        	return a.sort < b.sort;
        end
    end );  	
end 

DiamondShopTabsData.loadDictData = function(self, dict)
	local strTabData = dict:getString("tabsData");
	local tabsData = json.decode(strTabData);
	if table.isTable(tabsData) then
		self.m_tabsData = tabsData;
	end
end

DiamondShopTabsData.saveDictData = function(self, dict)
	dict:setString("tabsData", json.encode(self.m_tabsData) or "");
end

DiamondShopTabsData.getLocalDictName = function(self)
	self.m_userCid = self.m_userCid or kUserInfoData:getUserCid();
	return "DiamondShopTabsData" .. self.m_userCid;
end

DiamondShopTabsData.s_socketCmdFuncMap = {
	[PHP_DIAMOND_DMDINIT] 		     = DiamondShopTabsData.onGetTabsData;
};

return DiamondShopTabsData;