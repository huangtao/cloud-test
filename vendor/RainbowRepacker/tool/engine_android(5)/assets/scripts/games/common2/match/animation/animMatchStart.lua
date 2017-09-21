
local AnimMatchStart = class(AnimBase);

AnimMatchStart.filesCount = 11;
AnimMatchStart.files = {};
for i = 1, AnimMatchStart.filesCount do
	AnimMatchStart.files[i] = string.format("games/common/match/anim/start/start_%d.png", i);
end

AnimMatchStart.load = function()
	if not AnimMatchStart.root then
		AnimMatchStart.root = new(Node);
        AnimMatchStart.root:setFillParent(true, true);
        local sw, sh = AnimMatchStart.root:getSize();
		AnimMatchStart.root:addToRoot();
		
		AnimMatchStart.bgImg = UIFactory.createImage("games/common/match/anim/anim_bg.png");
		AnimMatchStart.root:addChild(AnimMatchStart.bgImg);
		AnimMatchStart.bgImg:setAlign(kAlignCenter);
		AnimMatchStart.bgImg:setVisible(false);

		AnimMatchStart.imgs = UIFactory.createImages(AnimMatchStart.files);
    	AnimMatchStart.imgs:setPos(0, 0);
		AnimMatchStart.imgs:setAlign(kAlignCenter);
		local w,h = AnimMatchStart.imgs:getSize();
		AnimMatchStart.imgs:setVisible(false);
		AnimMatchStart.root:addChild(AnimMatchStart.imgs);
	end
	
end

AnimMatchStart.play = function()
	AnimMatchStart.stop(); 
	AnimMatchStart.load();
	AnimMatchStart.startFadeIn();
	AnimMatchStart.startFrame();
	AnimMatchStart.bgImg:setVisible(true);
	AnimMatchStart.imgs:setVisible(true);
	
	return AnimMatchStart.root;
end

AnimMatchStart.stop = function()
	AnimMatchStart.stopFrame();
	AnimMatchStart.stopFadeIn();
	AnimMatchStart.stopFadeOut();

	delete(AnimMatchStart.root);
	AnimMatchStart.root = nil;
end

AnimMatchStart.startFrame = function()
	AnimMatchStart.animFrame = AnimMatchStart.imgs:addPropImageIndex(2, kAnimNormal, 1200, -1, 0,  AnimMatchStart.filesCount-1); 
	if AnimMatchStart.animFrame then
		AnimMatchStart.animFrame:setEvent(nil, AnimMatchStart.onFinishFrame);
	end
end

AnimMatchStart.stopFrame = function()
	if AnimMatchStart.animFrame then
		AnimMatchStart.imgs:removeProp(2);
		AnimMatchStart.animFrame = nil;
	end
end

AnimMatchStart.onFinishFrame = function()
    AnimMatchStart.imgs:setVisible(false);
end

AnimMatchStart.startFadeIn = function()
	AnimMatchStart.fadeInAnim = AnimFactory.createAnimDouble(kAnimNormal, 0.0, 1.0, 700,0);
	AnimMatchStart.fadeInAnim:setDebugName("AnimDouble|AnimMatchStart.fadeInAnim");
	AnimMatchStart.fadeInAnim:setEvent(AnimMatchStart, AnimMatchStart.onFinishFadeIn);
	AnimMatchStart.fadeInProp = new(PropTransparency,AnimMatchStart.fadeInAnim);
	AnimMatchStart.bgImg:addProp(AnimMatchStart.fadeInProp, 3);
end

AnimMatchStart.stopFadeIn = function()
	if AnimMatchStart.fadeInAnim then
		AnimMatchStart.bgImg:removeProp(3);
		delete(AnimMatchStart.fadeInProp);
		AnimMatchStart.fadeInProp = nil;
		delete(AnimMatchStart.fadeInAnim);
		AnimMatchStart.fadeInAnim = nil;
	end
end

AnimMatchStart.onFinishFadeIn = function()
	AnimMatchStart.stopFadeIn();
	AnimMatchStart.startFadeOut();
end

AnimMatchStart.startFadeOut = function()
	AnimMatchStart.fadeOutAnim = AnimFactory.createAnimDouble(kAnimNormal, 1.0, 0.0, 500,0);
	AnimMatchStart.fadeOutAnim:setDebugName("AnimDouble|AnimMatchStart.fadeOutAnim");
	AnimMatchStart.fadeOutAnim:setEvent(AnimMatchStart, AnimMatchStart.onFinishFadeOut);
	AnimMatchStart.fadeOutProp = new(PropTransparency,AnimMatchStart.fadeOutAnim);
	AnimMatchStart.bgImg:addProp(AnimMatchStart.fadeOutProp, 4);
end

AnimMatchStart.stopFadeOut = function()
	if AnimMatchStart.fadeOutAnim then
		AnimMatchStart.bgImg:removeProp(4);
		delete(AnimMatchStart.fadeOutProp);
		AnimMatchStart.fadeOutProp = nil;
		delete(AnimMatchStart.fadeOutAnim);
		AnimMatchStart.fadeOutAnim = nil;
	end
end

AnimMatchStart.onFinishFadeOut = function()
	AnimMatchStart.stopFadeOut();
	AnimMatchStart.bgImg:setVisible(false);
	AnimMatchStart.stop();
end



AnimMatchStart.release = function()
	AnimMatchStart.stop();
end

return AnimMatchStart;