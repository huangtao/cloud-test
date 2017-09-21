require("uilibs/userMoneyItem");


local PrivateRoomRecordItem = class(Node);

PrivateRoomRecordItem.setCallback = function(obj, func)
	PrivateRoomRecordItem.s_callbackObj = obj;
	PrivateRoomRecordItem.s_callbackFunc = func;
end

PrivateRoomRecordItem.setConfig = function(config)
	PrivateRoomRecordItem.s_config = config;
end

PrivateRoomRecordItem.ctor = function(self, data)
	local privateRoomRecordItemLayout = require(ViewPath.."hall/privateRoom/privateRoomRecordItemLayout");
	local view = SceneLoader.load(privateRoomRecordItemLayout);
	self:addChild(view);

	self:setFillParent(true, false);
	self:setSize(view:getSize());

	self.m_view = view;
	self.m_data = data;

	self:_initView();
end

PrivateRoomRecordItem.dtor = function(self)

end

PrivateRoomRecordItem.onDetailBtnClick = function(self)
	if PrivateRoomRecordItem.s_callbackObj and PrivateRoomRecordItem.s_callbackFunc then
		PrivateRoomRecordItem.s_callbackFunc(PrivateRoomRecordItem.s_callbackObj, self.m_data);
	end
end

PrivateRoomRecordItem._initView = function(self)
	local config = PrivateRoomRecordItem.s_config;
	local data = self.m_data;

	if table.isEmpty(config) or table.isEmpty(data) then
		return;
	end

	local viewConfig = {
		{func = self._createTextView, param = {os.date("%m月%d日\n%H:%M", data.time)}},
		{func = self._createText, param = {data.gameName}},
		{func = self._createText, param = {data.roundsCurrent}},
		{func = self._createTextView, param = {data.otherPlayers}},
		{func = self._createScoreNodeByType, param = {data.propType, data.propNum}},
		{func = self._createButton, param = {}},
	}
	local pos = 0;
	local _, h = self:getSize();
	for k, v in ipairs(config) do
		local viewConfig = viewConfig[k];
		if viewConfig.func and viewConfig.param then
			local node = viewConfig.func(self, v, h, unpack(viewConfig.param))
			node:setAlign(kAlignLeft);

			local nodeW, _ = node:getSize();
			node:setPos(pos + (v - nodeW)/2);
			self:addChild(node);
		end
		pos = pos + v;
	end
end

PrivateRoomRecordItem._createText = function(self, w, h, str)
	local text = UIFactory.createTextView(tostring(str or "") or "", 24, w, h, kAlignCenter, 142, 92, 31)
	return text;
end

PrivateRoomRecordItem._createTextView = function(self, w, h, str)
	local text = UIFactory.createTextView(tostring(str or "") or "", 24, w, h, kAlignCenter, 142, 92, 31)
	return text;
end

PrivateRoomRecordItem._createScoreNodeByType = function(self, w, h, type, score)
	local node = UIFactory.createNode();

	local str = ToolKit.skipMoney2(score);
	str = string.replaceAll(str, "万", "W");
	str = string.replaceAll(str, "亿", "Y");

	local propType = number.valueOf(type);
	local img = nil;
	if propType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE then
		str = string.format("%sF", str);
	else
		img = UIFactory.createImage("isolater/bg_blank.png");
		img:setSize(50, 50);
		local propInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(propType));
        ImageCache.getInstance():request(propInfo.item_icon, self, self._onImageDownload, img);
	end
	
	local moneyNode = new(UserMoneyItem);
	UserMoneyItem.setFilePath(UserMoneyItem.s_recordListNumFilePath);
	moneyNode:setNormalMoneyNum(str , 1, score < 0);
	UserMoneyItem.setFilePath();
	node:addChild(moneyNode);
	moneyNode:setAlign(kAlignLeft);
	local widthMoney, _ = moneyNode:getSize();
	moneyNode:setPos((w - widthMoney) / 2);

	if img then
		img:setAlign(kAlignLeft);
		node:addChild(img);
		local widthImg = img:getSize();
		moneyNode:setPos((w - widthMoney - widthImg) / 2);
		img:setPos((w - widthMoney - widthImg) / 2 + widthMoney);
	end

	node:setSize(w, h);
	return node;
end

PrivateRoomRecordItem._createButton = function(self, w, h)
	local btn = UIFactory.createButton("hall/common/btns/btn_green_164x89_l25_r25_t25_b25.png", nil, nil, nil, 25, 25, 25, 25);
	btn:setAlign(kAlignCenter);
	btn:setOnClick(self, self.onDetailBtnClick);
	btn:setSize(170, 80);
	local text = UIFactory.createText("查看详情", 28, 28, 28, kAlignCenter, 255, 235, 186);
	text:setAlign(kAlignCenter);
	btn:addChild(text);
	return btn;
end


PrivateRoomRecordItem._onImageDownload = function(self, url, file, iconImg)
    self:_setImageFile(iconImg, file);
end


PrivateRoomRecordItem._setImageFile = function(self, img, file)
    if img then
        local w, _ = img:getSize();
        img:setFile(file or "");

        if img.m_res then
            local widthRes = img.m_res:getWidth();
            local heightRes = img.m_res:getHeight();
            local h = heightRes * w / widthRes;
            img:setSize(w, h);
        end
    end
end

return PrivateRoomRecordItem;