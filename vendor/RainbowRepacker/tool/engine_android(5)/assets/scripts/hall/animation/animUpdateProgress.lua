require("animation/animBase");
require("particle/particleBubble");
local loading_pin_map = require("qnFiles/qnPlist/hall/loading_pin");

AnimUpdateProgress = class(AnimBase);

AnimUpdateProgress.lightImageIndex = 0;

AnimUpdateProgress.lightFiles = {
  loading_pin_map["light1.png"],
  loading_pin_map["light2.png"],
}
local stencilMask = require("libEffect/shaders/stencilMask");

AnimUpdateProgress.load = function()
    if not AnimUpdateProgress.root then
        AnimUpdateProgress.root = new(Node);
        local progressBg = new(Image, loading_pin_map["loadingBg.png"]);
        AnimUpdateProgress.root:addChild(progressBg);
        AnimUpdateProgress.root:setSize( progressBg:getSize() );
        AnimUpdateProgress.root:addToRoot();
        AnimUpdateProgress.root:setAlign(kAlignCenter);

        AnimUpdateProgress.progressMask = new(Image, loading_pin_map["loadingProgress.png"])
        AnimUpdateProgress.progress = new(Image, loading_pin_map["loadingProgress.png"])
        stencilMask.applyToDrawing(AnimUpdateProgress.root,AnimUpdateProgress.progress, AnimUpdateProgress.progressMask, 0.1);

        AnimUpdateProgress.lightImages = new(Images, AnimUpdateProgress.lightFiles);
        AnimUpdateProgress.progress:addChild(AnimUpdateProgress.lightImages);
        AnimUpdateProgress.lightImages:setAlign(kAlignRight);
        AnimUpdateProgress.lightImages:setPos(nil, -5);
    end
end

AnimUpdateProgress.play = function(progress)
    progress = progress or 0
    AnimUpdateProgress.load();
    if not AnimUpdateProgress.lightAnim then
        AnimUpdateProgress.startLightAnim();
    end

    AnimUpdateProgress.__updateProgress(progress);
    return AnimUpdateProgress.root;
end

AnimUpdateProgress.__updateProgress = function(progress)
    local w, h = AnimUpdateProgress.root:getSize();
    local offset = -w + w*progress+45;
    if offset > 0 then
        offset = 0;
    end

    AnimUpdateProgress.progress:setPos(offset);
end

AnimUpdateProgress.startLightAnim = function()
    AnimUpdateProgress.stopLightAnim();

    AnimUpdateProgress.lightAnim = new(AnimInt, kAnimRepeat, 0, 1, 200, -1);
    AnimUpdateProgress.lightAnim:setDebugName("AnimUpdateProgress.lightAnim");
    AnimUpdateProgress.lightAnim:setEvent(nil, AnimUpdateProgress.onLightAnimTimer);
end

AnimUpdateProgress.onLightAnimTimer = function()
    AnimUpdateProgress.lightImageIndex = (AnimUpdateProgress.lightImageIndex+1)% (#AnimUpdateProgress.lightFiles);
    AnimUpdateProgress.lightImages:setImageIndex(AnimUpdateProgress.lightImageIndex);
end

AnimUpdateProgress.stopLightAnim = function()
    delete(AnimUpdateProgress.lightAnim);
    AnimUpdateProgress.lightAnim = nil;
end

AnimUpdateProgress.stop = function()
    AnimUpdateProgress.stopLightAnim();
end

AnimUpdateProgress.release = function()
    AnimUpdateProgress.stop();
    if AnimUpdateProgress.root then
        local parent = AnimUpdateProgress.root:getParent();
        if parent then
            parent:removeChild(AnimUpdateProgress.root);
        end
        stencilMask.removeStencilEffect(AnimUpdateProgress.root, true)
        delete(AnimUpdateProgress.root);
        AnimUpdateProgress.root = nil;
    end
end
