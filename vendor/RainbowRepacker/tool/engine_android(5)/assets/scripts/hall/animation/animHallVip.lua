require("animation/animBase");
local animHallVip_pin_map = require("qnFiles/qnPlist/hall/animHallVip_pin");

--大厅VIP动画
AnimHallVip = class(AnimBase);
local animFrameNum = 20;

AnimHallVip.init = function(self)
	local vipFiles = {};
	for i = 1, animFrameNum do
		vipFiles[i] = animHallVip_pin_map[string.format("vipHallAnim%d.png", i)];
	end

	self.aniVipImgs = UIFactory.createImages(vipFiles);
end

AnimHallVip.play = function(self, parentLayer)
	local w, h = parentLayer:getSize();
	--self.aniVipImgs:setSize(w+5, h+3);
	self.aniVipImgs:setAlign(kAlignCenter);
	self.aniVipImgs:setPos(0, -2);
	parentLayer:addChild(self.aniVipImgs);
	self.curIndex = 0;

	self:onTimerShop();
	self.aniVipImgs:setVisible(true);
	self.animTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 155, -1);
	self.animTimer:setDebugName("AnimHallVip.animTimer");
	self.animTimer:setEvent(self, self.onTimer);
end

AnimHallVip.show = function(self)
	if self.aniVipImgs then
        if kUserInfoData:getIsVip() then
		    self.aniVipImgs:setVisible(true);
        end
	end
end

AnimHallVip.hidden = function(self)
	if self.aniVipImgs then
		self.aniVipImgs:setVisible(false);
	end
end

AnimHallVip.onTimer = function(self)
	if self.curIndex > 21 then
		self.curIndex = 0;
	end

	self.aniVipImgs:setImageIndex(self.curIndex);
	self.curIndex = self.curIndex + 1;
end

AnimHallVip.onTimerShop = function(self)
    self:hidden();
	delete(self.animTimer);
	self.animTimer = nil;
end

AnimHallVip.dtor = function(self)
	delete(self.aniVipImgs);
	self.aniVipImgs = nil;
	delete(self.animTimer);
	self.animTimer = nil;
end