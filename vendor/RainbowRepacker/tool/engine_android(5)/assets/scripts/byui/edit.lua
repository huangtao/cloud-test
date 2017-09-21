local Scroll = require('byui/scroll');
local Simple = require('byui/simple_ui');
local class, mixin, super = unpack(require('byui/class'))
local anim = require('animation')
local units = require('byui/draw_res')
local AL = require('byui/autolayout')
local ui_utils = require('byui/ui_utils')
local Kinetic = require('byui/kinetic')
local M = {}

---
-- 编辑控件.
-- @module byui.edit
-- @extends byui#edit 
-- @return #table  




---
-- 放大镜.
-- 给定屏幕点将其放大显示出来。
-- @type byui.Magnifier


---
-- 创建一个放大镜.
-- @callof #byui.Magnifier
-- @param #byui.Magnifier self 
-- @param #table args 构造列表。
--      root:Widget类型，你可以指定放大镜的根节点是那一个.默认为Window.instance().drawing_root
-- @return #byui.Magnifier 返回创建的放大镜
-- @usage local mag= M.Magnifier{}


M.Magnifier = class('Magnifier', LuaWidget, {
    __init__ = function(self, args)
        self.root = args.root or Window.instance().drawing_root
        local default_unit = TextureUnit.default_unit()
        local circle = Circle(Point(0,0), 0, 40)
        local vertex1 = Rectangle(self.bbox, Matrix(), default_unit.uv_rect)
        local vertex2 = Rectangle(self.bbox, Matrix(), Rect(0,0,self.root.width,self.root.height))
        local vertex3 = Rectangle(self.bbox, Matrix(), units.magnifier.uv_rect)
        local old_bbox
        local function update_vertex(bbox)
            if old_bbox ~= bbox then
                local r = bbox.w / 2
                circle.pos = Point(bbox.x + r, bbox.y + r)
                circle.r = r
                vertex1.rect = bbox
                vertex1.colorf = self._background_color
                vertex2.rect = bbox
                vertex3.rect = bbox
                old_bbox = Rect(bbox.x, bbox.y, bbox.w, bbox.h)
            end
        end
        self.lua_do_draw = function(_, canvas)
            update_vertex(self.bbox)
            canvas:add(PushStencil())
            canvas:add(circle)
            canvas:add(UseStencil())

            -- background
            canvas:add(BindTexture(default_unit.texture, 0))
            canvas:add(vertex1)

            -- content
            canvas:add(PushBlendFunc(gl.GL_ONE, gl.GL_ONE_MINUS_SRC_ALPHA, gl.GL_ONE, gl.GL_ONE))
            canvas:add(BindTexture(self.unit.texture, 0))
            vertex2.uv_rect = self.unit.uv_rect
            canvas:add(vertex2)

            canvas:add(PopStencil())

            -- foreground
            canvas:add(BindTexture(units.magnifier.texture, 0))
            canvas:add(vertex3)

            canvas:add(PopBlendFunc())
        end
        self.radius = args.radius or 100
        self.multiply = args.multiply or 0.8
        self.offset = args.offset or Point(0, -100)
        self.size = Point(self.radius * 2, self.radius * 2)
    end,
    ---
    -- 需要放大显示的点.
    -- 点必须是在放大镜的root的座标系下的点.
    -- @field [parent=#byui.Magnifier] engine#Point center 
    -- @usage local mag= M.Magnifier{}
    -- mag.center = Point(100,100)
    center = {function(self)
        return self._center
    end, function(self, p)
        self._center = p
        self.pos = p - Point(self.radius, self.radius) + self.offset
        if self._attached then
            if self.root.fbo then
                self.unit = TextureUnit(self.root.fbo.texture)
                self.unit.rect = Rect(p.x - self.radius * self.multiply, p.y - self.radius * self.multiply, self.radius * self.multiply * 2, self.radius * self.multiply * 2)
            end
        end
    end},
    ---
    -- 开启放大镜.
    -- 只有attached为true时才能放大显示指定的点。
    -- @field [parent=#byui.Magnifier] #boolean attached 
    -- @usage local mag= M.Magnifier{}
    -- mag.center = Point(100,100)
    -- mag.attached = true
    -- -- mag.attached = false -- 关闭放大镜
    attached = {function(self)
        return self._attached
    end, function(self, b)
        if self._attached ~= b then
            self._attached = b
            if b then
                self._background_color = self.root.parent.background_color
                self._old_cache = self.root.cache
                self.root.cache = true
                self.root.clip = true
                Clock.instance():schedule_once(function ( ... )
                    -- body
                    -- if self.root.cache then
                        
                        if self.root.fbo then
                            self.root.parent:add(self)
                            self.unit = TextureUnit(self.root.fbo.texture)
                            local p = self._center
                            self.unit.rect = Rect(p.x - self.radius * self.multiply, p.y - self.radius * self.multiply, self.radius * self.multiply * 2, self.radius * self.multiply * 2)
                        end
                    -- end
                    -- body
                end)
            else
                self.root.cache = self._old_cache
                self.root.clip = false
                self:remove_from_parent()
            end
        end
    end}
})

M.EditEventHandler = {
    __init__ = function(self, args)
        self.event_widget = args.event_widget or self
        self.editbox = args.editbox or self
        if self.event_widget:getId() < 0 then
            self.event_widget:initId()
        end
        self.event_widget:add_listener(function(_, ...)
            self:handle_msg_chain(...)
        end)
        if args.enabled ~= nil then
            self.enabled = args.enabled
        else
            self.enabled = true
        end

        self.need_capture = args.need_capture or false

        self._recognizers = {}
    end,
    handle_msg_chain = function(self, touch, canceled)
        if self._enabled then
            if canceled then
                self:on_touch_cancel()
            else
                if touch.action == kFingerDown then
                    -- if self.___type ~= "class(MenuItem)"  then
                    --     M.share_menu_controller():set_menu_visible(false,false)
                    -- end
                    ui_utils.set_focus(self.editbox,true)
                    self:on_touch_down(touch.pos, touch.time)
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

    add_recognizer = function(self, recog)
        table.insert(self._recognizers, recog)
    end,

}

M.SelectHandler = class('SelectHandler', RoundedView, mixin(M.EditEventHandler, {
    __init__ = function(self, args)
        super(M.SelectHandler, self).__init__(self)
        M.EditEventHandler.__init__(self, args)
        
        self.cursor = 0
        self.radius = 2
        
        self.label = args.label
        self.parent_node = args.parent_node
        self.mode = args.mode
        self.__circle = BorderSprite()
        self.__circle.unit = units.circle
        self.__circle.t_border = {units.circle.size.x/2,units.circle.size.y/2,units.circle.size.x/2,units.circle.size.y/2}
        self.__circle.v_border = {8,8,8,8}
        self.__circle.size = Point(16,16)
        self:add(self.__circle)
        self.line_height = args.line_height or 34
        
        self._after = false
        -- 放大镜
        self.mag = M.Magnifier{}
    end,
    on_touch_down = function(self, p, t)
        -- if self.mode == kSelectBegin then
        -- end
        Simple.share_menu_controller():set_menu_visible(false,false)
        self.mag.center = Window.instance().drawing_root:from_world(p)
        self.mag.attached = true

        self.need_capture = true
        p = self.label:from_world(p)
        self.cursor ,self._after= self.label:get_cursor_by_position(p)
        self.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)) 
        
        self.parent_node:_update_selection_view()
    end,
    on_touch_move = function(self, p, t)
        self.mag.center = Window.instance().drawing_root:from_world(p)
        p = self.label:from_world(p)
        if self.mode == kSelectBegin then
            if self.label:get_cursor_by_position(p) < self.parent_node.select_end.cursor then
                self.cursor,self._after = self.label:get_cursor_by_position(p) 
            end
        elseif self.mode == kSelectEnd then
            if self.parent_node.select_begin.cursor == 0 then 
                self.cursor,self._after = self.label:get_cursor_by_position(p)
                if  self._after == self.parent_node.select_begin._after then
                    self._after = true
                end
            else
                if self.label:get_cursor_by_position(p) > self.parent_node.select_begin.cursor then
                    self.cursor,self._after = self.label:get_cursor_by_position(p)
                end
            end
            
        end 
        -- print("self.cursor",self.cursor,self.label.length,p,self._after,self.parent_node.select_end.cursor,self.parent_node.select_begin.cursor)
        
        self.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)) 
        self.editbox:_update_by_select_handler(self,p)
        
        
    end,
    on_touch_up = function(self, p, t)
        self.need_capture = false
        self.mag.attached = false
        self.parent_node:_selectitem()
    end,
    on_touch_cancel = function ( )
        self.mag.attached = false
    end,
    cursor_color = {function ( self )
        return self.self_colorf
    end,function ( self,value )
        self.self_colorf = value
        self.__circle.self_colorf = value
    end
    },
    update_cursor = function ( self,cursor,after)
        -- body
        self.cursor = cursor
        self._after = after
        self.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)) 
        self:update(false)
        
        self.parent_node:_update_selection_view()
    end,
    line_height = {function ( self )
        return self._line_height
    end,function ( self,v )
        self._line_height = v 
        self.size = Point(2, self._line_height)
        if self.mode == kSelectBegin then
            self.__circle.pos = Point(self.width/2-self.__circle.width/2,-self.__circle.height+2)
            self:set_pick_ext(20,10,8,0)
        elseif self.mode == kSelectEnd then
            self.__circle.pos = Point(self.width/2-self.__circle.width/2,self.height -2)
            self:set_pick_ext(10,20,0,8)
        end
    end

    },
}))
M.Pasteboard = ""


