-- 滑动层
-- show -> pushDialogStack(压栈) -> showBegin(滑入) -> showEnd(滑入结束)
-- hide ->  popDialogStack(出栈) -> hideBegin(滑出) -> hideEnd(滑出结束)
local CommonSliderLayer = class(CommonGameLayer);

CommonSliderLayer.ctor = function(self, viewConfig, isDelayLoad)
    self:setFillParent(true, true);
    self:setEventTouch(self, self.onBgTouch);
    self:setEventDrag(self, function() end);
    self:setVisible(false);
end

CommonSliderLayer.dtor = function(self)
    if self:getVisible() then
        self:hide();
    end
end

-- 展示接口
CommonSliderLayer.show = function(self, data)
    self:pushDialogStack();
    self:showBegin();
    CommonGameLayer.show(self);
end

-- 滑入
CommonSliderLayer.showBegin = function(self)
    self:_slideIn();
end

-- 滑入结束
CommonSliderLayer.showEnd = function(self)
end

-- 隐藏接口
CommonSliderLayer.hide = function(self)
    self:popDialogStack();
end

-- 滑出
CommonSliderLayer.hideBegin = function(self)
    self:_slideOut();
end

-- 滑出结束
CommonSliderLayer.hideEnd = function(self)
    CommonGameLayer.hide(self)
end

-- 设置滑动对象
CommonSliderLayer.setSlideContent = function(self, drawing)
    self.m_slideContent = drawing;
end

-- 压栈
CommonSliderLayer.pushDialogStack = function(self)
    DialogLogic.getInstance():pushDialogStack(self,self.hideBegin);
end

-- 出栈
CommonSliderLayer.popDialogStack = function(self)
    DialogLogic.getInstance():popDialog();
end
--------------------------------------------------------------------------------------------------
-- 背景点击划出
CommonSliderLayer.onBgTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
    if finger_action == kFingerUp then
        self:hide();
    end
end

-- 滑入动画
CommonSliderLayer._slideIn = function(self)
    if not self.m_slideContent then
        self:showEnd();
        return;
    end

    local drawing = self.m_slideContent;
    local w = drawing:getSize();
    local animation = require("animation");

    local func = function(value)
        drawing:setPos(value.x)
    end

    local action = animation.prop("x", -w, 0, 0.25);
    self.m_animator = animation.Animator(action, func, kAnimNormal);

    self.m_animator.on_stop = function(p_self)
        self:showEnd();
    end
    self.m_animator:start();
end

-- 滑出动画
CommonSliderLayer._slideOut = function(self)
    if not self.m_slideContent then
        self:hideEnd();
        return;
    end
    
    local drawing = self.m_slideContent;
    local x = drawing:getPos();

    if self.m_animator then
        self.m_animator:stop();
    end

    local w = drawing:getSize();
    local animation = require("animation");

    local func = function(value)
        drawing:setPos(value.x)
    end
    
    local action = animation.prop("x", x, -w, 0.25);
    self.m_animator = animation.Animator(action, func, kAnimNormal);

    self.m_animator.on_stop = function(p_self)
        -- 滑出结束
        self:hideEnd();
    end
    self.m_animator:start();
end

return CommonSliderLayer;