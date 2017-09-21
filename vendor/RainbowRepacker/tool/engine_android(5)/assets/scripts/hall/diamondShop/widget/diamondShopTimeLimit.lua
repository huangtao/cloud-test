local diamondShopTimeLimit = require(ViewPath.."hall/diamondShop/diamondShopTimeLimit");
require("hall/diamondShop/widget/diamondShopDialog");
require("hall/diamondShop/data/diamondShopTimeHandle");
require("common/commonGameLayer");

local DiamondShopTimeLimit = class(CommonGameLayer,false);

DiamondShopTimeLimit.Delegate = {
	onDiamondShopTimeLimitExchangeBtnClick = "onDiamondShopTimeLimitExchangeBtnClick";
}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
DiamondShopTimeLimit.s_controls =
{
	todayGoodsTitle = getIndex();
	todayGoodsContent = getIndex();
	todayGoodsImage = getIndex();
	needDiamondNum = getIndex();
	exchangeBtn = getIndex();
	exchangeBtnName = getIndex();
	leftGoodsNum = getIndex();
	leftGoodsTime = getIndex();
	readNum = getIndex();
	lastGoodsContent = getIndex();
	lastGoodsImage = getIndex();
	lastGoodsBtn = getIndex();
	lastGoodsName = getIndex();
	futureGoodsContent = getIndex();
	futureGoodsImage = getIndex();
};

DiamondShopTimeLimit.ctor = function(self,data)
	super(self,diamondShopTimeLimit);
	self:setFillParent(true,true);
	self.m_ctrl = DiamondShopTimeLimit.s_controls;
	self.m_data = data;
	self:_findViews();
	self:_init();	
	EventDispatcher.getInstance():register(DiamondShopGoodsItem.s_onUpdateLeftNum,self,self.onUpdateLeftNum);
end

DiamondShopTimeLimit.dtor = function(self)
	self.m_data = nil;
	delete(self.m_diamondShopDialog);
	ImageCache.getInstance():cleanRef(self);
	EventDispatcher.getInstance():unregister(DiamondShopGoodsItem.s_onUpdateLeftNum,self,self.onUpdateLeftNum);
end

---------------------------------------------------
DiamondShopTimeLimit.show = function(self)
	self:setVisible(true);
	self:_reviseViews();
end

DiamondShopTimeLimit.hidden = function(self)
	self:setVisible(false);
end


---------------------------------------------------
DiamondShopTimeLimit._findViews = function(self)
	self.m_todayGoodsTitle =  self:findViewById(self.m_ctrl.todayGoodsTitle);
	self.m_todayGoodsContent =  self:findViewById(self.m_ctrl.todayGoodsContent);
	self.m_todayGoodsImage =  self:findViewById(self.m_ctrl.todayGoodsImage);

	self.m_needDiamondNum =  self:findViewById(self.m_ctrl.needDiamondNum);
	self.m_exchangeBtn =  self:findViewById(self.m_ctrl.exchangeBtn);
	self.m_leftGoodsNum =  self:findViewById(self.m_ctrl.leftGoodsNum);
	self.m_leftGoodsTime =  self:findViewById(self.m_ctrl.leftGoodsTime);
	self.m_readNum =  self:findViewById(self.m_ctrl.readNum);

	self.m_lastGoodsContent =  self:findViewById(self.m_ctrl.lastGoodsContent );
	self.m_lastGoodsImage =  self:findViewById(self.m_ctrl.lastGoodsImage);
	self.m_lastGoodsBtn =  self:findViewById(self.m_ctrl.lastGoodsBtn);
	self.m_lastGoodsBtn:setEnable(false);
	self.m_lastGoodsName =  self:findViewById(self.m_ctrl.lastGoodsName);

	self.m_futureGoodsContent = self:findViewById(self.m_ctrl.futureGoodsContent);
	self.m_futureGoodsImage =  self:findViewById(self.m_ctrl.futureGoodsImage);
end

DiamondShopTimeLimit._init = function(self)
	if self.m_data then
		for k,v in pairs(self.m_data) do 
			if tonumber(v.flag) == -1 then-- 上期
				self:showLastGoods(v);
			elseif tonumber(v.flag) == 1 then --本期
				--todo
				self:showTodayGoods(v);
				self.m_todayGoodsInfo = v;
			else--下一期
				self:showFutureGoods(v);
			end
		end
	end
end

DiamondShopTimeLimit._reviseViews = function(self)
	local width,height = self:getSize();
	local margin = 20;
	self.m_todayGoodsContent:setSize(width - margin*2,(height- margin*3)/2);
	self.m_todayGoodsContent:setPos(margin,margin);

	self.m_lastGoodsContent:setSize((width - margin*3)/2,(height- margin*3)/2);
	self.m_lastGoodsContent:setPos(margin,(height + margin)/2);

	self.m_futureGoodsContent:setSize((width - margin*3)/2,(height- margin*3)/2);
	self.m_futureGoodsContent:setPos((width + margin)/2,(height + margin)/2);
end

DiamondShopTimeLimit.onUpdateLeftNum = function(self,itemInfo)
	if self.m_todayGoodsInfo and itemInfo then 
		if tonumber(self.m_todayGoodsInfo.gid) == tonumber(itemInfo.gid) then
			self:__refreshLeftNum( tonumber(itemInfo.gnum)-1 );
		end
	end
