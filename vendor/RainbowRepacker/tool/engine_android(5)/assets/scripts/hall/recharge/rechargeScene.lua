require("common/commonScene");
require("ui/toast");
local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
local RechargeLayer = require("hall/recharge/widget/rechargeLayer");
local RechargeVipItem = require("hall/recharge/widget/rechargeVipItem");
local RechargePreroItem = require("hall/recharge/widget/rechargePreroItem");

RechargeScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

RechargeScene.s_controls = 
{	
	returnBtn = getIndex(),

	tabMoney = getIndex(),
	tabVip = getIndex(),
	tabCrystal = getIndex(),
	tabProp = getIndex();

	moneyLayer = getIndex(),
	goodsView = getIndex(),
	errorText = getIndex(),

	vipLayer = getIndex(),
	vipList = getIndex(),
	preroList = getIndex(),
    
	bottomBarBg = getIndex(),
	bottomBarDesc = getIndex(),
    bottomBarBtn = getIndex(),
    bottomBarBtnText = getIndex(),
    adImg = getIndex(),

    selfGoldNum = getIndex(),
    selfCrystalView = getIndex(),
    selfCrystalNum = getIndex(),
}

RechargeScene.s_cmds = 
{
	UpdateChargeList = getIndex(),
	RequestTimeOut = getIndex(),
	updateVipGoods = getIndex(),
	updateVipprops = getIndex(),
	updateCrystalGoods = getIndex(),
	updateBottomAd = getIndex(),
	UpdateTabs     = getIndex(); 
	updatePropGoods = getIndex();
	updateTopAd = getIndex();
}

RechargeScene.s_tabImage = 
{
	[RechargeScene.s_controls.tabMoney] = {"title_gold_nor.png", "title_gold_sel.png"},
	[RechargeScene.s_controls.tabVip] = {"title_vip_nor.png", "title_vip_sel.png"},
	[RechargeScene.s_controls.tabCrystal] = {"title_crystal_nor.png", "title_crystal_sel.png"},
	[RechargeScene.s_controls.tabProp] = {"title_prop_nor.png", "title_prop_sel.png"},
}

RechargeScene.ctor = function(self, viewConfig, controller)
	self.m_ctrls = RechargeScene.s_controls;
	self.m_controller = controller;	

	self.m_tabMoney = self:findViewById(self.s_controls.tabMoney);
	self.m_tabVip = self:findViewById(self.s_controls.tabVip);
	self.m_tabCrystal = self:findViewById(self.s_controls.tabCrystal);
	self.m_tabProp = self:findViewById(self.s_controls.tabProp);
	self.m_moneyLayer = self:findViewById(self.s_controls.moneyLayer);

	self.m_vipLayer = self:findViewById(self.s_controls.vipLayer);
	self.m_vipList = self:findViewById(self.s_controls.vipList);
	self.m_preroList = self:findViewById(self.s_controls.preroList);
    self.m_bottomBar = self:findViewById(self.s_controls.bottomBarBg);
    self.m_bootomDesc = self:findViewById(self.s_controls.bottomBarDesc);
    self.m_bootBtnText = self:findViewById(self.s_controls.bottomBarBtnText);

	local listView = self:findViewById(self.m_ctrls.goodsView);
	local w,h = listView:getSize();
	local layer = new(RechargeLayer,w,h, require("hall/recharge/widget/rechargeItem") );
	listView:addChild(layer);
	layer:setDelegate(self);
	self.m_goodsLayer = layer;
	self.m_bottomBar:setVisible(false);

	kUserInfoData:setObserver(self);
    self:__showTopAdView();
    self:__setBagBtnVisible(false);
    self.m_vipLayer:setVisible(false);
end


RechargeScene.__showTopAdView = function (self)
    if not self.m_showTopAdView then
		self.m_showTopAdView = new(require("hall/recharge/widget/rechargeTopAd"));
		self.m_showTopAdView:setFillParent(true, true);
		self.m_root:addChild(self.m_showTopAdView);
	end
end

RechargeScene.__setBagBtnVisible = function (self, isShow)
    if self.m_showTopAdView then
        self.m_showTopAdView:setBagBtnVisible(isShow);
    end
end

