local Simple = require('byui/simple_ui');
local class, mixin, super = unpack(require('byui/class'))
local anim = require('animation')
local units = require('byui/draw_res')
local AL = require('byui/autolayout')
local ui_utils = require('byui/ui_utils')
local Kinetic = require('byui/kinetic')
local utils = require('byui/utils')
local layout = require('byui/layout')


---
-- 包含了所有的滚动视图的模块.
-- @module byui.scroll
-- @extends byui#byui.scroll
-- @return #table 返回listview等类型 


local  M = {}
local ScrollBar = class('ScrollBar',BorderSprite,{
    __init__ = function (self,args)
        self.dimension = args.dimension or kVertical
        self.pos_dimension = self.dimension == kVertical and 'y' or 'x'
        self.unit = units.circle
        local tsize = self.unit.size
        self.t_border = {tsize.x/2, tsize.y/2, tsize.x/2, tsize.y/2}
        local vsize = Point(5,5)
        self.size = vsize
        self.v_border = {2.5,2.5,2.5,2.5}
        self.self_colorf = Colorf(0,0,0,0.5)
        self.zorder = 255
        self.anim = anim.Animator()
    end,
    content_size = {function ( self )
        return self._content_size
    end,function ( self,value )
        self._content_size = value
        if self.parent then
            local length = 5

            if self._content_size ~= 0 then
                length = self.parent.size[self.pos_dimension] * self.parent.size[self.pos_dimension] / self._content_size
            end
            local tmp_size = Point(5,5)
            tmp_size[self.pos_dimension] = length
            self.size = tmp_size
            if self.dimension == kVertical then
                self.pos = Point(self.parent.size.x - self.offset ,0)
            else
                self.pos = Point(0,self.parent.size.y - self.offset)
            end 
        end
    end},
    content_offset = {function ( self )
        return self._content_offset or 0
    end,function ( self,value )
        self._content_offset = value
        if self._content_size > self.parent.size[self.pos_dimension] then
            self:anim_visible(true)
            local length = (self.parent.size[self.pos_dimension])*(self.parent.size[self.pos_dimension]) / self.content_size
            local _pos = (-self._content_offset / self._content_size) * self.parent.size[self.pos_dimension]
            local tmp_size = Point(5,5)
            tmp_size[self.pos_dimension] = length

            if _pos < 0 then
                tmp_size[self.pos_dimension] = math.pow(length + _pos,3)/math.pow(length,2)
                _pos = 0 
            elseif _pos + length > self.parent.size[self.pos_dimension]   then
                tmp_size[self.pos_dimension] = math.pow(self.parent.size[self.pos_dimension]-_pos,3)/math.pow(length,2)
                _pos = self.parent.size[self.pos_dimension] - tmp_size[self.pos_dimension]
            end
            
            if tmp_size[self.pos_dimension] <= 10 then
                tmp_size[self.pos_dimension] = 10
            end 
            self.size = tmp_size
            self[self.pos_dimension] = _pos
        end
    end},
    anim_visible = function(self,status)
        if status then
            self.anim:stop()
            ui_utils.play_attr_anim(self.anim, {
            {self,"opacity", 1.0},
            }, 0.1)
        else
            self.anim:stop()
            ui_utils.play_attr_anim(self.anim, {
            {self,"opacity", 0},
            }, 0.5)
        end
    end,
    offset = {function ( self )
        return self._offset or 10
    end,function ( self,value )
        self._offset = value
        if self.dimension == kVertical then
            self.pos = Point(self.parent.size.x - self._offset ,0)
        else
            self.pos = Point(0,self.parent.size.y - self._offset)
        end
    end},
})


---
-- ScrollView，滚动视图。
-- @type byui.ScrollView
-- @extends engine#Widget 
-- @usage byui.ScrollView{dimension = kVertical,}

---
-- 创建一个ScrollView.
-- @callof #byui.ScrollView
-- @param #byui.ScrollView self 
-- @param #table args 参数列表。
--                  1.dimension:取值为kBoth,kHorizental,kVertical。表示滚动的方向。
--                  2.on_overscroll:在滚动到边沿时的回调监听。
--                  3.on_stop:滚动停止的回调监听。
--                  4.on_scroll:正常滚动的回调监听。
-- @return #byui.ScrollView 返回创建的ScrollView对象。

