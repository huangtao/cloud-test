local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")


local PrivateRoomRecordSummaryPlayerItem = class(Node);

PrivateRoomRecordSummaryPlayerItem.ctor = function(self, data, propType, key, config)
	self.m_data = data;
	self.m_key = key;
	self.m_propType = propType;

	self:_initView(config);
end

PrivateRoomRecordSummaryPlayerItem.dtor = function(self)
	
end

PrivateRoomRecordSummaryPlayerItem._initView = function(self, config)
	local list = {
		self._createTagImage,
		self._createHeadView,
		self._createNameView,
		self._createSocreView,
	};

	local pos = 0;
	for k, v in ipairs(config) do
		local func = list[k];
		if func then
			local item = func(self, v);

			if item then
				item:setAlign(kAlignLeft);
				local w, _ = item:getSize();
				item:setPos(pos + (v - w) / 2);
				self:addChild(item);
			end
		end
		pos = pos + v;
	end
end

PrivateRoomRecordSummaryPlayerItem._createTagImage = function(self, width)
	local propNum = tonumber(self.m_data.propNum) or -1;
	local node = UIFactory.createNode();
	if self.m_key == 1 and propNum > 0 then
		local img = UIFactory.createImage(privateRoom_pin_map["icon_winer.png"]);
		img:setAlign(kAlignRight);
		img:setPos(nil, 5);
		node:addChild(img);
	end
	node:setSize(width);
	return node;
end

PrivateRoomRecordSummaryPlayerItem._createHeadView = function(self, width)
	local node = UIFactory.createNode();

	self.m_headView = UIFactory.createNode();
	self.m_headView:setSize(50, 50);
	self.m_headView:setAlign(kAlignCenter);
	node:addChild(self.m_headView);

	self:_setHeadImage(kUserInfoData:getHeadBySex(self.m_data.sex or 0)); 
	if not string.isEmpty(self.m_data.icon) then
		ImageCache.getInstance():request(self.m_data.icon, self, self._onDownloadHeadImage);
	end

	node:setSize(width);
	return node;
end


PrivateRoomRecordSummaryPlayerItem._onDownloadHeadImage = function(self, url, imagePath)
    if imagePath then
       self:_setHeadImage(imagePath);
    end
end


PrivateRoomRecordSummaryPlayerItem._setHeadImage = function (self, image)
    local headView = self.m_headView;
    if self.m_headImage then
		headView:removeChild(self.m_headImage);
		delete(self.m_headImage);
		self.m_headImage = nil;
	end

	self.m_headImage = new(Mask, image, "hall/common/mask_head_72.png");
	self.m_headImage:setSize(headView:getSize())
	self.m_headImage:setAlign(kAlignCenter);
	headView:addChild(self.m_headImage);
end

PrivateRoomRecordSummaryPlayerItem._createSocreView = function(self, width)
	local node = UIFactory.createNode();

	local propNum = tonumber(self.m_data.propNum) or -1;
	local propType = tonumber(self.m_propType) or -1;
	local mid = tonumber(self.m_data.mid) or -1;
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

	node:setSize(width);
	return node;
end

PrivateRoomRecordSummaryPlayerItem._createNameView = function(self, width)
	local name = UIFactory.createText(self.m_data.nick or "", 24, width, 24, kAlignCenter)
	name:setAlign(kAlignCenter);
	return name;
end

PrivateRoomRecordSummaryPlayerItem._onImageDownload = function(self, url, file, iconImg)
    self:_setImageFile(iconImg, file);
end


PrivateRoomRecordSummaryPlayerItem._setImageFile = function(self, img, file)
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


return PrivateRoomRecordSummaryPlayerItem;