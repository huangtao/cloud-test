require("isolater/common/commonController");
require("hall/diamondShop/data/diamondShopDataInterface");

DiamondShopController = class(CommonController);

DiamondShopController.s_cmds =
{
	onBack = 1;
	getTabs =2;
	getGoods = 3;
	getRecord = 4;
};

DiamondShopController.ctor = function(self,state,viewClass,viewConfig)
	Log.v("-------------DiamondShopController.ctor -----------");

	self.m_state = state;

	DiamondShopDataInterface.getInstance():setObserver(self);
end


DiamondShopController.dtor = function(self)
	DiamondShopDataInterface.getInstance():clearObserver(self);
end


DiamondShopController.resume = function(self)
	CommonController.resume(self);
	self:onGetTabs();
end

DiamondShopController.pause = function(self)
	CommonController.pause(self);
end
-----------------------------------------------------------
DiamondShopController.onBackClick = function(self)
	StateMachine.getInstance():popState();
end

DiamondShopController.onGetTabs = function(self)
	Log.v("------------DiamondShopController.onGetTabs ----------");
	local tabs = DiamondShopDataInterface.getInstance():getDiamondTabs();
	if (not table.isEmpty(tabs)) then 
		self:updateView(DiamondShopScene.s_cmds.showTabs,tabs);
	end
end

DiamondShopController.onGetTabsDataCallBack = function(self,isSuccess,data)	
	Log.v("------------DiamondShopController.onGetTabsDataCallBack ----------",data);
	self:updateView(DiamondShopScene.s_cmds.showTabs,data);
end

DiamondShopController.onGetGoods = function(self,id,showtype)
	local goodsList = DiamondShopDataInterface.getInstance():getDiamondTabGoods(id,showtype);
	if (not table.isEmpty(goodsList)) then 
		self:updateView(DiamondShopScene.s_cmds.showGoods,goodsList);
	else
		LoadingView.getInstance():showText("数据加载中...");
	end
end

DiamondShopController.onGetTabGoodsDataCallBack = function(self,isSuccess,data)
	Log.v("-------DiamondShopController.onGetTabGoodsDataCallBack ------",data);
	self:updateView(DiamondShopScene.s_cmds.showGoods,data);
end

DiamondShopController.onGetRecord = function(self)
	Log.v("-------------DiamondShopController.onGetRecord---------");
	local records,isExist = DiamondShopDataInterface.getInstance():getRecordData();
	if isExist or not table.isEmpty(records) then 
		self:updateView(DiamondShopScene.s_cmds.showRecord,records);
	end
end

DiamondShopController.onGetRecordDataCallBack = function(self,isSuccess,data)
	Log.v("-------DiamondShopController.onGetRecordResult---------");
	self:updateView(DiamondShopScene.s_cmds.showRecord,data);
end

DiamondShopController.s_cmdConfig = 
{
	[DiamondShopController.s_cmds.onBack] = DiamondShopController.onBackClick;
	[DiamondShopController.s_cmds.getTabs] = DiamondShopController.onGetTabs;
	[DiamondShopController.s_cmds.getGoods] = DiamondShopController.onGetGoods;
	[DiamondShopController.s_cmds.getRecord] = DiamondShopController.onGetRecord;
};
