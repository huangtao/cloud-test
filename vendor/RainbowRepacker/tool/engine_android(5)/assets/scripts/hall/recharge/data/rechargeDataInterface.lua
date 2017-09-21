require("gameData/dataInterfaceBase");
require("hall/shortCutRecharge/widget/rechargeSucPop");
local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
local GoodsClassify = require("hall/recharge/data/goodsClassify");
local RechargeTabsConfig = require("hall/recharge/data/rechargeTabsConfig");
local RechargeTabsAd = require("hall/recharge/data/rechargeTabsAd");


RechargeDataInterface = class(DataInterfaceBase);

RechargeDataInterface.Delegate = {
	onGetBottomVipAdCallBack = "onGetBottomVipAdCallBack";
	onGetRechargeTabsCallBack = "onGetRechargeTabsCallBack";
	onGetCrystalBuyGoodsCallBack = "onGetCrystalBuyGoodsCallBack";
	onGetRechargeTabsAdCallBack = "onGetRechargeTabsAdCallBack";
    onGetGoodsClassifyDetailInfoCallBack = "onGetGoodsClassifyDetailInfoCallBack";
};

RechargeDataInterface.getInstance = function()
	if not RechargeDataInterface.s_instance then
		RechargeDataInterface.s_instance = new(RechargeDataInterface);
	end

	return RechargeDataInterface.s_instance;
end


RechargeDataInterface.ctor = function(self)
	self.m_tabsConfig = new(RechargeTabsConfig, self);
	self.m_goodsClassify = new(GoodsClassify, self);
	self.m_rechargeTabsAd = new(RechargeTabsAd, self)
end

RechargeDataInterface.dtor = function(self)
	delete(self.m_tabsConfig);
	self.m_tabsConfig = nil;

	delete(self.m_goodsClassify);
	self.m_goodsClassify = nil;

    delete(self.m_rechargeTabsAd);
    self.m_rechargeTabsAd = nil;
end

--@brief 设置物品公共配置信息
RechargeDataInterface.setGoodsClassifyCommonInfo = function(self, config)
    self.m_goodsClassify:setGoodsClassifyCommonInfo(config);
end

--@brief 请求物品配置
RechargeDataInterface.requestGoodsClassifyConfig  = function(self)
    self.m_goodsClassify:requestData();
end

--@brief 获取物品配置
RechargeDataInterface.getGoodsClassifyConfig = function(self)
	return self.m_goodsClassify:getGoodsClassifyConfig();
end

--@brief 根据物品id获取物品信息
--@param typeId 物品id
--@note 此接口返回的数据中 item_name、item_type、item_icon 一定是正确的，其余字段不一定是正确的(会保证数据格式正确)
--如果需要准确获取其他字段，请使用requestGoodsDetailInfoById 接口来获取
RechargeDataInterface.getGoodInfoByTypeId = function(self, typeId)
	return self.m_goodsClassify:getGoodInfoByTypeId(typeId);
end

--@brief 物品信息（带映射）
--@param propId 道具id 会将某些道具id映射成物品id
RechargeDataInterface.getGoodInfoByTypeIdWithMap = function(self, propId)
	return self.m_goodsClassify:getGoodInfoByTypeIdWithMap(propId);
end

--@brief 根据道具id获取物品id
RechargeDataInterface.getGoodIdWithMap = function(self, propId)
    return self.m_goodsClassify:getGoodIdWithMap(propId);
end

--@brief 根据物品id获取物品名称
RechargeDataInterface.getGoodNameByTypeId = function(self, typeId)
    local info = self:getGoodInfoByTypeId(typeId);
    return info and info.item_name or ""; 
end

--@brief 根据物品id获取物品图片地址
RechargeDataInterface.getGoodIconByTypeId = function(self, typeId)
    local info = self:getGoodInfoByTypeId(typeId);
    return info and info.item_icon or "";
end

--@brief 请求物品详细信息
--@param id 物品类型
RechargeDataInterface.requestGoodsDetailInfoById = function(self, typeId)
    self.m_goodsClassify:requestGoodsDetailInfoById(typeId);
end

--@brief 物品详细信息回调
RechargeDataInterface.onGetGoodsClassifyDetailInfoCallBack = function(self, id, goodInfo)
    self:notify(RechargeDataInterface.Delegate.onGetGoodsClassifyDetailInfoCallBack, id, goodInfo);
end

--获取银币id
RechargeDataInterface.getPropertySilverCoinID = function(self)
    return GoodsClassify.eGoodsType.SILVER_COIN.id;
end

--获取金条id
RechargeDataInterface.getPropertyGoldBarID = function(self)
    return GoodsClassify.eGoodsType.GOLD_BAR.id;
end

--获取钻石id
RechargeDataInterface.getPropertyDiamondID = function(self)
    return GoodsClassify.eGoodsType.DIAMOND.id;
end

--获取积分id
RechargeDataInterface.getJifenID = function(self)
    return GoodsClassify.eGoodsType.JIFEN.id;
