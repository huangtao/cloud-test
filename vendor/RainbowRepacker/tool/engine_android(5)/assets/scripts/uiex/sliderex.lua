require("ui/slider");

Slider.ctor = function(self, width, height, bgImage, fgImage, buttonImage)
	self.m_bgImage = Slider.s_bgImage or Slider.s_defaultBgImage;
	self.m_fgImage = Slider.s_fgImage or Slider.s_defaultFgImage;
	self.m_buttonImage = Slider.s_buttonImage or Slider.s_defaultButtonImage;

	self.m_bg = new(Image,self.m_bgImage,nil,nil,15,15,0,0);
	width = (width and width >= 1) and width or self.m_bg:getSize();
	height = (height and height >= 1) and height or select(2,self.m_bg:getSize());
	
	Slider.setSize(self,width,height);
	
	Slider.addChild(self,self.m_bg);
	self.m_bg:setFillParent(true,true);
	self.m_bg:setEventTouch(self,self.onSliderTouch);

	self.m_fg = new(Image,self.m_fgImage,nil,nil,15,15,0,0);

	Slider.addChild(self,self.m_fg);

	local margin = 5;
	local w, _ = self.m_bg:getSize();
	self.m_fg:setSize(w-margin*2, nil);
	self.m_fg:setAlign(kAlignCenter);
	self.m_fg:setEventTouch(self,self.onSliderTouch);

	
	self.m_button = new(Image,self.m_buttonImage);
	Slider.addChild(self,self.m_button);
	self.m_button:setAlign(kAlignLeft);
	self.m_button:setPos(0,0);
	self.m_button:setEventTouch(self,self.onEventTouch1);
	
	self.m_width = width;
	Slider.setProgress(self,1.0);

	self.m_changeCallback = {};

    self:setEnable(true)

	self.draggable=true;
end

Slider.setDraggable = function(self,draggable)
	self.draggable=draggable;
end

--上面的构造函数的行为默认了 fgImage比底小 10 ，且宽度不可变。
--这里增加一个接口，用来兼容改善上述问题。
--建议以后在用这个类的对象的时候都调用下个这个接口。

Slider.setFgFillBg = function(self,leftWidth, rightWidth, topWidth, bottomWidth,p_progressOffset)

	p_progressOffset = p_progressOffset or 5;
	self.m_progressOffset = p_progressOffset;

	leftWidth = leftWidth or 15;
	rightWidth = rightWidth or 15;
	topWidth = topWidth or 0;
	bottomWidth = bottomWidth or 0;
     
	if self.m_bg then
		self:removeChild(self.m_bg,true);	
	end

	self.m_bg = new(Image,self.m_bgImage,nil,nil,leftWidth,rightWidth,topWidth,bottomWidth);
	self.m_bg:setFillParent(true,true);
	self.m_bg:setEventTouch(self,self.onSliderTouch);
	self:addChild(self.m_bg);
	
	if self.m_fg then
		self:removeChild(self.m_fg,true);
	end

	self.m_fg = new(Image,self.m_fgImage,nil,nil,leftWidth,rightWidth,topWidth,bottomWidth);
	self.m_fg:setFillParent(true,true);
	self.m_fg:setEventTouch(self,self.onSliderTouch);
	Slider.addChild(self,self.m_fg);

	self:removeChild(self.m_button);
	self:addChild(self.m_button); 

	local setProgressOffset = function(self,progress)

		self.setProgress = function(self, progress)
			progress = progress > 1 and 1 or progress;
			progress = progress < 0 and 0 or progress;
			self.m_progress = progress;

			local buttonW,buttonH = self.m_button:getSize();
			local buttonX = self.m_progress*self.m_width - buttonW/2 + self.m_progressOffset;
			self.m_button:setPos(buttonX);
			self.m_fg:setClip(self.m_progressOffset,0,(self.m_width - self.m_progressOffset*2)*self.m_progress,buttonH);
		end

	end

end

Slider.setEnable = function(self, enable)
	self.m_button:setPickable(enable, 30, 30, 30, 30);
	self:setDraggable(enable);
end

Slider.setButtonVisible = function(self, visible)
	self.m_button:setVisible(visible);
	self:setDraggable(visible);
end

Slider.onEventTouch1 = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
   if self.draggable then
   		Slider.onEventTouch(self, finger_action, x, y, drawing_id_first, drawing_id_current);
   end
end

Slider.onSliderTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
   if self.draggable then
   		if finger_action == kFingerUp and drawing_id_first == drawing_id_current then
			local absX = self:getAbsolutePos();
			local w = self.m_bg:getSize();
			local progress = math.abs(x - absX)/w;
			self:setProgress(progress);

			if self.m_changeCallback.func then
				self.m_changeCallback.func(self.m_changeCallback.obj,self.m_progress);
			end 
   		end 
   end
end
