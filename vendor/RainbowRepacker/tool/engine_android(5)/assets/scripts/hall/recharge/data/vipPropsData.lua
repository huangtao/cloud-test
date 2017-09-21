require("gameData/gameData")

--vip 特权描述

local VipPropsData = class(GameData);


VipPropsData.Delegate = {
	onGetVipPropsListCallBack = "onGetVipPropsListCallBack";
}

VipPropsData.initData = function(self)
	self.m_localVersion = -1;
	self.m_vipPropslist = {};
end

VipPropsData.requestData = function(self)
	if not self.m_isTouched or table.isEmpty(self.m_vipPropslist)  then
		local param = { ["cli_ver"] = self:getLocalVersion() };
		OnlineSocketManager.getInstance():sendMsg(PHP_VIPPROPS, param);
	end		
end

VipPropsData.onGetVipPropsDataCallBack = function(self, isSuccess, info, sendParam)
	Log.v("VipPropsData.onGetVipPropsDataCallBack --> ", data);
	if isSuccess then
		self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.data);
	else
		self:execDelegate(VipPropsData.Delegate.onGetVipPropsListCallBack, false);
	end
end

VipPropsData.loadDictData = function(self, dict)
	self.m_localVersion = dict:getInt("version", -1);
	local strVipPropsList = dict:getString("vipPropsList") or "";
	local vipPropsList = json.decode(strVipPropsList);
	if table.isTable(vipPropsList) then
		self:analysisData(vipPropsList);
	end
end

VipPropsData.saveDictData = function(self, dict)
	dict:setInt("version", self:getLocalVersion() );
	local strVipPropsList = json.encode(self.m_vipPropslist);
	if strVipPropsList then
		dict:setString("vipPropsList", strVipPropsList);
	end
end

VipPropsData.updateMemData = function(self, version, data)
	if not (table.isTable(data) and version) then
		self:execDelegate(VipPropsData.Delegate.onGetVipPropsListCallBack, false);
		return;
	end

	self.m_localVersion = tonumber(version) or -1;
	self:analysisData(data);

	self:execDelegate(VipPropsData.Delegate.onGetVipPropsListCallBack, true, Copy(self.m_vipPropslist) );
end

VipPropsData.analysisData = function(self, data)
	self.m_vipPropslist = {};
	for k, v in ipairs( table.verify(data) ) do
		local item = {};
		item.props_id = tonumber(v.props_id) or 0; --特权id
		item.item_name = tostring(v.item_name) or ""; --特权名称
		item.item_icon = tostring(v.item_icon) or ""; --特权图标
		item.sort = tonumber(v.sort); --排序值
		table.insert(self.m_vipPropslist, item);
	end
end

VipPropsData.getLocalDictName = function(self)
	return "VipPropsData";
end

VipPropsData.getLocalVersion = function(self)
	return tonumber(self.m_localVersion) or -1;
end

VipPropsData.getVipPropsList = function(self)
	self:requestData();
	return Copy(self.m_vipPropslist);
end

VipPropsData.s_socketCmdFuncMap = {
	[PHP_VIPPROPS] = VipPropsData.onGetVipPropsDataCallBack;
}

return VipPropsData;