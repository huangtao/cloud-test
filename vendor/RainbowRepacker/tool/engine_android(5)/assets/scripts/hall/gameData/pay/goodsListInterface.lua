require("gameData/gameData");
require("gameData/dataInterfaceBase");
require("hall/gameData/pay/payConfig");
require("hall/gameData/godsdk/godsdkHelper");
local payChannelIcons_pin_map = require("qnFiles/qnPlist/hall/payChannelIcons_pin");
require("hall/main/data/hallDataInterface");

GoodsListInterface = class(DataInterfaceBase);

--货币类型
GoodsListInterface.eCurrencyType = {
	rmb = 1,       --人民币
	gold = 2, 	   --银币
	diamond = 3,   --钻石
}

--物品ID
GoodsListInterface.eItemId = {
	replenishSign = 26, --补签卡
}

GoodsListInterface.Delegate = {
	onGetGoodsInfoCallBack = "onGetGoodsInfoCallBack";
}

GoodsListInterface.getInstance = function()
	if not GoodsListInterface.s_instance then
		GoodsListInterface.s_instance = new(GoodsListInterface);
	end

	return GoodsListInterface.s_instance;
end

GoodsListInterface.cleanup = function()
    local lastObserverMap = GoodsListInterface.getInstance():getObserverMap();
    delete(GoodsListInterface.s_instance);
    GoodsListInterface.s_instance = nil;

	kGoodsListInterface = GoodsListInterface.getInstance();
    kGoodsListInterface:setObserverMap(lastObserverMap);
end

--override
GoodsListInterface.initData = function(self)
	self.m_payAppid = 0;
	self.m_payCnHost = "";
	self.m_sceneGoodsMap = {};
	self.m_cacheGoodsMap = {};

	self.m_updatedFlag = {};
end

--[[
"scene",
"gameid",
"level",
"money",
"gid",
"gnum"
"cm"
]]	
GoodsListInterface.requestData = function(self, param)
	if table.isEmpty(param) then
		return;
	end

	Log.v("GoodsListInterface.requestData", "param -> ", param);

	if  self:__isNeedObtain(param.scene) then
		param.money = param.money or kUserInfoData:getMoney();
		param.operation = kClientInfo:getPhoneCardType(); --手机卡类型 1移动 2 联通 3 电信

		Log.v("sending");
		OnlineSocketManager.getInstance():sendMsg(PHP_GOODS_INFO, param);
	end
end

GoodsListInterface.onGetGoodsInfoCallBack = function(self, isSuccess, info, sendParam)
	Log.v("GoodsListInterface.onGetGoodsInfoCallBack ", "info --> ", info);

	if not isSuccess then
		local errInfo = info;
		self:notify(GoodsListInterface.Delegate.onGetGoodsInfoCallBack, false, errInfo, sendParam);
		return;
	end

	local data = self:__analysisData(info);
	self:notify(GoodsListInterface.Delegate.onGetGoodsInfoCallBack, true, Copy(data), sendParam);
end

--@brief 根据商品列表id和商品id获取商品信息
--@param goodsListId 商品列表id
--@param goodsId 商品id
GoodsListInterface.getGoodsItemInfo = function(self, goodsListId, goodsId)
	if not(goodsListId and goodsId) then
		return nil;
	end

	local info = self:__getGoodsListFromMemoryAndDict(goodsListId);
	if table.isEmpty(info) then
		return nil;
	end

	for _, v in pairs( table.verify(info.goodsList) ) do 
		if tonumber(v.id) == tonumber(goodsId) then
			return Copy(v);
		end
	end

	return nil;
end

--@brief 根据商品键值获取商品信息（只用于键值为唯一时）
GoodsListInterface.getGoodsItemInfoByKV = function(self, goodsListId, key, value)
	if not(goodsListId and key and value) then
		return nil;
	end

	local info = self:__getGoodsListFromMemoryAndDict(goodsListId);
	if table.isEmpty(info) then
		return nil;
	end

	for _, v in pairs( table.verify(info.goodsList) ) do 
		if tonumber(v[key]) == tonumber(value) then
			return Copy(v);
		end
	end

	return nil;
end

--@brief 根据商品列表id获取商品列表
GoodsListInterface.getGoodsList = function(self, goodsListId, param)
	self:requestData(param);

	if not goodsListId then
		return {};
	end

	if not table.isEmpty(param) and self:__isNoCacheType(goodsListId) then
		--如果有参数，并且商品列表是不缓存的情况， 则返回{}
		return {};
	end

	local info = self:__getGoodsListFromMemoryAndDict(goodsListId);
	return info and Copy(info.goodsList) or {};
end

