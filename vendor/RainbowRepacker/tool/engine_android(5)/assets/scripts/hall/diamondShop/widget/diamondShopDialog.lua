local diamondShopDialog = require(ViewPath.."hall/diamondShop/diamondShopDialog");
require("hall/diamondShop/widget/diamondShopResult");
require("hall/diamondShop/widget/diamondShopMessage");
require("hall/diamondShop/logic/diamondShopLogic");
require("common/commonGameLayer");

local DiamondShopDialog = class(CommonGameLayer, false);

DiamondShopDialog.Delegate = {
	onDiamondShopDialogLayerClose = "onDiamondShopDialogLayerClose";
	onShowDiamondShopMessageLayer = "onShowDiamondShopMessageLayer";
	onShowDiamondShopResultLayer  = "onShowDiamondShopResultLayer";
}

DiamondShopDialog.s_controls =
{
	bg = 1,
	titleTxt = 2,
	goodImg = 3,
	goodName = 4,
	closeBtn = 5,
	cancleBtn = 6,
	nextBtn = 7,
	dialogLayer = 8,
	resultLayer = 9,
	resultBtn = 10,
	diamond = 11,
	telLayer = 12,
	telOkBtn = 13,
	telCancleBtn = 14,
	telTxt = 15,
	Text_failTip = 16,
};

DiamondShopDialog.ctor = function(self, itemInfo)
	super(self, diamondShopDialog);
	self.itemInfo = itemInfo;
	
	self:setFillParent(true,true);
	self:findViewById(self.s_controls.bg):setEventDrag(self, self.onTouch);

	self.titleTxt = self:findViewById(self.s_controls.titleTxt);
	self.dialogLayer = self:findViewById(self.s_controls.dialogLayer);
	self.goodImg = self:findViewById(self.s_controls.goodImg);
	self.goodName = self:findViewById(self.s_controls.goodName);

	self.resultLayer = self:findViewById(self.s_controls.resultLayer);
	self.diamond = self:findViewById(self.s_controls.diamond);

	self.telLayer = self:findViewById(self.s_controls.telLayer);
	self.telTxt = self:findViewById(self.s_controls.telTxt);
	self.telTxt:setInputMode(kEditBoxInputModeNumeric);
	self.m_Text_failTip = self:findViewById(self.s_controls.Text_failTip); 
	

	if tonumber(kUserInfoData:getDiamond()) < tonumber(itemInfo.diamond) then
		self.dialogLayer:setVisible(false);
		self.resultLayer:setVisible(true);
		self.telLayer:setVisible(false);
		self.titleTxt:setText("钻石余额不足",10);
		self.diamond:setText(kUserInfoData:getDiamond());
	else
		self.dialogLayer:setVisible(true);
		self.resultLayer:setVisible(false);
		self.telLayer:setVisible(false);
		self.titleTxt:setText("确定花费"..itemInfo.diamond.."钻兑换"..itemInfo.gname,10);
		self:setImage(self.goodImg, itemInfo.url);
		self.goodName:setText(itemInfo.gname);
	end
end

DiamondShopDialog.createLogic = function(self)
	if not self.m_logic then
		self.m_logic = new(DiamondShopLogic,self);
	end 
end

DiamondShopDialog.clearLogic = function(self)
	delete(self.m_logic);
	self.m_logic = nil;
end

DiamondShopDialog.dtor = function(self)
	Log.v("---------DiamondShopDialog.dtor---------");
	self:clearLogic();
	ImageCache.getInstance():cleanRef(self);
	self.itemInfo = nil;
end

DiamondShopDialog.hide = function(self)
	CommonGameLayer.hide(self);
	self:clearLogic();
end

--设置商品图像
DiamondShopDialog.setImage = function(self, item, url)
	self.image = item;
	ImageCache.getInstance():request(url, self, self.onUpdateImage);
end

DiamondShopDialog.onUpdateImage = function(self, url, imagePath)
	if not url or not imagePath then
		return;
	end
	if self.image then
		self.image:setFile(imagePath);
	end
end

DiamondShopDialog.onTouch = function(self)
	return false;
end

DiamondShopDialog.onBgClick = function(self)

end

DiamondShopDialog.onCloseClick = function(self)
	self:hide();
    self:onDiamondShopDialogLayerClose();
end

DiamondShopDialog.onCancleClick = function(self)
	self:hide();
    self:onDiamondShopDialogLayerClose();
end

DiamondShopDialog.onDiamondShopDialogLayerClose = function(self)
	self:execDelegate(DiamondShopDialog.Delegate.onDiamondShopDialogLayerClose, true);
end

DiamondShopDialog.onNextClick = function(self)
	if tonumber(self.itemInfo.type) == DiamondShopConstants.eGoodsType.TelCharge or tonumber(self.itemInfo.type) == DiamondShopConstants.eGoodsType.FlowPack then --话费
		self.dialogLayer:setVisible(false);
		self.resultLayer:setVisible(false);
		self.telLayer:setVisible(true);
		self.m_Text_failTip:setVisible(false);

		self.titleTxt:setVisible(false);
	else ---实物	
		self:execDelegate(DiamondShopDialog.Delegate.onShowDiamondShopMessageLayer, self.itemInfo);
	end
