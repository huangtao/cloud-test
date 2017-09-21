require("common/commonGameLayer");

local OnlookerUserItem = class(CommonGameLayer,false)

OnlookerUserItem.s_controls = {
	head = ToolKit.getIndex();	
	icon_vip = ToolKit.getIndex();
	icon_friend = ToolKit.getIndex();
	nick = ToolKit.getIndex();
};

OnlookerUserItem.ctor = function(self,data)
	local config = require("view/kScreen_1280_800/games/common2/onlooker/onlooker_user_item");
	super(self, config);
	self.m_ctrls = OnlookerUserItem.s_controls;
	self.m_data = table.verify(data);
	self:setSize(self.m_root:getSize());

	self:_initView(self.m_data);
end

OnlookerUserItem.dtor = function(self)
	self.m_data = nil;
end

--data = {
--  sex = 0;
--  avatar = "";
-- 	nick = "123433";
-- 	isVip = true;	
-- 	isFriend = true;
-- };
OnlookerUserItem._initView = function(self,data)					
	local icon_vip = self:findViewById(self.m_ctrls.icon_vip);
	local icon_friend = self:findViewById(self.m_ctrls.icon_friend);
	local nick = self:findViewById(self.m_ctrls.nick);

	local color = data.isVip and {255,241,10} or {238,206,144};
	local align = data.isFriend and kAlignTopLeft or kAlignLeft;
	local x,y = nick:getPos();
	local y = data.isFriend and y or 0;

	icon_vip:setLevel(1);
	icon_vip:setVisible(data.isVip);
	icon_friend:setVisible(data.isFriend);
	nick:setAlign(align);
	nick:setPos(x,y);	
	nick:setText(string.subUtfStrByCn(data.nick or "", 1, 6, ".."),1,nil,unpack(color));	

	local defaultHeadFile = UserBaseInfoIsolater.getInstance():getHeadBySex(data.sex); 
	self:_setHeadImage(defaultHeadFile);
	if not string.isEmpty(data.avatar) then
		ImageCache.getInstance():request(data.avatar, self, self.onImageDownload);
	end 
end

OnlookerUserItem.onImageDownload = function(self,url,fileName)	
	if not string.isEmpty(fileName) then
        self:_setHeadImage(fileName);
    end
end

OnlookerUserItem._setHeadImage = function (self, image)
	local head = self:findViewById(self.m_ctrls.head);	
    if self.m_headImage then
		head:removeChild(self.m_headImage);
	end
	delete(self.m_headImage);
	self.m_headImage = new(Mask, image, "isolater/mask_head_72.png");
	head:addChild(self.m_headImage);
	self.m_headImage:setFillParent(true,true);
	self.m_headImage:setAlign(kAlignCenter);
end

OnlookerUserItem.getData = function(self)
	return self.m_data;
end

OnlookerUserItem.s_controlConfig = 
{	
	[OnlookerUserItem.s_controls.head]			= {"head"};
	[OnlookerUserItem.s_controls.icon_vip]		= {"head","icon_vip"};
	[OnlookerUserItem.s_controls.icon_friend]	= {"icon_friend"};
	[OnlookerUserItem.s_controls.nick]			= {"nick"};
};

return OnlookerUserItem;