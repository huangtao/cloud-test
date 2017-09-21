---
-- 布局模块.
-- 包含了GridLayout和FloatLayout.
-- @module byui.layout
-- @extends byui#byui.layout
-- @return #byui.layout 
local M = {}
require('byui/utils')
local class, mixin, super = unpack(require('byui/class'))

---
-- 网格布局.
-- 详细说明请参考[网格布局](http://engine.by.com:8000/doc/ui.html#gridlayout)。
-- @type byui.GridLayout
-- @extends engine#Widget 
-- @usage byui.GridLayout{rows = 3,cols=4}

---
-- 创建网格布局对象.
-- @callof #byui.GridLayout
-- @param #byui.GridLayout self 
-- @param #table args 构造时传入的参数.<br/>
--                    1. cols:number类型,表示列的数目。
--                    2. rows:number类型,表示行的数目。
--                    3. align:ALIGN,每一个网格中元素的对齐方式。默认为ALIGN.TOPLEFT。
--                    4. dimension:取值为kHorizental和kVertical,元素排列生长的方向。
-- @return #byui.GridLayout 返回创建的网格布局对象. 

---
-- 网格布局.
-- 参看@{#byui.GridLayout}
-- @field [parent=#byui.layout] #byui.GridLayout GridLayout 
M.GridLayout = class('GridLayout', Widget, {
    __init__ = function(self, args)
        super(M.GridLayout, self).__init__(self, args)
        self.rows = args.rows
        self.cols = args.cols
        self.align = args.align or ALIGN.TOPLEFT
        self.dimension = args.dimension or kVertical
        self.lua_layout_children = function(self)
            self:layout()
        end
    end,
    -- add = function(self, w)
    --     super(M.GridLayout, self).add(self, w)
    --     local unit = Point(self.width / self.cols, self.height / self.rows)
    --     local i = #self.children - 1
    --     local c,r
    --     local offset_h = unit.x - w.width
    --     local offset_v = unit.y - w.height
    --     local x_c = align_h(self.align)
    --     local y_c = align_v(self.align)/4
    --     if self.dimension == kVertical then
    --         c = i % self.cols
    --         r = math.floor(i / self.cols)
    --     else
    --         c = math.floor(i / self.rows)
    --         r = i % self.rows 
    --     end
    --     w.pos = Point(c * unit.x + (-0.75*x_c*x_c+3.25*x_c-2.5) *offset_h, r * unit.y+(-0.75*y_c*y_c+3.25*y_c-2.5) *offset_v)
    -- end,
    layout = function(self)
        local unit = Point(self.width / self.cols, self.height / self.rows)
            ---
            -- top,left 1 ---> 0
            -- buttom,right 2 ---> 1
            -- center,center 3 ---> 0.5
            -- formula： -0.75*x^2 + 3.25*x - 2.5
        if self.dimension == kVertical then
            for i, w in ipairs(self.children) do
                w.compat_rules = {}
                w:update_constraints()
                i = i - 1
                local c = i % self.cols
                local r = math.floor(i / self.cols)

                local offset_h = unit.x - w.width
                local offset_v = unit.y - w.height
                local x_c = align_h(self.align)
                local y_c = align_v(self.align)/4

                w.pos = Point(c * unit.x + (-0.75*x_c*x_c+3.25*x_c-2.5) *offset_h, r * unit.y+(-0.75*y_c*y_c+3.25*y_c-2.5) *offset_v)
            end
        else
            for i, w in ipairs(self.children) do
                w.compat_rules = {}
                w:update_constraints()
                i = i - 1
                local c = math.floor(i / self.rows)
                local r = i % self.rows

                local offset_h = unit.x - w.width
                local offset_v = unit.y - w.height
                local x_c = align_h(self.align)
                local y_c = align_v(self.align)/4

                w.pos = Point(c * unit.x + (-0.75*x_c*x_c+3.25*x_c-2.5) *offset_h, r * unit.y+(-0.75*y_c*y_c+3.25*y_c-2.5) *offset_v)
            end
        end
        
    end,
    
    ---
    -- 元素在网格的对齐方式.
    -- 在修改对齐方式后会立刻重新重新布局。
    -- @field [parent=#byui.GridLayout] byui.utils#ALIGN align 
    align = {function ( self )
        return self._algin or ALIGN.TOPLEFT
    end,function ( self,value )
        self._algin = value
        self:layout()
    end},
    
    ---
    -- 元素在网格的生长方向.
    -- 在修改方向后会立刻重新布局。<br/>
    -- 取值为@{#byui.utils.kHorizental}和@{#byui.utils.kVertical}
    -- @field [parent=#byui.GridLayout] #number dimension 
    dimension = {function ( self )
        return self._dimension or kVertical
    end,function ( self,value )
        self._dimension  = value or kVertical
        self:layout()
    end},
}, true)



---
-- 线性布局.
-- 详细说明请参考[线性布局](http://engine.by.com:8000/doc/ui.html#floatlayout)。
-- @type byui.FloatLayout
-- @extends engine#Widget 
-- @usage byui.FloatLayout{spacing =  Point(0,0)}

---
-- 创建一个线性布局.
-- @callof #byui.FloatLayout
-- @param #byui.FloatLayout self 
-- @param #table args 构造时传入的参数.<br/>
--                    1. spacing:Point类型,表示子元素之间的间距。
--                    2. dimension:取值为kHorizental和kVertical,元素排列生长的方向。
-- @return #byui.FloatLayout 返回创建的线性布局对象.                  


---
-- 线性布局.
-- 参看@{#byui.FloatLayout}
-- @field [parent=#byui.layout] #byui.FloatLayout FloatLayout
M.FloatLayout = class('FloatLayout', Widget, {
    __init__ = function(self, args)
        super(M.FloatLayout, self).__init__(self, args)
        self.spacing = args.spacing or Point(0,0)
        self._pen = Point(0,0)
        self._line_height = 0
        self.dimension = args.dimension or kVertical
        self.lua_layout_children = function(self)
            self:layout()
        end
    end,
    
    ---
    -- 子元素之间的间隔.
    -- spacing.x表示水平方向的间距，spacing.y表示垂直方向的间距。
    -- @field [parent=#byui.FloatLayout] engine#Point spacing 
    spacing = {function(self)
        return self._spacing
    end, function(self, s)
        if self._spacing ~= s then
            self._spacing = s
            self:layout()
        end
    end},
    layout = function(self)
        self._pen = Point(0,0)
        self._layout_size = Point(0,0)
        for i, w in ipairs(self.children) do
            self:_append(w)
        end
    end,
    -- add = function(self, w,r)
    --     super(M.FloatLayout, self).add(self, w)
    --     self:_append(w) 
    -- end,
    _append = function(self, w)
        w.compat_rules = {}
        w:update_constraints()
        if self.dimension == kVertical then
            if self._pen.x == 0 or self._pen.x + w.width <= self.width then
                w.pos = self._pen
                w.vars.left.value = self._pen.x
                w.vars.top.value = self._pen.y
                self._pen.x = self._pen.x + w.width + self.spacing.x

                if w.height > self._layout_size.y then
                    self._layout_size.y = w.height
                end
            else
                -- break line
                self._pen.x = 0
                self._pen.y = self._pen.y + self._layout_size.y + self.spacing.y
                self._layout_size.y = w.height
                w.pos = self._pen
                w.vars.left.value = self._pen.x
                w.vars.top.value = self._pen.y
                self._pen.x = self._pen.x + w.width + self.spacing.x
            end
        else
            if self._pen.y == 0 or self._pen.y + w.height <= self.height then
                w.pos = self._pen
                w.vars.left.value = self._pen.x
                w.vars.top.value = self._pen.y
                self._pen.y = self._pen.y + w.height + self.spacing.y

                if w.width > self._layout_size.x then
                    self._layout_size.x = w.width
                end
            else
                -- break line
                self._pen.y = 0
                self._pen.x = self._pen.x + self._layout_size.x + self.spacing.x
                self._layout_size.x = w.width
                w.pos = self._pen
                w.vars.left.value = self._pen.x
                w.vars.top.value = self._pen.y
                self._pen.y = self._pen.y + w.height + self.spacing.y
            end
        end
    end,
    
    ---
    -- 元素生长方向.
    -- 在修改方向后会立刻重新布局。<br/>
    -- 取值为@{#byui.utils.kHorizental}和@{#byui.utils.kVertical}
    -- @field [parent=#byui.FloatLayout] #number dimension 
    dimension = {function ( self )
        return self._dimension or kVertical
    end,function ( self,value )
        self._dimension  = value or kVertical
        self:layout()
    end},
}, true)

---
-- 测试Demo.
-- @field [parent=#byui.layout] #function test 
function M.test(root)
    -- local l = M.GridLayout{
    --     cols = 4,
    --     rows = 6,
    --     dimension = kHorizental,
    -- }
    local l = M.FloatLayout{
       spacing = Point(5,5),
    }
    l.background_color = Colorf(0.5,0.5,0.5,1.0)
    l.size = Point(300,300)
    -- for i=1,30 do
    --     local s = Sprite()
    --     s.unit = TextureUnit.default_unit()
    --     s.size = Point(10,10)
    --     l:add(s)
    -- end
    Clock.instance():schedule(function ( ... )
        local s = Sprite()
        s.unit = TextureUnit.default_unit()
        s.size = Point(100,100)
        l:add(s)
    end,1)

    -- Clock.instance():schedule_once(function ( ... )
    --     print("添加")
    --     local s = Sprite()
    --     s.unit = TextureUnit.default_unit()
    --     s.size = Point(10,10)
    --     s.colorf = Colorf(1.0,0.0,0.0,1.0)
    --     l:add(s,l.children[10])
    -- end,30)
    root:add(l)

    -- for k,v in pairs(ALIGN) do
    --     local align = {["k"] = k,["v"]=v}
    --     Clock.instance():schedule_once(function ( ... )
    --         l.align = align.v
    --     end,align.v*2)
    -- end
    
end

return M
