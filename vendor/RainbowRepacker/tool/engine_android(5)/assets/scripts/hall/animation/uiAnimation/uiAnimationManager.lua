

require("hall/animation/uiAnimation/uiAnimConfig");

UiAnimationManager = class();

UiAnimationManager.getInstance = function()
    if not UiAnimationManager.s_instance then
        UiAnimationManager.s_instance = new(UiAnimationManager);
    end

    return UiAnimationManager;
end

UiAnimationManager.getUiAnimation = function(self, animTag)
    if not UiAnimConfig.ANIM_CONFIG[animTag] then
        error("didn't find this animTag in UiAnimConfig");
    end

    local animClass = require( UiAnimConfig.ANIM_CONFIG[animTag] );
    local animObj = new(animClass, animTag);

    return animObj;
end