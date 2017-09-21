require("common/uiFactory");
require("hall/animation/animScale")
local rechargeItemLayout = require(RechargeViewPath.."rechargeItem");
local crystal_pin_map = require("qnFiles/qnPlist/hall/crystal_pin");

local RechargeItem = class(CommonGameLayer, false);

RechargeItem.s_onRechargeItemClick = EventDispatcher.getInstance():getUserEvent();

RechargeItem.s_controls =
{
	itemBtn1 = 1,
	itemBtn2 = 2,
	itemBtn3 = 3,
};

RechargeItem.ctor = function(self,data)
	super(self, rechargeItemLayout);
	local w , h = self.m_root:getSize();
	self:setSize(data.w or w, h);
	self:reviseBtnsPos();

	self.m_data = table.verify(data.goodsList);
	self:showGoodsInfo(self.m_data);
end

RechargeItem.showGoodsInfo = function(self, data)
	local itemBtns = { RechargeItem.s_controls.itemBtn1, RechargeItem.s_controls.itemBtn2,
						 RechargeItem.s_controls.itemBtn3};
	for index, ctrlId in ipairs(itemBtns) do
		local ctrl = self:findViewById(ctrlId);
		local itemData = data[index];
		if table.isEmpty(itemData) then
			ctrl:setVisible(false);
		else
			ctrl:setVisible(true);
			self:setGoodItemInfo(ctrl, itemData);
		end
	end
end

RechargeItem.reviseBtnsPos = function(self)
	local itemBtns = { RechargeItem.s_controls.itemBtn1, RechargeItem.s_controls.itemBtn2,
						 RechargeItem.s_controls.itemBtn3};

	local btnW, _ = self:findViewById(RechargeItem.s_controls.itemBtn1):getSize();
	local num = #itemBtns;
	local w, _ = self:getSize();
	local space = (w-btnW*num)/(num+1);
	for index, ctrlId in pairs(itemBtns) do
		local ctrl = self:findViewById(ctrlId);
		ctrl:setPos(space*index + (index-1)*btnW, nil);
	end
end

RechargeItem.setGoodItemInfo = function(self, ctrl, itemData)
	local goodIconView = ctrl:getChildByName("goodIconView");
	self:createGoodIcon(goodIconView, itemData.icon);

	if not string.isEmpty(itemData.eventIcon) then
		local eventIcon = new(UrlImage, "hall/common/bg_blank.png", itemData.eventIcon);
		local eventIconView = ctrl:getChildByName("eventIconView");
		eventIcon:setSize( eventIconView:getSize() );
		eventIconView:addChild(eventIcon);
	end

	ctrl:getChildByName("goodName"):setText(itemData.name);
	self:__setGoodsPrice(ctrl, itemData);
	self:__setGoodItemAwardInfo(ctrl, itemData);
end

RechargeItem.__setGoodsPrice = function(self, ctrl, itemData)
	local widgets = {};
	if itemData.pamount > 0 then
		local rmbTxt = itemData.pamount .. itemData.currency_desc;
		rmbWidget = UIFactory.createText(rmbTxt, 32, nil, nil, kAlignLeft, 255, 252, 0);
		table.insert(widgets, rmbWidget);
	end

	if not (HallDataInterface.getInstance():getVersionFilterSwitch() and itemData.scene == PayConfig.eGoodsListId.MarketGold) then --版本审核期间，不显示购买银币金条
		if itemData.pamount > 0 and itemData.crystal > 0 then
			local orIcon = UIFactory.createImage( crystal_pin_map["or.png"] );
			table.insert(widgets, orIcon);		
		end

		if itemData.crystal > 0 then
			local crystalIcon = UIFactory.createImage( crystal_pin_map["crystal_market_top.png"] );
			table.insert(widgets, crystalIcon);
			local crystalNum = UIFactory.createText(tostring(itemData.crystal).." 购买", 32, nil, nil, kAlignLeft, 255, 252, 0);
			table.insert(widgets, crystalNum);
		end
	end

	local node = UIFactory.createNode();
	local pos = 0;
	local spaces = {10, 10, 5};
	for k, widget in ipairs(widgets) do
		node:addChild(widget);
		widget:setAlign(kAlignLeft);
		widget:setPos(pos, nil);
		local widget_w = widget:getSize();
		local space = spaces[k] or 0;
		pos = pos + widget_w + space;
	end

	node:setSize(pos, nil);
	node:setAlign(kAlignCenter);

	local priceView = ctrl:getChildByName("priceView");
	priceView:removeAllChildren(true);
	priceView:addChild(node);
