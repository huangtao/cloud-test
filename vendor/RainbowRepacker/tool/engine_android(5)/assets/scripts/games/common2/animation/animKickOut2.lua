

----------------参考坐标
AnimKickOut2 = class(AnimBase);

AnimKickOut2.s_defaultBoyFile = UserBaseInfoIsolater.getInstance():getMaleHead();
AnimKickOut2.s_defaultGirlFile = UserBaseInfoIsolater.getInstance():getFemaleHead();

AnimKickOut2.reset = function()
    AnimKickOut2.oritation = {};
    AnimKickOut2.root = {};
    AnimKickOut2.shoe = {};
    AnimKickOut2.icon = {};
    AnimKickOut2.star = {};
    AnimKickOut2.shade = {};
    AnimKickOut2.frame = {};
    AnimKickOut2.shoe2 = {};
    AnimKickOut2.center = {};
    AnimKickOut2.obj = {};
    AnimKickOut2.func = {};
    
    AnimKickOut2.animRotateUp = {};
    AnimKickOut2.animRotateDown = {};
    AnimKickOut2.resRotateDownX = {};
    AnimKickOut2.animRotateDownX = {};
    AnimKickOut2.propRotateDown = {};
    AnimKickOut2.resShakeX = {};
    AnimKickOut2.animShake = {};
    AnimKickOut2.animShakeX = {};
    AnimKickOut2.resShakeY = {};
    AnimKickOut2.animShakeY = {};
    AnimKickOut2.propShake = {};
    AnimKickOut2.animRotateOut = {};
    AnimKickOut2.animScaleOut = {};
    AnimKickOut2.animMoveOut = {};
    AnimKickOut2.animFrame = {};
    AnimKickOut2.animStar = {};
    AnimKickOut2.animScaleStar = {};
    AnimKickOut2.animRotateStar = {};
    AnimKickOut2.animStarCount = {};
    AnimKickOut2.animShade = {};
    AnimKickOut2.animRotateOver = {};
    AnimKickOut2.animDelay = {};
    AnimKickOut2.animRotateLoopCount = {};
    AnimKickOut2.animRotateLoop = {};
    AnimKickOut2.animShakeCount = {};
end

AnimKickOut2.reset();

AnimKickOut2.play = function(parent, seat, url, sex, w, h, x, y, align, obj, func, playerNum)
    if not parent then 
        return;
    end

    local num = 4;
    if playerNum then 
        num = playerNum;
    end

	if (seat < 1 or seat > num) then
		return ;
	end

	AnimKickOut2.stop(seat, true);
	AnimKickOut2.load(parent, seat, url, sex, w, h,x,y,align);
    AnimKickOut2.oritation[seat] = seat==2 and -1 or 1;
    AnimKickOut2.obj[seat] = obj;
    AnimKickOut2.func[seat] = func;

	AnimKickOut2.startRotateUp(seat);

   -- kEffectPlayer:play(Effects.AudioAnimKickOut);
	return AnimKickOut2.root[seat];
end

AnimKickOut2.createHeadImage = function (imagePath, parent , w, h, seat)
   
    if AnimKickOut2.icon[seat] then
		AnimKickOut2.icon[seat]:getParent():removeChild(AnimKickOut2.icon[seat], true);
	end
    AnimKickOut2.icon[seat] = new(Mask,imagePath,"games/common/head/head_base/ddz_head_mask.png");
	parent:addChild(AnimKickOut2.icon[seat]);
    AnimKickOut2.icon[seat]:setSize(w or 92, h or 92);
    return AnimKickOut2.icon[seat];
end


