
local JiFenRecordItemRecord = class(Node);

JiFenRecordItemRecord.setConfig = function(config)
	JiFenRecordItemRecord.s_config = config;
end

JiFenRecordItemRecord.ctor = function(self, data, key, config)
	self.m_data = data;

	self:_initView(JiFenRecordItemRecord.s_config);
end

JiFenRecordItemRecord.dtor = function(self)
	
end

JiFenRecordItemRecord._initView = function(self, config)
	if table.isEmpty(config) then 
		return;
	end

	local height = config.height;
	local widthItem = config.widthItem;
	local heightItem = config.heightItem;
	local heightTitle = config.heightTitle;

	self:setSize(widthItem, height);

	local titleText = self:_createTextTitle(self.m_data.title, widthItem, heightTitle);
	titleText:setAlign(kAlignTop);
	self:addChild(titleText);

	local pos = heightTitle;
	for k, v in ipairs(self.m_data.propList) do
		local mid = v.mid;
		local propNum = v.propNum;
		local color = {143, 92, 31};
		if mid == UserBaseInfoIsolater.getInstance():getUserId() then
			color = propNum >= 0 and {255, 166, 23} or {49, 233, 18};
		end		
		local str = propNum >= 0 and string.format("+%s", propNum) or string.format("%s", propNum);
		local item = self:_createTextScore(str, color, widthItem, heightItem);
		item:setAlign(kAlignTop);
		item:setPos(nil, pos);
		self:addChild(item);

		pos = pos + heightItem;
	end
end

JiFenRecordItemRecord._createTextTitle = function(self, str, width, height)
	return UIFactory.createText(str or "", 28, width, height, kAlignCenter, 143, 92, 31)
end

JiFenRecordItemRecord._createTextScore = function(self, str, color, width, height)
	return UIFactory.createText(str or "", 24, width, height, kAlignCenter, unpack(color))
end

return JiFenRecordItemRecord;