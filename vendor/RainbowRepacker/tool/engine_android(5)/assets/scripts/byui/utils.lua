---
-- 公共的工具模块.
-- @module byui.utils
-- @return nil

---
-- @type string
-- @extends string#string

---
-- 判断一个字符串是否为空
-- @function [parent=#string] empty
-- @param #string s 
function string.empty(s)
    return (s == nil) or (s == '')
end


---
-- @type table
-- @extends table#table

---
-- 将一个Table追加到指定的table.
-- @function [parent=#table] append
-- @param #table t
-- @param #table table 
function table.append(t, t1)
    for _, i in ipairs(t1) do
        table.insert(t, i)
    end
end

---
-- 拷贝一个table.
-- **这是一个浅拷贝**
-- @function [parent=#table] copy
-- @param #table t
-- @return #table 返回被拷贝的table.
function table.copy(t)
    local r = {}
    for k, v in pairs(t) do
        r[k] = v
    end
    return r
end

---
-- 合并两个table.
-- @function [parent=#table] merge
-- @param #table t1
-- @param #table t2
-- @param #boolean force 默认为true。如果为true则t2中所有值都会被写到t1中。为false则只有t1中不存在的key才会被写入。
-- @return #table 返回被拷贝的table.
function table.merge(t1, t2, force)
    if force == nil then
        force = true
    end
    for k, v in pairs(t2) do
        if force or t1[k] == nil then
            rawset(t1, k, v)
        end
    end
end

---
-- 连接table.
-- @function [parent=#table] concat_array
-- @param #table ...
-- @return #table 返回合并后的table.
function table.concat_array(...)
    local r = {}
    for _, t in ipairs{...} do
        for _, i in ipairs(t) do
            table.insert(r, i)
        end
    end
    return r
end

---
-- 在table中查找值为i的key.
-- @function [parent=#table] find
-- @param #table t
-- @param #obj i 任意类型的任意值.
-- @return #obj 如果找到则返回key，没有则返回nil.
function table.find(t, i)
    for k, v in pairs(t) do
        if v == i then
            return k
        end
    end
end

---
-- @{#engine.Colorf}转为@{#engine.Color}
-- @function [parent=#global] colorf_to_color
-- @param engine#Colorf x Colorf的对象.
-- @return engine#Color 转换后的Color对象.
function colorf_to_color(x)
    return Color(x.r * 255, x.g * 255, x.b * 255, x.a * 255)
end

---
-- @{#engine.Color}转为@{#engine.Colorf}
-- @function [parent=#global] color_to_colorf
-- @param engine#Color x Color的对象.
-- @return engine#Colorf 转换后的Colorf对象.
function color_to_colorf(x)
    return Colorf(x.r / 255, x.g / 255, x.b / 255, x.a / 255)
end

local trigger_meta = {
    __call = function(self)
        if self.handler == nil or self.handler.stopped then
            self.handler = Clock.instance():schedule_once(function(dt)
                self.handler = nil
                self.fn(dt)
            end, self.interval)
        end
    end,
    cancel = function(self)
        if self.handler ~= nil then
            self.handler:cancel()
            self.handler = nil
        end
    end,
}
function trigger(fn, interval)
    return setmetatable({
        fn = fn,
        handler = nil,
        interval = interval,
    }, trigger_meta)
end

-- object system
-- class, mixin, super = unpack(require('byui/class'))

-- debug
inspect = require('byui/inspect')
dbg = require('byui/debugger')

-- constants

---
-- 手指按下事件
-- @field [parent=#global] #number kFingerDown 
kFingerDown		= 0;

---
-- 手指移动事件
-- @field [parent=#global] #number kFingerMove 
kFingerMove		= 1;

---
-- 手指抬起事件
-- @field [parent=#global] #number kFingerUp 
kFingerUp		= 2;

---
-- 手指事件被取消.
-- @field [parent=#global] #number kFingerCancel 
kFingerCancel	= 3;


---
-- 水平方向.
-- 多用于@{#byui.ScrollView}选择滚动方向。
-- @field [parent=#global] #number kHorizental 
kHorizental     = 1;

---
-- 垂直方向.
-- 多用于@{#byui.ScrollView}选择滚动方向。
-- @field [parent=#global] #number kVertical
kVertical       = 2;

---
-- 水平和垂直方向.
-- 多用于@{#byui.ScrollView}选择滚动方向。
-- @field [parent=#global] #number kBoth
kBoth           = 3;


---
-- 向右拖拽.
-- 用于@{#byui.Layers}选择拖拽方向。
-- @field [parent=#global] engine#Point kDragToRight 
kDragToRight    = Point(1,0)

---
-- 向左拖拽.
-- 用于@{#byui.Layers}选择拖拽方向。
-- @field [parent=#global] engine#Point kDragToLeft 
kDragToLeft     = Point(-1,0)

---
-- 向上拖拽.
-- 用于@{#byui.Layers}选择拖拽方向。
-- @field [parent=#global] engine#Point kDragToTop 
kDragToTop      = Point(0,-1)

---
-- 向下拖拽.
-- 用于@{#byui.Layers}选择拖拽方向。
-- @field [parent=#global] engine#Point kDragToBottom 
kDragToBottom   = Point(0,1)

--- 
-- 菜单的箭头方向.
-- 默认向下，如果不能满足则向上。
-- @field [parent=#global] #number kMenuControllerArrowDefault 
kMenuControllerArrowDefault = 0

--- 
-- 菜单的箭头方向朝上.
-- 默认向上，如果不能满足则向下。
-- @field [parent=#global] #number kMenuControllerArrowUp 
kMenuControllerArrowUp = 1

--- 
-- 菜单的箭头方向朝下.
-- 默认向下，如果不能满足则向上。
-- @field [parent=#global] #number kMenuControllerArrowDown 
kMenuControllerArrowDown = 2

--kMenuControllerArrowLeft = 3
--kMenuControllerArrowRight = 4

kStringSelect = "选择"
kStringSelectAll = "全选"
kStringPaste = "粘贴"
kStringBIU = "<b>B</b><i>I</i><underline color=#ffffff>U</underline>"
kStringIndent = "缩进"
kStringOutdent = "减少缩进"
kStringCut = "裁剪"
kStringCopy = "复制"
kStringDefine = "定义"
kStringAdd = "添加..."
kStringShare = "共享..."
kStringCut = "剪切"

kSelectBegin = 1
kSelectEnd = 2

KTextBorderStyleRoundedRect = 1
KTextBorderStyleBezel = 2
KTextBorderStyleLine = 3
KTextBorderStyleWhite = 4
KTextBorderStyleNone = 0

KTextIconNone = 0
KTextIconDelete = 1
KTextIconMagnifier = 2


---
-- 对齐方式.
-- @field [parent=#global] #ALIGN ALIGN 
ALIGN  =  {
    ---
    -- 居中对齐
    -- @field [parent=#ALIGN]  CENTER
    CENTER        = 15,
    ---
    -- 顶部居中对齐
    -- @field [parent=#ALIGN]  TOP
    TOP           = 7,
    ---
    -- 右上角对齐
    -- @field [parent=#ALIGN]  TOPRIGHT
    TOPRIGHT      = 6,
    ---
    -- 右部居中对齐
    -- @field [parent=#ALIGN]  RIGHT
    RIGHT         = 14,
    ---
    -- 右下角对齐
    -- @field [parent=#ALIGN]  BOTTOMRIGHT
    BOTTOMRIGHT   = 10,
    ---
    -- 下部居中对齐
    -- @field [parent=#ALIGN]  BOTTOM
    BOTTOM        = 11,
    ---
    -- 左下角对齐
    -- @field [parent=#ALIGN]  BOTTOMLEFT
    BOTTOMLEFT    = 9,
    ---
    -- 左部居中对齐
    -- @field [parent=#ALIGN]  LEFT
    LEFT          = 13,
    ---
    -- 左上角对齐
    -- @field [parent=#ALIGN]  TOPLEFT
    TOPLEFT       = 5,
}


function align_h(a)
    return bit.band(a, 3)
end

function align_v(a)
    return bit.band(a, 12)
end

---
-- 水平对齐方式.
-- @field [parent=#global] #ALIGN_H ALIGN_H 
ALIGN_H = {

    ---
    -- 水平居左对齐
    -- @field [parent=#ALIGN_H]  LEFT
    LEFT = align_h(ALIGN.LEFT),
    
    ---
    -- 水平居右对齐
    -- @field [parent=#ALIGN_H]  RIGHT
    RIGHT = align_h(ALIGN.RIGHT),
    
    ---
    -- 水平居中对齐
    -- @field [parent=#ALIGN_H]  CENTER
    CENTER = align_h(ALIGN.CENTER),
}

---
-- 垂直对齐方式.
-- @field [parent=#global] #ALIGN_V ALIGN_V
ALIGN_V = {
    ---
    -- 垂直顶部对齐
    -- @field [parent=#ALIGN_V]  TOP
    TOP = align_v(ALIGN.TOP),
    
    ---
    -- 垂直居中对齐
    -- @field [parent=#ALIGN_V]  CENTER
    CENTER = align_v(ALIGN.CENTER),
    
    ---
    -- 垂直底部对齐
    -- @field [parent=#ALIGN_V]  BOTTOM
    BOTTOM = align_v(ALIGN.BOTTOM),
}


if event_touch_raw == nil then
    -- prevent error log
    function event_touch_raw()
    end
end
