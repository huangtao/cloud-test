--升级动画


AnimLevelUp2 = class(AnimBase);


AnimLevelUp2.play = function(parent)
	
	if not parent then 
		return;
	end
	
	AnimLevelUp2.stop();
	AnimLevelUp2.load(parent);
	
	AnimLevelUp2.particleNode:resume();
	AnimLevelUp2.startWhiteLight();
	
	AnimLevelUp2.imgWhiteLight:setVisible(true);
	AnimLevelUp2.nodeLevelTip:setVisible(false);
	-- AnimLevelUp2.imgLevelTipBg:setVisible(true);
	AnimLevelUp2.root:setPos(0,-15);
	AnimLevelUp2.root:setVisible(true);
	kEffectPlayer:play(Effects.AudioLevelUp);
	return AnimLevelUp2.root;
end

AnimLevelUp2.load = function(parent)
	if AnimLevelUp2.root then
		return;
	end
	
	AnimLevelUp2.root = UIFactory.createNode();
	local screenWidth = System.getScreenScaleWidth();
	local screenHeight = System.getScreenScaleHeight();
	AnimLevelUp2.root:setSize(screenWidth, screenHeight);
	
	--椭圆缩小动画图片
	AnimLevelUp2.imgWhiteLight = UIFactory.createImage("games/common/animation/level_up/whitelight.png");
	AnimLevelUp2.imgWhiteLight:setSize(300 , 100);
	AnimLevelUp2.imgWhiteLight:setPos(screenWidth/2-AnimLevelUp2.imgWhiteLight.m_width/2, screenHeight/2-AnimLevelUp2.imgWhiteLight.m_height/2);
	AnimLevelUp2.root:addChild(AnimLevelUp2.imgWhiteLight);
	AnimLevelUp2.nodeLevelTip = UIFactory.createNode();
	AnimLevelUp2.nodeLevelTip:setSize(screenWidth, screenHeight);
	AnimLevelUp2.nodeLevelTip:setVisible(false);
	AnimLevelUp2.root:addChild(AnimLevelUp2.nodeLevelTip);
	--粒子效果
	local parWidth, parHeight = 300,100;
	AnimLevelUp2.particleNode = ParticleSystem.getInstance():create("games/common/animation/level_up/particle.png",ParticleFireWork,0,0,{{0}},kParticleTypeBlast,200,{["h"] = parHeight,["w"] = parWidth;});
	AnimLevelUp2.particleNode:setVisible(true);
	AnimLevelUp2.root:addChild(AnimLevelUp2.particleNode);
	AnimLevelUp2.particleNode:setPos(screenWidth/2, screenHeight/2-parHeight/2+50);
	--辐射背景动画图片
	local files = {}
	for i=1, 2 do
		files[i] = string.format("games/common/animation/level_up/radial0%d.png",i);
	end
	AnimLevelUp2.imgRadialBg = UIFactory.createImages(files);
	local tw,th=AnimLevelUp2.imgRadialBg:getSize();
	AnimLevelUp2.imgRadialBg:setPos(screenWidth/2-AnimLevelUp2.imgRadialBg.m_width/2, screenHeight/2-AnimLevelUp2.imgRadialBg.m_height/2);
	AnimLevelUp2.nodeLevelTip:addChild(AnimLevelUp2.imgRadialBg);
	
	--数字提示渐显动画图片
	--容器-级别提升、经验+xxx
	AnimLevelUp2.imgLevelTip = UIFactory.createNode();
	AnimLevelUp2.nodeLevelTip:addChild(AnimLevelUp2.imgLevelTip);
	--级别提升
	AnimLevelUp2.imgLevelText = UIFactory.createImage("games/common/animation/level_up/gongxi2.png");
	AnimLevelUp2.imgLevelText:setSize(679 , 86);

	AnimLevelUp2.imgLevelTip:addChild(AnimLevelUp2.imgLevelText);
	local width, height = AnimLevelUp2.imgLevelText:getSize();
	AnimLevelUp2.imgLevelTip:setSize(width, height);

	AnimLevelUp2.imgLevelTip:setPos(screenWidth/2-AnimLevelUp2.imgLevelTip.m_width/2, screenHeight/2-AnimLevelUp2.imgLevelTip.m_height/2);

	AnimLevelUp2.imgStars = {};
	for i=1, 8 do
		local star = UIFactory.createImage("games/common/animation/level_up/star.png");
		star:setSize(60 , 60);
		star:setPos(screenWidth/2-star.m_width/2,screenHeight/2-star.m_height/2);
		star:setVisible(false);
		AnimLevelUp2.nodeLevelTip:addChild(star);
		AnimLevelUp2.imgStars[i] = star;
	end
	AnimLevelUp2.starWidth,AnimLevelUp2.starHeight = AnimLevelUp2.imgStars[1]:getSize();
	AnimLevelUp2.root:addToRoot();
	AnimLevelUp2.root:setLevel(10000);
	AnimLevelUp2.root:addPropScaleSolid(13, 1.5, 1.5, kCenterDrawing);
	AnimLevelUp2.imgLevelTip:addPropScaleSolid(13, 0.8, 0.8, kCenterDrawing);
	AnimLevelUp2.root:setVisible(false);