--@brief 根据商品列表id获取商品信息
GoodsListInterface.getSceneGoodsInfo = function(self, goodsListId, param)
	self:requestData(param);

	if not goodsListId then
		return {};
	end

	if not table.isEmpty(param) and self:__isNoCacheType(goodsListId) then
		--如果有参数，并且商品列表是不缓存的情况， 则返回{}
		return {};
	end

	local info = self:__getGoodsListFromMemoryAndDict(goodsListId);
	return Copy(info) or {};
end

--@brief 根据商品列表id获取场景信息
GoodsListInterface.getSceneInfo = function(self, goodsListId)
	if not goodsListId then
		return {};
	end

	local info = self:__getGoodsListFromMemoryAndDict(goodsListId);
	return info and Copy(info.sceneInfo) or {};
end

--@brief 重置更新标记，让所有商品列表重新进行拉取(包括缓存的)
GoodsListInterface.resetGoodsListUpdateFlag = function(self)
	self.m_updatedFlag = {};
end

--@brief 根据chips在商品列表中进行筛选
GoodsListInterface.getGoodsInfoWithChips = function(self, goodsList, chips)
	if not chips then
		return {};
	end
	
	local info = table.verify(Copy(goodsList));
	local comp = function(a, b)
		if not table.isEmpty(a) and not table.isEmpty(b) then
			local pchipsA = tonumber(a.pchips) or 0;
			local pchipsB = tonumber(b.pchips) or 0;
			return pchipsA < pchipsB;
		else
			return false;
		end
	end

	table.sort(info, comp);

	for k, v in pairs(info) do
		local pchips = tonumber(v.pchips) or 0;
		if pchips >= chips then
			return v;
		end
	end

	if not table.isEmpty(info) then
		return info[#info] or {};
	end

	return {};
end

GoodsListInterface.__analysisData = function(self, info)
	local scene = tonumber(info.scene) or -1;
	self:__analysisPayConfig(info.paycfg);
	local goodsList = self:__analysisGoodsList(info.ginfo, scene);
	local sceneInfo = self:__analysisSceneInfo(scene, table.verify(info.sceneinfo) );

	self.m_sceneGoodsMap[scene] = { ["scene"] = scene, ["goodsList"] = goodsList, ["sceneInfo"] = sceneInfo };

	self.m_cacheGoodsMap = table.verify(self.m_cacheGoodsMap);
	self.m_cacheGoodsMap[tostring(scene)] = Copy(self.m_sceneGoodsMap[scene]);

	self.m_updatedFlag[scene] = true;

	self:saveData();
	return self.m_sceneGoodsMap[scene];
end

GoodsListInterface.__analysisGoodsList = function(self, goodsInfo, scene)
	local goodsList = {};
	for k, v in pairs( table.verify(goodsInfo) ) do
		local item = {};
		item.scene = scene;
		item.id = tonumber(v.gid) or 0;           		--商品id
		item.ptype = tonumber(v.ptype) or 0;  			--商品类型 0：游戏币； 1：博雅币； 2：道具； 3：会员卡； 4：钻石； 5：活动； 6：礼包； 7：表情包
		item.name = tostring(v.name) or "";             --商品名称
		item.icon = tostring(v.icon) or "";    			--商品图标
		item.desc = tostring(v.desc) or ""; 			--商品描述
		item.specialDesc = tostring(v.specialDesc) or ""; --特殊描述(包含破产提示信息、商城特权描述)
		item.currency = tonumber(v.currency) or 1;      --货币类型1RMB2银币3钻石 
		item.pamount = tonumber(v.price) or 0;			--商品价格
		item.crystal = tonumber(v.crystal) or 0;        --金条价格，如果>0，则代表支持金条购买，反之则不支持
        item.crystalIcon = tostring(v.crystalIcon) or ""; -- 金条角标
		item.pchips = tonumber(v.number) or 0; 			--商品数量
		item.eventIcon = not string.isEmpty(v.eventIcon) and v.eventIcon or ""; --特殊事件图标url，如推荐、新品等
		item.appstoreid = tostring(v.appstoreid) or ""; -- 应用商店id(例：苹果应用商品商品id)
		item.privilegeIcon = tostring(v.privilegeIcon) or ""; --特权图标
		item.privilegeTips = tostring(v.privilegeTips) or ""; --特权提示
		item.order = tonumber(v.order) or 0; --顺序：排列从小到大
		item.goods_id = tonumber(v.goods_id) or 0;
		item.payCnHost = self.m_payCnHost;
		item.pc_appid = self.m_payAppid;
		item.award = self:__analysisAwardInfo(v.award); --赠送奖励内容,如无则为空数组.{物品ID：物品数量}
		
		item.pmodes = self:__getGoodsPmodes(v.pmodes, item.crystal, scene);
		item.currency_desc = self:__getCurrencyDesc(item.currency, scene);
		item.priorityDesc = self:__getDescByPriority(item.privilegeTips, item.specialDesc);

		table.insert(goodsList, item);
	end

	table.sort(goodsList, function(a, b) 
			if a and b then
				return a.order < b.order;
			end
		end );

	return goodsList;
end

GoodsListInterface.__analysisAwardInfo = function(self, award)
	if table.isEmpty(award) then
		return {};
	end

	for k, v in pairs(award) do
		v.id = tonumber(v.id) or -1; --物品id 对应GoodsClassify
		v.n  = tonumber(v.n)  or 0;  --物品数量
	end

	return award;
end

--@note: 描述信息优先级 privilegeTips > specialDesc
GoodsListInterface.__getDescByPriority = function(self, privilegeTips, specialDesc)
	local data = {privilegeTips, specialDesc};
	for k, v in ipairs(data) do
		if not string.isEmpty(v) then
			return v;
		end
	end
	return "";
end

GoodsListInterface.__getCurrencyDesc = function(self, currencyType,scene)
	local currency_desc = "元购买"
    if scene == RechargeDataInterface.getInstance():getTabMoneyId() then
        currency_desc = "元";
    end
	if currencyType == GoodsListInterface.eCurrencyType.diamond then
		currency_desc = "钻石";
	elseif currencyType == GoodsListInterface.eCurrencyType.gold then
		currency_desc = "银币";
	end

	return currency_desc;
end

--获取pmodes 
--item -> { name = "xxx" , id = "xxx", icon = "xxx", num = "xxx" };
GoodsListInterface.__getGoodsPmodes = function(self, strPmodes, crystalNum, sceneId)
	local str_pmodes = tostring(strPmodes) or "";
    local pmodes = table.verify( json.decode(str_pmodes) );
    local ret = {};
    for k, modeInfo in ipairs(pmodes) do
    	if  not table.isEmpty(modeInfo) and modeInfo.id then
    		
    		local item = {
    			name = tostring(modeInfo.n) or "";
    			id = tostring(modeInfo.id) or "0";
    			icon = self:__getLocalIconByPmode(modeInfo.id);
    			num = 0;
    		};

	     	if System.getPlatform() == kPlatformAndroid then
		     	if item.id == PayConfig.ePayMode.SMS_PMODE then
		     		if kClientInfo:hasPhoneCard() then
		     			table.insert(ret, item);
		     		end
		     	elseif item.id == PayConfig.ePayMode.WEIXIN_V3_PMODE or item.id == PayConfig.ePayMode.WEIXIN_IOS_V3_PMODE then
		     		if SyncNativeEvent.getInstance():syncIsWXAppSupportPaymentForLua() then
		     			table.insert(ret, item);
		     		end
		     	else
		     		if GodSDKHelper.isInGodSDKSupportPmodes(item.id) then
		     			table.insert(ret, item);
		     		end
		     	end
		    else
		    	table.insert(ret, item);
		    end
		end
    end

    --manual insert the pmode of crystal
    if number.valueOf(crystalNum, 0) > 0 and not self:__isFilterCrystal(sceneId) then
    	local item = {
    		name = string.format("%s\n金条", crystalNum);
    		id = PayConfig.ePayMode.LOCAL_CRYSTAL_PMODE;
    		icon = self:__getLocalIconByPmode(PayConfig.ePayMode.LOCAL_CRYSTAL_PMODE);
    		num = crystalNum;
    	};

    	table.insert(ret, 1, item); --insert to the frist position
    end

    return ret;
end

GoodsListInterface.__isFilterCrystal = function(self, sceneId)
	local isVersionFilter = HallDataInterface.getInstance():getVersionFilterSwitch();
	if isVersionFilter then
		return true;
	else
		return false;
	end
end

--@brief 根据pmode来获取支付方式本地icon
GoodsListInterface.__getLocalIconByPmode = function(self, pmode)
	for _, v in pairs(PayConfig.ePayModeIconMap) do
		for k, mode in pairs(v.pmodeList) do
			if tostring(pmode) == tostring(mode) then
				return v.icon;
			end
		end 
	end

	return payChannelIcons_pin_map["pmode_0.png"];
end


GoodsListInterface.__analysisPayConfig = function(self, payConfig)
	payConfig = table.verify(payConfig);
	self.m_payAppid = payConfig.pcAppid or self.m_payAppid or 0; --支付appid(统一支付使用)
	self.m_payCnHost = payConfig.payCnHost or self.m_payCnHost or 0; --支付中心地址(统一支付使用)
end

GoodsListInterface.__analysisSceneInfo = function(self, goodsListId, sceneinfo)
	local uiId = self:__getUIIdBySceneId(goodsListId);
	if uiId == PayConfig.ePayScene.Market then
		return self:__analysisMarketSceneInfo(sceneinfo);

	elseif uiId == PayConfig.ePayScene.ChooseGoodsLayer then
		return self:__analysisChooseGoodsLayerInfo(sceneinfo);
		
	elseif uiId == PayConfig.ePayScene.SingleGoodsLayer then
		return self:__analysisSingleGoodsLayerInfo(sceneinfo);
	end

	return {};
end

GoodsListInterface.__analysisChooseGoodsLayerInfo = function(self, sceneinfo)
	local info = {};
	info.title = sceneinfo.title or "";
	info.header = sceneinfo.header or "";
	info.footer = sceneinfo.footer or "";
	info.timeLimit = sceneinfo.h2pt or 0; --2次付费剩余时间

	return info;
end

GoodsListInterface.__analysisMarketSceneInfo = function(self, sceneinfo)
	local info = {};
	info.tips = sceneinfo.tips or "";

	return info;
end

GoodsListInterface.__analysisSingleGoodsLayerInfo = function(self, sceneinfo)
	local info = {};
	info.header = sceneinfo.header or "";
	info.footer = sceneinfo.footer or "";
	-- info.isDirectPay = sceneinfo.isUseTextPay or 0; --是否直接调用统一支付 1:是 0:否

	return info;
end

GoodsListInterface.__getUIIdBySceneId = function(self, goodsListId)
	for uiId, goodsListIds in pairs(PayConfig.paySceneGoodsListMap) do
		for _, id in pairs(goodsListIds) do
			if id == goodsListId then
				return uiId;
			end
		end 
	end

	return nil;
end

GoodsListInterface.__getGoodsListFromMemoryAndDict = function(self, goodsListId)
	if not table.isEmpty(self.m_sceneGoodsMap[goodsListId]) then
		return self.m_sceneGoodsMap[goodsListId];
	end

	return self:__getCacheGoodsInfo(goodsListId);
end

GoodsListInterface.__getCacheGoodsInfo = function(self, goodsListId)
	return self.m_cacheGoodsMap[ tostring(goodsListId) ] or {}; --需要存储到dict中，key需要为string类型
end

GoodsListInterface.__isNeedObtain = function(self, goodsListId)
	if not goodsListId then
		Log.v("GoodsListInterface.__isNeedObtain not goodsListId!!!!");
		return false;
	end

	if not self.m_updatedFlag[goodsListId] then
		--如果更新标记为false，则拉取
		return true;
	end

	local info = self.m_sceneGoodsMap[goodsListId];
	if table.isEmpty(info) or table.isEmpty(info.goodsList) then
		--如果本地数据为空，则拉取
		return true;
	end

	if self:__isNoCacheType(goodsListId) then
		--如果列表不进行缓存，则拉取
		return true;
	end

	return false;
end

GoodsListInterface.__isNoCacheType = function(self, goodsListId)
	return  self:__getCacheType(goodsListId) == PayConfig.eCacheType.NoCache and true or false;
end

GoodsListInterface.__isDictCacheType = function(self, goodsListId)
	return self:__getCacheType(goodsListId) == PayConfig.eCacheType.DictCache and true or false;
end

GoodsListInterface.__getCacheType = function(self, goodsListId)
	for cacheType, goodsListIds in pairs(PayConfig.GoodsListCacheMap) do
		for _, id in ipairs(goodsListIds) do
			if id == goodsListId then
				return cacheType;
			end
		end
	end

	return PayConfig.eCacheType.NoCache;
end

GoodsListInterface.loadDictData = function(self, dict)
	local strGoodsInfo = dict:getString("strGoodsInfo");
	local goodsInfo = json.decode(strGoodsInfo);
	if not table.isEmpty(goodsInfo) then
		self.m_cacheGoodsMap = goodsInfo;
	else
		self.m_cacheGoodsMap = {};
	end
end

GoodsListInterface.saveDictData = function(self, dict)
	local strGoodsInfo = json.encode(self.m_cacheGoodsMap) or "";
	dict:setString("strGoodsInfo", strGoodsInfo);
end

GoodsListInterface.getLocalDictName = function(self)
	self.m_userCid = self.m_userCid or kUserInfoData:getUserCid();
	return "GoodsListInterface" .. self.m_userCid;
end


GoodsListInterface.s_socketCmdFuncMap = {
	[PHP_GOODS_INFO] = GoodsListInterface.onGetGoodsInfoCallBack;
}


kGoodsListInterface = GoodsListInterface.getInstance();