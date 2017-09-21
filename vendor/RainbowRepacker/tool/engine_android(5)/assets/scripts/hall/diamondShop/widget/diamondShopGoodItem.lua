local diamondShopGoodsItem = require(ViewPath.."hall/diamondShop/diamondShopGoodsItem");
require("hall/diamondShop/widget/diamondShopDialog");

DiamondShopGoodsItem = class(CommonGameLayer,false);

DiamondShopGoodsItem.s_onUpdateLeftNum = EventDispatcher.getInstance():getUserEvent();
DiamondShopGoodsItem.s_controls =
{
	view1 = 1;
	title1 = 2;
	goodsImage1 = 3;
	needDiamond1 = 4;
	leftNum1 = 5;
	exchangeBtn1 = 6;
	exchangeBtnText = 7;
}

DiamondShopGoodsItem.ctor = function(self,data)
	super(self,diamondShopGoodsItem);
	Log.v("----------DiamondShopGoodsItem.ctor -----------",data);
	self:setSize(self.m_root:getSize());
	self.m_ctrl = DiamondShopGoodsItem.s_controls;
	self.m_data = data;
	self:findViews();
	self:init();

	EventDispatcher.getInstance():register(DiamondShopGoodsItem.s_onUpdateLeftNum,self,self.onUpdateLeftNum);

end

DiamondShopGoodsItem.dtor = function(self)
	self.m_data = nil;
	delete(self.m_diamondShopDialog);
	ImageCache.getInstance():cleanRef(self);
	EventDispatcher.getInstance():unregister(DiamondShopGoodsItem.s_onUpdateLeftNum,self,self.onUpdateLeftNum);
end

--------------------------------------------
DiamondShopGoodsItem.findViews = function(self)
	self.m_view1 = self:findViewById(self.m_ctrl.view1);
	self.m_title1 = self:findViewById(self.m_ctrl.title1);
	self.m_goodsImage1 = self:findViewById(self.m_ctrl.goodsImage1);
	self.m_needDiamond1 = self:findViewById(self.m_ctrl.needDiamond1);
	self.m_leftNum1 = self:findViewById(self.m_ctrl.leftNum1);
	self.m_exchangeBtn1 = self:findViewById(self.m_ctrl.exchangeBtn1);

	-- self.m_goodsImage1:setSize(255,231);
end 

DiamondShopGoodsItem.init = function(self)
	self.m_title1:setText(self.m_data.gname);
	self.m_needDiamond1:setText(self.m_data.diamond);
	self:__refreshLeftNum(self.m_data.gnum);
	ImageCache.getInstance():request(self.m_data.url,self,self.onUpdateGoodsImage1);
end

DiamondShopGoodsItem.onUpdateGoodsImage1 = function(self,url,imagePath)
	if imagePath then
		self.m_goodsImage1:setFile(imagePath);
		self:resetImageSize(self.m_goodsImage1);
	end
end

DiamondShopGoodsItem.onUpdateLeftNum = function(self,itemInfo)
	if itemInfo and tonumber(itemInfo.gid) == tonumber(self.m_data.gid) then
		self:__refreshLeftNum(tonumber(itemInfo.gnum)-1);
	end
end

DiamondShopGoodsItem.__refreshLeftNum = function(self, leftNum)
	leftNum = number.valueOf(leftNum);
	self.m_leftNum1:setText( string.concat(leftNum,"个") );
	if tonumber(leftNum) <= 0 then
		self:findViewById(self.s_controls.exchangeBtnText):setText("已告罄", 1);
		self:findViewById(self.s_controls.exchangeBtn1):setEnable(false);
	end	
end

DiamondShopGoodsItem.isExchangeBtnClick = function(self, x, y)
    if not (x and y) then 
        return false;
    end 
    local x_1,y_1 = self.m_exchangeBtn1:getUnalignPos();
    local w,h = self.m_exchangeBtn1:getSize();

    if (x >= x_1 and x <= x_1 + w) and (y >= y_1 and y <= y_1 + h) then 
    	if tonumber(self.m_data.gnum) == 0 then
			Toast.getInstance():showText(kTextSoldOut,50,30,kAlginLeft,"",26,250,210,70);
			return false;
		else
        	return true;
        end
    else 
        return false;
    end 
end

DiamondShopGoodsItem.getData = function(self)
    return self.m_data;
end


DiamondShopGoodsItem.resetImageSize = function(self, image)
	if image and image.m_res then
		local width = image.m_res:getWidth();
		local height = image.m_res:getHeight();
		image:setSize(width, height);
	end
end

------------------------------------------
DiamondShopGoodsItem.s_controlConfig = 
{
	[DiamondShopGoodsItem.s_controls.view1] = {"view1"};
	[DiamondShopGoodsItem.s_controls.title1] = {"view1","topView","title"};
	[DiamondShopGoodsItem.s_controls.goodsImage1] = {"view1","goodsImage"};
	[DiamondShopGoodsItem.s_controls.needDiamond1] = {"view1","priceBg","needDiamond"};
	[DiamondShopGoodsItem.s_controls.leftNum1] = {"view1","leftView","leftNum"};
	[DiamondShopGoodsItem.s_controls.exchangeBtn1] = {"view1","exchangeBtn"};
	[DiamondShopGoodsItem.s_controls.exchangeBtnText] = {"view1", "exchangeBtn", "Text3"};
}

DiamondShopGoodsItem.s_controlFuncMap =
{
}