local UiAnimBase = require("hall/animation/uiAnimation/uiAnimBase");

local UiAnimScale = class(UiAnimBase);

local PARAMS = {

    [UiAnimConfig.ANIM.POPUP] = {
        sequence = 999,
        duration = 100,
        startX = 0,
        endX = 1,
        startY = 0,
        endY = 1, 
    },

    [UiAnimConfig.ANIM.BUTTON_CLICK] = {
        sequence = 999,
        duration = 100,
        startX = 1,
        endX = 0.9,
        startY = 1,
        endY = 0.9, 
    },
}

UiAnimScale.executeAnim = function(self, action, layer, callback_end, duration, sequence)
    local default = PARAMS[self.m_animTag];

    duration = duration or default.duration;
    sequence = sequence or default.sequence;

    self:removeProp(layer, sequence);
    
    local anim;
    if action == UiAnimConfig.ACTION.BEGIN then
        anim = layer:addPropScale(sequence, kAnimNormal, duration, 0, default.startX, default.endX, default.startY, default.endY, kCenterDrawing);
    else
        anim = layer:addPropScale(sequence, kAnimNormal, duration, 0, default.endX, default.startX, default.endY, default.startY, kCenterDrawing);
    end
    anim:setEvent(nil, function()
            if callback_end then
                callback_end();
            end
        end);
end

return UiAnimScale;