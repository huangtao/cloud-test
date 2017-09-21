require("animation/animBase");
require("common/uiFactory");
require("common/animFactory");

AnimFrame = class(AnimBase);

AnimFrame.play = function(self,ms,frame,filePath,offsetX, offsetY, delay)
	self.m_ms = ms or 1000;

	self.m_imgCount = frame or 1;
	self.m_filePath = filePath;
	self.m_offsetX = offsetX;
	self.m_offsetY = offsetY;
	self.m_delay = delay;

	self:stop();
	self:load();

	self.m_curIndex = 1;
	self.m_anim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, self.m_ms/self.m_imgCount, 0);
	self.m_anim:setEvent(self, self.onTimer);
	self.m_anim:setDebugName("AnimInt|AnimFrame.anim");
	
	return self.m_root;
end

AnimFrame.startDelay = function(self)
	self.m_animDelay = AnimFactory.createAnimInt(kAnimNormal, 0, 1, self.m_delay, -1);
	self.m_animDelay:setEvent(self, self.onDelayFinish);
	self.m_animDelay:setDebugName("AnimInt|AnimFrame.m_animDelay");
end

AnimFrame.onDelayFinish = function(self)
	self:callback();
	self:stop();
end

AnimFrame.callback = function(self)
end

AnimFrame.setAnimDebugName = function(self, debugName)
	-- body
	if self.m_anim and type(debugName) == "string" and debugName ~= "" then
		self.m_anim:setDebugName(debugName);
	end
end

AnimFrame.setFrameEvent = function (self, frame, func)
	-- body
	self.m_eventFrame = frame;
	self.m_eventFrameFunc = func;
end

AnimFrame.onTimer = function(self)
	if self.m_curIndex==1 then
		self.m_imgs[1]:setVisible(true);
	elseif self.m_curIndex<=self.m_imgCount then
		self.m_imgs[self.m_curIndex-1]:setVisible(false);
		self.m_imgs[self.m_curIndex]:setVisible(true);
	else
		if self.m_delay then
			if self.m_anim then
				delete(self.m_anim);
				self.m_anim = nil;
			end
			self:startDelay();
		else
			self:callback();
			self:stop();
		end
	end
	if self.m_eventFrame and self.m_eventFrameFunc then
		if self.m_eventFrame == self.m_curIndex then
			self.m_eventFrameFunc();
		end
	end
	self.m_curIndex = self.m_curIndex+1;
end

AnimFrame.load = function(self)
	if not self.m_files then
		self.m_files = {};
		for i = 1, self.m_imgCount do
			self.m_files[i] = string.format(self.m_filePath, i);
		end;
	end
	
	if not self.m_root then
		self.m_root = UIFactory.createNode();
		self.m_root:addToRoot();
		self.m_root:setSize(System.getScreenScaleWidth(), System.getScreenScaleHeight());
		
		self.m_imgs = {}
		for i = 1, self.m_imgCount do
			self.m_imgs[i] = new(Image, self.m_files[i]);
			self.m_root:addChild(self.m_imgs[i]);
		    self.m_imgs[i]:setVisible(false);
			self.m_imgs[i]:setAlign(kAlignCenter);
		end

		self.m_root:setLevel(16);
	end;
	self.m_root:setPos(self.m_offsetX or 0, self.m_offsetY or -120);
end;

AnimFrame.release = function(self)
	self:stop();
	if self.m_imgs then
		for _,v in pairs(self.m_imgs) do
			delete(v);
		end;
		self.m_imgs = nil;
	end;
	if self.m_root then
		delete(self.m_root);
		self.m_root = nil;
	end
end;

AnimFrame.stop = function(self)
	if self.m_imgs then
		for _,v in pairs(self.m_imgs) do
			v:setVisible(false);
		end
	end

	delete(self.m_anim);
	self.m_anim = nil;
	delete(self.m_animDelay);
	self.m_animDelay = nil;

end