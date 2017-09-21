
local AnimMatchJuesai = class(AnimBase);

AnimMatchJuesai.filesCount = 11;
AnimMatchJuesai.files = {};
for i = 1, AnimMatchJuesai.filesCount do
	AnimMatchJuesai.files[i] = string.format("games/common/match/anim/juesai/juesai_%d.png", i);
end

AnimMatchJuesai.load = function()
	if not AnimMatchJuesai.root then
		AnimMatchJuesai.root = new(Node);
        AnimMatchJuesai.root:setFillParent(true, true);
        local sw, sh = AnimMatchJuesai.root:getSize();
		AnimMatchJuesai.root:addToRoot();

		
		AnimMatchJuesai.bgImg = UIFactory.createImage("games/common/match/anim/anim_bg.png");
		AnimMatchJuesai.root:addChild(AnimMatchJuesai.bgImg);
		AnimMatchJuesai.bgImg:setAlign(kAlignCenter);
		AnimMatchJuesai.bgImg:setVisible(false);

		AnimMatchJuesai.imgs = UIFactory.createImages(AnimMatchJuesai.files);
    	AnimMatchJuesai.imgs:setPos(0, 0);
		AnimMatchJuesai.imgs:setAlign(kAlignCenter);
		local w,h = AnimMatchJuesai.imgs:getSize();
		AnimMatchJuesai.imgs:setVisible(false);
		AnimMatchJuesai.root:addChild(AnimMatchJuesai.imgs);
	end
	
end

AnimMatchJuesai.play = function()
	AnimMatchJuesai.stop(); 
	AnimMatchJuesai.load();
	AnimMatchJuesai.startFadeIn();
	AnimMatchJuesai.startFrame();
	AnimMatchJuesai.bgImg:setVisible(true);
	AnimMatchJuesai.imgs:setVisible(true);
	
	return AnimMatchJuesai.root;
end

AnimMatchJuesai.stop = function()
	AnimMatchJuesai.stopFrame();

	delete(AnimMatchJuesai.root);
	AnimMatchJuesai.root = nil;
end

AnimMatchJuesai.startFrame = function()
	AnimMatchJuesai.animFrame = AnimMatchJuesai.imgs:addPropImageIndex(2, kAnimNormal, 1500, -1, 0,  AnimMatchJuesai.filesCount-1); 
	if AnimMatchJuesai.animFrame then
		AnimMatchJuesai.animFrame:setEvent(nil, AnimMatchJuesai.onFinishFrame);
	end
end

AnimMatchJuesai.stopFrame = function()
	if AnimMatchJuesai.animFrame then
		AnimMatchJuesai.imgs:removeProp(2);
		AnimMatchJuesai.animFrame = nil;
	end
end

AnimMatchJuesai.onFinishFrame = function()
    AnimMatchJuesai.imgs:setVisible(false);

end


AnimMatchJuesai.startFadeIn = function()
	AnimMatchJuesai.fadeInAnim = AnimFactory.createAnimDouble(kAnimNormal, 0.0, 1.0, 1000,0);
	AnimMatchJuesai.fadeInAnim:setDebugName("AnimDouble|AnimMatchJuesai.fadeInAnim");
	AnimMatchJuesai.fadeInAnim:setEvent(AnimMatchJuesai, AnimMatchJuesai.onFinishFadeIn);
	AnimMatchJuesai.fadeInProp = new(PropTransparency,AnimMatchJuesai.fadeInAnim);
	AnimMatchJuesai.bgImg:addProp(AnimMatchJuesai.fadeInProp, 3);
end

AnimMatchJuesai.stopFadeIn = function()
	if AnimMatchJuesai.fadeInAnim then
		AnimMatchJuesai.bgImg:removeProp(3);
		delete(AnimMatchJuesai.fadeInProp);
		AnimMatchJuesai.fadeInProp = nil;
		delete(AnimMatchJuesai.fadeInAnim);
		AnimMatchJuesai.fadeInAnim = nil;
	end
end

AnimMatchJuesai.onFinishFadeIn = function()
	AnimMatchJuesai.stopFadeIn();
	AnimMatchJuesai.startFadeOut();
end

AnimMatchJuesai.startFadeOut = function()
	AnimMatchJuesai.fadeOutAnim = AnimFactory.createAnimDouble(kAnimNormal, 1.0, 0.0, 500,0);
	AnimMatchJuesai.fadeOutAnim:setDebugName("AnimDouble|AnimMatchJuesai.fadeOutAnim");
	AnimMatchJuesai.fadeOutAnim:setEvent(AnimMatchJuesai, AnimMatchJuesai.onFinishFadeOut);
	AnimMatchJuesai.fadeOutProp = new(PropTransparency,AnimMatchJuesai.fadeOutAnim);
	AnimMatchJuesai.bgImg:addProp(AnimMatchJuesai.fadeOutProp, 4);
end

AnimMatchJuesai.stopFadeOut = function()
	if AnimMatchJuesai.fadeOutAnim then
		AnimMatchJuesai.bgImg:removeProp(4);
		delete(AnimMatchJuesai.fadeOutProp);
		AnimMatchJuesai.fadeOutProp = nil;
		delete(AnimMatchJuesai.fadeOutAnim);
		AnimMatchJuesai.fadeOutAnim = nil;
	end
end

AnimMatchJuesai.onFinishFadeOut = function()
	AnimMatchJuesai.stopFadeOut();
	AnimMatchJuesai.bgImg:setVisible(false);
	AnimMatchJuesai.stop(); 
end


AnimMatchJuesai.release = function()
	AnimMatchJuesai.stop();
end

return AnimMatchJuesai;