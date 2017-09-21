--region *.lua
--Date
--此文件由[BabeLua]插件自动生成



--endregion

local UI = require("byui/basic")
local AL = require("byui/autolayout")
local layout = require("byui/layout") 
local class, mixin, super = unpack(require('byui/class'))
local anim = require('animation')



local function toDefault( self,index ,need_cb)
    local target = -((index - 1) * self.row_height - (self.height - self.row_height)/2)
    -- Log.v("toDefault",index,target,self.row_height,self.height)
    self.content.y = target
    self:_update(Point(0,target))

    if need_cb then
        self:_refresh_color()
        if self.on_change_select  then
            self.on_change_select(index)
        end 
    end
end


local M = {}
M.PickerView = class('PickerView',UI.ScrollView,{
        __init__ = function (self,args)

        local start = Clock.now()
        args.dimension = kVertical
        super(M.PickerView, self).__init__(self, args)
        Log.v("PickerView __init__ 1",Clock.now() - start)
        self.container = Widget()--layout.FloatLayout{spacing = Point(0,0)}
        self.container.relative = true
        self.content = self.container

        Log.v("PickerView __init__ 2",Clock.now() - start)
        self.row_height = args.row_height or 50
        self.row_height = self.row_height * System.getLayoutScale()
        self.cell_spacing = args.cell_spacing or 0
        self.size = args.size or Point(0,0)
        self.size = Point(self.size.x * System.getLayoutScale(), self.size.y * System.getLayoutScale())
        self.content.size = self.size


        self.children_font_color = args.children_font_color or {139, 106, 64}
        self.children_font_size = args.children_font_size or 40


        self.data = args.data or {}


        self.content.on_content_bbox_changed = function(_)
            self.kinetic.x.max = 0
            self.kinetic.y.max = (self.height - self.row_height) /2
            if bit.band(self.dimension,kHorizental)  == kHorizental then
                self.kinetic.x.min = -(self._content.content_bbox.w - self.width)
            end
            if bit.band(self.dimension,kVertical) == kVertical then
                self.kinetic.y.min = -(self._content.content_bbox.h - self.height) - (self.height - self.row_height) /2
            end
        end

        self.on_value_changed = function(self, h,v )
            local direction = Point(h.value,v.value) - self._content.pos
            if direction ~= Point(0,0) then
                self._scrolling = true
                self._content.pos = Point(h.value,v.value)
                self:on_scroll(Point(h.value,v.value), direction, Point(h.decay.velocity,v.decay.velocity))
            end
        end

        self._childrens = {}

        self.on_cleanup = function()
            for i,v in ipairs(self.m_items) do
                if v.text then
                    delete(v.text)
                    v.text = nil
                end
            end
        end

        self.kinetic.x.on_stop = nil
        -- Log.v("PickerView __init__",Clock.now() - start)
    end,
    _init_view = function ( self )
        local start = Clock.now()
        if self.data and type(self.data) == "table" then
            self.m_items = {}
            local page_count = math.ceil(self.height / self.row_height)
            local index = 1
            local count = #self.data
            self.content.height = count*self.row_height
            local setdefault = 1


            self._positiveHandle = Clock.instance():schedule(function (  )
                for i=index,index + page_count do
                    if i > count then
                        self.init_finish = true
                        return true
                    end
                    self.init_finish = false

                    local cell = self:get_view(i)
                    assert(cell,'item of '..i.. 'does not exist')
                    self.container:add(cell)
                    self.m_items[i] = cell
                end
                index = index + page_count + 1;   
            end)
        end
    end,

    set_default_color = function(self, index, color_before)
        self.m_defatulIndex = index;
        self.m_color_before = color_before;
        self:_refresh_color();
    end,

    showing_index = {function ( self )
        return self._showing_index
    end,function ( self,v )
        self._showing_index = v 
        local page_count = math.ceil(self.height / self.row_height/2)
        local min = math.max(#self.m_items,1)
        local max = #self.data

        -- Log.v("self._showing_index",self.m_items)
        if self._positiveHandle then
            self._positiveHandle:cancel()
            self._positiveHandle = nil
        end

        if self._reverseHandle then
            self._reverseHandle:cancel()
            self._reverseHandle = nil
        end

        local positiveIndex = self._showing_index + 1
        local reverseIndex = self._showing_index - 1

        if not self.m_items[self._showing_index] then
            local cell = self:get_view(self._showing_index)
            assert(cell,'item of '..self._showing_index.. 'does not exist')
            self.container:add(cell)
            self.m_items[self._showing_index] = cell
        end
        

        self._positiveHandle = Clock.instance():schedule(function (  )
                for i=positiveIndex,positiveIndex + page_count do
                    if i > max then
                        self.init_finish = true
                        return true
                    end
                    self.init_finish = false
                    if self.m_items and not self.m_items[i] then
                        local cell = self:get_view(i)
                        assert(cell,'item of '..i.. 'does not exist')
                        self.container:add(cell)
                        self.m_items[i] = cell
                    end
                end
                positiveIndex = positiveIndex + page_count + 1
        end)

        self._reverseHandle = Clock.instance():schedule(function (  )
                for i=reverseIndex,reverseIndex - page_count ,-1 do
                    if i < min then
                        self.init_finish = true
                        return true
                    end
                    self.init_finish = false
                    if self.m_items and not self.m_items[i] then
                        local cell = self:get_view(i)
                        assert(cell,'item of '..i.. 'does not exist')
                        self.container:add(cell,self.m_items[i + 1])
                        self.m_items[i] = cell
                    end
                end

                reverseIndex = reverseIndex - page_count - 1
        end)

        Clock.instance():schedule_once(function ( ... )
            toDefault(self,self.showing_index,false)
            Clock.instance():schedule_once(function ( ... )
                toDefault(self,self.showing_index,true)
            end)
        end)

    end},
    _on_changed_data = function ( self )
        -- 数据改变时回调
        local start = Clock.now()
        self.init_finish = false
        if self._positiveHandle then
            self._positiveHandle:cancel()
            self._positiveHandle = nil
        end
        if self._reverseHandle then
            self._reverseHandle:cancel()
            self._reverseHandle = nil
        end
        if self.m_items then
            for _,v in pairs(self.m_items) do
                if v.text then
                    delete(v.text)
                    v.text = nil
                end
            end
        end
        -- Log.v("_on_changed_data 1====================", Clock.now() - start)
        self.container:remove_all()
        -- Log.v("_on_changed_data 2====================", Clock.now() - start)
        self:_init_view()

        -- Log.v("_on_changed_data====================", Clock.now() - start)
    end,
    _on_update_data = function ( self ,index,data_item)
        -- 更新数据时回调
        local item = self.m_items[index]
        if item then
            item.children[1]:set_data{{text = self.data[index],color = Color(unpack(self.children_font_color)),size = self.children_font_size}}
        end
    end,
    _on_delete_data = function ( self,index )
        -- body
        local item = self.m_items[index]
        if item then
            if v.text then
                delete(v.text)
                v.text = nil
            end
            self.container:remove(item)
            table.remove(self.m_items,index)
        end
    end,
    _on_insert_data = function ( self,index )
        local cell = self:get_view(index)
        assert(cell ~= nil,'item of '..index.. 'does not exist')
        local refer_cell = self.m_items[index]
        table.insert(self.m_items,index,cell)
        self.container:add(cell,refer_cell)
    end,
    data = {function (self)
        return self._data
    end,function(self,value)
        assert(type(value) == 'table','the data type must be a table.')
        self._data = value
        self:_on_changed_data()
    end},
    update_item = function (self,index,data_item)
        assert(index > 0 and index <= #self.data,"invalid index:" .. tostring(index))
        self.data[index] = data_item
        self:_on_update_data(index,data_item)
    end,
    delete = function ( self,index )
        assert(index > 0 and index <= #self.data,"invalid index:" .. tostring(index))
        table.remove(self.data,index)
        self:_on_delete_data(index)
    end,
    insert = function ( self,item,index)
        assert(index == nil or (index > 0 and index <= #self.data),"invalid index:" .. tostring(index))
        if index then
            table.insert(self.data,index,item)
        else
            table.insert(self.data,item)
            index = #self.data
        end
        self:_on_insert_data(index)
    end,
    get_view = function ( self,index )
        -- assert(self.data[index] ~= nil and type(self.data[index]) == 'string',"the data of ".. tostring(index) .." is invalid." .. tostring(debug.traceback()) ) 
        local widget = Widget()
        widget:add_rules{AL.width:eq(AL.parent('width')),
                        AL.height:eq(self.row_height)}
        widget.tag = self.data[index]
        widget.y = (index-1)*self.row_height
        widget.text = new(Text, self.data[index], nil, nil, nil, nil, self.children_font_size, unpack(self.children_font_color))
        widget:add(widget.text:getWidget())
        local text_x, text_y = widget.text:getSize()
        widget.text:getWidget().pos = Point((self.size.x - text_x) / 2, (self.row_height - text_y * System.getLayoutScale()) / 2)

        widget.on_msg_chain = function(widget_self, touch, canceled)
            if not canceled and touch.action == kFingerUp then
                Clock.instance():schedule_once(function ()
                    self:select_item(index, 0.2)
                end)
            end
        end
        return widget
    end,
    on_touch_up = function ( self, p, t)
        -- body
        super(M.PickerView, self).on_touch_up(self,p,t)
    
        local v = self.kinetic['y'].velocity
        local t = 0
        if math.abs(v) <= 50 then
            v = 0
        else
            t = - math.log(math.abs(v) + 0.01) / math.log(0.95) * 0.01
            t = math.abs(t)
        end
        local target = (self.height  + self.row_height) / 2  - (self.kinetic['y'].value + v * t / 2)
        local index = math.floor(target / self.row_height + 0.5)
        if index > #self.data then 
            index = #self.data 
        elseif index < 1 then  
            index =  1 
        end
        self:select_item(index,t)
    end,
    _on_size_changed = function ( self )
        super(M.PickerView, self)._on_size_changed(self)

        -- 调整其高度
        self.kinetic.y.min = -(self._content.content_bbox.h - self.height) - (self.height - self.row_height) /2
        self.kinetic.y.max = (self.height - self.row_height) /2

        self.kinetic.x.min = -(self._content.content_bbox.w - self.width) 
        self.kinetic.x.max = 0
    end,
    on_scroll = function(self, p, d, v)
        --super(M.PickerView, self).on_scroll(self, p, d, v)
        self:_update(p,d)
    end,
    _update = function ( self,p ,d)
        -- body

        self.m_testTime = Clock.now()

        local target = self.height / 2  - p.y
        local index = math.floor(target / self.row_height + 0.5)
        local page_count = math.ceil((self.height / self.row_height)/2) 

        local color_target = (self.height - self.row_height) / 2  - p.y
        local color_index =  math.ceil(color_target / self.row_height + 0.5)
        
        local height = self.height
        local wdith = self.width

        local c1,c2,c3 = unpack(self.children_font_color);

        for i=index - page_count,index + page_count do
            if self.m_items[i] then
                local testTime = Clock.now()
                local v =  self.m_items[i]
                local distance = math.abs(target - v.y - self.row_height /2 )
                local x = distance > height *3/2 and 0 or distance
                local text = v.text:getWidget();
                local scale= 1-math.pow(1.5/height,2)*math.pow(x,2)
                -- Log.v("_update",scale,i)
                if scale > 0.1 then 
                    text.scale = Point(scale,scale)
                    text.colorf = Colorf(1.0,1.0,1.0,scale)
                    local c_x = wdith - text.size.x * scale
                    text.x = c_x /2
                    if v.text then 
                        if i == color_index then
                            v.text:setColor(226, 86, 0, scale)
                        else
                            v.text:setColor(c1,c2,c3,scale)
                        end
                    end
                end
            end
        end
    end,
    select_item = function (self,index,t)
        
        assert((index > 0 and index <= #self.data),"invalid index:" .. tostring(index))
        local target = -((index - 1) * self.row_height - (self.height - self.row_height)/2)
        self:scroll_to(Point(0,target),t)
    end,
    _on_stop = function(self)
        super(M.PickerView, self)._on_stop(self)
        local target = (self.height  + self.row_height) / 2  - self.content.y
        local index = math.floor(target / self.row_height + 0.5)

        self:_refresh_color();
        if self.on_change_select  then
            self.on_change_select(index)
        end    
    end,

    _refresh_color = function(self)
        local target = (self.height  + self.row_height) / 2  - self.content.y
        local index = math.floor(target / self.row_height + 0.5)

        for i,v in pairs(self.m_items) do
            if v.text then
                if self.m_defatulIndex and i < self.m_defatulIndex then
                    v.text:setColor(unpack(self.m_color_before));
                elseif i == index then
                    v.text:setColor(226, 86, 0, 1)
                else
                    v.text:setColor(unpack(self.children_font_color))
                end
            end
        end        
    end,


    stop_kinetic = function(self)
        self.kinetic.y:cancel()
    end,
    })

M.test = function (root)
     local data = {"1991",
                "1992",
                "1993",
                "1994",
                "1995",
                "1996",
                "1997",
                "1998",
                "1999",
                "2000",
                "2001",
                "2002",
                "2003",}

    local pickerView = M.PickerView{
            size = Point(500,600),
        }
    pickerView.data = data
    pickerView.background_color = Colorf(1.0,1.0,1.0)
    local w= Widget()
    w.size = Point(500,50)
    w.background_color = Colorf(0.0,0.0,0.0,0.5)
    w.pos = Point(0,275)
    pickerView:add(w)


    pickerView.on_change_select = function (index)
        print("pickerView",index)
    end
    root:add(pickerView)
end
return M.PickerView