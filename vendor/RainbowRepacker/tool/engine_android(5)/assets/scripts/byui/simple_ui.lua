local M = {}
require('byui/utils')
local class, mixin, super = unpack(require('byui/class'))
local anim = require('animation')
local units = require('byui/draw_res')
local AL = require('byui/autolayout')
local ui_utils = require('byui/ui_utils')
local Kinetic = require('byui/kinetic')

---
-- 基础控件.
-- @module byui.simple_ui
-- @extends byui#byui.simple_ui 
-- @return #table  

---
-- 带阴影圆角矩形.
-- @type byui.RoundedView
-- @extends engine#BorderSprite 

---
-- 创建一个带阴影圆角矩形的实例.
-- @callof #byui.RoundedView
-- @return #byui.RoundedView 返回创建的圆角矩形的实例.
-- @usage local s = RoundedView()
--    s.pos = Point(100,100)
--    s.size = Point(20,100)
--    s.radius = 5
--    s.need_box = false
--    s.need_shadow = true
--    s.shadow_colorf = Colorf(1.0,0.0,0.0,1.0)
--    s.shadow_offset = Point(5,5)
--    s.shadow_margin = 5

M.RoundedView = class('RoundedView', BorderSprite, {
    __init__ = function(self)
        super(M.RoundedView, self).__init__(self)
        self._colorf = Colorf.white
        self._radius = 0
        self._shadow_margin = 0
        self._shadow_offset = Point(0,0)
        self._need_shadow = false
        self._need_box = true
        self._colorf = Colorf.white
        self._shadow_colorf = Colorf.black
        self:_update_widget()
    end,
    _update_widget = function(self)
        if self._need_shadow and self._need_box then
            if self._extra_widget == nil then
                self._extra_widget = BorderSprite()
                self:add(self._extra_widget)
            end
        else
            if self._extra_widget ~= nil then
                self._extra_widget:remove_from_parent()
                self._extra_widget = nil
            end
        end
        if self._extra_widget then
            -- setup rules
            self._extra_widget.rules = {}
            self._extra_widget:add_rules{
                -- position
                AL.centerx:eq(AL.parent('width')/2-self._shadow_offset.x),
                AL.centery:eq(AL.parent('height')/2-self._shadow_offset.y),
                -- size
                AL.width:eq(AL.parent('width')-self._shadow_margin * 2),
                AL.height:eq(AL.parent('height')-self._shadow_margin * 2),
            }
            self._extra_widget:update_constraints()
        end
        if self._need_shadow and self._need_box then
            self.visible = true
            -- apply shadow attributes to self
            self.unit = units.shadow
            self.t_border = ui_utils.default_t_border(units.shadow)
            self.v_border = {self._radius, self._radius, self._radius, self._radius}
            super(M.RoundedView, self).self_colorf = self._shadow_colorf

            -- apply box attributes to extra_widget
            self._extra_widget.unit = units.circle
            self._extra_widget.t_border = ui_utils.default_t_border(units.circle)
            self._extra_widget.v_border = {self._radius, self._radius, self._radius, self._radius}
            self._extra_widget.self_colorf = self._colorf
        elseif self._need_box then
            self.visible = true
            -- apply box attribute to self
            self.unit = units.circle
            self.t_border = ui_utils.default_t_border(units.circle)
            self.v_border = {self._radius, self._radius, self._radius, self._radius}
            super(M.RoundedView, self).self_colorf = self._colorf
        elseif self._need_shadow then
            self.visible = true
            -- apply shadow attribute to self
            self.unit = units.shadow
            self.t_border = ui_utils.default_t_border(units.shadow)
            self.v_border = {self._radius, self._radius, self._radius, self._radius}
            super(M.RoundedView, self).self_colorf = self._shadow_colorf
        else
            self.visible = false
        end
    end,
    
    ---
    -- 自身的颜色.
    -- @field [parent=#byui.RoundedView] engine#Colorf self_colorf 
    self_colorf = {function(self)
        return self._colorf
    end, function(self, c)
        if self._colorf ~= c then
            self._colorf = c
            self:_update_widget()
        end
    end},
    
    ---
    -- 阴影的颜色.
    -- @field [parent=#byui.RoundedView] engine#Colorf shadow_colorf 
    shadow_colorf = {function(self)
        return self._shadow_colorf
    end, function(self, c)
        if self._shadow_colorf ~= c then
            self._shadow_colorf = c
            self:_update_widget()
        end
    end},
    
    ---
    -- 是否显示前景.
    -- 默认为true。如果设置为false则只会显示阴影。
    -- @field [parent=#byui.RoundedView] #boolean need_box
    need_box = {function(self)
        return self._need_box
    end, function(self, b)
        if self._need_box ~= b then
            self._need_box = b
            self:_update_widget()
        end
    end},
    
    ---
    -- 是否显示阴影.
    -- @field [parent=#byui.RoundedView] #boolean need_shadow
    need_shadow = {function(self)
        return self._need_shadow
    end, function(self, b)
        if self._need_shadow ~= b then
            self._need_shadow = b
            self:_update_widget()
        end
    end},
    
    ---
    -- 圆角矩形的圆角半径.
    -- @field [parent=#byui.RoundedView] #number radius  圆角的半径 
    radius = {function(self)
        return self._radius
    end, function(self, v)
        if self._radius ~= v then
            self._radius = v
            self:_update_widget()
        end
    end},
    
    ---
    -- 阴影的边距.
    -- 默认为0。设置后的效果是前景变小。
    -- @field [parent=#byui.RoundedView] #number shadow_margin 
    shadow_margin = {function(self)
        return self._shadow_margin
    end, function(self, f)
        if self._shadow_margin ~= f then
            self._shadow_margin = f
            self:_update_widget()
        end
    end},
    
    ---
    -- 阴影的偏移量.
    -- 前景会按偏移量向轴的负方向进行偏移。
    -- @field [parent=#byui.RoundedView] engine#Colorf shadow_offset 
    shadow_offset = {function(self)
        return self._shadow_offset
    end, function(self, f)
        if self._shadow_offset ~= f then
            self._shadow_offset = f
            self:_update_widget()
        end
    end},
})

---
-- 圆角矩形.
-- @field [parent=#global] #byui.RoundedView RoundedView 
RoundedView = M.RoundedView




---
-- 手指按下事件.
-- 子类必须重新此方法，否则不能正确的响应手指事件。
-- @function [parent=#byui.EventHandler] on_touch_down
-- @param #byui.EventHandler self 
-- @param engine#Point pos 手指按下的位置，为世界座标.
-- @param #number time 手指按下的时间.

---
-- 手指移动事件.
-- @function [parent=#byui.EventHandler] on_touch_move
-- @param #byui.EventHandler self 
-- @param engine#Point pos 手指移动到的位置，为世界座标.
-- @param #number time 此次事件的时间.

---
-- 手指松手事件.
-- @function [parent=#byui.EventHandler] on_touch_up
-- @param #byui.EventHandler self 
-- @param engine#Point pos 手指松手的位置，为世界座标.
-- @param #number time 此次事件的时间.

---
-- 手指事件被取消事件.
-- 可能被操作系统给取消比如电话等。也有可能由于父节点需要捕获事件从而导致收到取消事件。
-- @function [parent=#byui.EventHandler] on_touch_cancel
-- @param #byui.EventHandler self 
-- @param engine#Point pos 手指事件被取消时的位置，为世界座标.
-- @param #number time 此次事件的时间.



---
-- 事件处理基类.
-- 不能被实例化，你必须继承它，然后实现@{#byui.EventHandler.on_touch_down},@{#byui.EventHandler.on_touch_up},@{#byui.EventHandler.on_touch_move},@{#byui.EventHandler.on_touch_cancel}四个虚函数。
-- @type byui.EventHandler
-- @usage -- 默认手指事件的处理逻辑如下
-- handle_msg_chain = function(self, touch, canceled)
--    if canceled then
--        -- 优先判断canceled事件
--        self:on_touch_cancel()
--    else
--        -- 正常分发touch事件
--        if touch.action == kFingerDown then
--            self:on_touch_down(touch.pos, touch.time)
--        elseif touch.action == kFingerMove then
--            self:on_touch_move(touch.pos, touch.time)
--        elseif touch.action == kFingerUp then
--            self:on_touch_up(touch.pos, touch.time)
--        end
--    end
--
--    -- 分发给手势识别
--    for _, recog in ipairs(self._recognizers) do
--        if canceled then
--            recog:on_cancel()
--        else
--            recog:on_touch(touch)
--        end
--    end
--
--    -- 判断是否需要捕获事件
--    if not touch.locked_by and self.need_capture then
--        touch:lock(self.event_widget)
--    end
--end
M.EventHandler = {
    ---
    -- 事件处理基类构造函数.
    -- @param #byui.EventHandler self 
    -- @param #table args 构造参数.
    --          event_widget:响应事件的widget。默认自己。
    --          enabled:boolean类型。是否启用触摸事件。
    --          need_capture:boolean类型。是否需要捕获事件。
    __init__ = function(self, args)
        self:add_auto_cleanup('event_widget')
        self.event_widget = args.event_widget or self
        if self.event_widget:getId() < 0 then
            self.event_widget:initId()
        end
        if args.event_phase == nil then
            args.event_phase = 'bubbling'
        end
        self.event_widget:add_listener(function(_, ...)
            self:handle_msg_chain(...)
        end, args.event_phase == 'capturing')
        if args.enabled ~= nil then
            self.enabled = args.enabled
        else
            self.enabled = true
        end
        
        ---
        -- 是否需要捕获事件.
        -- 默认为false，既不捕获。如果开启如果没有被其父节点捕获则消息只会传递给此节点。
        -- @field [parent=#byui.EventHandler] #boolean need_capture 
        self.need_capture = args.need_capture or false

        self._recognizers = {}
    end,
    ---
    -- 手指事件分发.
    -- 提供默认的手指事件分发，你可以重写此方法来按你的规则来分发。其默认行为见@{#byui.EventHandler}。
    -- @param #byui.EventHandler self 
    -- @param engine#Touch touch 触摸事件对象
    -- @param #boolean canceled 是否为取消事件
    handle_msg_chain = function(self, touch, canceled)
        if self._enabled then
            if canceled then
                self:on_touch_cancel()
            else
                if touch.action == kFingerDown then
                    self:on_touch_down(touch.pos, touch.time)
                    if self.___type ~= "class(MenuItem)" then
                        M.share_menu_controller():set_menu_visible(false,false)
                    end
                elseif touch.action == kFingerMove then
                    self:on_touch_move(touch.pos, touch.time)
                elseif touch.action == kFingerUp then
                    self:on_touch_up(touch.pos, touch.time)
                end
            end

            for _, recog in ipairs(self._recognizers or {}) do
                if canceled then
                    recog:on_cancel()
                else
                    recog:on_touch(touch)
                end
            end
        end
        if not touch.locked_by and self.need_capture then
            touch:lock(self.event_widget)
        end
    end,
    ---
    -- 是否启用触摸事件.
    -- 默认为true,设为 false 将禁用所有事件响应。不会影响其子节点的事件响应。
    -- @field [parent=#byui.EventHandler] #boolean enabled 
    enabled = {function(self)
        return self._enabled
    end, function(self, value)
        if self._enabled ~= value then
            self._enabled = value
            if self.on_enable_changed then
                self:on_enable_changed()
            end
        end
    end},
    
    ---
    -- 添加一个手指手势.
    -- 你可以添加若干个自定义的手势，在符合手势后可以给你回调，处理相应的手势。
    -- @param #byui.EventHandler self 
    -- @param #table recog 手指事件识别的描述。
    add_recognizer = function(self, recog)
        table.insert(self._recognizers, recog)
    end,
    
    
    
    
    
    ---- default handlers
    --on_touch_down = function(self, p, t)
    --end,
    --on_touch_move = function(self, p, t)
    --end,
    --on_touch_up = function(self, p, t)
    --end,
    --on_touch_cancel = function(self)
    --end,
}

---
-- 添加一个简单的响应事件.
-- 你可以配合@{engine#Widget.set_pick_ext}订制你的触摸响应区域。
-- @function [parent=#byui] init_simple_event
-- @param engine#Widget widget 需要添加事件的widget对象。 
-- @param #function onclick  响应函数。
M.init_simple_event = function(widget, onclick)
    if widget:getId() < 0 then
        widget:initId()
    end
    if widget._simple_event_handler then
    	widget:remove_listener(widget._simple_event_handler)
    	widget._simple_event_handler = nil
    end
    widget._simple_event_handler = function(self, touch, canceled)
        if not touch.locked_by and self.need_capture then
            touch:lock(widget)
        end
        if not canceled and touch.action == kFingerUp then
            onclick(widget, touch)
        end
    end
    widget:add_listener(widget._simple_event_handler)
end

---
-- 移除widget的响应事件.
-- @function [parent=#byui] remove_simple_event
-- @param engine#Widget widget 需要移除响应事件的widget对象.
M.remove_simple_event = function(widget)
    widget:remove_listener(widget._simple_event_handler)
end

M.init_label_link = function(lbl, onclick)
    M.init_simple_event(lbl, function(self, touch)
        local p = lbl:from_world(touch.pos)
        local c = lbl:get_cursor_by_position(p)
        local seg = lbl:get_segment_by_cursor(c)
        if seg and seg.tag then
            onclick(lbl, seg.tag)
        end
    end)
end

---
-- 滚动手势识别.
-- @type byui.ScrollRecognizer

---
-- 创建手势识别的实例.
-- @callof #byui.ScrollRecognizer
-- @param #byui.ScrollRecognizer self 
-- @param #table args 
--      1.pos_dimension:滚动的方向。'x'或'y'
--      2.callback:符合手势后的回调函数。
-- @return #byui.ScrollRecognizer 返回创建的手势识别的实例.

M.ScrollRecognizer = class('ScrollRecognizer', nil, {
    __init__ = function(self, args)
        self.direction = args.direction
        self.callback = args.callback
        self.min_distance = args.min_distance or 10
        self.pos_dimension = args.pos_dimension or 'y'
        self._init = nil
        self._success = false
    end,
    
    ---
    -- 识别手势.
    -- @function [parent=#byui.ScrollRecognizer] on_touch
    -- @param #byui.ScrollRecognizer self 
    -- @param engine#Touch touch 触摸的touch对象
    on_touch = function(self, touch)
        if touch.action == kFingerDown then
            self._init = touch.pos[self.pos_dimension]
            self._success = false
        elseif not self._success then
            if math.abs(touch.pos[self.pos_dimension] - self._init) > self.min_distance then
                self._success = true
                self.callback(touch)
            end
        end
    end,
    ---
    -- 状态重置.
    -- @function [parent=#byui.ScrollRecognizer] on_cancel
    -- @param #byui.ScrollRecognizer self 
    on_cancel = function(self)
        self._init = nil
    end,
})


M.CommonRecognizer = class('CommonRecognizer', nil, {
    __init__ = function(self, args)
        self.direction = args.direction
        self.callback = args.callback
        self.recogize_func = args.recogize_func;
        self._init = nil
        self._success = false
        self.cancelCallBack = args.cancelCallBack
    end,
    on_touch = function(self, touch)
        self._touch = touch


        if touch.action == kFingerDown then
            self._init = touch.pos
            self._initTime = touch.time
            self._success = false
        elseif not self._success then
            self._success = self:recogize_func(touch)
            if self._success then
                self:callback(touch)
            end
        elseif self._success then
            if touch.action == kFingerUp then
                if self.cancelCallBack then
                    self:cancelCallBack()
                end
                self._success = false 
            else
                self:callback(touch)
            end
            
        end
    end,

    on_cancel = function(self)

        self._init = nil
        self._touch = nil

    end,
})


---
-- 按钮逻辑基类.
-- 不能被实例化，你必须继承它，里面描述了button的基本的行为。
-- @type byui.ButtonBehaviour
M.ButtonBehaviour = {
    ---
    -- 按钮逻辑基类构造函数.
    -- @param #byui.ButtonBehaviour self 
    -- @param #table args 构造参数。
    --      on_click:function类型。点击事件回调函数。
    --      on_state_changed:function类型。状态变化回调函数。
    __init__ = function(self, args)
    ---
    -- 点击的事件响应回调.
    -- 如果松手时还停在button的触摸区域内就会触发此回调.
    -- @field [parent=#byui.ButtonBehaviour] #function on_click 
        self.on_click = args.on_click
    ---
    -- button状态变化回调.
    -- 当button的状态发生变化时会触发此回调.
    -- @field [parent=#byui.ButtonBehaviour] #function on_state_changed 
        self.on_state_changed = args.on_state_changed
        self._focus = true
    end,
    ---
    -- 默认的手指按下事件处理.
    -- @param #byui.ButtonBehaviour self 
    -- @param engine#Point p 手指按下的位置。
    -- @param #number t 手指按下的时间。
    on_touch_down = function(self, p, t)
        if self.focus then
            M.share_keyboard_controller().keyboard_status = false
            ui_utils.set_focus(nil)
        end
        self.state = 'down'
    end,
    ---
    -- 默认的手指移动事件处理.
    -- @param #byui.ButtonBehaviour self 
    -- @param engine#Point p 手指移动的位置。
    -- @param #number t 手指移动的时间。
    on_touch_move = function(self, p, t)
        if self:point_in(p) then
            self.state = 'down'
        else
            self.state = 'normal'
        end
    end,
    ---
    -- 默认的手指松手事件处理.
    -- @param #byui.ButtonBehaviour self 
    -- @param engine#Point p 手指松手的位置。
    -- @param #number t 手指松手的时间。
    on_touch_up = function(self, p, t)
        self.state = 'normal'
        if self:point_in(p) and self.on_click then
            self:on_click(p, t)
        end
    end,
    ---
    -- 默认的手指取消事件处理.
    -- @param #byui.ButtonBehaviour self 
    on_touch_cancel = function(self)
        self.state = 'normal'
    end,
    ---
    -- button的状态。可取"normal","down"两种状态。
    -- @field [parent=#byui.ButtonBehaviour] #string state 
    state = {function(self)
        return self._state
    end, function(self, value)
        if self._state ~= value then
            self._state = value
            if self.on_state_changed then
                self:on_state_changed()
            end
        end
    end},
    ---
    -- 是否截获输入焦点.
    -- 默认为true.如果为false则响应事件时不会关闭键盘。
    -- @field [parent=#byui.ButtonBehaviour] #boolean focus 
    focus = {function ( self )
        return self._focus 
    end,function ( self ,v)
        self._focus = v
    end},
}


---
-- 选择框逻辑基类.
-- 不能被实例化，你必须继承它，里面描述了button的基本的行为。
-- @type byui.CheckboxBehaviour
M.CheckboxBehaviour = {
    ---
    -- 选择框逻辑基类构造函数.
    -- 其子类必须在其构造函数中去执行此方法用来完成其图片逻辑基类的构造工作。
    -- @param #byui.CheckboxBehaviour self 
    -- @param #table args 构造参数.
    --          on_change: function类型。状态改变回调。
    --          checked:boolean类型。初始选中状态。
    __init__ = function(self, args)
    ---
    -- 状态改变回调.
    -- 只要checked状态发生变化就会产生一次回调.
    -- @field [parent=#byui.CheckboxBehaviour] #function on_change 
        self.on_change = args.on_change
    
        self.checked = args.checked or false
    end,
    ---
    -- 默认的手指按下事件处理.
    -- @param #byui.CheckboxBehaviour self 
    -- @param engine#Point p 手指按下的位置。
    -- @param #number t 手指按下的时间。
    on_touch_down = function(self, p, t)
    end,
    ---
    -- 默认的手指移动事件处理.
    -- @param #byui.CheckboxBehaviour self 
    -- @param engine#Point p 手指移动的位置。
    -- @param #number t 手指移动的时间。
    on_touch_move = function(self, p, t)
    end,
    ---
    -- 默认的手指松手事件处理.
    -- @param #byui.CheckboxBehaviour self 
    -- @param engine#Point p 手指松手的位置。
    -- @param #number t 手指松手的时间。
    on_touch_up = function(self, p, t)
        if self:point_in(p) then
            self.checked = not self.checked
        end
    end,
    ---
    -- 默认的手指取消事件处理.
    -- @param #byui.CheckboxBehaviour self 
    on_touch_cancel = function(self)
    end,
    
    ---
    -- 选中状态.
    -- 默认为false.
    -- @field [parent=#byui.CheckboxBehaviour] #boolean checked 
    checked = {function(self)
        return self._checked
    end, function(self, value)
        if self._checked ~= value then
            self._checked = value
            self:_on_change()
        end
    end},

    _on_change = function(self)
        if self.on_change then
            self:on_change()
        end
    end,
    ---
    -- 选中状态的纹理.
    -- 可以是@{engine#TextureUnit}类型，@{engine#Colorf}，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} }
    -- @field [parent=#byui.CheckboxBehaviour] #obj checked_enabled 
    checked_enabled = {function ( self )
        return self.images['checked_enabled'].unit
    end,function ( self ,desc)
        local checked_enabled_image = M.Image(desc)
        self.images['checked_enabled'] = checked_enabled_image
        if self.image_state == 'checked_enabled' then
            checked_enabled_image:apply(self)
        end
    end},
    ---
    -- 未选中状态的纹理.
    -- 可以是@{engine#TextureUnit}类型，@{engine#Colorf}，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} }
    -- @field [parent=#byui.CheckboxBehaviour] #obj unchecked_enabled 
    unchecked_enabled = {function ( self )
        return self.images['unchecked_enabled'].unit
    end,function ( self ,desc)
        local unchecked_enabled_image = M.Image(desc)
        self.images['unchecked_enabled'] = unchecked_enabled_image
        if self.image_state == 'unchecked_enabled' then
            unchecked_enabled_image:apply(self)
        end
    end},
    
    ---
    -- 选中状态下禁用的纹理.
    -- 可以是@{engine#TextureUnit}类型，@{engine#Colorf}，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} }
    -- @field [parent=#byui.CheckboxBehaviour] #obj checked_disabled 
    checked_disabled = {function ( self )
        return self.images['checked_disabled'].unit
    end,function ( self ,desc)
        local checked_disabled_image = M.Image(desc)
        self.images['checked_disabled'] = checked_disabled_image
        if self.image_state == 'checked_disabled' then
            checked_disabled_image:apply(self)
        end
    end},
    
    ---
    -- 未选中状态下禁用的纹理.
    -- 可以是@{engine#TextureUnit}类型，@{engine#Colorf}，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} }
    -- @field [parent=#byui.CheckboxBehaviour] #obj unchecked_disabled 
    unchecked_disabled = {function ( self )
        return self.images['unchecked_disabled'].unit
    end,function ( self ,desc)
        local unchecked_disabled_image = M.Image(desc)
        self.images['unchecked_disabled'] = unchecked_disabled_image
        if self.image_state == 'unchecked_disabled' then
            unchecked_disabled_image:apply(self)
        end
    end},
}

-- property
--      text 
--      align (在初始未设置size时无效，即根据文本大小来确定size，默认为居中显示)
--      margin (仅在初始时未设置size时有效,并且会使得align变为center,在之后设置size后与size规则谁在后谁生效)


---
-- 文本逻辑行为基类.
-- 不能被实例化，你必须继承它，里面描述了文本的基本的行为。
-- @type byui.LabelBehaviour
M.LabelBehaviour = {
    ---
    -- 文本逻辑行为基类构造函数.
    -- 其子类必须在其构造函数中去执行此方法用来完成其图片逻辑基类的构造工作。
    -- @param #byui.LabelBehaviour self 
    -- @param #table args 构造输入的参数。
    --         size:Point类型。如果存在则固定大小，不能再被修改。
    --         margin:table类型。文本的边距，如果没有设定size，则大小依照文本大小来和margin来变化。
    --         on_size_changed:function类型。文本size变化的回调函数。 
    __init__ = function(self, args)
        
        -- sizing
        if args.size ~= nil then
            -- fixed sizing
            self.clip = true
            self.size_hint = args.size

            -- args for LabelBehaviour
            args.layout_size = args.size
            self._auto_size = false
        else
            -- auto-sizing
            self._auto_size = true
            if args.margin == nil then
                args.margin = {10,10,10,10}
            end

            self._margin = args.margin

            args.on_size_changed = function(_)
                if not self._auto_size then return end
                local s = self.label.size + Point(self.margin[1] + self.margin[3], self.margin[2] + self.margin[4])
                self.size_hint = s
                self:update_constraints()
            end
        end
        -- init text
        self.label = Label()
        self.label.multiline = args.multiline or false
        self.label.layout_size = args.layout_size or Point(0,0)
        self.align = args.align or ALIGN.CENTER
        self:add(self.label)

        if args.on_size_changed then
            self.label.on_size_changed = function(self)
                args.on_size_changed()
            end
        end

        self.text = args.text
    end,
    
    ---
    -- 显示的富文本内容.
    -- 可以为符合[富文本标签](http://engine.by.com:8000/doc/#id30)的string类型，也可以为符合[富文本table](http://engine.by.com:8000/doc/#table)的table类型。<br/>
    -- ![](http://engine.by.com:8080/hosting/data/1465197840810_1837834193760096555.gif)
    -- @field [parent=#byui.LabelBehaviour] #string text 
    text = {function(self)
        return self._text
    end, function(self, txt)
        if self._text ~= txt then
            if type(txt) == "string" then
                self._text = txt
                self.label:set_rich_text(txt)
            elseif type(txt) == "table" then
                self._text = txt
                self.label:set_data(txt)               
            end
        end
    end},
    ---
    -- 对齐方式.
    -- **不是指文本内容的对齐方式，而是相对与父节点的位置的对齐方式**.
    -- @field [parent=#byui.LabelBehaviour] byui.utils#ALIGN align 
    align = {function ( self )
        return self._align or ALIGN.CENTER
    end,function ( self,v )
        self._align = v 
        self.label.absolute_align = self.align
        -- self.label:clear_rules()
        -- self.label:add_rules(AL.rules.align(self.align))
        -- self.label:update_constraints()
    end},
    ---
    -- 文本内容的四周的留白.
    -- 仅在初始为设置size的时候有效。格式为 {left, top, right, bottom}。
    -- @field [parent=#byui.LabelBehaviour] #table margin 
    margin = {function ( self )
        return self._margin
    end,function ( self,value )
        self._margin = value 
        if self.label.on_size_changed then
            self._auto_size = true
            local s = self.label.size + Point(self.margin[1] + self.margin[3], self.margin[2] + self.margin[4])
            self.size_hint = s
            self:update_constraints()
        end
    end},
}

---
-- 纹理的包装.
-- 提供纹理的一个包装，可以方便控制纹理的颜色和绑定的纹理对象，以及@{# engine#BorderSprite.t_border}。
-- @type byui.Image

---
-- 通过纹理描述创建一个Image.
-- @callof #byui.Image
-- @param #byui.Image self 
-- @param #table desc 纹理的描述。
--      可以是可以是TextureUnit类型，Colorf，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} } 。
-- @return #byui.Image 返回创建的对象

M.Image = class('Image', nil, {
    __init__ = function(self, desc)
        if desc.class == TextureUnit then
            self.unit = desc
            local tsize = desc.size
            self.t_border = {tsize.x/2, tsize.y/2, tsize.x/2, tsize.y/2}
            self.color = Colorf.white
        elseif desc.class == Colorf then
            self.unit = units.circle
            local tsize = self.unit.size
            self.t_border = {tsize.x/2, tsize.y/2, tsize.x/2, tsize.y/2}
            self.color = desc
        elseif type(desc) == 'table' then
            self.unit = desc.unit or units.circle
            self.color = desc.color or Colorf.white
            if desc.t_border ~= nil then
                self.t_border = desc.t_border
            else
                local tsize = self.unit.size
                self.t_border = {tsize.x/2, tsize.y/2, tsize.x/2, tsize.y/2}
            end
        else
            error('invalid image description')
        end
    end,
    ---
    -- 将纹理应用到制定的节点上.
    -- **这个节点必须时@{#engine.Sprite}类型或其子类。**
    -- @function [parent=#byui.Image] apply
    -- @param #byui.Image self 
    -- @param engine#Sprite node 需要设置纹理的节点.
    apply = function(self, node)
        node.unit = self.unit
        node.t_border = self.t_border
        node.self_colorf = self.color
    end,
})

---
-- 图片逻辑基类.
-- @type byui.ImageBehaviour
M.ImageBehaviour = {
    ---
    -- 图片逻辑基类构造函数.
    -- 其子类必须在其构造函数中去执行此方法用来完成其图片逻辑基类的构造工作。
    -- @param #byui.ImageBehaviour self 
    -- @param #table args 构造输入的参数。
    --         image:table类型。key表示状态，value表示不同状态对应的纹理描述。
    --         radius:number类型。表示是否圆角，以及圆角的半径。
    --         v_border:table类型。表示v_border的值。
    --         default_state:string类型。表示默认的状态。 
    __init__ = function(self, args)
        self.images = {}
        for name, desc in pairs(args.image) do
            self.images[name] = M.Image(desc)
        end
        if args.radius == nil then
            args.radius = 5
        end
        self.default_image = self.images[args.default_state]
        if args.v_border then
            self.v_border = args.v_border
        elseif args.radius then
            self.radius = args.radius
        end

        -- init state
        self.image_state = args.default_state

        if args.size ~= nil then
            self.size = args.size
        else
            self.size = self.default_image.unit.size
        end
    end,
    
    ---
    -- 设置当前的状态，以显示对应状态对应的纹理.
    -- **如果状态不存在则显示默认的纹理**
    -- @field [parent=#byui.ImageBehaviour] #string image_state 
    image_state = {function(self)
        return self._image_state
    end, function(self, state)
        if self._image_state ~= state then
            self._image_state = state

            local img = self.images[state]
            if img == nil then
                img = self.default_image
            end
            img:apply(self)
        end
    end},
    ---
    -- 圆角半径.
    -- 等价于 v_border = {radius, radius, radius, radius}。
    -- @field [parent=#byui.ImageBehaviour] #number radius 
    radius = {function ( self )
        return self._radius
    end,function ( self,v )
        self._radius = v
        self.v_border = {v, v, v, v}
    end},
}


---
-- 普通按钮.
-- 同时继承了@{#byui.EventHandler},@{#byui.ButtonBehaviour},@{#byui.LabelBehaviour},@{#byui.ImageBehaviour}。
-- @type byui.Button


---
-- 创建一个Button.
-- @callof #byui.Button
-- @param #byui.Button self 
-- @param #table args 构造参数.@{#byui.EventHandler.__init__},@{#byui.ButtonBehaviour.__init__},@{#byui.LabelBehaviour.__init__},@{#byui.ImageBehaviour.__init__}所需要的构造参数。
-- @return #byui.Button 返回创建的Button


M.Button = class('Button', BorderSprite, mixin(M.EventHandler, M.ButtonBehaviour, M.LabelBehaviour, M.ImageBehaviour, {
    __init__ = function(self, args)
        super(M.Button, self).__init__(self)

        self.args = args

        if args.image == nil then
            args.image = {
                normal = Colorf.green,
                down = Colorf.blue,
                disabled = Colorf(0.5,0.5,0.5,1),
            }
        end
        if args.text == nil then
            args.text = 'Button'
        end

        args.default_state = 'normal'
        M.ImageBehaviour.__init__(self, args)
        M.LabelBehaviour.__init__(self, args)
        M.EventHandler.__init__(self, args)
        self.label.colorf = Colorf(1.0,1.0,1.0,1.0)
        local fn = args.on_state_changed
        function args.on_state_changed(self)
            self.image_state = self._state
            if fn then
                fn(self)
            end
        end
        M.ButtonBehaviour.__init__(self, args)

        self.state = 'normal'
    end,

    on_enable_changed = function(self)
        self.image_state = self._enabled and 'normal' or 'disabled'
    end,
    ---
    -- 普通状态下的纹理.
    -- 可以是TextureUnit类型，Colorf，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} } 。
    -- @field [parent=#byui.Button] #table normal 
    normal = {function ( self )
        return self.images['normal'].unit
    end,function ( self ,desc)
        local normal_image = M.Image(desc)
        self.images['normal'] = normal_image
        if self.state == 'normal' then
            normal_image:apply(self)
        end
    end},
    ---
    -- 按下状态的纹理.
    -- 可以是TextureUnit类型，Colorf，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} } 。
    -- @field [parent=#byui.Button] #table down 
    down = {function ( self )
        return self.images['down'].unit
    end,function ( self ,desc)
        local down_image = M.Image(desc)
        self.images['down'] = down_image
        if self.state == 'down' then
            down_image:apply(self)
        end
    end},
    ---
    -- 禁用状态的纹理.
    -- 可以是TextureUnit类型，Colorf，或者是table 格式 {uint=TextureUnit，color = Colorf，t_border = {left,top,right,bottom} } 。
    -- @field [parent=#byui.Button] #table disabled 
    disabled = {function ( self )
        return self.images['disabled'].unit
    end,function ( self ,desc)
        local disabled_image = M.Image(desc)
        self.images['disabled'] = disabled_image
        if self.state == 'disabled' then
            disabled_image:apply(self)
        end
    end},
    ---
    -- 大小.
    -- 由于button自身存在 AutoLayout 的规则所以给其添加规则可能并不会生效。
    -- @field [parent=#byui.Button] engine#Point size 
    size = {function ( self )
        return super(M.Button, self).size
    end,function ( self,s )
        self._auto_size = false
        self.size_hint = s 
        super(M.Button, self).size = s
        self:update_constraints()
    end},
    width = {function ( self )
        return self.size.x
    end,function ( self,w)
        self.size = Point(w,self.size.y)
    end},
    height = {function ( self )
        return self.size.y
    end,function ( self,h )
        self.size = Point(self.size.x,h)
    end},
}))

---
-- 复选框控件.
-- 同时继承了@{#byui.EventHandler},@{#byui.CheckboxBehaviour},@{#byui.ImageBehaviour}。
-- @type byui.Checkbox
-- @extends engine#BorderSprite 

---
-- 创建一个复选框.
-- @callof #byui.Checkbox
-- @param #byui.Checkbox self 
-- @param #table args 构造参数.@{#byui.EventHandler.__init__},@{#byui.CheckboxBehaviour.__init__},@{#byui.ImageBehaviour.__init__}所需要的构造参数。
-- @return #byui.Checkbox 返回创建的复选框


M.Checkbox = class('Checkbox', BorderSprite, mixin(M.EventHandler, M.CheckboxBehaviour, M.ImageBehaviour, {
    __init__ = function(self, args)
        super(M.Checkbox, self).__init__(self)
        -- init event
        self.args = args

        args.default_state = 'checked_enabled'
        M.ImageBehaviour.__init__(self, args)
        M.EventHandler.__init__(self, args)
        M.CheckboxBehaviour.__init__(self, args)
    end,

    _on_change = function(self)
        if self._enabled then
            self.image_state = self._checked and 'checked_enabled' or 'unchecked_enabled'
        else
            self.image_state = self._checked and 'checked_disabled' or 'unchecked_disabled'
        end
        M.CheckboxBehaviour._on_change(self)
    end,
    on_enable_changed = function(self)
        if self._enabled then
            self.image_state = self._checked and 'checked_enabled' or 'unchecked_enabled'
        else
            self.image_state = self._checked and 'checked_disabled' or 'unchecked_disabled'
        end
    end,
}))

---
-- RadioButton的逻辑组.
-- @type byui.RadioGroup


M.RadioGroup = class('RadioGroup', nil, {
    __init__ = function(self, desc)
        self.items = {}
        self._current = -1
    end,
    ---
    -- 当前选中的RadioButton的id.
    -- 如果都没有选中默认为-1
    -- @field [parent=#byui.RadioGroup] #number current 
    current = {function (self )
        return self._current
    end,function ( self,id )
        assert(id > 0 and id <=#self.items,"invalid id:" .. tostring(id))
        if self.current ~= id and self.current ~= -1 then
            self.items[self._current].checked = false
        end
        self._current = id
        self.items[self._current].checked = true
        self:_on_change()
    end
    },
    ---
    -- 将已经选中的RadioButton清除选中状态.
    -- @function [parent=#byui.RadioGroup] clear_check 
    -- @param #byui.RadioGroup self 
    clear_check = function ( self )
        if self.current ~= -1 then
            self.items[self._current].checked = false
        end
    end,
    ---
    -- 选中指定的RadioButton.
    -- @function [parent=#byui.RadioGroup] check 
    -- @param #byui.RadioGroup self 
    -- @param #number id 指定的RadioButton的id.
    check = function (self,id)
        assert(id > 0 and id <=#self.items,"invalid id:" .. tostring(id))
        if self.current ~= id and self.current ~= -1 then
            self.items[self._current].checked = false
        end
        self._current = id
        self.items[self._current].checked = true
        self:_on_change()
    end,
    ---
    -- 获取RadioButton的索引.
    -- @function [parent=#byui.RadioGroup] index_of_item 
    -- @param #byui.RadioGroup self 
    -- @param #byui.RadioButton item 指定的RadioButton.
    -- @return #number 返回给定的索引。如果不存在则返回-1.
    index_of_item = function (self,item)
        for i,v in ipairs(self.items) do
            if v:getId() == item:getId() then
                return i
            end
        end
        return -1 
    end,
    ---
    -- 添加一个的RadioButton.
    -- @function [parent=#byui.RadioGroup] add_item 
    -- @param #byui.RadioGroup self 
    -- @param #byui.RadioButton item 需要添加的RadioButton.
    add_item = function (self,item)
        if item.group == self then return end
        if  item.group  then
            item.group:remove_item(item.group:index_of_item(item))
        end
        item.__group = self
        table.insert(self.items,item)
        if item.checked then
            self:check(#self.items)
        end
        self:_on_child_add(item)
    end,
    ---
    -- 删除一个的RadioButton.
    -- @function [parent=#byui.RadioGroup] add_item 
    -- @param #byui.RadioGroup self 
    -- @param #number id 需要删除的RadioButton的id.
    remove_item = function (self,id)
        if self._current == id then
            self._current = -1
        end
        local temp = table.remove(self.items,id)
        self:_on_child_remove(temp)
    end,
    _on_change = function(self)
        ---
        -- RadioButton选中状态变化事件的回调.
        -- 提供一个参数，表示当前选中状态的id。
        -- @field [parent=#byui.RadioGroup] #function on_change 
        if self.on_change then
            self:on_change(self._current)
        end
    end,
    _on_child_add = function(self,value)
        ---
        -- 添加一个RadioButton的回调.
        -- 提供一个参数，表示当前添加的RadioButton。
        -- @field [parent=#byui.RadioGroup] #function on_child_add 
        if self.on_child_add then
            self:on_child_add(value)
        end
    end,
    _on_child_remove = function(self,value)
        ---
        -- 删除一个RadioButton的回调.
        -- 提供一个参数，表示当前删除的RadioButton。
        -- @field [parent=#byui.RadioGroup] #function on_child_remove 
        if self.on_child_remove then
            self:on_child_remove(value)
        end
    end,
})

---
-- RadioButton容器.
-- 所有字节点会自动添加到一个@{#byui.RadioGroup}中。
-- @type byui.RadioContainer
-- @extends engine#Widget 
M.RadioContainer = class('RadioContainer', Widget, {
    __init__ = function(self, args)
        super(M.RadioContainer, self).__init__(self)
        self._group = M.RadioGroup(args)
    end,
    ---
    -- 添加一个@{#byui.RadioButton}.
    -- @function [parent=#byui.RadioContainer] add
    -- @param #byui.RadioContainer self 
    -- @param #byui.RadioButton c  添加的@{#byui.RadioButton}
    add = function(self, c)
        self._group:add_item(c)
        super(M.RadioContainer, self).add(self, c)
    end,
    ---
    -- 删除一个@{#byui.RadioButton}.
    -- @function [parent=#byui.RadioContainer] remove
    -- @param #byui.RadioContainer self 
    -- @param #byui.RadioButton c  删除的@{#byui.RadioButton}
    remove = function(self, c)
        self._group:remove_item(self._group:index_of_item(c))
        super(M.RadioContainer, self).remove(self, c)
    end,
})

---
-- 单选按钮控件.
-- 同时继承了@{#byui.EventHandler},@{#byui.ButtonBehaviour},@{#byui.ImageBehaviour}。
-- @type byui.RadioButton
-- @extends engine#BorderSprite 

---
-- 创建一个RadioButton
-- @callof #byui.RadioButton
-- @param #byui.RadioButton self 
-- @param #table args 构造参数.@{#byui.EventHandler.__init__},@{#byui.ButtonBehaviour.__init__},@{#byui.ImageBehaviour.__init__}所需要的构造参数。
-- @return #byui.RadioButton 返回创建的RadioButton

M.RadioButton = class('RadioButton', BorderSprite, mixin(M.EventHandler, M.CheckboxBehaviour, M.ImageBehaviour, {
    __init__ = function(self, args)
        super(M.RadioButton, self).__init__(self)
        -- init event
        self.args = args
        if not args.image then 
            args.image = {}
            args.image.unchecked_enabled = units.radiobutton_uncheck 
            args.image.checked_enabled = units.radiobutton_check
        end
        if not args.image.checked_enabled then 
            args.image.checked_enabled = units.radiobutton_check
        end
        if not args.image.unchecked_enabled then 
            args.image.unchecked_enabled = units.radiobutton_uncheck 
        end
        if not args.radius then
            args.radius = 0
        end
        args.default_state = 'checked_enabled'
        M.ImageBehaviour.__init__(self, args)
        M.EventHandler.__init__(self, args)
        M.CheckboxBehaviour.__init__(self, args)
    end,

    _on_change = function(self)
        if self.group and self.group.current == -1 and self._checked then
            self.group.current = self.group:index_of_item(self)
        end
        if self._enabled then
            self.image_state = self._checked and 'checked_enabled' or 'unchecked_enabled'
        else
            self.image_state = self._checked and 'checked_disabled' or 'unchecked_disabled'
        end
        M.CheckboxBehaviour._on_change(self)
    end,
    on_enable_changed = function(self)
        if self._enabled then
            self.image_state = self._checked and 'checked_enabled' or 'unchecked_enabled'
        else
            self.image_state = self._checked and 'checked_disabled' or 'unchecked_disabled'
        end
    end,
    on_touch_up = function(self, p, t)
        if self:point_in(p) and not self.checked then
            if self.__group then
                self.__group:check(self.__group:index_of_item(self))
            else
                self.checked = not self.checked
            end
        end
    end,
    ---
    -- 所在的组.
    -- @field [parent=#byui.RadioButton] #byui.RadioGroup group description
    group = {function ( self )
        return self.__group
    end,function ( self,value )
        value:add_item(self)
        self.__group = value
    end},
}))



-- property
--    on_tint
--    off_tint
--    on
--    thumb_tint

---
-- 创建一个Switch.
-- @callof #byui.Switch
-- @param #byui.Switch self 
-- @param #table args 构造参数列表.
--          on_tint :Colorf类型。表示 开启状态的颜色。
--          off_tint  :Colorf类型。表示关闭状态的颜色。
--          thumb_tint :Colorf类型。操作按钮的颜色。
--          on :boolean类型。设置默认的初始选择状态。
-- @return #byui.Switch 新创建的Switch对象。

---
-- 开关选择控件.
-- **Switch的size 是固定大小，请不要去重新设置其size，改变其大小可以通过scale的方式去实现。**
-- @type byui.Switch
-- @extends engine#BorderSprite 



M.Switch = class('Switch', BorderSprite, mixin(M.EventHandler, {
    __init__ = function(self, args)
        super(M.Switch, self).__init__(self)
        M.EventHandler.__init__(self, args)
        self.on_change = args.on_change

        if args.on == nil then
            self._on = true
        else
            self._on = args.on
        end

        local border = 3

        self.unit = units.circle
        local tsize = self.unit.size
        self.t_border = {tsize.x/2, tsize.y/2, tsize.x/2, tsize.y/2}
        local vsize = Point(100,60)
        self.size = vsize
        self.v_border = {vsize.y/2, vsize.y/2, vsize.y/2, vsize.y/2}

        self.color_on = args.on_tint or Colorf.green
        self.color_off = args.off_tint or Colorf(0.9,0.9,0.9,1)
        self.self_colorf = self._on and self.color_on or self.color_off

        -- fill
        self.fill = BorderSprite()
        self:add(self.fill)
        self.fill.unit = units.circle
        tsize = self.unit.size
        self.fill.t_border = {tsize.x/2, tsize.y/2, tsize.x/2, tsize.y/2}
        local fill_vsize = Point(vsize.x - border*2, vsize.y - border*2)
        self.fill.size = fill_vsize
        self.fill.v_border = {fill_vsize.y/2, fill_vsize.y/2, fill_vsize.y/2, fill_vsize.y/2}
        self.fill.pos = Point(border, border)
        self.fill.self_colorf = Colorf(1,1,1,1)
        self.fill.scale_at_anchor_point = true
        self.fill.scale = self._on and Point(0,0) or Point(1,1)

        -- thumb
        local shadow_margin = 3
        local thumb_vsize = Point(vsize.y - border*2 + shadow_margin*2, vsize.y - border*2 + shadow_margin*2)
        self.thumb = RoundedView()
        self.thumb.size = thumb_vsize
        self.thumb.radius = (thumb_vsize.x - shadow_margin*2) / 2
        --self.thumb.y = -1
        self.thumb.self_colorf = args.thumb_tint or Colorf.white

        -- shadow
        self.thumb.need_shadow = true
        --self.thumb.need_box = false

        self.thumb.shadow_radius = thumb_vsize.x / 2
        self.thumb.shadow_margin = shadow_margin
        self.thumb.shadow_offset = Point(1,1)

        self.thumb_width = thumb_vsize.x
        self.thumb_hover_width = thumb_vsize.x + 13 -- 按下状态加宽
        self.thumb_left_x = border
        self.thumb_right_x = vsize.x - thumb_vsize.x - self.thumb_left_x

        self.thumb.x = self._on and self.thumb_right_x or self.thumb_left_x

        self:add(self.thumb)

        self.anim = anim.Animator()
    end,
    ---
    -- 当前状态.
    -- @field [parent=#byui.Switch] #boolean on 
    on = {function(self)
        return self._on
    end, function(self, v)
        if self._on ~= v then
            self._on = v
            -- self:_anim_standby(self._on)
            self:_anim_toggle(self._on)
            -- self:_anim_cancel(self._on)
            
            if self.on_change then
                self:on_change(self._on)
            end
        end
    end},
    ---
    -- 开启状态的颜色.
    -- @field [parent=#byui.Switch] engine#Colorf on_tint 
    on_tint = {function ( self )
        return self.color_on
    end,function ( self,c )
        self.color_on = c or Colorf.green
        self.self_colorf = self._on and self.color_on or self.color_off
    end},
    ---
    -- 关闭状态的颜色.
    -- @field [parent=#byui.Switch] engine#Colorf off_tint 
    off_tint = {function ( self )
        return self.color_off
    end,function ( self,c )
        self.color_off = c or Colorf(0.9,0.9,0.9,1)
        if not self._on then
            self.self_colorf = self.color_off
            self.thumb.self_colorf = self.color_off
        end
    end},
    ---
    -- 按钮的颜色.
    -- @field [parent=#byui.Switch] engine#Colorf thumb_tint 
    thumb_tint = {function ( self )
        return self._thumb_tint
    end,function ( self,c )
        self._thumb_tint = c or Colorf.white
        self.thumb.self_colorf = self._thumb_tint
    end},
    _anim_standby = function(self, on)
        print("_anim_standby",on)
        if not on then
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'width', self.thumb_hover_width},
                {self.fill, 'scale', Point(0, 0)},
            }, 0.15)
        else
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'width', self.thumb_hover_width},
                {self.thumb, 'x', self.thumb_right_x - (self.thumb_hover_width - self.thumb_width)},
            }, 0.15)
        end
    end,
    _anim_toggle = function(self, on)
        if on then
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'width', self.thumb_width},
                {self.thumb, 'x', self.thumb_right_x, anim.timing_bounce},
                {self.fill, 'scale', Point(0, 0), anim.ease_in_out},
                {self, 'self_colorf', self.color_on},
            }, 0.20)
        else
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'width', self.thumb_width},
                {self.thumb, 'x', self.thumb_left_x, anim.timing_bounce},
                {self.fill, 'scale', Point(1, 1), anim.ease_in_out},
                {self, 'self_colorf', self.color_off},
            }, 0.18)
        end
    end,
    _anim_cancel = function(self, on)
        if on then
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'width', self.thumb_width},
                {self.thumb, 'x', self.thumb_right_x},
            }, 0.15)
        else
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'width', self.thumb_width},
                {self.fill, 'scale', Point(1, 1)},
            }, 0.15)
        end
    end,
    _anim_standby_switch = function(self, on)
        if on then
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'x', self.thumb_left_x},
                {self, 'self_colorf', self.color_off},
            }, 0.18)
        else
            ui_utils.play_attr_anim(self.anim, {
                {self.thumb, 'x', self.thumb_right_x - (self.thumb_hover_width - self.thumb_width)},
                {self, 'self_colorf', self.color_on},
            }, 0.18)
        end
    end,
    _clear = function(self)
        self._down = nil
        self._standby = nil
        self._standby_switched = nil
    end,
    on_touch_down = function(self, p, t)
        self._down = p
        self._standby = self.on and 'on' or 'off'
        self:_anim_standby(self.on)
    end,
    on_touch_up = function(self, p, t)
        if self._down == nil then
            -- canceled.
            return
        end
        local on
        if not self._standby_switched then
            self.on = not self.on
            self:_anim_toggle(self.on)
        else
            self.on = self._standby == 'on'
            self:_anim_cancel(self.on)
        end
        self:_clear()
    end,
    on_touch_cancel = function(self)
        if self._down == nil then
            return
        end

        self.on = self._standby == 'on'
        self:_anim_cancel(self.on)
        self:_clear()
    end,
    on_touch_move = function(self, p, t)
        if self._down == nil then
            return
        end
        if (self._standby == 'on' and (self._down.x - p.x > 40)) or (self._standby == 'off' and (p.x - self._down.x > 40)) then
            if self._down.x - p.x > 40 then
                if self._standby ~= 'off' then
                    self._standby = 'off'
                    self._standby_switched = true
                    self:_anim_standby_switch(true)
                end
            else
                if self._standby ~= 'on' then
                    self._standby = 'on'
                    self._standby_switched = true
                    self:_anim_standby_switch(false)
                end
            end
        elseif (self._standby == 'on' and (p.x - self._down.x) > 200) or (not self._standby == 'off' and (self._down.x - p.x) > 200) then
            self:on_touch_cancel()
        elseif (math.abs(p.y - self._down.y) > 200) then
            self:on_touch_cancel()
        end
    end,
}))

---
-- 创建一个ToggleButton.
-- @callof #byui.ToggleButton
-- @param #table args 构造参数.@{#byui.EventHandler.__init__},@{#byui.ButtonBehaviour.__init__},@{#byui.ImageBehaviour.__init__},@{#byui.LabelBehaviour.__init__}所需要的构造参数。
-- @return #byui.ToggleButton 返回创建的ToggleButton.

---
-- 开关按钮.
-- 同时继承了@{#byui.EventHandler},@{#byui.ButtonBehaviour},@{#byui.ImageBehaviour},@{#byui.LabelBehaviour}。
-- @type byui.ToggleButton
-- @extends engine#BorderSprite 



M.ToggleButton = class('ToggleButton', BorderSprite, mixin(M.EventHandler, M.CheckboxBehaviour, M.ImageBehaviour, M.LabelBehaviour, {
    __init__ = function(self, args)
        super(M.ToggleButton, self).__init__(self)
        self.args = args
        args.default_state = 'checked_enabled'
        if args.image == nil then
            args.image = {
                checked_enabled = Colorf.green,
                unchecked_enabled = Colorf.blue,
                checked_disabled = Colorf(0.8,0.8,0.8,1),
                unchecked_disabled = Colorf(0.5,0.5,0.5,1),
            }
        end
        M.ImageBehaviour.__init__(self, args)
        M.LabelBehaviour.__init__(self, args)
        M.EventHandler.__init__(self, args)
        M.CheckboxBehaviour.__init__(self, args)
        self.label.colorf = Colorf(1.0,1.0,1.0,1.0)
    end,

    _on_change = function(self)
        if self._enabled then
            self.image_state = self._checked and 'checked_enabled' or 'unchecked_enabled'
        else
            self.image_state = self._checked and 'checked_disabled' or 'unchecked_disabled'
        end
        M.CheckboxBehaviour._on_change(self)
    end,

    on_enable_changed = function(self)
        if self._enabled then
            self.image_state = self._checked and 'checked_enabled' or 'unchecked_enabled'
        else
            self.image_state = self._checked and 'checked_disabled' or 'unchecked_disabled'
        end
    end,
    size = {function ( self )
        return super(M.ToggleButton, self).size
    end,function ( self,s )
        self._auto_size = false
        self.size_hint = s 
        super(M.ToggleButton, self).size = s
        self:update_constraints()
        self:update(false)
    end},
    width = {function ( self )
        return self.size.x
    end,function ( self,w)
        self.size = Point(w,self.size.y)
    end},
    height = {function ( self )
        return self.size.y
    end,function ( self,h )
        self.size = Point(self.size.x,h)
    end},
}))


---
-- 进度条.
-- @type byui.ProgressBar
-- @extends engine#BorderSprite 

---
-- 创建一个进度条.
-- @callof #byui.ProgressBar
-- @param #byui.ProgressBar self 
-- @param #table args 构造参数列表。
--     size : Point类型。进度条的大小。
--     base_color :Colorf类型。背景的颜色。
--     base_image : TextureUnit类型。背景的贴图，如果存在则base_color不生效。
--     progress_color :Colorf类型。进度的颜色。
--     progress_image : TextureUnit类型。进度的贴图，如果存在则progress_color不生效。
--     radius :number类型。圆角的半径。

M.ProgressBar = class('ProgressBar', BorderSprite, {
    __init__ = function(self, args)
        super(M.ProgressBar, self).__init__(self)
        
        self.size = args.size or Point(300,4)
        self.unit = units.circle
        self.t_border =  ui_utils.default_t_border(units.circle)
        self.base_color = args.base_color or Colorf(0.5,0.5,0.5,1)
        self.base_image = args.base_image

        self.progress = BorderSprite()
        self.progress.unit = units.circle
        self.progress.t_border =  ui_utils.default_t_border(units.circle)
        self.progress_color = args.progress_color or Colorf.blue
        self.progress_image = args.progress_image
        self.progress.size = self.size
        self:add(self.progress)
        self.radius = args.radius or (self.size.y / 2 )
        self.value = args.value or 0
        self.on_size_changed = function (_)
            self.value = self.value
        end
    end,
    ---
    -- 进度的值.
    -- 取值在@{#byui.ProgressBar.mininum_value}和@{#byui.ProgressBar.maxinum_value}之间。
    -- @field [parent=#byui.ProgressBar] #number value 
    value = {function(self)
        return self._value
    end, function(self, v)
        v = math.max(math.min(v, self.maxinum_value), self.mininum_value)
        self._value = v
        local scale = (self._value - self.mininum_value) / (self.maxinum_value - self.mininum_value)
        self.progress.size = Point(scale * self.width, self.height)
    end},
    ---
    -- 进度的最小值.
    -- 默认为0。
    -- @field [parent=#byui.ProgressBar] #number mininum_value
    mininum_value = {function ( self )
        return self._mininum_value or 0.0
    end,function ( self,min )
        if min > self.maxinum_value then
            min = self.maxinum_value
        end
        if min ~= self.mininum_value then
            self._mininum_value = min
            if self.value < self.mininum_value then
                self.value = self.mininum_value
            end
        end
    end},
    ---
    -- 进度的最大值.
    -- 默认为1。
    -- @field [parent=#byui.ProgressBar] #number maxinum_value
    maxinum_value = {function ( self )
        return self._maxinum_value or 1.0
    end,function ( self,max )
        if max < self.mininum_value then
            max = self.mininum_value
        end
        if max ~= self.maxinum_value then
            self._maxinum_value = max
            if self.value > self.maxinum_value then
                self.value = self.maxinum_value
            end
        end
    end},
    ---
    -- 进度的颜色.
    -- 如果@{#byui.ProgressBar.progress_image}存在则不会生效。
    -- @field [parent=#byui.ProgressBar] engine#Colorf progress_color
    progress_color = {function ( self )
        return self._progress_color
    end,function ( self,color )
        self._progress_color = color
        if not self.progress_image then
            self.progress.self_colorf = self._progress_color
        end
    end},
    ---
    -- 进度的纹理.
    -- 如果存在则@{#byui.ProgressBar.progress_color}不会生效。
    -- @field [parent=#byui.ProgressBar] engine#TextureUnit progress_image
    progress_image = {function ( self )
        return self._progress_image
    end,function ( self,image )
        if image == nil then
            self._progress_image = nil
            self.progress.unit = units.circle
            self.progress.t_border = ui_utils.default_t_border(units.circle)
            self.progress.self_colorf = self.progress_color
        elseif image.class == TextureUnit then
            self._progress_image = image
            self.progress.unit = image
            self.progress.t_border = ui_utils.default_t_border(image)
            self.progress.self_colorf = Colorf.white
        else
            error('invalid image description')
        end
    end},
    ---
    -- 背景的颜色.
    -- 如果@{#byui.ProgressBar.base_image}存在则不会生效。
    -- @field [parent=#byui.ProgressBar] engine#Colorf base_color
    base_color = {function ( self )
        return self._base_color
    end,function ( self,color )
        self._base_color = color
        if not self.base_image then
            self.self_colorf = self._base_color
        end
    end},
    ---
    -- 背景的纹理.
    -- 如果存在则@{#byui.ProgressBar.base_color}不会生效。
    -- @field [parent=#byui.ProgressBar] engine#TextureUnit base_image
    base_image = {function ( self )
        return self._base_image
    end,function ( self,image )
        if image == nil then
            self._base_image = nil
            self.unit = units.circle
            self.t_border = ui_utils.default_t_border(units.circle)
            self.self_colorf = self.base_color
        elseif image.class == TextureUnit then
            self._base_image = image
            self.unit = image
            self.t_border = ui_utils.default_t_border(image)
            self.self_colorf = Colorf.white
        else
            error('invalid image description')
        end
    end},
    ---
    -- 圆角半径.
    -- @field [parent=#byui.ProgressBar] #number radius
    radius = {function ( self )
        return self._radius or self.size.y/2
    end,function ( self,value )
        self._radius = value
        self.progress.v_border = {self._radius,self._radius,self._radius,self._radius}
        self.v_border = {self._radius,self._radius,self._radius,self._radius}
    end

    },
})

---
-- 滑动条控件.
-- 同时继承了同时继承了@{#byui.EventHandler}。
-- @type byui.Slider
-- @extends engine#Widget 

---
-- 创建一个滑动条.
-- @callof #byui.Slider
-- @param #byui.Slider self 
-- @param #table args 构造参数列表
--        thumb_size:Point类型。滑块的大小。
--        thumb_color:Colorf类型。滑块的颜色，在 thumb_image存在情况下不生效。
--        thumb_image:TextureUnit类型。滑块的纹理，如果存在则thumb_color不生效。
--        on_change:function类型。当值改变时的回调函数。
--        ProgressBar需要的构造参数.
-- @return #byui.Slider 

M.Slider = class('Slider', Widget, mixin(M.EventHandler, {
    __init__ = function(self, args)
        super(M.Slider, self).__init__(self, args)

        self.size = args.size or Point(100,4)
        ---
        -- 包含的进度条对象.
        -- @field [parent=#byui.Slider] #byui.ProgressBar progress_bar 
        self.progress_bar = M.ProgressBar{
            size = self.size,
            base_color = args.base_color,
            progress_color = args.progress_color,
        }
        self:add(self.progress_bar)

        self.thumb = BorderSprite()
        self.thumb.unit = units.circle
        self.thumb.t_border =  ui_utils.default_t_border(units.circle)
        self.thumb_size = args.thumb_size or Point(60,60)
        self.thumb_color = args.thumb_color or Colorf.white
        self.thumb_image = args.thumb_image 
        self.thumb:initId()
        self:add(self.thumb)

        -- self.contain_children = true
        -- self.thumb.contain_children = true

        args.event_widget = self.thumb
        M.EventHandler.__init__(self, args)
        
        ---
        -- 值改变的回调.
        -- @field [parent=#byui.Slider] #function on_change 
        self.on_change = args.on_change
        self.on_size_changed = function (  )
            self.progress_bar.size = self.size
            self.value = self.value
        end
    end,
    value = {function(self)
        return self.progress_bar.value
    end, function(self, v)
        v = math.max(math.min(v, self.progress_bar.maxinum_value), self.progress_bar.mininum_value)
        self.progress_bar.value = v
        local coefficient = (v - self.progress_bar.mininum_value)/(self.progress_bar.maxinum_value - self.progress_bar.mininum_value)
        local from = 0--self.thumb.width/2
        local to = self.progress_bar.width - self.thumb.width
        self.thumb.pos = Point(from + coefficient * (to - from) ,self.progress_bar.height/2-self.thumb.height/2)
    end},
    on_touch_down = function(self, p, t)
        p = self:from_world(p)
        self._last = p.x
    end,
    on_touch_move = function(self, p, t)
        p = self:from_world(p)
        local diff = ((p.x - self._last) / self.progress_bar.width)*(self.progress_bar.maxinum_value - self.progress_bar.mininum_value)
        self._last = p.x
        self.value = self.value + diff
        self:_on_change(self.value)
    end,
    on_touch_up = function(self, p, t)
        p = self:from_world(p)
        self._start = nil
        self:_on_change(self.value)
    end,
    _on_change = function(self, value)
        if self.on_change then
            self:on_change(value)
        end
    end,
    ---
    -- 滑块的大小.
    -- @field [parent=#byui.Slider] engine#Point thumb_size
    thumb_size = {function ( self )
        return self.thumb.size
    end,function ( self,size )
        self.thumb.size = size
        self.value = self.value
    end},
    ---
    -- 滑块的颜色.
    -- 如果@{#byui.Slider.thumb_image}存在则不会生效。
    -- @field [parent=#byui.Slider] engine#Colorf thumb_color
    thumb_color = {function ( self )
        return self._thumb_color
    end,function ( self,color )
        self._thumb_color = color
        if not self.base_image then
            self.thumb.self_colorf = self._thumb_color
        end
    end},
    ---
    -- 滑块的纹理.
    -- 如果存在则@{#byui.Slider.thumb_color}不会生效。
    -- @field [parent=#byui.Slider] engine#TextureUnit thumb_image
    thumb_image = {function ( self )
        return self._thumb_image
    end,function ( self,image )
        if image == nil then
            self._thumb_image = nil
            self.thumb.unit = units.circle
            self.thumb.size = units.circle.size
            self.thumb.t_border = ui_utils.default_t_border(units.circle)
            self.thumb.self_colorf = self.thumb_color
        elseif image.class == TextureUnit then
            self._thumb_image = image
            self.thumb.unit = image
            self.thumb.size = image.size
            self.thumb.t_border = ui_utils.default_t_border(image)
            self.thumb.self_colorf = Colorf.white
        else
            error('invalid image description')
        end
        self.value = self.value
    end},
    ---
    -- 进度的最小值.
    -- 默认为0.0。
    -- @field [parent=#byui.Slider] #number mininum_value
    mininum_value = {function ( self )
        return self.progress_bar.mininum_value
    end,function ( self,min )
        if min > self.maxinum_value then
            min = self.maxinum_value
        end
        if min ~= self.mininum_value then
            self.progress_bar.mininum_value = min
            if self.value < self.mininum_value then
                self.value = self.mininum_value
            else
                self.value = self.value
            end
        end
    end},
    ---
    -- 滑块的的最大值.
    -- 默认为1。
    -- @field [parent=#byui.Slider] #number maxinum_value
    maxinum_value = {function ( self )
        return self.progress_bar.maxinum_value
    end,function ( self,max )
        if max < self.mininum_value then
            max = self.mininum_value
        end
        if max ~= self.maxinum_value then
            self.progress_bar.maxinum_value = max
            if self.value > self.maxinum_value then
                self.value = self.maxinum_value
            else
                self.value = self.value
            end
        end
    end},
}))

---
-- 创建一个多层控件.
-- @callof #byui.Layers
-- @param #byui.Layers self 
-- @param #table args 
--      drag_direction : 拖拽的方向，可选 kDragToLeft :向左滑动, kDragToRight :向右拖动, kDragToTop :向上拖动, kDragToBottom :向下拖动。
--      drag_length : 可以拖拽的最大距离。现在已经废弃，现在根据背景的大小来决定拖拽距离。尽可能的显示完整的背景。
-- @return #byui.Layers 返回创建的Layers对象.


---
-- 多层控件.
-- 可以有两层，通过制定滑动的方向可以通过滑动显示出另外的一层。
-- @type byui.Layers
-- @extends engine#Widget 


M.Layers = class('Layers', Widget, mixin(M.EventHandler, {
    __init__ = function(self, args)
        super(M.Layers, self).__init__(self, args)
        self._capture = false
        self.clip = true
        self._throw = false
        self._drag_direction = kDragToLeft
        self._drag_length = 0

        self.width = args.width or 0
        self.height = args.height or 0

        
        M.EventHandler.__init__(self, args)

        
        self.drag_direction = args.drag_direction or kDragToLeft
        self.drag_length = args.drag_length or 0
        if self.drag_direction == kDragToLeft or self.drag_direction == kDragToRight then
            self.pos_dimension =  'x'
        else
            self.pos_dimension =  'y'
        end
        
        self._show_status = true
        self._drag_distance = 0

        self._scroll_recognizer = M.ScrollRecognizer{
            min_distance = 5,
            callback = function(touch)
                touch:lock(self.event_widget)
                self._capture = true
            end,
            pos_dimension = self.pos_dimension,
        }

        self:add_recognizer(self._scroll_recognizer)
        self.on_size_changed = function(_)
            self.drag_length = self.drag_length
            if self._background_control then
                if self.pos_dimension == 'x' then
                    self._drag_length = self._background_control.width
                    self._background_control.pos = Point((self.width - self._drag_length)*(1-self.drag_direction.x)/2,0)
                else
                    self._drag_length = self._background_control.height
                    self._background_control.pos = Point(0,(self.height - self._drag_length)*(1-self.drag_direction.y)/2)
                end
            end
        end
        self._touch_data = {
            start_point = nil,
            start_time = nil,
            length = 0,
            direction_change = false
        }
        
        self.anim = anim.Animator()
        
    end,
    min_distance = {function ( self )
        return self._scroll_recognizer.min_distance 
    end,function ( self,v )
        self._scroll_recognizer.min_distance = v
    end},
    _anim_move = function(self, status,duration,timing)
        if self._foreground_control then
            if not status then
                ui_utils.play_attr_anim(self.anim, {

                    {self._foreground_control, self.pos_dimension, 0,timing},
                }, duration or 0.15)
            else
                ui_utils.play_attr_anim(self.anim, {

                    {self._foreground_control, 'pos', Point(self._drag_length * self.drag_direction.x,self._drag_length * self.drag_direction.y),timing},
                }, duration or 0.15)
            end
        end
        self._show_status = not status
        self._throw = true
        if self._on_change_status then
            self._on_change_status(self._show_status)
        end
    end,
    ---
    -- 拖拽的方向.
    -- 可取kDragToRight,kDragToBottom,kDragToLeft,kDragToRight,kDragToTop。默认为kDragToLeft
    -- @field [parent=#byui.Layers] #obj drag_direction 
    drag_direction = {function(self)
        return self._drag_direction
    end, function(self, v)
        self._drag_direction = v
        self:_show_foreground()
        if self._drag_direction.x == 0 then
            self.pos_dimension = 'y'
        else
            self.pos_dimension = 'x'
        end
    end},
    drag_length = {function(self)
        return self._drag_length
    end, function(self, v)
        self._drag_length = v 
        self:_show_foreground()
    end},
    ---
    -- 背景视图.
    -- 背景需要显示的控件。
    -- @field [parent=#byui.Layers] engine#Widget background_view 
    background_view = {function(self)
        return self._background_control
    end,function ( self,w )
        if self._background_control then
            self._background_control:remove_from_parent()
        end
        self._background_control = w
        self._background_control.zorder = -1
        self:add(w)
        self._background_control.on_content_bbox_changed = function(_)
            if self.pos_dimension == 'x' then
                self._drag_length = self._background_control.content_bbox.w
                self._background_control.pos = Point((self.width - self._drag_length)*(1-self.drag_direction.x)/2,0)
            else
                self._drag_length = self._background_control.content_bbox.h
                self._background_control.pos = Point(0,(self.height - self._drag_length)*(1-self.drag_direction.y)/2)
            end
        end
    end
    },
    ---
    -- 前景视图.
    -- 前景需要显示的控件。
    -- @field [parent=#byui.Layers] engine#Widget foreground_view 
    foreground_view = {function(self)
        return self._foreground_control
    end,function ( self,w )
        if self._foreground_control then
            self._foreground_control:remove_from_parent()
        end
        self._foreground_control = w
        self:add(w)
        self._foreground_control.zorder = 1
        self.size = self._foreground_control.size
    end
    },
    ---
    -- 显示状态.
    -- 默认为true，即显示的前景。false则背景为激活状态。
    -- @field [parent=#byui.Layers] #boolean show_status 
    show_status = {function ( self )
        return self._show_status
    end
    },
    _show_foreground = function (self)
        self._show_status = true
        if self._foreground_control then
            self._foreground_control.pos = Point(0,0)
        end
    end,
    ---
    -- 强制显示前景.
    -- 调用此函数后会回到初始状态。
    -- @function [parent=#byui.Layers] show_foreground
    -- @param #byui.Layers self 
    show_foreground = function (self)
        self:_anim_move(false)
        self._throw = false
    end,
    
    set_on_change_status_callback = function (self, callback )
        self._on_change_status = callback
    end,
    ---
    -- 状态变化的监听.
    -- 可以检测背景是否处于激活的状态。
    -- @field [parent=#byui.Layers] #function on_change_status
    -- @usage l.on_change_status = function(status)
    --      print("status:",status)
    -- end
    on_change_status = {function ( self )
        return self._on_change_status
    end,function ( self,value )
        self._on_change_status = value
    end},
    _show_background = function (self, length )
        self._drag_distance = length
        if self._foreground_control then 
            self._foreground_control.pos = Point(self._drag_distance * self.drag_direction.x,self._drag_distance * self.drag_direction.y) 
        end 
    end,

    on_touch_down = function(self, p, t)
        if self._throw then return end 
        self._capture = false
        self._touch_data.start_point = p
        self._touch_data.start_time = t
        if not self._throw and not self.show_status and self._foreground_control and self._foreground_control:point_in(p) then
            self:_anim_move(false)
            self.need_capture = true
        end
    end,
    on_touch_move = function(self, p, t)
        if self._throw then return end 
        if self._capture  and not self._throw then
            local now_point = p
            local length = 0
            length = ( now_point[self.pos_dimension] - self._touch_data.start_point[self.pos_dimension] ) * self.drag_direction[self.pos_dimension]
            if self._touch_data.length and self._touch_data.length < length then
                self._touch_data.direction_change = true
            else
                self._touch_data.direction_change = false
            end

            if length < self.rebound_length then
                length = self.rebound_length
            elseif length >= self.drag_length then
                length = self.drag_length
            end
            self._touch_data.length = length
            if self.show_status then
                self:_show_background(length)
            else
                self:_show_foreground()
            end
        end
    end,
    on_touch_up = function(self, p, t)
        if self._capture  and not self._throw then
            self._capture = false
            if  self._touch_data.direction_change and  (( p[self.pos_dimension] - self._touch_data.start_point[self.pos_dimension] ) * self.drag_direction[self.pos_dimension]  > self._drag_length / 5 ) then 
                self:_anim_move(true)
            elseif ( p[self.pos_dimension] - self._touch_data.start_point[self.pos_dimension] ) * self.drag_direction[self.pos_dimension] < 0 then
                self:_anim_move(false,0.3,anim.overshoot(8))
            else
                self:_anim_move(false)
            end
        end
        self._throw = false
        self._drag_distance = 0
        self.need_capture = false
    end,
    on_touch_cancel = function ( self)
        self._capture = false
        self._throw = false
        self._drag_distance = 0
        self.need_capture = false
    end,
    rebound_length = {function ( self )
        return self._rebound_length or -30
    end,function ( self,value )
        self._rebound_length = tonumber(value) or -30
    end},

}))








---
-- 创建一个指示器.
-- @callof #byui.Loading
-- @param #byui.Loading self 
-- @param #table args 构造参数列表.
--      style : string类型。loading的样式，可取 gray , white_large , white 三种。
--      hides_when_stopped : boolean类型。当停止动画的时候，是否隐藏。默认为true。
-- @return #byui.Loading 返回创建的指示器.


---
-- 指示器.
-- 有三种不同的样式,“white_large”尺寸是37*37,white尺寸是"22*22",gray尺寸是"22*22"。不要手动去改变它的大小和切换它的纹理。
-- 你要显示出来，在创建后必须调用start_animating().开启动画才能显示。在需要销毁的时候请调用stop_animating()。
-- @type byui.Loading

M.Loading = class('Loading', Sprite, {
    __init__ = function(self, args)
        super(M.Loading, self).__init__(self)
        self.style = args.style or 'white'  

        if args.hides_when_stopped then
            self.hides_when_stopped = args.hides_when_stopped
        else
            self.hides_when_stopped = true
        end
        local count = 0
        local t= 0
        self._handle = Clock.instance():schedule(function (dt)
            count  = (count + 1)--%360
            self.rotation = count * 30
        end,0.1)
        self._handle.paused  = true
        self.visible = false
    end,
    ---
    -- 当停止动画的时候，是否隐藏.
    -- 默认为true。
    -- @field [parent=#byui.Loading] #boolean hides_when_stopped 
    hides_when_stopped = {function(self)
        return self._hides_when_stopped
    end,function(self,v)
        if v then
            self._hides_when_stopped = true
        else
            self._hides_when_stopped = false
        end
    end
    },
    ---
    -- 指示器的样式.
    -- 有三种不同的样式,“white_large”尺寸是37*37,white尺寸是"22*22",gray尺寸是"22*22"。不要手动去改变它的大小和切换它的纹理。。
    -- @field [parent=#byui.Loading] #string style
    style = {function(self)
        return self._style
    end,function(self,v)
        self._style = v
        if self._style == 'gray' then
            self.unit = units.loading_gray
        elseif self._style == 'white_large' then
            self.unit = units.loading_white_large
        else
            self.unit = units.loading_white
        end
        self.size_hint = self.unit.size
        self.width_hug = kiwi.REQUIRED
        self.height_hug = kiwi.REQUIRED
        self:update_constraints()
    end
    },
    ---
    -- 开始动画.
    -- 你必须手动开始动画。
    -- @function [parent=#byui.Loading] start_animating
    -- @param #byui.Loading self 
    start_animating = function( self)
        if not self._handle then
            local count = 0
            self._handle = Clock.instance():schedule(function (dt)
                count  = (count + 1)--%360
                self.rotation = count * 30
            end,0.1)
        end
        self._handle.paused = false
        self.visible = true
    end,
    ---
    -- 停止动画.
    -- 在你需要移除指示器时，你必须停止动画，防止内存泄漏。
    -- @function [parent=#byui.Loading] stop_animating
    -- @param #byui.Loading self 
    stop_animating = function( self)
        if self._handle then
            self._handle:cancel() 
        end
        self._handle = nil
        if self._hides_when_stopped then
            self.visible = false
        end
    end,
    ---
    -- 是否在动画中.
    -- @function [parent=#byui.Loading] is_animating
    -- @param #byui.Loading self 
    -- @return #boolean 如果在动画则返回true,否则返回false。
    is_animating = function(self)
        return self._handle and not self._handle.stopped
    end,
})




local MenuItem
MenuItem = class('MenuItem', M.Button, {
    __init__ = function(self, args)
        local multiply = 3/7
        args.margin = args.margin or {CLabel.get_default_line_height(),CLabel.get_default_line_height()*multiply,CLabel.get_default_line_height(),CLabel.get_default_line_height()*multiply}
        -- print("args.title",args.margin[1],args.margin[2],args.margin[3],args.margin[4])
        args.radius = 0
        args.image = {
            normal = {
                unit = units.circle,
                color = Colorf(0.0,0.0,0.0,1.0)
            },
            down = {
                unit = units.circle,
                color = Colorf(0.5,0.5,0.5,1.0)
            },
            disabled = {
                unit = units.circle,
                color = Colorf(0.3,0.3,0.3,1.0)
            },
        }
        self.title = args.title or "MenuItem"
        args.text = args.title
        args.on_click = args.action
        self.args = args
        -- args.size = Point(85,41)
        super(MenuItem, self).__init__(self,args)
        self.v_border = {0,10,0,10}
        self.on_state_changed = function ( self )
            self.image_state = self._state
            -- M.share_menu_controller():_item_status_change(self,self._state)
        end
        -- self:add_rules({AL.height:eq(3*CLabel.get_default_line_height())})
        self.height_hint = CLabel.get_default_line_height() + args.margin[2] + args.margin[4]
    end,
    on_touch_down = function(self, p, t)
        if self.state ~= "disabled" then
            self.state = 'down'
            self._down = p
        end
    end,
    on_touch_move = function(self, p, t)
        if self.state ~= "disabled" then
            if (self._down.x - p.x)^2 +  (self._down.y - p.y)^2  < 100^2 then
                self.state = 'down'
            else
                self.state = 'normal'
            end
        end
    end,
    on_touch_up = function(self, p, t)
        if self.state ~= "disabled" then
            self.state = 'normal'
            if self:point_in(p) and self.on_click then
                if self.title  ~= "&lt;" and self.title  ~= "&gt;" then
                    M.share_menu_controller():set_menu_visible(false,true)
                end
                self:on_click(p, t)
            end
        end
    end,
}, true)
local  MenuController
MenuController = class('MenuController', Widget, mixin(M.EventHandler,{
    __init__ = function(self, args)
        self._label_line_height = CLabel.get_default_line_height()
        -- self._label_line_height  = 25
        super(MenuController, self).__init__(self,args)
        -- M.EventHandler.__init__(self,args)
        self._content = BorderSprite()
        self._content.unit = units.circle
        self._content.self_colorf = Colorf(1.0,1.0,1.0,0.5)
        self._content.t_border = {units.circle.size.x/2,units.circle.size.y/2,units.circle.size.x/2,units.circle.size.y/2}
        self._content.v_border = {15,15,15,15}
        -- self._content.clip = true

        self:add(self._content)

        self._items = {}
        self._page_item = {}
        self._anim = anim.Animator()
        self._menu_visible = false
        self._target_view = Window.instance().drawing_root
        self._arrow_direction = kMenuControllerArrowDefault

        -- 
        self._arrow = BorderSprite()
        self._arrow.unit = units.bottom_triangle
        self._arrow.size = units.bottom_triangle.size
        self._arrow.self_colorf = Colorf(0.0,0.0,0.0,1.0)
        self:add(self._arrow)


        self._items_width = 0
        self._items_size = {}
        self._target_rect = Rect(0,0,0,0)
        self._anim.on_stop = function ( ... )
            if self._menu_visible then
                Window.instance().drawing_root:add(self)
            else
                self:remove_from_parent()
                for k,v in ipairs(self._items) do
                    v:remove_from_parent()
                    v = nil
                end
            end
            self.opacity = 1.0
        end
        self._space = 2
        self._radius = 9
        self.on_size_changed = function ( _ ) 
            self:_update_menu_item()
        end
        -- self:add_rules(AL.rules.fill_parent)
        local multiply = 3/7
        self._left_arrow_item = MenuItem{
                    title  = "&lt;",
                    margin = {self._label_line_height/3,self._label_line_height*multiply,self._label_line_height/3,self._label_line_height*multiply},
                    action = function (  )
                        self:_prev_page()
                    end,
                }
        self._right_arrow_item = MenuItem{
                    title  = "&gt;",
                    margin = {self._label_line_height/3,self._label_line_height*multiply,self._label_line_height/3,self._label_line_height*multiply},
                    action = function (  )
                        self:_next_page()
                    end,
                }
        self._left_arrow_item.v_border = {10,10,0,10}
        self._right_arrow_item.v_border = {0,10,10,10}
        self._left_arrow_item.visible = false
        self._right_arrow_item.visible = false
        self._right_arrow_item.label:update(false)
        self._left_arrow_item.label:update(false)
        self._left_arrow_item_width = self._left_arrow_item.label.width + self._left_arrow_item.margin[1] +self._left_arrow_item.margin[3] 
        self._right_arrow_item_width = self._right_arrow_item.label.width + self._right_arrow_item.margin[1] +self._right_arrow_item.margin[3] 
        self._content:add(self._left_arrow_item)
        self._content:add(self._right_arrow_item)

        self._page_index = 1
        self.zorder = 255
    end,
    set_menu_visible = function ( self,menuVisible,animated )
        animated = false
        -- print("menuVisible",menuVisible,"animated",animated))
        if menuVisible then
            --TODO:pos
            self:_update_menu_item()
            self._menu_visible = true
            if animated then
                self:_anim_visible(true)
            else
                -- self.size = Window.instance().drawing_root.size
                Window.instance().drawing_root:add(self)
            end
        else
            self._menu_visible = false
            if animated then
                self:_anim_visible(false)
            else
                self:remove_from_parent()
                for k,v in ipairs(self._items) do
                    v:remove_from_parent()
                    v = nil
                end
                self._items = {}
                self._page_item = {}
            end
        end
    end,
    set_target_rect = function ( self,rect ,view )
        self._target_rect = rect or Rect(0,0,0,0)
        self._target_view = view or Window.instance().drawing_root
    end,
    _update_menu_item = function ( self )
        local root_width = Window.instance().drawing_root.width
        local root_height = Window.instance().drawing_root.height
        local arrow_pos = Window.instance().drawing_root:from_world(self._target_view:to_world(Point(self._target_rect.x,self._target_rect.y)))
        arrow_pos.x =  arrow_pos.x + self._target_rect.w/2 - self._arrow.width/2
        arrow_pos.y =  arrow_pos.y - self._arrow.height
        if arrow_pos.x < self._radius * 2 + self._label_line_height then
            arrow_pos.x = self._radius * 2 + self._label_line_height
        elseif arrow_pos.x > root_width -  (self._radius * 2 + self._label_line_height + self._arrow.width) then
            arrow_pos.x = root_width -  (self._radius * 2 + self._label_line_height + self._arrow.width)
        end
        if arrow_pos.y - self._content.height <  0 then
            arrow_pos.y = self._target_rect.h + self._arrow.height  + arrow_pos.y
            self._arrow.unit = units.top_triangle
            self._arrow.size = units.top_triangle.size
            self._content.y = arrow_pos.y + self._arrow.height
        else
            self._arrow.unit = units.bottom_triangle
            self._arrow.size = units.bottom_triangle.size
            self._content.y = arrow_pos.y - self._content.height
        end 
        self._arrow.pos = arrow_pos
        self._content.x = self._arrow.x + self._arrow.width/2 - self._content.width/2 

        self._page_index = 1
        self._left_arrow_item.visible = false
        self._right_arrow_item.visible = false 
        for i,v in ipairs(self._items) do
            v.label:update(false)
            if self._items[i-1] then
                v.pos = Point(self._items[i-1].x + self._items_size[i-1].x + self._space   ,0 )
            end
            v.visible = true
            v.size_hint = self._items_size[i]
            v:update_constraints()
        end
        self._items_width = self._items_size[#self._items_size].x  + self._items[#self._items].x
        self._content.size = Point(self._items_width,self._items_size[#self._items_size].y)
        if #self._items  == 1 then
            self._items[1].v_border = {10,10,10,10}
        elseif #self._items ~= 0 then
            self._items[1].v_border = {10,10,0,10}
            self._items[#self._items].v_border = {0,10,10,10} 
        end 
        self:_split_page()
        if self._content.x < self._label_line_height then
            self._content.x = self._label_line_height
        end
        if self._content.x + self._content.width > root_width - self._label_line_height then
            self._content.x = root_width - self._label_line_height - self._content.width
        end
    end,
    update_menu = function ( self )
        if self._arrow_direction == kMenuControllerArrowUp then
            self._arrow.unit = units.top_triangle
            self._arrow.size = units.top_triangle.size
        elseif self._arrow_direction == kMenuControllerArrowLeft then
            self._arrow.unit = units.left_triangle
            self._arrow.size = units.left_triangle.size
        elseif self._arrow_direction == kMenuControllerArrowRight then
            self._arrow.unit = units.right_triangle
            self._arrow.size = units.right_triangle.size
        else
            self._arrow.unit = units.bottom_triangle
            self._arrow.size = units.bottom_triangle.size
        end
    end,
    _split_page = function ( self )
        if self._content.width > Window.instance().drawing_root.width - 2*self._label_line_height then
            self._page_item = {}
            local length = 0
            -- 下一页至少留两个
            local index = #self._items - 2
            for i=1,#self._items - 2 do
                local temp = length + self._items_size[i].x + self._space
                if temp < Window.instance().drawing_root.width - 2*self._label_line_height then
                    length = temp
                    index = i
                else
                    index = i-1
                    break
                end
            end
            length = 0
            self._page_item[1] = {}
            for i=1,index do
                length = length + self._items_size[i].x + self._space
                table.insert(self._page_item[1],self._items[i])
            end
            self._right_arrow_item.pos = Point(length,0)
            self._right_arrow_item.visible = true
            self._right_arrow_item.state = "normal"
            self._content.size = Point(length + self._right_arrow_item_width,self._content.height)
            length = 0
            self._page_item[2] = {}
            for i=index + 1,#self._items do
                self._items[i].visible = false
                local temp = length + self._items_size[i].x + self._space
                if temp < self._content.width - 2*(self._left_arrow_item_width) then
                    length = temp
                else
                    length = self._items_size[i].x + self._space
                    self._page_item[#self._page_item + 1] = {}
                end
                table.insert(self._page_item[#self._page_item],self._items[i])
            end
            for i=2,#self._page_item do
                for key,value in ipairs(self._page_item[i]) do
                    value.width_hint = (self._content.width - 2 * (self._right_arrow_item_width) - (#self._page_item[i] + 1)*self._space)/#self._page_item[i]
                    value.v_border = {0,10,0,10}
                    value.x = value.width_hint *(key - 1) + self._space * key + self._right_arrow_item_width 
                    local size_hint = value.size_hint
                    value:update_constraints()
                    Clock.instance():schedule_once(function ( ) 
                        Clock.instance():schedule_once(function (  ) 
                            Clock.instance():schedule_once(function (  )
                             value.size_hint = size_hint value:update_constraints() 
                             -- print("size_hint",size_hint)
                             end) end) end) end
            end
        end
    end,
    set_menu_items = function ( self ,value )
        for k,v in ipairs(self._items) do
            v:remove_from_parent()
            v = nil
        end
        self._items = {}
        self._items_size = {}
        for i,v in ipairs(value) do
            local item = MenuItem{
                title  = v.title,
                action = v.action,
            }
            item.label:update(false)
            table.insert(self._items,item)
            table.insert(self._items_size,Point(self._items[i].label.width + self._items[i].margin[1] +self._items[i].margin[3],self._items[#self._items].label.height + self._items[#self._items].margin[2] +self._items[#self._items].margin[4]))
            if self._items[i-1] then
                self._items[i].pos = Point(self._items[i-1].x + self._items_size[i-1].x + self._space  ,0 )
            end
            self._content:add(self._items[i])
        end
        self._items_width = self._items_size[#self._items_size].x + self._items[#self._items].x
        self._content.size = Point(self._items_width,self._items_size[#self._items_size].y)
        if #self._items  == 1 then
            self._items[1].v_border = {10,10,10,10}
        elseif #self._items ~= 0 then
            self._items[1].v_border = {10,10,0,10}
            self._items[#self._items].v_border = {0,10,10,10} 
        end 
    end,
    _anim_visible = function(self,status)
        self._anim:stop()
        if status then
            ui_utils.play_attr_anim(self._anim, {
            {self,"opacity", 1.0},
            }, 0.15)
        else
            ui_utils.play_attr_anim(self._anim, {
            {self,"opacity", 0},
            }, 0.15)
        end
    end,
    _prev_page = function ( self )
        for i,v in ipairs(self._page_item[self._page_index]) do
            v.visible = false
        end
        for i,v in ipairs(self._page_item[self._page_index - 1]) do
            v.visible = true
        end
        self._page_index = self._page_index - 1
        
        if self._page_index == 1 then
            self._left_arrow_item.visible = false
        else
            self._left_arrow_item.visible = true
        end
        self._right_arrow_item.state = "normal"
    end,
    _next_page = function ( self )
        for i,v in ipairs(self._page_item[self._page_index]) do
            v.visible = false
        end
        for i,v in ipairs(self._page_item[self._page_index + 1]) do
            v.visible = true
        end
        
        self._page_index = self._page_index + 1
        if self._page_index == #self._page_item then
            self._right_arrow_item.state = "disabled"
        else
            self._right_arrow_item.state = "normal"
        end
        self._left_arrow_item.visible = true
    end,
}), true)

local _share_menu_controller = nil
M.share_menu_controller = function ( )
    if not _share_menu_controller then
        _share_menu_controller = MenuController{}
    end
    return _share_menu_controller
end
local Keyboard
Keyboard = class('Keyboard',nil, {
    __init__ = function(self, args)
        Application.instance().on_keyboard = function(action, arg)
            if action == Application.KeyboardHide then
                self._keyboard_status = false
                -- if self._old_keyboard_delegate and self._old_keyboard_delegate._keyboard_event then
                --     local ret = self._old_keyboard_delegate:_keyboard_event(action, arg)
                --     self._old_keyboard_delegate = nil
                --     return ret
                -- end
                M.share_menu_controller():set_menu_visible(false,false)
            elseif action == Application.KeyboardShow then
                self._keyboard_status = true
            end
            if self._on_keyboard then
                return self._on_keyboard(action, arg)
            end
        end
        self._keyboard_status = false
    end,
    ---
    -- 键盘的状态.
    -- 默认为false,即未开启键盘。为true则键盘处于开启状态。
    -- @field [parent=#byui.Keyboard] #boolean keyboard_status 
    -- @usage
    -- byui.share_keyboard_controller().keyboard_status = false 通知系统关掉键盘.
    keyboard_status = {function ( self )
        return self._keyboard_status
    end,function ( self,v )
        if (v and not self._keyboard_status) or (not v and self._keyboard_status) then
            self._keyboard_status = v
            if v then
                Application.instance():SetKeyboardState(true)
            else
                Application.instance():SetKeyboardState(false)
            end
        end
    end},
    ---
    -- 键盘的配置.
    -- @field [parent=#byui.Keyboard] #table keyboard_config 
    -- @usage
    -- byui.share_keyboard_controller().keyboard_config = {
    --      type = Application.KeyboardTypeDecimalPad, -- 键盘的类型
    --      return_type = Application.ReturnKeySearch,   -- 键盘的返回按键的类型:
    --      appearance = Application.KeyboardAppearanceDark, -- 键盘出现的风格
    --      secure = true,                                            -- 是否为密码框
    --      auto_capitalization = Application.KeyboardAutocapitalizationTypeWords, -- 是否自动大写
    --      }
    keyboard_config = {function ( self )
        return self._keyboard_config
    end,function ( self,v )
        self._keyboard_config = v
        Application.instance():ConfigKeyboard(self._keyboard_config)
    end},
     ---
    -- 键盘事件回调.
    -- @field [parent=#byui.Keyboard] #function on_keyboard 
    -- @usage
    -- M.share_keyboard_controller().on_keyboard = function(action, arg)
    --      if action == Application.KeyboardShow then
    --          -- keyboard is shown
    --      elseif action == Application.KeyboardHide then
    --          -- keyboard is hide
    --      elseif action == Application.KeyboardInsert then
    --          -- arg is the text to be inserted
    --      elseif action == Application.KeyboardDeleteBackward then
    --          -- arg is the number of deletions.
    --      elseif action == Application.KeyboardSetMarkedText then
    --          -- arg is the marked text.
    --      end
    --end
    on_keyboard = {function ( self )
        return self._on_keyboard
    end,function ( self,v )
        self._on_keyboard = v
    end},
    keyboard_delegate = {function ( self )
        return self._keyboard_delegate
    end,function ( self,value )
        if value then
            self._old_keyboard_delegate = self._keyboard_delegate
        else
            self._old_keyboard_delegate = nil
        end
        self._keyboard_delegate = value
    end},
    ---
    -- 模拟键盘的输入事件.
    -- 会给当前有输入焦点的键盘发送模拟的键盘输入事件，从而可以自定义的输入.
    -- @function [parent=#byui.Keyboard]  insert 
    -- @param #byui.Keyboard self
    -- @param #string str 需要插入的文字.
    -- @usage
    -- M.share_keyboard_controller():insert('hello')
    insert = function ( self,str )
        str = str or ''
        assert(type(str) == 'string',"the 'str' must be string (a " .. type(str) .. " value )")
        if Application.instance().on_keyboard then
            Application.instance().on_keyboard(Application.KeyboardInsert,str)
            return true
        end
        return false
    end,
    ---
    -- 模拟键盘的删除事件.
    -- 会给当前有输入焦点的键盘发送模拟的键盘删除事件，在最后的光标处向前删除.
    -- @function [parent=#byui.Keyboard]  delete 
    -- @param #byui.Keyboard self
    -- @param #number count 需要删除的字符个数.默认为1.
    -- @usage
    -- M.share_keyboard_controller():delete()
    delete = function ( self,count )
        count = count or 1
        assert(type(count) == 'number',"the 'count' must be number (a " .. type(count) .. " value )")
        if Application.instance().on_keyboard then
            Application.instance().on_keyboard(Application.KeyboardDeleteBackward,count)
            return true
        end
        return false
    end,
})
local _share_keyboard_controller = nil

---
-- 键盘控制类的实例.
-- @function [parent=#byui] share_keyboard_controller
-- @return #byui.Keyboard 返回键盘控制的实例.
-- @usage 
-- local byui = require 'byui.basic'
-- byui.share_keyboard_controller().keyboard_status = true  开启键盘
-- byui.share_keyboard_controller().on_keyboard = function(action, arg) -- 设置键盘回调事件
--      if action == Application.KeyboardShow then
--          -- keyboard is shown
--      elseif action == Application.KeyboardHide then
--          -- keyboard is hide
--      elseif action == Application.KeyboardInsert then
--          -- arg is the text to be inserted
--      elseif action == Application.KeyboardDeleteBackward then
--          -- arg is the number of deletions.
--      elseif action == Application.KeyboardSetMarkedText then
--          -- arg is the marked text.
--      end
--end
--byui.share_keyboard_controller().keyboard_config = {
--      type = Application.KeyboardTypeDecimalPad, -- 键盘的类型
--      return_type = Application.ReturnKeySearch,   -- 键盘的返回按键的类型:
--      appearance = Application.KeyboardAppearanceDark, -- 键盘出现的风格
--      secure = true,                                            -- 是否为密码框
--      auto_capitalization = Application.KeyboardAutocapitalizationTypeWords, -- 是否自动大写
--      }
--
M.share_keyboard_controller = function ( )
    if not _share_keyboard_controller then
        _share_keyboard_controller = Keyboard{}
    end
    return _share_keyboard_controller
end
return M
