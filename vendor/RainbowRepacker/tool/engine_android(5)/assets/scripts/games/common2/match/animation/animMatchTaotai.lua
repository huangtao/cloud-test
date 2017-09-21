
local AnimMatchTaotai = class(AnimBase);

AnimMatchTaotai.filesCount = 29;
AnimMatchTaotai.files = {};
for i = 1, AnimMatchTaotai.filesCount do
	AnimMatchTaotai.files[i] = string.format("games/common/match/anim/taotai/taotai_%d.png", i);
end

AnimMatchTaotai.load = function()
	if not AnimMatchTaotai.root then
		AnimMatchTaotai.root = new(Node);
        AnimMatchTaotai.root:setFillParent(true, true);
        local sw, sh = AnimMatchTaotai.root:getSize();
		AnimMatchTaotai.root:addToRoot();

		
		AnimMatchTaotai.bgImg = UIFactory.createImage("games/common/match/anim/anim_bg.png");
		AnimMatchTaotai.root:addChild(AnimMatchTaotai.bgImg);
		AnimMatchTaotai.bgImg:setAlign(kAlignCenter);
		AnimMatchTaotai.bgImg:setVisible(false);

		AnimMatchTaotai.imgs = UIFactory.createImages(AnimMatchTaotai.files);
    	AnimMatchTaotai.imgs:setPos(0, 0);
		AnimMatchTaotai.imgs:setAlign(kAlignCenter);
		local w,h = AnimMatchTaotai.imgs:getSize();
		AnimMatchTaotai.imgs:setVisible(false);
		AnimMatchTaotai.root:addChild(AnimMatchTaotai.imgs);
	end
	
end

AnimMatchTaotai.play = function()
	AnimMatchTaotai.stop(); 
	AnimMatchTaotai.load();
	AnimMatchTaotai.startFadeIn();
	AnimMatchTaotai.startFrame();
	AnimMatchTaotai.bgImg:setVisible(true);
	AnimMatchTaotai.imgs:setVisible(true);
	
	return AnimMatchTaotai.root;
end

AnimMatchTaotai.stop = function()
	AnimMatchTaotai.stopFrame();

	delete(AnimMatchTaotai.root);
	AnimMatchTaotai.root = nil;
end

AnimMatchTaotai.startFrame = function()
	AnimMatchTaotai.animFrame = AnimMatchTaotai.imgs:addPropImageIndex(2, kAnimNormal, 3000, -1, 0,  AnimMatchTaotai.filesCount-1); 
end

AnimMatchTaotai.stopFrame = function()
	if AnimMatchTaotai.animFrame then
		AnimMatchTaotai.imgs:removeProp(2);
		AnimMatchTaotai.animFrame = nil;
	end
end

AnimMatchTaotai.onFinishFrame = function()
    AnimMatchTaotai.imgs:setVisible(false);
end


AnimMatchTaotai.startFadeIn = function()
	AnimMatchTaotai.fadeInAnim = AnimFactory.createAnimDouble(kAnimNormal, 0.0, 1.0, 2000,0);
	AnimMatchTaotai.fadeInAnim:setDebugName("AnimDouble|AnimMatchTaotai.fadeInAnim");
	AnimMatchTaotai.fadeInAnim:setEvent(AnimMatchTaotai, AnimMatchTaotai.onFinishFadeIn);
	AnimMatchTaotai.fadeInProp = new(PropTransparency,AnimMatchTaotai.fadeInAnim);
	AnimMatchTaotai.bgImg:addProp(AnimMatchTaotai.fadeInProp, 3);
end

AnimMatchTaotai.stopFadeIn = function()
	if AnimMatchTaotai.fadeInAnim then
		AnimMatchTaotai.bgImg:removeProp(3);
		delete(AnimMatchTaotai.fadeInProp);
		AnimMatchTaotai.fadeInProp = nil;
		delete(AnimMatchTaotai.fadeInAnim);
		AnimMatchTaotai.fadeInAnim = nil;
	end
end

AnimMatchTaotai.onFinishFadeIn = function()
	AnimMatchTaotai.stopFadeIn();
	AnimMatchTaotai.startFadeOut();
end

AnimMatchTaotai.startFadeOut = function()
	AnimMatchTaotai.fadeOutAnim = AnimFactory.createAnimDouble(kAnimNormal, 1.0, 0.0, 1000,0);
	AnimMatchTaotai.fadeOutAnim:setDebugName("AnimDouble|AnimMatchTaotai.fadeOutAnim");
	AnimMatchTaotai.fadeOutAnim:setEvent(AnimMatchTaotai, AnimMatchTaotai.onFinishFadeOut);
	AnimMatchTaotai.fadeOutProp = new(PropTransparency,AnimMatchTaotai.fadeOutAnim);
	AnimMatchTaotai.bgImg:addProp(AnimMatchTaotai.fadeOutProp, 4);
end

AnimMatchTaotai.stopFadeOut = function()
	if AnimMatchTaotai.fadeOutAnim then
		AnimMatchTaotai.bgImg:removeProp(4);
		delete(AnimMatchTaotai.fadeOutProp);
		AnimMatchTaotai.fadeOutProp = nil;
		delete(AnimMatchTaotai.fadeOutAnim);
		AnimMatchTaotai.fadeOutAnim = nil;
	end
end

AnimMatchTaotai.onFinishFadeOut = function()
	AnimMatchTaotai.stopFadeOut();
	AnimMatchTaotai.bgImg:setVisible(false);
	AnimMatchTaotai.stop();
end

AnimMatchTaotai.release = function()
	AnimMatchTaotai.stop();
end

return AnimMatchTaotai;
