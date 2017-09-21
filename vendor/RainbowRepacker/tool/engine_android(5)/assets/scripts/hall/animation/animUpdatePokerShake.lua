require("animation/animBase");
local loading_pin_map = require("qnFiles/qnPlist/hall/loading_pin");
AnimUpdatePokerShake = class(AnimBase);

AnimUpdatePokerShake.shakeCount = 0;
AnimUpdatePokerShake.shakeImgIndex = 0;

AnimUpdatePokerShake.imagesCount = 3;

AnimUpdatePokerShake.load = function()
    if not AnimUpdatePokerShake.root then
        AnimUpdatePokerShake.root = new(Node);
        local files = {loading_pin_map["poker.png"],
                        loading_pin_map["majiang.png"],
                        loading_pin_map["chess.png"]};
        AnimUpdatePokerShake.imagesCount = #files;
        AnimUpdatePokerShake.images = new(Images, files);
        AnimUpdatePokerShake.images:setAlign(kAlignTop);
        AnimUpdatePokerShake.root:setSize( AnimUpdatePokerShake.images:getSize() );
        AnimUpdatePokerShake.root:addChild(AnimUpdatePokerShake.images);
        AnimUpdatePokerShake.shadow = new(Image, loading_pin_map["shadow.png"]);
        AnimUpdatePokerShake.shadow:setAlign(kAlignBottom);
        AnimUpdatePokerShake.shadow:setPos(nil, -20);
        AnimUpdatePokerShake.root:addChild(AnimUpdatePokerShake.shadow);
        AnimUpdatePokerShake.root:addToRoot();
        AnimUpdatePokerShake.root:setAlign(kAlignCenter);
    end
end

AnimUpdatePokerShake.play = function()
    AnimUpdatePokerShake.load();
    AnimUpdatePokerShake.stop();

    AnimUpdatePokerShake.startPokerShakeAnim();
    AnimUpdatePokerShake.startPokerJumpAnim();
    AnimUpdatePokerShake.startShadowShakeAnim();
    return AnimUpdatePokerShake.root;
end

AnimUpdatePokerShake.startPokerShakeAnim = function()
    AnimUpdatePokerShake.stopPokerShakeAnim();

    local w, h = AnimUpdatePokerShake.images:getSize();
    AnimUpdatePokerShake.shakeCount = 0;
    AnimUpdatePokerShake.images:setImageIndex(0);
    _, AnimUpdatePokerShake.animShake = AnimUpdatePokerShake.images:addPropScale(0,kAnimLoop,300,-1,nil,nil,1,0.9,kCenterXY, w/2, h);
    if  AnimUpdatePokerShake.animShake then
        AnimUpdatePokerShake.animShake:setDebugName("AnimUpdatePokerShake.animShake");
        AnimUpdatePokerShake.animShake:setEvent(nil, AnimUpdatePokerShake.onPorkerShakeTimer);
    end
end

AnimUpdatePokerShake.onPorkerShakeTimer = function()
    AnimUpdatePokerShake.shakeCount = AnimUpdatePokerShake.shakeCount + 1;
    if AnimUpdatePokerShake.shakeCount%2 == 0 then
        AnimUpdatePokerShake.shakeImgIndex = (AnimUpdatePokerShake.shakeImgIndex+1)%AnimUpdatePokerShake.imagesCount;
        AnimUpdatePokerShake.images:setImageIndex(AnimUpdatePokerShake.shakeImgIndex);
    end
end

AnimUpdatePokerShake.stopPokerShakeAnim = function()
    if not AnimUpdatePokerShake.images:checkAddProp(0) then
        AnimUpdatePokerShake.images:removeProp(0);
    end
end

AnimUpdatePokerShake.startPokerJumpAnim = function()
    AnimUpdatePokerShake.stopPokerJumpAnim();
    local jumpAnim = AnimUpdatePokerShake.images:addPropTranslate(1,kAnimLoop,300,-1,nil,nil,0,15);
    if jumpAnim then
        jumpAnim:setDebugName("AnimUpdatePokerShake.startPokerJumpAnim");
    end
end

AnimUpdatePokerShake.stopPokerJumpAnim = function()
    if not AnimUpdatePokerShake.images:checkAddProp(1) then
        AnimUpdatePokerShake.images:removeProp(1);
    end
end

AnimUpdatePokerShake.startShadowShakeAnim = function()
    AnimUpdatePokerShake.stopShadowShakeAnim();

    local w, h = AnimUpdatePokerShake.shadow:getSize();
    AnimUpdatePokerShake.animShadowShake = AnimUpdatePokerShake.shadow:addPropScale(0,kAnimLoop,200,-1,1,0.7,nil,nil,kCenterDrawing);
    if AnimUpdatePokerShake.animShadowShake then
        AnimUpdatePokerShake.animShadowShake:setDebugName("AnimUpdatePokerShake.animShake");
    end
end

AnimUpdatePokerShake.stopShadowShakeAnim = function()
    if not AnimUpdatePokerShake.shadow:checkAddProp(0) then
        AnimUpdatePokerShake.shadow:removeProp(0);
    end
end

AnimUpdatePokerShake.stop = function()
    AnimUpdatePokerShake.stopPokerShakeAnim();
    AnimUpdatePokerShake.stopShadowShakeAnim();
end

AnimUpdatePokerShake.release = function()
    AnimUpdatePokerShake.stop();

    if AnimUpdatePokerShake.root then
        local parent = AnimUpdatePokerShake.root:getParent();
        if parent then
            parent:removeChild(AnimUpdatePokerShake.root);
        end
        delete(AnimUpdatePokerShake.root);
        AnimUpdatePokerShake.root = nil;
    end
end