end

AnimLevelUp2.startWhiteLight = function()
	AnimLevelUp2.animWhiteLightX = AnimFactory.createAnimDouble(kAnimNormal,5,1.3,300,-1);
	AnimLevelUp2.animWhiteLightY = AnimFactory.createAnimDouble(kAnimNormal,2.5,0.7,300,-1);
	AnimLevelUp2.animWhiteLightX:setDebugName("AnimDouble|AnimLevelUp2.animWhiteLightX");
	AnimLevelUp2.animWhiteLightY:setDebugName("AnimDouble|AnimLevelUp2.animWhiteLightY");
	AnimLevelUp2.propWhiteLight = new(PropScale, AnimLevelUp2.animWhiteLightX,AnimLevelUp2.animWhiteLightY,kCenterDrawing);
	AnimLevelUp2.imgWhiteLight:addProp(AnimLevelUp2.propWhiteLight, 1);
	AnimLevelUp2.animWhiteLightX:setEvent(AnimLevelUp2, AnimLevelUp2.onWhiteLightFinish);
end

AnimLevelUp2.stopWhiteLight = function()
	if AnimLevelUp2.animWhiteLightX then
		AnimLevelUp2.imgWhiteLight:removeProp(1);
		delete(AnimLevelUp2.propWhiteLight);
		AnimLevelUp2.propWhiteLight=nil;		
		delete(AnimLevelUp2.animWhiteLightX);
		AnimLevelUp2.animWhiteLightX=nil;
		delete(AnimLevelUp2.animWhiteLightY);
		AnimLevelUp2.animWhiteLightY=nil;
	end
end

AnimLevelUp2.onWhiteLightFinish = function()
	AnimLevelUp2.stopWhiteLight();
	AnimLevelUp2.imgWhiteLight:setVisible(false);
	AnimLevelUp2.nodeLevelTip:setVisible(true);
	
	AnimLevelUp2.startRotate();
	AnimLevelUp2.startScale();
end

AnimLevelUp2.startRotate = function()
	AnimLevelUp2.rotateAnim = AnimFactory.createAnimInt(kAnimRepeat,0,1,600,-1);
	AnimLevelUp2.rotateAnim:setDebugName("AnimInt|AnimLevelUp2.rotateAnim");
	AnimLevelUp2.rotateProp = new(PropImageIndex,AnimLevelUp2.rotateAnim);
	AnimLevelUp2.imgRadialBg:addProp(AnimLevelUp2.rotateProp,2);
end

