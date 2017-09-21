local diamondShopMessage = require(ViewPath.."hall/diamondShop/diamondShopMessage");
require("hall/diamondShop/widget/diamondShopResult");
require("common/commonGameLayer");
require("hall/diamondShop/logic/diamondShopLogic");
require("hall/diamondShop/data/diamondShopConstants");

local DiamondShopMessage = class(CommonGameLayer, false);

DiamondShopMessage.Delegate = {
	onDiamondShopMessageLayerClose = "onDiamondShopMessageLayerClose";
	onShowDiamondShopResultLayer  = "onShowDiamondShopResultLayer";
}

DiamondShopMessage.s_controls =
{
	bg = 1,
	closeBtn = 2,
	cancleBtn = 3,
	submitBtn = 4,

	goodLayer = 5,
	goodNameTxt = 6,
	goodTelTxt = 7,
	goodAddressTxt = 8,

	telLayer = 9,
	telTelTxt = 10,
};

DiamondShopMessage.ctor = function(self, itemInfo)
	super(self, diamondShopMessage);
	self.itemInfo = itemInfo;
	
	self:setFillParent(true,true);	

	self:findViewById(self.s_controls.bg):setEventDrag(self, self.onTouch);

	self.goodLayer = self:findViewById(self.s_controls.goodLayer);
	self.goodNameTxt = self:findViewById(self.s_controls.goodNameTxt);
	self.goodTelTxt = self:findViewById(self.s_controls.goodTelTxt);
	self.goodAddressTxt = self:findViewById(self.s_controls.goodAddressTxt);

	self.telLayer = self:findViewById(self.s_controls.telLayer);
	self.telTelTxt = self:findViewById(self.s_controls.telTelTxt);

	-- 设置只让输入数字
	self.goodTelTxt:setInputMode(kEditBoxInputModeNumeric);
	self.telTelTxt:setInputMode(kEditBoxInputModeNumeric);

	if tonumber(self.itemInfo.type) == DiamondShopConstants.eGoodsType.TelCharge then
		self.goodLayer:setVisible(false);
		self.telLayer:setVisible(true);
	else
		self.goodLayer:setVisible(true);
		self.telLayer:setVisible(false);
	end
end

DiamondShopMessage.dtor = function(self)
	self:clearLogic();
end

DiamondShopMessage.createLogic = function(self)
	if not self.m_logic then
		self.m_logic = new(DiamondShopLogic,self);
	end 
end

DiamondShopMessage.clearLogic = function(self)
	delete(self.m_logic);
	self.m_logic = nil;
end

DiamondShopMessage.hide = function(self)
	CommonGameLayer.hide(self);
	self:clearLogic();

	self:execDelegate(DiamondShopMessage.Delegate.onDiamondShopMessageLayerClose, true);
end

DiamondShopMessage.onTouch = function(self)
	
end

DiamondShopMessage.onBgClick = function(self)

end

DiamondShopMessage.onCloseClick = function(self)
	self:hide();
end

DiamondShopMessage.onCancleClick = function(self)
	self:hide();
end

DiamondShopMessage.onSubmitClick = function(self)
	self:createLogic();
	local param = {};
	if tonumber(self.itemInfo.type) == DiamondShopConstants.eGoodsType.TelCharge then--兑换话费
		if not self:checkTelTxt() then
			return;
		end	
		local gid = self.itemInfo.gid;	
		local phone = number.valueOf(string.trim(self.telTelTxt:getText()));	
		self.m_logic:requestDiamondPay(gid,phone);	
	else
		if not self:checkGoodTxt() then
			return;
		end
		
		local gid = self.itemInfo.gid;
		local name = string.trim(self.goodNameTxt:getText());
		local phone = string.trim(self.goodTelTxt:getText());
		local addr = string.trim(self.goodAddressTxt:getText());
		self.m_logic:requestDiamondPay(gid,phone,name,addr);
	end
end

DiamondShopMessage.onResponseDiamondPay = function(self,isSuccess,info)
	if isSuccess then 
		Log.v("-------DiamondShopMessage.onResponseDiamondPay --",self.itemInfo);
		EventDispatcher.getInstance():dispatch(DiamondShopGoodsItem.s_onUpdateLeftNum,self.itemInfo);
		self:hide();
		self:execDelegate(DiamondShopMessage.Delegate.onShowDiamondShopResultLayer);
	else 
		info = table.verify(info);
		local msg = info.errorTips or "";
		if msg == "" then 
			msg = kTextExchangeFail;
		end 
		Toast.getInstance():showText(msg,50,30,kAlginLeft,"",26,250,210,70);
	end 
