require("common/commonScene");
require("hall/diamondShop/widget/diamondShopGoodItem");
require("hall/diamondShop/data/diamondShopConstants");
require("hall/gameData/txtMgr");

DiamondShopScene = class(CommonScene);

DiamondShopScene.s_controls = 
{
	bg = 1;
	topBg = 2;
	backBtn = 3;
	recordBtn = 4;
	contentBg = 6;
	tabListView = 7;
	goodsBg = 8; 
	timeLimitGoods = 9;
	otherGoodsListView = 10;

	recordBg = 11;
	recordListView = 12;
	recordErrorText = 13;

	diamondNum = 14;
	goodsErrorInfo = 16;

	diamondShopBtn = 17;
	
    limitgoodsBg = 19;
};

DiamondShopScene.s_cmds = 
{
	showTabs = 1;
	showGoods = 2;
	showRecord = 3;
};

DiamondShopScene.ctor = function(self,viewConfig,controller)
	self.m_controller = controller;
	self.m_ctrl = DiamondShopScene.s_controls; 
	self:_findViews();
	self:_init();
	LoadingView.getInstance():showText("数据加载中...");
end

DiamondShopScene._findViews = function(self)
	self.m_bg = self:findViewById(self.m_ctrl.bg);
	self.m_topBg = self:findViewById(self.m_ctrl.topBg);
	self.m_backBtn = self:findViewById(self.m_ctrl.backBtn);
	self.m_recordBtn = self:findViewById(self.m_ctrl.recordBtn);
	self.m_diamondNum = self:findViewById(self.m_ctrl.diamondNum);

	self.m_contentBg = self:findViewById(self.m_ctrl.contentBg);
	self.m_tabListView = self:findViewById(self.m_ctrl.tabListView);
	self.m_goodsBg = self:findViewById(self.m_ctrl.goodsBg);
    self.m_limitgoodsBg = self:findViewById(self.m_ctrl.limitgoodsBg);
	self.m_timeLimitGoods = self:findViewById(self.m_ctrl.timeLimitGoods);

	-- m_goodsBg和m_otherGoodsListView中间加一层view，
	-- 避免因为父节点m_goodsBg比子节点m_otherGoodsListView小导致引擎对m_otherGoodsListView裁剪出错
	local w,h = self.m_timeLimitGoods:getSize();
	local view = new(Node);
	view:setSize(w, h);
	view:setAlign(kAlignCenter);
	self.m_goodsBg:addChild(view);
	self.m_otherGoodsListView = UIFactory.createGridView(0, 0, w, h); 
	view:addChild(self.m_otherGoodsListView);

	self.m_recordBg = self:findViewById(self.m_ctrl.recordBg);
	self.m_recordListView = self:findViewById(self.m_ctrl.recordListView);
	self.m_recordErrorText = self:findViewById(self.m_ctrl.recordErrorText);

	self.m_goodsErrorInfo = self:findViewById(self.m_ctrl.goodsErrorInfo);
	self.m_goodsErrorInfo:setVisible(false);

	self.m_diamondShopBtn = self:findViewById(self.m_ctrl.diamondShopBtn);
	self.m_recordBtn:setVisible(true);
	self.m_diamondShopBtn:setVisible(false);
end

DiamondShopScene.dtor = function(self)
	Log.v("---------DiamondShopScene.dtor ---------");
	LoadingView.getInstance():hidden();

	delete(self.m_diamondShopDialogLayer);
	self.m_diamondShopDialogLayer = nil;

	delete(self.m_diamondShopMessage);
	self.m_diamondShopMessage = nil;

	delete(self.m_diamondShopResult);
	self.m_diamondShopResult = nil;
end

DiamondShopScene.resume = function(self)
	CommonScene.resume(self);
	kUserInfoData:setObserver(self);
	TxtMgr.getInstance():setObserver(self);
end

DiamondShopScene.pause = function(self)
	CommonScene.pause(self);
	kUserInfoData:clearObserver(self);
	TxtMgr.getInstance():clearObserver(self);
end

--------------------------------------------------------
DiamondShopScene.onBackClick = function(self)
	self:requestCtrlCmd(DiamondShopController.s_cmds.onBack);
