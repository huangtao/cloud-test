
AnimFrameNew = class(Node);


AnimFrameNew.ctor = function(self,pinMap,interval,loop)
	local files = {};
	local index = 1;
	for k,v in pairs(pinMap) do
		files[index] = v;
		index = index+1;
	end
	self.m_count = index-1;
    self.m_interval = interval;
    
	self.aniImgs = UIFactory.createImages(files);
	self.m_loop = loop;
end

AnimFrameNew.playInNode = function(self, parentLayer,w,h,x,y)
	local pw, ph = parentLayer:getSize();
	if not w or not h then 
		w = pw;
		h = ph;
	end 
   
	self.aniImgs:setSize(w,h);
	self:setSize(w,h);
	self:setAlign(kAlignCenter);
	self:addChild(self.aniImgs);
	self.aniImgs:setAlign(kAlignCenter);
	self.aniImgs:setPos(x or 0, y or 0);
	parentLayer:addChild(self);
	self.aniImgs:setVisible(false);

	self.curIndex = 0;

	self:onTimerShop();
	self.aniImgs:setVisible(true);
	self.animTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, self.m_interval, -1);
	self.animTimer:setDebugName("AnimFrameNew.animTimer");
	self.animTimer:setEvent(self, self.onTimer);
end

AnimFrameNew.setEndCallBack = function(self,obj,callbackFun )
	self.obj = obj;
	self.callbackFun = callbackFun;
end
AnimFrameNew.onEnd = function(self)
	-- body
	if self.obj then 
		if self.callbackFun then 
			self.callbackFun(self.obj);
		end 
	end 
end

AnimFrameNew.onTimer = function(self)
	if self.curIndex > (self.m_count- 1) then --images图片index从0开始
		
		
		if self.m_loop == -1 then 
            self.curIndex = 0;
        else 
        	if self.m_loop == 0 then 
        	  self:onEnd();
        	  delete(self.animTimer);
	          self.animTimer = nil;

        	  delete(self);
             
        	  return ;

        	end 
           self.curIndex = 0;
           self.m_loop = self.m_loop - 1;
		end 

	end
  -- Log.d("AnimFrameNew.onTimer",self.curIndex ,self.m_count);
	self.aniImgs:setImageIndex(self.curIndex);
	self.curIndex = self.curIndex + 1;
end

AnimFrameNew.onTimerShop = function(self)
	delete(self.animTimer);
	self.animTimer = nil;
end

AnimFrameNew.dtor = function(self)
	delete(self.animTimer);
	self.animTimer = nil;
end