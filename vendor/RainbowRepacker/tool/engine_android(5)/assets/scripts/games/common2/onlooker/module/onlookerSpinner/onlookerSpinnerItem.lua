local OnlookerSpinnerItem = class(Node);

OnlookerSpinnerItem.ctor = function(self,data)
	self:setFillParent(true,false);
	self:setSize(nil,37);

	self:_initView(data);
end

OnlookerSpinnerItem._initView = function(self,data)
	data = table.verify(data);
    for k,v in ipairs(data) do 
    	local item = self:_getListItem(v);
    	self:addChild(item);
    	local _,h = item:getSize();
		self:setSize(nil,h);

		local align = k%2 == 0 and kAlignRight or kAlignLeft;
		item:setAlign(align);
		item:setPos(0,0);
    end 
end

--data = {
-- 	nick = "123433";
-- 	isVip = true;	
-- 	isFriend = true;
-- };

OnlookerSpinnerItem._getListItem = function(self,data)
	local config = require("view/kScreen_1280_800/games/common2/onlooker/onlooker_spinner_item");
	local view = SceneLoader.load(config);

	local name = view:getChildByName("name");
	local icon_friend = view:getChildByName("icon_friend");

	local color = data.isVip and {255,241,10} or {238,206,144};
	name:setText(string.subUtfStrByCn(data.nick or "", 1, 4, ".."),1,nil,unpack(color));
	icon_friend:setVisible(data.isFriend);
	local w = name.m_res:getWidth();

	local w_1 = icon_friend:getSize();
	local width = view:getSize();
	local maxX = width - w_1;
	local x = w <= maxX and w or maxX;
	icon_friend:setPos(x,nil);

	return view;
end

return OnlookerSpinnerItem;