end

DiamondShopMessage.checkTelTxt = function(self)
	local telStr = string.trim(self.telTelTxt:getText());
	if string.len(telStr) <= 0 then
		local msg = "请输入联系电话";
		Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
	end
	return true;
end

DiamondShopMessage.checkGoodTxt = function(self)
	local nameStr = string.trim(self.goodNameTxt:getText());
	if string.len(nameStr) <= 0 then
		local msg = "请输入收件人姓名";
		Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
	end
	local telStr = string.trim(self.goodTelTxt:getText());
	if string.len(telStr) <= 0 then
		local msg = "请输入联系电话";
		Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
	end
	local addressStr = string.trim(self.goodAddressTxt:getText());
	if string.len(addressStr) <= 0 then
		local msg = "请输入详细地址";
		Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
	end
	return true;
end



DiamondShopMessage.onNameChange = function(self)
	local nameStr = string.trim(self.goodNameTxt:getText());
	if string.len(nameStr) > 0 then
		self.goodNameTxt:setText(string.subUtfStr(nameStr, 1, 6));
	end
end

DiamondShopMessage.onTelChange = function(self)
	local telStr = string.trim(self.goodTelTxt:getText());
	if string.len(telStr) > 0 then
		self.goodTelTxt:setText(string.subUtfStr(telStr, 1, 11));
	end
end

DiamondShopMessage.onAddressChange = function(self)
	local addrStr = string.trim(self.goodAddressTxt:getText());
	if string.len(addrStr) > 0 then
		self.goodAddressTxt:setText(string.subUtfStr(addrStr, 1, 26));
	end
end

DiamondShopMessage.onTelTelChange = function(self)
	local telTelStr = string.trim(self.telTelTxt:getText());
	if string.len(telTelStr) > 0 then
		self.telTelTxt:setText(string.subUtfStr(telTelStr, 1, 11));
	end
end


DiamondShopMessage.s_controlConfig =
{
	[DiamondShopMessage.s_controls.bg] 			= {"bg"},
	[DiamondShopMessage.s_controls.closeBtn]		= {"contentView",  "closeBtn"},
	[DiamondShopMessage.s_controls.cancleBtn]		= {"contentView", "bottomBg", "cancleBtn"},
	[DiamondShopMessage.s_controls.submitBtn]		= {"contentView", "bottomBg", "submitBtn"},

	[DiamondShopMessage.s_controls.goodLayer]		= {"contentView", "content_bg", "goodLayer"},
	[DiamondShopMessage.s_controls.goodNameTxt]	= {"contentView",  "content_bg","goodLayer", "nameView","nameBg", "et"},
	[DiamondShopMessage.s_controls.goodTelTxt]		= {"contentView", "content_bg", "goodLayer", "phoneView","phoneBg", "et"},
	[DiamondShopMessage.s_controls.goodAddressTxt]	= {"contentView",  "content_bg","goodLayer", "addressView","adressBg", "et"},

	[DiamondShopMessage.s_controls.telLayer]		= {"contentView", "content_bg", "telLayer"},
	[DiamondShopMessage.s_controls.telTelTxt]		= {"contentView", "content_bg", "telLayer", "telImg1", "telTelTxt"},
};

DiamondShopMessage.s_controlFuncMap =
{
	[DiamondShopMessage.s_controls.bg]				= DiamondShopMessage.onBgClick,
	[DiamondShopMessage.s_controls.closeBtn]		= DiamondShopMessage.onCloseClick,
	[DiamondShopMessage.s_controls.cancleBtn]		= DiamondShopMessage.onCancleClick,
	[DiamondShopMessage.s_controls.submitBtn]		= DiamondShopMessage.onSubmitClick,
	[DiamondShopMessage.s_controls.goodNameTxt]	= DiamondShopMessage.onNameChange,
	[DiamondShopMessage.s_controls.goodTelTxt]		= DiamondShopMessage.onTelChange,
	[DiamondShopMessage.s_controls.goodAddressTxt]	= DiamondShopMessage.onAddressChange,
	[DiamondShopMessage.s_controls.telTelTxt]		= DiamondShopMessage.onTelTelChange,
};

return DiamondShopMessage;
