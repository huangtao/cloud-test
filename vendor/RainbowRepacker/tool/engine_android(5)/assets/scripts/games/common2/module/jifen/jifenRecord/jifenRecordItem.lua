local JiFenRecordItem = class(Node);

JiFenRecordItem.ctor = function(self, data, key, config)	
	self.m_data = data;
	self.m_key = key;
	self:_initView(config);
end

JiFenRecordItem.dtor = function(self)
	
end

JiFenRecordItem._initView = function(self, config)
	local list = {
		self._createTagImage,
		self._createHeadView,
		self._createNameView,
		self._createSocreView,
		self._createSocreViewCurrent,
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

	self:_createLineImage();
	self:_createLightImage();
end

JiFenRecordItem._createLineImage = function(self)
	if self.m_key ~= 1 then
		local line = UIFactory.createImage("isolater/content_line.png");
		line:setFillParent(true, false);
		self:addChild(line);
	end
end

JiFenRecordItem._createLightImage = function(self)
	if self.m_data.mid == UserBaseInfoIsolater.getInstance():getUserId() then
		local img = UIFactory.createImage("games/common/jifen/jifenRecord/item_light.jpg");
		img:setFillParent(true, true);
		img:setLevel(-1);
		self:addChild(img);
	end
end

JiFenRecordItem._createTagImage = function(self, width)
	local node = UIFactory.createNode();

	node:setSize(width);
	return node;
end

JiFenRecordItem._createHeadView = function(self, width)
	local node = UIFactory.createNode();

	self.m_headView = UIFactory.createNode();
	self.m_headView:setSize(50, 50);
	self.m_headView:setAlign(kAlignCenter);
	node:addChild(self.m_headView);

	self:_setHeadImage(UserBaseInfoIsolater.getInstance():getHeadBySex(self.m_data.sex or 0)); 
	if not string.isEmpty(self.m_data.icon) then
		ImageCache.getInstance():request(self.m_data.icon, self, self._onDownloadHeadImage);
	end

	node:setSize(width);
	return node;
end


JiFenRecordItem._onDownloadHeadImage = function(self, url, imagePath)
    if imagePath then
       self:_setHeadImage(imagePath);
    end
end


JiFenRecordItem._setHeadImage = function (self, image)
    local headView = self.m_headView;
    if self.m_headImage then
		headView:removeChild(self.m_headImage);
		delete(self.m_headImage);
		self.m_headImage = nil;
	end

	self.m_headImage = new(Mask, image, "isolater/mask_head_72.png");
	self.m_headImage:setSize(headView:getSize())
	self.m_headImage:setAlign(kAlignCenter);
	headView:addChild(self.m_headImage);
end

JiFenRecordItem._createSocreView = function(self, width)
	return self:_createSocreText(self.m_data.propNum, width);
end

JiFenRecordItem._createSocreViewCurrent = function(self, width)
	local propNum = self.m_data.propList[#self.m_data.propList]
	return self:_createSocreText(propNum, width);
end

JiFenRecordItem._createSocreText = function(self, propNum, width)
	local str = propNum >= 0 and string.format("+%s", propNum) or string.format("%s", propNum);
	return UIFactory.createText(str or "", 24, width, height, kAlignCenter, 143, 92, 31);
end

JiFenRecordItem._createNameView = function(self, width)
	local node = UIFactory.createNode();

	if self.m_data.mid == UserBaseInfoIsolater.getInstance():getUserId() then
		local img = UIFactory.createImage("games/common/jifen/jifenRecord/name_bg.png", nil, nil, 25, 25, 5, 5);
		img:setAlign(kAlignCenter);
		node:addChild(img);

		local name = UIFactory.createText(self.m_data.nick or "", 24, 24, 24, kAlignCenter, 238, 205, 117)
		name:setAlign(kAlignCenter);
		node:addChild(name);
		local w, _ = name:getSize();
		img:setSize(w+24);
	else
		local name = UIFactory.createText(self.m_data.nick or "", 24, 24, 24, kAlignCenter, 143, 92, 31)
		name:setAlign(kAlignCenter);
		node:addChild(name);
	end

	node:setSize(width);
	return node;
end

return JiFenRecordItem;