end

DiamondShopScene._init = function(self)
	self.m_diamondNum:setText(kUserInfoData:getDiamond());
end

DiamondShopScene.onGetClientMsgCallBack = function(self,isSuccess,config)
	if isSuccess then 
		self:_init();
	end 
end

DiamondShopScene.updateDiamond = function(self)
	self.m_diamondNum:setText(kUserInfoData:getDiamond());
end

---显示Tab
DiamondShopScene.onShowTabs = function(self,data)
	Log.v("-------DiamondShopScene.onShowTabs------",data);
	LoadingView.getInstance():hidden();

	if data and #table.verify(data)>0 then
		for k,v in pairs(data) do
			if v.sort and tonumber(v.sort) == 1 then
				self:requestCtrlCmd(DiamondShopController.s_cmds.getGoods,v["id"],v["showtype"]);
				break;
			end
		end	

		local DiamondShopTabItem = require("hall/diamondShop/widget/diamondShopTabItem");
		local tabsAdapter = new(CacheAdapter,DiamondShopTabItem,data);
		self.m_tabListView:setAdapter(tabsAdapter);
   		DiamondShopTabItem.setOnClickEvent(self,self.onTabClick);
	else
		self.m_timeLimitGoods:setVisible(false);
		self.m_otherGoodsListView:setVisible(false);
		self.m_goodsErrorInfo:setVisible(true);
	end
end

---点击Tabclick
DiamondShopScene.onTabClick = function(self,id,showtype)
	Log.v("--------DiamondShopScene.onTabClick--------");
	UBReport.getInstance():report(UBConfig.kHallExchangeTab, string.format("id_%s", id or ""));
	self:requestCtrlCmd(DiamondShopController.s_cmds.getGoods,id,showtype);
end

--显示商品
DiamondShopScene.onShowGoods = function(self,data)
	Log.v("--------------DiamondShopScene.onShowGoods-----------");
	LoadingView.getInstance():hidden();
	self:__hideAllViews();

	if #table.verify(data) > 0 then
		if tonumber(data[1]["showtype"]) == DiamondShopConstants.eGoodsShowType.Sales then --限时兑换
			self:__onShowTimeLimitView(data);
		else
			self:__onShowOtherGoods(data);
		end
	else
		self.m_goodsErrorInfo:setVisible(true);
	end
end

--隐藏所有的view
DiamondShopScene.__hideAllViews = function(self)
	self.m_timeLimitGoods:setVisible(false);
	self.m_otherGoodsListView:setVisible(false);
	self.m_goodsErrorInfo:setVisible(false);
    self.m_limitgoodsBg:setVisible(false);	
end

---显示限时兑换页面
DiamondShopScene.__onShowTimeLimitView = function(self,data)
	Log.v("-------DiamondShopScene.__onShowTimeLimitView---------")
	self.m_timeLimitGoods:setVisible(true);
	self.m_limitgoodsBg:setVisible(true);

	if not self.m_timeLimitView then

		local DiamondShopTimeLimit = require("hall/diamondShop/widget/diamondShopTimeLimit");
		self.m_timeLimitView = new(DiamondShopTimeLimit,data);
		self.m_timeLimitView:setDelegate(self);
		self.m_timeLimitGoods:addChild(self.m_timeLimitView);
	end

    self.m_timeLimitView:show();
end

--delegate 在显示兑换页面点击兑换商品
DiamondShopScene.onDiamondShopTimeLimitExchangeBtnClick = function(self, data)
	self:__showDiamondShopDialogLayer(data);
end

--显示其他兑换商品列表
DiamondShopScene.__onShowOtherGoods = function(self,data)
	Log.v("--------DiamondShopScene.__onShowOtherGoods-----",data);
	self.m_otherGoodsListView:setVisible(true);
	local goodsAdapter = new(CacheAdapter,DiamondShopGoodsItem,data);
    self.m_otherGoodsListView:setAdapter(goodsAdapter);
    self.m_otherGoodsListView:setOnItemClick(self, self.onOtherGoodsListItemClick);
end

