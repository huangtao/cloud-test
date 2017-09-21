--region animSlippers.lua
--Author : LeoChen
--Date   : 2015/4/7
--此文件由[BabeLua]插件自动生成
-- 互动道具，拖鞋动画


AnimSlippers2 = class();

local animSlippers_pin2_map = require("qnFiles/qnPlist/games/animSlippers_pin2");

AnimSlippers2.ctor = function (self, parent)
	-- self.parent = parent;
end

AnimSlippers2.load = function (self)

	if not self.root then 
		self.root = UIFactory.createNode();
		self.root:setSize(105, 105);
		self.root:setPos(self.startPos.x, self.startPos.y);
		-- self.parent:addChild(self.root);

		self.slippers = UIFactory.createImage(animSlippers_pin2_map["slippers.png"]);
		self.slippers:setAlign(kAlignCenter);
		self.root:addChild(self.slippers);

		local burstSlippersImgFiles = {};
		for i = 1, 15 do 
			if self.endPos.x - self.startPos.x > 500 then 
				table.insert(burstSlippersImgFiles, animSlippers_pin2_map[string.format("slippers_r_%d.png", i)]);
			else
				table.insert(burstSlippersImgFiles, animSlippers_pin2_map[string.format("slippers_l_%d.png", i)]);
			end
		end
		self.burstSlippersImgs = UIFactory.createImages(burstSlippersImgFiles);
		self.burstSlippersImgs:setAlign(kAlignCenter);
		self.burstSlippersImgs:setVisible(false);
		self.root:addChild(self.burstSlippersImgs);
	end

end

AnimSlippers2.play = function ( self, startPos, endPos )
	-- body

	self.startPos = startPos;
	self.endPos = endPos;

	self:stop();
	self:load();

	self:playSlippersMove();

	return self.root;
end


AnimSlippers2.playSlippersMove = function (self)
	Log.d("self.endPos.x - self.startPos.x", self.endPos.x - self.startPos.x);
	Log.d("self.endPos.y - self.startPos.y", self.endPos.y - self.startPos.y);

	local deltaX = self.endPos.x - self.startPos.x;
	local deltaY = self.endPos.y - self.startPos.y;
	local length = math.sqrt(deltaX*deltaX + deltaY*deltaY);
	local time = 1.4 * length;

	self.slippers:setVisible(true);
	self.slippersMoveAnim = self.root:addPropTranslate(1, kAnimNormal, time, -1, 0, self.endPos.x - self.startPos.x, 0, self.endPos.y - self.startPos.y);
	self.slippersMoveAnim:setDebugName("AnimTranslate|AnimSlippers2.slippersMoveAnim");
	self.slippersMoveAnim:setEvent(self, self.onFinishPlaySlippersMove);

	self.slippersRotateAnim = self.slippers:addPropRotate(2, kAnimRepeat, time/2, -1, 360, 0, kCenterDrawing);
	self.slippersRotateAnim:setDebugName("AnimRotate|AnimSlippers2.slippersRotateAnim");
	self.slippersRotateAnim:setEvent(self, self.onFinishPlaySlippersRotate);
end

AnimSlippers2.onFinishPlaySlippersMove = function(self)
	
	delete(self.slippersMoveAnim);
	self.slippersMoveAnim = nil;

	delete(self.slippersRotateAnim);
	self.slippersRotateAnim = nil;
	
	delete(self.slippers);
	self.slippers = nil;
	
	delete(self.burstSlippersAnim);
	self.burstSlippersAnim = nil;

	self:playBurstSlippers();
end

AnimSlippers2.onFinishPlaySlippersRotate = function (self)

end

AnimSlippers2.playBurstSlippers = function (self)
	self.burstSlippersImgs:setVisible(true);
	self.index = 1;
	self.burstSlippersAnim = AnimFactory.createAnimInt(kAnimLoop, 1, 15, 2500 / 15, -1);
	self.burstSlippersAnim:setDebugName("AnimInt|AnimSlippers2.burstSlippersAnim");
	self.burstSlippersAnim:setEvent(self, self.onPlayBurstSlippers);
end

AnimSlippers2.onPlayBurstSlippers = function (self,anim_type, anim_id, repeat_or_loop_num)
	Log.d("AnimSlippers2.onPlayBurstSlippers", anim_type, anim_id, repeat_or_loop_num);
	if self.index > 15 then 
		self:onFinishPlayBurstSlippers();
		return;
	end
	self.burstSlippersImgs:setImageIndex(self.index);
	self.index = self.index + 1;
end

AnimSlippers2.onFinishPlayBurstSlippers = function (self)
	delete(self.burstSlippersAnim);
	self.burstSlippersAnim = nil;

	delete(self.burstSlippersImgs);
	self.burstSlippersImgs = nil;
end

AnimSlippers2.stop = function ( self )
	-- body

	delete(self.slippersMoveAnim);
	self.slippersMoveAnim = nil;

	delete(self.slippersRotateAnim);
	self.slippersRotateAnim = nil;
	
	delete(self.burstSlippersAnim);
	self.burstSlippersAnim = nil;
	
	delete(self.slippers);
	self.slippers = nil;

	delete(self.burstSlippersImgs);
	self.burstSlippersImgs = nil;

	delete(self.root);
	self.root = nil;

end

AnimSlippers2.dtor = function (self)
	self:stop();
end
--endregion