AnimLevelUp2.stopRotate = function()
	if AnimLevelUp2.rotateAnim then
		AnimLevelUp2.imgRadialBg:removeProp(2);
		delete(AnimLevelUp2.rotateProp);
		AnimLevelUp2.rotateProp=nil;
		delete(AnimLevelUp2.rotateAnim);
		AnimLevelUp2.rotateAnim=nil;
	end
end

AnimLevelUp2.startScale = function()
	AnimLevelUp2.animScale = AnimFactory.createAnimDouble(kAnimNormal,0.3,1.2,100,-1);
	AnimLevelUp2.animScale:setDebugName("AnimDouble|AnimLevelUp2.animScale");
	AnimLevelUp2.propScale = new(PropScale, AnimLevelUp2.animScale,AnimLevelUp2.animScale,kCenterDrawing);
	AnimLevelUp2.nodeLevelTip:addProp(AnimLevelUp2.propScale, 3);
	AnimLevelUp2.animScale:setEvent(AnimLevelUp2, AnimLevelUp2.onScaleFinish);
end

AnimLevelUp2.stopScale = function()
	if AnimLevelUp2.animScale then
		AnimLevelUp2.nodeLevelTip:removeProp(3);
		delete(AnimLevelUp2.propScale);
		AnimLevelUp2.propScale=nil;
		delete(AnimLevelUp2.animScale);
		AnimLevelUp2.animScale=nil;
	end
end

AnimLevelUp2.onScaleFinish = function()
	AnimLevelUp2.stopScale();
	AnimLevelUp2.startScale2();
end

AnimLevelUp2.startScale2 = function()
	AnimLevelUp2.animScale2 = AnimFactory.createAnimDouble(kAnimLoop,1,0.83,100,-1);
	AnimLevelUp2.animScale2:setDebugName("AnimDouble|AnimLevelUp2.animScale2");
	AnimLevelUp2.propScale2 = new(PropScale, AnimLevelUp2.animScale2,AnimLevelUp2.animScale2,kCenterDrawing);
	AnimLevelUp2.nodeLevelTip:addProp(AnimLevelUp2.propScale2, 4);
	AnimLevelUp2.animScale2:setEvent(AnimLevelUp2, AnimLevelUp2.onScale2Finish);
	AnimLevelUp2.animScale2Count=0;
end

AnimLevelUp2.stopScale2 = function()
	if AnimLevelUp2.animScale2 then
		AnimLevelUp2.nodeLevelTip:removeProp(4);
		delete(AnimLevelUp2.propScale2);
		AnimLevelUp2.propScale2 = nil;
		delete(AnimLevelUp2.animScale2);
		AnimLevelUp2.animScale2 = nil;
	end
end

AnimLevelUp2.onScale2Finish = function()
	AnimLevelUp2.animScale2Count = AnimLevelUp2.animScale2Count+1;
	if AnimLevelUp2.animScale2Count>=2 then
		AnimLevelUp2.stopScale2();
		AnimLevelUp2.startTrans();
		AnimLevelUp2.startStarAnim();
	end
end

AnimLevelUp2.startTrans = function()
	AnimLevelUp2.animTrans = AnimFactory.createAnimDouble(kAnimNormal,1,0,400,-1);
	AnimLevelUp2.animTrans:setDebugName("AnimDouble|AnimLevelUp2.animTrans");
	AnimLevelUp2.propTrans = new(PropTransparency, AnimLevelUp2.animTrans);
	-- AnimLevelUp2.imgLevelTipBg:addProp(AnimLevelUp2.propTrans, 5);
	AnimLevelUp2.animTrans:setEvent(AnimLevelUp2, AnimLevelUp2.onTransFinish);
end

AnimLevelUp2.stopTrans = function()
	if AnimLevelUp2.animTrans then
		-- AnimLevelUp2.imgLevelTipBg:setVisible(false);
		-- AnimLevelUp2.imgLevelTipBg:removeProp(5);
		delete(AnimLevelUp2.propTrans);
		AnimLevelUp2.propTrans = nil;
		delete(AnimLevelUp2.animTrans);
		AnimLevelUp2.animTrans = nil;
	end
