local UiAnimBase = require("hall/animation/uiAnimation/uiAnimBase");

local UiAnimMove = class(UiAnimBase);

local default = {
    sequence = 999,
    duration = 250,
}

UiAnimMove.executeAnim = function(self, action, layer, callback_end, duration, sequence)
    duration = duration or default.duration;
    sequence = sequence or default.sequence;

    self:removeProp(layer, sequence);
    
    local s_x, e_x, s_y, e_y = self:__getMoveParams(layer, action);
    local anim = layer:addPropTranslate(sequence, kAnimNormal, duration, 0, s_x, e_x, s_y, e_y, kCenterDrawing);
    anim:setEvent(nil, function()
            if callback_end then
                callback_end();
            end
        end);
end

UiAnimMove.__getMoveParams = function(self, layer, action)
    local w, h = layer:getSize();

    if self.m_animTag == UiAnimConfig.ANIM.MOVE_LEFT_TO_RIGHT then
        if action == UiAnimConfig.ACTION.BEGIN then
            return -w, 0, 0, 0;
        else
            return 0, -w, 0, 0;
        end
    elseif self.m_animTag == UiAnimConfig.ANIM.MOVE_RIGHT_TO_LEFT then
        if action == UiAnimConfig.ACTION.BEGIN then
            return w, 0, 0, 0;
        else
            return 0, w, 0, 0;
        end                   
    end
end

return UiAnimMove;