end

DiamondShopTimeLimit.__refreshLeftNum = function(self, leftNum)
	leftNum = number.valueOf(leftNum);
	self.m_leftGoodsNum:setText(leftNum);
	if tonumber(leftNum) <= 0 then
		self:findViewById(self.s_controls.exchangeBtnName):setText("已告罄", 1);
		self:findViewById(self.s_controls.exchangeBtn):setEnable(false);
	end	
end

--显示上期商品
DiamondShopTimeLimit.showLastGoods = function(self,data)
	self.m_lastGoodsName:setText(data.gname); --显示商品名
	if data.url then 
		ImageCache.getInstance():request(data.url,self,self.onUpdateLastGoodsImage);
	end
end

DiamondShopTimeLimit.onUpdateLastGoodsImage = function(self,url,imagePath)
	if imagePath then
		self.m_lastGoodsImage:setFile(imagePath);
		self:resetImageSize(self.m_lastGoodsImage);
	end
end

--显示本期商品
DiamondShopTimeLimit.showTodayGoods = function(self,data)
	self.m_todayGoodsTitle:setText(string.concat("今日限时商品:",data.gname));
	self.m_needDiamondNum:setText(string.concat("x",data.diamond));
	self:__refreshLeftNum(data.gnum);

	self.m_readNum:setText(data.scantimes or "500");
	local leftTime = kDiamondShopTimeHandle.getInstance():getLeftTime();
	if leftTime then
		self.m_leftGoodsTime:setVisible(true);
		self.m_leftGoodsTime:setText(leftTime);
	else
		self.m_leftGoodsTime:setVisible(false);
	end
	if data.url then 
		ImageCache.getInstance():request(data.url,self,self.onUpdateTodayGoodsImage);
	end
end

DiamondShopTimeLimit.onUpdateTodayGoodsImage = function(self,url,imagePath)
	if imagePath then
		self.m_todayGoodsImage:setFile(imagePath);
		self:resetImageSize(self.m_todayGoodsImage);
	end
end


DiamondShopTimeLimit.showFutureGoods = function(self,data)
	if data.url then 
		ImageCache.getInstance():request(data.url,self,self.onUpdateFutureGoodsImage);
	end
end

DiamondShopTimeLimit.onUpdateFutureGoodsImage = function(self,url,imagePath)
	if imagePath then
		self.m_futureGoodsImage:setFile(imagePath);
		self:resetImageSize(self.m_futureGoodsImage);
	end
end

DiamondShopTimeLimit.resetImageSize = function(self, image)
	if image and image.m_res then
		local width = image.m_res:getWidth();
		local height = image.m_res:getHeight();
		image:setSize(width, height);
	end
end

DiamondShopTimeLimit.onExchangeClick = function(self)
	Log.v("--------DiamondShopTimeLimit.onExchangeClick------",self.m_todayGoodsInfo)
	if self.m_todayGoodsInfo then
		self:execDelegate(DiamondShopTimeLimit.Delegate.onDiamondShopTimeLimitExchangeBtnClick, self.m_todayGoodsInfo);
	end
end

DiamondShopTimeLimit.s_controlConfig = 
{
	[DiamondShopTimeLimit.s_controls.todayGoodsTitle] = {"todayGoodsContent","topView","title"};
	[DiamondShopTimeLimit.s_controls.todayGoodsContent] = {"todayGoodsContent"};
	[DiamondShopTimeLimit.s_controls.todayGoodsImage] = {"todayGoodsContent","todayGoodsImage"};
	[DiamondShopTimeLimit.s_controls.needDiamondNum] = {"todayGoodsContent","infoView","priceBg","needDiamondNum"};
	[DiamondShopTimeLimit.s_controls.exchangeBtn] = {"todayGoodsContent","infoView","exchangeBtn"};
	[DiamondShopTimeLimit.s_controls.exchangeBtnName] = {"todayGoodsContent","infoView","exchangeBtn", "exchangeBtnName"};
	[DiamondShopTimeLimit.s_controls.leftGoodsNum] = {"todayGoodsContent","infoView","leftNumView","leftGoodsNum"};
	[DiamondShopTimeLimit.s_controls.leftGoodsTime] = {"todayGoodsContent","infoView","leftTimeView","leftGoodsTime"};
	[DiamondShopTimeLimit.s_controls.readNum] = {"todayGoodsContent","infoView","scanView","readNum"};

	[DiamondShopTimeLimit.s_controls.lastGoodsContent] = {"lastGoodsContent"};
	[DiamondShopTimeLimit.s_controls.lastGoodsImage] = {"lastGoodsContent","lastGoodsImage"};
	[DiamondShopTimeLimit.s_controls.lastGoodsBtn] = {"lastGoodsContent","lastGoodsBtn"};
	[DiamondShopTimeLimit.s_controls.lastGoodsName] = {"lastGoodsContent","lastGoodsName"};
	
	[DiamondShopTimeLimit.s_controls.futureGoodsContent] = {"futureGoodsContent"};
	[DiamondShopTimeLimit.s_controls.futureGoodsImage] = {"futureGoodsContent","futureGoodsImage"};
};

DiamondShopTimeLimit.s_controlFuncMap = 
{
	[DiamondShopTimeLimit.s_controls.exchangeBtn] = DiamondShopTimeLimit.onExchangeClick;
}

return DiamondShopTimeLimit;