AnimKickOut2.load = function(parent, seat, url, sex, w, h, x, y,align)
    Log.v("----------AnimKickOut2.load---------",url);
	if AnimKickOut2.root[seat] then return;end
	AnimKickOut2.root[seat] = UIFactory.createNode();
    AnimKickOut2.root[seat]:setSize(w or 96, h or 96);
	AnimKickOut2.root[seat]:setPos(x or 12, y or 11);
    --AnimKickOut2.root[seat]:setPos(100 or 12, 100 or 11);
    AnimKickOut2.root[seat]:setAlign(align);
     --AnimKickOut2.root[seat]:setColor(0,0,0);
	parent:addChild(AnimKickOut2.root[seat]);
	
	local defaultIcon = UserBaseInfoIsolater.getInstance():getHeadBySex(sex);
    AnimKickOut2.icon[seat] = AnimKickOut2.createHeadImage(string.checkEmpty(url) or defaultIcon, AnimKickOut2.root[seat], w, h, seat);
	local iconW, iconH = AnimKickOut2.icon[seat]:getSize();

    --鞋子1
     if seat == 2 then
        AnimKickOut2.shoe[seat] = UIFactory.createImage("games/common/animation/kick_user/right_shoe1.png");
     else
         AnimKickOut2.shoe[seat] = UIFactory.createImage("games/common/animation/kick_user/left_shoe1.png");
    end
    --AnimKickOut2.shoe[seat]:setMirror(seat==2, false);
    --如果头像在右边就将图片翻转180度

    local w, h = AnimKickOut2.shoe[seat]:getSize();
    AnimKickOut2.shoe[seat]:setAlign(seat==2 and kAlignLeft or kAlignRight);
    AnimKickOut2.shoe[seat]:setPos(-w-60, 0);
    AnimKickOut2.center[seat] = seat==2 and w-30 or -30;

    --鞋子2
    if  seat == 2 then
        AnimKickOut2.shoe2[seat] = UIFactory.createImage("games/common/animation/kick_user/right_shoe2.png");
    else
        AnimKickOut2.shoe2[seat] = UIFactory.createImage("games/common/animation/kick_user/left_shoe2.png");
    end
    --AnimKickOut2.shoe2[seat]:setMirror(seat==2, false);
    AnimKickOut2.shoe2[seat]:setAlign(seat==2 and kAlignLeft or kAlignRight);
    AnimKickOut2.shoe2[seat]:setPos(30-w, -40);
    AnimKickOut2.shoe2[seat]:setVisible(false);
    AnimKickOut2.root[seat]:addChild(AnimKickOut2.shoe2[seat]);

    --阴影
    if  seat == 2 then
        AnimKickOut2.shade[seat] = UIFactory.createImage("games/common/animation/kick_user/right_shade.png");
    else
	   AnimKickOut2.shade[seat] = UIFactory.createImage("games/common/animation/kick_user/left_shade.png");
	end
    --AnimKickOut2.shade[seat]:setMirror(seat==2, false);
    AnimKickOut2.shade[seat]:setAlign(seat==2 and kAlignLeft or kAlignRight);
	AnimKickOut2.shade[seat]:setPos(-70-w, 30);
    w, h = AnimKickOut2.shade[seat]:getSize();
    AnimKickOut2.shade[seat]:setSize(w*2, h*2);
	AnimKickOut2.shade[seat]:setVisible(false);
	AnimKickOut2.root[seat]:addChild(AnimKickOut2.shade[seat]);

    AnimKickOut2.root[seat]:addChild(AnimKickOut2.shoe[seat]);

    --花
    if  seat == 2 then
        AnimKickOut2.frame[seat] = UIFactory.createImages({"games/common/animation/kick_user/right_crack01.png";"games/common/animation/kick_user/right_crack02.png";"games/common/animation/kick_user/right_crack03.png";});
    else
	   AnimKickOut2.frame[seat] = UIFactory.createImages({"games/common/animation/kick_user/left_crack01.png";"games/common/animation/kick_user/left_crack02.png";"games/common/animation/kick_user/left_crack03.png";});
	end
    w, h = AnimKickOut2.frame[seat]:getSize();
	AnimKickOut2.frame[seat]:setSize(w*2, h*2);
	--AnimKickOut2.frame[seat]:setMirror(seat==2, false);
	AnimKickOut2.frame[seat]:setAlign(seat==2 and kAlignLeft or kAlignRight);
	AnimKickOut2.frame[seat]:setPos(0, -20);
	AnimKickOut2.frame[seat]:setVisible(false);
	AnimKickOut2.icon[seat]:addChild(AnimKickOut2.frame[seat]);

    --最后的星星
	AnimKickOut2.star[seat] = UIFactory.createImage("games/common/animation/kick_user/star.png");
	w, h = AnimKickOut2.star[seat]:getSize();
	AnimKickOut2.star[seat]:setSize(w*2, h*2);
	AnimKickOut2.star[seat]:setPos(-40, -40);
    AnimKickOut2.star[seat]:setAlign(seat==2 and kAlignTopRight or kAlignTopLeft);
	AnimKickOut2.star[seat]:setVisible(false);
	AnimKickOut2.root[seat]:addChild(AnimKickOut2.star[seat]);

    
end

