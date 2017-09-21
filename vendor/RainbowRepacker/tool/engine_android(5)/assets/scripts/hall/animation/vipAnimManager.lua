
require("hall/animation/vipGetAnimPop");

VipAnimManager = class();

VipAnimManager.delayTime = 1000;
VipAnimManager.s_timer = {};

VipAnimManager.getInstance = function()
    if not VipAnimManager.instance then
        VipAnimManager.instance = new(VipAnimManager);
    end
    return VipAnimManager.instance;
end

VipAnimManager.releaseInstance = function()
    if VipAnimManager.instance then
        delete(VipAnimManager.instance)
        VipAnimManager.instance = nil;
    end
end

VipAnimManager.ctor = function(self)
    self.m_isNeedPlay = false;
    self.m_isPauseAnim = false;
end 

VipAnimManager.dtor = function(self)
   self:__deleteTimer();
end

VipAnimManager.setIsNeedPlay = function (self,isNeedPlay)
    self.m_isNeedPlay = isNeedPlay;
end

VipAnimManager.playVipAnim = function (self)
    if not self.m_isNeedPlay then
        return;
    else
        if self.m_isPauseAnim then 
            self:__delayTimer();
        else
            local m_vipPop = new(VipGetAnimPop);
	        m_vipPop:play();
            self:setIsNeedPlay(false);
        end
    end
end

VipAnimManager.__deleteTimer = function (self)
    delete(self.m_timer);
    self.m_timer = nil;
end

VipAnimManager.__delayTimer = function (self)
    self:__deleteTimer();
    self.m_timer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, VipAnimManager.delayTime, 0);
    self.m_timer:setDebugName("VipAnimManager|self.m_timer");
    self.m_timer:setEvent(VipAnimManager.s_timer, function ()
        if not self.m_isPauseAnim then
            self:__deleteTimer();    
        end    
    end);
end

VipAnimManager.setPauseAnim = function (self, pauseAnim)
    self.m_isPauseAnim = pauseAnim;
end



