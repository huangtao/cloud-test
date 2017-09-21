
UiAnimConfig = {};

UiAnimConfig.ACTION = {
    BEGIN = 1,
    END = 2,
}

UiAnimConfig.ANIM = {
    POPUP                   = 1,
    BUTTON_CLICK            = 2,
    MOVE_LEFT_TO_RIGHT      = 3,
    MOVE_RIGHT_TO_LEFT      = 4,
}

UiAnimConfig.ANIM_CONFIG = {
    [UiAnimConfig.ANIM.POPUP]               = "hall/animation/uiAnimation/uiAnimScale";
    [UiAnimConfig.ANIM.BUTTON_CLICK]        = "hall/animation/uiAnimation/uiAnimScale";
    [UiAnimConfig.ANIM.MOVE_LEFT_TO_RIGHT]  = "hall/animation/uiAnimation/uiAnimMove";
    [UiAnimConfig.ANIM.MOVE_RIGHT_TO_LEFT]  = "hall/animation/uiAnimation/uiAnimMove";
}