RechargeScene.updateBottomAd = function(self,info)
	if not(self.m_curShowTab == self.m_tabMoney or self.m_curShowTab == self.m_tabCrystal) then 
		return;
	end 
	
	if info and info.display == 1 then 
		self.m_bottomBar:setVisible(true);
		self:openBottomBar();
		if kUserInfoData:getIsVip() then 
			self.m_bootomDesc:setText("点击查看VIP特权");
		else 
			self.m_bootomDesc:setText(info.tips);
		end 
		self.m_bootBtnText:setText(info.btn_text);
		if info.icon then
			ImageCache.getInstance():request(info.icon, self, RechargeScene.onUpdateBottomImage);
		end
	end 
end       

RechargeScene.onUpdateBottomImage = function(self, url, imagePath)
	if imagePath then
	   local image = new(Image, imagePath);
       image:setAlign(kAlignBottom);
       local adImg = self:findViewById(self.s_controls.adImg);
       adImg:addChild(image);
	end
end

RechargeScene.__onDelayResumeScene = function(self)
	CommonScene.__onDelayResumeScene(self);

	self:onUpdateMoneyAndDiamond();

	if not self.m_hasEnter then
		self.m_hasEnter = true;
		local mode = RechargeDataInterface.getInstance():getToRechargeMode();

		if mode == RechargeDataInterface.getInstance():getTabVipId()  then
			self:onTabVipClick();
		elseif mode == RechargeDataInterface.getInstance():getTabCrystalId() then
			self:onTabCrystalClick();
		elseif mode == RechargeDataInterface.getInstance():getTabPropId() then
			self:onTabPropClick();
		else
			self:onTabMoneyClick();
		end
	end
end

RechargeScene.pause = function(self)
	CommonScene.pause(self);
end

RechargeScene.dtor = function(self)
	local defaultId = RechargeDataInterface.getInstance():getDefaultTabId();
	RechargeDataInterface.getInstance():setToRechargeMode(defaultId);
	ImageCache.getInstance():cleanRef(self);
	kUserInfoData:clearObserver(self);
end

--------------------------------- 控件回调函数 --------------------------
RechargeScene.onReturnBtnClick = function(self)
	self.m_controller:handleCmd(RechargeController.s_cmds.GoBack);
end

RechargeScene.onPaymentConfirmed = function(self, sceneId, data)
	self.m_controller:handleCmd(RechargeController.s_cmds.RequestPay, sceneId, data);
end 

-------------------------------- 命令响应函数 ---------------------------------
RechargeScene.onUpdateChargeList = function(self, data)
	if self:__checkIsUpdate(data.scene) then
		self:findViewById(self.m_ctrls.errorText):setVisible(false);
		self.m_goodsLayer:handleCmd(RechargeLayer.s_cmds.UpdateData, data.goodsList);
	end
end

RechargeScene.openBottomBar = function(self)
	if self.m_openedBottom then
		return;
	end 
	self.m_bottomBar:removeProp(self.m_bottomBar.m_drawingID);
    self.m_bottomBar:addPropTranslate(self.m_bottomBar.m_drawingID,kAnimNormal,500,0,0,0,300,0);
    self.m_openedBottom = true;
end

RechargeScene.closeBottomBar= function(self)
	if not self.m_openedBottom then
		return ;
	end 
	self.m_bottomBar:removeProp(self.m_bottomBar.m_drawingID);
    self.m_bottomBar:addPropTranslate(self.m_bottomBar.m_drawingID,kAnimNormal,500,0,0,0,0,300);
    self.m_openedBottom = false;
end

RechargeScene.onRequestTimeOut = function(self,timeOutType)
	if self.m_goodsLayer:isEmpty() then
		local tipsText = GameString.get("requestRechargeListTimeOut");
		local errorTextTmp = self:findViewById(self.m_ctrls.errorText);
		errorTextTmp:setVisible(true);
		errorTextTmp:setText(tipsText);
	end
end

RechargeScene.onNativeTabMoneyClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallMallTabMoney)
	self:onTabMoneyClick()
end

RechargeScene.onTabMoneyClick = function(self)
	self:setSelectTab(self.m_tabMoney);

	self.m_moneyLayer:setVisible(true);
	self.m_vipLayer:setVisible(false);
	self:__setBagBtnVisible(false);
	self.m_controller:handleCmd(RechargeController.s_cmds.RequestMoneyGoods);
	self:openBottomBar();
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.kHallMarketGold);
    self:updateTopAd( RechargeDataInterface.getInstance():getTabMoneyId() );
