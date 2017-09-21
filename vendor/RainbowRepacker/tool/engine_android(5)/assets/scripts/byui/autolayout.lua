require('byui/utils')
local class, mixin, super, cls_utils = unpack(require('byui/class'))
---
-- AutoLayout.
-- @module byui.autolayout
-- @return #byui.autolayout
local M = {}

--- 
-- 居中对齐.
-- @field [parent=#global] #number kAlignCenter 
kAlignCenter		= 0;
--- 
-- 顶部居中对齐.
-- @field [parent=#global] #number kAlignTop 
kAlignTop			= 1;
--- 
-- 右上角对齐.
-- @field [parent=#global] #number kAlignTopRight
kAlignTopRight		= 2;
--- 
-- 右部居中对齐.
-- @field [parent=#global] #number kAlignTopRight
kAlignRight	    = 3;
--- 
-- 右下角对齐.
-- @field [parent=#global] #number kAlignBottomRight
kAlignBottomRight	= 4;
--- 
-- 下部居中对齐.
-- @field [parent=#global] #number kAlignBottom
kAlignBottom		= 5;
--- 
-- 左下角对齐.
-- @field [parent=#global] #number kAlignBottomLeft
kAlignBottomLeft	= 6;
--- 
-- 左部居中对齐.
-- @field [parent=#global] #number kAlignLeft
kAlignLeft			= 7;
--- 
-- 左上角对齐.
-- @field [parent=#global] #number kAlignTopLeft
kAlignTopLeft		= 8;


-- expression metamethods
local function print_op(op)
    if op == kiwi.OP_EQ then
        return '=='
    elseif op == kiwi.OP_GE then
        return '>='
    elseif op == kiwi.OP_LE then
        return '<='
    else
        error('')
    end
end
local function linear_expression_methods(cls, get_type)
    local r
    r = {
        Variable = {
            __tostring = function(self)
                return self.name
            end,
            __add = function(self, o)
                return cls.Term(self) + o
            end,
            __unm = function(self, o)
                return cls.Term(self, -1)
            end,
            __sub = function(self, o)
                return self + (-o)
            end,
            __mul = function(self, o)
                assert(get_type(o) == 'number', 'invalid target')
                return cls.Term(self, o)
            end,
            __div = function(self, o)
                return self * (1/o)
            end,
            ---
            -- 等于操作符.
            -- @function [parent=#Variable] eq
            -- @param #Variable self 
            -- @param #Expression o 赋值的表达式
            -- @return #Constraint 返回的约束
            -- @usage AL.width:eq(100)
            eq = function(self, o)
                return cls.Term(self):eq(o)
            end,
            ---
            -- 小于等于操作符.
            -- @function [parent=#Variable] le
            -- @param #Variable self 
            -- @param #Expression o 赋值的表达式
            -- @return #Constraint 返回的约束
            -- @usage AL.width:le(100) -- 宽度小于等于100
            le = function(self, o)
                return cls.Term(self):le(o)
            end,
            ---
            -- 大于等于操作符.
            -- @function [parent=#Variable] ge
            -- @param #Variable self 
            -- @param #Expression o 赋值的表达式
            -- @return #Constraint 返回的约束
            -- @usage AL.width:ge(100)   --宽度大于等于100
            ge = function(self, o)
                return cls.Term(self):ge(o)
            end,
        },
        Term = {
            __tostring = function(self)
                return string.format('%s * %s', r.Variable.__tostring(self.variable), self.coefficient)
            end,
            __add = function(self, o)
                local t = get_type(o)
                if t == 'number' then
                    return cls.Expression({self}, o)
                elseif t == cls.Variable then
                    return cls.Expression({self, cls.Term(o)}, 0)
                elseif t == cls.Term then
                    return cls.Expression{self, o}
                elseif t == cls.Expression then
                    return o + self
                else
                    assert(false, 'invalid add argument')
                end
            end,
            __unm = function(self)
                return cls.Term(self.variable, -self.coefficient)
            end,
            __sub = function(self, o)
                return self + (-o)
            end,
            __mul = function(self, o)
                return cls.Term(self.variable, self.coefficient * o)
            end,
            __div = function(self, o)
                return self * (1/o)
            end,
            eq = function(self, o)
                return cls.Expression({self}):eq(o)
            end,
            le = function(self, o)
                return cls.Expression{self}:le(o)
            end,
            ge = function(self, o)
                return cls.Expression{self}:ge(o)
            end,
        },
        Expression = {
            __tostring = function(self)
                local s = ''
                for _, t in ipairs(self.terms) do
                    s = s .. string.format('%s + ', r.Term.__tostring(t))
                end
                s = s .. tostring(self.constant)
                return s
            end,
            __add = function(self, o)
                local t = get_type(o)
                if t == 'number' then
                    return cls.Expression(self.terms, self.constant + o)
                elseif t == cls.Variable then
                    return self + cls.Term(o)
                elseif t == cls.Term then
                    local terms = table.copy(self.terms)
                    table.insert(terms, o)
                    return cls.Expression(terms, self.constant)
                elseif t == cls.Expression then
                    local terms = table.copy(self.terms)
                    table.append(terms, o.terms)
                    return cls.Expression(terms, self.constant + o.constant)
                else
                    assert(false, 'invalid add argument' .. tostring(o))
                end
            end,
            __unm = function(self)
                return self * -1
            end,
            __sub = function(self, o)
                return self + (-o)
            end,
            __mul = function(self, o)
                assert(type(o) == 'number', 'invalid multiply argument')
                local terms = {}
                for _, term in ipairs(self.terms) do
                    table.insert(terms, term * o)
                end
                return cls.Expression(terms, self.constant * o)
            end,
            __div = function(self, o)
                return self * (1/o)
            end,
            eq = function(self, o)
                return cls.Constraint(self - o, kiwi.OP_EQ, kiwi.STRONG)
            end,
            le = function(self, o)
                return cls.Constraint(self - o, kiwi.OP_LE, kiwi.STRONG)
            end,
            ge = function(self, o)
                return cls.Constraint(self - o, kiwi.OP_GE, kiwi.STRONG)
            end
        },
        Constraint = {
            __tostring = function(self)
                return string.format('%s %s 0 [%d]', r.Expression.__tostring(self.expression), print_op(self.op), self.strength)
            end,
            ---
            -- 设置优先级.
            -- 优先级的文档请参考[优先级](http://engine.by.com:8000/doc/sphinx/build/html/autolayout.html#id6)
            -- @function [parent=#Constraint] priority
            -- @param #Constraint self 
            -- @param #number s 优先级的值
            -- @usage  
            -- local parent = Widget()
            -- parent.background_color = Colorf.red
            -- parent:add_rules{AL.width:eq(300),
            --                 AL.height:eq(300), }
            --
            -- local widget = Widget()
            -- widget:add_rules({AL.width:eq(AL.parent('width')):priority(kiwi.MEDIUM)  --宽度等于父节点的宽度，优先级为kiwi.MEDIUM
            --                ,AL.width:le(300):priority(kiwi.REQUIRED)                                    --宽度小于300 ，优先级为kiwi.REQUIRED
            --                    })
            -- widget:add_rules(AL.rules.align(ALIGN.CENTER))
            -- widget:add_rules({AL.height:eq(200)})
            -- widget.background_color = Colorf.white
            -- parent:add(widget)
            -- Window.instance().drawing_root:add(parent)
            --
            -- Clock.instance():schedule_once(function ( ... )
            --     parent.autolayout_mask = Widget.AL_MASK_WIDTH   --parent不再使用规则，而是自定义的宽度。
            --     parent.width = 400                                                         -- 修改父节点宽度，此时widget 的宽度规则不能同时满足，选取优先级高的那一个
            -- end,2)
            priority = function(self, s)
                return cls.Constraint(self.expression, self.op, s)
            end,
        },
    }
    return r
end

local function setup_metamethods(cls)
    local methods = linear_expression_methods(cls, function(o)
        if type(o) == 'number' then
            return 'number'
        else
            return assert(o.class, 'invalid type')
        end
    end)
    for k, v in pairs(cls) do
        table.merge(v.___class, methods[k])
    end
end

local function getvar(elem, name)
    return elem.vars[name]
end

local function memorize(fn)
    local cache = {}
    return function(...)
        local tmp = {}
        for _, arg in ipairs{...} do
            table.insert(tmp, tostring(arg))
        end
        local k = table.concat(tmp)
        local v = cache[k]
        if v ~= nil then
            return v
        end
        v = fn(...)
        cache[k] = v
        return v
    end
end

---
-- 变量.
-- 变量重载了+-*/的操作符，均只能和数一起使用.
-- @type Variable
-- @usage 
--  local AL = require('ui/autolayout')
--  -- 横向居中
--  AL.centerx:eq(AL.parent('width') * 2)
--  -- 横向居右 
--  AL.right:eq(AL.parent('width') + 10)
--  -- 纵向居上
--  AL.top:eq(0)
--  -- 纵向居中
--  AL.centery:eq(AL.parent('height') / 2)
--  -- 宽度等于父节点减60
--  AL.width:eq(AL.parent('width') - 60)
--  -- 高度只占父节点一半
--  AL.height:eq(AL.parent('height') / 2) 
--  -- 指定的大小
--  AL.height:eq(200) 

---
-- 创建一个变量.
-- 1.四个基本变量 left, top, width, height ，对应 Widget 的 pos 和 size 属性。<br/>
-- 2.其他衍生变量：
--      right (= left + width)
--      right (= left + width)
--      bottom (= top + height)
--      centerx (= left + width / 2)
--      centery (= top + height / 2)
--      leading (= left)
--      trailing (= parent.width  - left - width)
-- @callof #Variable
-- @param #Variable self 
-- @param #string name 变量的名称.代表当前的Widget的属性.
-- @param #function selector 默认为nil此时选择的变量为当前的Widget的属性,通过selector你可以选则非当前Widget的变量.
-- @return #Variable 返回一个变量.
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local w = Widget()
-- w:add_rules{AL.width:eq('100'),-- 此处的AL.width就是一个基本变量.等价于Al.Variable('width')
--             AL.height:eq(AL.parent('height')) } 
--          -- 此处AL.parent('height')即引用非当前的Widget的变量.
--          -- 等价于Al.Variable('height',function(elem, name)
--          --        -- 此处的elem 即当前的widget。
--          --        return elem的父节点的为name的变量
--          --     end)
-- 

---
-- 变量.
-- 查看@{#Variable}
-- @field [parent=#byui.autolayout] #Variable Variable 
--RVariable

---
-- 表达式中的项.
-- 每一个项:=Variable * 系数。在lua用户不需要自己去创建，每一条规则会生成若干个Term。
--      width*2 + left*1 = 0
--      这里的width*2 就是一项.width是一个Variable，2是对应的系数
-- @type Term

---
-- 生成表达式中的一项.
-- @callof #Term
-- @param #Term self 
-- @param #Variable var 变量.
-- @param #number coefficient 变量对应的系数.
-- @return #Term 返回生成的项.

---
-- 表达式中的项.
-- 查看@{#Term}
-- @field [parent=#byui.autolayout] #Term Term 
--RTerm

---
-- 表达式.
-- 表达式由若干项和一个常数项组成.如:width*2 + left*1  + 100 。
-- 在lua用户不需要自己去创建，每一条规则会生成一个表达式。
-- @type Expression

---
-- 创建一个表达式.
-- @callof #Expression
-- @param #Expression self 
-- @param #table terms 变量的项的集合.
-- @param #number const 常数项对应的值.
-- @return #Expression 返回创建的表达式


---
-- 表达式.
-- 查看@{#Expression}
-- @field [parent=#byui.autolayout] #Expression Expression 
--RExpression

---
-- 约束.
-- 约束:= 表达式:比较操作(表达式):priority(优先级)。
-- 表达式可以使用变量、数值常量和任意 +-/* 操作符进行组合。
--      比较操作有:相等 eq
--              小于等于 le
--              大于等于 ge
-- @type Constraint
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local w = Widget()
-- w:add_rules{AL.height:eq(AL.parent('height')*0.3 + 20):priority(kiwi.REQUIRED) } 
-- 这里就是一个完整的约束。你可以省略priority(kiwi.REQUIRED) 那优先级就是默认的kiwi.STRONG

---
-- 约束.
-- @callof #Constraint
-- @param #Constraint self 
-- @param #Expression expr 表达式.
-- @param #function op 比较操作符.
-- @param #number strength 优先级.
-- @return #Constraint 返回创建的约束.


---
-- 表达式.
-- 查看@{#Constraint}
-- @field [parent=#byui.autolayout] #Constraint Constraint 
--RConstraint

-- init solver expression metamethods
setup_metamethods{
    Variable = kiwi.Variable,
    Term = kiwi.Term,
    Expression = kiwi.Expression,
    Constraint = kiwi.Constraint,
}

-- init rules expression metamethods
setup_metamethods{
    Term = RTerm,
    Variable = RVariable,
    Expression = RExpression,
    Constraint = RConstraint,
}

local v1 = kiwi.Variable('test')
assert(v1.class == kiwi.Variable)
assert(getmetatable(v1) == kiwi.Variable.___class)
local v2 = RVariable(RVariable.VAR_LEFT, RVariable.SELECTOR_SELF)
assert(v2.class == RVariable)
assert(getmetatable(v2) == RVariable.___class)

---
-- 访问父节点的属性.
-- @function [parent=#byui.autolayout] parent
-- @param #string name 属性的名称.
-- @return #Variable 父节点给定name对应的属性.
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local w = Widget()
-- w:add_rules{AL.height:eq(AL.parent('height')) }  -- 访问父节点'height'用来设置自己的'height'
local function get_var_type(name)
    if name == 'left' then
        return RVariable.VAR_LEFT
    elseif name == 'top' then
        return RVariable.VAR_TOP
    elseif name == 'width' then
        return RVariable.VAR_WIDTH
    elseif name == 'height' then
        return RVariable.VAR_HEIGHT
    end
end
local function get_rvariable(name, ...)
    local t = get_var_type(name)
    if t then
        return RVariable(t, ...)
    elseif name == 'right' then
        return RVariable(RVariable.VAR_LEFT, ...) + RVariable(RVariable.VAR_WIDTH, ...)
    elseif name == 'bottom' then
        return RVariable(RVariable.VAR_TOP, ...) + RVariable(RVariable.VAR_HEIGHT, ...)
    elseif name == 'centerx' then
        return RVariable(RVariable.VAR_LEFT, ...) + RVariable(RVariable.VAR_WIDTH, ...) * 0.5
    elseif name == 'centery' then
        return RVariable(RVariable.VAR_TOP, ...) + RVariable(RVariable.VAR_HEIGHT, ...) * 0.5
    elseif name == 'leading' then
        return RVariable(RVariable.VAR_LEFT, ...)
    elseif name == 'trailing' then
        return RVariable(RVariable.VAR_WIDTH, RVariable.SELECTOR_PARENT) - RVariable(RVariable.VAR_LEFT, ...) - RVariable(RVariable.VAR_WIDTH, ...)
    else
        error('invalid variable name ' .. name)
    end
end
local function get_parent_rvariable(name)
    if name == 'left' or name == 'top' then
        return 0
    end
    if name == 'width' or name == 'right' then
        return RVariable(RVariable.VAR_WIDTH, RVariable.SELECTOR_PARENT)
    elseif name == 'height' or name == 'bottom' then
        return RVariable(RVariable.VAR_HEIGHT, RVariable.SELECTOR_PARENT)
    elseif name == 'centerx' then
        return RVariable(RVariable.VAR_WIDTH, RVariable.SELECTOR_PARENT) * 0.5
    elseif name == 'centery' then
        return RVariable(RVariable.VAR_HEIGHT, RVariable.SELECTOR_PARENT) * 0.5
    else
        error('invalid variable name ' .. name)
    end
end
M.parent = function(name)
    return get_parent_rvariable(name)
end

---
-- 访问后继节点的属性.
-- @function [parent=#byui.autolayout] succ
-- @param #string name 属性的名称.
-- @return #Variable 后继节点给定name对应的属性.
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local root = Widget()
-- root.size = Point(100,100)
-- local w = Widget()
-- root:add(w)
-- local succ = Widget()
-- succ.size = Point(100,60)
-- root:add(succ)
-- w:add_rules{AL.height:eq(AL.succ('height')) }  -- 访问后继节点'height'用来设置自己的'height'
M.succ = function(name)
    return get_rvariable(name, RVariable.SELECTOR_SUCC)
end

---
-- 访问前驱节点的属性.
-- @function [parent=#byui.autolayout] pred
-- @param #string name 属性的名称.
-- @return #Variable 前驱节点给定name对应的属性.
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local root = Widget()
-- root.size = Point(100,100)
-- local pred = Widget()
-- pred.size = Point(100,60)
-- root:add(pred)
-- local w = Widget()
-- root:add(w)
-- w:add_rules{AL.height:eq(AL.pred('height')) }  -- 访问前驱节点'height'用来设置自己的'height'
M.pred = function(name)
    return get_rvariable(name, RVariable.SELECTOR_PRED)
end

---
-- 访问指定的兄弟节点的属性.
-- @function [parent=#byui.autolayout] sibling
-- @param #string name 兄弟节点的名字.
-- @return #function 返回指定兄弟节点的选择器函数.
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local root = Widget()
-- root.size = Point(100,100)
-- local b = Widget()
-- b.size = Point(100,60)
-- b.name = "child"
-- root:add(b)
-- local w = Widget()
-- root:add(w)
-- w:add_rules{AL.height:eq(AL.sibling('child')('height')) }  -- 访问名字为"child"的兄弟节点的'height'用来设置自己的'height'
M.sibling = function(elem_name)
    return function(name)
        return get_rvariable(name, RVariable.SELECTOR_SIBLING, elem_name)
    end
end

local function get_root()
    return Window.instance().drawing_root
end

---
-- 宽度属性.
-- 表示widget的width的大小.
-- @field [parent=#byui.autolayout] #Variable width 
M.width = get_rvariable('width', RVariable.SELECTOR_SELF)
---
-- 高度属性.
-- 表示widget的height的大小.
-- @field [parent=#byui.autolayout] #Variable height 
M.height = get_rvariable('height', RVariable.SELECTOR_SELF)
---
-- left属性.
-- 表示widget的x的位置.
-- @field [parent=#byui.autolayout] #Variable left 
M.left = get_rvariable('left', RVariable.SELECTOR_SELF)
---
-- top属性.
-- 表示widget的y的位置.
-- @field [parent=#byui.autolayout] #Variable top 
M.top = get_rvariable('top', RVariable.SELECTOR_SELF)
---
-- right属性.
-- 表示widget的右边界的位置.即left+width。
-- @field [parent=#byui.autolayout] #Variable right
M.right = get_rvariable('right', RVariable.SELECTOR_SELF)
---
-- bottom属性.
-- 表示widget的下边界的位置.即top+height。
-- @field [parent=#byui.autolayout] #Variable bottom
M.bottom = get_rvariable('bottom', RVariable.SELECTOR_SELF)
---
-- leading属性.
-- 表示widget的左边界的位置.即left。
-- @field [parent=#byui.autolayout] #Variable leading
M.leading = get_rvariable('leading', RVariable.SELECTOR_SELF)

---
-- trailing属性.
-- 表示widget的右边界与父节点右边界的距离.即parent.width  - left - width。
-- @field [parent=#byui.autolayout] #Variable leading
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local w = Widget()
-- w:add_rules{AL.trailing:eq(0)}          --表示右边界和父节点右边界重合
M.trailing = get_rvariable('trailing', RVariable.SELECTOR_SELF)

---
-- centerx属性.
-- 表示widget的中心点的x坐标.即left + width / 2。
-- @field [parent=#byui.autolayout] #Variable centerx
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local w = Widget()
-- w:add_rules{AL.centerx:eq(0)，AL.centery:eq(0)}          --中心点在Point(0,0)点上
M.centerx = get_rvariable('centerx', RVariable.SELECTOR_SELF)

---
-- centery属性.
-- 表示widget的中心点的y坐标.即top + height / 2。
-- @field [parent=#byui.autolayout] #Variable centery
-- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
-- local w = Widget()
-- w:add_rules{AL.centerx:eq(0)，AL.centery:eq(0)}          --中心点在Point(0,0)点上
M.centery = get_rvariable('centery', RVariable.SELECTOR_SELF)


--function M.stack_view_rules()
--    return {
--        container = {},
--        item = {
--            M.left:eq(M.parent('margin_left')),
--            M.right:eq(M.parent('margin_right')),
--        }
--    }
--end

local function compat_align_split(a)
    local t = {
        [kAlignCenter]      = {ALIGN_H.CENTER,  ALIGN_V.CENTER},
        [kAlignTop]         = {ALIGN_H.CENTER,  ALIGN_V.TOP},
        [kAlignBottom]      = {ALIGN_H.CENTER,  ALIGN_V.BOTTOM},
        [kAlignRight]       = {ALIGN_H.RIGHT,   ALIGN_V.CENTER},
        [kAlignTopRight]    = {ALIGN_H.RIGHT,   ALIGN_V.TOP},
        [kAlignBottomRight] = {ALIGN_H.RIGHT,   ALIGN_V.BOTTOM},
        [kAlignLeft]        = {ALIGN_H.LEFT,    ALIGN_V.CENTER},
        [kAlignTopLeft]     = {ALIGN_H.LEFT,    ALIGN_V.TOP},
        [kAlignBottomLeft]  = {ALIGN_H.LEFT,    ALIGN_V.BOTTOM},
    }
    return unpack(t[a])
end

M.compat_align_split = compat_align_split

local function compat_align_rules(align, alignX, alignY)
    local h, v = compat_align_split(align)
    local h_rule
    if h == ALIGN_H.LEFT then
        h_rule = M.left:eq(alignX)
    elseif h == ALIGN_H.CENTER then
        h_rule = M.centerx:eq(M.parent('width') / 2 + alignX)
    elseif h == ALIGN_H.RIGHT then
        h_rule = M.right:eq(M.parent('width') - alignX)
    end
    assert(h_rule ~= nil)

    local v_rule
    if v == ALIGN_V.TOP then
        v_rule = M.top:eq(alignY)
    elseif v == ALIGN_V.CENTER then
        v_rule = M.centery:eq(M.parent('height') / 2 + alignY)
    elseif v == ALIGN_V.BOTTOM then
        v_rule = M.bottom:eq(M.parent('height') - alignY)
    end
    assert(v_rule ~= nil)

    return {h_rule, v_rule}

end

M.compat_align_rules = memorize(compat_align_rules)

M.LayoutItemMixin = {
    __init__ = function(self)
        self.autolayout_enabled = true
        self.compat_rules = {}

        -- set a default value
        self._width_hug = kiwi.WEAK
        self._height_hug = kiwi.WEAK

        self.constraint_dirty = true
        self.constraint_cache = {}

        self.vars = self:lua_vars()
        self.parent_vars = self:lua_parent_vars()

        if not ___clean_byui then
            M.LayoutItemMixin.ctor(self)
        end
    end,
    autolayout_enabled = {function(self)
        return self._autolayout_enabled
    end, function(self, b)
        if self._autolayout_enabled ~= b then
            self._autolayout_enabled = b
            if b then
                self.lua_build_constraints = self.build_constraints
            else
                self.lua_build_constraints = nil
            end
        end
    end},
    build_constraints = function(self)
        if not self.constraint_dirty then
            return self.constraint_cache
        end
        local constraints = {}
        -- basic constraints
        --table.insert(constraints, self.vars.width:ge(0))
        --table.insert(constraints, self.vars.height:ge(0))

        for _, r in ipairs(self.compat_rules) do
            local rr = r(self)
            if type(rr) == 'table' then
                table.append(constraints, rr)
            else
                table.insert(constraints, rr)
            end
        end

        -- apply size hint
        if self.width_hint ~= nil then
            if self.width_hug ~= nil then
                table.insert(constraints, self.vars.width:eq(self.width_hint):priority(self.width_hug))
            end
            if self.width_resist ~= nil then
                table.insert(constraints, self.vars.width:ge(self.width_hint):priority(self.width_resist))
            end
            if self.width_limit ~= nil then
                table.insert(constraints, self.vars.width:le(self.width_hint):priority(self.width_limit))
            end
        end
        if self.height_hint ~= nil then
            if self.height_hug ~= nil then
                table.insert(constraints, self.vars.height:eq(self.height_hint):priority(self.height_hug))
            end
            if self.height_resist ~= nil then
                table.insert(constraints, self.vars.height:ge(self.height_hint):priority(self.height_resist))
            end
            if self.height_limit ~= nil then
                table.insert(constraints, self.vars.height:le(self.height_hint):priority(self.height_limit))
            end
        end

        self.constraint_cache = constraints
        return constraints
    end,
    dump_constraint = function(self)
        print_string(self:__tostring())
        for _, c in ipairs(self.constraint_cache) do
            print_string('    ' .. tostring(c))
        end
    end,
    add_rules = function(self, rules)
        local add_rule = self.add_rule
        for _, rule in ipairs(rules) do
            add_rule(self, rule)
        end
    end,
    size_hint = {function(self)
        return Point(self._width_hint, self._height_hint)
    end, function(self, s)
        self.width_hint = s.x
        self.height_hint = s.y
    end},
    width_hint = {function(self)
        return self._width_hint
    end, function(self, v)
        if self._width_hint ~= v then
            self._width_hint = v
            self.constraint_dirty = true
        end
    end},
    width_hug = {function(self)
        return self._width_hug
    end, function(self, v)
        if self._width_hug ~= v then
            self._width_hug = v
            self.constraint_dirty = true
        end
    end},
    width_resist = {function(self)
        return self._width_resist
    end, function(self, v)
        if self._width_resist ~= v then
            self._width_resist = v
            self.constraint_dirty = true
        end
    end},
    width_limit = {function(self)
        return self._width_limit
    end, function(self, v)
        if self._width_limit ~= v then
            self._width_limit = v
            self.constraint_dirty = true
        end
    end},

    height_hint = {function(self)
        return self._height_hint
    end, function(self, v)
        if self._height_hint ~= v then
            self._height_hint = v
            self.constraint_dirty = true
        end
    end},
    height_hug = {function(self)
        return self._height_hug
    end, function(self, v)
        if self._height_hug ~= v then
            self._height_hug = v
            self.constraint_dirty = true
        end
    end},
    height_resist = {function(self)
        return self._height_resist
    end, function(self, v)
        if self._height_resist ~= v then
            self._height_resist = v
            self.constraint_dirty = true
        end
    end},
    height_limit = {function(self)
        return self._height_limit
    end, function(self, v)
        if self._height_limit ~= v then
            self._height_limit = v
            self.constraint_dirty = true
        end
    end},
}

local widget_update = cls_utils.index(nil, 'update', Widget.___class)
local function getRootParent(p)
    local pp = p.parent
    while pp do
        p = pp
        pp = p.parent
    end
    return p
end

if not ___clean_byui then
table.merge(M.LayoutItemMixin, {
    ctor = function(self)
        self.m_align = kAlignTopLeft
        self.m_x = 0
        self.m_y = 0
        self.m_alignX = 0
        self.m_alignY = 0
    end,
    setAlign = function(self, align)
        self.m_align = align or kAlignTopLeft
        self:updateRules()
    end,
    setPos = function(self, x, y)
        self.m_alignX = x or self.m_alignX
        self.m_alignY = y or self.m_alignY

        if not (self.m_fillParentWidth and self.m_fillParentHeight) then
            self:updateRules()
        end
    end,
    getPos = function(self)
        return self.m_fillParentWidth and 0 or self.m_alignX,
               self.m_fillParentHeight and 0 or self.m_alignY
    end,
    getUnalignPos = function(self)
        return self.m_x, self.m_y
    end,
    getAbsolutePos = function(self)
        widget_update(getRootParent(self))
        local dx=self.x
        local dy=self.y
        local p = self.parent
        while p do
            dx = dx + p.x
            dy = dy + p.y
            p = p.parent
        end
        return dx, dy
    end,
    setSize = function(self, w, h) 
        w = w or self.width
        h = h or self.height
        self.size = Point(w, h)
        self:updateRules()
    end,
    convertPointToSurface = function(self, x, y)
        local p = self:to_world(Point(x or 0, y or 0))
        return p.x, p.y
    end,
    convertSurfacePointToView = function(self, x, y)
        local p = self:from_world(Point(x or 0, y or 0))
        return p.x, p.y
    end,
    updateRules = function(self)
        local rules = {}
        if self.m_fillRegion then
            rules = {
                M.left:eq(self.m_fillRegionTopLeftX),
                M.top:eq(self.m_fillRegionTopLeftY),
                M.right:eq(M.parent('width') - self.m_fillRegionBottomRightX),
                M.bottom:eq(M.parent('height') - self.m_fillRegionBottomRightY),
            }
        else
            if self.m_fillParentWidth then
                table.insert(rules, M.width:eq(M.parent('width')))
            else
                table.insert(rules, M.width:eq(self.width))
            end
            if self.m_fillParentHeight then
                table.insert(rules, M.height:eq(M.parent('height')))
            else
                table.insert(rules, M.height:eq(self.height))
            end
            local x, y = self:getPos()
            if self.m_align ~= kAlignTopLeft then
                table.append(rules, compat_align_rules(self.m_align, x, y))
            else
                table.insert(rules, M.left:eq(x))
                table.insert(rules, M.top:eq(y))
            end
        end
        for _, r in ipairs(rules) do
            r.strength = kiwi.MEDIUM
        end
        self.compat_rules = rules
        self:update_constraints()
    end,
    setFillParent = function(self, doFillParentWidth, doFillParentHeight)
        self.m_fillParentWidth = doFillParentWidth
        self.m_fillParentHeight = doFillParentHeight
        self:updateRules()
    end,
    getFillParent = function(self)
        return self.m_fillParentWidth,self.m_fillParentHeight
    end,
    setFillRegion = function(self, doFill, topLeftX, topLeftY, bottomRightX, bottomRightY)
        self.m_fillRegion = doFill
        if self.m_fillRegion then
            self.m_fillRegionTopLeftX = topLeftX
            self.m_fillRegionTopLeftY = topLeftY
            self.m_fillRegionBottomRightX = bottomRightX
            self.m_fillRegionBottomRightY = bottomRightY
        end
        self:updateRules()
    end,
    getFillRegion = function(self)
        return self.m_fillRegion,self.m_fillRegionTopLeftX,self.m_fillRegionTopLeftY,
        self.m_fillRegionBottomRightX,self.m_fillRegionBottomRightY
    end,
    getSize = function(self)
        if not (self.m_fillParentWidth or self.m_fillParentHeight or self.m_fillRegion) then
            return self.width,self.height
        end

        if self.m_fillRegion then
            local w,h
            if self.m_parent then
                w,h = self.m_parent:getSize()
            else
                w,h = Window.instance().drawing_root.width,
                Window.instance().drawing_root.width
            end

            w = w - self.m_fillRegionTopLeftX - self.m_fillRegionBottomRightX
            h = h - self.m_fillRegionTopLeftY - self.m_fillRegionBottomRightY

            return w,h
        end

        if self.m_fillParentWidth and self.m_fillParentHeight then
            if self.m_parent then
                return self.m_parent:getSize()
            else
                return System.getScreenWidth(),
                System.getScreenHeight()
            end
        end

        local w= self.width
        local h = self.height

        if self.m_fillParentWidth then
            if self.m_parent then
                w = self.m_parent:getSize()
            else
                w = System.getScreenWidth()
            end
        end

        if self.m_fillParentHeight then
            if self.m_parent then
                local tw = nil; 
                tw, h = self.m_parent:getSize()
            else
                h = System.getScreenHeight()
            end
        end

        return w,h
    end,
    getRealSize = function(self)
        return M.LayoutItemMixin.getSize(self);
    end,
    getChildByName = function(self, name)
        for _,v in pairs(self.children) do 
            if v.name == name then
                return v
            end
        end
    end,
})
end



function M.patch_root()
    get_root().metatable = Widget.___class
    local root = get_root():to_lua()
    root:__init__{}
end

---
-- 给定的默认的规则.
-- @field [parent=#byui.autolayout] #rules rules 
M.rules = {
    ---
    -- 对齐函数
    -- @function [parent=#rules] align
    -- @param byui.utils#ALIGN a 
    -- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
    -- local w = Widget()
    -- w.size = Point(100,100)
    -- w:add_rules(AL.rules.align(ALIGN.CENTER))          --居中显示
    align = memorize(function(a)
        local h = align_h(a)
        local h_rule
        if h == ALIGN_H.LEFT then
            h_rule = M.left:eq(0)
        elseif h == ALIGN_H.CENTER then
            h_rule = M.centerx:eq(M.parent('width') / 2)
        elseif h == ALIGN_H.RIGHT then
            h_rule = M.right:eq(M.parent('width'))
        end

        local v = align_v(a)
        local v_rule
        if v == ALIGN_V.TOP then
            v_rule = M.top:eq(0)
        elseif v == ALIGN_V.CENTER then
            v_rule = M.centery:eq(M.parent('height') / 2)
        elseif v == ALIGN_V.BOTTOM then
            v_rule = M.bottom:eq(M.parent('height'))
        end

        return {h_rule, v_rule}
    end),
    ---
    -- 填充父节点的大小.
    -- @field [parent=#rules] #table fill_parent
    -- @usage local AL = require 'byui/autolayout'   -- 引入AutoLayout模块.
    -- local w = Widget()
    -- w:add_rules(AL.rules.fill_parent)          --填充父节点
    fill_parent = {
        M.width:eq(M.parent('width')),
        M.height:eq(M.parent('height')),
    },
}

local function _lua_on_enter(self)
    local fn = self.on_enter
    if fn then
        fn(self)
    end
end
local function _lua_on_exit(self)
    local fn = self.on_exit
    if fn then
        fn(self)
    end
end
local function patch_on_enter_exit(self)
    self.lua_on_enter = _lua_on_enter
    self.lua_on_exit  = _lua_on_exit
end

-- patch widgets
if Widget.___class.___lua == nil then
    CWidget = Widget
    Widget = class('Widget', CWidget, mixin(M.LayoutItemMixin, {
        __new__ = function(size, b)
            return CWidget(size, b)
        end,
        __init__ = function(self, size, b)
            M.LayoutItemMixin.__init__(self)
            patch_on_enter_exit(self)
        end
    }))
    
    for _, name in ipairs{'AL_MASK_LEFT', 'AL_MASK_TOP', 'AL_MASK_WIDTH', 'AL_MASK_HEIGHT', 'AL_MASK_SIZE', 'AL_MASK_POSITION', 'AL_MASK_NONE', 'AL_MASK_ALL',
        'get_by_id', 'get_uservalue', 'set_uservalue', 'ATTR_X','ATTR_Y','ATTR_WIDTH','ATTR_HEIGHT','ATTR_SCALEX','ATTR_SCALEY','ATTR_SKEWX','ATTR_SKEWY','ATTR_ROTATION','ATTR_COLOR','ATTR_OPACITY','ATTR_VISIBLE','Perspective_3D','Perspective_2D'
    } do
        Widget[name] = CWidget[name]
    end

    CSprite = Sprite
    Sprite = class('Sprite', CSprite, mixin(M.LayoutItemMixin, {
        __new__ = function(unit)
            return CSprite(unit)
        end,
        __init__ = function(self, unit)
            M.LayoutItemMixin.__init__(self)
            patch_on_enter_exit(self)
            if unit then
                self.size = unit.size
                self.size_hint = unit.size
            end
        end,
    }))

    CGridSprite = GridSprite
    GridSprite = class('GridSprite', CGridSprite, mixin(M.LayoutItemMixin, {
        __new__ = function(args)
            return CGridSprite(args.row or 10, args.col or 10, args.unit, args.action_type)
        end,
        __init__ = function(self, args)
            M.LayoutItemMixin.__init__(self)
            patch_on_enter_exit(self)

            args.row = nil
            args.col = nil
            args.unit = nil
            args.action_type = nil

            for k, v in pairs(args) do
                self[k] = v
            end
        end,
    }))
 
    for _, name in ipairs{'GRID_ACTION_TYPE_WAVES_3D', 'GRID_ACTION_TYPE_LENS', 'GRID_ACTION_TYPE_RIPPLE', 'GRID_ACTION_TYPE_SHAKY', 'GRID_ACTION_TYPE_LIQUID', 'GRID_ACTION_TYPE_WAVES', 'GRID_ACTION_TYPE_TWIRL',
        'GRID_ACTION_TYPE_SHUFFLE', 'GRID_ACTION_TYPE_FADE_OUT', 'GRID_ACTION_TYPE_TURN_OFF', 'GRID_ACTION_TYPE_JUMP', 'GRID_ACTION_TYPE_SPLIT', 'GRID_ACTION_TYPE_PAGE_TURN', 'GRID_ACTION_TYPE_CUSTOM',
        'FADE_OUT_TYPE_TL', 'FADE_OUT_TYPE_TR', 'FADE_OUT_TYPE_BL', 'FADE_OUT_TYPE_BR', 'FADE_OUT_TYPE_LEFT', 'FADE_OUT_TYPE_RIGHT', 'FADE_OUT_TYPE_UP', 'FADE_OUT_TYPE_DOWN',
        'PAGE_TURN_TYPE_TR', 'PAGE_TURN_TYPE_BR', 'PAGE_TURN_TYPE_TL', 'PAGE_TURN_TYPE_BL',
    } do
        GridSprite[name] = CGridSprite[name]
    end

    CGridWidget = GridWidget
    GridWidget = class('GridWidget', CGridWidget, mixin(M.LayoutItemMixin, {
        __new__ = function(args)
            return CGridWidget(true, args.size)
        end,
        __init__ = function(self, args)
            M.LayoutItemMixin.__init__(self)
            patch_on_enter_exit(self)

            self:set_widget(args.row or 10, args.col or 10, args.widget, args.action_type)

            args.row = nil
            args.col = nil
            args.widget = nil
            args.size = nil
            args.action_type = nil

            local need_depth = args.need_depth or false
            args.need_depth = nil

            local grid_sprite = self:get_grid_sprite()
            for k, v in pairs(args) do
                grid_sprite[k] = v
            end

            if need_depth then grid_sprite.fbo.need_depth = true end
        end,
    }))

    CBorderSprite = BorderSprite
    BorderSprite = class('BorderSprite', CBorderSprite, mixin(M.LayoutItemMixin, {
        __new__ = function(unit)
            return CBorderSprite(unit)
        end,
        __init__ = function(self, unit)
            M.LayoutItemMixin.__init__(self)
            patch_on_enter_exit(self)
            if unit then
                self.size = unit.size
                self.size_hint = unit.size
            end
        end,
    }))

    CLabel = Label
    Label = class('Label', CLabel, mixin(M.LayoutItemMixin, {
        __new__ = function(...)
            return CLabel(...)
        end,
        __init__ = function(self, ...)
            M.LayoutItemMixin.__init__(self)
            patch_on_enter_exit(self)
            super(Label, self).on_size_changed = function(_)
                if not self.layout_size:bool() then
                    self.size_hint = self.size
                end
                --self:setSize(self.width, self.height)
                self:update_constraints()
                if self._on_size_changed then
                    self:_on_size_changed()
                end
            end
            super(Label, self).on_content_bbox_changed = function(_)
                if self.absolute_align then
                    self.absolute_align = self._absolute_align
                end
                if self._on_content_bbox_changed then
                    self:_on_content_bbox_changed()
                end
            end
        end,
        layout_size = {function(self)
            return super(Label, self).layout_size
        end, function(self, s)
            super(Label, self).layout_size = s
            if s:bool() then
                self.size_hint = s
            else
                self.size_hint = self.size
            end
        end},
        on_size_changed = {function(self)
            return self._on_size_changed
        end, function(self, fn)
            self._on_size_changed = fn
        end},
        _set_prop = function ( self,key,value,index )
            index = index or 1
            local config_data = self:get_data()
            assert(config_data[index],"Paragraph does not exist")
            -- assert(config_data[index][key],"Paragraph' key does not exist")

            config_data[index][key] = value
            self:set_data(config_data)
        end,
        set_text = function ( self,value,index)
            self:_set_prop('text',value,index)
        end,
        set_size = function ( self,value,index)
            self:_set_prop('size',value,index)
        end,
        set_style = function ( self,value,index)
            self:_set_prop('style',value,index)
        end,
        set_color = function ( self,value,index)
            self:_set_prop('color',value,index)
        end,
        set_bg_color = function ( self,value,index)
            self:_set_prop('bg',value,index)
        end,
        set_stroke = function ( self,value,index)
            self:_set_prop('stroke',value,index)
        end,
        set_weight = function ( self,value,index)
            self:_set_prop('weight',value,index)
        end,
        set_glow = function ( self,value,index)
            self:_set_prop('glow',value,index)
        end,
        set_underline = function ( self,value,index)
            self:_set_prop('underline',value,index)
        end,
        set_middleline = function ( self,value,index)
            self:_set_prop('middleline',value,index)
        end,
        set_tag = function ( self,value,index)
            self:_set_prop('tag',value,index)
        end,
        absolute_align = {function ( self )
            return self._absolute_align 
        end,function ( self,align )
            if not align then
                self:clear_rules()
                self:update_constraints()
            end
            self._absolute_align = align 
            self:update(false)
            local content = self.content_bbox
            local h, v = align_h(self._absolute_align),align_v(self._absolute_align)
            local h_rule
            if h == ALIGN_H.LEFT then
                h_rule = M.left:eq(-content.x)
            elseif h == ALIGN_H.CENTER then
                h_rule = M.left:eq((M.parent('width') -content.w)/2 - content.x)
            elseif h == ALIGN_H.RIGHT then
                h_rule = M.left:eq(M.parent('width') - content.w - content.x)
            end
            assert(h_rule ~= nil)

            local v_rule
            if v == ALIGN_V.TOP then
                v_rule = M.top:eq(-content.y)
            elseif v == ALIGN_V.CENTER then
                v_rule = M.top:eq((M.parent('height') - content.h) / 2 - content.y)
            elseif v == ALIGN_V.BOTTOM then
                v_rule = M.top:eq(M.parent('height') - content.h - content.y)
            end
            assert(v_rule ~= nil)
            self:clear_rules()
            self:add_rules{h_rule, v_rule}
            self:update_constraints()
        end},
        init_link = function(self, onclick)
            local byui = require('byui/simple_ui')
            byui.init_label_link(self, onclick)
        end,
    }))
    for _, name in ipairs{'LEFT', 'TOP', 'CENTER', 'MIDDLE', 'RIGHT', 'BOTTOM', 'config', 'get_default_line_height','add_emoji', 'set_emoji_baseline', 'set_emoji_scale', 'set_default_line_scale','STYLE_ITALIC','STYLE_BOLD','STYLE_NORMAL'} do
        Label[name] = CLabel[name]
    end

    CLuaWidget = LuaWidget
    LuaWidget = class('LuaWidget', CLuaWidget, mixin(M.LayoutItemMixin, {
        __new__ = function(tbl)
            return CLuaWidget(tbl)
        end,
        __init__ = function(self, tbl)
            M.LayoutItemMixin.__init__(self)
        end,
    }))

    CDrawing = Drawing
    Drawing = class('Drawing', CDrawing, mixin(M.LayoutItemMixin, {
        __new__ = function()
            return CDrawing()
        end,
        __init__ = function(self)
            M.LayoutItemMixin.__init__(self)
        end,
    }))
end

M.patch_root()

function M.test(root)
    local layout = require('byui/layout')
    local ui = require('byui/basic')

    local parent = Widget()
    parent.background_color = Colorf.red
    parent:add_rules(M.rules.align(ALIGN.CENTER))
    parent:add_rules(M.rules.fill_parent)

    local btn = ui.Button{}
    btn:add_rules(M.rules.align(ALIGN.TOPRIGHT))
    btn.on_click = function(self)
        btn.text = 'hahahahaha'
    end
    parent:add(btn)

    local c = ui.ScrollView{
        dimension = kVertical,
    }
    c.content = layout.FloatLayout{
        spacing = Point(5,5),
    }
    c.size = Point(50,50)
    c.content.relative = true
    c.content.autolayout_size_enabled = true
    c.background_color = Colorf.blue
    for i=1,11 do
        local btn = ui.Button{text='Item'}
        c.content:add(btn)
    end
    --c.content:add_rules(M.rules.align(ALIGN.TOPLEFT))
    c.content:add_rules(M.rules.fill_parent)
    c:add_rules(M.rules.align(ALIGN.BOTTOM))
    c:add_rules{
        M.width:eq(M.parent('width') - 40),
        M.height:eq(M.parent('height') - 40),
    }
    parent:add(c)

    root:add(parent)
end

return M
