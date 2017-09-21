require("ui/node");

DotView = class(Node);

DotView.ctor = function(self,p_isNeedNum,p_intervalX,p_selectImage,p_unselectImage)
	self.m_default_selected_img = p_selectImage or "hall/common/spot_select.png";
	self.m_default_unselected_img = p_unselectImage or "hall/common/spot_unselect.png";
	self.m_dotSize = 0;
	self.m_imageMap = {};
	self.m_intervalX = p_intervalX or 45;
	self.m_isNeedAddNum = p_isNeedNum or false;
end

DotView.setDotCount = function(self, num)
	num = number.valueOf(num);
	if num ~= self.m_dotSize then
		self.m_dotSize = num;
		self:refresh();
	end
end

DotView.setSelectedIndex = function(self, index)
	self.m_selectIndex = index;
	self:updateSelect();
end

DotView.dtor = function(self)
end


------------------------  private -------------------------------

DotView.refresh = function(self)
	self:removeAllChildren(true);
	self.m_imageMap = {};
	for i=1,self.m_dotSize do
		image = UIFactory.createImage(self.m_default_unselected_img);
		self.m_imageMap[i] = image;
	end

	local w,h = self.m_intervalX,45;
	self:setSize(w * self.m_dotSize,45);
	local count = 1;
	for k,v in pairs(self.m_imageMap) do
		if v then
			self:addChild(v);
			v:setPos((k - 1) * w, 0);
			if self.m_isNeedAddNum then
				local _label = new(Text,""..count, nil, nil, kAlignCenter, nil, 20, 210, 210, 220);
        		_label:setName("num");
        		_label:setAlign(kAlignCenter);
        		v:addChild(_label);
				count = count + 1;
			end
		end
	end
end

DotView.updateSelect = function(self)
	for k,v in pairs(self.m_imageMap) do
		if v then
			if k == self.m_selectIndex then
				v:setFile(self.m_default_selected_img);
				if self.m_isNeedAddNum  then
					v:getChildByName("num"):setColor(96,147,166);
				end
			else
				v:setFile(self.m_default_unselected_img);
				if self.m_isNeedAddNum then
					v:getChildByName("num"):setColor(210, 210, 220);
				end
			end
		end
	end
end