end

RechargeScene.onNativeTabCrystalClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallMallTabCrystal)
	self:onTabCrystalClick()
end

RechargeScene.onTabCrystalClick = function(self)
 	self:setSelectTab(self.m_tabCrystal);
	self.m_moneyLayer:setVisible(true);
	self.m_vipLayer:setVisible(false);
	self:__setBagBtnVisible(false);
	self.m_goodsLayer:handleCmd(RechargeLayer.s_cmds.UpdateData,{});
    self.m_controller:handleCmd(RechargeController.s_cmds.RequestCrystalGoods);
	self:openBottomBar();

	self:updateTopAd( RechargeDataInterface.getInstance():getTabCrystalId() );
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.kHallMarketCrystal);
end

RechargeScene.onNativeTabPropClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallMallTabProp)
	self:onTabPropClick()
end

RechargeScene.onTabPropClick = function(self)
 	self:setSelectTab(self.m_tabProp);
	self.m_moneyLayer:setVisible(true);
	self.m_vipLayer:setVisible(false);
	self:__setBagBtnVisible(true);
	self.m_goodsLayer:handleCmd(RechargeLayer.s_cmds.UpdateData,{});
    self.m_controller:handleCmd(RechargeController.s_cmds.RequestPropGoods);
    self:closeBottomBar();

    self:updateTopAd( RechargeDataInterface.getInstance():getTabPropId() );
end

RechargeScene.onNativeTabVipClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallMallTabVip)
	self:onTabVipClick()
end

RechargeScene.onTabVipClick = function(self)
	self:setSelectTab(self.m_tabVip);

	self.m_moneyLayer:setVisible(false);
	self.m_vipLayer:setVisible(true);
	self:__setBagBtnVisible(false);
	self.m_controller:handleCmd(RechargeController.s_cmds.RequestVipGoods);
	self:closeBottomBar();
    RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.kHallMarketVip);

    self:updateTopAd( RechargeDataInterface.getInstance():getTabVipId() );
end

RechargeScene.onCheckPrivilege = function(self)
	UBReport.getInstance():report(UBConfig.kHallMallPrivilege);
	self:onTabVipClick();
end

RechargeScene.setSelectTab = function(self, selectTab)
	self:findViewById(self.m_ctrls.errorText):setVisible(false);
	self:resetTabs();

	local tabs = {self.m_tabMoney, self.m_tabCrystal, self.m_tabVip, self.m_tabProp};
	local tabIndexs = {RechargeScene.s_controls.tabMoney, RechargeScene.s_controls.tabCrystal, RechargeScene.s_controls.tabVip, RechargeScene.s_controls.tabProp};
	self.m_curShowTab = selectTab;
	for k, v in pairs(tabs) do
		if v == selectTab then
			v:getChildByName("img_title"):setFile(market_pin_map[RechargeScene.s_tabImage[tabIndexs[k]][2]]);
			v:getChildByName("tab_bg"):setVisible(true);
			v:setPickable(false);
		else
			v:getChildByName("tab_bg"):setVisible(false);
			v:setPickable(true);
		end
	end
end

RechargeScene.__checkIsUpdate = function(self, scene)
	if (scene == PayConfig.eGoodsListId.MarketGold and self.m_curShowTab == self.m_tabMoney)
		or (scene == PayConfig.eGoodsListId.MarketCrystal and self.m_curShowTab == self.m_tabCrystal)
		or (scene == PayConfig.eGoodsListId.MarketProp and self.m_curShowTab == self.m_tabProp) then

		return true;
	else
		return false;
	end
end

RechargeScene.resetTabs = function(self)
	self.m_tabMoney:getChildByName("img_title"):setFile(market_pin_map[RechargeScene.s_tabImage[RechargeScene.s_controls.tabMoney][1]]);
	self.m_tabCrystal:getChildByName("img_title"):setFile(market_pin_map[RechargeScene.s_tabImage[RechargeScene.s_controls.tabCrystal][1]]);
	self.m_tabVip:getChildByName("img_title"):setFile(market_pin_map[RechargeScene.s_tabImage[RechargeScene.s_controls.tabVip][1]]);
	self.m_tabProp:getChildByName("img_title"):setFile(market_pin_map[RechargeScene.s_tabImage[RechargeScene.s_controls.tabProp][1]]);
end

