--[[
    hallLayerBase 只提供一些公共接口， 不与任何管理类进行关联
]]

require("common/commonGameLayer");
require("hall/animation/uiAnimation/uiAnimationManager");

local HallLayerBase = class(CommonGameLayer);


HallLayerBase.ctor = function(self, viewConfig, isDelayLoad)
    --获取图片别名表句柄
    self.IMAGE = require("qnFiles/qn_res_alias_map");

    self:setTouchTransfer(false);
    self:setDragTransfer(false);
end

HallLayerBase.dtor = function(self)
    delete(self.mmm_action);
    self.mmm_action = nil;

    if self.blurBg then
        self.blurBg:cleanup();
    end
end

--设置是否点击事件穿透
HallLayerBase.setTouchTransfer = function(self, canTransfer)
    local __call = nil;
    if not canTransfer then
        __call = function() end;
    end 
    self:setEventTouch(self, __call);
end

--设置是否滚动时间穿透
HallLayerBase.setDragTransfer = function(self, canTransfer)
    local __call = nil;
    if not canTransfer then
        __call = function() end;
    end 
    self:setEventDrag(self, __call);
end

--使当前背景模糊
HallLayerBase.getBgBlur = function(self,intensity)
    self:setVisible(false);
    intensity = intensity or 10;
    local blurWidget = require("libEffect/shaders/blurWidget");
    self.blurBg = blurWidget.createBlurWidget(nil, {intensity = 10,onRoot = true});
    self.blurBg.zorder = -1;
    self:getWidget():add(self.blurBg, self:getWidget())
    self:setVisible(true);
end

--每个界面都有不同的控件配置，每次在初始化的时候都是手动，取到句柄。
--故在基类添加一个取控件句柄的方法，提高代码的复用性和规范性。
HallLayerBase.getComponent = function(self)
    local _controls = table.verify(self.s_controls);
    local _configs = table.verify(self.s_controlConfig);

    for k,v in pairs(_controls) do
        local _component = self:findViewById(v);
        if not _component then
            error("HallLayerBase don't find this component");
        end 
        self["mm_"..k] = _component;
    end
end

--@brief 执行ui动作
HallLayerBase.runUiAction = function(self, action, layer, uiAnimTag)
    if not self.mmm_action then
        uiAnimTag = uiAnimTag or UiAnimConfig.ANIM.MOVE_RIGHT_TO_LEFT;
        self.mmm_actionLayer = layer or self;
        self.mmm_actionLayer:setEventTouch(nil, function() end);
        self.mmm_action = UiAnimationManager.getInstance():getUiAnimation(uiAnimTag);
    end

    local cb_before = (action == UiAnimConfig.ACTION.BEGIN) and self.onUiBeginActionBefore or self.onUiEndActionBefore;
    local cb_end = function()
        local response = (action == UiAnimConfig.ACTION.BEGIN) and self.onUiBeginActionFinish or self.onUiEndActionFinish;
        response(self);
    end 
    
    cb_before(self);
    self.mmm_action:executeAnim(action, self.mmm_actionLayer, cb_end);
end

HallLayerBase.hasUiAnimation = function(self)
    return self.mmm_action and true or false;
end

--@brief 在ui开始动作执行之前回调
HallLayerBase.onUiBeginActionBefore = function(self)
end

--@override Ui开始动作执行完毕回调
HallLayerBase.onUiBeginActionFinish = function(self)
end

--@brief 当ui结束动作开始执行之前
HallLayerBase.onUiEndActionBefore = function(self)
end

--@brief ui结束动作开始执行完毕回调
HallLayerBase.onUiEndActionFinish = function(self)
end

return HallLayerBase;