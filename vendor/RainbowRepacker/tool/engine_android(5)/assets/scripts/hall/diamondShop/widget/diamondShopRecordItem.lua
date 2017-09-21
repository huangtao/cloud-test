local diamondShopRecordItem = require(ViewPath.."hall/diamondShop/diamondShopRecordItem");
require("common/commonGameLayer");

local DiamondShopRecordItem = class(CommonGameLayer, false);


DiamondShopRecordItem.s_controls =
{
	dateTxt = 1,
	nameTxt = 2,
	diamondTxt = 3,
	numTxt = 4,
	stateTxt = 5,
};

DiamondShopRecordItem.ctor = function(self, data)
	Log.v("------DiamondShopRecordItem.ctor-------",data)
	super(self, diamondShopRecordItem);
	self:setSize(self.m_root:getSize())
	self:setFillParent(true, false);

	self.dateTxt = self:findViewById(self.s_controls.dateTxt);
	self.nameTxt = self:findViewById(self.s_controls.nameTxt);
	self.diamondTxt = self:findViewById(self.s_controls.diamondTxt);
	self.numTxt = self:findViewById(self.s_controls.numTxt);
	self.stateTxt = self:findViewById(self.s_controls.stateTxt);

	if data then
		self.dateTxt:setText(data.time);
		self.nameTxt:setText( ToolKit.formatNick(data.gname, 14) );
		self.diamondTxt:setText(data.diamond);
		self.numTxt:setText(data.num);

		self.info = data;
	end
end

DiamondShopRecordItem.isLookDetailTouched = function(self, x, y)
    if not (x and y) then 
        return false;
    end 

    local x_1,y_1 = self.stateTxt:getUnalignPos();
    local w,h = self.stateTxt:getSize();

    if (x >= x_1 and x <= x_1 + w) and (y >= y_1 and y <= y_1 + h) then 
        return true;
    else 
        return false;
    end 
end

DiamondShopRecordItem.getData = function(self)
    return self.info;
end

DiamondShopRecordItem.s_controlConfig =
{
	[DiamondShopRecordItem.s_controls.dateTxt] 		= {"dateTxt"},
	[DiamondShopRecordItem.s_controls.nameTxt] 		= {"nameTxt"},
	[DiamondShopRecordItem.s_controls.diamondTxt] 		= {"diamondTxt"},
	[DiamondShopRecordItem.s_controls.numTxt] 			= {"numTxt"},
	[DiamondShopRecordItem.s_controls.stateTxt] 		= {"stateTxt"},
};

DiamondShopRecordItem.s_controlFuncMap =
{
};

return DiamondShopRecordItem;