end

RechargeItem.__setGoodItemAwardInfo = function(self, ctrl, itemData)
	local goldAward = 0;
	for k,v in pairs( table.verify(itemData.award) ) do 
		if v.id == UserPropertyIsolater.getInstance():getPropertySilverCoinID() then 
			goldAward = tonumber(v.n) or 0;
			break;
		end
	end 
	local award_bg = ctrl:getChildByName("award_bg");
	local award_view = award_bg:getChildByName("award_view");
	award_bg:setVisible(goldAward > 0);

	award_view:removeAllChildren(true);
    local awardItem = new(UserMoneyItem);
    award_view:addChild(awardItem);

    local percent = (goldAward/itemData.pchips) * 100;
    percent = string.format("%d%%", percent);
    awardItem:setNormalMoneyNum(percent, 0.75);
    awardItem:setAlign(kAlignCenter);
end

RechargeItem.createGoodIcon = function(self, goodIconView, icon)
	if not goodIconView then
		return;
	end
	
	local goodIcon = UIFactory.createImage("hall/common/goodIcon.png");
	if icon then
		ImageCache.getInstance():request(icon, self, self.onGetImage, goodIcon);
	end
	
	goodIconView:addChild(goodIcon);
	goodIcon:setAlign(kAlignCenter);
end

RechargeItem.onGetImage = function(self, url, imagePath, goodIcon)
    if goodIcon and imagePath then
        goodIcon:setFile(imagePath);
        if goodIcon.m_res then
			local width = goodIcon.m_res:getWidth();
			local height = goodIcon.m_res:getHeight();
			goodIcon:setSize(width, height);
		end
    end
end

RechargeItem.onGoodItemBtn1Click = function(self)
	if self.m_data[1] then
		self:goToPay(self.m_data[1]);
		UBReport.getInstance():report(UBConfig.kHallMallItemClick, string.format("id_%s", self.m_data[1].id or ""));
	end
end

RechargeItem.onGoodItemBtn2Click = function(self)
	if self.m_data[2] then
		self:goToPay(self.m_data[2]);
		UBReport.getInstance():report(UBConfig.kHallMallItemClick, string.format("id_%s", self.m_data[2].id or ""))
	end
end

RechargeItem.onGoodItemBtn3Click = function(self)
	if self.m_data[3] then
		self:goToPay(self.m_data[3]);
		UBReport.getInstance():report(UBConfig.kHallMallItemClick, string.format("id_%s", self.m_data[3].id or ""))
	end
end

RechargeItem.goToPay = function(self, data)
	EventDispatcher.getInstance():dispatch(RechargeItem.s_onRechargeItemClick, data);
end

RechargeItem.s_controlConfig =
{
	[RechargeItem.s_controls.itemBtn1] = {"itemBtn1"},
	[RechargeItem.s_controls.itemBtn2] = {"itemBtn2"},
	[RechargeItem.s_controls.itemBtn3] = {"itemBtn3"},
};

RechargeItem.s_controlFuncMap =
{
	[RechargeItem.s_controls.itemBtn1] = RechargeItem.onGoodItemBtn1Click,
	[RechargeItem.s_controls.itemBtn2] = RechargeItem.onGoodItemBtn2Click,
	[RechargeItem.s_controls.itemBtn3] = RechargeItem.onGoodItemBtn3Click,
};

return RechargeItem;
