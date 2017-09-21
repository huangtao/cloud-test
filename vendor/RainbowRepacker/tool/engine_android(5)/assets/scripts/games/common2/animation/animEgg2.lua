--region NewFile_1.lua
--Author : LeoChen
--Date   : 2015/4/2
--此文件由[BabeLua]插件自动生成
-- 互动道具，鸡蛋

AnimEgg2 = class();

local animEgg_pin2 = require("qnFiles/qnPlist/games/animEgg_pin2");

AnimEgg2.ctor = function(self)
end

AnimEgg2.load = function (self)

	if not self.root then 
		self.root = UIFactory.createNode();
		self.root:setSize(105, 105);
		self.root:setPos(self.startPos.x, self.startPos.y);
		
		Log.d("AnimEgg2 startPos", self.root:getPos());
		self.egg = new(Image, animEgg_pin2["egg.png"]);
		self.egg:setAlign(kAlignCenter);
		self.root:addChild(self.egg);

		local burstEggFileArr = {};
		for i = 1, 15 do
			table.insert(burstEggFileArr, animEgg_pin2[string.format("egg%d.png", i)]);
		end
		self.burstEggImgs = UIFactory.createImages(burstEggFileArr);
		-- AnimEgg2.burstEggImgs:setPos(AnimEgg2.endPos.x, AnimEgg2.endPos.y);
		self.burstEggImgs:setVisible(false);
		self.burstEggImgs:setAlign(kAlignCenter);
		self.root:addChild(self.burstEggImgs);
		
		-- self.parent:addChild(self.root);
	end


end

AnimEgg2.play = function (self, startPos, endPos)

	self.startPos = startPos;
	self.endPos = endPos;

	self:stop();
	self:load();

	self:playEggMove();
	return self.root;

end

AnimEgg2.playEggMove = function (self)
	self.egg:setVisible(true);
	
	-- Log.d("self.endPos.x - self.startPos.x", self.endPos.x - self.startPos.x);
	-- Log.d("self.endPos.y - self.startPos.y", self.endPos.y - self.startPos.y);

	local deltaX = self.endPos.x - self.startPos.x;
	local deltaY = self.endPos.y - self.startPos.y;
	local length = math.sqrt(deltaX*deltaX + deltaY*deltaY);
	local time = 1.4 * length;

	self.eggMoveAnim = self.root:addPropTranslate(1, kAnimNormal, time, -1, 0, self.endPos.x - self.startPos.x, 0, self.endPos.y - self.startPos.y);
	self.eggMoveAnim:setEvent(self, self.onFinishPlayEggMove);

	self.eggRotateAnim = self.egg:addPropRotate(2, kAnimRepeat, time/2, -1, 0, 360, kCenterDrawing);
	self.eggRotateAnim:setEvent(self, self.onFinishPlayEggRotate);
end

AnimEgg2.onFinishPlayEggMove = function(self)
	
	delete(self.eggMoveAnim);
	self.eggMoveAnim = nil;

	delete(self.eggRotateAnim);
	self.eggRotateAnim = nil;
	
	delete(self.egg);
	self.egg = nil;
	
	delete(self.burstEggAnim);
	self.burstEggAnim = nil;
	self:playBurstEgg();
end

AnimEgg2.onFinishPlayEggRotate = function (self)

end

AnimEgg2.playBurstEgg = function (self)
	self.burstEggImgs:setVisible(true);
	self.index = 1;
	self.burstEggAnim = AnimFactory.createAnimInt(kAnimLoop, 1, 15, 2500 / 15, -1);
	self.burstEggAnim:setDebugName("AnimInt|AnimEgg2.burstEggAnim");
	self.burstEggAnim:setEvent(self, self.onPlayBurstEgg);
end

AnimEgg2.onPlayBurstEgg = function (self, anim_type, anim_id, repeat_or_loop_num)
	-- Log.d("AnimEgg2.onPlayBurstEgg", anim_type, anim_id, repeat_or_loop_num);
	if self.index > 15 then 
		self:onFinishPlayBurstEgg();
		return;
	end
	self.burstEggImgs:setImageIndex(self.index);
	self.index = self.index + 1;
end

AnimEgg2.onFinishPlayBurstEgg = function (self)
	delete(self.burstEggAnim);
	self.burstEggAnim = nil;

	delete(self.burstEggImgs);
	self.burstEggImgs = nil;
	
	delete(self.root);
	self.root = nil;
end

AnimEgg2.stop = function (self)
	
	delete(self.eggMoveAnim);
	self.eggMoveAnim = nil;

	delete(self.egg);
	self.egg = nil;

	delete(self.burstEggAnim);
	self.burstEggAnim = nil;
	
	delete(self.burstEggImgs);
	self.burstEggImgs = nil;
	
	delete(self.root);
	self.root = nil;

end

AnimEgg2.dtor = function (self)
	self:stop();
end