end

DiamondShopDialog.onResultBtn = function(self)
	self:hide();
end

DiamondShopDialog.onTelOkClick = function(self)
	if not self:checkTelTxt() then
		return;
	end
		
	local phone = number.valueOf(string.trim(self.telTxt:getText()));	
	self:createLogic();
	self.m_logic:requestDiamondPay(self.itemInfo.gid,phone);
end

DiamondShopDialog.onResponseDiamondPay = function(self,isSuccess,info)
	if isSuccess then 
		Log.v("-------DiamondShopDialog.onResponseDiamondPay --",self.itemInfo);
		EventDispatcher.getInstance():dispatch(DiamondShopGoodsItem.s_onUpdateLeftNum,self.itemInfo);
		self:hide();
		self:execDelegate(DiamondShopDialog.Delegate.onShowDiamondShopResultLayer, self.itemInfo);
	else 
		info = table.verify(info);
		local msg = info.errorTips or "";
		if msg == "" then 
			msg = kTextExchangeFail;
		end 
		Toast.getInstance():showText(msg,50,30,kAlginLeft,"",26,250,210,70);
		self.m_Text_failTip:setVisible(true);
	end 
end

DiamondShopDialog.checkTelTxt = function(self)
	local telStr = string.trim(self.telTxt:getText());
	if string.len(telStr) <= 0 then
		local msg = "请输入联系电话";
		Toast.getInstance():showText(msg, 50, 30, kAliginCenter, "", 24, 255, 255, 255);
		return false;
	end
	return true;
end

DiamondShopDialog.onTelTxtChange = function(self)
	local telTelStr = string.trim(self.telTxt:getText());
	if string.len(telTelStr) > 0 then
		self.telTxt:setText(string.subUtfStr(telTelStr, 1, 11));
	end
end

DiamondShopDialog.onTelCancelClick = function(self)
	self:hide();
end

DiamondShopDialog.s_controlConfig =
{
	[DiamondShopDialog.s_controls.bg] = {"bg"},
	[DiamondShopDialog.s_controls.closeBtn]	= {"contentView", "closeBtn"},
	[DiamondShopDialog.s_controls.titleTxt]	= {"contentView", "topView", "desc"},

	[DiamondShopDialog.s_controls.dialogLayer] = {"contentView",  "dialogLayer"},
	[DiamondShopDialog.s_controls.goodImg]		= {"contentView",  "dialogLayer", "goodImg"},
	[DiamondShopDialog.s_controls.goodName]	= {"contentView",  "dialogLayer", "goodName"},
	[DiamondShopDialog.s_controls.cancleBtn]	= {"contentView",  "dialogLayer","bottomView" ,"cancleBtn"},
	[DiamondShopDialog.s_controls.nextBtn]		= {"contentView",  "dialogLayer","bottomView" ,"nextBtn"},

	[DiamondShopDialog.s_controls.resultLayer]	= {"contentView",  "resultLayer"},
	[DiamondShopDialog.s_controls.resultBtn]	= {"contentView",  "resultLayer", "resultBtn"},
	[DiamondShopDialog.s_controls.diamond]	= {"contentView",  "resultLayer", "infoView","diamond"},

	[DiamondShopDialog.s_controls.telLayer]	= {"contentView",  "telLayer"},
	[DiamondShopDialog.s_controls.telOkBtn]	= {"contentView",  "telLayer", "bottomView","okBtn"},
	[DiamondShopDialog.s_controls.telCancleBtn]= {"contentView",  "telLayer","bottomView", "cancleBtn"},
	[DiamondShopDialog.s_controls.telTxt]		= {"contentView",  "telLayer", "tel_bg", "telTxt"},
	[DiamondShopDialog.s_controls.Text_failTip]		= {"contentView",  "telLayer", "Text_failTip",},
	
};

DiamondShopDialog.s_controlFuncMap =
{
	[DiamondShopDialog.s_controls.bg]			= DiamondShopDialog.onBgClick,
	[DiamondShopDialog.s_controls.closeBtn]	= DiamondShopDialog.onCloseClick,
	[DiamondShopDialog.s_controls.cancleBtn]	= DiamondShopDialog.onCancleClick,
	[DiamondShopDialog.s_controls.nextBtn]		= DiamondShopDialog.onNextClick,
	[DiamondShopDialog.s_controls.resultBtn]	= DiamondShopDialog.onResultBtn,
	[DiamondShopDialog.s_controls.telOkBtn]	= DiamondShopDialog.onTelOkClick,
	[DiamondShopDialog.s_controls.telCancleBtn]= DiamondShopDialog.onTelCancelClick,
	[DiamondShopDialog.s_controls.telTxt]		= DiamondShopDialog.onTelTxtChange,
};

return DiamondShopDialog;