local function insert_table( t,str,cursor,after ,max)
    -- print("insert_table before",table.concat(t),cursor,after,max,#t)
    local i = 1 
    local j = 0 
    if after then
        i = cursor + 2
        for uchar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do 
            if max and #t >= max then
                break
            end
            table.insert(t,cursor + 2,uchar)
            j = cursor + 2
            cursor = cursor + 1

        end
    else
        i = cursor + 1
        for uchar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do 
            if max and #t >= max then
                break
            end
            table.insert(t,cursor+1,uchar)
            j = cursor + 1
            cursor = cursor + 1
        end
    end
    -- print(t)
    -- print("insert_table after",table.concat(t),max,#t)
    return i,j
end

local function delete_backward_table( t,count,cursor,after  )
    -- print("delete_backward before",table.concat(t),after,cursor)
    if not after then
        local real_count = cursor - count + 1 >= 1 and cursor - count + 1 or 1
        for i=cursor,real_count,-1 do
            table.remove(t,i)
        end
    else
        local real_count = cursor +1 - count + 1 >= 1 and cursor +1 - count + 1 or 1
        for i=cursor+1,real_count,-1 do
            table.remove(t,i)
        end
    end
    -- print("delete_backward before",table.concat(t))
end
local function delete_selection_table( t,b,e )
    -- print("delete_selection before",table.concat(t))
    for i= e + 1,b+1,-1 do
        table.remove(t,i)
    end
    -- print("delete_selection after",table.concat(t))
end

local function set_cursor_pos( view,pos )
    if pos.x < 0 then
        pos.x =0
    end
    
    view.pos = pos
end 
---
-- 可编辑文本基类.
-- @type byui.TextBehaviour

---
-- 可编辑文本基类构造函数.
-- @function [parent=#byui.TextBehaviour] __init__
-- @param #byui.TextBehaviour self 
-- @param #table args 构造列表。
--      label_clip:Widget类型。用来裁剪label的容器
--      cursor_color:Colorf类型。用来表示光标，选择器的颜色。
--      text:默认为{{text  = "",color = Color(0.0,0.0,0.0)}},表示输入文本的富文本属性。
--      hint_text:默认为{{text  = "",color = Color(0.5,0.5,0.5)}},表示提示文本的富文本属性。


M.TextBehaviour = {
    
    __init__ = function ( self,args )
        self.line_height = CLabel.get_default_line_height()
        self.label_clip = args.label_clip
        self._label_container = Widget()
        self.label = Label()
        self.label:set_data({{text = "",color = Color(0.0,0.0,0.0)}})
        -- self.label.background_color = Colorf(1.0,0.0,0.0,1.0)
        self._label_container:add(self.label)
        self.text_color = args.text_color or Colorf(0.0,0.0,0.0)
  
        -- 输入光标
        
        
        self.cursor_view = BorderSprite()
        self.cursor_view.unit = units.circle
        local tsize = units.circle.size
        self.cursor_view.t_border = {tsize.x/2,tsize.y/2,tsize.x/2,tsize.y/2}
        self.cursor_view.v_border = {1,1,1,1}
        self.cursor_view.size = Point(2, self.line_height)
        self.cursor_view.radius = 2
        self.cursor_view.visible = false

        
        self._cursor_twinkling_time = 1.0
        self.cursor = 0
        self._after = false
        self._label_container:add(self.cursor_view)

        -- 放大镜
        self.mag = M.Magnifier{}

        -- 选择游标
        self.select_begin = M.SelectHandler{label=self.label,parent_node= self,mode = kSelectBegin,editbox = self,line_height =self.line_height }
        self.select_end = M.SelectHandler{label=self.label,parent_node= self,mode = kSelectEnd,editbox = self,line_height =self.line_height}

        -- 游标中间区域
        self.selection_view = Widget()
        self.selection_right_view = Widget()
        self.selection_left_view = Widget()
        self.selection_view.visible = false
        self.selection_right_view.visible = false
        self.selection_left_view.visible = false
        self._label_container:add(self.selection_right_view)
        self._label_container:add(self.selection_left_view)
        self._label_container:add(self.selection_view) 

        self._keyboard_enable = false
        self._label_container:add(self.select_begin)
        self._label_container:add(self.select_end)

        self._hint_label = Label()
        self._label_container:add(self._hint_label)

        self.cursor_color = args.cursor_color or  Colorf(0.0,122/255,1.0,1.0)
        
        Clock.instance():schedule_once(function ( ... )
            if self.select_begin then
                self.select_begin.visible = false
            end
            if self.select_end then
                self.select_end.visible = false
            end
        end)

        self._is_mark = false
        local action = function ()
            return anim.keyframes{
                {0.0,  {opacity=1}, anim.ease},
                {0.5, {opacity=0}, anim.ease},
                {1.0,  {opacity=1}, nil}
            }
        end
        self._cursor_anim = anim.Animator(action()
                , function ( value )
                    self.cursor_view.opacity = value.opacity
                end,
                true)
        self._cursor_anim:start()
        local handle = nil
        self._cursor_anim.on_stop = function (  )
            if handle then
                handle:cancel()
            end
            handle = Clock.instance():schedule_once(function ( ... )
                if self.mag then
                    if self.mag.attached == true then
                        self._cursor_anim:start()
                        self._cursor_anim:stop()
                    else
                        self._cursor_anim:start()
                    end
                end
            end,self._cursor_twinkling_time)
        end

        self.keyboard_secure = args.keyboard_secure 
        self.max_length = args.max_length

        self._truly_text = {}

        self.text = args.text or {{text  = "",color = Color(0.0,0.0,0.0)}}
        self.hint_text = args.hint_text or {{text  = "",color = Color(0.5,0.5,0.5)}}
        


        
    end,
    _update_selection_view = function(self)
        local select_begin_pos = self.select_begin.pos
        local select_end_pos = self.select_end.pos
        local select_height = self.select_end.height
        local label_width = self.label.width
        if select_end_pos.x > select_begin_pos.x and select_end_pos.y >= select_begin_pos.y then
            self.selection_view.size = Point(select_end_pos.x - select_begin_pos.x
                    , select_end_pos.y-select_begin_pos.y + select_height)
            self.selection_view.pos = select_begin_pos
            self.selection_right_view.size = Point(label_width - (self.selection_view.x + self.selection_view.width)
                , select_end_pos.y - select_begin_pos.y)
            self.selection_right_view.pos = Point(self.selection_view.x + self.selection_view.width,select_begin_pos.y)
            self.selection_left_view.size = Point(self.selection_view.x, select_end_pos.y - select_begin_pos.y)
            self.selection_left_view.pos = Point(0, select_begin_pos.y + select_height)
        else
            local height = select_end_pos.y-select_begin_pos.y - select_height > 10 and select_end_pos.y-select_begin_pos.y - select_height or 0
            self.selection_view.size = Point(select_begin_pos.x - select_end_pos.x , height)
            self.selection_view.pos = Point(select_end_pos.x, select_begin_pos.y + select_height)
            self.selection_right_view.size = Point(label_width - select_begin_pos.x
                , select_end_pos.y - select_begin_pos.y)
            self.selection_right_view.pos = select_begin_pos
            self.selection_left_view.size = Point(select_end_pos.x
                , select_end_pos.y - select_begin_pos.y )
            self.selection_left_view.pos = Point(0,select_begin_pos.y + select_height)
        end
    end,
    registered_keyboard = function ( self )
        Simple.share_keyboard_controller().keyboard_delegate = self
        Simple.share_keyboard_controller().on_keyboard = 
            function( action, arg)
                -- print_string(string.format("on_keyboard :%s,%s",action, arg))
                self:_keyboard_event(action, arg)
            end
    end,
    _keyboard_event = function ( self, action, arg)
        if action == Application.KeyboardShow then
            self:_on_keyboard_show(arg)
        elseif action == Application.KeyboardHide then
            self._is_mark = false
            self._keyboard_enable = false
            self.mode = "normal"
            self:_on_keyboard_hide(arg)
        elseif action == Application.KeyboardInsert then
            if self.mode == "select" then
                self:delete_selection()
                self.mode = "edit"
            end
            self._cursor_anim:stop()
            Simple.share_menu_controller():set_menu_visible(false,false)

            if string.find(arg, '\n') ~= nil then
                -- self:reset_text()
                self:_on_return_click()
            else
                self:insert(arg)
            end
        elseif action == Application.KeyboardDeleteBackward then
            if self.mode == "select" then
                self:delete_selection()
            else
                self:delete_backward(arg)
            end
        elseif action == Application.KeyboardSetMarkedText then
            if self.mode == "select" then
                self:delete_selection()
            end
            if self.mode ~= "edit" then
                self.mode = "edit"
            end
            self._cursor_anim:stop()
            Simple.share_menu_controller():set_menu_visible(false,false)
            self:set_marked_text(arg)
        end
    end,
    attach_ime = function(self)
        Simple.share_keyboard_controller().keyboard_config = {
            type = self.keyboard_type,
            return_type = self.keyboard_return_type,
            appearance = self.keyboard_appearance,
            secure = self.keyboard_secure and 1 or 0,
            auto_capitalization = self.keyboard_capitalization_type,
        }
        self:registered_keyboard()
        if not self._keyboard_enable then
            self._keyboard_enable = true
            Simple.share_keyboard_controller().keyboard_status = true
        end  
    end,
    detach_ime = function(self)
        -- M.share_keyboard_controller().on_keyboard = nil
        if  self._keyboard_enable then
            self._keyboard_enable = false
            Simple.share_keyboard_controller().keyboard_status = false
        end
        
    end,
    _on_keyboard_show = function ( self,arg )
        ---
        -- 键盘显示的回调.
        -- 这里你可以知道键盘的大小，从而作出响应的调整。
        -- @field [parent=#byui.TextBehaviour] #function on_keyboard_show 
        -- @usage 
        -- text.on_keyboard_show = function (rect)
        --      local real_pos = Window.instance().drawing_root:from_world(Point(rect.x,rect.y))
        --      local x = real_pos.x
        --      local y = real_pos.y
        --      self.keyboard_height  = Window.instance().drawing_root.height - y
        -- end
        if self.on_keyboard_show then
            self.on_keyboard_show(arg)
        end
    end,
    _on_keyboard_hide = function (self, arg )
        ---
        -- 键盘关闭的回调.
        -- 这里你可以恢复你在on_keyboard_show中的行为。
        -- @field [parent=#byui.TextBehaviour] #function on_keyboard_hide 
        -- @usage 
        -- text.on_keyboard_hide = function (rect)
        --         -- do something
        -- end
        if self.on_keyboard_hide then
            self.on_keyboard_hide(arg)
        end
    end,
    insert = function(self, txt)
    ---
    -- 在当前光标处插入文本.
    -- **插入后需要下一帧才能更新好所有状态.**
    -- @function [parent=#byui.TextBehaviour] insert
    -- @param #byui.TextBehaviour self 
    -- @param #string txt 

    ---
    -- 检查插入的文本.
    -- **你可以在键盘的文字写入到输入框前修改将要插入的文本.**
    -- @function [parent=#byui.TextBehaviour] inspection_insert
    -- @param #string txt 当前输入的文本
    -- @return #string 过滤后希望插入到输入框的文本。

        if self.inspection_insert then
            local ret = self.inspection_insert(txt)
            txt = ret and tostring(ret) or txt
        end
        local start = #self._truly_text
        local i,j=insert_table(self._truly_text,txt,self.cursor,self._after,self.max_length)

        if self.keyboard_secure then
            txt = string.rep(self.password_character,#self._truly_text - start) 
        else
            txt = table.concat(self._truly_text,"",i,j)
        end
        self.cursor,self._after = self.label:insert(txt, self.cursor,self._after)

        set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
        self:_on_text_changed()
        
    end,
    delete_selection = function ( self ,is_reset)
    ---
    -- 删除选择的文本.
    -- **插入后需要下一帧才能更新好所有状态.**
    -- @function [parent=#byui.TextBehaviour] delete_selection
    -- @param #byui.TextBehaviour self 
        self.cursor = self.select_begin.cursor
        self._after = self.select_begin._after

        delete_selection_table(self._truly_text,self:_cursor_to_index(self.select_begin.cursor,self.select_begin._after),self:_cursor_to_index(self.select_end.cursor,self.select_end._after) -1)
        self.label:delete_selection( self:_cursor_to_index(self.select_begin.cursor,self.select_begin._after), self:_cursor_to_index(self.select_end.cursor,self.select_end._after) -1)
        if not is_reset then
            self.mode = "edit"
        end
        set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
        self:_on_text_changed()
        
    end,
    delete_backward = function(self, n)
    ---
    -- 从光标处向前删除指定个数的字符.
    -- **插入后需要下一帧才能更新好所有状态.**
    -- @function [parent=#byui.TextBehaviour] delete_backward
    -- @param #byui.TextBehaviour self 
    -- @param #number count 需要删除的字符数。

        delete_backward_table(self._truly_text,n,self.cursor,self._after)
        self.cursor,self._after = self.label:delete_backward( n, self.cursor,self._after)
        set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
        self:_on_text_changed()
        
    end,
    set_marked_text = function(self, t)
        ---
        -- 插入标记的文本.
        -- **插入后需要下一帧才能更新好所有状态.**
        -- @function [parent=#byui.TextBehaviour] set_marked_text
        -- @param #byui.TextBehaviour self 
        -- @param #string txt 插入的文本。
        if t == "" then
            self._is_mark = false
        else
            self._is_mark = true
        end
        self.cursor,self._after = self.label:set_marked_text( t, self.cursor,self._after)
        set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
        self:_on_text_changed()
    end,
    mode = {function ( self )
        return self._mode
    end,function ( self,value )
        ---
        -- 可编辑文本的状态.
        -- 三种状态,"normal","edit","select"。**normal**状态并不会关闭键盘，需要自己去关闭键盘。回剥夺输入焦点的控件比如button，ScrollView 也会将键盘关闭。
        -- @field [parent=#byui.TextBehaviour] #string mode 
        -- @usage text.mode = "edit" --进入编辑状态，回显示光标.同时回开启键盘。
        self._mode  = value 
        if self._mode  == "edit" then
            -- edit
            self.cursor_view.visible = true
            self.select_begin.visible = false
            self.select_end.visible = false
            self.selection_view.visible = false
            self.selection_right_view.visible = false
            self.selection_left_view.visible = false
            self:attach_ime()
            self:_on_text_changed()
            -- self.text = (self.label:get_selection(0,self.label.length-1))
        elseif self._mode  == "select" then
            --view
            self.select_begin.visible = true
            self.select_end.visible = true
            self.selection_view.visible = true
            self.selection_right_view.visible = true
            self.selection_left_view.visible = true
            if self.cursor == 0 then
                self.select_begin:update_cursor(0,false)
                self.select_end:update_cursor(0,true)
            else
                if self._after then
                    self.select_begin:update_cursor(self.cursor-1,self.cursor ~= 1)
                    -- self.select_begin:update_cursor(self.cursor-1,false)
                    self.select_end:update_cursor(self.cursor,true)
                else
                    self.select_begin:update_cursor(self.cursor,false)
                    self.select_end:update_cursor(self.cursor,true)
                end
                
            end 
            
            self.cursor_view.visible = false
        else
            self.cursor_view.visible = false
            self.select_begin.visible = false
            self.select_end.visible = false
            self.selection_view.visible = false
            self.selection_right_view.visible = false
            self.selection_left_view.visible = false
            self:_on_text_changed()
        end
    end},
    _selectitem = function ( self )
        local point_parent = Point(0,0)
        local point_begin = self._label_container:to_parent(self.select_begin.pos)
        local point_end = self._label_container:to_parent(self.select_end.pos)
        
        point_begin.x = math.max(point_begin.x,point_parent.x)
        point_end.x = math.min(point_end.x,point_parent.x + self.label_clip.width)
        point_begin.y = math.max(point_begin.y,point_parent.y)
        point_end.y = math.min(point_end.y,point_parent.y + self.label_clip.height)
        local rect  --= nil
        if self.select_begin.y == self.select_end.y then
            rect = Rect(point_begin.x,point_end.y,point_end.x - point_begin.x ,point_begin.y - point_end.y +self.select_begin.height )
        else
            rect = Rect(0,point_begin.y,self.width,point_end.y - point_begin.y +self.select_end.height )
        end 
        if rect.w <= 0 then
            return 
        end
        local str = {kStringCut,kStringCopy,kStringPaste}--,kStringDefine,kStringAdd,kStringShare,kStringIndent}
        local items = {}
        for i,v in ipairs(str) do
            items[i] = {}
            items[i].title  = v
            items[i].action = function ( view )
                if view.title == kStringCut then
                    M.Pasteboard = ""
                    M.Pasteboard = self.label:get_selection(self:_cursor_to_index(self.select_begin.cursor,self.select_begin._after) ,self:_cursor_to_index(self.select_end.cursor,self.select_end._after) -1)
                    self:delete_selection()
                elseif view.title == kStringCopy then
                    M.Pasteboard = ""
                    M.Pasteboard = self.label:get_selection(self:_cursor_to_index(self.select_begin.cursor,self.select_begin._after) ,self:_cursor_to_index(self.select_end.cursor,self.select_end._after) -1)
                elseif view.title == kStringPaste then
                    if self.mode == "select" then
                        self:delete_selection()
                        Clock.instance():schedule_once(function (  )
                            self:insert(M.Pasteboard)
                        end)
                    elseif self.mode == "edit" then
                        self:insert(M.Pasteboard)
                    end
                end
            end
        end
        Simple.share_menu_controller():set_target_rect(rect,self.label_clip)
        Simple.share_menu_controller():set_menu_items(items)
        Simple.share_menu_controller():set_menu_visible(true,true)
    end,
    _cursor_to_index = function ( self,cursor,after )
        return after and cursor+1 or cursor
    end ,
    text = {function ( self )
        if self.keyboard_secure then
            return table.concat(self._truly_text)
        else
            return self.label:get_selection(0,self.label.length-1)
        end
    end,function ( self,value )
        ---
        -- 当前输入的文本.
        -- 只读的.
        -- @field [parent=#byui.TextBehaviour] #string text 
        local temp_lbl = Label()
        if type(value) == "string" then
            self.label:set_rich_text(value)
            temp_lbl:set_rich_text(value)
        elseif type(value) == "table" then
            self.label:set_data(value)
            temp_lbl:set_data(value)
        else 
            error("the args`s type must be string or table")
        end
        temp_lbl:update(false)

        self.line_height = math.floor(temp_lbl.height)
        self.cursor_view.size = Point(2,self.line_height)
        self.select_begin.line_height = self.line_height
        self.select_end.line_height = self.line_height
        
        self._truly_text = {}
        local i,j = insert_table(self._truly_text,temp_lbl:get_data()[1].text,0,false,self.max_length)
        if self.keyboard_secure then
            local str = string.rep(self.password_character,#self._truly_text)
            self.label:set_text(str)
        else
            local str = table.concat(self._truly_text,"",i,j)
            self.label:set_text(str)
        end
        Clock.instance():schedule_once(function()
            self.cursor = self.label.length -1 < 0 and 0 or self.label.length -1
            
            Clock.instance():schedule_once(function()
                -- self.cursor_view.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after))
                set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
                self:_on_text_changed()
            end)
        end)
    end
    },
    hint_text = {function(self)
        return self._hint_text
    end, function(self, v)
        ---
        -- 提示的文本.
        -- @field [parent=#byui.TextBehaviour] #string hint_text
        -- @usage txt.hint_text = "<font color=#777777>search</font>"
        self._hint_text = v
        if type(self._hint_text) == "string" then
            self._hint_label:set_rich_text(self._hint_text)
        elseif type(self._hint_text) == "table" then
            self._hint_label:set_data(self._hint_text)  
        else
            error("the args`s type must be string or table")
        end
    end},   
    keyboard_type = {function ( self )
        return self._keyboard_type or Application.KeyboardTypeDefault
    end,function ( self,v )
        ---
        -- 键盘的类型.
        -- 取值为@{engine#Application.KeyboardTypeDefault},@{engine#Application.KeyboardTypeASCIICapable},@{engine#Application.KeyboardTypeNumbersAndPunctuation},@{engine#Application.KeyboardTypeURL},<br/>
        -- @{engine#Application.KeyboardTypeNumberPad},@{engine#Application.KeyboardTypePhonePad},@{engine#Application.KeyboardTypeNamePhonePad},@{engine#Application.KeyboardTypeEmailAddress},<br/>
        -- @{engine#Application.KeyboardTypeDecimalPad},@{engine#Application.KeyboardTypeTwitter},@{engine#Application.KeyboardTypeWebSearch}。
        -- @field [parent=#byui.TextBehaviour] #number keyboard_type 
        self._keyboard_type = v
    end},
    keyboard_appearance = {function ( self )
        return self._keyboard_appearance or Application.KeyboardAppearanceDefault
    end,function ( self,v )
        ---
        -- 键盘的风格.
        -- 取值为@{engine#Application.KeyboardAppearanceDefault},@{engine#Application.KeyboardAppearanceDark},@{engine#Application.KeyboardAppearanceLight},@{engine#Application.KeyboardAppearanceAlert}。
        -- @field [parent=#byui.TextBehaviour] #number keyboard_appearance
        self._keyboard_appearance = v
    end},
    keyboard_return_type = {function ( self )
        return self._keyboard_return_type or Application.ReturnKeyDefault
    end,function ( self,v )
        ---
        -- 键盘的返回类型.
        -- 取值为@{engine#Application.ReturnKeyDefault},@{engine#Application.ReturnKeyGo},@{engine#Application.ReturnKeyGoogle},@{engine#Application.ReturnKeyJoin},@{engine#Application.ReturnKeyNext},<br/>
        -- @{engine#Application.ReturnKeyRoute},@{engine#Application.ReturnKeySearch},@{engine#Application.ReturnKeySend},@{engine#Application.ReturnKeyYahoo},@{engine#Application.ReturnKeyDone},<br/>
        -- @{engine#Application.ReturnKeyEmergencyCall},@{engine#Application.ReturnKeyContinue}。
        -- @field [parent=#byui.TextBehaviour] #number keyboard_return_type
        self._keyboard_return_type = v
    end},
    keyboard_capitalization_type = {function ( self )
        return self._keyboard_capitalization_type or Application.KeyboardAutocapitalizationTypeNone
    end,function ( self,v )
        ---
        -- 键盘的大写属性.
        -- 取值为@{engine#Application.KeyboardAutocapitalizationTypeNone},@{engine#Application.KeyboardAutocapitalizationTypeWords},@{engine#Application.KeyboardAutocapitalizationTypeSentences},<br/>
        -- @{engine#Application.KeyboardAutocapitalizationTypeAllCharacters}。
        -- @field [parent=#byui.TextBehaviour] #number keyboard_capitalization_type
        self._keyboard_capitalization_type = v
    end},
    keyboard_secure = {function ( self )
        return self._keyboard_secure or false
    end,function ( self,v )
        ---
        -- 是否为密码框.
        -- 为true则为密码框，否则为普通输入框.
        -- @field [parent=#byui.TextBehaviour] #boolean keyboard_secure
        self._keyboard_secure = v
    end},
    on_focus_change = function ( self,value)
        if not value then
            self._keyboard_enable = false
            self:set_marked_text("")
            self.mode = "normal"
        end
    end,
    reset_text = function ( self )
        ---
        -- 重置输入框的输入文字.
        -- 不能直接调用text=“”可能导致很多状态丢失.
        -- @function [parent=#byui.TextBehaviour] reset_text
        -- @param #byui.TextBehaviour self 
        self.select_begin.cursor = 0
        self.select_begin._after = false
        self.select_end.cursor = self.label.length-1
        self.select_end._after = true
        self:delete_selection(true)

        self._truly_text = {}

        if self.mode == "select" then
            self.mode = "edit"
        end
    end,
    _update_cursor_pos = function ( self,p )
        if not self._is_mark then
            self.cursor,self._after = self.label:get_cursor_by_position(p)
            -- self.cursor_view.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after))
            set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
        end
    end,
    _on_return_click = function ( self )
        if self.on_return_click then
            self.on_return_click()
        end
    end,
    cursor_color = {function ( self )
        return self._cursor_color
    end,function ( self,value )
        ---
        -- 光标和选择器的颜色.
        -- @field [parent=#byui.TextBehaviour] engine#Colorf cursor_color 
        self._cursor_color = value
        self.select_begin.cursor_color =  self._cursor_color
        self.select_end.cursor_color =  self._cursor_color
        self.cursor_view.self_colorf = self._cursor_color

        self.__cursor_select_color = Colorf(self._cursor_color.r,self._cursor_color.g,self._cursor_color.b,0.5)
        self.selection_view.background_color = self.__cursor_select_color
        self.selection_right_view.background_color = self.__cursor_select_color
        self.selection_left_view.background_color = self.__cursor_select_color
    end},
    on_touch_down = function(self, p, t)
        self.mag.center = Window.instance().drawing_root:from_world(p)
        local l_p = self.label:from_world(p)
        self:_update_cursor_pos(l_p)
        self._status = 'press'
        if self._mode  == "edit" then
            self._handle = Clock.instance():schedule_once(function()
                if self._status == 'press' then
                    self._press = true
                    self.mag.attached = true
                    self.need_capture = true
                end
            end, 0.15)
            Simple.share_menu_controller():set_menu_visible(false,false)
        elseif self._mode  == "select" then
            self._handle = Clock.instance():schedule_once(function()
                if self._status == 'press' then
                    self.mag.attached = true
                    self._press = true
                    self.mode = "edit"
                end
                Simple.share_menu_controller():set_menu_visible(false,false) 
            end, 1) 
        else
            self._handle = Clock.instance():schedule_once(function()
                if self._status == 'press' then
                    self._press = true
                    self.mode = "edit"
                end
            end, 0.15)
            Simple.share_menu_controller():set_menu_visible(false,false)
        end 
    end,
    on_touch_move = function ( self, p, t )
        -- body
    end,
    on_touch_up = function(self, p, t)
        self._status = 'normal'
        self._handle:cancel()
        if self._mode  == "edit" then
            if self.mag.attached == true then
                self.mag.attached = false
                local str 
                if self.text == "" then
                    str = {kStringPaste}
                else
                    str = {kStringSelect,kStringSelectAll,kStringPaste}
                end
                local rect = Rect(0,0,self.cursor_view.width,self.cursor_view.height)
                local items = {}
                for i,v in ipairs(str) do
                    items[i] = {}
                    items[i].title = v 
                    items[i].action = function ( view )
                            if view.title == kStringSelect then
                                self.mode = "select"
                            elseif view.title == kStringSelectAll then
                                self.mode = "select"
                                self.select_begin:update_cursor(0,false)
                                self.select_end:update_cursor(self.label.length-1,true)
                                self:_selectitem()
                            elseif view.title == kStringPaste then
                                self:insert(M.Pasteboard)
                            end
                        end
                end
                Simple.share_menu_controller():set_target_rect(rect,self.cursor_view)
                Simple.share_menu_controller():set_menu_items(items)
                Simple.share_menu_controller():set_menu_visible(true,true)
            end
        elseif self._mode  == "select" then
            --view
            if self.selection_view:point_in(p) or 
                self.selection_left_view:point_in(p) or 
                self.selection_right_view:point_in(p) then
                    -- print(" M.share_menu_controller().visible", M.share_menu_controller()._menu_visible)
                    if Simple.share_menu_controller()._menu_visible then
                        Simple.share_menu_controller():set_menu_visible(false,false)
                        self.mode = "edit"
                    else
                        self:_selectitem()
                    end
            else
                Simple.share_menu_controller():set_menu_visible(false,false) 
                self.mode = "edit"
            end
        else
            if self._press == true  or self:point_in(p) then
                self.mode = "edit"
            end
        end  
        self._press = false  
        self.need_capture = false  
    end,
    on_touch_cancel = function ( self )
        self.need_capture = false
        self._press = false
        self.mag.attached = false
        if self._handle then
            self._handle:cancel()
        end
    end,
    ---
    -- 密码框显示的字符.
    -- 默认显示的字符为"•"，你可以修改一个任意字符来替代密码显示.
    -- @field [parent=#byui.TextBehaviour] #string password_character
    
    password_character = {function ( self )
        return self._password_character or "•"
    end,function ( self,value )
        if value and value ~= "" then
            self._password_character = tostring(value)
        end
    end},
    ---
    -- 输入的最大字符最大长度.
    -- 如果为nil则不会限制输入的长度，中文字符和数字字母一样也只算一个字符.
    -- @field [parent=#byui.TextBehaviour] #number max_length

    max_length = {function ( self )
        return self._max_length
    end,function ( self,value )
        if tonumber(value) then
            self._max_length = tonumber(value)
        else
            self._max_length = nil
        end
    end},
    ---
    -- 光标显示的宽度.
    -- 通过此属性你可以设置不同宽度的光标，建议不要太大，否则会盖住文字，默认为2。
    -- @field [parent=#byui.TextBehaviour] #number cursor_width

    cursor_width = {function ( self )
        return self.cursor_view.width
    end,function ( self,value )
        self.cursor_view.width = value
        self.cursor_view.v_border = {value/2,value/2,value/2,value/2}
    end},
    ---
    -- 光标两次闪烁的时间间隔.
    -- 通过此属性你可以设置设置光标闪烁的时间间隔，默认为1s。
    -- @field [parent=#byui.TextBehaviour] #number cursor_twinkling_time

    cursor_twinkling_time = {function ( self )
        return self._cursor_twinkling_time
    end,function ( self,value )
        self._cursor_twinkling_time = value
    end},
    on_exit = function ( self )
        if self:equal(Simple.share_keyboard_controller().keyboard_delegate) then
            Simple.share_keyboard_controller().keyboard_delegate = nil
            Simple.share_keyboard_controller().on_keyboard = nil
        end
        if self:equal(ui_utils.get_focus()) then
            ui_utils.remove_focus()
        end
        self._cursor_anim:stop()
    end
}

---
-- 单行文本输入框.
-- 同时继承了@{byui.edit#byui.TextBehaviour}.
-- @type byui.EditBox
-- @extends engine#Widget 

---
-- 创建单行文本框.
-- @callof #byui.EditBox
-- @param #byui.EditBox self 
-- @param #table args 参数列表.
--        radius:number类型，圆角半径。
--        background_style:背景的样式。可选值KTextBorderStyleRoundedRect ，KTextBorderStyleBezel ，KTextBorderStyleLine ，KTextBorderStyleWhite ,KTextBorderStyleNone 。
--        icon_style :icon的样式，可选KTextIconNone，KTextIconDelete,KTextIconMagnifier。

M.EditBox = class('EditBox',Widget,mixin(M.EditEventHandler,M.TextBehaviour,{
    __init__ = function ( self,args )
        super(M.EditBox, self).__init__(self,args)

        self._background = BorderSprite()
        self:add(self._background)
        self._radius = args.radius or 10
        self._background.t_border = {10,10,10,10}
        self._background.v_border = {self._radius,self._radius,self._radius,self._radius}
        if not args.margin then
            args.margin = {0,0,0,0}
        end
        self.margin = args.margin


        
        -- self.clip = true
        self._scroll_view = Scroll.ScrollView{ dimension = kHorizental,}
        self._scroll_view.pos = Point(self.margin[1],self.margin[2])
        self._scroll_view.enabled = false
        self:add(self._scroll_view)
        args.label_clip = self._scroll_view
        M.EditEventHandler.__init__(self,args )
        M.TextBehaviour.__init__(self,args )
        self._scroll_view.content = self._label_container
        self._label_container.relative = true


        
        self._press = false


        self._icon = BorderSprite()
        self._icon.need_capture = true
        Simple.init_simple_event(self._icon,function ()
            self:_icon_click()
        end) 
        -- self._icon.visible = false
        self:add(self._icon)

        
        self.background_style = args.background_style or KTextBorderStyleNone
        self.icon_style = args.icon_style or KTextIconNone

        self.on_size_changed = function ( _ )
            -- self.cursor_view.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after))
            set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
            self:_refresh()
        end
    end,
    _refresh = function ( self )
        self._background.size = self.size
        if self._icon then
            self._icon.y = (self.height - self._icon.height)/2
            self._icon.x = self.width - self.height + (self.height - self._icon.width)/2
            self._scroll_view.size = Point(self.width -self.height,self.height - (self.margin[2] + self.margin[4]))
            self._icon:set_pick_ext(self._icon.y, self._icon.y, self._icon.y, self._icon.y)
        else
            self._scroll_view.size = Point(self.width - (self.margin[1] + self.margin[3]) ,self.height - (self.margin[2] + self.margin[4]) )
        end
        self._label_container.size = self._scroll_view.size
        if self.label.content_bbox.w > self._scroll_view.width then
            -- self._label_container.x = self._label_clip.width - self.label.content_bbox.w 
            self._scroll_view:scroll_to_right(0.25)
        else
            -- self._label_container.x = 0
            self._scroll_view:scroll_to_left(0.25)
        end 
    end,
    _icon_click = function ( self )
        if self.icon_style == KTextIconDelete then
            self:reset_text()
        end
        --- 
        -- icon点击回调事件.
        -- @field [parent=#byui.EditBox] #function icon_click 
        -- @usage txt.icon_click = function()
        --      -- do something
        -- end
        if self.icon_click then
            self.icon_click()
        end
    end,
    on_touch_move = function(self, p, t)
        self.mag.center = Window.instance().drawing_root:from_world(p)

        p = self.label:from_world(p)
        self:_update_cursor_pos(p) 
        if self.cursor_view.x + self._label_container.x < 0 then
            -- self._label_container.x = -self.cursor_view.x
            self._scroll_view:scroll_to(Point(-self.cursor_view.x,0),0.0)
        elseif self.cursor_view.x + self._label_container.x > self._scroll_view.width  then
            -- self._label_container.x = self._scroll_view.width  -self.cursor_view.x
            self._scroll_view:scroll_to(Point(self._scroll_view.width  -self.cursor_view.x,0),0.0)
        end
        self._cursor_anim:stop()
    end,
    ---
    -- 背景的样式.
    -- 可取@{byui.utils#KTextBorderStyleRoundedRect},@{byui.utils#KTextBorderStyleBezel },@{byui.utils#KTextBorderStyleLine },@{byui.utils#KTextBorderStyleWhite },@{byui.utils#KTextBorderStyleNone }。
    -- @field [parent=#byui.EditBox] #number background_style 
    background_style = {function ( self )
        return self._background_style
    end,function ( self,value )
        self._background.visible = true
        if value == KTextBorderStyleRoundedRect then
            self._background_style = KTextBorderStyleRoundedRect
            self._background.unit = units.editbox_style_rounded_rect
        elseif value == KTextBorderStyleBezel then
            self._background_style = KTextBorderStyleBezel
            self._background.unit = units.editbox_style_bezel
        elseif value == KTextBorderStyleLine then
            self._background_style = KTextBorderStyleLine
            self._background.unit = units.editbox_style_line
        elseif value == KTextBorderStyleWhite then
            self._background_style = KTextBorderStyleWhite
            self._background.unit = units.editbox_style_none
        else
            self._background_style = KTextBorderStyleNone
            self._background.visible = false
        end

    end},
    ---
    -- icon的样式.
    -- 可取@{byui.utils#KTextIconNone},@{byui.utils#KTextIconDelete },@{byui.utils#KTextIconMagnifier }。
    -- @field [parent=#byui.EditBox] #number icon_style
    icon_style = {function ( self )
        return self._icon_style or KTextIconNone
    end,function ( self,value )
        if value == KTextIconDelete then
            self._icon_style = KTextIconDelete
            self:_create_icon()
            self._icon.unit = units.del_icon_1
            self._icon.size = units.del_icon_1.size
        elseif value == KTextIconMagnifier then
            self._icon_style = KTextIconMagnifier
            self:_create_icon()
            self._icon.unit = units.small_magnifier
            self._icon.size = units.small_magnifier.size
        else
            self._icon_style = KTextIconNone
            if self._icon then
                self._icon:remove_from_parent()
                self._icon = nil 
            end
        end
        self:_refresh()
    end},
    _create_icon = function ( self )
        if not self._icon then
            self._icon = BorderSprite()
            Simple.init_simple_event(self._icon,function ()
                self:_icon_click()
            end) 
            self:add(self._icon)
        end 
    end,
    _on_text_changed = function ( self )
        local text_temp = self.label:get_selection(0,self.label.length-1)
        if text_temp == "" then
            if self._icon and self.icon_style == KTextIconDelete then
                self._icon.visible = false
            end
            self._hint_label.visible = true
        else
            if self._icon and self.icon_style == KTextIconDelete then
                self._icon.visible = true
            end
            self._hint_label.visible = false
        end
        local cursor_pos  = self.cursor_view.pos + self._scroll_view.content.pos--self._scroll_view:from_world(self.cursor_view:to_world(Point(0,0)))
        local offset = 10
        self._scroll_view:update()
        if cursor_pos.x < offset then
            self._scroll_view:scroll_to(Point(-self.cursor_view.x,0),0)
        elseif cursor_pos.x + self.cursor_view.width +offset > self._scroll_view.width then
            self._scroll_view:scroll_to(Point(-self.cursor_view.x + self._scroll_view.width ,0),0)
        end
        --- 
        -- 输入文字发生改变.
        -- @field [parent=#byui.EditBox] #function on_text_changed 
        -- @usage txt.on_text_changed = function(str)
        --      print(str)
        -- end
        if self.on_text_changed then
            self.on_text_changed(text_temp)
        end
    end,
    _update_by_select_handler = function ( self,select_handler,point )
        -- self._label_container.x = 0
        local local_pos = self._scroll_view:from_world(self.label:to_world(point))
        if local_pos.x < 0 then
            if (self._scroll_view._content.x) < 0 then
                self._scroll_view._content.x  = self._scroll_view._content.x + 10 < 0 and self._scroll_view._content.x + 10 or 0
            end
        elseif local_pos.x > self._scroll_view.width then
            if (self._scroll_view._content.x ) > self._scroll_view.kinetic.x.min then
                self._scroll_view._content.x  = self._scroll_view._content.x - 10 > self._scroll_view.kinetic.x.min and self._scroll_view._content.x - 10 or self._scroll_view.kinetic.x.min
            end
        end
        self:_update_selection_view()
    end,
    }),true)

---
-- 多行文本输入框.
-- 同时继承了@{byui.edit#byui.TextBehaviour}.
-- @type byui.MultilineEditBox
-- @extends engine#Widget 

---
-- 创建一个多行文本.
-- @callof #byui.MultilineEditBox
-- @param #byui.MultilineEditBox self 
-- @param #table args 参数列表。
--      style : MultilineEditBox的样式。可选值KTextBorderStyleRoundedRect ，KTextBorderStyleBezel ，KTextBorderStyleLine ，KTextBorderStyleWhite ,KTextBorderStyleNone 。
--      radius : 背景框的圆角半径。
--      expect_height :输入框的默认高度。如果没有则大小跟随文本的大小变化而变化。

M.MultilineEditBox = class('MultilineEditBox',Widget,mixin(M.EditEventHandler,M.TextBehaviour,{
    __init__ = function ( self, args )
        super(M.MultilineEditBox, self).__init__(self,args)
        M.EditEventHandler.__init__(self,args )
        self._background = BorderSprite()
        self.style = args.style or KTextBorderStyleRoundedRect
        self._background.size = self._background.unit.size
        self._radius = args.radius or 10

        if not args.margin then
            args.margin = {0,0,0,0}
        end
        self.margin = args.margin

        self._background.t_border = {self._radius,self._radius,self._radius,self._radius}
        self._background.v_border = {self._radius,self._radius,self._radius,self._radius}
        self:add(self._background)

        self._scroll_view = Scroll.ScrollView{ dimension = kVertical,}
        -- self._scroll_view.shows_vertical_scroll_indicator = true
        
        self._scroll_view.pos = Point(self.margin[1],self.margin[2])
        self:add(self._scroll_view)

        args.label_clip = self._scroll_view
        M.TextBehaviour.__init__(self,args )
        self._scroll_view.content = self._label_container
        self._label_container.relative = true
        self._label_change = false
        
        self.on_size_changed = function (  )
            self._background.size = self.size
            self._scroll_view.size = self.size - Point(self.margin[1]+self.margin[3],self.margin[2]+self.margin[4])
            self._label_container.size = self._scroll_view.size 

            if self._scroll_view._vertical_scroll_indicator then
                self._scroll_view._vertical_scroll_indicator.offset = -5
            end

            -- if not self._label_change then
                self.label.layout_size = self._scroll_view.size -- Point(self._radius,0)
                self.label:update(false)
            -- <end></end>
            -- if self.label.height  < self._scroll_view.height then
            --     self.label.height = self._scroll_view.height
            -- end
            -- self.cursor_view.pos = self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after))
            set_cursor_pos(self.cursor_view,self.label:to_parent(self.label:get_cursor_position(self.cursor,self._after)))
            --- 
            -- 文本框的内容大小发生改变.
            -- @field [parent=#byui.MultilineEditBox] #function on_content_size_change 
            -- @usage txt.on_content_size_change = function()
            --      print(“on_content_size_change”)
            -- end 
            if self.on_content_size_change then
                self.on_content_size_change()
            end
        end
        self.expect_height = args.expect_height
        if self.expect_height then
            self.height_hint = self.expect_height
        end
    end,
    ---
    -- 文本框的最大高度.
    -- 文本框大小没有达到最大高度时会跟随文本大小一直变化，直到高度达到最大高度后便不在发生变化.
    -- @field [parent=#byui.MultilineEditBox] #number max_height 
    max_height = {function ( self )
        return self._max_height or self.height
    end,function ( self,v )
        self._max_height = v 
        if self.height > self._max_height then
            self.height_hint = self._max_height
        end
    end},
    on_touch_down = function ( self, p, t)
        M.TextBehaviour.on_touch_down(self, p, t)
        self._scroll_view.shows_vertical_scroll_indicator = true
    end,
    on_touch_move = function(self, p, t)
        -- self.mag.center = p 
        self.mag.center = Window.instance().drawing_root:from_world(p)
        p = self.label:from_world(p)
        self:_update_cursor_pos(p)
        if self.cursor_view.y + self._label_container.y < 0 then
            self._scroll_view:scroll_to(Point(0.0,-(self.cursor_view.y)),0.01) 
        elseif self.cursor_view.y + self._label_container.y +self.cursor_view.height > self.height  then
            self._scroll_view:scroll_to(Point(0.0,-(self.cursor_view.y + self.cursor_view.height)),0.01) 
        end
        self._cursor_anim:stop()
    end,
    _on_text_changed = function ( self )
        local text_temp = self.label:get_selection(0,self.label.length-1)
        -- self.label:update(false)
        if text_temp == "" then
            self._hint_label.visible = true
        else
            self._hint_label.visible = false
        end
        self._scroll_view.shows_vertical_scroll_indicator = false
        self._scroll_view:update()
        
        self._label_change = true
        self._label_container.x = 0
        if self.label.height > self.max_height - (self.margin[2] + self.margin[4])  then
            self.height_hint = self.max_height
            self._scroll_view.enabled = true
            -- self._scroll_view:scroll_to_bottom(0.0)
            self:update_constraints()
        elseif self.label.height - self._scroll_view.height > 10 then
            self.height_hint =  self.label.height +  (self.margin[2] + self.margin[4]) 
            -- self._scroll_view:scroll_to_bottom(0.0)
            self._scroll_view.enabled = false
            self:update_constraints()
        elseif self.label.height - self._scroll_view.height < -10 then
            if self.expect_height then
                if self.label.height < self.expect_height then
                    self.height_hint = self.expect_height
                else
                    self.height_hint = self.label.height + (self.margin[2] + self.margin[4]) 
                end
            else
                self.height_hint =  self.label.height > 0 and self.label.height + (self.margin[2] + self.margin[4])  or self.line_height + (self.margin[2] + self.margin[4]) 
            end
            
            self._scroll_view.enabled = false
            self:update_constraints()
        end
        local _scroll_view_height
        if self.height_hint then
            _scroll_view_height = self.height_hint - (self.margin[2] + self.margin[4]) 
        else
            _scroll_view_height = self.height - (self.margin[2] + self.margin[4]) 
        end
        self._scroll_view:update(false)
        if self.label.height > _scroll_view_height then
            if self.cursor_view.y + self.cursor_view.height + self._label_container.y > _scroll_view_height then
                self._scroll_view:scroll_to(Point(0,-(self.cursor_view.y + self.cursor_view.height - (_scroll_view_height))),0.1)
            elseif self.cursor_view.y + self._label_container.y < 0 then
                self._scroll_view:scroll_to(Point(0,-(self.cursor_view.y)),0.1) 
            end
        else
            self._scroll_view:scroll_to_top(0.0)
        end
        --- 
        -- 输入文字发生改变.
        -- @field [parent=#byui.MultilineEditBox] #function on_text_changed 
        -- @usage txt.on_text_changed = function(str)
        --      print(str)
        -- end 
        if self.on_text_changed then
            self.on_text_changed(text_temp)
        end
        
    end,
    ---
    -- 文本框的背景样式.
    -- 可取@{byui.utils#KTextBorderStyleRoundedRect},@{byui.utils#KTextBorderStyleBezel },@{byui.utils#KTextBorderStyleLine },@{byui.utils#KTextBorderStyleWhite },@{byui.utils#KTextBorderStyleNone }。
    -- @field [parent=#byui.MultilineEditBox] #number style 
    style = {function ( self )
        return self._style
    end,function ( self,value )
        self._background.visible = true
        if value == KTextBorderStyleRoundedRect then
            self._style = KTextBorderStyleRoundedRect
            self._background.unit = units.editbox_style_rounded_rect
        elseif value == KTextBorderStyleBezel then
            self._style = KTextBorderStyleBezel
            self._background.unit = units.editbox_style_bezel
        elseif value == KTextBorderStyleLine then
            self._style = KTextBorderStyleLine
            self._background.unit = units.editbox_style_line
        else
            self._style = KTextBorderStyleNone
            self._background.unit = units.editbox_style_none
            self._background.visible = false
        end

    end},
    _update_by_select_handler = function ( self,select_handler,point )
        self._label_container.x = 0
        local local_pos = self:from_world(self.label:to_world(point))
        -- self._scroll_view.shows_vertical_scroll_indicator = true
        if local_pos.y < 0 then
            if (self._scroll_view._content.y ) < 0 then
                self._scroll_view._content.y  = self._scroll_view._content.y + 10 < 0 and self._scroll_view._content.y + 10 or 0
                -- self._scroll_view:scroll_to(Point(0,self._scroll_view._content.y + 10 < 0 and self._scroll_view._content.y + 10 or 0),0.0)
            end
        elseif local_pos.y > self.height then
            if (self._scroll_view._content.y) > self._scroll_view.height - self.label.height then
                self._scroll_view._content.y  = self._scroll_view._content.y - 10 > self._scroll_view.height - self.label.height and self._scroll_view._content.y - 10 or self._scroll_view.height - self.label.height 
                -- self._scroll_view:scroll_to(Point(0,self._scroll_view._content.y - 10 > self._scroll_view.height - self.label.height and self._scroll_view._content.y - 10 or self._scroll_view.height - self.label.height),0.0)
            end
        end
        self:_update_selection_view()
    end,
    }))

---
-- 搜索框.
-- @type byui.SearchView

---
-- 创建SearchView
-- @callof #byui.SearchView.
-- @param #byui.SearchView self 
-- @param #table args 参数列表.
--          margin:外边框的边界。
--          tint_color :光标和取消按钮的颜色。
--          cancel_title :取消按钮的title。
--          radius: 搜索框的圆角半径。
-- @return #byui.SearchView 返回创建的SearchView

M.SearchView = class('SearchView', Widget, {
    __init__ = function ( self,args )
        super(M.SearchView, self).__init__(self,args)

        local  radius = args.radius
        args.radius = 0
        args.background_style = KTextBorderStyleNone
        self.editbox = M.EditBox(args)
        
        self.default_line_height = self.editbox.line_height or CLabel.get_default_line_height()
        self.radius = radius or self.default_line_height/2


        self.margin = args.margin or {10,10,10,10}
        -- self.height_hint = self.default_line_height + 4
        self._search_field = BorderSprite()
        self._search_field.unit = units.circle
        self._search_field.t_border = ui_utils.default_t_border(units.circle)
        self._search_field.v_border = {self.radius,self.radius,self.radius,self.radius}
        self:add(self._search_field)
        self._search_field:add(self.editbox)

        self.left_icon = BorderSprite()
        self.left_icon.unit = units.small_magnifier
        self.left_icon.size = self.left_icon.unit.size
        self._search_field:add(self.left_icon)

        self.right_icon = BorderSprite()
        self.right_icon.unit = units.del_icon_1
        self.right_icon.size = self.right_icon.unit.size
        self._search_field:add(self.right_icon)
        Simple.init_simple_event(self.right_icon,function (  )
            self.editbox:reset_text()
            if self.on_delete then
                self.on_delete()
            end
        end)

        self._delete_icon = BorderSprite()
        self._delete_icon.unit = units.del_icon_1
        self._delete_icon.size = self._delete_icon.unit.size
        self._delete_icon.visible = false
        self._search_field:add(self._delete_icon)
        Simple.init_simple_event(self._delete_icon,function (  )
            self.editbox:reset_text()
            ---
            -- 删除按钮响应事件.
            -- @field [parent=#byui.SearchView] #function on_delete 
            -- @usage search.on_delete = function()
            --      print("click delete button")
            -- end
            if self.on_delete then
                self.on_delete()
            end
        end)

        self._cancel_button = Label()
        self.tint_color = args.tint_color or Colorf(0.0,122/255,1.0,1.0)
        self.cancel_title = args.cancel_title or "Cancel"
        self:add(self._cancel_button)
        Simple.init_simple_event(self._cancel_button,function (  )
            self.editbox:detach_ime()
            ---
            -- 取消按钮响应事件.
            -- @field [parent=#byui.SearchView] #function on_cancel 
            -- @usage search.on_cancel = function()
            --      print("click cancel button")
            -- end
            if self.on_cancel then
                self.on_cancel()
            end
        end)
        -- self.clip = true
        self.editbox.on_text_changed = function ( text )
            if text == "" then
                self._delete_icon.visible = false
                self.right_icon.visible = true
            else
                self._delete_icon.visible = true
                self.right_icon.visible = false
            end
            ---
            -- 输入文字变化响应回调.
            -- @field [parent=#byui.SearchView] #function on_text_changed 
            -- @usage search.on_delete = function()
            --      print("click delete button")
            -- end
            if self.on_text_changed then
                self.on_text_changed(text)
            end
        end
        self.on_size_changed = function (  )
            self:_refresh()
        end
    end,
    _refresh = function ( self )
        if self._cancel_button.visible then
            self._search_field.size = Point(self.width - self._cancel_button.width - 1.5*self.margin[1] - 1.5*self.margin[3],self.height-self.margin[2]-self.margin[4])
            self._search_field.pos = Point(self.margin[1],self.margin[2])
            self._cancel_button.pos = Point(self.width - self.margin[3] - self._cancel_button.width,(self.height - self._cancel_button.height)/2)
        else
            self._search_field.size = Point(self.width - self.margin[1] - self.margin[3],self.height-self.margin[2]-self.margin[4])
            self._search_field.pos = Point(self.margin[1],self.margin[2])
        end

        if self.left_icon.unit then
            self.left_icon.y =  (self._search_field.height - self.left_icon.height)/2 
            self.left_icon.x =  (self.default_line_height - self.left_icon.width)/2 
            self.right_icon.y =  (self._search_field.height - self.right_icon.height)/2 
            self.right_icon.x =  self._search_field.width - self.default_line_height+ (self.default_line_height - self.right_icon.width)/2 
            self.editbox.size = Point(self._search_field.width - 2*self.default_line_height,self.default_line_height)
            self.editbox.pos = Point((self._search_field.width -self.editbox.width)/2 ,(self._search_field.height -self.editbox.height)/2)
        else
            self.right_icon.y =  (self._search_field.height - self.right_icon.height)/2 
            self.right_icon.x =  self._search_field.width -self.default_line_height+ (self.default_line_height - self.right_icon.width)/2
            self.editbox.size = Point(self._search_field.width - self.default_line_height - self.radius,self.default_line_height)
            self.editbox.pos = Point(self.radius ,(self._search_field.height -self.editbox.height)/2)
        end
        self._delete_icon.pos = Point(self._search_field.width -self.default_line_height+ (self.default_line_height - self._delete_icon.width)/2,(self._search_field.height - self._delete_icon.height)/2 ) 
    end,
    --- 
    -- 左边icon的纹理.
    -- 默认为放大镜。
    -- @field [parent=#byui.SearchView] #TextureUnit left_icon_units 
    left_icon_units = {function ( self )
        return self.left_icon.visible and self.left_icon.unit or nil
    end,function ( self,desc )
        if not desc then
            self.left_icon.unit = nil
            self.left_icon.size = Point(0,0)
        elseif desc.class == TextureUnit then
            self.left_icon.unit = desc
            self.left_icon.t_border = ui_utils.default_t_border(desc)
            self.left_icon.self_colorf = Colorf.white
            self.left_icon.size = desc.size
        else
            error('invalid texture description')
        end
        self:_refresh()
    end},
    --- 
    -- 右边icon的纹理.
    -- @field [parent=#byui.SearchView] #TextureUnit right_icon_units 
    right_icon_units = {function ( self )
        return self.right_icon.visible and self.right_icon.unit or nil
    end,function ( self,desc )
        if not desc then
            self.right_icon.unit = nil
            self.right_icon.size = Point(0,0)
        elseif desc.class == TextureUnit then
            self.right_icon.unit = desc
            self.right_icon.t_border = ui_utils.default_t_border(desc)
            self.right_icon.color = Colorf.white
            self.right_icon.size = desc.size
        else
            error('invalid texture description')
        end
        self:_refresh()
    end},
    ---
    -- 光标和取消按钮的颜色.
    -- @field [parent=#byui.SearchView] engine#Colorf tint_color 
    tint_color = {function ( self )
        return self._tint_color 
    end,function ( self,value )
        self._tint_color = value
        self.editbox.cursor_color = value
        self._cancel_button:set_data{{text = self.cancel_title,color = colorf_to_color(self.tint_color),size = 32}}
    end},
    ---
    -- 取消按钮的title.
    -- 默认为"Cancel"。
    -- @field [parent=#byui.SearchView] #string cancel_title 
    cancel_title = {function ( self )
        return self._cancel_title or "Cancel"
    end,function ( self,value )
        if type(value) == "string" then
            self._cancel_title = value
            self._cancel_button:set_data{{text = self._cancel_title,color = colorf_to_color(self.tint_color),size = 32}}
            self._cancel_button:update(false)
            self:_refresh()
        else
            error('the cancel title is invalid')
        end
    end},
    ---
    -- 是否显示取消按钮.
    -- 默认为true。即显示取消按钮。
    -- @field [parent=#byui.SearchView] #boolean shows_cancel_button description
    shows_cancel_button = {function ( self )
        return self._cancel_button.visible
    end,function ( self,value )
        if value ~= self._cancel_button.visible then
            self._cancel_button.visible = value
            self:_refresh()
        end
    end},
},true)

return M