AnimKickOut2.stop = function(seat, doSetNil)
	if AnimKickOut2.root[seat] then
		AnimKickOut2.stopStar(seat);
		AnimKickOut2.stopFrame(seat);
		AnimKickOut2.stopRotateOut(seat);
		AnimKickOut2.stopShake(seat);
		AnimKickOut2.stopRotateDown(seat);
		AnimKickOut2.stopRotateUp(seat);
        AnimKickOut2.stopShade(seat);
        AnimKickOut2.stopRotateOver(seat);
        AnimKickOut2.stopDelay(seat);
        AnimKickOut2.stopRotateLoop(seat);
        AnimKickOut2.stopRotateOver(seat);
		local parent = AnimKickOut2.root[seat]:getParent();
		if parent then
			parent:removeChild(AnimKickOut2.root[seat]);
		end
		delete(AnimKickOut2.root[seat]);
        if doSetNil then
		    AnimKickOut2.root[seat] = nil;
        end
	end
end

AnimKickOut2.release = function()
    --kEffectPlayer:stop(Effects.AudioAnimKickOut);
	for k, v in pairs(AnimKickOut2.root) do
		AnimKickOut2.stop(k);
	end
    AnimKickOut2.reset();
end

--鞋子向下旋转
AnimKickOut2.startRotateUp = function(seat)
	AnimKickOut2.animRotateUp[seat] = AnimKickOut2.shoe[seat]:addPropRotate(1, kAnimNormal, 200, -1, 0, -15*AnimKickOut2.oritation[seat], kCenterXY, AnimKickOut2.center[seat], -20);
	AnimKickOut2.animRotateUp[seat]:setDebugName("AnimKickOut2.animRotateUp" .. seat);
	AnimKickOut2.animRotateUp[seat]:setEvent(seat, AnimKickOut2.onFinishRotateUp);
end

AnimKickOut2.stopRotateUp = function(seat)
	if AnimKickOut2.animRotateUp[seat] then
		AnimKickOut2.shoe[seat]:removeProp(1);
		AnimKickOut2.animRotateUp[seat] = nil;
	end
end

--鞋子旋转完成之后
AnimKickOut2.onFinishRotateUp = function(seat)
	AnimKickOut2.startRotateDown(seat);
    AnimKickOut2.startShade(seat); --阴影
	AnimKickOut2.shade[seat]:setVisible(true);
	AnimKickOut2.startFrame(seat);
	AnimKickOut2.frame[seat]:setVisible(true);
end

AnimKickOut2.startShade = function(seat)
    AnimKickOut2.animShade[seat] = AnimFactory.createAnimInt(kAnimNormal, 1, 0, 200, -1);
    AnimKickOut2.animShade[seat]:setDebugName("AnimKickOut2.animShade");
    AnimKickOut2.animShade[seat]:setEvent(seat, AnimKickOut2.onFinishShade);
end

AnimKickOut2.stopShade = function(seat)
    if AnimKickOut2.animShade[seat] then
        delete(AnimKickOut2.animShade[seat]);
        AnimKickOut2.animShade[seat] = nil;
    end
end

AnimKickOut2.onFinishShade = function(seat)
    AnimKickOut2.shade[seat]:setVisible(false);
    AnimKickOut2.stopShade(seat);
end

AnimKickOut2.startRotateDown = function(seat)
    AnimKickOut2.animRotateDown[seat] = AnimKickOut2.shoe[seat]:addPropRotate(3, kAnimNormal, 120, -1, 0, 55*AnimKickOut2.oritation[seat], kCenterXY, AnimKickOut2.center[seat], -30);
    AnimKickOut2.animRotateDown[seat]:setDebugName("AnimKickOut2.animRotateDown" .. seat);
    AnimKickOut2.animRotateDown[seat]:setEvent(seat, AnimKickOut2.onFinishRotateDown);
end

AnimKickOut2.stopRotateDown = function(seat)
    if AnimKickOut2.animRotateDown[seat] then
        AnimKickOut2.shoe[seat]:removeProp(3);
        AnimKickOut2.animRotateDown[seat] = nil;
    end
end

AnimKickOut2.onFinishRotateDown = function(seat)
    AnimKickOut2.startRotateLoop(seat);
    AnimKickOut2.startShake(seat);
end

AnimKickOut2.startRotateLoop = function(seat)
    AnimKickOut2.animRotateLoopCount[seat] = 0;
    AnimKickOut2.animRotateLoop[seat] = AnimKickOut2.shoe[seat]:addPropRotate(4, kAnimLoop, 60, -1, 3, -3, kCenterXY, AnimKickOut2.center[seat], -30);
    AnimKickOut2.animRotateLoop[seat]:setDebugName("AnimKickOut2.animRotateLoop" .. seat);
    AnimKickOut2.animRotateLoop[seat]:setEvent(seat, AnimKickOut2.onFinishRotateLoop);