--开始进行兑换流程，显示兑换弹框
DiamondShopScene.__showDiamondShopDialogLayer = function (self,data)
    delete(self.m_diamondShopDialogLayer);
    
    local DiamondShopDialog = require("hall/diamondShop/widget/diamondShopDialog");
    self.m_diamondShopDialogLayer =  new(DiamondShopDialog, data);
    self.m_diamondShopDialogLayer:addToRoot();
    self.m_diamondShopDialogLayer:setDelegate(self);
    self:pushStateStack(self, self.onDiamondShopDialogLayerClose);
end

--delegate 关闭兑换弹框
DiamondShopScene.onDiamondShopDialogLayerClose = function(self, isManualClose)
    if isManualClose then
        self:popStateStack();
    end
    delete(self.m_diamondShopDialogLayer);
    self.m_diamondShopDialogLayer = nil;
end

--显示实物兑换弹框
DiamondShopScene.onShowDiamondShopMessageLayer = function(self, data)
	self:onDiamondShopDialogLayerClose(true);

	delete(self.m_diamondShopMessage);

	local DiamondShopMessage = require("hall/diamondShop/widget/diamondShopMessage");
	self.m_diamondShopMessage = new(DiamondShopMessage, data);
	self.m_diamondShopMessage:addToRoot();
	self.m_diamondShopMessage:setDelegate(self);
	self:pushStateStack(self, self.onDiamondShopMessageLayerClose);
end

--delegate 关闭实物兑换弹框
DiamondShopScene.onDiamondShopMessageLayerClose = function(self, isManualClose)
    if isManualClose then
        self:popStateStack();
    end
    delete(self.m_diamondShopMessage);
    self.m_diamondShopMessage = nil;
end

--delegate 显示兑换结果
DiamondShopScene.onShowDiamondShopResultLayer = function(self, info)
	delete(self.m_diamondShopResult);

	local DiamondShopResult = require("hall/diamondShop/widget/diamondShopResult");
	self.m_diamondShopResult = new(DiamondShopResult, info);
	self.m_diamondShopResult:addToRoot();
	self.m_diamondShopResult:setDelegate(self);
	self:pushStateStack(self, self.onDiamondShopResultLayerClose);
end

--delegate 关闭实物兑换弹框
DiamondShopScene.onDiamondShopResultLayerClose = function(self, isManualClose)
    if isManualClose then
        self:popStateStack();
    end
    delete(self.m_diamondShopResult);
    self.m_diamondShopResult = nil;	
end

--点击兑换商品列表
DiamondShopScene.onOtherGoodsListItemClick = function (self,adapter, item, index, x, y)
    if item:isExchangeBtnClick(x, y) then
    	local data = item:getData()
    	if data and data.gid then
        	UBReport.getInstance():report(UBConfig.kHallExchangeTabItem, string.format("gid_%s", data.gid));
        end
        if tonumber(kUserInfoData:getDiamond()) >= tonumber(data.diamond) then
            if LoginDataInterface.getInstance():getLastUType() == LoginConstants.uType.Guest then
                IBaseDialog.pushDialog(new(require("hall/login/widget/registerBindingGuide"),LoginConstants.eBindingGuideType.MALL_EXCHANGE));
                return;
            end
        end
        self:__showDiamondShopDialogLayer( item:getData() );
    end
end

--点击兑换记录
DiamondShopScene.onRecordClick = function(self)
	Log.v("---DiamondShopScene.onRecordClick---");
	UBReport.getInstance():report(UBConfig.kHallExchangeRecords);
	LoadingView.getInstance():showText("数据加载中...");
	self.m_recordErrorText:setVisible(false);
	self:setRecordViewVisible(true);
	self:requestCtrlCmd(DiamondShopController.s_cmds.getRecord);
end

--刷新兑换记录
DiamondShopScene.onShowRecord = function(self,data)
	LoadingView.getInstance():hidden();
	if #data > 0 then
		self.m_recordErrorText:setVisible(false);

		local DiamondShopRecordItem = require("hall/diamondShop/widget/diamondShopRecordItem");
		local recordAdapter = new(CacheAdapter,DiamondShopRecordItem,data);
    	self.m_recordListView:setAdapter(recordAdapter);
        self.m_recordListView:setOnItemClick(self, self.onRecordListItemClick);
    else
    	self.m_recordErrorText:setVisible(true);
    end
