require("gameData/dataInterfaceBase");

DiamondShopDataInterface = class(DataInterfaceBase);

DiamondShopDataInterface.Delegate = {
	onGetTabsDataCallBack = "onGetTabsDataCallBack";
	onGetTabGoodsDataCallBack = "onGetTabGoodsDataCallBack";
	onGetRecordDataCallBack = "onGetRecordDataCallBack";
};

DiamondShopDataInterface.getInstance = function()
	if not DiamondShopDataInterface.s_instance then
		DiamondShopDataInterface.s_instance = new(DiamondShopDataInterface);
	end

	return DiamondShopDataInterface.s_instance;
end

DiamondShopDataInterface.releaseInstance = function()
	delete(DiamondShopDataInterface.s_instance);
	DiamondShopDataInterface.s_instance = nil;
end

DiamondShopDataInterface.cleanup = function()
    local lastObserverMap = DiamondShopDataInterface.getInstance():getObserverMap();
    delete(DiamondShopDataInterface.s_instance);
    DiamondShopDataInterface.s_instance = nil;

    DiamondShopDataInterface.getInstance():setObserverMap(lastObserverMap);
end

DiamondShopDataInterface.ctor = function(self)

	local DiamondShopTabsData = require("hall/diamondShop/data/diamondShopTabsData");
	self.m_tabsData = new(DiamondShopTabsData,self);

	local DiamondShopTabGoodsData = require("hall/diamondShop/data/diamondShopTabGoodsData");
	self.m_tabGoodsData = new(DiamondShopTabGoodsData,self);

	local DiamondShopRecordData = require("hall/diamondShop/data/diamondShopRecordData");
	self.m_recordData = new(DiamondShopRecordData,self);
end 

DiamondShopDataInterface.dtor = function(self)
	delete(self.m_tabsData);
	self.m_tabsData = nil;

	delete(self.m_tabGoodsData);
	self.m_tabGoodsData = nil;

	delete(self.m_recordData);
	self.m_recordData = nil;
end  

--获取兑换tabs配置信息
DiamondShopDataInterface.getDiamondTabs = function(self)
	local tabsData = self.m_tabsData:getTabsData();
	tabsData = table.verify(tabsData);
	return tabsData;
end 
--通知兑换tabs配置刷新了
DiamondShopDataInterface.onGetTabsDataCallBack = function(self,isSuccess,tabsData)
	Log.i("DiamondShopDataInterface.onGetTabsDataCallBack","data = ",tabsData);
	self:notify(DiamondShopDataInterface.Delegate.onGetTabsDataCallBack,isSuccess,table.verify(tabsData));
end

--获取兑换每个tab里面的商品信息
DiamondShopDataInterface.getDiamondTabGoods = function(self,id,showtype)
	local tabGoodsData = self.m_tabGoodsData:getTabGoodsData(id,showtype);
	tabGoodsData = table.verify(tabGoodsData);
	return tabGoodsData;
end 
--通知兑换tab商品刷新了
DiamondShopDataInterface.onGetTabGoodsDataCallBack = function(self,isSuccess,tabGoodsData)
	Log.i("DiamondShopDataInterface.onGetTabGoodsDataCallBack","data = ",tabGoodsData);
	self:notify(DiamondShopDataInterface.Delegate.onGetTabGoodsDataCallBack,isSuccess,table.verify(tabGoodsData));
end

DiamondShopDataInterface.updateGoodsNumWithGid = function(self, gid, changedNum)
	self.m_tabGoodsData:updateGoodsNumWithGid(gid, changedNum);
end

--获取兑换记录
DiamondShopDataInterface.getRecordData = function(self)
	local tabsData,isExist = self.m_recordData:getRecordData();
	tabsData = table.verify(tabsData);
	return tabsData,isExist;
end
--通知兑换记录更新了
DiamondShopDataInterface.onGetRecordDataCallBack = function(self,isSuccess,recordData)
	Log.i("DiamondShopDataInterface.onGetRecordDataCallBack","data = ",recordData);
	self:notify(DiamondShopDataInterface.Delegate.onGetRecordDataCallBack,isSuccess,table.verify(recordData));
end

--更新本地配置
DiamondShopDataInterface.setRefreshRecordData = function(self)
	self.m_recordData:setRefreshRecord();
end