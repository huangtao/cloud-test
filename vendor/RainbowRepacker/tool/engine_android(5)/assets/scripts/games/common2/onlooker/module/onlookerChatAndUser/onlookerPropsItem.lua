local OnlookerPropsItem = class(CommonGameLayer, false);

OnlookerPropsItem.s_controls = {
	btnProp 	= 1,
	imgProp 	= 2,
	txtPropNum 	= 3,
	btnTop		= 4,
	imgFrame	= 5,
}

OnlookerPropsItem.ctor = function(self, data)
	local room_player_info_prop = require("view/kScreen_1280_800/games/common2/room_player_info_prop");
	super(self,room_player_info_prop);
	if not data then return; end
	self.m_ctrls = OnlookerPropsItem.s_controls;
	self.m_data = data;
	self:_initViews();
end

OnlookerPropsItem.dtor = function(self)
	self.m_data = nil;
end

OnlookerPropsItem._initViews = function(self)
	self.m_btnTop = self:findViewById(self.m_ctrls.btnTop);				-- 道具透明按钮
	self.m_btnProp = self:findViewById(self.m_ctrls.btnProp);			-- 道具按钮
	self.m_imgProp = self:findViewById(self.m_ctrls.imgProp);			-- 道具图标
	self.m_txtPropNum = self:findViewById(self.m_ctrls.txtPropNum);		-- 道具数量
	self.m_imgFrame = self:findViewById(self.m_ctrls.imgFrame);			-- 道具品质框

	local isExpire = (self.m_data.allowTimes > 0);
	self.m_btnProp:setEnable(isExpire);
	self.m_btnTop:setVisible(not isExpire);

	local config = PropIsolater.getInstance():getGoodInfoByTypeId(self.m_data.type);
	if config then 
		ImageCache.getInstance():request(config.item_icon, self, self.onFinishLoadIcon);	-- 下载道具图标
	end

	self.m_txtPropNum:setText((self.m_data.allowTimes > 99) and "99+" or self.m_data.allowTimes);
	self:setSize(self.m_imgFrame:getSize());
end

OnlookerPropsItem.onFinishLoadIcon = function (self, url, filename)
	if self.m_imgProp then
		self.m_imgProp:setFile(filename);
	end
end

OnlookerPropsItem.getData = function(self)
	return self.m_data;
end

OnlookerPropsItem.s_controlConfig = { 
	[OnlookerPropsItem.s_controls.imgFrame]		= {"imgFrame"},
	[OnlookerPropsItem.s_controls.btnTop]		= {"imgFrame", "btnTop"},
	[OnlookerPropsItem.s_controls.btnProp]		= {"imgFrame", "btnProp"},
	[OnlookerPropsItem.s_controls.imgProp]		= {"imgFrame", "btnProp", "imgProp"},
	[OnlookerPropsItem.s_controls.txtPropNum]	= {"imgFrame", "btnProp", "imgDot", "txtPropNum"},
};

return OnlookerPropsItem;