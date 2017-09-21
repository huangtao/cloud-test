local UiAnimBase = class();

UiAnimBase.ctor = function(self, animTag)
    self.m_animTag = animTag;
end

UiAnimBase.executeAnim = function(self, action, layer, callback_end,...)
    error("subclass must override this function !");
end

UiAnimBase.removeProp = function(self, layer, sequence)
    if not layer:checkAddProp(sequence) then
        layer:removeProp(sequence);
    end
end

return UiAnimBase;