end

--点击兑换记录item
DiamondShopScene.onRecordListItemClick = function (self,adapter, item, index, x, y)
    if item:isLookDetailTouched(x, y) then
        self:__showDiamondShopRecordMoreInfo( item:getData() );
    end
end

--delegate 显示兑换记录详情
DiamondShopScene.__showDiamondShopRecordMoreInfo = function (self,data)
    delete(self.m_diamondShopRecordMoreInfo);

    local DiamondShopRecordMoreInfo = require("hall/diamondShop/widget/diamondShopRecordMoreInfo");
    self.m_diamondShopRecordMoreInfo =  new(DiamondShopRecordMoreInfo, data);
    self.m_diamondShopRecordMoreInfo:addToRoot();
    self.m_diamondShopRecordMoreInfo:setDelegate(self);
    self:pushStateStack(self, self.onDiamondShopRecordMoreInfoClose);
end

--delegate 关闭兑换记录详情
DiamondShopScene.onDiamondShopRecordMoreInfoClose = function(self, isManualClose)
    if isManualClose then
        self:popStateStack();
    end
    delete(self.m_diamondShopRecordMoreInfo);
    self.m_diamondShopRecordMoreInfo = nil;
end

DiamondShopScene.onDiamondShopClick = function(self)
	self:setRecordViewVisible(false);
end 

DiamondShopScene.setRecordViewVisible = function(self, visible)
	self.m_diamondShopBtn:setVisible(visible);
	self.m_recordBtn:setVisible(not visible);

	self.m_recordBg:setVisible(visible);
	self.m_contentBg:setVisible(not visible);
end

DiamondShopScene.refreshUserProperty = function(self,propertyType,curNum,lastNum)
	self:updateDiamond();
end

DiamondShopScene.s_controlConfig = 
{
	[DiamondShopScene.s_controls.bg] = {"bg"};
	[DiamondShopScene.s_controls.topBg] = {"topBg"};
	[DiamondShopScene.s_controls.backBtn] = {"topBg","backBtn"};
	[DiamondShopScene.s_controls.recordBtn] = {"topBg","recordBtn"};
	[DiamondShopScene.s_controls.diamondNum] = {"topBg","diamondNumBg","diamondNum"};
	[DiamondShopScene.s_controls.diamondShopBtn] = {"topBg","diamondShopBtn"};

	[DiamondShopScene.s_controls.contentBg] = {"contentBg"};
	[DiamondShopScene.s_controls.tabListView] = {"contentBg","TabListView"};
	[DiamondShopScene.s_controls.goodsBg] = {"contentBg","goodsBg"};
    [DiamondShopScene.s_controls.limitgoodsBg] = {"contentBg","limitgoodsBg"};
	[DiamondShopScene.s_controls.timeLimitGoods] = {"contentBg","goodsBg","timeLimitGoods"};
	[DiamondShopScene.s_controls.otherGoodsListView] = {"contentBg","goodsBg","otherGoodsListView"};
	[DiamondShopScene.s_controls.goodsErrorInfo] = {"contentBg","goodsBg","errorInfo"};

	[DiamondShopScene.s_controls.recordBg] = {"recordBg"};
	[DiamondShopScene.s_controls.recordListView] = {"recordBg","contentBg","recordListView"};
	[DiamondShopScene.s_controls.recordErrorText] = {"recordBg","contentBg","errorText"};
	
}

DiamondShopScene.s_controlFuncMap = 
{
	[DiamondShopScene.s_controls.backBtn] = DiamondShopScene.onBackClick,
	[DiamondShopScene.s_controls.recordBtn] = DiamondShopScene.onRecordClick,
	[DiamondShopScene.s_controls.diamondShopBtn] = DiamondShopScene.onDiamondShopClick;

};

DiamondShopScene.s_cmdConfig = 
{
	[DiamondShopScene.s_cmds.showTabs] = DiamondShopScene.onShowTabs;
	[DiamondShopScene.s_cmds.showGoods] =DiamondShopScene.onShowGoods;
	[DiamondShopScene.s_cmds.showRecord] = DiamondShopScene.onShowRecord;
}