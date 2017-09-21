require("gameData/dataInterfaceBase");
VipDataInterface = class(DataInterfaceBase);

VipDataInterface.Delegate = {
	onGetVipPropsListCallBack = "onGetVipPropsListCallBack";
}

VipDataInterface.getInstance = function()
	if not VipDataInterface.s_instance then
		VipDataInterface.s_instance = new(VipDataInterface);
	end

	return VipDataInterface.s_instance;
end

VipDataInterface.ctor = function(self)
	self.m_vipPropsList = new(require("hall/recharge/data/vipPropsData"), self);
end

--@brief vip特权描述
VipDataInterface.getVipPropsList = function(self)
	return self.m_vipPropsList:getVipPropsList();
end

VipDataInterface.onGetVipPropsListCallBack = function(self, isSuccess, vipPropsData)
	self:notify(VipDataInterface.Delegate.onGetVipPropsListCallBack, isSuccess, vipPropsData);
end
