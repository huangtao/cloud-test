require("common/commonGameLayer");
local singleGoodsLayer = require(ViewPath.."hall/shortCutRecharge/singleGoodsLayer");

local SingleGoodsLayer = class(CommonGameLayer, false)

SingleGoodsLayer.Delegate = {
	onSelectGoodItem = "onSelectGoodItem";
	goBack  = "goBack";
}

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

SingleGoodsLayer.s_controls =
{
	closeBtn = getIndex(),
	infoBtn = getIndex(),
	goodIcon = getIndex(),
	goodName = getIndex(),
	goodPrice = getIndex(),

	topTip  = getIndex(),
	bottomTip = getIndex();
};

SingleGoodsLayer.ctor = function(self)
	super(self, singleGoodsLayer);
end

SingleGoodsLayer.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end 

SingleGoodsLayer.show = function(self, data)
	CommonGameLayer.show(self);

	self.m_data = data;
	self:__showGoodsInfo(data);
end

SingleGoodsLayer.hide = function(self)
	CommonGameLayer.hide(self);
end

SingleGoodsLayer.__showGoodsInfo = function(self, info)
	local sceneInfo = info.sceneInfo;
	local goodsList = info.goodsList;

	self:findViewById(self.s_controls.topTip):setText(sceneInfo.header);
	self:findViewById(self.s_controls.bottomTip):setText(sceneInfo.footer);

	local goodInfo = goodsList[1];
	if table.isEmpty(goodInfo) then
		return;
	end

	self.m_goodInfo = goodInfo;

	self:findViewById(self.s_controls.goodName):setText(goodInfo.name);
	self:findViewById(self.s_controls.goodPrice):setText(string.format("%s%s",goodInfo.pamount or 0,"元"));

	if not string.isEmpty(goodInfo.icon) then
		ImageCache.getInstance():request(goodInfo.icon, self, self.onDownLoadGoodIcon);
	end
end

SingleGoodsLayer.onDownLoadGoodIcon = function(self, url, imagePath)
	if imagePath then
		self:findViewById(self.s_controls.goodIcon):setFile(imagePath);
	end	
end

SingleGoodsLayer.onCloseBtnClick = function(self)
	self:execDelegate(SingleGoodsLayer.Delegate.goBack);
end

SingleGoodsLayer.onBuyBtnClick = function(self)
	if not table.isEmpty(self.m_goodInfo) then
		self:execDelegate(SingleGoodsLayer.Delegate.onSelectGoodItem, self.m_goodInfo.scene, self.m_goodInfo.id);
	end
end

SingleGoodsLayer.s_controlConfig =
{
	[SingleGoodsLayer.s_controls.closeBtn]		= {"contentBG", "closeBtn"},
	[SingleGoodsLayer.s_controls.infoBtn]		= {"contentBG", "infoBtn"},
	[SingleGoodsLayer.s_controls.goodPrice]	    = {"contentBG", "infoBtn", "goodPrice"},
	[SingleGoodsLayer.s_controls.goodIcon]		= {"contentBG", "infoBtn", "goodIcon"},
	[SingleGoodsLayer.s_controls.goodName] 		= {"contentBG", "infoBtn", "goodName"},
	[SingleGoodsLayer.s_controls.topTip]		= {"contentBG", "topTip"},
	[SingleGoodsLayer.s_controls.bottomTip]		= {"contentBG", "bottomTip"},
};

SingleGoodsLayer.s_controlFuncMap =
{
	[SingleGoodsLayer.s_controls.closeBtn]		= SingleGoodsLayer.onCloseBtnClick,
	[SingleGoodsLayer.s_controls.infoBtn]		= SingleGoodsLayer.onBuyBtnClick,
};

return SingleGoodsLayer;