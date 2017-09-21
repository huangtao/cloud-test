--region animRose.lua
--Author : LeoChen
--Date   : 2015/3/31
--此文件由[BabeLua]插件自动生成

AnimRose2 = class();
local animRose_pin2_map = require("qnFiles/qnPlist/games/animRose_pin2");
AnimRose2.ROSE_SIZE = 8;
AnimRose2.BURST_ROST_SIZE = 17;

AnimRose2.ctor = function (self, parent)
	-- self.parent = parent;
end

AnimRose2.load = function ( self )
	if not self.root then 
		self.root = UIFactory.createNode();
		self.root:setSize(105, 105);
		self.root:setPos(self.startPos.x, self.startPos.y);
		-- 创建玫瑰花
		local roseImgFileArr = {};
		for i = 1, AnimRose2.ROSE_SIZE do 
			roseImgFileArr[i] = animRose_pin2_map[string.format("rose%d.png", i)];
		end
		self.roseImgs = UIFactory.createImages(roseImgFileArr);
		self.roseImgs:setVisible(false);
		self.roseImgs:setAlign(kAlignCenter);
--		AnimRose2.roseImgs:setPos(AnimRose2.startPos.x, AnimRose2.startPos.y);
		-- 创建花束
		local burstRoseImgFileArr = {};
		for i = 1, AnimRose2.BURST_ROST_SIZE do 
			burstRoseImgFileArr[i] = animRose_pin2_map[string.format("burstRose%d.png", i)];
		end
		self.burstRoseImgs = UIFactory.createImages(burstRoseImgFileArr);
		self.burstRoseImgs:setVisible(false);
		self.burstRoseImgs:setAlign(kAlignCenter);
--		AnimRose2.burstRoseImgs:setPos(AnimRose2.endPos.x, AnimRose2.endPos.y);
		-- 创建星星，应该是n个星星
		self.starImg = UIFactory.createImage(animRose_pin2_map["star.png"]);
		self.starImg:setVisible(false);

		self.root:addChild(self.roseImgs);
		self.root:addChild(self.burstRoseImgs);
		self.root:addChild(self.starImg);

		-- self.parent:addChild(self.root);
	end
end

AnimRose2.play = function ( self, startPos, endPos )
	-- body
	self.startPos = startPos;
	self.endPos = endPos;

	self:stop();
	self:load();

	self:playRoseAnim();

	return self.root;
end
-- ------------------------------------- 播放玫瑰动画 ---------------------------------------
AnimRose2.playRoseAnim = function(self)
	Log.d("AnimRose2.playRoseAnim");
	self.index = 1;
	self.roseImgs:setVisible(true);
	self.roseAnim = AnimFactory.createAnimInt(kAnimLoop, 1, 8, 1000 / 8, -1);
	self.roseAnim:setDebugName("AnimInt|AnimRose2.roseAnim");
	self.roseAnim:setEvent(self, self.onPlayRoseAnim);
end

AnimRose2.onPlayRoseAnim = function ( self,anim_type, anim_id, repeat_or_loop_num )
	-- body
	Log.d("AnimRose2.onPlayRoseAnim", anim_type, anim_id, repeat_or_loop_num);
	if self.index > AnimRose2.ROSE_SIZE then 
		self:onFinishRoseAnim();
		self:playRoseTranslateAnim();
		-- AnimRose2.playBurstRoseAnim();
		return;
	end
	self.roseImgs:setImageIndex(self.index);
	self.index = self.index + 1;
end

AnimRose2.onFinishRoseAnim = function (self)
	delete(self.roseAnim);
	self.roseAnim = nil;
end

AnimRose2.playRoseTranslateAnim = function ( self )
	-- body
	Log.d("AnimRose2.endPos.x - AnimRose2.startPos.x", self.endPos.x - self.startPos.x);
	Log.d("AnimRose2.endPos.y - AnimRose2.startPos.y", self.endPos.y - self.startPos.y);

	local deltaX = self.endPos.x - self.startPos.x;
	local deltaY = self.endPos.y - self.startPos.y;
	local length = math.sqrt(deltaX*deltaX + deltaY*deltaY);
	local time = 1.4 * length;

	self.roseTranslateAnim = self.root:addPropTranslate(1, kAnimNormal, time, 0, 0, self.endPos.x - self.startPos.x, 0, self.endPos.y - self.startPos.y);
	if self.roseTranslateAnim then 
		self.roseTranslateAnim:setEvent(self, self.onPlayRoseTranslateAnim);
	end
end

AnimRose2.onPlayRoseTranslateAnim = function ( self )
	-- body
	Log.d("AnimRose2.onPlayRoseTranslateAnim");
	self:onFinishRoseTranslateAnim();
end

AnimRose2.onFinishRoseTranslateAnim = function ( self )
	-- body
	self.roseImgs:setVisible(false);
	if not self.roseImgs:checkAddProp(1) then 
		self.roseImgs:removeProp(1);
	end

	delete(self.roseImgs);
	self.roseImgs = nil;

	delete(self.roseTranslateAnim);
	self.roseTranslateAnim = nil;

	self:playBurstRoseAnim();
end
-- ------------------------------------- 播放玫瑰花束动画 -----------------------------------

AnimRose2.playBurstRoseAnim = function (self)
	Log.d("AnimRose2.playBurstRoseAnim");
	self.burstRoseImgs:setVisible(true);
	self.burstRoseAnim = AnimFactory.createAnimInt(kAnimLoop, 1, 8, 1000 / 8, 0);
	self.burstRoseAnim:setDebugName("AnimInt|AnimRose2.burstRoseAnim");
	self.burstRoseAnim:setEvent(self, self.onPlayBurstRoseAnim);
end

AnimRose2.onPlayBurstRoseAnim = function ( self,anim_type, anim_id, repeat_or_loop_num )
	-- body
	Log.d("AnimRose2.onPlayBurstRoseAnim", anim_type, anim_id, repeat_or_loop_num);
	if repeat_or_loop_num > AnimRose2.BURST_ROST_SIZE then 
		self:onFinishBurstRoseAnim();
		return;
	end
	self.burstRoseImgs:setImageIndex(repeat_or_loop_num);
end

AnimRose2.onFinishBurstRoseAnim = function (self)
	delete(self.burstRoseImgs);
	self.burstRoseImgs = nil;

	delete(self.burstRoseAnim);
	self.burstRoseAnim = nil;
	
	delete(self.root);
	self.root = nil;
end

AnimRose2.stop = function ( self)
	-- body
	delete(self.roseImgs);
	self.roseImgs = nil;

	delete(self.burstRoseImgs);
	self.burstRoseImgs = nil;

	delete(self.starImg);
	self.starImg = nil;

	delete(self.root);
	self.root = nil;

	self:onFinishRoseAnim();
	self:onFinishBurstRoseAnim();
end

AnimRose2.release = function ( self)
	-- body
end

AnimRose2.dtor = function (self)
	self:stop();
end

--endregion
