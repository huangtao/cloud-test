local JiFenRecordItemPlayer = class(Node);

JiFenRecordItemPlayer.ctor = function(self, data, config)
	self.m_data = data;

	self:_initView(config);
end

JiFenRecordItemPlayer.dtor = function(self)
	
end

JiFenRecordItemPlayer._initView = function(self, config)
	local list = {
		self._createTagImage,
		self._createHeadView,
		self._createNameView,
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

JiFenRecordItemPlayer._createTagImage = function(self, width)
	local node = UIFactory.createNode();
	if self.m_data.isWiner then
		local img = UIFactory.createImage("games/common/jifen/jifenRecord/icon_winer.png");
		img:setAlign(kAlignRight);
		node:addChild(img);
	end
	node:setSize(width);
	return node;
end

JiFenRecordItemPlayer._createHeadView = function(self, width)
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


JiFenRecordItemPlayer._onDownloadHeadImage = function(self, url, imagePath)
    if imagePath then
       self:_setHeadImage(imagePath);
    end
end


JiFenRecordItemPlayer._setHeadImage = function (self, image)
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

JiFenRecordItemPlayer._createNameView = function(self, width)
	local name = UIFactory.createText(self.m_data.nick or "", 24, width, 24, kAlignCenter, 143, 92, 31)
	name:setAlign(kAlignCenter);
	return name;
end

return JiFenRecordItemPlayer;