---
-- ScrollView，滚动视图.
-- 见@{#byui.ScrollView}。
-- @field [parent=#byui] #byui.ScrollView ScrollView 
M.ScrollView = class('ScrollView', Widget, mixin(Simple.EventHandler, {
    __init__ = function(self, args)
		super(M.ScrollView, self).__init__(self, args)
        
        ---
        -- 设置滚动方向.
        -- 可取kBoth，kHorizental，kVertical三个值，默认为kBoth
        -- @field [parent=#byui.ScrollView] #number dimension 
        self.dimension = args.dimension or kBoth        
        self._scrolling = false
        Simple.EventHandler.__init__(self, args)

        self._scroll_recognizers = {}
        self._scroll_recognizers[1] = Simple.ScrollRecognizer{
            min_distance = 10,
            callback = function(touch)
                if bit.band(self.dimension,kHorizental)  == kHorizental then
                    touch:lock(self.event_widget)
                end
            end,
            pos_dimension = 'x',
        }

        self._scroll_recognizers[2] = Simple.ScrollRecognizer{
            min_distance = 10,
            callback = function(touch)
                if bit.band(self.dimension,kVertical)  == kVertical then
                    touch:lock(self.event_widget)
                end
            end,
            pos_dimension = 'y',
        }

        self:add_recognizer(self._scroll_recognizers[1])
        self:add_recognizer(self._scroll_recognizers[2])

        self.clip = true
        self.kinetic = {}
        self.kinetic.x = Kinetic{}
        self.kinetic.y = Kinetic{}
        self.on_size_changed = function(_)
            if self.content then
                self:_on_size_changed()
            end
        end
        self.on_value_changed = function(self, h,v )
            local value = Point(math.floor(h.value), math.floor(v.value))
            local direction = value - self._content.pos
            if direction ~= Point(0,0) then
                self._scrolling = true
                self._content.pos = value
                if self._vertical_scroll_indicator and direction.y ~= 0 then
                    self._vertical_scroll_indicator.content_offset = value.y
                end
                if self._horizental_scroll_indicator and direction.x ~= 0 then
                    self._horizental_scroll_indicator.content_offset = value.x
                end
                if value.x > 0 or value.x < h.min  then
                    self:_on_overscroll(Point(value.x > 0 and value.x or value.x - h.min,0))
                elseif value.y > 0 or value.y < v.min then
                    self:_on_overscroll(Point(0,value.y > 0 and value.y or value.y - v.min))
                else
                    self:_on_overscroll(Point(0,0))
                    self:_on_scroll(value, direction, Point(h.decay.velocity,v.decay.velocity))
                end
            end
        end
        self.kinetic.x.on_value_changed = function(k)
            if bit.band(self.dimension,kHorizental)  == kHorizental then
                self:on_value_changed(self.kinetic.x,self.kinetic.y)
            end
        end
        self.kinetic.y.on_value_changed = function(k)
            if bit.band(self.dimension,kVertical)  == kVertical then
                self:on_value_changed(self.kinetic.x,self.kinetic.y)
            end
        end
        ---
        -- 当滑到边缘时的回调函数.
        -- function(self,pos)end 。
        -- @field [parent=#byui.ScrollView] #function on_overscroll 
        self.on_overscroll = args.on_overscroll
        self.on_stop = args.on_stop

        ---
        -- 滚动时的回调监听.
        -- 接受三个参数，分别为 position(内容当前滚动的位置),direction(当前滚动的方向)，velocity(当前滚动的速度)
        -- @field [parent=#byui.ScrollView] #function on_scroll
        self.on_scroll = args.on_scroll
        self.kinetic.x.on_stop = function()
            if self._horizental_scroll_indicator then self._horizental_scroll_indicator:anim_visible(false) end
            if not self.kinetic.y.decay.running then
                self:_on_stop()
            end
        end
        self.kinetic.y.on_stop = function()
            if self._vertical_scroll_indicator then self._vertical_scroll_indicator:anim_visible(false) end
            if not self.kinetic.x.decay.running then
                self:_on_stop()
            end
        end

        --
        self._focus = false

        self.min_distance = args.min_distance or Point(10,10)
    end,
    min_distance = {function ( self )
        return Point(self._scroll_recognizers[1].min_distance,self._scroll_recognizers[2].min_distance)
    end,function ( self,v )
        if not v then
            return 
        end
        self._scroll_recognizers[1].min_distance = v.x or 10
        self._scroll_recognizers[2].min_distance = v.y or 10
    end},
    _on_scroll = function(self, p, d, v)
        if self.on_scroll then
            self:on_scroll(p, d, v)
        end
    end,
    _on_overscroll = function ( self,p )
        if self.on_overscroll then
            self:on_overscroll(p)
        end
    end,
    ---
    -- 滚动的内容
    -- @field [parent=#byui.ScrollView] engine#Widget content 
    content = {function(self)
        return self._content
    end, function(self, w)
        if self._content then
            self._content:remove_from_parent()
        end
        self._content = w
        self:add(w)

        self._content.on_content_bbox_changed = function(_)
            if self._vertical_scroll_indicator then self._vertical_scroll_indicator.content_size = self._content.content_bbox.h end 
            if self._horizental_scroll_indicator then self._horizental_scroll_indicator.content_size = self._content.content_bbox.w end 
            self.kinetic.x.max = 0
            self.kinetic.y.max = 0
            if bit.band(self.dimension,kHorizental)  == kHorizental then
                self.kinetic.x.min = -(self._content.content_bbox.w - self.width)
            end
            if bit.band(self.dimension,kVertical) == kVertical then
                self.kinetic.y.min = -(self._content.content_bbox.h - self.height)
            end
        end

        self._content:on_content_bbox_changed()
    end},
    on_touch_down = function(self, p, t)
        if not self.content then
            return
        end
        if Simple.share_menu_controller()._menu_visible then
            Simple.share_menu_controller():set_menu_visible(false,false)
        elseif self.focus then
            Simple.share_keyboard_controller().keyboard_status = false
            ui_utils.set_focus(nil)
        end
        self.need_capture = self._scrolling
        if bit.band(self.dimension,kHorizental)  == kHorizental then
            self.kinetic.x.value = self._content.x
            self.kinetic.x:start(p.x, t)
        end
        if bit.band(self.dimension,kVertical) == kVertical then
            self.kinetic.y.value = self._content.y
            self.kinetic.y:start(p.y, t)
        end
    end,
    on_touch_move = function(self, p, t)
        if not self.content then
            return
        end
        if bit.band(self.dimension,kHorizental) == kHorizental then
            self.kinetic.x:update(p.x, t)
        end
        if bit.band(self.dimension,kVertical) == kVertical then
            self.kinetic.y:update(p.y, t)
        end
    end,
    on_touch_up = function(self, p, t)
        if not self.content then
            return
        end
        if bit.band(self.dimension,kHorizental) == kHorizental then
            self.kinetic.x:stop(p.x, t)
        end
        if bit.band(self.dimension,kVertical) == kVertical then
            self.kinetic.y:stop(p.y, t)
        end
    end,
    on_touch_cancel = function(self, p, t)
        if not self.content then
            return
        end
        if bit.band(self.dimension,kHorizental) == kHorizental then
            self.kinetic.x:cancel()
        end
        if bit.band(self.dimension,kVertical) == kVertical then
            self.kinetic.y:cancel()
        end
        
        if self._horizental_scroll_indicator then 
            self._horizental_scroll_indicator:anim_visible(false) 
        end
        if self._vertical_scroll_indicator then 
            self._vertical_scroll_indicator:anim_visible(false) 
        end
    end,
    ---
    -- 滚动视图到指定的位置.
    -- @function [parent=#byui.ScrollView] scroll_to
    -- @param engine#Point target 滚动到的目标位置。
    -- @param #number duration 滚动所需要的时间，默认值为0.25
    -- @param #function callback 本次scroll_to结束后的回调，如果此回调存在，则会执行完此回调后再执行 @{#byui.ScrollView.on_stop} 的回调。**每一次的scroll_to 回调会在回调函数执行后自动销毁，并不会被保存**。
    scroll_to = function(self, target,duration,callback)
        self.kinetic.x:scroll_to(target.x,duration)
        self.kinetic.y:scroll_to(target.y,duration)    
        self._scroll_to_callback = callback
    end,
    ---
    -- 滚动视图到底部.
    -- @function [parent=#byui.ScrollView] scroll_to_bottom
    -- @param #number duration 滚动所需要的时间，默认值为0.25
    -- @param #function callback 参见 @{#byui.ScrollView.scroll_to}
    scroll_to_bottom = function(self,duration,callback)
        self.kinetic.y:scroll_to(self.kinetic.y.min,duration,callback)    
    end,
    ---
    -- 滚动视图到顶部.
    -- @function [parent=#byui.ScrollView] scroll_to_top
    -- @param #number duration 滚动所需要的时间，默认值为0.25
    -- @param #function callback 参见 @{#byui.ScrollView.scroll_to}
    scroll_to_top = function(self,duration,callback)
        self.kinetic.y:scroll_to(self.kinetic.y.max,duration,callback)
    end,
    ---
    -- 滚动视图到最左边.
    -- @function [parent=#byui.ScrollView] scroll_to_left
    -- @param #number duration 滚动所需要的时间，默认值为0.25
    -- @param #function callback 参见 @{#byui.ScrollView.scroll_to}
    scroll_to_left = function(self,duration,callback)
        self.kinetic.x:scroll_to(self.kinetic.x.max,duration,callback)
    end,
    ---
    -- 滚动视图到最右边.
    -- @function [parent=#byui.ScrollView] scroll_to_right
    -- @param #number duration 滚动所需要的时间，默认值为0.25
    -- @param #function callback 参见 @{#byui.ScrollView.scroll_to}
    scroll_to_right = function(self,duration,callback)
        self.kinetic.x:scroll_to(self.kinetic.x.min,duration,callback)
    end,
    ---
    -- 显示垂直滚动条.
    -- 只有@{#byui.ScrollView.content}存在时才能生效。
    -- @field [parent=#byui.ScrollView] #boolean shows_vertical_scroll_indicator 
    shows_vertical_scroll_indicator = {function( self)
        return self.__shows_vertical_scroll_indicator
    end,function ( self ,v )
        if v then
            self.__shows_vertical_scroll_indicator = true
            if not self._vertical_scroll_indicator then
                self._vertical_scroll_indicator = ScrollBar{dimension = kVertical }
                self._vertical_scroll_indicator.opacity = 0.0
                self:add(self._vertical_scroll_indicator)
                if self._content then
                    self._vertical_scroll_indicator.content_size = self._content.content_bbox.h
                end
            end
        else
            self.__shows_vertical_scroll_indicator = false
            if self._vertical_scroll_indicator then
                self._vertical_scroll_indicator:remove_from_parent()
                self._vertical_scroll_indicator = nil
            end
        end
    end
    },
    ---
    -- 显示水平滚动条.
    -- 只有@{#byui.ScrollView.content}存在时才能生效。
    -- @field [parent=#byui.ScrollView] #boolean shows_horizental_scroll_indicator 
    shows_horizental_scroll_indicator = {function( self)
        return self.__shows_horizental_scroll_indicator
    end,function ( self ,v )
        if v then
            self.__shows_horizental_scroll_indicator = true
            if not self._horizental_scroll_indicator then
                self._horizental_scroll_indicator = ScrollBar{dimension = kHorizental }
                self._horizental_scroll_indicator.opacity = 0.0
                self:add(self._horizental_scroll_indicator)
                if self._content then
                    self._horizental_scroll_indicator.content_size = self._content.content_bbox.w
                end
            end
        else
            self.__shows_horizental_scroll_indicator = false
            if self._horizental_scroll_indicator then
                self._horizental_scroll_indicator:remove_from_parent()
                self._horizental_scroll_indicator = nil
            end
        end
    end
    },
    ---
    -- 滚动停止时的回调.
    -- @field [parent=#byui.ScrollView] #function on_stop 
    _on_stop = function(self)
        self._scrolling = false
        self.need_capture = false
        if self._scroll_to_callback then
            self:_scroll_to_callback()
            self._scroll_to_callback = nil
        end
        if self.on_stop then
            self:on_stop()
        end
    end,
    _on_size_changed = function ( self )
        if self._vertical_scroll_indicator then self._vertical_scroll_indicator.content_size = self._content.content_bbox.h end 
        if self._horizental_scroll_indicator then self._horizental_scroll_indicator.content_size = self._content.content_bbox.w end 
        self.kinetic.y.min = -(self._content.content_bbox.h - self.height)
        self.kinetic.x.min = -(self._content.content_bbox.w - self.width)
    end,
    ---
    -- 设置是否吞噬键盘输入事件.
    -- @field [parent=#byui.ScrollView] #boolean focus
    focus = {function ( self )
        return self._focus 
    end,function ( self ,v)
        self._focus = v
    end},
    ---
    -- 设置滚动的速度系数.
    -- 默认值为1，系数越高滚动的速度越快，系数越低，滚动的速度越慢。
    -- @field [parent=#byui.ScrollView] #number velocity_factor
    velocity_factor = {function ( self )
        return self._velocity_factor or 1 
    end,function ( self,value )
        self.kinetic.y.velocity_factor = value
        self.kinetic.x.velocity_factor = value
    end},
    ---
    -- 设置边缘回弹的阻尼系数.
    -- 默认值为0.02，系数越低滚动的内容离开边缘的距离越远。
    -- @field [parent=#byui.ScrollView] #number viscosity
    viscosity = {function ( self )
        return self._viscosity or 1/20 
    end,function ( self,value )
        self.kinetic.y.viscosity = value
        self.kinetic.x.viscosity = value
    end},
    on_exit = function ( self )
        self.kinetic.x:cancel()
        self.kinetic.y:cancel()
    end,
    ---
    -- 当前ScorllView 是否有滚动.
    -- 当ScorllView在滚动时返回true,静止时返回false。
    -- @field [parent=#byui.ScrollView] #boolean is_scrolling
    is_scrolling = {function ( self )
        return self._scrolling
    end}
}))


-- attribute
--      max_number
--
-- data source delegate
--      create_cell
--

---
-- 翻页滚动视图.
-- 继承自@{#byui.ScrollView}。
-- @type byui.PageView
-- @extends byui#byui.ScrollView
-- @usage local pageview = byui.PageView{dimension = kVertical}

---
-- 创建一个PageView.
-- @callof #byui.PageView
-- @param #byui.PageView self 
-- @param #table args 参数列表。
--                  1.dimension:取值为kHorizental,kVertical。表示滚动的方向。
--                  2.max_number:显示的最大页面数量。
--                  3.create_cell:创建item的函数。
--                  4.size:PageView的大小。
-- @return #byui.PageView 返回创建的PageView对象.

---
-- 翻页滚动视图.
-- 见@{#byui.PageView}。
-- @field [parent=#byui] #byui.PageView PageView 
M.PageView = class('PageView', M.ScrollView, {
    __init__ = function(self, args)
        args.dimension = args.dimension == kHorizental and kHorizental or kVertical 
        super(M.PageView, self).__init__(self, args)
        self.pos_dimension = args.dimension == kVertical and 'y' or 'x'
        self.container = Widget()

        self.container.relative = true
        self.content = self.container
        self.content:add_rules(AL.rules.fill_parent)
        -- item manage
        self.max_number = args.max_number or 1 
        self.create_cell = args.create_cell
        self._cached_items = {}

        
        self.__page_num = 1
        -- load first and second page

        self.__begin_change = false

        self.is_cache = args.is_cache 
        
        self.size = args.size or Point(0,0)
    end,
    ---
    -- 创建item的回调函数.
    -- function(data) -- block return　Widget end<br/>
    -- 会接收一个数据参数，需要返回一个widget对象。
    -- @field [parent=#byui.PageView] #function create_cell
    create_cell = {function ( self )
        return self._create_cell
    end,function ( self,value )
        self._create_cell = value
    end},
    ---
    -- 更新数据后主动通知PageView去更新.
    -- @function [parent=#byui.PageView] update_data
    -- @param #byui.PageView self 
    update_data = function ( self )
        if self.is_cache then
            for i=1,self.max_number do
                self:__create_view(i)
            end
        else
            self.page_num = self.page_num
        end
    end,
    ---
    -- 最大页面数.
    -- @field [parent=#byui.PageView] #number max_number 
    max_number = {function(self)
        return self._max_number
    end, function(self, v)
        if self._max_number ~= v then
            self._max_number = v
            if self.dimension == kVertical then
                self.container.size = Point(self.size.x, self.max_number * self.size[self.pos_dimension])
            else
                self.container.size = Point(self.max_number * self.size[self.pos_dimension], self.size.y)
            end
        end
    end},
    ---
    -- 当前显示的页面.
    -- @field [parent=#byui.PageView] #number page_num 
    page_num = {function ( self )
        return self.__page_num
    end,function ( self , v )
        if v >= self.max_number then
            v = self.max_number
        elseif v < 1 then
            v = 1
        end
        self.__page_num = math.ceil(v)    
        local target = Point(0,0)
        target[self.pos_dimension] = -(self.__page_num - 1) * self.size[self.pos_dimension]
        self.__begin_change = true
        super(M.PageView, self):scroll_to(target,0.5) 
        if self._cached_items[self.__page_num] == nil then
            for i=self.page_num -1,self.page_num + 1 do
                if self._cached_items[i] == nil then
                    self:__create_view(i)  
                end
            end
        end
    end
    },
    ---
    -- 显示上一页.
    -- @function [parent=#byui.PageView] prev_page
    -- @param #byui.PageView self 
    prev_page = function ( self )
        if  self.page_num == 1 then
            return 
        end
        self:__create_view(self.page_num - 2)  
        self:__free_view(self.page_num + 1)
        self.page_num = self.page_num -1
    end,
    ---
    -- 显示下一页.
    -- @function [parent=#byui.PageView] next_page
    -- @param #byui.PageView self 
    next_page = function ( self )
        if  self.page_num == self.max_number then
            return 
        end
        self:__create_view(self.page_num + 2)
        self:__free_view(self.page_num -1)
        self.page_num = self.page_num + 1
    end,
    __create_view = function ( self,idx )
        if idx > 0 and idx <= self.max_number and self._cached_items[idx] == nil then
            local cell = self:create_cell(idx)
            cell.size = self.size 
            cell[self.pos_dimension] = (idx-1) * (self.size[self.pos_dimension])
            self._cached_items[idx] = cell
            self.container:add(cell)
        end
    end,
    __free_view = function ( self,idx )
        if self._cached_items[idx] ~= nil and not self.is_cache then
            self._cached_items[idx]:remove_from_parent()
            self._cached_items[idx] = nil
        end
    end,
    on_touch_up = function ( self, p,t )
        -- body
        super(M.PageView, self).on_touch_up(self,p,t)
        if  math.abs(self.kinetic[self.pos_dimension].velocity) > 100 then
            if self.kinetic[self.pos_dimension].velocity > 0 then
                self:prev_page()
            else
                self:next_page()
            end
        else
            if math.ceil(self.kinetic[self.pos_dimension].value / -self.size[self.pos_dimension] + 0.5)   < self.page_num then
                self:prev_page()
            elseif math.ceil(self.kinetic[self.pos_dimension].value / -self.size[self.pos_dimension]+ 0.5) > self.page_num then
                self:next_page()
            else
                self.page_num = self.page_num
            end
        end
    end,
    _on_size_changed = function ( self )
        super(M.PageView, self)._on_size_changed(self)
        if self.pos_dimension == kVertical then
            self.content.size = Point(self.width,self.height*self.max_number)
        else 
            self.content.size = Point(self.width*self.max_number,self.height)
        end
        if self.is_cache then
            for i=1,self.max_number do
                if self._cached_items[i] ~= nil then
                    self._cached_items[i].size = self.size
                    self._cached_items[i][self.pos_dimension] = (i-1) * (self.size[self.pos_dimension])
                end
            end
        else
            for i=self.page_num -1,self.page_num + 1 do
                if self._cached_items[i] ~= nil then
                    self._cached_items[i].size = self.size
                    self._cached_items[i][self.pos_dimension] = (i-1) * (self.size[self.pos_dimension])
                end
            end
        end
        
    end,
    _on_page_change = function (self)
        ---
        -- 监听页面变化.
        -- 当显示的页面发生改变时会回调此方法，传递当前的页面.当滚动到不同页面或者手动的跳转到某一页都会引起此回调的变化.
        -- @field [parent=#byui.PageView] #function on_page_change 
        -- @usage 
        -- function page_view:on_page_change( value )
        --        print("当前显示的页面",value)
        -- end
        if self.on_page_change then
            self:on_page_change(self.page_num)
        end
    end,
    _on_stop = function ( self )
        super(M.PageView, self)._on_stop(self)
        if self.__begin_change then
            self.__begin_change = false
            self:_on_page_change()
        end
    end
})

-- attribute
--      current_page
--      number_of_pages

---
-- 控制PageView控件.
-- 可以显示小圆点来提示现在PageView所在的页面以及页面的总数。
-- @type byui.PageControl
-- @extends engine#Widget

---
-- 创建一个PageControl.
-- @callof #byui.PageControl
-- @param #byui.PageControl self 
-- @param #table args 参数列表。
--                  1.dimension:取值为kHorizental,kVertical。表示滚动的方向。
--                  2.number_of_pages:页面的数量。
--                  3.hides_for_single_page:只有一个页面时是否自动隐藏。
-- @return #byui.PageControl 返回创建的PageControl对象.

---
-- 控制PageView控件.
-- 见@{#byui.PageControl}。
-- @field [parent=#byui] #byui.PageControl PageControl 
M.PageControl = class('PageControl', Widget, mixin(Simple.EventHandler,{
    __init__ = function(self, args)
        super(M.PageControl, self).__init__(self, args)
        ---
        -- 需要控制的PageView的滚动方向.
        -- 可取kVertical,kHorizental。
        -- @field [parent=#byui.PageControl] #number
        self.dimension = args.dimension  or kVertical 
        self.pos_dimension = self.dimension == kVertical and 'y' or 'x'
        self._page_view  = args.page_view 
        
        self._page_indicator_tint_color = args.page_indicator_tint_color or Colorf(0.5,0.5,0.5,0.5)
        self._current_page_indicator_tint_color = args.current_page_indicator_tint_color or Colorf(1.0,1.0,1.0,1.0)
        self._images = {}
        self._images[1] = Simple.Image(self._page_indicator_tint_color)
        self._images[2] = Simple.Image(self._current_page_indicator_tint_color)


        self._items = {}
        self.number_of_pages = args.number_of_pages or 0
        self._hides_for_single_page = args.hides_for_single_page or false
        Simple.EventHandler.__init__(self, args)
        
        self.on_size_changed = function ( _ )
            for i,v in ipairs(self._items) do
                local temp_pos = Point(14,14)
                temp_pos[self.pos_dimension] = (i-1)*15 + 4
                v.pos = temp_pos
                v[self.pos_dimension] = v[self.pos_dimension]  + (self.size[self.pos_dimension] - self.number_of_pages * 15)/2
            end
        end
    end,
    _create_items = function ( self )
        for i,v in ipairs(self._items) do
            v:remove_from_parent()
            v = nil
        end
        for i=1,self.number_of_pages do
            local item = Sprite()
            item.size = Point(8,8)
            local temp_pos = Point(14,14)
            temp_pos[self.pos_dimension] = (i-1)*15 + 4
            item.pos = temp_pos
            self._images[1]:apply(item)
            item.v_border = {4, 4, 4, 4}
            self._items[i] = item
            self:add(item)
        end
        if self._items[self._current_page] then
            self._images[2]:apply(self._items[self._current_page])
        end
    end,
    ---
    -- 当前显示的页面.
    -- @field [parent=#byui.PageControl] #number current_page 
    current_page = {function ( self )
        return self._current_page or 1
    end,function ( self,value )
        assert(value >= 1 and value <= self.number_of_pages,"current_page is error ")
        if self._current_page ~= value then
            self._images[1]:apply(self._items[self._current_page])
            self._current_page =  value
            self._images[2]:apply(self._items[self._current_page])
        end
    end},
    ---
    -- 页面的总数.
    -- @field [parent=#byui.PageControl] #number number_of_pages 
    number_of_pages = {function ( self )
        return self._number_of_pages
    end,function ( self,value )
        if self._number_of_pages ~= value then
            self._number_of_pages = value
            self._current_page = self._current_page or 1
            self:_create_items()
        end 
    end},
    ---
    -- 只有一个页面时是否自动隐藏.
    -- @field [parent=#byui.PageControl] #boolean hides_for_single_page 
    hides_for_single_page = {function ( self )
        return self._hides_for_single_page 
    end,function ( self,value )
        self._hides_for_single_page = value
        if self.number_of_pages == 1 and self._hides_for_single_page then
            self._items[1].visible = false
        elseif self.number_of_pages > 1 or not self._hides_for_single_page then
            self._items[1].visible = true
        end
    end},
    on_touch_down = function ( self,p,t )
        self.need_capture = true
    end,
    on_touch_move = function ( self,p,t )
    end,
    on_touch_up = function ( self,p,t )
        local point = self:from_world(p)
        if self._page_view then
            if point[self.pos_dimension] < self._items[self._current_page][self.pos_dimension] then
                self._page_view:prev_page()
            else
                self._page_view:next_page()
            end
        end
    end,
    on_touch_cancel = function (self,p,t )
    end,
}))

---
-- ListView，单列滚动容器.
-- 继承自@{#byui.ScrollView}。
-- @type byui.ListView
-- @extends byui#byui.ScrollView
-- @usage byui.ListView{dimension = kVertical,
--                      cell_spacing = 5,
--                      }


---
-- 创建一个ListView.
-- @callof #byui.ListView
-- @param #byui.ListView self 
-- @param #table args 参数列表。
--                  1.dimension:取值为kHorizental,kVertical。表示滚动的方向。
--                  2.cell_spacing:item的间距。
--                  3.create_cell:创建item的函数。
--                  4.size:ListView的大小。
--                  5.update_cell:更新item的函数。
--                  6.data:创建item的数据。
-- @return #byui.ListView 返回创建的ListView对象.

---
-- ListView，滚动视图.
-- 见@{#byui.ListView}。
-- @field [parent=#byui] #byui.ListView ListView 
local _top_rules = {AL.top:eq(0), AL.left:eq(0)}
local _bottom_rules = {AL.right:eq(AL.parent('width')), AL.bottom:eq(AL.parent('height'))}
M.ListView = class('ListView', M.ScrollView, {
    __init__ = function(self, args)
        args.dimension = args.dimension == kHorizental and kHorizental or kVertical 
        super(M.ListView, self).__init__(self, args)
        self.pos_dimension = args.dimension == kVertical and 'y' or 'x'
        self.container = layout.FloatLayout{spacing = Point(0,0),dimension = args.dimension}
        self.container.relative = true
        self.content = self.container
        self.content:add_rules(AL.rules.fill_parent)

        -- item manage
        self.row_height = args.row_height
        self.cell_spacing = args.cell_spacing or 0
        


        self.data = args.data or {}
        ---
        -- 创建item的回调函数.
        -- function(data) -- block return　Widget end<br/>
        -- 会接收一个数据参数，需要返回一个widget对象。
        -- @field [parent=#byui.ListView] #function create_cell
        self.create_cell = args.create_cell
        
        
        ---
        -- 更新item的回调函数.
        -- function(item ,data) -- block end<br/>
        -- 会接收一个需要更新的item和更新后的数据。你调用@{#byui.ListView.update} 时会触发，如果@{#byui.ListView.update_cell}
        -- 不存在则会删除之前的item调用@{#byui.ListView.create_cell}
        -- @field [parent=#byui.ListView] #function update_cell
        self.update_cell = args.update_cell
        
        
        ---
        -- 用于下/右拉刷新时添加UI的顶部/左边容器.
        -- @field [parent=#byui.ListView] engine#Widget top_view
        self.top_view = Widget()
        self.top_view.visible = false
        self:add(self.top_view)

        ---
        -- 用于上/左拉刷新时添加UI的底部/右边容器.
        -- @field [parent=#byui.ListView] engine#Widget bottom_view
        self.bottom_view = Widget()
        self.bottom_view.visible = false
        self:add(self.bottom_view)
        
        
        self.distance_to_refresh = args.distance_to_refresh or 0

        self.top_view:add_rules(_top_rules)
        self.bottom_view:add_rules(_bottom_rules)

        self.size = args.size or Point(0,0)
---
-- 刷新事件回调函数.
-- function(flag)end<br/>
-- 当falg == true 是表示下拉刷新，当flag == false时表示上拉刷新
-- @field [parent=#byui.ListView] #function on_refresh .

    end,
    _init_view = function ( self )
        if self.data then
            for i=1,#self.data do
                local cell = self:get_view(i)
                assert(cell,'item of '..i.. 'does not exist')
                self.container:add(cell)
            end
        end
    end,
    ---
    -- item之间的间隔. 
    -- number类型，可读可写
    -- @field [parent=#byui.ListView] #number cell_spacing  

    cell_spacing = {function(self)
        return self._item_space
    end,function (self,value)
        if self._item_space ~= value then
            self._item_space = value
            local space_temp = Point(0,0)
            space_temp[self.pos_dimension] = value
            self.container.spacing = space_temp
        end
    end},
    _on_changed_data = function ( self )
        -- 数据改变时回调
        self.container:remove_all()
        self:_init_view()
    end,
    _on_update_data = function ( self ,index,data_item)
        -- 更新数据时回调
        local item = self.container.children[index]
        if self.update_cell then
            self.update_cell(item,data_item)
        else
            self.container:remove(item)
            self:_on_insert_data(index)
        end
    end,
    _on_delete_data = function ( self,index )
        -- body
        local item = self.container.children[index]
        if item then
            self.container:remove(item)
        end
    end,
    _on_insert_data = function ( self,index )
        local cell = self:get_view(index)
        assert(cell ~= nil,'item of '..index.. 'does not exist')
        local refer_cell = self.container.children[index]
        self.container:add(cell,refer_cell)
    end,
    ---
    -- listview的数据. 
    -- table类型，可读可写
    -- @field [parent=#byui.ListView] #table data 
    data = {function (self)
        return self._data
    end,function(self,value)
        assert(value ~= nil,'the data is nil.')
        assert(type(value) == 'table','the data type must be a table.')
        self._data = value
        self:_on_changed_data()
    end},
    ---
    -- listview的更新数据接口. 
    -- 如果@{#byui.ListView.update_cell} 存在则会调用此方法，否则会调用@{#byui.ListView.create_cell}。
    -- @function [parent=#byui.ListView] update_item
    -- @param #byui.ListView self 
    -- @param #number index 指定需要更新的item索引
    -- @param #table data_item 新数据
    -- @usage local listview = byui.ListView{}
    --        listview:update_item(1,{height = 100})
    update_item = function (self,index,data_item)
        assert(index > 0 and index <= self.cell_size,"invalid index:" .. tostring(index))
        self.data[index] = data_item
        self:_on_update_data(index,data_item)
    end,
    ---
    -- listview的删除数据接口.
    -- 你可以删除一条listview里面的数据，从而删除对应的item，listview会自动重新排布item。
    -- @function [parent=#byui.ListView] delete
    -- @param #byui.ListView self 
    -- @param #number index 指定需要删除的索引
    -- @usage local listview = byui.ListView{}
    --        listview:delete(1)
    delete = function ( self,index )
        assert(index > 0 and index <= self.cell_size,"invalid index:" .. tostring(index))
        table.remove(self.data,index)
        self:_on_delete_data(index)
    end,
    ---
    -- listview的插入数据接口.
    -- 你可以删除一条listview里面的数据，从而删除对应的item，listview会自动重新排布item。
    -- @function [parent=#byui.ListView] delete
    -- @param #byui.ListView self 
    -- @param #number index 指定需要插入的索引
    -- @usage local listview = byui.ListView{}
    --        listview:delete(1)
    insert = function ( self,item,index)
        if #self.data ~= 0 then
            assert(index == nil or (index > 0 and index <= self.cell_size),"invalid index:" .. tostring(index))
        end
        if index then
            table.insert(self.data,index,item)
        else
            table.insert(self.data,item)
            index = #self.data
        end
        self:_on_insert_data(index)
    end,
    get_view = function ( self,index )
        assert(self.data[index] ~= nil and type(self.data[index]) == 'table',"the data of ".. tostring(index) .." is invalid." )
        local widget = self.create_cell(self.data[index],index)
        -- widget:initId()
        return widget
    end,
    on_touch_down = function ( self, p, t )
        -- body
        super(M.ListView, self).on_touch_down(self,p,t)
        self._refresh_length = 0
    end,
    on_touch_up = function ( self, p, t)
        -- body
        super(M.ListView, self).on_touch_up(self,p,t)
        if self._refresh_length > 0 then
            if self._refresh_length > self.distance_to_refresh then
                self.top_view.visible = true
                self.kinetic[self.pos_dimension].max = self.distance_to_refresh
                if self.on_refresh then
                    self.refresh_mode = true
                    self._length = self.cell_size
                    self.on_refresh(self.refresh_mode)
                end
            end
        elseif self._refresh_length < 0 then
            if math.abs(self._refresh_length) > self.distance_to_refresh then
                self.bottom_view.visible = true
                self._real_min = -(self._content.content_bbox.w - self.width)
                if self.pos_dimension == 'x' then
                    self._real_min = -(self._content.content_bbox.w - self.width)
                else
                    self._real_min = -(self._content.content_bbox.h - self.height)
                end
                self.kinetic[self.pos_dimension].min = self._real_min - self.distance_to_refresh
                if self.on_refresh then
                    self.refresh_mode = false
                    self._length = self.cell_size
                    self.on_refresh(self.refresh_mode)
                end
            end
        end

    end,
    _on_overscroll = function ( self,p)
        -- body
        self._refresh_length = p[self.pos_dimension]
        super(M.ListView,self)._on_overscroll(self,p)
    end,
    ---
    -- 触发刷新的阀值.
    -- number类型，可读可写。
    -- @field [parent=#byui.ListView] #number distance_to_refresh
    distance_to_refresh = {function ( self )
        return self._distance_to_refresh or 0
    end,function ( self,value )
        if not self._scrolling then
            self._distance_to_refresh = value > 0 and value or 0
            local temp_size = self.size
            temp_size[self.pos_dimension] = self._distance_to_refresh
            
            self.top_view.size_hint = temp_size
            self.bottom_view.size_hint = temp_size
        end
    end},
    _on_size_changed = function ( self )
        super(M.ListView, self)._on_size_changed(self)
        local temp_size = self.size

        temp_size[self.pos_dimension] = self.distance_to_refresh
        
        self.top_view.size_hint = temp_size
        self.bottom_view.size_hint = temp_size

    end,
    ---
    -- 清除刷新状态
    -- 在@{#byui.ListView.on_refresh}调用完后你应该调用此方法，清除Listview的刷新状态。
    -- @function [parent=#byui.ListView] refresh_end
    -- @param #byui.ListView self 
    -- @param #number time 在刷新结束时未插入数据时生效，如果未插入数据，time表示内容恢复回正常状态的时间。默认时间为0.25s。
    -- <p>
    -- <table align="justify" style="border-spacing: 20px 5px; border-collapse: separate">
    -- <tr>
    --     <td align="center" style="border-style: none;">self:refresh_end(0.25)</td>
    --     <td align="center" style="border-style: none;">self:refresh_end(0.0)</td></tr>
    -- <tr>
    -- <td><img height="564" width="426" src="http://engine.by.com:8080/hosting/data/1476243236361_4125995731407480904.gif"></td>
    -- <td><img height="564" width="426" src="http://engine.by.com:8080/hosting/data/1476243256610_2045987965875567317.gif"></td>
    -- </tr>
    -- </table>
    -- </p> 
    refresh_end = function ( self ,time)
        self.top_view.visible = false
        self.bottom_view.visible = false

        time = tonumber(time) or 0.25

        self.enabled = true
        if self.refresh_mode then
            local index = self.cell_size - self._length + 1
            if index == 1 then
                self:_reset_kinetic(true,time)
                return
            end
            self.container:update()
            local item = self.container.children[index]
            
            local offset = item.pos
            offset = offset*(-1)
            offset[self.pos_dimension] = offset[self.pos_dimension] + self.distance_to_refresh
            
            self.content.pos = offset
        else
            local index = self._length
            if index == self.cell_size then
                self:_reset_kinetic(false,time)
                return
            end
        end
    end,
    _reset_kinetic = function ( self, flag,time)
        if not self._anim then
                self._anim = anim.Animator()
            end
        if flag then
            self._anim:start(anim.duration(time,anim.value(self.kinetic[self.pos_dimension].max,0)),function ( v )
                    self.kinetic[self.pos_dimension].max = v
                end)
        else
            self._anim:start(anim.duration(time,anim.value(self.kinetic[self.pos_dimension].min,self._real_min)),function ( v )
                    self.kinetic[self.pos_dimension].min = v
                end)
        end
    end,
    on_exit = function ( self )
        if self._anim then
            self._anim:stop()
            self._anim = nil
        end
        super(M.ListView, self).on_exit(self)
    end,
    cell_size = {function ( self )
        if self.container.length then
            return self.container.length
        else
            return #self.container.children
        end
    end},

})
return M
