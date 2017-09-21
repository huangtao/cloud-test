local market_pin_map = require("qnFiles/qnPlist/hall/market_pin");
require("uiex/spannableText");

local RechargeVipItem = class(CommonGameLayer, false);

RechargeVipItem.s_vipNameMap = 
{
	["VIP月卡"] = "vip_month_title.png",
	["VIP周卡"] = "vip_week_title.png",
	["VIP体验卡"] = "vip_experience_title.png",
};

RechargeVipItem.s_controls =
{
	itemBtn = 1,
	vip_name = 2,
	vip_type = 3,
	vip_price_img = 4,
	vip_price_txt = 5,
	vip_info_txt = 6,
	vip_img = 7,
};

RechargeVipItem.ctor = function(self, data)
	super(self,  require(RechargeViewPath.."rechargeVipItem") );
	self:setSize( self.m_root:getSize() );
	self.m_data = data;

	self:showContent();
end

RechargeVipItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end 

RechargeVipItem.showContent = function(self)
    local vipName = self:findViewById(self.s_controls.vip_name);
    vipName:setText(self.m_data.name);

    local fileVipName = RechargeVipItem.s_vipNameMap[self.m_data.name];
    local vipImage = self:findViewById(self.s_controls.vip_img);
    if fileVipName then
		vipImage:setFile(market_pin_map[fileVipName]);
		vipImage:setVisible(true);
    else
    	vipImage:setVisible(false);
    	vipName:setVisible(true);
    end
    
   	local vip_price_img = self:findViewById(self.s_controls.vip_price_img);
   	local vip_price_txt = self:findViewById(self.s_controls.vip_price_txt);
   	local priceImage = RechargeDataInterface.getInstance():getGoodPriceImage(self.m_data.pamount);

   	if priceImage then
   		vip_price_img:setVisible(true);
   		vip_price_txt:setVisible(false);
   		vip_price_img:setFile(priceImage);
   	else
    	vip_price_img:setVisible(false);
   		vip_price_txt:setVisible(true);
    	vip_price_txt:setText(string.concat(self.m_data.pamount,"元"));
   	end

	self:findViewById(self.s_controls.vip_info_txt):setText(self.m_data.desc);
	self:findViewById(self.s_controls.vip_info_txt):setScrollBarWidth(0)
	if not string.isEmpty(self.m_data.icon) then
		ImageCache.getInstance():request(self.m_data.icon, self, self.onDownLoadIcon);
	end
end

RechargeVipItem.onDownLoadIcon = function(self, url, imagePath, item)
	if imagePath then
		self:findViewById(self.s_controls.vip_type):setFile(imagePath);
	end
end

RechargeVipItem.onPayVipClick = function(self)
	if self.m_data then
		EventDispatcher.getInstance():dispatch(RechargeController.s_pay, PayConfig.eGoodsListId.MarketVip, self.m_data);
		UBReport.getInstance():report(UBConfig.kHallMallItemClick, self.m_data.id or "");
	end
end

RechargeVipItem.s_controlConfig = 
{
	[RechargeVipItem.s_controls.itemBtn] = {"itemBtn"},
	[RechargeVipItem.s_controls.vip_name] = {"itemBtn", "vip_name"},
	[RechargeVipItem.s_controls.vip_type] = {"itemBtn","vip_type"},
	[RechargeVipItem.s_controls.vip_price_img] = {"itemBtn", "vip_price_bg", "vip_price_img"},
	[RechargeVipItem.s_controls.vip_price_txt] = {"itemBtn", "vip_price_bg", "vip_price_txt"},
	[RechargeVipItem.s_controls.vip_info_txt] = {"itemBtn", "vip_desc_bg", "vip_info_txt"},
	[RechargeVipItem.s_controls.vip_img] = {"itemBtn", "vip_img"},
};

RechargeVipItem.s_controlFuncMap =
{
	[RechargeVipItem.s_controls.itemBtn] = RechargeVipItem.onPayVipClick,
};

return RechargeVipItem;