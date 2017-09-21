local diamondShopResult = require(ViewPath.."hall/diamondShop/diamondShopResult");
require("common/commonGameLayer");

local DiamondShopResult = class(CommonGameLayer, false);

DiamondShopResult.Delegate = {
	onDiamondShopResultLayerClose = "onDiamondShopResultLayerClose";
}

DiamondShopResult.s_controls =
{
	bg = 1,
	okBtn = 2,
	closeBtn = 3,
	contentText = 4,
};


DiamondShopResult.ctor = function(self, itemInfo)
	super(self, diamondShopResult);
	self.itemInfo = itemInfo;
	
	self:addToRoot();
	self:setFillParent(true,true);
	self:findViewById(self.s_controls.bg):setEventDrag(self, self.onTouch);

	if not table.isEmpty(itemInfo) then
		local conentText = self:findViewById(self.s_controls.contentText);
		local itemType = number.valueOf(itemInfo.type);
		local str = "";
		local strEnd = "";
		if itemType == 1 then 
			str = "银币";
			strEnd = "到账";
		elseif itemType == 2 then  
			str = "话费";
			strEnd = "到账";	
		elseif itemType == 3 then  
			str = "实物";
			strEnd = "发货";
		elseif itemType == 4 then  
			str = "流量";
			strEnd = "到账";
		else
			str = "兑换的商品";
			strEnd = "处理完成";
		end
		conentText:setText(string.format("请您耐心等待，%s将于3个工作日内%s。", str, strEnd));
	end
end

DiamondShopResult.onOkClick = function(self)
	self:hide();
end

DiamondShopResult.onCloseClick = function(self)
	self:hide();
end

DiamondShopResult.hide = function(self)
	self:execDelegate(DiamondShopResult.Delegate.onDiamondShopResultLayerClose, true);
end

DiamondShopResult.s_controlConfig =
{
	[DiamondShopResult.s_controls.bg] 			= {"bg"},
	[DiamondShopResult.s_controls.okBtn]		= {"contentView","bottomView", "okBtn"},
	[DiamondShopResult.s_controls.closeBtn]		= {"contentView", "closeBtn"},
	[DiamondShopResult.s_controls.contentText]	= {"contentView","centerView", "contentText"},
};

DiamondShopResult.s_controlFuncMap =
{
	[DiamondShopResult.s_controls.okBtn]		= DiamondShopResult.onOkClick,
	[DiamondShopResult.s_controls.closeBtn]		= DiamondShopResult.onCloseClick,
};

return DiamondShopResult;