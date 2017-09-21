local chooseGoodsItem = require(ViewPath.."hall/shortCutRecharge/chooseGoodsItem");

local ChooseGoodsItem = class(CommonGameLayer, false);

ChooseGoodsItem.default_w = 200;
ChooseGoodsItem.default_h = 280;

ChooseGoodsItem.s_controls = {
	title = 1;
	image = 2;
	info = 3;
	money = 4;
	eventIcon = 5;
}

ChooseGoodsItem.ctor = function(self, data)
	super(self, chooseGoodsItem);
	self:setSize(data.w, data.h);

	self.m_data = data;

	self:showContent(data);
end

ChooseGoodsItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end

ChooseGoodsItem.showContent = function(self, data)
	self:findViewById(self.s_controls.title):setText(data.name);
	local priorityDesc = data.priorityDesc;
	if string.isEmpty(priorityDesc) then
		priorityDesc = data.desc;
	end 
	self:findViewById(self.s_controls.info):setText(priorityDesc);
	self:findViewById(self.s_controls.money):setText(string.format("%s%s",data.pamount or 0,"元"));

	if not string.isEmpty(data.eventIcon) then
		ImageCache.getInstance():request(data.eventIcon, self, self.onDownLoadEventIcon);
	end

	if not string.isEmpty(data.icon) then
		ImageCache.getInstance():request(data.icon, self, self.onDownLoadGoodIcon);
	end
end

ChooseGoodsItem.getData = function(self)
	return self.m_data;
end

ChooseGoodsItem.onDownLoadGoodIcon = function(self, url, imagePath)
	if imagePath then
		self:findViewById(self.s_controls.image):setFile(imagePath);
	end	
end

ChooseGoodsItem.onDownLoadEventIcon = function(self, url, imagePath)
	if imagePath then
		self:findViewById(self.s_controls.eventIcon):setFile(imagePath);
		self:findViewById(self.s_controls.eventIcon):setVisible(true);
	end
end

ChooseGoodsItem.s_controlConfig = {
	[ChooseGoodsItem.s_controls.title] = {"itemBg", "title"};
	[ChooseGoodsItem.s_controls.image] = {"itemBg", "image"};
	[ChooseGoodsItem.s_controls.info] = {"itemBg", "info"};
	[ChooseGoodsItem.s_controls.money] = {"itemBg", "money"};
	[ChooseGoodsItem.s_controls.eventIcon] = {"itemBg", "eventIcon"};	
}

return ChooseGoodsItem;