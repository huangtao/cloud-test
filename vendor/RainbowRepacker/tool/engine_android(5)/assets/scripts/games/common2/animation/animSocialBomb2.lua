--region NewFile_1.lua
--Author : LeoChen
--Date   : 2015/4/3
--此文件由[BabeLua]插件自动生成
-- 炸弹动画


AnimSocialBomb2 = class();

local animSocialBomb_pin2_map = require("qnFiles/qnPlist/games/animSocialBomb_pin2");

AnimSocialBomb2.ctor = function (self)
end

AnimSocialBomb2.load = function (self)

	if not self.root then 
		self.root = UIFactory.createNode();
		self.root:setSize(105, 105);
		self.root:setPos(self.startPos.x, self.startPos.y);
		
		self.bomb = new(Image, animSocialBomb_pin2_map["bomb.png"]);
		self.bomb:setAlign(kAlignCenter);
		self.root:addChild(self.bomb);

		local brustBombFileArr = {};
		for i = 1, 10 do
			table.insert(brustBombFileArr, animSocialBomb_pin2_map[string.format("bomb%d.png", i)]);
		end
		self.burstBombImgs = UIFactory.createImages(brustBombFileArr);
		self.burstBombImgs:setVisible(false);
		self.burstBombImgs:setAlign(kAlignCenter);
		self.root:addChild(self.burstBombImgs);
	end
end

AnimSocialBomb2.play = function (self, startPos, endPos)

	self.startPos = startPos;
	self.endPos = endPos;

	self:stop();
	self:load();

	self:playBombMove();
	return self.root;

end

AnimSocialBomb2.playBombMove = function (self)
	Log.d("AnimSocialBomb2.endPos.x - AnimSocialBomb2.startPos.x", self.endPos.x - self.startPos.x);
	Log.d("AnimSocialBomb2.endPos.y - AnimSocialBomb2.startPos.y", self.endPos.y - self.startPos.y);

	local deltaX = self.endPos.x - self.startPos.x;
	local deltaY = self.endPos.y - self.startPos.y;
	local length = math.sqrt(deltaX*deltaX + deltaY*deltaY);
	local time = 1.4 * length;

	self.bomb:setVisible(true);
	self.bombMoveAnim = self.root:addPropTranslate(1, kAnimNormal, time, -1, 0, self.endPos.x - self.startPos.x, 0, self.endPos.y - self.startPos.y);
	self.bombMoveAnim:setDebugName("AnimTranslate|AnimSocialBomb2.bombMoveAnim");
	self.bombMoveAnim:setEvent(self, self.onFinishPlayBombMove);

	self.bombRotateAnim = self.bomb:addPropRotate(2, kAnimRepeat, time/2, -1, 0, 360, kCenterDrawing);
	self.bombRotateAnim:setDebugName("AnimRotate|AnimSocialBomb2.bombRotateAnim");
	self.bombRotateAnim:setEvent(self, self.onFinishPlayBombRotate);
end

AnimSocialBomb2.onFinishPlayBombMove = function(self)
	
	delete(self.bombMoveAnim);
	self.bombMoveAnim = nil;

	delete(self.bombRotateAnim);
	self.bombRotateAnim = nil;
	
	delete(self.bomb);
	self.bomb = nil;
	
	delete(self.burstBombAnim);
	self.burstBombAnim = nil;

	self:playBurstBomb();
end

AnimSocialBomb2.onFinishPlayBombRotate = function (self)

end

AnimSocialBomb2.playBurstBomb = function (self)
	self.burstBombImgs:setVisible(true);
	self.index = 1;
	self.burstBombAnim = AnimFactory.createAnimInt(kAnimLoop, 1, 15, 2500 / 15, -1);
	self.burstBombAnim:setDebugName("AnimInt|AnimSocialBomb2.burstBombAnim");
	self.burstBombAnim:setEvent(self, self.onPlayBurstBomb);
end

AnimSocialBomb2.onPlayBurstBomb = function (self,anim_type, anim_id, repeat_or_loop_num)
	Log.d("AnimSocialBomb2.onPlayBurstBomb", anim_type, anim_id, repeat_or_loop_num);
	if self.index > 10 then 
		self:onFinishPlayBurstBomb();
		return;
	end
	self.burstBombImgs:setImageIndex(self.index);
	self.index = self.index + 1;
end

AnimSocialBomb2.onFinishPlayBurstBomb = function (self)
	delete(self.burstBombAnim);
	self.burstBombAnim = nil;

	delete(self.burstBombImgs);
	self.burstBombImgs = nil;
	
	self:onHideResultImg();
end

AnimSocialBomb2.onHideResultImg = function (self)
	
	delete(self.root);
	self.root = nil;
end

AnimSocialBomb2.stop = function (self)
	

	delete(self.bombMoveAnim);
	self.bombMoveAnim = nil;

	delete(self.bomb);
	self.bomb = nil;

	delete(self.burstBombAnim);
	self.burstBombAnim = nil;
	
	delete(self.burstBombImgs);
	self.burstBombImgs = nil;

	delete(self.root);
	self.root = nil;

end

AnimSocialBomb2.dtor = function (self)
	self:stop();
end