end

AnimLevelUp2.onTransFinish = function()
	AnimLevelUp2.stopTrans();
end

AnimLevelUp2.startStarAnim = function()
	if not AnimLevelUp2.imgStars then return;end
	AnimLevelUp2.animStarRotate = AnimFactory.createAnimDouble( kAnimRepeat, 0, 360, 10000);
	AnimLevelUp2.animStarRotate:setDebugName("AnimDouble|AnimLevelUp2.animStarRotate");
	AnimLevelUp2.propStarRotate = new(PropRotate,AnimLevelUp2.animStarRotate,kCenterDrawing);
	AnimLevelUp2.animStarMoveX = {};
	AnimLevelUp2.animStarMoveY = {};
	AnimLevelUp2.propStarMove = {};
	AnimLevelUp2.animStarScale = {};
	AnimLevelUp2.propStarScale = {};
	for i = 1, #AnimLevelUp2.imgStars do
		local x = math.random(400)-200;
		local star = AnimLevelUp2.imgStars[i];
		star:setVisible(true);
		local y = math.random(400)-200;
		local scale = (math.abs(x)+math.abs(y))/200;
		if scale>1.5 then scale=1.5;end
		AnimLevelUp2.animStarMoveX[i] = AnimFactory.createAnimDouble( kAnimNormal, 0, x*System.getLayoutScale(), 500,-1);
		AnimLevelUp2.animStarMoveX[i]:setDebugName("AnimDouble|AnimLevelUp2.AnimLevelUp2.animStarMoveX[i]");
		AnimLevelUp2.animStarMoveY[i] = AnimFactory.createAnimDouble( kAnimNormal, 0, y*System.getLayoutScale(), 500,-1);
		AnimLevelUp2.animStarMoveY[i]:setDebugName("AnimDouble|AnimLevelUp2.AnimLevelUp2.animStarMoveY[i]");
		AnimLevelUp2.propStarMove[i] = new(PropTranslate,AnimLevelUp2.animStarMoveX[i],AnimLevelUp2.animStarMoveY[i]);
		star:addProp(AnimLevelUp2.propStarMove[i], 6);
		AnimLevelUp2.animStarScale[i] = AnimFactory.createAnimDouble( kAnimNormal, 0, scale, 500,-1);
		AnimLevelUp2.animStarScale[i]:setDebugName("AnimDouble|AnimLevelUp2.AnimLevelUp2.animStarScale[i]");
		AnimLevelUp2.propStarScale[i] = new(PropScale, AnimLevelUp2.animStarScale[i],AnimLevelUp2.animStarScale[i],kNotCenter);
		star:addProp(AnimLevelUp2.propStarScale[i], 7);
		star:addProp(AnimLevelUp2.propStarRotate, 8);
	end
	AnimLevelUp2.animStarMoveY[#AnimLevelUp2.imgStars]:setEvent(AnimLevelUp2, AnimLevelUp2.onStarMoveFinish);
end

AnimLevelUp2.stopStarAnim = function()
	if not AnimLevelUp2.imgStars then return;end
	for i = 1, #AnimLevelUp2.imgStars do
		local star = AnimLevelUp2.imgStars[i];
		star:setVisible(false);
		if AnimLevelUp2.propStarMove and AnimLevelUp2.propStarMove[i] then
			star:removeProp(6);
			delete(AnimLevelUp2.propStarMove[i]); 
			AnimLevelUp2.propStarMove[i] = nil;
			delete(AnimLevelUp2.animStarMoveX[i]);
			AnimLevelUp2.animStarMoveX[i] = nil;
			delete(AnimLevelUp2.animStarMoveY[i]);
			AnimLevelUp2.animStarMoveY[i] = nil;
		end
		if AnimLevelUp2.animStarScale and AnimLevelUp2.animStarScale[i] then			
			star:removeProp(7);
			delete(AnimLevelUp2.propStarScale[i]);
			AnimLevelUp2.propStarScale[i] = nil;
			delete(AnimLevelUp2.animStarScale[i]);
			AnimLevelUp2.animStarScale[i] = nil;
		end
		if AnimLevelUp2.animStarRotate then
			star:removeProp(8);
		end
		if AnimLevelUp2.animStarFadeOut then
			star:removeProp(9);
		end
	end
	AnimLevelUp2.propStarMove = nil;
	AnimLevelUp2.animStarScale = nil;
	AnimLevelUp2.animStarRotate = nil;
	if AnimLevelUp2.animStarRotate then
		delete(AnimLevelUp2.propStarRotate);
		AnimLevelUp2.propStarRotate = nil;
		delete(AnimLevelUp2.animStarRotate);
		AnimLevelUp2.animStarRotate = nil;
	end
	if AnimLevelUp2.animStarFadeOut then
		delete(AnimLevelUp2.propStarFadeOut);
		AnimLevelUp2.propStarFadeOut = nil;
		delete(AnimLevelUp2.animStarFadeOut);
		AnimLevelUp2.animStarFadeOut = nil;
	end
end

AnimLevelUp2.onStarMoveFinish = function()
	AnimLevelUp2.startStarFadeOut();
	AnimLevelUp2.onStarMoveFinished = true;
end

AnimLevelUp2.startStarFadeOut = function()
	if not AnimLevelUp2.imgStars then return;end
	AnimLevelUp2.animStarFadeOut = AnimFactory.createAnimDouble( kAnimNormal, 1, 0, 1200);
	AnimLevelUp2.animStarFadeOut:setDebugName("AnimDouble|AnimLevelUp2.animStarFadeOut");
	AnimLevelUp2.animStarFadeOut:setEvent(AnimLevelUp2, AnimLevelUp2.onStarFadeOut);
	AnimLevelUp2.propStarFadeOut = new(PropTransparency,AnimLevelUp2.animStarFadeOut);
	for i = 1, #AnimLevelUp2.imgStars do
		local star = AnimLevelUp2.imgStars[i];
		star:addProp(AnimLevelUp2.propStarFadeOut, 9);
	end
end

AnimLevelUp2.startDelay = function()
	AnimLevelUp2.animDelay = AnimFactory.createAnimDouble( kAnimNormal, 1, 0, 1800);
	AnimLevelUp2.animDelay:setDebugName("AnimDouble|AnimLevelUp2.animStarFadeOut");
	AnimLevelUp2.animDelay:setEvent(AnimLevelUp2, AnimLevelUp2.onDelayFinish);
end

AnimLevelUp2.stopDelay = function()
	if AnimLevelUp2.animDelay then
		delete(AnimLevelUp2.animDelay);
		AnimLevelUp2.animDelay=nil;
	end
end

AnimLevelUp2.onDelayFinish = function()
	AnimLevelUp2.release();
end

AnimLevelUp2.onStarFadeOut = function()
	AnimLevelUp2.stopStarAnim();
	AnimLevelUp2.startDelay();
end

AnimLevelUp2.stop = function()
	if not AnimLevelUp2.root then
		return;
	end
	AnimLevelUp2.stopWhiteLight();
	AnimLevelUp2.stopRotate();
	AnimLevelUp2.stopScale();
	AnimLevelUp2.stopScale2();
	AnimLevelUp2.stopTrans();
	AnimLevelUp2.stopStarAnim();
	AnimLevelUp2.stopDelay();
	
	local parent = AnimLevelUp2.root:getParent();
	if parent then 
		AnimLevelUp2.root:removeProp(13);
		parent:removeChild(AnimLevelUp2.root);
	end
	delete(AnimLevelUp2.root);
	AnimLevelUp2.root=nil;
end

AnimLevelUp2.release = function()
	AnimLevelUp2.stop();
end