end

AnimKickOut2.stopRotateLoop = function(seat)
    if AnimKickOut2.animRotateLoop[seat] then
        AnimKickOut2.shoe[seat]:removeProp(4);
        AnimKickOut2.animRotateLoop[seat] = nil;
    end
end

AnimKickOut2.onFinishRotateLoop= function(seat)
    AnimKickOut2.animRotateLoopCount[seat] = AnimKickOut2.animRotateLoopCount[seat] + 1;
    if AnimKickOut2.animRotateLoopCount[seat] >= 4 then
        AnimKickOut2.stopRotateLoop(seat);
    	AnimKickOut2.shade[seat]:setVisible(false);
        AnimKickOut2.shoe[seat]:setVisible(false);
    	AnimKickOut2.shoe2[seat]:setVisible(true);
        AnimKickOut2.startRotateOver(seat);
    end
end

AnimKickOut2.startShake = function(seat)
    AnimKickOut2.animShakeCount[seat] = 0;
    AnimKickOut2.animShake[seat] = AnimKickOut2.icon[seat]:addPropTranslate(3, kAnimLoop, 60, -1, 3, -3, 0, 0);
    if AnimKickOut2.animShake[seat] then
        AnimKickOut2.animShake[seat]:setDebugName("AnimKickOut2.animShake" .. seat);
        AnimKickOut2.animShake[seat]:setEvent(seat, AnimKickOut2.onFinishShake);
    end
end

AnimKickOut2.stopShake = function(seat)
    if AnimKickOut2.animShake[seat] then
        AnimKickOut2.icon[seat]:removeProp(3);
        AnimKickOut2.animShake[seat] = nil;
    end
end

AnimKickOut2.onFinishShake = function(seat)
    AnimKickOut2.animShakeCount[seat] = AnimKickOut2.animShakeCount[seat]+1;
    if AnimKickOut2.animShakeCount[seat]>=4 then
    	AnimKickOut2.stopShake(seat);
    	AnimKickOut2.stopRotateUp(seat);
    	AnimKickOut2.stopRotateDown(seat);
    	AnimKickOut2.startRotateOut(seat);
    end
end

AnimKickOut2.startRotateOut = function(seat)
    AnimKickOut2.animMoveOut[seat] = AnimKickOut2.icon[seat]:addPropTranslate(4, kAnimNormal, 300, -1, 0, -75*AnimKickOut2.oritation[seat], 0, -75);
    AnimKickOut2.animMoveOut[seat]:setDebugName("AnimKickOut2.animMoveOut" .. seat);
    AnimKickOut2.animScaleOut[seat] = AnimKickOut2.icon[seat]:addPropScale(5, kAnimNormal, 300, -1, 1, 0, 1, 0, kCenterDrawing);
    AnimKickOut2.animScaleOut[seat]:setDebugName("AnimKickOut2.animScaleOut" .. seat);
    AnimKickOut2.animRotateOut[seat] = AnimKickOut2.icon[seat]:addPropRotate(6, kAnimRepeat, 200, -1, 0, -360*AnimKickOut2.oritation[seat], kCenterDrawing);
    AnimKickOut2.animRotateOut[seat]:setDebugName("AnimKickOut2.animRotateOut" .. seat);
    AnimKickOut2.animScaleOut[seat]:setEvent(seat, AnimKickOut2.onFinishRotateOut);
end

AnimKickOut2.stopRotateOut = function(seat)
    if AnimKickOut2.animRotateOut[seat] then
        AnimKickOut2.icon[seat]:removeProp(4);
        AnimKickOut2.icon[seat]:removeProp(5);
        AnimKickOut2.icon[seat]:removeProp(6);
        AnimKickOut2.animRotateOut[seat] = nil;
    end
end

AnimKickOut2.onFinishRotateOut = function(seat)
    AnimKickOut2.stopRotateOut(seat);
    AnimKickOut2.icon[seat]:setVisible(false);
	AnimKickOut2.startStar(seat);
	AnimKickOut2.star[seat]:setVisible(true);
end

