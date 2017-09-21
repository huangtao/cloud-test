local RechargePreroItem = class(CommonGameLayer, false);

RechargePreroItem.s_controls =
{
	item = 1,
	bg = 2,
};

RechargePreroItem.ctor = function(self, data)
	super(self, require(RechargeViewPath.."rechargePreroItem") );
	self:setSize(170, 140);
	self.m_data = data;

	self.m_item = self:findViewById(self.s_controls.item);
	self.m_bg = self:findViewById(self.s_controls.bg);

	self:showContent();
end

RechargePreroItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end

RechargePreroItem.showContent = function(self)
	ImageCache.getInstance():request(self.m_data.item_icon, self, self.onUpdateHeadImage);
	self.m_item:getChildByName("info"):setText(self.m_data.item_name);
end

RechargePreroItem.onUpdateHeadImage = function(self, url, imagePath)
	if not url or not imagePath then
		return;
	end
 	self.m_bg:setFile(imagePath);
end

RechargePreroItem.s_controlConfig =
{
	[RechargePreroItem.s_controls.item] = {"item"},
	[RechargePreroItem.s_controls.bg]   = {"item", "bg"},
};


return RechargePreroItem;