RechargeScene.updateTabs = function(self, tabsConfig)
	local TAB_MONEY = RechargeDataInterface.getInstance():getTabMoneyId();
	local TAB_VIP = RechargeDataInterface.getInstance():getTabVipId();
	local TAB_CRYSTAL = RechargeDataInterface.getInstance():getTabCrystalId();
	local TAB_PROP = RechargeDataInterface.getInstance():getTabPropId();
	
	local TabsCtrlMap = {
		[TAB_MONEY] = RechargeScene.s_controls.tabMoney;
		[TAB_VIP] = RechargeScene.s_controls.tabVip;
		[TAB_CRYSTAL] = RechargeScene.s_controls.tabCrystal;
		[TAB_PROP] = RechargeScene.s_controls.tabProp;
	};

	for k, ctrlId in pairs(TabsCtrlMap) do
		self:findViewById(ctrlId):getParent():setVisible(false);
	end

	local startX = 20;
	local visibleNum = 0;
	local space = 0;
	for index = #tabsConfig, 1, -1 do
		local ctrlId = TabsCtrlMap[ tabsConfig[index].tid ];
		if ctrlId then
			local ctrl = self:findViewById(ctrlId):getParent();
			ctrl:setAlign(kAlignTopRight);
			ctrl:setVisible(true);
			local w,h = ctrl:getSize();
			ctrl:setSize(w,h);
			ctrl:setPos(startX + visibleNum*(w+space), nil);
			visibleNum = visibleNum + 1;

			if index == 1 then
				local lineImg = ctrl:getChildByName("line");
				lineImg:setVisible(false);
			end
		end
	end
end

RechargeScene.updateVipGoods = function(self, data)
	if not self.vipDataAdapter then
		self.m_vipList:setAutoAlignToItemEdge(true);
		self.vipDataAdapter = new(CacheAdapter, RechargeVipItem, data.goodsList);
		self.m_vipList:setAdapter(self.vipDataAdapter);
		self.m_vipList:setDirection(kHorizontal);
	end

	self.vipDataAdapter:changeData(data.goodsList);
	local firstView = self.vipDataAdapter:getView(1);
	local x = firstView:getPos();
	self.m_preroList:setPos(x);
end

RechargeScene.preproLayerWidth = 1190;

RechargeScene.updateVipprops = function(self, data)
	if not self.preroDataAdapter then
		local param = {};
		table.sort( data, function(a,b)	--根据index从小到大排序
			if not (a and b) then
				return true;
			end 		
			return a.sort < b.sort;
		end );

		local itemWidth, itemHeight = self.m_preroList:getSize();
		local itemNum = itemWidth / 160;
		for i, v in pairs(data) do
			local page = math.ceil(i / itemNum);
			if not param[page] then
				param[page] = {};
			end
			table.insert(param[page], v);
		end

		RechargeScene.preproLayerWidth = itemWidth;

		self.preroDataAdapter = new(CacheAdapter, PreroView, param);
		self.m_viewPager = new(ViewPager, 0, 0, self.m_preroList:getSize());
		self.m_viewPager:setAdapter(self.preroDataAdapter);
		self.m_preroList:addChild(self.m_viewPager);
	end
end

RechargeScene.onUpdateMoneyAndDiamond = function(self)
	local function __refreshMoney(text, money)
        local __decimals = (money >= 1000000) and  0 or 2;   --超过百万不显示小数部分
        __moneyStr = ToolKit.skipMoneyEx5(money,__decimals);
        text:setText(__moneyStr, 1);
    end

    __refreshMoney(self:findViewById(self.s_controls.selfGoldNum), kUserInfoData:getMoney())
	self:findViewById(self.s_controls.selfCrystalView):setVisible(true);
	__refreshMoney(self:findViewById(self.s_controls.selfCrystalNum), kUserInfoData:getCrystal())
end

RechargeScene.refreshUserProperty = function(self)
	self:onUpdateMoneyAndDiamond();
end


RechargeScene.updateTopAd = function(self, tabId)
    local tab = tabId or self.m_topTabId or RechargeDataInterface.getInstance():getToRechargeMode();
    local adInfo = RechargeDataInterface.getInstance():getRechargeTabsAd(tab);
    self.m_topTabId = tab;
    if self.m_showTopAdView then
        self.m_showTopAdView:showAdText(adInfo.content or "");
	end
end

----------------------------------- config ------------------------------