end

--获取资产别名
RechargeDataInterface.getProperyAliasById = function(self, id)
    id = number.valueOf(id, -1);
    local name = "";
    for k,v in pairs(GoodsClassify.eGoodsType) do
        if v.id and v.id == id then
            name = v.name;
            break;
        end
    end
    return name;
end

--@brief 根据价格获取图片
RechargeDataInterface.getGoodPriceImage = function(self, pamount)
	local priceName = string.format("price_%s.png", pamount);
	return market_pin_map[priceName]; -- 使用拼图时才返回空
end

--@brief 请求底部vip广告
RechargeDataInterface.requestBottomVipAd = function(self)
	OnlineSocketManager.getInstance():sendMsg(PHP_MALL_VIP_AD,{});
end

--@brief 获取vip广告图片回调
RechargeDataInterface.onGetBottomVipAdCallBack = function(self, isSuccess, info, sendParam)
	if isSuccess and not table.isEmpty(info) then
		self:notify(RechargeDataInterface.Delegate.onGetBottomVipAdCallBack, info);
	end
end

--@brief 请求商城Tabs
RechargeDataInterface.getTabsConfig = function(self)
	return self.m_tabsConfig:getTabsConfig();
end

--获取商城默认跳转tabId
RechargeDataInterface.getDefaultTabId = function(self)
	return self.m_tabsConfig:getDefaultTabId();
end

--获取商城银币 tab Id
RechargeDataInterface.getTabMoneyId = function(self)
    return RechargeTabsConfig.TABS.TAB_MONEY;
end

--获取商城VIP tab Id
RechargeDataInterface.getTabVipId = function(self)
    return RechargeTabsConfig.TABS.TAB_VIP;
end

--获取商城道具 tab Id
RechargeDataInterface.getTabPropId = function(self)
    return RechargeTabsConfig.TABS.TAB_PROP;
end

--获取商城热销商品 tab Id
RechargeDataInterface.getTabHotId = function(self)
    return RechargeTabsConfig.TABS.TAB_HOT;
end

--获取商城金条|水晶 tab Id
RechargeDataInterface.getTabCrystalId = function(self)
    return RechargeTabsConfig.TABS.TAB_CRYSTAL;
end

--获取商城tabs回调
RechargeDataInterface.onGetRechargeTabsCallBack = function(self, isSuccess, tabsConfig, sendParam)
	self:notify(RechargeDataInterface.Delegate.onGetRechargeTabsCallBack, isSuccess, tabsConfig, sendParam);
end

--@brief 通过金条购买商品
RechargeDataInterface.requestPayByCrystal = function(self, goodId, num)
	local param = {
		item_id = goodId,
		item_number = number.valueOf(num, 1);
	}

	OnlineSocketManager.getInstance():sendMsg(PHP_CRYSTAL_BUY_GOODS, param);
end

--通过金条购买商品回调
RechargeDataInterface.onGetCrystalBuyGoodsCallBack = function(self, isSuccess, data, sendParam)
	if not isSuccess then
		self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, false);
		return;
	end

    local updatePayStatus = function()
         local isPay  = kUserInfoData:getPayStatus(); -- 0未充值,1普通充值,2二次特权充值
        if isPay == 0 then 
           isPay = 2; --普通充值->二次特权
        end
        kUserInfoData:setPayStatus(isPay);
    end

	local userCurCrystal = tonumber(data.totalCrystal) or kUserInfoData:getCrystal();
	kUserInfoData:setCrystal(userCurCrystal);

    local isNeedRefreshPayStatus = false;
	local typeValue = tonumber(data.type);--购买类型：1为银币，2为VIP，3为道具
	if typeValue == 1 then 
		isNeedRefreshPayStatus = self:__parseCrystalBuyGold(data.ret);
	elseif typeValue == 2 then
		isNeedRefreshPayStatus = self:__parseCrystalBuyVip(data.ret);
	elseif typeValue == 3 then
		self:__parseCrystalBuyProp(data);
	else
		self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, false);
	end

    if isNeedRefreshPayStatus then
        updatePayStatus();
        kGoodsListInterface:resetGoodsListUpdateFlag();
    end
end

