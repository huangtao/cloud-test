require("common/commonGameLayer");
local chooseGoodsLayer = require(ViewPath.."hall/shortCutRecharge/chooseGoodsLayer");

local ChooseGoodsItem = require("hall/shortCutRecharge/widget/chooseGoodsItem");
local ChooseGoodsLayer = class(CommonGameLayer, false);

ChooseGoodsLayer.Delegate = {
	onSelectGoodItem = "onSelectGoodItem";
	goBack = "goBack";
}

local l_index = 0;
local getIndex = function(self)
	l_index = l_index + 1;
	return l_index;
end

ChooseGoodsLayer.s_controls = {
	bgImage = getIndex();
	contentBg = getIndex();
	title = getIndex();
	closeBtn = getIndex();
	topTipBg = getIndex();
	topTip = getIndex();
	bottomTip = getIndex();
	payListView = getIndex();
}


ChooseGoodsLayer.ctor = function(self)
	super(self, chooseGoodsLayer);

	self.m_payListView = self:findViewById(self.s_controls.payListView);
	self.m_payListView:setOnItemClick(self, self.onGoodItemClick);
end

ChooseGoodsLayer.dtor = function(self)
	self:stopCountDownTimer();
end

ChooseGoodsLayer.show = function(self, data)
	if table.isEmpty(data) then
		return;
	end

	CommonGameLayer.show(self);
	self:__showGoodsInfo(data);
end

ChooseGoodsLayer.__showGoodsInfo = function(self, info)
	self.m_info = info;
	local scene = info.scene;
	local sceneInfo = info.sceneInfo;
	local goodsList = info.goodsList;

	self:findViewById(self.s_controls.title):setText(sceneInfo.title);
	self:findViewById(self.s_controls.topTip):setText(sceneInfo.header);
	self:findViewById(self.s_controls.bottomTip):setText(sceneInfo.footer);

	--修正item的大小
	self:__reviseItemSize(goodsList);

	--显示商品列表
	if not self.m_payAdapter then
		self.m_payAdapter = new(CacheAdapter, ChooseGoodsItem, goodsList);
		self.m_payListView:setDirection(kHorizontal);
		self.m_payListView:setAdapter(self.m_payAdapter);
	else
		self.m_payAdapter:changeData(goodsList);
	end

	if scene == PayConfig.eGoodsListId.SecondePay and sceneInfo.timeLimit > 0 then
		self:startCountDownTimer(sceneInfo.timeLimit);
	end
end

ChooseGoodsLayer.__reviseItemSize = function(self, goodsList)
	local w,_ = self.m_payListView:getSize();
	local minSpace = 60;
	local itemNum = #goodsList;
	if (ChooseGoodsItem.default_w + minSpace)*itemNum < w then
		minSpace = (w-ChooseGoodsItem.default_w*itemNum)/itemNum;
	end

	for _, itemData in pairs(goodsList) do
		itemData.w = ChooseGoodsItem.default_w + minSpace;
		itemData.h = ChooseGoodsItem.default_h;
	end
end

ChooseGoodsLayer.stopCountDownTimer = function(self)
	delete(self.m_animTimer);
	self.m_animTimer = nil;
end

ChooseGoodsLayer.startCountDownTimer = function(self, timeLimit)
	self:stopCountDownTimer();

	self.m_timeLimit = timeLimit;
	self.m_animTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 0 ,1000, 0);
	self.m_animTimer:setDebugName("ChooseGoodsLayer|timer");
	self.m_animTimer:setEvent(self,function(self)
		self.m_timeLimit = self.m_timeLimit - 1;
		local date = math.floor(self.m_timeLimit/(24*60*60));
		local hour = math.floor((self.m_timeLimit%(24*60*60))/(60*60));
		local min  = math.floor((self.m_timeLimit%(60*60))/60);
		local second = self.m_timeLimit%60;

		local topTip = self.m_info.sceneInfo.header or "";
		local str = string.concat(topTip,"剩余时间:",date,"天",hour,"小时",min,"分",second,"秒");
		self:findViewById(self.s_controls.topTip):setText(str);

		if self.m_timeLimit < 0 then 
			self.m_timeLimit = 0;
			kUserInfoData:setPayStatus(1);
			self:stopCountDownTimer();
			self:execDelegate(ChooseGoodsLayer.Delegate.goBack);
		end 
	end);
end

ChooseGoodsLayer.onGoodItemClick = function(self, adapter,view,index,viewX,viewY)
	Log.v("ChooseGoodsLayer.onGoodItemClick");
	local goodInfo = view:getData();
	if not table.isEmpty(goodInfo) then
		self:execDelegate(ChooseGoodsLayer.Delegate.onSelectGoodItem, goodInfo.scene, goodInfo.id);
	end
end

ChooseGoodsLayer.onCloseBtnClick = function(self)
	self:execDelegate(ChooseGoodsLayer.Delegate.goBack);
end


ChooseGoodsLayer.s_controlConfig = {
	[ChooseGoodsLayer.s_controls.bgImage] = {"bgImage"};
	[ChooseGoodsLayer.s_controls.contentBg] = {"contentBg"},
	[ChooseGoodsLayer.s_controls.title] = {"contentBg", "title", "title"};
	[ChooseGoodsLayer.s_controls.closeBtn] = {"contentBg", "closeBtn"};
	[ChooseGoodsLayer.s_controls.topTipBg] = {"contentBg", "topTipBg"};
	[ChooseGoodsLayer.s_controls.topTip] = {"contentBg", "topTipBg", "topTip"};
	[ChooseGoodsLayer.s_controls.bottomTip] = {"contentBg", "bottomView", "bottomTip"};
	[ChooseGoodsLayer.s_controls.payListView] = {"contentBg", "payListView"};
}


ChooseGoodsLayer.s_controlFuncMap = {
	[ChooseGoodsLayer.s_controls.closeBtn] = ChooseGoodsLayer.onCloseBtnClick;
}

return ChooseGoodsLayer;