RechargeScene.s_controlConfig = 
{
	[RechargeScene.s_controls.returnBtn] 	= {"topView","returnBtn"},
	[RechargeScene.s_controls.tabMoney]  	= {"topView", "tabMoneyView", "tabMoney"},
	[RechargeScene.s_controls.tabVip]		= {"topView", "tabVipView", "tabVip"},
	[RechargeScene.s_controls.tabCrystal]	= {"topView", "tabCrystalView", "tabCrystal"},
	[RechargeScene.s_controls.tabProp]      = {"topView", "tabPropView", "tabProp"},
	[RechargeScene.s_controls.moneyLayer]	= {"moneyLayer"},
	[RechargeScene.s_controls.goodsView] 	= {"moneyLayer", "goodsListView"},
	[RechargeScene.s_controls.errorText] 	= {"moneyLayer", "error_text"},

	[RechargeScene.s_controls.vipLayer]		= {"vipLayer"},
	[RechargeScene.s_controls.vipList]		= {"vipLayer", "vipLayerBg", "vipList"},
	[RechargeScene.s_controls.preroList]	= {"vipLayer", "vipLayerBg", "preroLayer", "preroList"},
   
    [RechargeScene.s_controls.bottomBarBg]		= {"bottomBarBg"},
	[RechargeScene.s_controls.bottomBarBtn]		= {"bottomBarBg", "btn"},
	[RechargeScene.s_controls.bottomBarBtnText]		= {"bottomBarBg","btn","btn_text"},
	[RechargeScene.s_controls.bottomBarDesc]		= {"bottomBarBg", "desc"},
	[RechargeScene.s_controls.adImg] 				= {"bottomBarBg","vipIconView"};

	[RechargeScene.s_controls.selfGoldNum] = {"topView", "topBg", "goldView", "bg", "num"},
    [RechargeScene.s_controls.selfCrystalView] = {"topView", "topBg", "crystalView"},
    [RechargeScene.s_controls.selfCrystalNum] = {"topView", "topBg", "crystalView", "bg", "num"},

}

RechargeScene.s_controlFuncMap = 
{
	[RechargeScene.s_controls.returnBtn]	 = RechargeScene.onReturnBtnClick,
	[RechargeScene.s_controls.tabMoney]		 = RechargeScene.onNativeTabMoneyClick,
	[RechargeScene.s_controls.tabVip]		 = RechargeScene.onNativeTabVipClick,
	[RechargeScene.s_controls.tabCrystal]	 = RechargeScene.onNativeTabCrystalClick,
	[RechargeScene.s_controls.tabProp]		 = RechargeScene.onNativeTabPropClick,
	[RechargeScene.s_controls.bottomBarBtn]	 = RechargeScene.onCheckPrivilege,
}

------------------------------------- 命令响应函数配置 ------------------------
RechargeScene.s_cmdConfig =
{
	[RechargeScene.s_cmds.UpdateChargeList] = RechargeScene.onUpdateChargeList,
	[RechargeScene.s_cmds.updatePropGoods] = RechargeScene.onUpdateChargeList;
	[RechargeScene.s_cmds.updateCrystalGoods] = RechargeScene.onUpdateChargeList;

	[RechargeScene.s_cmds.updateVipGoods] = RechargeScene.updateVipGoods;

	[RechargeScene.s_cmds.RequestTimeOut] = RechargeScene.onRequestTimeOut,
	[RechargeScene.s_cmds.updateVipprops] = RechargeScene.updateVipprops;
	[RechargeScene.s_cmds.updateBottomAd] = RechargeScene.updateBottomAd;
	[RechargeScene.s_cmds.UpdateTabs]     = RechargeScene.updateTabs;
	[RechargeScene.s_cmds.updateTopAd] = RechargeScene.updateTopAd;
}

PreroView = class(CommonGameLayer, false);

PreroView.ctor = function(self, data)
	super(self, nil);
	self.data = data;
	self:setSize(RechargeScene.preproLayerWidth, 170);
	self:initViews();
end

PreroView.dtor = function(self)
	delete(self.data);
	self.data = nil;
end

PreroView.initViews = function(self)
	local itemWidth = 165;
	for i, v in pairs(self.data) do
		local view = new(RechargePreroItem, v);
		view:setPos((i-1)*itemWidth, 0);
		self:addChild(view);
	end
end
