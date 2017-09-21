
local PrivateRoomRecordSummaryRecordItem = class(Node);

PrivateRoomRecordSummaryRecordItem.setConfig = function(config)
	PrivateRoomRecordSummaryRecordItem.s_config = config;
end

PrivateRoomRecordSummaryRecordItem.ctor = function(self, data)
	self.m_data = data;

	self:_initView(PrivateRoomRecordSummaryRecordItem.s_config);
end

PrivateRoomRecordSummaryRecordItem.dtor = function(self)
	
end

PrivateRoomRecordSummaryRecordItem._initView = function(self, config)
	if table.isEmpty(config) then 
		return;
	end

	local height = config.height;
	local widthItem = config.widthItem;
	local heightItem = config.heightItem;
	local heightTitle = config.heightTitle;

	self:setSize(widthItem, height);

	local titleText = self:_createTextTitle(string.format("%s/%s局", self.m_data.roundsCurrent, self.m_data.roundsTotal), widthItem, heightTitle);
	titleText:setAlign(kAlignTop);
	self:addChild(titleText);

	local pos = heightTitle;
	for k, v in ipairs(self.m_data.propList) do
		local item = self:_createTextScore(self.m_data.propType, v, widthItem, heightItem);
		item:setAlign(kAlignTop);
		item:setPos(nil, pos);
		self:addChild(item);

		pos = pos + heightItem;
	end
end

PrivateRoomRecordSummaryRecordItem._createTextTitle = function(self, str, width, height)
	return UIFactory.createText(str or "", 24, width, height, kAlignCenter)
end

PrivateRoomRecordSummaryRecordItem._createTextScore = function(self, type, config, width, height)
	local node = UIFactory.createNode();

	local propNum = tonumber(config.propNum) or -1;
	local propType = tonumber(type) or -1;
	local mid = tonumber(config.mid) or -1;
	local str = propNum >= 0 and string.format("+%s", propNum) or string.format("%s", propNum);
	local color = {255, 255, 255};
	if mid == kUserInfoData:getUserId() then
		color = propNum >= 0 and {255, 166, 23} or {49, 233, 18};
	end

	local img = nil;
	if propType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE then
		str = str.."分";
	else
		img = UIFactory.createImage("isolater/bg_blank.png");
		img:setSize(45, 45);
		local propInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(propType));
        ImageCache.getInstance():request(propInfo.item_icon, self, self._onImageDownload, img);
    end

    local text = UIFactory.createText(str, 24, 24, 24, kAlignLeft, unpack(color));
    text:setAlign(kAlignLeft)
    local widthText, _ = text:getSize();
    node:addChild(text);
    text:setPos((width - widthText) / 2);

    if img then
    	img:setAlign(kAlignLeft);
 		node:addChild(img);
 		local widthImg, _ = img:getSize();
 		text:setPos((width - widthText - widthImg) / 2);
 		img:setPos((width - widthText - widthImg) / 2 + widthText);
    end

	node:setSize(width, height);
	return node;
end

PrivateRoomRecordSummaryRecordItem._onImageDownload = function(self, url, file, iconImg)
    self:_setImageFile(iconImg, file);
end

PrivateRoomRecordSummaryRecordItem._setImageFile = function(self, img, file)
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

return PrivateRoomRecordSummaryRecordItem;