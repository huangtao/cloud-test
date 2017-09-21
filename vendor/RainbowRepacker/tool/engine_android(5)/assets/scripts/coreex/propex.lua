--[[
    将 prop对应的anim引用起来，防止因为垃圾回收导致anim回调不回去
]]

require("core/prop");

local PropBaseCtor = PropBase.ctor;
PropBase.ctor = function(self)
    PropBaseCtor(self);

    self.m_anims = {};
end

local PropBaseDtor = PropBase.dtor
PropBase.dtor = function(self)
    for k, v in pairs(self.m_anims) do
        delete(v);
    end

    self.m_anims = {};

    PropBaseDtor(self);
end

local PropTranslateCtor = PropTranslate.ctor;
PropTranslate.ctor = function(self, animX, animY)
    self.m_anims = {animX, animY};
    PropTranslateCtor(self, animX, animY);
end

local PropRotateCtor = PropRotate.ctor;
PropRotate.ctor = function(self, anim, center, x, y)
    self.m_anims = {anim};
    PropRotateCtor(self, anim, center, x, y);
end

local PropScaleCtor = PropScale.ctor;
PropScale.ctor = function(self, animX, animY, center, x, y)
    self.m_anims = {animX, animY};
    PropScaleCtor(self, animX, animY, center, x, y);
end

local PropColorCtor = PropColor.ctor;
PropColor.ctor = function(self, animR, animG, animB)
    self.m_anims = {animR, animG, animB};
    PropColorCtor(self, animR, animG, animB);
end

local PropTransparencyCtor = PropTransparency.ctor;
PropTransparency.ctor = function(self, anim)
    self.m_anims = {anim};
    PropTransparencyCtor(self, anim);
end

local PropClipCtor = PropClip.ctor;
PropClip.ctor = function(self, animX, animY, animW, animH)
    self.m_anims = {animX, animY, animW, animH};
    PropClipCtor(self, animX, animY, animW, animH);
end

local PropImageIndexCtor = PropImageIndex.ctor;
PropImageIndex.ctor = function(self, anim)
    self.m_anims = {anim};
    PropImageIndexCtor(self, anim);
end


