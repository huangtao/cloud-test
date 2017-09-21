
local boxFireWorkPin2_map = require("qnFiles/qnPlist/games/boxFireWorkPin2");

--[[
	宝箱开启动画
]]
BoxFireWorkAnim2 = class(AnimBase);
BoxFireWorkAnim2.count=12;
BoxFireWorkAnim2.initCurIndex = 1;

BoxFireWorkAnim2.ctor = function(self)
    self.curIndex = BoxFireWorkAnim2.initCurIndex;
end

BoxFireWorkAnim2.load = function(self)

	if not self.root then
		self.root=new (Node);
		local files={};
		local index = 1;
		for i=1,BoxFireWorkAnim2.count do
            files[index] = boxFireWorkPin2_map["fireworklight"..index..".png"];
            index = index+1;
        end
		self.imgs = UIFactory.createImages(files);
		local w,h = self.imgs:getSize();	
		self.root:setSize(w,h);
        self.root:addChild(self.imgs);
        return w or 0,h or 0;
	end
end

BoxFireWorkAnim2.play = function(self,startX,startY)

	self:release();
	local w,h = self:load();
	local screenW = System.getScreenScaleWidth();
    local screenH = System.getScreenScaleHeight();
    self.x = startX or (screenW-w)/2;
	self.y = startY or (screenH-h)/2;
    self.root:setPos(self.x,self.y);
	self.imgs:setVisible(true);
	self.root:setVisible(true);

    self:startSwitchBg();--动画
    self:tofade();
    return self.root;
end

BoxFireWorkAnim2.tofade = function(self)
	self:removeProp();
    local anit =self.root:addPropTransparency(1, kAnimNormal, 500, 500, 1,0);
    if anit then
    	anit:setDebugName("BoxFireWorkAnim2.tofade.anit");
    	anit:setEvent(self,self.stop);
    end
end

BoxFireWorkAnim2.removeProp = function(self)
	if self.root then
		if not self.root:checkAddProp(1) then
	     	self.root:removeProp(1);
	    end
	end
end

BoxFireWorkAnim2.stop = function(self)
	self:removeProp();
	self:stopSwitchBg();
	if self.root then
		self.root:setVisible(false);  
	end
end

BoxFireWorkAnim2.release = function(self)
	self:stop();
    self.curIndex=BoxFireWorkAnim2.initCurIndex;
end

BoxFireWorkAnim2.startSwitchBg = function(self)
    self.curIndex = BoxFireWorkAnim2.initCurIndex;
	self.imgs:setImageIndex(self.curIndex);
    self:stopSwitchBg();
	self.animSwitchBgs = AnimFactory.createAnimInt(kAnimRepeat, 0, 1,80, -1);
	self.animSwitchBgs:setDebugName("BoxFireWorkAnim2.startSwitchBg.animSwitchBgs");
	self.animSwitchBgs:setEvent(self, self.onFinishSwitchBg);
end

BoxFireWorkAnim2.stopSwitchBg = function(self)
	delete(self.animSwitchBgs);
	self.animSwitchBgs = nil;
end

BoxFireWorkAnim2.dtor = function(self)
	self:release();
end

BoxFireWorkAnim2.onFinishSwitchBg = function(self)
	self.curIndex = self.curIndex + 1;
	if self.curIndex < 0 or self.curIndex ==  BoxFireWorkAnim2.count then
	    self.curIndex = BoxFireWorkAnim2.initCurIndex;
	    self:stopSwitchBg();
	    return;
	end
    self.imgs:setImageIndex(self.curIndex);
end