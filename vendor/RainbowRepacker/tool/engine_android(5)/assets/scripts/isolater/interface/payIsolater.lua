require("gameData/dataInterfaceBase");
require("hall/gameData/pay/payConfig");
require("hall/recharge/data/rechargeDataInterface");
require("isolater/interface/propIsolater");
require("hall/common/commonJumpLogic")

PayIsolater = class(DataInterfaceBase);

--商品列表id
PayIsolater.eGoodsListId = {
	MarketGold = PayConfig.eGoodsListId.MarketGold; --商城银币商品信息
	MarketVip = PayConfig.eGoodsListId.MarketVip; --商城VIP商品信息
	MarketProp = PayConfig.eGoodsListId.MarketProp; --商城道具商品信息
	MarketHot = PayConfig.eGoodsListId.MarketHot; --商城促销商品信息
	MarketCrystal = PayConfig.eGoodsListId.MarketCrystal, -- 商城金条商品信息

	Broken     = PayConfig.eGoodsListId.Broken; --破产商品

	HallPlus = PayConfig.eGoodsListId.HallPlus; --快捷支付大厅加号
	RoomPay = PayConfig.eGoodsListId.RoomPay; --快捷支付房间内 （这个列表会根据gameid 和 level而变化）
	VipCharge = PayConfig.eGoodsListId.VipCharge, --VIP支付

	FirstRecharge = PayConfig.eGoodsListId.FirstRecharge; --首冲
	SecondePay = PayConfig.eGoodsListId.SecondePay; --二次付费

	Degrade = PayConfig.eGoodsListId.Degrade; --快捷支付入场 降级、入场 （这个列表会根据gameid 和 level而变化）
	AgentCard =  PayConfig.eGoodsListId.AgentCard; --代理年卡
};

--枚举支付场景
PayIsolater.ePayScene = {
	Market = PayConfig.ePayScene.Market;                --商城
	Broken = PayConfig.ePayScene.Broken;				   --破产
	ChooseGoodsLayer = PayConfig.ePayScene.ChooseGoodsLayer;	   --多个商品(如首冲)
	SingleGoodsLayer = PayConfig.ePayScene.SingleGoodsLayer,      --快捷购买(如大厅加号)
}

PayIsolater.getInstance = function()
	if not PayIsolater.s_instance then
		PayIsolater.s_instance = new(PayIsolater); 
	end
	return PayIsolater.s_instance;
end

--@brief 获取物品配置
--@Warning 请调用PropIsolater中的接口
PayIsolater.getGoodsClassifyConfig = function(self)
	return RechargeDataInterface.getInstance():getGoodsClassifyConfig();
end

--@brief 获取物品信息 
--@Warning 请调用PropIsolater中的接口
PayIsolater.getGoodInfoByTypeId = function(self, typeId)
	return PropIsolater.getInstance():getGoodInfoByTypeId(typeId);
end

--@brief 设置当前支付场景类型 用于支付场景上报统计
--enum 值 PayIsolater.ePayScene
PayIsolater.setSceneType = function(self, paySceneType)
	RechargeDataInterface.getInstance():setSceneType(paySceneType);
end 

--@brief 设置跳转参数，跳转到商城 
--@param tagTag "money" "vip" "prop" "crystal"
PayIsolater.jumpToMarket = function(self, tabTag)
	tabTag = tabTag or "money";
	local tabId;
	if tabTag == "vip" then
		tabId = RechargeDataInterface.getInstance():getTabVipId();
	elseif tabTag == "prop" then
		tabId = RechargeDataInterface.getInstance():getTabPropId();
	elseif tabTag == "crystal" then
		tabId = RechargeDataInterface.getInstance():getTabCrystalId();
	else
		tabId = RechargeDataInterface.getInstance():getTabMoneyId();
	end

	RechargeDataInterface.getInstance():setToRechargeMode(tabId);
	CommonJumpLogic.getInstance():setJumpData(nil, States.Recharge);
end