AnimKickOut2.startFrame = function(seat)
    AnimKickOut2.imageIndex = 0;
    --AnimKickOut2.animFrame[seat] = AnimKickOut2.frame[seat]:addPropImageIndex(1, kAnimNormal, 200, -1, 0, 2);
    AnimKickOut2.animFrame[seat] = AnimFactory.createAnimInt(kAnimRepeat,0, 1, 100, -1);
    AnimKickOut2.animFrame[seat]:setDebugName("AnimKickOut2.animFrame" .. seat);
    AnimKickOut2.animFrame[seat]:setEvent(seat, AnimKickOut2.onFinishFrame);
end

AnimKickOut2.stopFrame = function(seat)
    if AnimKickOut2.animFrame[seat] then
        --AnimKickOut2.frame[seat]:removeProp(1);
        delete(AnimKickOut2.animFrame[seat]);
        AnimKickOut2.animFrame[seat] = nil;
    end
end

AnimKickOut2.onFinishFrame = function(seat)
    if AnimKickOut2.imageIndex > 3 then
         AnimKickOut2.frame[seat]:setVisible(false);
        AnimKickOut2.stopFrame(seat);
    end
    AnimKickOut2.imageIndex = AnimKickOut2.imageIndex + 1; 
end

AnimKickOut2.startRotateOver = function(seat)
    local angel = 10;
    local w, h = AnimKickOut2.shoe2[seat]:getSize();
    if seat==2 then 
        w=0;
        angel = -angel;
    end
    AnimKickOut2.animRotateOver[seat] = AnimKickOut2.shoe2[seat]:addPropRotate(3, kAnimNormal, 500, 100, 0, angel, kCenterXY, w, h);
    AnimKickOut2.animRotateOver[seat]:setDebugName("AnimKickOut2.animRotateOver");
    AnimKickOut2.animRotateOver[seat]:setEvent(seat, AnimKickOut2.onFinishRotateOver);
end

AnimKickOut2.stopRotateOver = function(seat)
    if AnimKickOut2.animRotateOver[seat] then
        AnimKickOut2.shoe2[seat]:removeProp(3);
        AnimKickOut2.animRotateOver[seat] = nil;
    end
end

AnimKickOut2.onFinishRotateOver = function(seat)
    AnimKickOut2.shoe2[seat]:setVisible(false);
end

AnimKickOut2.startStar = function(seat)
	AnimKickOut2.animStarCount[seat] = 0;
    AnimKickOut2.animScaleStar[seat] = AnimKickOut2.star[seat]:addPropScale(5, kAnimLoop, 500, -1, 1, 2, 1, 2, kCenterDrawing);
    AnimKickOut2.animScaleStar[seat]:setDebugName("AnimKickOut2.animScaleStar" .. seat);
    AnimKickOut2.animRotateStar[seat] = AnimKickOut2.star[seat]:addPropRotate(6, kAnimRepeat, 1000, -1, 0, 360*AnimKickOut2.oritation[seat], kCenterDrawing);
    AnimKickOut2.animRotateStar[seat]:setDebugName("AnimKickOut2.animRotateStar" .. seat);
    AnimKickOut2.animRotateStar[seat]:setEvent(seat, AnimKickOut2.onFinishStar);
end

AnimKickOut2.stopStar = function(seat)
    if AnimKickOut2.animScaleStar[seat] then
        AnimKickOut2.star[seat]:removeProp(5);
        AnimKickOut2.star[seat]:removeProp(6);
        AnimKickOut2.animScaleStar[seat] = nil;
    end
end

AnimKickOut2.onFinishStar = function(seat)
	AnimKickOut2.animStarCount[seat] = AnimKickOut2.animStarCount[seat] + 1;
	if AnimKickOut2.animStarCount[seat] >= 1 then
        AnimKickOut2.stopStar(seat);
        AnimKickOut2.star[seat]:setVisible(false);
        AnimKickOut2.startDelay(seat);
	end
end

AnimKickOut2.startDelay = function(seat)
    AnimKickOut2.animDelay[seat] = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 1500, -1);
    AnimKickOut2.animDelay[seat]:setDebugName("AnimKickOut2.animDelay" .. seat);
    AnimKickOut2.animDelay[seat]:setEvent(seat, AnimKickOut2.onFinishDelay);
end

AnimKickOut2.stopDelay = function(seat)
    if AnimKickOut2.animDelay[seat] then
        delete(AnimKickOut2.animDelay[seat]);
        AnimKickOut2.animDelay[seat] = nil;
    end
end

AnimKickOut2.onFinishDelay = function(seat)
    AnimKickOut2.stop(seat, true);
    if AnimKickOut2.func[seat] then
        AnimKickOut2.func[seat](AnimKickOut2.obj[seat]);
    end
end
