local HallCommonHeadItemButton = class(Button, false);


HallCommonHeadItemButton.ctor = function(self, data, index, isNeedTip)
	super(self, "hall/common/bg_blank.png");
	self.m_imgFiles = data.imgFiles;
	self.m_text = data.text;
	self.m_index = index;
	self.m_isNeedTip = isNeedTip;
	local w,h = 195,118;
	self:setSize(w,h);
	if not table.isEmpty(self.m_imgFiles) then
		self.m_showType = 1;
	else
		self.m_showType = 2;
	end
	self:init();
end

HallCommonHeadItemButton.dtor = function(self )

end

HallCommonHeadItemButton.init = function(self)
	self.m_selBg = UIFactory.createImage("hall/common/tab_bg_sel.png");
	self:addChild(self.m_selBg);
	self.m_selBg:setAlign(kAlignTop);
	self.m_selBg:setVisible(false);
	--self.m_selBg:setPos(0,-11);

	if self.m_showType == 1 then
		--图片
		self.m_titleImg = UIFactory.createImage(self.m_imgFiles[1]);
		self:addChild(self.m_titleImg);
		self.m_titleImg:setAlign(kAlignCenter);
		self.m_titleImg:setPos(0,-11);
	else
		self.m_textView = UIFactory.createText(self.m_text or "", 36);
		self:addChild(self.m_textView);
		self.m_textView:setAlign(kAlignCenter);
		self.m_textView:setPos(0,-11);
	end

	if self.m_isNeedTip then
		self.m_tipImg = UIFactory.createImage("hall/common/new_msg_icon.png");
		self:addChild(self.m_tipImg);
		self.m_tipImg:setAlign(kAlignTopRight);
		self.m_tipImg:setPos(17,6);
	end
end

HallCommonHeadItemButton.setChecked = function(self, bool)
	self.m_isChecked = bool;
	self:setFile(bool and "hall/common/bg_blank.png" or "");
	self:setEnable(not bool);
	self.m_selBg:setVisible(bool);
	if bool then
		self:setColor(255,255,255);
		if self.m_tipImg then
			self.m_tipImg:setVisible(false);
		end
	end

	if self.m_showType == 1 then
		--图片
		self.m_titleImg:setFile(bool and self.m_imgFiles[2] or self.m_imgFiles[1])
	else
		local r,g,b = 255,255,255;
		if bool then
			r,g,b = 255,235,168;
		end
		self.m_textView:setText(self.m_text or "", 0,0,r,g,b);
	end
end

HallCommonHeadItemButton.isChecked = function(self)
	return self.m_isChecked;
end

HallCommonHeadItemButton.getIndex = function(self)
	return self.m_index;
end


HallCommonHeadItemButton.setTipVisible = function(self, bool)
	if self.m_tipImg then
		self.m_tipImg:setVisible(bool);
	end
end

local HallCommonHeadView = class(Node);

HallCommonHeadView.ctor = function(self, imageFiles, textMap, isNeedTip)
	self.m_imageFiles = imageFiles;
	self.m_textMap = textMap;
	self.m_isNeedTip = isNeedTip;
	self:initView();
end

HallCommonHeadView.dtor = function(self)
end

HallCommonHeadView.initView = function(self)
	local w,h = 0,118;
	if table.isEmpty(self.m_headMenuBtns) then
		self.m_headMenuBtns = {};
		local size = 0;
		if not table.isEmpty(self.m_textMap) then
			size = #self.m_textMap;
		end
		if not table.isEmpty(self.m_imageFiles) then
			size = #self.m_imageFiles;
		end
		for index = 1,size do
			local data = {};
			if not table.isEmpty(self.m_imageFiles) then
				data.imgFiles = self.m_imageFiles[index];
			end

			if not table.isEmpty(self.m_textMap) then
				data.text = self.m_textMap[index]
			end

			local button = new(HallCommonHeadItemButton, data, index, self.m_isNeedTip);
			self:addChild(button);
			button:setPos((index - 1 ) * 195, 0);
			button:setOnClick(button, function(btn1)
				self:onMenuChanged(btn1:getIndex());
			end);
			self.m_headMenuBtns[index] = button;
			w = w + 195;
			if index < size then
				local imageDivider = UIFactory.createImage("hall/common/tab_line.png");
				local imageDividerW, _ = imageDivider:getSize();
				imageDivider:setAlign(kAlignLeft);
				imageDivider:setPos(index * 195 - imageDividerW / 2, -11);
				imageDivider:setLevel(-1);
				self:addChild(imageDivider);
				--w = w + 2;
			end
		end
	end
	self:setSize(w,h);
	self:setSelect(1);
end

HallCommonHeadView.onMenuChanged = function(self, index)
	self:setSelect(index);
	if self.m_menuIndexChangedObj and self.m_menuIndexChangedFunc then
		self.m_menuIndexChangedFunc(self.m_menuIndexChangedObj, index);
	end
end

HallCommonHeadView.setSelect = function(self, index)
	if table.isEmpty(self.m_headMenuBtns) then
		self:initView();
	end
	for k,v in pairs(self.m_headMenuBtns) do
		if v then 
			v:setChecked(v:getIndex() == index);
		end
	end
end


HallCommonHeadView.getSelect = function(self)
	if table.isEmpty(self.m_headMenuBtns) then
		self:initView();
	end
	for k,v in pairs(self.m_headMenuBtns) do
		if v and v:isChecked() then 
			return k;
		end
	end
end

HallCommonHeadView.setOnMenuIndexChanged = function(self, obj, func)
	self.m_menuIndexChangedObj = obj;
	self.m_menuIndexChangedFunc = func;
end

HallCommonHeadView.setTipVisible = function(self, index, bool)
	for k,v in pairs(self.m_headMenuBtns) do
		if v and v:getIndex() == index then
			v:setTipVisible(bool);
		end
	end
end

return HallCommonHeadView;