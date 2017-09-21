local diamondShopRecordMoreInfo = require(ViewPath.."hall/diamondShop/diamondShopRecordMoreInfo");
require("common/commonGameLayer");

local DiamondShopRecordMoreInfo = class(CommonGameLayer, false);

DiamondShopRecordMoreInfo.flag = true;

DiamondShopRecordMoreInfo.Delegate = {
	onDiamondShopRecordMoreInfoClose = "onDiamondShopRecordMoreInfoClose";
}


local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
DiamondShopRecordMoreInfo.s_controls =
{
	bg = getIndex(),
	closeBtn = getIndex(),
	okBtn = getIndex(),
	realGoodsView = getIndex(),
	orderid = getIndex(),
	tel = getIndex(),
	name = getIndex(),
	address = getIndex(),
	virtualGoodsView = getIndex(),
	orderid_1 = getIndex(),
	tel_1 = getIndex(),
	titleText = getIndex(),
};

DiamondShopRecordMoreInfo.ctor = function(self, itemInfo)
	
	super(self, diamondShopRecordMoreInfo);
	DiamondShopRecordMoreInfo.flag = false;
	self.itemInfo = itemInfo;
	self.m_ctrl = DiamondShopRecordMoreInfo.s_controls;
	self:findViewById(self.s_controls.bg):setEventDrag(self, self.onBgClick);
	
	self:setFillParent(true,true);
	self:_init(itemInfo);
end

DiamondShopRecordMoreInfo.dtor = function(self)
	
end

DiamondShopRecordMoreInfo.onTouch = function(self)
	return false;
end

DiamondShopRecordMoreInfo.onBgClick = function(self)
	
end



DiamondShopRecordMoreInfo.onCloseClick = function(self)
	self:onDiamondShopRecordMoreInfoClose();
end


DiamondShopRecordMoreInfo.onOkClick = function(self)
	self:onDiamondShopRecordMoreInfoClose();
end

DiamondShopRecordMoreInfo.onDiamondShopRecordMoreInfoClose = function(self)
	self:execDelegate(DiamondShopRecordMoreInfo.Delegate.onDiamondShopRecordMoreInfoClose, true);
end


DiamondShopRecordMoreInfo._init = function(self,itemInfo)
	itemInfo = table.verify(itemInfo);

	local isRealGoods = tonumber(itemInfo.type) == 3;
	self:findViewById(self.m_ctrl.realGoodsView):setVisible(isRealGoods);
	self:findViewById(self.m_ctrl.virtualGoodsView):setVisible(not isRealGoods);

	if isRealGoods then 
		self:findViewById(self.m_ctrl.orderid):setText(itemInfo.orderid or "");
		self:findViewById(self.m_ctrl.tel):setText(itemInfo.phone or "");
		self:findViewById(self.m_ctrl.name):setText(itemInfo.name or "");
		self:findViewById(self.m_ctrl.address):setText(itemInfo.addr or "");
		self:findViewById(self.m_ctrl.titleText):setText(string.isEmpty(itemInfo.orderid) and 
			"兑换成功，奖品未发货" or "兑换成功，奖品已发货");
	else	 
		self:findViewById(self.m_ctrl.orderid_1):setText(itemInfo.orderid or "");
		self:findViewById(self.m_ctrl.tel_1):setText(itemInfo.phone or "");
	end 
end 


DiamondShopRecordMoreInfo.s_controlConfig =
{
	[DiamondShopRecordMoreInfo.s_controls.bg] 			= {"bg"},
	[DiamondShopRecordMoreInfo.s_controls.closeBtn]		= {"contentView", "closeBtn"},
	[DiamondShopRecordMoreInfo.s_controls.okBtn]		= {"contentView", "bottomView","okBtn"},

	[DiamondShopRecordMoreInfo.s_controls.realGoodsView]    = {"contentView", "centerView", "realGoodsView"},
	[DiamondShopRecordMoreInfo.s_controls.orderid]    = {"contentView", "centerView", "realGoodsView","orderid"},
	[DiamondShopRecordMoreInfo.s_controls.tel]    = {"contentView", "centerView", "realGoodsView","tel"},
	[DiamondShopRecordMoreInfo.s_controls.name]    = {"contentView", "centerView", "realGoodsView","name"},
	[DiamondShopRecordMoreInfo.s_controls.address]    = {"contentView", "centerView", "realGoodsView","address"},

	[DiamondShopRecordMoreInfo.s_controls.virtualGoodsView]    = {"contentView", "centerView", "virtualGoodsView"},
	[DiamondShopRecordMoreInfo.s_controls.orderid_1]    = {"contentView", "centerView", "virtualGoodsView","orderid"},
	[DiamondShopRecordMoreInfo.s_controls.tel_1]    = {"contentView", "centerView", "virtualGoodsView","tel"},
	[DiamondShopRecordMoreInfo.s_controls.titleText] = {"contentView", "topView", "desc"},
};

DiamondShopRecordMoreInfo.s_controlFuncMap =
{
	[DiamondShopRecordMoreInfo.s_controls.bg]			= DiamondShopRecordMoreInfo.onBgClick,
	[DiamondShopRecordMoreInfo.s_controls.closeBtn]		= DiamondShopRecordMoreInfo.onCloseClick,
	[DiamondShopRecordMoreInfo.s_controls.okBtn]		= DiamondShopRecordMoreInfo.onOkClick,
};

return DiamondShopRecordMoreInfo;