RechargeDataInterface.__parseCrystalBuyGold = function(self, detailInfo)
	if table.isEmpty(detailInfo) then
		self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, false);
		return false;
	end

	local payMoney = tonumber(detailInfo.gold) or 0; --支付银币
	local cur_money = tonumber(detailInfo.cur_money) or kUserInfoData:getMoney();
   	local cur_diamond = tonumber(detailInfo.diamond) or kUserInfoData:getDiamond();
	kUserInfoData:setMoney(cur_money);
	kUserInfoData:setDiamond(cur_diamond);

    local award_gold = 0;
    local award_diamond = 0;
    local award_props = {};

    local privilege = table.verify(detailInfo.privilege);
    if privilege.status then
    	award_gold = award_gold + number.valueOf(privilege.gold, 0);
    	award_diamond = award_diamond + number.valueOf(privilege.diamond, 0);
    	award_props = CombineTables(award_props, table.verify(privilege.props) );
    end

    local bouns = table.verify(detailInfo.bouns);
	award_gold = award_gold + number.valueOf(bouns.gold, 0);
	award_diamond = award_diamond + number.valueOf(bouns.diamond, 0);
	award_props = CombineTables(award_props, table.verify(bouns.props) );

    local desc = string.format("成功购买%s银币", ToolKit.skipMoneyEx2(payMoney) );
    if award_gold > 0 then
    	desc = desc .. string.format(",加赠%s银币", award_gold);
    end

    if award_diamond > 0 then
    	desc = desc .. string.format(",加赠%s钻石", award_diamond);
    end

    for propClassifyId, num in pairs(award_props) do
    	local propInfo = RechargeDataInterface.getInstance():getGoodInfoByTypeId(propClassifyId);
    	if propInfo and propInfo.item_name then
    		desc = desc .. ",加赠".. propInfo.item_name .."x" ..num;
    	end
    end

    self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, true);

    local data = {};
    data.title = detailInfo.pay_succ_tips;         --标题提示信息
    data.rightTitle = "内容说明";
    data.topTips = desc;                             --提示信息
    data.rightContent = detailInfo.pay_succ_explain; --右侧说明内容
    data.adUrl = detailInfo.pay_succ_pic;			 --左侧图片
    data.jumpcode = detailInfo.pay_succ_jumpcode;    --跳转代码

    RechargeSucPop.show(data);

    return true;
end

--解析金条购买vip
RechargeDataInterface.__parseCrystalBuyVip = function(self, detailInfo)
	if table.isEmpty(detailInfo) then
		self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, false);
		return false;
	end


	local cur_money = tonumber(detailInfo.cur_money) or kUserInfoData:getMoney();
   	local cur_diamond = tonumber(detailInfo.diamond) or kUserInfoData:getDiamond();
	kUserInfoData:setMoney(cur_money);
	kUserInfoData:setDiamond(cur_diamond);

    self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, true);

	local data = {};
    data.title = detailInfo.pay_succ_tips;         --标题提示信息
    data.rightTitle = "内容说明";
    data.topTips = detailInfo.pay_succ_content; --提示信息
    data.rightContent = detailInfo.pay_succ_explain; --右侧说明内容
    data.adUrl = detailInfo.pay_succ_pic;			 --左侧图片
    data.jumpcode = detailInfo.pay_succ_jumpcode;    --跳转代码

    RechargeSucPop.show(data);

    return true;
end

--解析金条购买道具
RechargeDataInterface.__parseCrystalBuyProp = function(self, detailInfo)
    if detailInfo.flag == 1 then
        local msg = string.format("购买%s*%s成功,请在【物品箱】中查看", detailInfo.name or "", detailInfo.number or 1);
        self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, true, msg);
    else
        self:notify(RechargeDataInterface.Delegate.onGetCrystalBuyGoodsCallBack, false, detailInfo.msg);
    end
end

-------------------------------------------------------
RechargeDataInterface.setToRechargeMode = function(self,mode)
	self.m_mode = mode or self:getDefaultTabId();
end

RechargeDataInterface.setToRechargeModeByJumpTab = function(self, tab)
	local mode = RechargeTabsConfig.TABS_JUMP_MAP[tab] or RechargeTabsConfig.TABS.TAB_MONEY;
	self:setToRechargeMode(mode);
end

RechargeDataInterface.getToRechargeMode = function(self)
	return self.m_mode or self:getDefaultTabId();
end

RechargeDataInterface.setIOSPayMode = function(self, mode)
	self.m_iosPayMode = mode;
end

RechargeDataInterface.getIOSPayMode = function(self)
	return self.m_iosPayMode or 0;
end

RechargeDataInterface.setSceneType = function(self, sceneType)
	self.m_sceneType = sceneType;
end

RechargeDataInterface.getSceneType = function(self)
	return self.m_sceneType or "";
end

--------------------------------商城广告--------------------------------
RechargeDataInterface.requestRechargeTabsAd = function(self)
	self.m_rechargeTabsAd:requestData();
end

RechargeDataInterface.getRechargeTabsAd = function(self, tabId)
	return self.m_rechargeTabsAd:getRechargeTabsAd(tabId);
end

RechargeDataInterface.onGetRechargeTabsAdCallBack = function(self)
	self:notify(RechargeDataInterface.Delegate.onGetRechargeTabsAdCallBack);
end

RechargeDataInterface.s_socketCmdFuncMap = {
	[PHP_MALL_VIP_AD] = RechargeDataInterface.onGetBottomVipAdCallBack;
	[PHP_CRYSTAL_BUY_GOODS] = RechargeDataInterface.onGetCrystalBuyGoodsCallBack;
}