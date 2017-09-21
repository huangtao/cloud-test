
local AnimMatchFusai = class(AnimBase);

AnimMatchFusai.filesCount = 11;
AnimMatchFusai.files = {};
for i = 1, AnimMatchFusai.filesCount do
	AnimMatchFusai.files[i] = string.format("games/common/match/anim/fusai/fusai_%d.png", i);
end

AnimMatchFusai.load = function()
	if not AnimMatchFusai.root then
		AnimMatchFusai.root = new(Node);
        AnimMatchFusai.root:setFillParent(true, true);
        local sw, sh = AnimMatchFusai.root:getSize();
		AnimMatchFusai.root:addToRoot();

		
		AnimMatchFusai.bgImg = UIFactory.createImage("games/common/match/anim/anim_bg.png");
		AnimMatchFusai.root:addChild(AnimMatchFusai.bgImg);
		AnimMatchFusai.bgImg:setAlign(kAlignCenter);
		AnimMatchFusai.bgImg:setVisible(false);

		AnimMatchFusai.imgs = UIFactory.createImages(AnimMatchFusai.files);
    	AnimMatchFusai.imgs:setPos(0, 0);
		AnimMatchFusai.imgs:setAlign(kAlignCenter);
		local w,h = AnimMatchFusai.imgs:getSize();
		AnimMatchFusai.imgs:setVisible(false);
		AnimMatchFusai.root:addChild(AnimMatchFusai.imgs);
	end
	
end

AnimMatchFusai.play = function()
	AnimMatchFusai.stop(); 
	AnimMatchFusai.load();
	AnimMatchFusai.startFadeIn();
	AnimMatchFusai.startFrame();
	AnimMatchFusai.bgImg:setVisible(true);
	AnimMatchFusai.imgs:setVisible(true);
	
	return AnimMatchFusai.root;
end

AnimMatchFusai.stop = function()
	AnimMatchFusai.stopFrame();

	delete(AnimMatchFusai.root);
	AnimMatchFusai.root = nil;
end

AnimMatchFusai.startFrame = function()
	AnimMatchFusai.animFrame = AnimMatchFusai.imgs:addPropImageIndex(2, kAnimNormal, 1200, -1, 0,  AnimMatchFusai.filesCount-1); 
	if AnimMatchFusai.animFrame then
		AnimMatchFusai.animFrame:setEvent(nil, AnimMatchFusai.onFinishFrame);
	end
end

AnimMatchFusai.stopFrame = function()
	if AnimMatchFusai.animFrame then
		AnimMatchFusai.imgs:removeProp(2);
		AnimMatchFusai.animFrame = nil;
	end
end

AnimMatchFusai.onFinishFrame = function()
    AnimMatchFusai.imgs:setVisible(false);

end


AnimMatchFusai.startFadeIn = function()
	AnimMatchFusai.fadeInAnim = AnimFactory.createAnimDouble(kAnimNormal, 0.0, 1.0, 700,0);
	AnimMatchFusai.fadeInAnim:setDebugName("AnimDouble|AnimMatchFusai.fadeInAnim");
	AnimMatchFusai.fadeInAnim:setEvent(AnimMatchFusai, AnimMatchFusai.onFinishFadeIn);
	AnimMatchFusai.fadeInProp = new(PropTransparency,AnimMatchFusai.fadeInAnim);
	AnimMatchFusai.bgImg:addProp(AnimMatchFusai.fadeInProp, 3);
end

AnimMatchFusai.stopFadeIn = function()
	if AnimMatchFusai.fadeInAnim then
		AnimMatchFusai.bgImg:removeProp(3);
		delete(AnimMatchFusai.fadeInProp);
		AnimMatchFusai.fadeInProp = nil;
		delete(AnimMatchFusai.fadeInAnim);
		AnimMatchFusai.fadeInAnim = nil;
	end
end

AnimMatchFusai.onFinishFadeIn = function()
	AnimMatchFusai.stopFadeIn();
	AnimMatchFusai.startFadeOut();
end

AnimMatchFusai.startFadeOut = function()
	AnimMatchFusai.fadeOutAnim = AnimFactory.createAnimDouble(kAnimNormal, 1.0, 0.0, 500,0);
	AnimMatchFusai.fadeOutAnim:setDebugName("AnimDouble|AnimMatchFusai.fadeOutAnim");
	AnimMatchFusai.fadeOutAnim:setEvent(AnimMatchFusai, AnimMatchFusai.onFinishFadeOut);
	AnimMatchFusai.fadeOutProp = new(PropTransparency,AnimMatchFusai.fadeOutAnim);
	AnimMatchFusai.bgImg:addProp(AnimMatchFusai.fadeOutProp, 4);
end

AnimMatchFusai.stopFadeOut = function()
	if AnimMatchFusai.fadeOutAnim then
		AnimMatchFusai.bgImg:removeProp(4);
		delete(AnimMatchFusai.fadeOutProp);
		AnimMatchFusai.fadeOutProp = nil;
		delete(AnimMatchFusai.fadeOutAnim);
		AnimMatchFusai.fadeOutAnim = nil;
	end
end

AnimMatchFusai.onFinishFadeOut = function()
	AnimMatchFusai.stopFadeOut();
	AnimMatchFusai.bgImg:setVisible(false);
    AnimMatchFusai.stop();	
end



AnimMatchFusai.release = function()
	AnimMatchFusai.stop();
end

return AnimMatchFusai;