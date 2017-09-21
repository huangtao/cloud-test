require("ui/switch");
local setting_pin_map = require("qnFiles/qnPlist/hall/setting_pin");

Switch.s_enableSlideDefault = true

Switch.ctor = function(self, width, height, onFile, offFile, buttonFile)
	onFile = onFile or Switch.s_onFile or Switch.s_defaultOnFile;
	offFile = offFile or Switch.s_offFile or Switch.s_defaultOffFile;
	buttonFile = buttonFile or Switch.s_buttonFile or Switch.s_defaultButtonFile;

	self.m_onImage = new(Image,onFile);
	self.m_offImage = new(Image,offFile);
	self.m_buttonImage = new(Image,buttonFile);

	local onWidth,onHeight = self.m_onImage:getSize();
	local scale = Switch.calculateScale(self,width,height,onWidth,onHeight);

	width,height = Switch.calculateSize(self,self.m_onImage,scale);
	self.m_buttonWidth,self.m_buttonHeight = Switch.calculateSize(self,self.m_buttonImage,scale);

	self.m_onImage:setSize(width,height);
	self.m_offImage:setSize(width,height);
	self.m_buttonImage:setSize(self.m_buttonWidth,self.m_buttonHeight);
	Switch.addChild(self,self.m_onImage);
	Switch.addChild(self,self.m_offImage);
	Switch.addChild(self,self.m_buttonImage);

	Node.setSize(self,width,height);
	self:__clipSelf();

	self.m_buttonImage:setEventTouch(self,self.onButtonClick);

	Switch.setOn(self);

	self.m_eventCallback = {};
	self.s_enableSlide = Switch.s_enableSlideDefault
end

Switch.setPos = function(self, x, y)
	Node.setPos(self,x,y);
	self:__clipSelf();
end

Switch.setAlign = function(self, align)
	Node.setAlign(self,align);
	self:__clipSelf();
end

Switch.setParent = function(self, parent)
	Node.setParent(self,parent);
	self:__clipSelf();
end

Switch.setOn = function(self)
	self.m_onImage:setPos(0);
	self.m_onImage:setVisible(true);
	self.m_buttonImage:setAlign(kAlignRight);
	self.m_buttonImage:setPos(0);
	self.m_offImage:setPos(self.m_width-self.m_buttonWidth);
	self.m_offImage:setVisible(false);
	self.m_buttonImage:setFile(setting_pin_map["switch_on.png"]);
end

Switch.setOff = function(self)
	self.m_offImage:setPos(0);
	self.m_offImage:setVisible(true);
	self.m_buttonImage:setAlign(kAlignLeft);
	self.m_buttonImage:setPos(0);
	self.m_onImage:setPos(-self.m_width+self.m_buttonWidth);
	self.m_onImage:setVisible(false);
	self.m_buttonImage:setFile(setting_pin_map["switch_off.png"]);
end

Switch.setDiff = function(self, diff)
	if diff == 0 
		or (diff > 0 and self.m_state)
		or (diff < 0 and not self.m_state) then
		return;
	end

	-- if math.abs(diff) > self.m_width then
	-- 	diff = self.m_width * (diff < 0 and -1 or 1)
	-- end
	
	if not self.maxDiff then
		self.maxDiff=self.m_width-self.m_buttonWidth;
	end

	if math.abs(diff) > self.maxDiff then
		diff = self.maxDiff * (diff < 0 and -1 or 1)
	end

	if self.s_enableSlide == true then
		if self.m_state then
			self.m_onImage:setPos(diff);
			self.m_buttonImage:setPos(-diff);
			self.m_offImage:setPos(diff + self.m_width-self.m_buttonWidth);
		else
			self.m_offImage:setPos(diff);
			self.m_buttonImage:setPos(diff);
			self.m_onImage:setPos(diff - self.m_width+self.m_buttonWidth);
		end
	end
end

Switch.onButtonClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerDown then
        self.m_dragingX = x;
		self.m_buttonImage:setColor(128,128,128);
		if self.s_enableSlide == true then
			self.m_onImage:setVisible(true);
			self.m_offImage:setVisible(true);
		end
	else 
		local diffX = x - self.m_dragingX;
		Switch.setDiff(self,diffX);
		
		if finger_action ~= kFingerMove then
			self.m_buttonImage:setColor(255,255,255);

			local responseCallback = function()
				if self.m_eventCallback.func then
					self.m_eventCallback.func(self.m_eventCallback.obj,self.m_state)
				end
			end

			if self.isDrag then
				if self.m_state then --拖动以拖动的结果，点击以点击的结果
					if diffX < -(self.m_width - self.m_buttonWidth)/2 then
						Switch.setChecked(self,false);
						responseCallback();
					else
						Switch.setOn(self);
					end
				else
					if diffX > (self.m_width - self.m_buttonWidth)/2 then
						Switch.setChecked(self,true);
						responseCallback();
					else
						Switch.setOff(self);
					end
				end
			else 
				Switch.setChecked(self,not self.m_state);
				responseCallback();
			end

			self.isDrag=nil;
		else
			if not self.isDrag then
				self.isDrag=(math.abs(diffX) > 4);
		end
			
		end
	end
end

Switch.__clipSelf = function(self)
	local x,y = self:getUnalignPos();
	Node.setClip(self,x,y,self.m_width,self.m_height);	
end

Switch.setEnableSlide = function(state)
	Switch.s_enableSlideDefault = state or (state == nil)
end
