
--VIP动画

AnimHeadVipAnim2 = class(AnimBase);
local animFrameNum = 20;

AnimHeadVipAnim2.init = function(self)
	local vipFiles = {};
	local animHeadVip_pin2 = require("qnFiles/qnPlist/games/animHeadVip_pin2");
	for i = 1, animFrameNum do
		vipFiles[i] = animHeadVip_pin2[string.format("vipHallAnim%d.png", i)];
	end

	self.aniVipImgs = UIFactory.createImages(vipFiles);
end

AnimHeadVipAnim2.play = function(self, parentLayer)
	local w, h = parentLayer:getSize();
	--self.aniVipImgs:setSize(w+5, h+3);
	self.aniVipImgs:setAlign(kAlignCenter);
	self.aniVipImgs:setPos(0, -2);
	parentLayer:addChild(self.aniVipImgs);
	self.curIndex = 0;

	self:onTimerShop();
	self.aniVipImgs:setVisible(true);
	self.animTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 155, -1);
	self.animTimer:setDebugName("AnimHeadVipAnim2.animTimer");
	self.animTimer:setEvent(self, self.onTimer);
end

AnimHeadVipAnim2.show = function(self)
	if self.aniVipImgs then
        if UserIdentityIsolater.getInstance():getIsVip() then
		    self.aniVipImgs:setVisible(true);
        end
	end
end

AnimHeadVipAnim2.hidden = function(self)
	if self.aniVipImgs then
		self.aniVipImgs:setVisible(false);
	end
end

AnimHeadVipAnim2.onTimer = function(self)
	if self.curIndex > 19 then
		self.curIndex = 0;
	end

	self.aniVipImgs:setImageIndex(self.curIndex);
	self.curIndex = self.curIndex + 1;
end

AnimHeadVipAnim2.onTimerShop = function(self)
    self:hidden();
	delete(self.animTimer);
	self.animTimer = nil;
end

AnimHeadVipAnim2.dtor = function(self)
	delete(self.animTimer);
	self.animTimer = nil;
end