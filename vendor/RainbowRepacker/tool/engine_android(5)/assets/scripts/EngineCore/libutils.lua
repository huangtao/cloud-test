
package.preload[ "libutils/annotation" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
-- Provide simple annotation support for Lua.


---
-- @module libutils.annotation
--
-- @usage local Annotation = require 'libutils.annotation'
local M = {}

-- annotationChain[generated function] == { ... }
local annotationChain = setmetatable({},{ __mode = 'k' })

local create = function (fn)
    local obj1 = newproxy()

    debug.setmetatable(obj1, {
        -- support for the quoted part: #"annot()" .. fn
        __call = function (_, ...)
            local arguments = arg
            local Narg = arg.n

            local obj2 = newproxy()
            debug.setmetatable(obj2, {
                __metatable = false,
                -- support for the quoted part: "#annot()" .. fn
                __len = function (op)
                    return setmetatable({}, {
                        -- support for the quoted part: "#annot() .. fn"
                        __concat = function (op1, op2)
                            local origFn = op2
                            local generatedFn = fn(op2, unpack(arguments, 1, Narg))

                            -- recording
                            annotationChain[generatedFn] = {
                              annot = obj1,
                              orig = origFn
                            }
                            return generatedFn
                        end
                    })
                end,
            })

            return obj2
        end,
        __metatable = false,

        -- support for the quoted part: "#annot" .. fn
        __len = function (op)
            return setmetatable({}, {
                __metatable = false,
                -- support for the quoted part: "#annot .. fn"
                __concat = function (op1, op2)
                    local origFn = op2
                    local generatedFn = fn(op2)

                    -- recording
                    annotationChain[generatedFn] = {
                      annot = obj1,
                      orig = origFn
                    }
                    return generatedFn
                end
            })
        end
    })

    return obj1
end

---
-- 返回一个annotation对象，该对象使用```fn```对输入的函数进行处理.
--
-- 使用时注意：
--
-- * fn(x)和x之间不要形成循环引用，否则都不会被gc。
-- * 一个fn(x)只能对应一个x。
-- * 除非所有的fn(x)都被gc，否则fn不会被gc。
--
-- @usage 
-- local Annotation = require 'libutils.annotation'
-- local annotatedObject = #Annotation.annotation .. fn
--
M.annotation = create(create)

---
--
-- 对已注解的对象，在注解过程中每次返回的对象，应用函数```fn```.
--
-- 具体如下。
--
-- 若已知
--
--     a1 == #Annotation.annot1 .. a2 -- 每个annot可能带参数也可能不带参数
--     a2 == #Annotation.annot2 .. a3
--     a3 == #Annotation.annot3 .. a4
--     ...
--     an == #Annotation.annotN .. orig
--
-- 则
--
--     applyOnAnnotated(a1, fn) ==
--     
--       fn(a2, annot1)  --以下函数会依次执行。
--       fn(a3, annot2)
--       fn(a4, annot3)
--       ...
--       fn(orig, annotN)
--
-- @param annotated 要处理的对象（通常是函数）。
-- @param #function fn 用于处理的函数。
--
-- @usage
--
--  -- 这个小例子展示了函数的用法。
--
--  local t = {}
--
--  local annot1 =
--    #Annotation.annotation ..
--    function (fn)
--      local result = function (...)
--        fn(...)
--      end
--      t[result] = '(by annot1)'
--      return result
--    end
--
--
--  local annot2 =
--    #Annotation.annotation ..
--    function (fn)
--      local result = function (...)
--        fn(...)
--      end
--      t[result] = '(by annot2)'
--      return result
--    end
--
--
--  local annot3 =
--    #Annotation.annotation ..
--    function (fn)
--      local result = function (...)
--        fn(...)
--      end
--      t[result] = '(by annot3)'
--      return result
--    end
--
--  local f = function () end
--  local anf =
--    #annot1 ..
--    #annot2 ..
--    #annot3 ..
--    f
--
--  local alist = { [ annot1 ] = 'annot1' , [annot2] = 'annot2', [annot3] = 'annot3' }
--
--  t[f] = 'orig'
--
--  Annotation.applyOnAnnotated(anf,function (fn, annotfn)
--    print(t[fn], alist[annotfn])
--  end)
--
--  --  Output:
--  --
--  --  (by annot2) annot1
--  --  (by annot3) annot2
--  --  orig  annot3
M.applyOnAnnotated = function (annotated, fn)
  -- TODO 也许需要更好的版本，提供annotation时的参数。
  local ax = annotationChain[annotated]
  if ax then
    fn(ax.orig, ax.annot)
    return M.applyOnAnnotated(ax.orig, fn)
  end
end

---
-- 对已注解的对象，在注解过程中第一个应用注解的对象（原始对象），应用函数fn.
--
-- 若已知
--
--     a1 == #annot1 .. a2 -- 每个annot可能带参数也可能不带参数
--     a2 == #annot2 .. a3
--     a3 == #annot3 .. a4
--     ...
--     an == #annotN .. orig
--
-- 则
--
--     applyOnAnnotated(a1, fn) ==
--       fn(orig)
--
-- @param annotated 要处理的对象（通常是函数）。
-- @param #function fn 用于处理的函数。
--
-- @usage
--
--  -- 这个小例子展示了函数的用法。
--
--  local t = {}
--
--  local annot1 =
--    #Annotation.annotation ..
--    function (fn)
--      local result = function (...)
--        fn(...)
--      end
--      t[result] = '(by annot2)'
--      return result
--    end
--
--
--  local annot2 =
--    #Annotation.annotation ..
--    function (fn)
--      local result = function (...)
--        fn(...)
--      end
--      t[result] = '(by annot2)'
--      return result
--    end
--
--
--  local annot3 =
--    #Annotation.annotation ..
--    function (fn)
--      local result = function (...)
--        fn(...)
--      end
--      t[result] = '(by annot3)'
--      return result
--    end
--
--  local f = function () end
--  local anf =
--    #annot1 ..
--    #annot2 ..
--    #annot3 ..
--    f
--
--  local alist = { [ annot1 ] = 'annot1' , [annot2] = 'annot2', [annot3] = 'annot3' }
--
--  t[f] = 'orig'
--
--  Annotation.applyOnUnAnnotated(anf,function (fn)
--    print(t[fn])
--  end)
--
--  --  Output:
--  --
--  --  orig
M.applyOnUnAnnotated = function (annotated, fn)
  local t = {}
  M.applyOnAnnotated(annotated,function (x)
    table.insert(t,x)
  end)

  if #t > 0 then
    local orig = t[#t]
    fn(orig)
  end
end

return M
end
        

package.preload[ "libutils.annotation" ] = function( ... )
    return require('libutils/annotation')
end
            

package.preload[ "libutils/debug" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module libutils.debug
--
-- @usage local Debug = require 'libutils.debug'
-- 
local M = {}

---
-- 返回当前函数对象.使用上注意不要直接```return currentFunction()```，否则无法获取正确的值。
-- @return #function 当前函数对象。
M.currentFunction = function ()
    return debug.getinfo(2, 'f').func
end

---
-- 返回当前函数对象的名称.
-- @return #string 当前函数对象的名称。
M.currentFunctionName = function ()
    return debug.getinfo(2, 'n').name
end

---
-- 返回当前函数的调用者.对 ```return caller()``` ，或者用 ```return f()``` 方式调用的函数无效。若不存在调用者，则返回nil。
-- @return #function 当前函数的调用者。
M.caller = function ()
    -- TODO 若不存在调用者，会返回什么呢？   --答：nil
    return debug.getinfo(3, 'f').func
end

---
-- 返回当前函数的调用者的名称.对 ```return caller()``` ，或者用 ```return f()``` 方式调用的函数无效。若不存在调用者，则返回nil。
-- @return #string 当前函数的调用者的名称。
M.callerName = function ()
    -- TODO 若不存在调用者，会返回什么呢？
    return debug.getinfo(3, 'n').name
end


---
-- 返回函数调用堆栈中的某层的upvalue和local variables.
-- 
-- @param upLevel 函数调用堆栈的层级。
-- @return #table,#table 包含局部变量的table，包含非局部变量的table。
local getVars = function (upLevel)
    if upLevel == nil then
        upLevel = 1
    end

    local level = upLevel + 1

    local func = debug.getinfo(level, 'f').func

    local upvalues = {}
    local locals = {}

    -- upvalues
    local index = 1
    while true do
        local name, value = debug.getupvalue(func, index)
        if name then
            upvalues[ name ] = value
        else
            break
        end

        index = index + 1
    end

    -- local variables
    index = 1
    while true do
        local name, value = debug.getlocal(level, index)
        if name then
            locals[ name ] = value
        else
            break
        end

        index = index + 1
    end

    return locals, upvalues
end


---
-- 字符串的形式返回函数（闭包）的所有local variables和upvalues 内容.
-- 
-- @param #number upLevel 函数调用堆栈的层级。
-- @param #function skipFunction 
-- @param #string seperator 分隔符。
-- @return #string 包含local variables和upvalues的字符串。
M.getVarsString = function (upLevel, skipFunction, seperator)
    if upLevel == nil then
        upLevel = 1
    end

    if skipFunction == nil then
        skipFunction = true
    end

    if seperator == nil then
        seperator = ', '
    end

    local locals, upvalues = getVars(upLevel + 1)

    local result = ''
    for k,v in pairs(locals) do
        if type(v) == 'function' then
            if not skipFunction then
                result = result .. k .. ': ' .. tostring(v) .. seperator
            end
        else
            result = result .. k .. ': ' .. tostring(v) .. seperator
        end
    end

    for k,v in pairs(upvalues) do
        if type(v) == 'function' then
            if not skipFunction then
                result = result .. '[UP]' .. k .. ': ' .. tostring(v) .. seperator
            end
        else
            result = result .. '[UP]' .. k .. ': ' .. tostring(v) .. seperator
        end
    end

    return result
end

--- 返回当前函数所在的行.
-- @return #number 当前函数所在的行。
M.currentLine = function ()
    return debug.getinfo(2,'l').currentline
end


--- 打印table内以及其metatable内的所有键值对.
-- @param #table t 需要打印的table。
M.inspectTable = (function ()
    local do_print
    do_print = function (t, level)
        if t == nil then
            return
        end

        local whitespaces = ''
        for i = 1, (level * 4) do
            whitespaces = whitespaces .. ' '
        end

        print_string( whitespaces .. '{' )

        local do_write_data = function (k_str, v)
            if v == _G then
                local s = whitespaces .. '    ' .. k_str .. ' : _G'
                print_string(s)
            else
                local s = whitespaces .. '    ' .. k_str .. ' : ' .. tostring(v)
                print_string(s)
                if type(v) == 'table' then
                    do_print(v, level + 1)
                end
            end
        end

        for k, v in pairs(t) do
            do_write_data(tostring(k), v)
        end

        local mt = getmetatable(t)
        if mt ~= nil then
          do_write_data('(metatable)', mt)
        end

        print_string( whitespaces .. '}' )
    end

    return function (t)
        print_string('root : ' .. tostring(t))
        do_print(t, 0)
    end

end)()

--- 返回package.loaded，即已经加载的模块.包含table，userdata function thread。
-- @return ... package.loaded表中的数据。
local unpackPackages = function ()
  local t = {}
  for k, v in pairs(package.loaded) do
    if (type(v) == 'table') or (type(v) == 'userdata') or (type(v) == 'function') or (type(v) == 'thread') then
      table.insert(t,v)
    end
  end

  return unpack(t)
end


---
-- 根据传入的lua value，调用microscope，生成一个GraphViz的.dot文件。
-- @param value dot文件描述的lua value。可以是任意lua value。
-- @param #string path 要生成的文件路径。
-- @param #string label 生成的.dot文件的标题。若为nil，则默认为''。
-- @param ... 传入给microscope的其它参数。这部分参数会原封不动的传给microscope。若调用时这部分有传参数进来，则不使用默认设置；否则，使用默认设置。
M.dumpValueToDotFile = function (value, path, label, ...)
  if label == nil then
    label = ''
  end

  if select('#',...) > 0 then
    require( 'libutils.internal.libs.microscope' )(path, value, label, ...)
  else
    if #label > 0 then
      require( 'libutils.internal.libs.microscope' )(path, value, 'environments', "sizes", label, _G, unpackPackages())
    else
      require( 'libutils.internal.libs.microscope' )(path, value, 'environments', "sizes", _G, unpackPackages())
    end
  end

  print_string('File ' .. path .. ' saved.')
end

---
-- 根据当前的调用堆栈，生成一个GraphViz的.dot文件。忽略对_G, package.loaded.*的引用。
-- @param #string path 要生成的文件路径。
-- @param #string label 生成的.dot文件的标题。若为nil，则默认为''。
M.dumpStackToDotFile = function (path, label)
  if label == nil then
    label = ''
  end
  require( 'libutils.internal.libs.microscope' )(path, nil, 'environments', "locals", "sizes", label,  _G, M.dumpStackToDotFile, unpackPackages())
end

return M



end
        

package.preload[ "libutils.debug" ] = function( ... )
    return require('libutils/debug')
end
            

package.preload[ "libutils/enum" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
--
-- 模拟枚举类型.
-- 
-- 构建一个枚举，不能对其中的值进行修改，修改时会报错。如果访问其没有的枚举值，也会报错。
--
-- @module libutils.enum
--
--
--
-- @usage local Enum = require 'libutils.enum'
-- 
-- local WeekEnum = Enum {
--     Monday    = 1,
--     Tuesday   = 2,
--     Wednesday = 3,
--     Thursday  = 4,
--     Friday    = 5,
--     Saturday  = 6,
--     Sunday    = 7
-- }
-- 
-- print(WeekEnum.Monday)
-- 
-- output：1

return function(table)
    if type(table) ~= "table" then
       return nil
    end
   
    return setmetatable( {}, {
        __index = function (t, k)
            local value = table[k]
            if value == nil then
                error("Unknown enum value: " .. tostring(k))
            end
            return value
        end,
        __newindex = function(t, key, value)
            error("Attempt to change a enumeration.")
        end,
        __metatable = false
    } )
end


end
        

package.preload[ "libutils.enum" ] = function( ... )
    return require('libutils/enum')
end
            

package.preload[ "libutils/funcutils" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module  libutils.funcutils
--
-- @usage local Funcutils = require 'libutils.funcutils'
local M = {}

---
-- 返回一个新的函数，为原函数的拷贝.
-- 新的函数保持和原函数一致的upvalues，但是仅仅只是值保持一致，但并非是同一个。也就是说，若某个upvalue在本函数调用后被修改过，新的函数将无法获得新的值。
-- 新的函数保持和原函数相同的environment。
--
-- 无需担心跨级的upvalues，例如下面的代码：尽管，```function B```没有直接引用来自```function A```的```x```；然而，由于```function C```引用了```x```，于是```function B```也就有了upvalue ```x```，这个```x```
-- 指向```function A```的```x```，而```function C```的upvalue ```x```，实际上是引用的```function B```的upvalue ```x```，并且join到```function B```的upvalue ```x```，这个join的关系在复制的过程并不会被破坏，丢失的仅仅是```function B```的```x```到```function A```的```x```的join。
--
--      function () -- function A
--          local x
--          return function () -- function B
--              return function () -- function C
--                  return x
--              end
--          end
--      end
--
-- @param #function fn 原函数。
-- @return #function  原函数的拷贝。
M.copyFunction = function (fn)
    -- standard lua 5.1
    -- 调试信息会被复制。

    -- JNLua:
    -- 调试信息会被复制。
    -- upvalues的名称也被copied，然而所有值都是nil。

    local code = string.dump(fn)
    local newFn = loadstring(code)

    -- copy upvalues

    local index = 1
    while true do
        local name, value = debug.getupvalue(fn,index)

        if name == nil then
            break
        end

        debug.setupvalue(newFn,index,value)
        index = index + 1
    end

    -- copy environment
    local origEnv = getfenv(fn)
    setfenv(newFn,origEnv)

    -- registry和metatable是大家共享的，不用管。

    return newFn
end


return M
end
        

package.preload[ "libutils.funcutils" ] = function( ... )
    return require('libutils/funcutils')
end
            

package.preload[ "libutils/gc" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- 可以对任何table加上finalizer。仅适用于lua 5.1（引擎目前使用lua 5.1）。
--
-- finalizer是一个函数，table在GC前，会执行这个函数.
--
-- 例如：
--
--     -- test.lua
--
--     local GC = require 'libutils.gc'
--
--     local function collect(t)
--         print('collecting '..tostring(t)..'...')
--     end
--
--     (function ()
--         local t = {}
--         print(t)
--         GC.setFinalizer(t, collect)
--     end)();
--
--     -- 执行：
--     $ lua -e "dofile('test.lua')"
--     table: 0x600040b00
--     collecting table: 0x600041750...
--
--
-- 注：
--
-- * finalizer会在table（或者metatable）中增加一个字段，用于记录对应的信息。请保留此字段。
--
-- @module libutils.gc
--
-- @usage local GC = require 'libutils.gc'


local M = {}

local gcObjectField = function () end -- make it uniq and difficult to see by eye

local createProxy = function (finalizer)
    local proxy = newproxy(true)

    getmetatable(proxy).__gc = function ()
        finalizer()
    end

    return proxy
end


---
-- 若`t`已存在finalizer，则清除`t`的finalizer（包括metatable中的finalizer信息）。清除后，原有的finalizer不会因为GC而被执行。
-- @param #table t 一个table。
M.clearFinalizer = function (t)

    local clearT = function (aTable)
        local origProxy = rawget(aTable, gcObjectField)

        if origProxy then
            getmetatable(origProxy).__gc = function () end
        end

        rawset(aTable, gcObjectField, nil)
    end

    clearT(t)

    local mt = getmetatable(t)
    if mt then
        clearT(mt)
    end

end


---
-- 给`t`设置一个finalizer，信息记录在`t`的metatable中。若`t`的metatable不存在，则创建一个。若`t`或者`t`的metatable中已有finalizer，则先清除原有的finalizer。
-- @param #table t 一个`table`。
-- @param #function finalizer 一个函数，也就是“finalizer”。在GC前，`finalizer(t)`会被自动执行。
-- @return #table 参数`t`。
M.setFinalizerInMT = function (t, finalizer)

    M.clearFinalizer(t)

    local mt = getmetatable(t)

    if mt then
        M.setFinalizer(mt, function ()
            finalizer(t)
        end)

    else
        mt = {}

        M.setFinalizer(mt, function ()
            finalizer(t)
        end)

        setmetatable(t, mt)
    end

    return t
end


---
-- 给`t`设置一个finalizer，信息记录在`t`中。若`t`或者`t`的metatable中已有finalizer，则先清除原有的finalizer。
-- @param #table t 一个`table`。
-- @param #function finalizer 一个函数，也就是“finalizer”。在GC前，`finalizer(t)`会被自动执行。
-- @return #table 参数`t`。
M.setFinalizer = function (t, finalizer)

    M.clearFinalizer(t)

    local proxy = createProxy(function()
        finalizer(t)
    end)

    rawset(t, gcObjectField, proxy)

    return t
end


return M
end
        

package.preload[ "libutils.gc" ] = function( ... )
    return require('libutils/gc')
end
            

package.preload[ "libutils/global" ] = function( ... )

---
-- Export global names.
--
---
-- @module libutils.global



local annotation = require 'libutils.annotation'
local _Export = {} 
_Export.annotation = annotation.annotation

for k, v in pairs(_Export) do
    _G[k] = v 
end
end
        

package.preload[ "libutils.global" ] = function( ... )
    return require('libutils/global')
end
            

package.preload[ "libutils/json" ] = function( ... )
local lunajson = require 'libutils.internal.libs.lunajson'
local Task = require 'libutils.task'

---
-- @module libutils.json
--
-- @usage local Json = require 'libutils.json'
local M = {}

---
-- 开始解析json字符串，在若干帧以后，给出结果。
--
-- @param #string json 要解析的json字符串。
-- @param #table config 配置信息。
-- 
-- * config.onSuccess :: object -> unit  - 当解析完成的时候调用这个函数。object为json转换而成的lua字符串。
-- * config.onError   :: msg -> unit     - 当解析过程中出错的时候，调用这个函数。msg为出错字符串。
-- * step             :: int             - 每帧处理几个字符。默认：4。
-- * null             :: any             - 把json字符串中的null值翻译成这个值。默认：nil。
M.parseJsonAsync = function (json, config)
    local step = 4 
    local null = nil
    local onSuccess = function () end
    local onError = function () end
    
    if config.step then
        step = config.step
    end
    
    if config.onSuccess then
        onSuccess = config.onSuccess
    end
    
    if config.onError then
        onError = config.onError
    end
    
    if config.null then
        null = config.null
    end

    -- 以下，正文开始。
    
    local saxtbl = {}
    local current = {} 
    local nullv
    
    do
        local stack = {}
        local top = 1
    
        local key = 1
        local isobj
    
        local function add(v)
            if v == nil then
                v = nullv
            end
            current[key] = v
            if type(key) == 'number' then
                key = key+1
            end
        end
        local function push()
            stack[top] = current
            stack[top+1] = key
            top = top+2
        end
        local function pop()
            top = top-2
            key = stack[top+1]
            current = stack[top]
        end
    
        function saxtbl.startobject()
            push()
            current = {}
            key = nil
        end
        function saxtbl.key(s)
            key = s
        end
        function saxtbl.endobject()
            local obj = current
            pop()
            add(obj)
        end
        function saxtbl.startarray()
            push()
            current = {}
            key = 1
        end
        function saxtbl.endarray()
            local ary = current
            pop()
            add(ary)
        end
        saxtbl.string = add
        saxtbl.number = function(n)
            current[key] = n-0.0
            if type(key) == 'number' then
                key = key+1
            end
        end
        saxtbl.boolean = add
        saxtbl.null = add
    end
    
    local function decode(json, nv)
        nullv = nv
        local i = 1
        local j = 0
        local finished = false
        local function gen()
            coroutine.yield()        
            local s = string.sub(json, i, i + step - 1)
            i = i + step
    
            if string.len(s) == 0 then
                s = nil
            end
            return s
        end
        
        local co = coroutine.create(function ()
            lunajson.newparser(gen, saxtbl).run()
            finished = true
        end)
        
        Task.runEveryFrames(function (stop)
            if not finished then
                local success, msg = coroutine.resume(co)
                if not success then
                    stop()
                    onError(msg)
                end
            else
                stop()
                onSuccess(current[1])
            end
        end)
    end
    
    decode(json,null)
end


return M
end
        

package.preload[ "libutils.json" ] = function( ... )
    return require('libutils/json')
end
            

package.preload[ "libutils/math" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module libutils.math
--
-- @usage local Math = require 'libutils.math'
local M = {}

---
-- 其值是inf。
M.Infinity = 1/0

---
-- 其值是nan。
M.NaN = math.sqrt(-2)

---
-- 返回x是否是nan。
-- 
-- @param #number x 任意数值。
-- @return #boolean 若x是nan，则返回true。否则，返回false。
M.isNaN = function (x)
    return not rawequal(x,x)
end

---
-- 返回x是否是inf或-inf。
-- 
-- @param #number x 任意数值。
-- @return #boolean 若x是inf或-inf，则返回true。否则，返回false。
M.isInfinity = function (x)
    return rawequal(x + 1,x)
end

---
-- 把x限制在[r1,r2]或[r2,r1]中。
--
-- @param #number x 任意数值。
-- @param #number r1 任意数值。
-- @param #number r2 任意数值。
-- @return #number 返回最接近x的、范围在[r1,r2]或[r2,r1]中的数值。 
M.inRange = function (x, r1, r2)
    local bottom = math.min(r1, r2)
    local upper = math.max(r1, r2)
    
    if x < bottom then
        return bottom
    end
    
    if x > upper then
        return upper
    end
    
    return x    
end

return M
end
        

package.preload[ "libutils.math" ] = function( ... )
    return require('libutils/math')
end
            

package.preload[ "libutils/messages" ] = function( ... )
---
-- 提供lua object消息发送、接收服务.
-- 
-- 通常是这样：第一帧发送消息，第二帧处理第一帧发送的所有消息。
--
-- @module libutils.messages
-- 
-- @usage local Messages = require 'libutils.messages'
local M = {}

local Task = require 'libutils.task'

-- TODO 消息队列中的消息，如果太多，则分成多帧来做。 

local receivers = setmetatable({},{__mode='k'})
local pendingMessages = {}

---
-- 注册消息接收对象和消息处理函数。可以注册后可以忘掉这个事情（对象为弱引用，handler为强引用），不影响GC.
-- 
-- 同一个对象两次注册，第二次会覆盖第一次。
-- 
-- @param receiver 接收消息的对象。必须是一个引用类型的lua object。
-- @param #function handler 处理所有消息的事件回调函数。类型：```message -> data -> message_result```。
-- message_result通常是nil。对于需要返回值的消息，才需要返回```message_result```。 
M.registerReceiver = function (receiver, handler)
    receivers[receiver] = handler
end

---
-- 移除receiver的注册信息。
-- @param receiver 消息接收对象。
M.unregisterReceiver = function (receiver)
    receivers[receiver] = nil
end

local function processMessageImmediately(receiver, message, param, handler)
    local receiverFn = receivers[receiver]    
    if receiverFn then    
        local result = receiverFn(message, param)    
        if handler then
            handler(result)
        end        
    end    
end

---
-- 立即发送消息给receiver，并让handler立即处理并返回.
-- 
-- 整个过程是同步的。
-- 
-- @param receiver 消息接收对象。若未注册，则不发送。
-- @param message 消息。
-- @param param 消息参数。
-- @param #function  handler 接收消息返回值的函数。如果消息有接收对象，并且成功返回，则调用```handler(message_result)```，其中，```message_result```为消息处理器返回的值。
M.sendMessage = function (receiver, message, param, handler)
    processMessageImmediately(receiver,message,param,handler)
end

---
-- 发送消息给receiver，并让handler处理并返回.
-- 
-- 整个过程是异步的。可能会持续好几帧。
-- 
-- 消息被处理以后会从消息队列中移除。如果消息处理的时找不到receiver，同样消息会被丢弃。
-- 
-- @param receiver 消息接收对象。若未注册，则不发送。
-- @param message 消息。
-- @param param 消息参数。
-- @param #function  handler 接收消息返回值的函数。如果消息有接收对象，并且成功返回，则调用```handler(message_result)```，其中，```message_result```为消息处理器返回的值。
M.postMessage = function (receiver, message, param, handler)
    table.insert(pendingMessages, {receiver, message, param, handler})   
end

local function processMessages()
    for _, v in ipairs(pendingMessages) do
        local receiver = v[1]
        local message = v[2]
        local param = v[3]
        local handler = v[4]
        
        processMessageImmediately(receiver,message,param,handler)                 
    end
     
    pendingMessages = {}
end

Task.runEveryFrames(function ()
    processMessages()
end)
---
-- 同步父节点背景色
M.SynchronizationParentBackgroundColor = 'libutils.messages$$SynchronizationParentBackgroundColor'
---
-- 
M.SettingTheParentNode = 'libutils.messages$$SettingTheParentNode'

return M
end
        

package.preload[ "libutils.messages" ] = function( ... )
    return require('libutils/messages')
end
            

package.preload[ "libutils/misc" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module libutils.misc
--
-- @usage local Misc = require 'libutils.misc'
local M = {}


-- run `fn(...)' once, do nothing if it is called the second time

---
-- 只执行```fn(...)```一次，第二次以及之后调用什么都不做.
-- 
-- @param #function fn 只需要执行一次的函数。
-- @return #function  返回新的函数，此函数只能被执行一次。
M.makeOnce = function (fn)
    local did = false
    return function (...)
        if did then
            return
        end

        fn(...)

        did = true
    end
end


-- returns a new table, which cannot be modified but all table[key] can be access.

---
-- 使table只读，即它的值不允许修改，但是可以访问。
-- 
-- @param #table table 需要只读的lua表。
-- @return #table 返回新的lua表，这个lua表中的值不可以被修改，但是可以被访问。
M.makeTableReadOnly = function(table)
    return setmetatable( {}, {
        __index = table,
        __newindex = function(t, key, value)
            error("Attempt to modify read-only table.")
        end,
        __metatable = false
    } )
end


do
    local ref = {}
    
    ---
    -- 增加对```obj```的一次引用.
    -- 
    -- @param obj 任意类型。
    -- @return obj 返回obj对象。
    M.addGlobalReference = function (obj)
        ref[obj] = true
        return obj
    end
    
    ---
    -- 减少对```obj```的一次引用。
    -- 
    -- @param obj 任意类型。
    -- @return obj 返回obj对象。
    M.removeGlobalReference = function (obj)
        ref[obj] = nil
        return obj
    end
end




---
-- 返回一个新的userdata对象v，tostring(v) == s。作为一个标识，方便调试。
-- 
-- @param #string s 字符串标识。
-- @return #userdata 新的userdata对象。
M.labeledUserdata = function (s)
    local value = newproxy()
    debug.setmetatable(value, {
        __tostring = function ()
            return s
        end
    })
    return value
end


---
-- 返回可以表示x地址的一个字符串（应该是这样子吧）.
-- 
-- x必须是引用类型。
-- 
-- 在lua 5.1/jnlua 5.1上实测OK。
-- 
-- @param x 一个lua object。类型只能是```table, userdata, thread, function```。且从未设置过```__tostring```。
-- @return #string x的地址。
M.addressOf = function (x)
    local s = tostring(x)
    local startIndex = string.match(s,': ()')
    local address = string.sub(s,startIndex)
    return address
end 

return M
end
        

package.preload[ "libutils.misc" ] = function( ... )
    return require('libutils/misc')
end
            

package.preload[ "libutils/objInfo" ] = function( ... )

---
-- @module libutils.objInfo
--
-- @usage local ObjInfo = require 'libutils.objInfo'

local M = {} 

local obj_assoc = setmetatable({},{ __mode = 'k' })


---
-- 将 object 和 data 关联在一起。
-- 
-- @param object 任意类型.
-- @param data  任意类型的数据。
M.setObjData = function (object, data)
    obj_assoc[object] = data
end

---
-- 返回和object相关联的data.
-- @param object 任意类型。
-- @return 和object相关联的data。此data可能是任意类型。
M.getObjData = function (object)
    return obj_assoc[object]
end

 
return M 
end
        

package.preload[ "libutils.objInfo" ] = function( ... )
    return require('libutils/objInfo')
end
            

package.preload[ "libutils/queue" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module ui2.util.queue
local M = {}

---
-- 创建一个新的空队列并返回。
--
-- @return #Queue 返回一个新创建的队列。
M.create = function ()
    ---
    -- 一个队列。其最大元素个数小于2147483648个。
    --
    -- @type Queue
    local q = {}
    
    local h = 0
    local t = 0
    local data = {}
    local MAX_SIZE = 2147483648
    
    ---
    -- 将x加入到队列末尾。
    --
    -- @param x 要入队的数据。  
    -- @return #Queue 返回队列本身。
    function q.enqueue(x)
        data[t] = x
        t = (t + 1) % MAX_SIZE
        return q        
    end 
    
    ---
    -- @return #boolean 若队列为空，则返回true；否则，返回false。
    function q.isEmpty()
        return h == t 
    end
    
    ---
    -- 将队列顶部元素出队。
    --
    -- @return #nil 若队列为空，返回nil。
    -- @return 若队列不为空，则返回队列顶部元素。
    function q.dequeue()
        if h == t then 
            return nil
        else
            local x = data[h] 
            data[h] = nil
            h = (h + 1) % MAX_SIZE
            return x
        end 
    end 
    
    ---
    -- 返回队列顶部元素。
    --
    -- @return #nil 若队列为空，则返回nil。
    -- @return 若队列不为空，则返回队列顶部元素。
    function q.front()
        return data[h]
    end
    
    ---
    -- 返回队列尾部元素。
    --
    -- @return #nil 若队列为空，则返回nil。
    -- @return 若队列不为空，则返回队列尾部元素。
    function q.back()
        return data[t]
    end
    
    ---
    -- 返回队列长度。
    -- 
    -- @return #number 队列长度。
    function q.size()
        if t >= h then 
            return t - h
        else
            return t + MAX_SIZE - h
        end
    end
    
    ---
    -- 返回用于 for 循环的 迭代器. 
    -- 
    -- 在循环过程中，不应该改变队列的内容。
    -- 
    --      for k, v in q.iterator() do
    --          print(k, v)    -- k为从1开始的整数。v为队列元素的值。 
    --      end 
    -- 
    -- @return #function 用于for循环的迭代器。
    function q.iterator()
        local initial = h
        local index = h 
        local last = t
        return function ()
            if index == last then 
                return nil 
            else
                local x = data[index]
                local pIndex 
                if index >= initial then
                    pIndex = index - initial + 1
                else
                    pIndex = index + MAX_SIZE - initial + 1                     
                end
                index = (index + 1) % MAX_SIZE
                return pIndex, x                
            end  
        end          
    end 

    ---
    -- 将队列中所有 ```test(elem) == true``` ，替换成 new .
    -- 其中，elem 为队列中的元素。
    -- 
    -- @param new 任意lua值。
    -- @param #function test 一个函数。
    function q.replaceAll(test, new)
        if q.isEmpty() then 
            return 
        end 
        
        local index = h 
        local last = t

        while index ~= last do
            if test(data[index]) then
                data[index] = new                                                                
            end  
            
            index = (index + 1) % MAX_SIZE
        end         
    end 
    
    return q
end 

return M


--[[

Demo code:

(function ()
    local q = M.create()
    q.enqueue(3).enqueue(4).enqueue(5)
    q.dequeue()
    q.dequeue()
    q.enqueue(8).enqueue(9).enqueue(10).enqueue(11)
    for k, v in q.iterator() do
        print(k, v)
    end
    
    print('-------------------------------------------------------------------')
    
    q.dequeue()
    q.dequeue()
    q.dequeue()
    q.dequeue()
    q.enqueue(12).enqueue(13).enqueue(14)
    
    for k, v in q.iterator() do
        print(k, v)
    end
end)()

]]




end
        

package.preload[ "libutils.queue" ] = function( ... )
    return require('libutils/queue')
end
            

package.preload[ "libutils/sequenceWorks" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

local M = {}

local goNext = function (sequence)
    if sequence.alreadyTerminated then
        return
    end

    sequence.currentIndex = sequence.currentIndex + 1
    if sequence.terminated or ( sequence.currentIndex > #(sequence.fnSeq) ) then
        sequence.onTerminate()
        sequence.alreadyTerminated = true
    else
        sequence.fnSeq[sequence.currentIndex]()
    end
end


M.create = function ()
    return {
        fnSeq = {},
        currentIndex = 1,
        terminated = false,
        alreadyTerminated = false,
        onTerminate = function () end,
    }
end

M.terminate = function ( sequence )
    sequence.terminated = true
end

M.isTerminated = function ( sequence )
    return sequence.alreadyTerminated
end

M.addWork = function ( sequence, fn )
    table.insert(sequence.fnSeq, function ()
        fn(function ()
            goNext(sequence)
        end)
    end)
end

M.resume = function ( sequence )
    goNext(sequence)
end




return M
end
        

package.preload[ "libutils.sequenceWorks" ] = function( ... )
    return require('libutils/sequenceWorks')
end
            

package.preload[ "libutils/stringbuilder" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

local M = {}

M.create = function (initialValue)
  local t = { initialValue }
  local finalString = nil
  local sb

  sb = {
    append = function (...)
      -- both support sb:append(s) and sb.append(s)
      -- TODO type check
      local s

      if select(1, ...) == sb then
        s = select(2, ...)
      else
        s = select(1, ...)
      end

      table.insert(t,s)

      finalString = nil

      return sb
    end,

    toString = function ()
      if finalString == nil then
        finalString = table.concat(t)
      end

      return finalString
    end
  }

  setmetatable(sb,{
    __tostring = sb.toString()
  })

  return sb
end

return M


end
        

package.preload[ "libutils.stringbuilder" ] = function( ... )
    return require('libutils/stringbuilder')
end
            

package.preload[ "libutils/task" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module libutils.task
--
-- @usage local Task = require 'libutils.task'

local UniqId = require 'libutils.uniqId' 
local Misc = require 'libutils.misc'

local M = {}

local createAnimDouble = function (animType, duration)
    local animId = anim_alloc_id()
    anim_create_double(0, animId, animType, 0, 0, duration, 0)
    return animId
end

local deleteAnim = function (animId)
    anim_delete(animId)
    anim_free_id(animId)
end

--- 
-- execute ```fn()``` after ```delay``` ms.
-- @function 
-- @param #number delay 延迟时间。
-- @param #function fn 要被调用的函数。
-- @return #function 返回一个函数。如果在 ```fn``` 被调用之前，就调用返回的这个函数（此函数无参数），则```fn```不会被执行。
M.runAfter = (function ()
    local allAnims = {}
    return function (delay, fn)
        local animId = createAnimDouble(0,delay)

        local stop = function ()
            if allAnims[animId] then
                allAnims[animId] = nil
                deleteAnim(animId)
            end
        end

        allAnims[animId] = function ()
            stop()

            if fn then
                fn()
            end
        end;   -- keep reference
        
        anim_set_event(animId,1,M,allAnims[animId])

        return stop
    end
end)()

--- 
-- execute ```fn(stop)``` in every frames (except current frame)
-- it starts immediately on the next frame (maybe).
-- if stop() is called, then the animation will be stopped
-- and the associated resource will be released.
-- @param #function fn 要每帧执行的函数。
-- @return #function 返回一个函数。调用该函数，则不会再执行```fn```。  
M.runEveryFrames = function (fn)
    local ev
    local stop = function ()
        ev:cancel()
    end
    
    ev = Clock.instance():schedule(function()
        fn(stop)         
    end)
    
    return stop
end


return M
end
        

package.preload[ "libutils.task" ] = function( ... )
    return require('libutils/task')
end
            

package.preload[ "libutils/uniqId" ] = function( ... )
--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--

---
-- @module libutils.uniqId
--
-- @usage local UniqId = require 'libutils.uniqId'

local M = {}

---
-- 获取一个惟一的id.
-- id的生成规则，每次自加1。
--
-- @return #number 惟一的id。
M.get = (function ()
    local id = 0
    return function ()
        id = id + 1
        return id
    end
end)()

return M
end
        

package.preload[ "libutils.uniqId" ] = function( ... )
    return require('libutils/uniqId')
end
            

package.preload[ "libutils/version" ] = function( ... )
---
-- @module libutils.version
-- @return #string 
-- @usage local ver = require 'libutils.version' -- ver为一个字符串，内容是libutils的版本号。

return '3.0(11ddeb8b0493a0df4e59fde76107d39fd76c37a3)'

end
        

package.preload[ "libutils.version" ] = function( ... )
    return require('libutils/version')
end
            

package.preload[ "libutils/internal/libs/inspect" ] = function( ... )
---
-- @module libutils.internal.libs.inspect

local inspect ={
  _VERSION = 'inspect.lua 3.0.2',
  _URL     = 'http://github.com/kikito/inspect.lua',
  _DESCRIPTION = 'human-readable representations of tables',
  _LICENSE = [[
    MIT LICENSE

    Copyright (c) 2013 Enrique García Cota

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  ]]
}

inspect.KEY       = setmetatable({}, {__tostring = function() return 'inspect.KEY' end})
inspect.METATABLE = setmetatable({}, {__tostring = function() return 'inspect.METATABLE' end})

-- returns the length of a table, ignoring __len (if it exists)
local rawlen = _G.rawlen or function(t) return #t end

-- Apostrophizes the string if it has quotes, but not aphostrophes
-- Otherwise, it returns a regular quoted string
local function smartQuote(str)
  if str:match('"') and not str:match("'") then
    return "'" .. str .. "'"
  end
  return '"' .. str:gsub('"', '\\"') .. '"'
end

local controlCharsTranslation = {
  ["\a"] = "\\a",  ["\b"] = "\\b", ["\f"] = "\\f",  ["\n"] = "\\n",
  ["\r"] = "\\r",  ["\t"] = "\\t", ["\v"] = "\\v"
}

local function escape(str)
  local result = str:gsub("\\", "\\\\"):gsub("(%c)", controlCharsTranslation)
  return result
end

local function isIdentifier(str)
  return type(str) == 'string' and str:match( "^[_%a][_%a%d]*$" )
end

local function isSequenceKey(k, length)
  return type(k) == 'number'
     and 1 <= k
     and k <= length
     and math.floor(k) == k
end

local defaultTypeOrders = {
  ['number']   = 1, ['boolean']  = 2, ['string'] = 3, ['table'] = 4,
  ['function'] = 5, ['userdata'] = 6, ['thread'] = 7
}

local function sortKeys(a, b)
  local ta, tb = type(a), type(b)

  -- strings and numbers are sorted numerically/alphabetically
  if ta == tb and (ta == 'string' or ta == 'number') then return a < b end

  local dta, dtb = defaultTypeOrders[ta], defaultTypeOrders[tb]
  -- Two default types are compared according to the defaultTypeOrders table
  if dta and dtb then return defaultTypeOrders[ta] < defaultTypeOrders[tb]
  elseif dta     then return true  -- default types before custom ones
  elseif dtb     then return false -- custom types after default ones
  end

  -- custom types are sorted out alphabetically
  return ta < tb
end

local function getNonSequentialKeys(t)
  local keys, length = {}, rawlen(t)
  for k,_ in pairs(t) do
    if not isSequenceKey(k, length) then table.insert(keys, k) end
  end
  table.sort(keys, sortKeys)
  return keys
end

local function getToStringResultSafely(t, mt)
  local __tostring = type(mt) == 'table' and rawget(mt, '__tostring')
  local str, ok
  if type(__tostring) == 'function' then
    ok, str = pcall(__tostring, t)
    str = ok and str or 'error: ' .. tostring(str)
  end
  if type(str) == 'string' and #str > 0 then return str end
end

local maxIdsMetaTable = {
  __index = function(self, typeName)
    rawset(self, typeName, 0)
    return 0
  end
}

local idsMetaTable = {
  __index = function (self, typeName)
    local col = {}
    rawset(self, typeName, col)
    return col
  end
}

local function countTableAppearances(t, tableAppearances)
  tableAppearances = tableAppearances or {}

  if type(t) == 'table' then
    if not tableAppearances[t] then
      tableAppearances[t] = 1
      for k,v in pairs(t) do
        countTableAppearances(k, tableAppearances)
        countTableAppearances(v, tableAppearances)
      end
      countTableAppearances(getmetatable(t), tableAppearances)
    else
      tableAppearances[t] = tableAppearances[t] + 1
    end
  end

  return tableAppearances
end

local copySequence = function(s)
  local copy, len = {}, #s
  for i=1, len do copy[i] = s[i] end
  return copy, len
end

local function makePath(path, ...)
  local keys = {...}
  local newPath, len = copySequence(path)
  for i=1, #keys do
    newPath[len + i] = keys[i]
  end
  return newPath
end

local function processRecursive(process, item, path)
  if item == nil then return nil end

  local processed = process(item, path)
  if type(processed) == 'table' then
    local processedCopy = {}
    local processedKey

    for k,v in pairs(processed) do
      processedKey = processRecursive(process, k, makePath(path, k, inspect.KEY))
      if processedKey ~= nil then
        processedCopy[processedKey] = processRecursive(process, v, makePath(path, processedKey))
      end
    end

    local mt  = processRecursive(process, getmetatable(processed), makePath(path, inspect.METATABLE))
    setmetatable(processedCopy, mt)
    processed = processedCopy
  end
  return processed
end


-------------------------------------------------------------------

local Inspector = {}
local Inspector_mt = {__index = Inspector}

function Inspector:puts(...)
  local args   = {...}
  local buffer = self.buffer
  local len    = #buffer
  for i=1, #args do
    len = len + 1
    buffer[len] = tostring(args[i])
  end
end

function Inspector:down(f)
  self.level = self.level + 1
  f()
  self.level = self.level - 1
end

function Inspector:tabify()
  self:puts(self.newline, string.rep(self.indent, self.level))
end

function Inspector:alreadyVisited(v)
  return self.ids[type(v)][v] ~= nil
end

function Inspector:getId(v)
  local tv = type(v)
  local id = self.ids[tv][v]
  if not id then
    id              = self.maxIds[tv] + 1
    self.maxIds[tv] = id
    self.ids[tv][v] = id
  end
  return id
end

function Inspector:putKey(k)
  if isIdentifier(k) then return self:puts(k) end
  self:puts("[")
  self:putValue(k)
  self:puts("]")
end

function Inspector:putTable(t)
  if t == inspect.KEY or t == inspect.METATABLE then
    self:puts(tostring(t))
  elseif self:alreadyVisited(t) then
    self:puts('<table ', self:getId(t), '>')
  elseif self.level >= self.depth then
    self:puts('{...}')
  else
    if self.tableAppearances[t] > 1 then self:puts('<', self:getId(t), '>') end

    local nonSequentialKeys = getNonSequentialKeys(t)
    local length            = rawlen(t)
    local mt                = getmetatable(t)
    local toStringResult    = getToStringResultSafely(t, mt)

    self:puts('{')
    self:down(function()
      if toStringResult then
        self:puts(' -- ', escape(toStringResult))
        if length >= 1 then self:tabify() end
      end

      local count = 0
      for i=1, length do
        if count > 0 then self:puts(',') end
        self:puts(' ')
        self:putValue(t[i])
        count = count + 1
      end

      for _,k in ipairs(nonSequentialKeys) do
        if count > 0 then self:puts(',') end
        self:tabify()
        self:putKey(k)
        self:puts(' = ')
        self:putValue(t[k])
        count = count + 1
      end

      if mt then
        if count > 0 then self:puts(',') end
        self:tabify()
        self:puts('<metatable> = ')
        self:putValue(mt)
      end
    end)

    if #nonSequentialKeys > 0 or mt then -- result is multi-lined. Justify closing }
      self:tabify()
    elseif length > 0 then -- array tables have one extra space before closing }
      self:puts(' ')
    end

    self:puts('}')
  end
end

function Inspector:putValue(v)
  local tv = type(v)

  if tv == 'string' then
    self:puts(smartQuote(escape(v)))
  elseif tv == 'number' or tv == 'boolean' or tv == 'nil' then
    self:puts(tostring(v))
  elseif tv == 'table' then
    self:putTable(v)
  else
    self:puts('<',tv,' ',self:getId(v),'>')
  end
end

-------------------------------------------------------------------

function inspect.inspect(root, options)
  options       = options or {}

  local depth   = options.depth   or math.huge
  local newline = options.newline or '\n'
  local indent  = options.indent  or '  '
  local process = options.process

  if process then
    root = processRecursive(process, root, {})
  end

  local inspector = setmetatable({
    depth            = depth,
    buffer           = {},
    level            = 0,
    ids              = setmetatable({}, idsMetaTable),
    maxIds           = setmetatable({}, maxIdsMetaTable),
    newline          = newline,
    indent           = indent,
    tableAppearances = countTableAppearances(root)
  }, Inspector_mt)

  inspector:putValue(root)

  return table.concat(inspector.buffer)
end

setmetatable(inspect, { __call = function(_, ...) return inspect.inspect(...) end })

return inspect

end
        

package.preload[ "libutils.internal.libs.inspect" ] = function( ... )
    return require('libutils/internal/libs/inspect')
end
            

package.preload[ "libutils/internal/libs/lunajson" ] = function( ... )
local newdecoder = require 'libutils.internal.libs.lunajson.decoder'
local newencoder = require 'libutils.internal.libs.lunajson.encoder'
local sax = require 'libutils.internal.libs.lunajson.sax'
-- If you need multiple contexts of decoder and/or encoder,
-- you can require lunajson.decoder and/or lunajson.encoder directly.
return {
	decode = newdecoder(),
	encode = newencoder(),
	newparser = sax.newparser,
	newfileparser = sax.newfileparser,
}

end
        

package.preload[ "libutils.internal.libs.lunajson" ] = function( ... )
    return require('libutils/internal/libs/lunajson')
end
            

package.preload[ "libutils/internal/libs/microscope" ] = function( ... )
-- This file is from http://siffiejoe.github.io/lua-microscope/

-- generate a graphviz graph from a lua table structure

local max_label_length = 25

-- cache globals
local assert = assert
local require = assert( require )
local _VERSION = assert( _VERSION )
local type = assert( type )
local tostring = assert( tostring )
local select = assert( select )
local next = assert( next )
local rawget = assert( rawget )
local rawset = assert( rawset )
local pcall = assert( pcall )
local string = require( "string" )
local ssub = assert( string.sub )
local sgsub = assert( string.gsub )
local sformat = assert( string.format )
local sbyte = assert( string.byte )
local table = require( "table" )
local tconcat = assert( table.concat )
-- optional ...
local getmetatable = getmetatable
local getfenv = getfenv
local debug, getsize, ioopen, corunning
do
  local ok, dbg = pcall( require, "debug" )
  if ok then debug = dbg end
  if not jit then
    local ok, getsz = pcall( require, "getsize" )
    if ok then getsize = getsz end
    if not getsize and type( debug ) == "table" and
       type( debug.getsize ) == "function" then
      getsize = debug.getsize
    end
  end
  local ok, io = pcall( require, "io" )
  if ok and type( io ) == "table" and
     type( io.open ) == "function" then
    ioopen = io.open
  end
  local ok, co = pcall( require, "coroutine" )
  if ok and type( co ) == "table" and
     type( co.running ) == "function" then
    corunning = co.running
  end
end


local dottify
local get_metatable, get_environment, get_registry, get_locals, upvalues


-- select implementation of get_metatable depending on available API
if type( debug ) == "table" and
   type( debug.getmetatable ) == "function" then

  local get_mt = debug.getmetatable
  function get_metatable( val, enabled )
    if enabled then return get_mt( val ) end
  end

elseif type( getmetatable ) == "function" then

  function get_metatable( val, enabled )
    if enabled then return getmetatable( val ) end
  end

else

  function get_metatable() end

end


-- select implementation of get_environment depending on available API
if type( debug ) == "table" and
   type( debug.getfenv ) == "function" then

  local get_fe = debug.getfenv
  function get_environment( val, enabled )
    if enabled then return get_fe( val ) end
  end

elseif type( debug ) == "table" and
       type( debug.getuservalue ) == "function" then

  local get_uv = debug.getuservalue
  function get_environment( val, enabled )
    if enabled then
      -- getuservalue in Lua5.2 throws on light userdata!
      local ok, res = pcall( get_uv, val )
      if ok then return res end
    end
  end

elseif type( getfenv ) == "function" then

  function get_environment( val, enabled )
    if enabled and type( val ) == "function" then
      return getfenv( val )
    end
  end

else

  function get_environment() end

end


-- select implementation of get_registry
if type( debug ) == "table" and
   type( debug.getregistry ) == "function" then
  get_registry = debug.getregistry
else
  function get_registry() end
end


-- select implementation of get_locals
if type( debug ) == "table" and
   type( debug.getinfo ) == "function" and
   type( debug.getlocal ) == "function" then

  local getinfo, getlocal = debug.getinfo, debug.getlocal

  local function getinfo_nothread( _, func, what )
    return getinfo( func, what )
  end

  local function getlocal_nothread( _, level, loc )
    return getlocal( level, loc )
  end

  function get_locals( thread, enabled )
    if enabled then
      local locs = {}
      local start = 1
      local gi, gl = getinfo, getlocal
      if not thread then
        gi, gl = getinfo_nothread, getlocal_nothread
      end
      local info, i = gi( thread, 0, "nf" ), 0
      while info do
        local t = { name = info.name, func = info.func }
        local j, n,v = 1, gl( thread, i, 1 )
        while n ~= nil do
          t[ j ] = { n, v }
          j = j + 1
          n,v = gl( thread, i, j )
        end
        i = i + 1
        locs[ i ] = t
        if info.func == dottify then start = i+1 end
        info = gi( thread, i, "nf" )
      end
      return locs, start
    end
  end

else

  function get_locals() end

end


-- select implementation of upvalues depending on available API
local function dummy_iter() end
if type( debug ) == "table" and
   type( debug.getupvalue ) == "function" then

  local get_up, uv_iter = debug.getupvalue
  if _VERSION == "Lua 5.1" then

    function uv_iter( state )
      local name, uv = get_up( state.value, state.n )
      state.n = state.n + 1
      return name, uv, nil
    end

  else -- Lua 5.2 (and later) mixes upvalues and environments

    local get_upid
    if type( debug.upvalueid ) == "function" then
      get_upid = debug.upvalueid
    end

    function uv_iter( state )
      local name, uv = get_up( state.value, state.n )
      state.n = state.n + 1
      if name == "_ENV" and not state.show_env then
        return uv_iter( state )
      end
      local id = nil
      if get_upid ~= nil and name ~= nil then
        id = get_upid( state.value, state.n - 1 )
      end
      return name, uv, id
    end
  end

  function upvalues( val, enabled, show_env )
    if enabled then
      return uv_iter, { value = val, n = 1, show_env = show_env }
    else
      return dummy_iter
    end
  end

else

  function upvalues()
    return dummy_iter
  end

end


local function ptostring( v )
  local ok, res = pcall( tostring, v )
  if ok then
    return res
  end
  local mt = get_metatable( v, true )
  if type( mt ) == "table" then
    local tos = rawget( mt, "__tostring" )
    rawset( mt, "__tostring", nil )
    ok, res = pcall( tostring, v )
    rawset( mt, "__tostring", tos )
    if ok then
      return res
    end
  end
  return "<a "..type( v )..">"
end



-- scanning is done in breadth-first order using a linked list. the
-- nodes are appended in ascending order of depth. there is also a
-- lookup table by value (for reference types) or by upvalueid (for
-- value type upvalues) to ensure a single node for a value
local function new_db( proto )
  proto = proto or {}
  proto.n_nodes    = 0
  proto.list_begin = nil
  proto.list_end   = nil
  proto.key2node   = {}
  proto.max_depth  = 0
  proto.prune      = {}
  proto.edges      = {}
  return proto
end


local function db_node( db, val, depth, key )
  local node, t = nil, type( val )
  if t ~= "number" and t ~= "boolean" and t ~= "nil" then
    key = val
  end
  if key ~= nil then
    node = db.key2node[ key ]
  end
  if not node and
     (db.max_depth < 1 or depth <= db.max_depth) and
     (key == nil or not db.prune[ key ]) then
    db.n_nodes = db.n_nodes + 1
    node = {
      id = db.n_nodes.."",
      value = val,
      depth = depth,
      shape = nil, label = nil, draw = nil, next = nil,
    }
    if key ~= nil then
      db.key2node[ key ] = node
    end
    if db.list_end ~= nil then
      db.list_end.next = node
    else
      db.list_begin = node
    end
    db.list_end = node
  end
  return node
end


local function define_edge( db, edge )
  local es = db.edges
  es[ #es+1 ] = edge
end


-- generate dot code for references
local function dottify_metatable_ref( src, port1, mt, port2, db )
  define_edge( db, {
    A = src, A_port = port1,
    B = mt, B_port = port2,
    style = "dashed",
    dir = "both",
    arrowtail = "odiamond",
    label = "metatable",
    color = "blue"
  } )
  src.draw, mt.draw = true, true
end

local function dottify_environment_ref( src, port1, env, port2, db )
  define_edge( db, {
    A = src, A_port = port1,
    B = env, B_port = port2,
    style = "dotted",
    dir = "both",
    arrowtail = "dot",
    label = "environment",
    color = "red"
  } )
  src.draw, env.draw = true, true
end

local function dottify_upvalue_ref( src, port1, upv, port2, db, name )
  define_edge( db, {
    A = src, A_port = port1,
    B = upv, B_port = port2,
    style = "dashed",
    label = name,
    color = "green"
  } )
  src.draw, upv.draw = true, true
end

local function dottify_ref( n1, port1, n2, port2, db )
  define_edge( db, {
    A = n1, A_port = port1,
    B = n2, B_port = port2,
    style = "solid"
  } )
end

local function dottify_stack_ref( th, port1, st, port2, db )
  define_edge( db, {
    A = th, A_port = port1,
    B = st, B_port = port2,
    style = "solid",
    arrowhead = "none",
    weight = "2",
    color = "lightgrey",
  } )
  th.draw = true
end

local function dottify_size_ref( n, port1, sn, port2, db )
  define_edge( db, {
    A = n, A_port = port1,
    B = sn, B_port = port2,
    style = "dotted",
    label = "size",
    arrowhead = "none",
    color = "dimgrey",
    fontcolor = "dimgrey",
    fontsize = "10",
  } )
  sn.draw = n.draw
end


local function abbrev( str )
  if #str > max_label_length then
    str = ssub( str, 1, max_label_length-9 ).."..."..ssub( str, -6 )
  end
  return str
end


-- escape and strings for graphviz labels
local html_escapes = {
  [ "\r" ] = "\\r",
  [ "\n" ] = "\\n",
  [ "\t" ] = "\\t",
  [ "\f" ] = "\\f",
  [ "\v" ] = "\\v",
  [ "\\" ] = "\\\\",
  [ "'" ] = "\\'",
  [ "<" ] = "&lt;",
  [ ">" ] = "&gt;",
  [ "&" ] = "&amp;",
  [ '"' ] = "&quot;",
}
local record_escapes = {
  [ "\r" ] = "\\\\r",
  [ "\n" ] = "\\\\n",
  [ "\t" ] = "\\\\t",
  [ "\f" ] = "\\\\f",
  [ "\v" ] = "\\\\v",
  [ "\\" ] = "\\\\\\\\",
  [ "'" ] = "\\\\'",
  [ "<" ] = "\\<",
  [ ">" ] = "\\>",
  [ '"' ] = '\\"',
  [ "{" ] = "\\{",
  [ "}" ] = "\\}",
  [ "|" ] = "\\|",
}

local function html_escaper( c )
  return sformat( "\\%03d", sbyte( c ) )
end

local function record_escaper( c )
  return sformat( "\\\\%03d", sbyte( c ) )
end

local function escape( str, use_html )
  local esc
  if use_html then
    esc = html_escaper
    str = sgsub( str, "[\r\n\t\f\v\\'<>&\"]", html_escapes )
  else
    esc = record_escaper
    str = sgsub( str, "[\r\n\t\f\v\\'<>\"{}|]", record_escapes )
  end
  str = sgsub( str, "[^][%w !\"#$%%&'()*+,./:;<=>?@\\^_`{|}~-]", esc )
  return str
end


local function quote( str )
  return "'" .. str .. "'"
end


local function make_label_elem( tnode, v, db, subid, depth, alt )
  local t = type( v )
  if t == "number" or t == "boolean" then
    return escape( ptostring( v ), db.use_html )
  elseif t == "string" then
    return quote( escape( abbrev( v ), db.use_html ) )
  else -- userdata, function, thread, table
    local n = db_node( db, v, depth+1 )
    if n then
      dottify_ref( tnode, subid, n, t == "table" and "0" or nil, db )
    end
    alt = alt or ptostring( v )
    return escape( abbrev( alt ), db.use_html )
  end
end


local function make_html_table( db, node, val )
  local depth = node.depth
  node.shape = "plaintext"
  node.is_html_label = true
  local header = escape( abbrev( ptostring( val ) ), true )
  if getsize then
    header = header.."  ["..getsize( val ).."]"
  end
  local label = [[<TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0">
  <TR><TD PORT="0" COLSPAN="2" BGCOLOR="lightgrey">]] ..  header .. [[
</TD></TR>
]]
  local handled = {}
  -- first the array part
  local n, v = 1, rawget( val, 1 )
  while v ~= nil do
    local el_label = make_label_elem( node, v, db, n.."", depth )
    label = label .. [[
  <TR><TD PORT="]] .. n .. [[" COLSPAN="2">]] .. el_label .. [[
</TD></TR>
]]
    handled[ n ] = true
    n = n + 1
    v = rawget( val, n )
  end
  -- and then the hash part
  for k,v in next, val do
    node.draw = true
    if not handled[ k ] then -- skip array part elements
      local k_label = make_label_elem( node, k, db, "k"..n, depth )
      local v_label = make_label_elem( node, v, db, "v"..n, depth )
      label = label .. [[
  <TR><TD PORT="k]] .. n .. [[">]] .. k_label .. [[
</TD><TD PORT="v]] .. n .. [[">]] .. v_label .. [[
</TD></TR>
]]
      n = n + 1
    end
  end
  node.label = label .. [[</TABLE>]]
end


local function make_record_table( db, node, val )
  local depth = node.depth
  node.shape = "record"
  local label = "{ <0> " .. escape( abbrev( ptostring( val ) ), false )
  if getsize then
    label = label.."  ["..getsize( val ).."]"
  end
  local handled = {}
  -- first the array part
  local n,v = 1, rawget( val, 1 )
  while v ~= nil do
    local el_label = make_label_elem( node, v, db, n.."", depth )
    label = label .. " | <" .. n .. "> " .. el_label
    handled[ n ] = true
    n = n + 1
    v = rawget( val, n )
  end
  -- and then the hash part
  local keys, values = {}, {}
  for k,v in next, val do
    node.draw = true
    if not handled[ k ] then -- skip array part elements
      local k_label = make_label_elem( node, k, db, "k"..n, depth )
      local v_label = make_label_elem( node, v, db, "v"..n, depth )
      keys[ #keys+1 ] = "<k" .. n .. "> " .. k_label
      values[ #values+1 ] = "<v" .. n .. "> " .. v_label
      n = n + 1
    end
  end
  if next( keys ) ~= nil then
    label = label .. " | { { " .. tconcat( keys, " | " ) ..
            " } | { " .. tconcat( values, " | " ) .. " } }"
  end
  node.label = label .. " }"
end


local function make_html_stack( db, node )
  local frames, start = get_locals( node.thread, db.show_locals )
  if frames then
    local depth = node.depth
    local n = 0
    node.shape = "plaintext"
    node.is_html_label = true
    local label = [[
<TABLE BORDER="0" CELLBORDER="1" CELLSPACING="0" COLOR="lightgrey">
]]
    for i = start, #frames do
      local frame = frames[ i ]
      local name, func = frame.name, frame.func
      if name == '' and i == #frames then name = "[coroutine init]" end
      label = label .. '  <TR><TD PORT="' .. n ..
              '" COLSPAN="3" BGCOLOR="lightgrey">' ..
              make_label_elem( node, func, db, n..":e", depth, name ) ..
              '</TD></TR>\n'
      n = n + 1
      for i = #frame, 1, -1 do
        label = label .. '  <TR><TD>' ..
                escape( i.."", true ) .. '</TD><TD>' ..
                escape( abbrev( frame[ i ][ 1 ] ), true ) ..
                '</TD><TD PORT="' .. n .. '">' ..
                make_label_elem( node, frame[ i ][ 2 ], db, n, depth ) ..
                '</TD></TR>\n'
        n = n + 1
        node.draw = true
      end
    end
    node.label = label .. [[</TABLE>]]
  end
end


local function make_record_stack( db, node )
  local frames, start = get_locals( node.thread, db.show_locals )
  if frames then
    local depth = node.depth
    local n = 0
    node.shape = "Mrecord"
    node.color = "lightgrey"
    local label = "{"
    for i = start, #frames do
      local frame = frames[ i ]
      local name, func = frame.name, frame.func
      if name == '' and i == #frames then name = "[coroutine init]" end
      if n > 0 then label = label .. " |" end
      label = label .. " <" .. n .. "> " ..
              make_label_elem( node, func, db, n..":e", depth, name )
      n = n + 1
      local nums, keys, values = {}, {}, {}
      for i = #frame, 1, -1 do
        nums[ #nums+1 ] = escape( i.."", false )
        keys[ #keys+1 ] = escape( abbrev( frame[ i ][ 1 ] ), false )
        values[ #values+1 ] = "<" .. n .. "> " ..
          make_label_elem( node, frame[ i ][ 2 ], db, n, depth )
        n = n + 1
        node.draw = true
      end
      if next( nums ) ~= nil then
        label = label .. " | { { " .. tconcat( nums, " | " ) ..
                " } | { " .. tconcat( keys, " | " ) .. " } | { " ..
                tconcat( values, " | " ) .. " } }"
      end
    end
    node.label = label .. " }"
  end
end


local function handle_metatable( db, node, val )
  local mt = get_metatable( val, db.show_metatables )
  if mt ~= nil then
    local mt_node = db_node( db, mt, node.depth+1 )
    if mt_node then
      local r = type( mt ) == "table" and "0" or nil
      dottify_metatable_ref( node, nil, mt_node, r, db )
    end
  end
end

local function handle_environment( db, node, val )
  local env = get_environment( val, db.show_environments )
  if env ~= nil then
    local env_node = db_node( db, env, node.depth+1 )
    if env_node then
      local r = type( env ) == "table" and "0" or nil
      dottify_environment_ref( node, nil, env_node, r, db )
    end
  end
end

local function handle_upvalues( db, node, val )
  for na,uv,id in upvalues( val, db.show_upvalues, db.show_environments ) do
    local uv_node = db_node( db, uv, node.depth+1, id )
    if uv_node then
      local r = type( uv ) == "table" and "0" or nil
      dottify_upvalue_ref( node, nil, uv_node, r, db, na )
    end
  end
end

local function handle_stack( db, node, val )
  if db.show_locals then
    local id = db[ val ] or {}
    local st = db_node( db, id, node.depth )
    st.cb = "stack"
    st.thread = val
    dottify_stack_ref( node, nil, st, "0", db )
  end
end

local function handle_registry( db )
  if db.show_registry then
    local reg = get_registry()
    if type( reg ) == "table" then
      local re = db_node( db, reg, 1 )
      re.draw = true
    end
  end
end

local function handle_main_stack( db )
  if db.show_locals then
    local id = {}
    local st = db_node( db, id, 1 )
    if corunning then
      local th = corunning()
      if th then
        db[ th ] = id
      end
    end
    st.cb = "stack"
  end
end

local function handle_size( db, node, val )
  if db.show_sizes and getsize then
    local sn = db_node( db, getsize( val ), node.depth, {} )
    sn.cb = "size"
    dottify_size_ref( node, nil, sn, nil, db )
  end
end


local function dottify_table( db, node, val )
  if db.use_html then
    make_html_table( db, node, val )
  else
    make_record_table( db, node, val )
  end
  handle_metatable( db, node, val )
  handle_size( db, node, val )
end


local function dottify_userdata( db, node, val )
  local label = escape( abbrev( ptostring( val ) ), false )
  if getsize then
    label = label.."  ["..getsize( val ).."]"
  end
  node.label = label
  node.shape = "box"
  node.height = "0.3"
  handle_metatable( db, node, val )
  handle_environment( db, node, val )
  handle_size( db, node, val )
end


local function dottify_cdata( db, node, val )
  node.label = escape( abbrev( ptostring( val ) ), false )
  node.shape = "parallelogram"
  node.margin = "0.01"
  node.width = "0.3"
  node.height = "0.3"
  -- cdata objects *do* have a metatable but it's always
  -- the same, so it's not really interesting ...
  -- handle_metatable( db, node, val )
end


local function dottify_thread( db, node, val )
  local label = escape( abbrev( ptostring( val ) ), false )
  node.group = label
  if getsize then
    label = label.."  ["..getsize( val ).."]"
  end
  node.label = label
  node.shape = "octagon"
  node.margin = "0.01"
  node.width = "0.3"
  node.height = "0.3"
  handle_environment( db, node, val )
  handle_stack( db, node, val )
  handle_size( db, node, val )
end


local function dottify_function( db, node, val )
  local label = escape( abbrev( ptostring( val ) ), false )
  if getsize then
    label = label.."  ["..getsize( val ).."]"
  end
  node.label = label
  node.shape = "ellipse"
  node.margin = "0.01"
  node.height = "0.3"
  handle_environment( db, node, val )
  handle_upvalues( db, node, val )
  handle_size( db, node, val )
end


local function dottify_string( db, node, val )
  node.label = quote( escape( abbrev( val ), false ) )
  node.shape = "plaintext"
end


local function dottify_other( db, node, val )
  node.label = escape( abbrev( ptostring( val ) ), false )
  node.shape = "plaintext"
end


local function dottify_stack( db, node )
  if node.thread then
    node.group = escape( abbrev( ptostring( node.thread ) ), false )
  end
  if db.use_html then
    make_html_stack( db, node )
  else
    make_record_stack( db, node )
  end
end


local function dottify_size( db, node, val )
  node.label = escape( abbrev( val.."" ), false )
  node.shape = "circle"
  node.width = "0.3"
  node.margin = "0.01"
  node.color = "lightgrey"
  node.fontcolor = "dimgrey"
  node.fontsize = "10"
end


local callbacks = {
  table = dottify_table,
  [ "function" ] = dottify_function,
  thread = dottify_thread,
  userdata = dottify_userdata,
  string = dottify_string,
  number = dottify_other,
  boolean = dottify_other,
  [ "nil" ] = dottify_other,
  stack = dottify_stack,
  cdata = dottify_cdata,
  size = dottify_size,
}

local function dottify_go( db, val )
  handle_registry( db )
  handle_main_stack( db )
  db_node( db, val, 1 ).draw = true
  local node = db.list_begin
  while node do
    callbacks[ node.cb or type( node.value ) ]( db, node, node.value )
    node = node.next
  end
end


local function write_nodes( db, out_f )
  local node = db.list_begin
  while node do
    if db.show_leaves or node.draw then
      out_f( db, node )
    end
    node = node.next
  end
end


local function write_edges( db, out_f )
  for i = 1, #db.edges do
    local e = db.edges[ i ]
    local n1, n2 = e.A, e.B
    if db.show_leaves or (n1.draw and n2.draw) then
      out_f( db, e, n1, n2 )
    end
  end
end


local option_names = {
  "label", "shape", "style", "dir", "arrowhead", "arrowtail", "color",
  "margin", "group", "weight", "fontcolor", "fontsize", "width",
  "height",
}

local function process_options_as_text( obj )
  local options = {}
  for i = 1, #option_names do
    local opt = option_names[ i ]
    if obj[ opt ] then
      local quote_on = "\""
      local quote_off = "\""
      if opt == "label" and obj.is_html_label then
        quote_on, quote_off = "<", ">"
      end
      options[ #options+1 ] = opt .. "=" .. quote_on ..
                              obj[ opt ] .. quote_off
    end
  end
  return options
end


local function write_graph_as_text( db, out )
  out( "digraph G {" )
  if db.label then
    out( "  label=\"" .. escape( db.label, false ) .. "\";" )
  end
  write_nodes( db, function( db, n )
    local options = process_options_as_text( n )
    out( "  " .. n.id .. " [" .. tconcat( options, "," ) .. "];" )
  end )
  write_edges( db, function( db, e, n1, n2 )
    local id1 = n1.id
    if e.A_port then id1 = id1 .. ":" .. e.A_port end
    local id2 = n2.id
    if e.B_port then id2 = id2 .. ":" .. e.B_port end
    local options = process_options_as_text( e )
    out( "  " .. id1 .. " -> " .. id2 ..  " [" ..
         tconcat( options, "," ) .. "];" )
  end )
  out( "}" )
end


local gvd_options = {
  metatables = function( db ) db.show_metatables = true end,
  nometatables = function( db ) db.show_metatables = nil end,
  upvalues = function( db ) db.show_upvalues = true end,
  noupvalues = function( db ) db.show_upvalues = nil end,
  environments = function( db ) db.show_environments = true end,
  noenvironments = function( db ) db.show_environments = nil end,
  html = function( db ) db.use_html = true end,
  nohtml = function( db ) db.use_html = nil end,
  leaves = function( db ) db.show_leaves = true end,
  noleaves = function( db ) db.show_leaves = nil end,
  registry = function( db ) db.show_registry = true end,
  noregistry = function( db ) db.show_registry = nil end,
  locals = function( db ) db.show_locals = true end,
  nolocals = function( db ) db.show_locals = nil end,
  sizes = function( db ) db.show_sizes = true end,
  nosizes = function( db ) db.show_sizes = nil end,
}

local function default_option( db, opt )
  local t = type( opt )
  if t == "number" then
    db.max_depth = opt
  elseif t == "table" or t == "userdata" or
         t == "function" or t == "thread" then
    db.prune[ opt ] = true
  elseif t == "string" then
    db.label = opt
  end
end


-- main function (predeclared above)
function dottify( output, val, ... )
  local db = new_db{
    show_metatables = true,
    show_upvalues = true,
    use_html = true,
  }
  for i = 1, select( '#', ... ) do
    local opt = select( i, ... );
    (gvd_options[ opt ] or default_option)( db, opt )
  end
  dottify_go( db, val )
  if type( output ) == "string" then
    assert( ioopen, "io.open needs to be defined for file output" )
    local file = assert( ioopen( output, "w" ) )
    write_graph_as_text( db, function( s )
        file:write( s, "\n" )
      end )
    file:close()
  else
    write_graph_as_text( db, output )
  end
end

return dottify


end
        

package.preload[ "libutils.internal.libs.microscope" ] = function( ... )
    return require('libutils/internal/libs/microscope')
end
            

package.preload[ "libutils/internal/libs/lunajson/_str_lib" ] = function( ... )
local inf = math.huge
local byte, char, sub = string.byte, string.char, string.sub
local setmetatable = setmetatable
local floor = math.floor

local _ENV = nil

local hextbl = {
	0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, inf, inf, inf, inf, inf, inf,
	inf, 0xA, 0xB, 0xC, 0xD, 0xE, 0xF, inf, inf, inf, inf, inf, inf, inf, inf, inf,
	inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf, inf,
	inf, 0xA, 0xB, 0xC, 0xD, 0xE, 0xF, inf, inf, inf, inf, inf, inf, inf, inf, inf,
}
hextbl.__index = function()
	return inf
end
setmetatable(hextbl, hextbl)

return function(myerror)
	local escapetbl = {
		['"']  = '"',
		['\\'] = '\\',
		['/']  = '/',
		['b']  = '\b',
		['f']  = '\f',
		['n']  = '\n',
		['r']  = '\r',
		['t']  = '\t'
	}
	escapetbl.__index = function()
		myerror("invalid escape sequence")
	end
	setmetatable(escapetbl, escapetbl)

	local surrogateprev = 0

	local function subst(ch, rest)
		-- 0.000003814697265625 = 2^-18
		-- 0.000244140625 = 2^-12
		-- 0.015625 = 2^-6
		local u8
		if ch == 'u' then
			local c1, c2, c3, c4 = byte(rest, 1, 4)
			local ucode = hextbl[c1-47] * 0x1000 + hextbl[c2-47] * 0x100 + hextbl[c3-47] * 0x10 + hextbl[c4-47]
			if ucode == inf then
				myerror("invalid unicode charcode")
			end
			rest = sub(rest, 5)
			if ucode < 0x80 then -- 1byte
				u8 = char(ucode)
			elseif ucode < 0x800 then -- 2byte
				u8 = char(0xC0 + floor(ucode * 0.015625), 0x80 + ucode % 0x40)
			elseif ucode < 0xD800 or 0xE000 <= ucode then -- 3byte
				u8 = char(0xE0 + floor(ucode * 0.000244140625), 0x80 + floor(ucode * 0.015625) % 0x40, 0x80 + ucode % 0x40)
			elseif 0xD800 <= ucode and ucode < 0xDC00 then -- surrogate pair 1st
				if surrogateprev == 0 then
					surrogateprev = ucode
					if rest == '' then
						return ''
					end
				end
			else -- surrogate pair 2nd
				if surrogateprev == 0 then
					surrogateprev = 1
				else
					ucode = 0x10000 + (surrogateprev - 0xD800) * 0x400 + (ucode - 0xDC00)
					surrogateprev = 0
					u8 = char(0xF0 + floor(ucode * 0.000003814697265625), 0x80 + floor(ucode * 0.000244140625) % 0x40, 0x80 + floor(ucode * 0.015625) % 0x40, 0x80 + ucode % 0x40)
				end
			end
		end
		if surrogateprev ~= 0 then
			myerror("invalid surrogate pair")
		end
		return (u8 or escapetbl[ch]) .. rest
	end

	local function surrogateok()
		return surrogateprev == 0
	end

	return {
		subst = subst,
		surrogateok = surrogateok
	}
end

end
        

package.preload[ "libutils.internal.libs.lunajson._str_lib" ] = function( ... )
    return require('libutils/internal/libs/lunajson/_str_lib')
end
            

package.preload[ "libutils/internal/libs/lunajson/decoder" ] = function( ... )
local error = error
local byte, char, find, gsub, match, sub = string.byte, string.char, string.find, string.gsub, string.match, string.sub
local tonumber = tonumber
local tostring, setmetatable = tostring, setmetatable

-- The function that interprets JSON strings is separated into another file so as to
-- use bitwise operation to speedup unicode codepoints processing on Lua 5.3.
local genstrlib
--if _VERSION == "Lua 5.3" then
--	genstrlib = require 'lunajson._str_lib_lua53'
--else
	genstrlib = require 'libutils.internal.libs.lunajson._str_lib'
--end

local _ENV = nil

local function newdecoder()
	local json, pos, nullv, arraylen

	-- `f` is the temporary for dispatcher[c] and
	-- the dummy for the first return value of `find`
	local dispatcher, f

	--[[
		Helper
	--]]
	local function decodeerror(errmsg)
		error("parse error at " .. pos .. ": " .. errmsg)
	end

	--[[
		Invalid
	--]]
	local function f_err()
		decodeerror('invalid value')
	end

	--[[
		Constants
	--]]
	-- null
	local function f_nul()
		if sub(json, pos, pos+2) == 'ull' then
			pos = pos+3
			return nullv
		end
		decodeerror('invalid value')
	end

	-- false
	local function f_fls()
		if sub(json, pos, pos+3) == 'alse' then
			pos = pos+4
			return false
		end
		decodeerror('invalid value')
	end

	-- true
	local function f_tru()
		if sub(json, pos, pos+2) == 'rue' then
			pos = pos+3
			return true
		end
		decodeerror('invalid value')
	end

	--[[
		Numbers
		Conceptually, the longest prefix that matches to `-?(0|[1-9][0-9]*)(\.[0-9]*)?([eE][+-]?[0-9]*)?`
		(in regexp) is captured as a number and its conformance to the JSON spec is checked.
	--]]
	-- deal with non-standard locales
	local radixmark = match(tostring(0.5), '[^0-9]')
	local fixedtonumber = tonumber
	if radixmark ~= '.' then
		if find(radixmark, '%W') then
			radixmark = '%' .. radixmark
		end
		fixedtonumber = function(s)
			return tonumber(gsub(s, '.', radixmark))
		end
	end

	local function error_number()
		decodeerror('invalid number')
	end

	-- `0(\.[0-9]*)?([eE][+-]?[0-9]*)?`
	local function f_zro(mns)
		local postmp = pos
		local num
		local c = byte(json, postmp)
		if not c then
			return error_number()
		end

		if c == 0x2E then -- is this `.`?
			num = match(json, '^.[0-9]*', pos) -- skipping 0
			local numlen = #num
			if numlen == 1 then
				return error_number()
			end
			postmp = pos + numlen
			c = byte(json, postmp)
		end

		if c == 0x45 or c == 0x65 then -- is this e or E?
			local numexp = match(json, '^[^eE]*[eE][-+]?[0-9]+', pos)
			if not numexp then
				return error_number()
			end
			if num then -- since `0e.*` is always 0.0, ignore those
				num = numexp
			end
			postmp = pos + #numexp
		end

		pos = postmp
		if num then
			num = fixedtonumber(num)
		else
			num = 0.0
		end
		if mns then
			num = -num
		end
		return num
	end

	-- `[1-9][0-9]*(\.[0-9]*)?([eE][+-]?[0-9]*)?`
	local function f_num(mns)
		pos = pos-1
		local num = match(json, '^.[0-9]*%.?[0-9]*', pos)
		if byte(num, -1) == 0x2E then
			return error_number()
		end
		local postmp = pos + #num
		local c = byte(json, postmp)

		if c == 0x45 or c == 0x65 then -- e or E?
			num = match(json, '^[^eE]*[eE][-+]?[0-9]+', pos)
			if not num then
				return error_number()
			end
			postmp = pos + #num
		end

		pos = postmp
		num = fixedtonumber(num)-0.0
		if mns then
			num = -num
		end
		return num
	end

	-- skip minus sign
	local function f_mns()
		local c = byte(json, pos)
		if c then
			pos = pos+1
			if c > 0x30 then
				if c < 0x3A then
					return f_num(true)
				end
			else
				if c > 0x2F then
					return f_zro(true)
				end
			end
		end
		decodeerror('invalid number')
	end

	--[[
		Strings
	--]]
	local f_str_lib = genstrlib(decodeerror)
	local f_str_surrogateok = f_str_lib.surrogateok -- whether codepoints for surrogate pair are correctly paired
	local f_str_subst = f_str_lib.subst -- the function passed to gsub that interprets escapes

	-- caching interpreted keys for speed
	local f_str_keycache = setmetatable({}, {__mode="v"})

	local function f_str(iskey)
		local newpos = pos-2
		local pos2 = pos
		local c1, c2
		repeat
			newpos = find(json, '"', pos2, true) -- search '"'
			if not newpos then
				decodeerror("unterminated string")
			end
			pos2 = newpos+1
			while true do -- skip preceding '\\'s
				c1, c2 = byte(json, newpos-2, newpos-1)
				if c2 ~= 0x5C or c1 ~= 0x5C then
					break
				end
				newpos = newpos-2
			end
		until c2 ~= 0x5C -- check '"' is not preceded by '\'

		local str = sub(json, pos, pos2-2)
		pos = pos2

		if iskey then -- check key cache
			local str2 = f_str_keycache[str]
			if str2 then
				return str2
			end
		end
		local str2 = str
		if find(str2, '\\', 1, true) then -- check if backslash occurs
			str2 = gsub(str2, '\\(.)([^\\]*)', f_str_subst) -- interpret escapes
			if not f_str_surrogateok() then
				decodeerror("invalid surrogate pair")
			end
		end
		if iskey then -- commit key cache
			f_str_keycache[str] = str2
		end
		return str2
	end

	--[[
		Arrays, Objects
	--]]
	-- array
	local function f_ary()
		local ary = {}

		f, pos = find(json, '^[ \n\r\t]*', pos)
		pos = pos+1

		local i = 0
		if byte(json, pos) ~= 0x5D then -- check closing bracket ']', that consists an empty array
			local newpos = pos-1
			repeat
				i = i+1
				f = dispatcher[byte(json,newpos+1)] -- parse value
				pos = newpos+2
				ary[i] = f()
				f, newpos = find(json, '^[ \n\r\t]*,[ \n\r\t]*', pos) -- check comma
			until not newpos

			f, newpos = find(json, '^[ \n\r\t]*%]', pos) -- check closing bracket
			if not newpos then
				decodeerror("no closing bracket of an array")
			end
			pos = newpos
		end

		pos = pos+1
		if arraylen then -- commit the length of the array if `arraylen` is set
			ary[0] = i
		end
		return ary
	end

	-- objects
	local function f_obj()
		local obj = {}

		f, pos = find(json, '^[ \n\r\t]*', pos)
		pos = pos+1
		if byte(json, pos) ~= 0x7D then -- check the closing bracket '}', that consists an empty object
			local newpos = pos-1

			repeat
				pos = newpos+1
				if byte(json, pos) ~= 0x22 then -- check '"'
					decodeerror("not key")
				end
				pos = pos+1
				local key = f_str(true) -- parse key

				-- optimized for compact json
				-- c1, c2 == ':', <the first char of the value> or
				-- c1, c2, c3 == ':', ' ', <the first char of the value>
				f = f_err
				do
					local c1, c2, c3  = byte(json, pos, pos+3)
					if c1 == 0x3A then
						newpos = pos
						if c2 == 0x20 then
							newpos = newpos+1
							c2 = c3
						end
						f = dispatcher[c2]
					end
				end
				if f == f_err then -- read a colon and arbitrary number of spaces
					f, newpos = find(json, '^[ \n\r\t]*:[ \n\r\t]*', pos)
					if not newpos then
						decodeerror("no colon after a key")
					end
				end
				f = dispatcher[byte(json, newpos+1)] -- parse value
				pos = newpos+2
				obj[key] = f()
				f, newpos = find(json, '^[ \n\r\t]*,[ \n\r\t]*', pos)
			until not newpos

			f, newpos = find(json, '^[ \n\r\t]*}', pos)
			if not newpos then
				decodeerror("no closing bracket of an object")
			end
			pos = newpos
		end

		pos = pos+1
		return obj
	end

	--[[
		The jump table to dispatch a parser for a value, indexed by the code of the value's first char.
		Nil key means the end of json.
	--]]
	dispatcher = {
		       f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_str, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_mns, f_err, f_err,
		f_zro, f_num, f_num, f_num, f_num, f_num, f_num, f_num, f_num, f_num, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_ary, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_fls, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_nul, f_err,
		f_err, f_err, f_err, f_err, f_tru, f_err, f_err, f_err, f_err, f_err, f_err, f_obj, f_err, f_err, f_err, f_err,
	}
	dispatcher[0] = f_err
	dispatcher.__index = function()
		decodeerror("unexpected termination")
	end
	setmetatable(dispatcher, dispatcher)

	--[[
		run decoder
	--]]
	local function decode(json_, pos_, nullv_, arraylen_)
		json, pos, nullv, arraylen = json_, pos_, nullv_, arraylen_

		pos = pos or 1
		f, pos = find(json, '^[ \n\r\t]*', pos)
		pos = pos+1

		f = dispatcher[byte(json, pos)]
		pos = pos+1
		local v = f()

		if pos_ then
			return v, pos
		else
			f, pos = find(json, '^[ \n\r\t]*', pos)
			if pos ~= #json then
				error('json ended')
			end
			return v
		end
	end

	return decode
end

return newdecoder

end
        

package.preload[ "libutils.internal.libs.lunajson.decoder" ] = function( ... )
    return require('libutils/internal/libs/lunajson/decoder')
end
            

package.preload[ "libutils/internal/libs/lunajson/encoder" ] = function( ... )
local error = error
local byte, find, format, gsub, match = string.byte, string.find, string.format,  string.gsub, string.match
local concat = table.concat
local tostring = tostring
local pairs, type = pairs, type
local setmetatable = setmetatable
local huge, tiny = 1/0, -1/0

local f_string_pat
if _VERSION == "Lua 5.1" then
	-- use the cluttered pattern because lua 5.1 does not handle \0 in a pattern correctly
	f_string_pat = '[^ -!#-[%]^-\255]'
else
	f_string_pat = '[\0-\31"\\]'
end

local _ENV = nil

local function newencoder()
	local v, nullv
	local i, builder, visited

	local function f_tostring(v)
		builder[i] = tostring(v)
		i = i+1
	end

	local radixmark = match(tostring(0.5), '[^0-9]')
	local delimmark = match(tostring(12345.12345), '[^0-9' .. radixmark .. ']')
	if radixmark == '.' then
		radixmark = nil
	end

	local radixordelim
	if radixmark or delimmark then
		radixordelim = true
		if radixmark and find(radixmark, '%W') then
			radixmark = '%' .. radixmark
		end
		if delimmark and find(delimmark, '%W') then
			delimmark = '%' .. delimmark
		end
	end

	local f_number = function(n)
		if tiny < n and n < huge then
			local s = format("%.17g", n)
			if radixordelim then
				if delimmark then
					s = gsub(s, delimmark, '')
				end
				if radixmark then
					s = gsub(s, radixmark, '.')
				end
			end
			builder[i] = s
			i = i+1
			return
		end
		error('invalid number')
	end

	local doencode

	local f_string_subst = {
		['"'] = '\\"',
		['\\'] = '\\\\',
		['\b'] = '\\b',
		['\f'] = '\\f',
		['\n'] = '\\n',
		['\r'] = '\\r',
		['\t'] = '\\t',
		__index = function(_, c)
			return format('\\u00%02X', byte(c))
		end
	}
	setmetatable(f_string_subst, f_string_subst)

	local function f_string(s)
		builder[i] = '"'
		if find(s, f_string_pat) then
			s = gsub(s, f_string_pat, f_string_subst)
		end
		builder[i+1] = s
		builder[i+2] = '"'
		i = i+3
	end

	local function f_table(o)
		if visited[o] then
			error("loop detected")
		end
		visited[o] = true

		local tmp = o[0]
		if type(tmp) == 'number' then -- arraylen available
			builder[i] = '['
			i = i+1
			for j = 1, tmp do
				doencode(o[j])
				builder[i] = ','
				i = i+1
			end
			if tmp > 0 then
				i = i-1
			end
			builder[i] = ']'

		else
			tmp = o[1]
			if tmp ~= nil then -- detected as array
				builder[i] = '['
				i = i+1
				local j = 2
				repeat
					doencode(tmp)
					tmp = o[j]
					if tmp == nil then
						break
					end
					j = j+1
					builder[i] = ','
					i = i+1
				until false
				builder[i] = ']'

			else -- detected as object
				builder[i] = '{'
				i = i+1
				local tmp = i
				for k, v in pairs(o) do
					if type(k) ~= 'string' then
						error("non-string key")
					end
					f_string(k)
					builder[i] = ':'
					i = i+1
					doencode(v)
					builder[i] = ','
					i = i+1
				end
				if i > tmp then
					i = i-1
				end
				builder[i] = '}'
			end
		end

		i = i+1
		visited[o] = nil
	end

	local dispatcher = {
		boolean = f_tostring,
		number = f_number,
		string = f_string,
		table = f_table,
		__index = function()
			error("invalid type value")
		end
	}
	setmetatable(dispatcher, dispatcher)

	function doencode(v)
		if v == nullv then
			builder[i] = 'null'
			i = i+1
			return
		end
		return dispatcher[type(v)](v)
	end

	local function encode(v_, nullv_)
		v, nullv = v_, nullv_
		i, builder, visited = 1, {}, {}

		doencode(v)
		return concat(builder)
	end

	return encode
end

return newencoder

end
        

package.preload[ "libutils.internal.libs.lunajson.encoder" ] = function( ... )
    return require('libutils/internal/libs/lunajson/encoder')
end
            

package.preload[ "libutils/internal/libs/lunajson/sax" ] = function( ... )
local error = error
local byte, char, find, gsub, match, sub = string.byte, string.char, string.find, string.gsub, string.match, string.sub
local tonumber = tonumber
local tostring, type, unpack = tostring, type, table.unpack or unpack

-- The function that interprets JSON strings is separated into another file so as to
-- use bitwise operation to speedup unicode codepoints processing on Lua 5.3.
local genstrlib
--if _VERSION == "Lua 5.3" then
--	genstrlib = require 'lunajson._str_lib_lua53'
--else
	genstrlib = require 'libutils.internal.libs.lunajson._str_lib'
--end

local _ENV = nil

local function nop() end

local function newparser(src, saxtbl)
	local json, jsonnxt
	local jsonlen, pos, acc = 0, 1, 0

	-- `f` is the temporary for dispatcher[c] and
	-- the dummy for the first return value of `find`
	local dispatcher, f

	-- initialize
	if type(src) == 'string' then
		json = src
		jsonlen = #json
		jsonnxt = function()
			json = ''
			jsonlen = 0
			jsonnxt = nop
		end
	else
		jsonnxt = function()
			acc = acc + jsonlen
			pos = 1
			repeat
				json = src()
				if not json then
					json = ''
					jsonlen = 0
					jsonnxt = nop
					return
				end
				jsonlen = #json
			until jsonlen > 0
		end
		jsonnxt()
	end

	local sax_startobject = saxtbl.startobject or nop
	local sax_key = saxtbl.key or nop
	local sax_endobject = saxtbl.endobject or nop
	local sax_startarray = saxtbl.startarray or nop
	local sax_endarray = saxtbl.endarray or nop
	local sax_string = saxtbl.string or nop
	local sax_number = saxtbl.number or nop
	local sax_boolean = saxtbl.boolean or nop
	local sax_null = saxtbl.null or nop

	--[[
		Helper
	--]]
	local function tryc()
		local c = byte(json, pos)
		if not c then
			jsonnxt()
			c = byte(json, pos)
		end
		return c
	end

	local function parseerror(errmsg)
		error("parse error at " .. acc + pos .. ": " .. errmsg)
	end

	local function tellc()
		return tryc() or parseerror("unexpected termination")
	end

	local function spaces() -- skip spaces and prepare the next char
		while true do
			f, pos = find(json, '^[ \n\r\t]*', pos)
			if pos ~= jsonlen then
				pos = pos+1
				return
			end
			if jsonlen == 0 then
				parseerror("unexpected termination")
			end
			jsonnxt()
		end
	end

	--[[
		Invalid
	--]]
	local function f_err()
		parseerror('invalid value')
	end

	--[[
		Constants
	--]]
	-- fallback slow constants parser
	local function generic_constant(target, targetlen, ret, sax_f)
		for i = 1, targetlen do
			local c = tellc()
			if byte(target, i) ~= c then
				parseerror("invalid char")
			end
			pos = pos+1
		end
		return sax_f(ret)
	end

	-- null
	local function f_nul()
		if sub(json, pos, pos+2) == 'ull' then
			pos = pos+3
			return sax_null(nil)
		end
		return generic_constant('ull', 3, nil, sax_null)
	end

	-- false
	local function f_fls()
		if sub(json, pos, pos+3) == 'alse' then
			pos = pos+4
			return sax_boolean(false)
		end
		return generic_constant('alse', 4, false, sax_boolean)
	end

	-- true
	local function f_tru()
		if sub(json, pos, pos+2) == 'rue' then
			pos = pos+3
			return sax_boolean(true)
		end
		return generic_constant('rue', 3, true, sax_boolean)
	end

	--[[
		Numbers
		Conceptually, the longest prefix that matches to `(0|[1-9][0-9]*)(\.[0-9]*)?([eE][+-]?[0-9]*)?`
		(in regexp) is captured as a number and its conformance to the JSON spec is checked.
	--]]
	-- deal with non-standard locales
	local radixmark = match(tostring(0.5), '[^0-9]')
	local fixedtonumber = tonumber
	if radixmark ~= '.' then -- deals with non-standard locales
		if find(radixmark, '%W') then
			radixmark = '%' .. radixmark
		end
		fixedtonumber = function(s)
			return tonumber(gsub(s, '.', radixmark))
		end
	end

	-- fallback slow parser
	local function generic_number(mns)
		local buf = {}
		local i = 1

		local c = byte(json, pos)
		pos = pos+1

		local function nxt()
			buf[i] = c
			i = i+1
			c = tryc()
			pos = pos+1
		end

		if c == 0x30 then
			nxt()
		else
			repeat nxt() until not (c and 0x30 <= c and c < 0x3A)
		end
		if c == 0x2E then
			nxt()
			if not (c and 0x30 <= c and c < 0x3A) then
				parseerror('invalid number')
			end
			repeat nxt() until not (c and 0x30 <= c and c < 0x3A)
		end
		if c == 0x45 or c == 0x65 then
			nxt()
			if c == 0x2B or c == 0x2D then
				nxt()
			end
			if not (c and 0x30 <= c and c < 0x3A) then
				parseerror('invalid number')
			end
			repeat nxt() until not (c and 0x30 <= c and c < 0x3A)
		end
		pos = pos-1

		local num = char(unpack(buf))
		num = fixedtonumber(num)-0.0
		if mns then
			num = -num
		end
		return sax_number(num)
	end

	-- `0(\.[0-9]*)?([eE][+-]?[0-9]*)?`
	local function f_zro(mns)
		local postmp = pos
		local num
		local c = byte(json, postmp)

		if c == 0x2E then -- is this `.`?
			num = match(json, '^.[0-9]*', pos) -- skipping 0
			local numlen = #num
			if numlen == 1 then
				pos = pos-1
				return generic_number(mns)
			end
			postmp = pos + numlen
			c = byte(json, postmp)
		end

		if c == 0x45 or c == 0x65 then -- is this e or E?
			local numexp = match(json, '^[^eE]*[eE][-+]?[0-9]+', pos)
			if not numexp then
				pos = pos-1
				return generic_number(mns)
			end
			if num then -- since `0e.*` is always 0.0, ignore those
				num = numexp
			end
			postmp = pos + #numexp
		end

		if postmp > jsonlen then
			pos = pos-1
			return generic_number(mns)
		end
		pos = postmp
		if num then
			num = fixedtonumber(num)
		else
			num = 0.0
		end
		if mns then
			num = -num
		end
		return sax_number(num)
	end

	-- `[1-9][0-9]*(\.[0-9]*)?([eE][+-]?[0-9]*)?`
	local function f_num(mns)
		pos = pos-1
		local num = match(json, '^.[0-9]*%.?[0-9]*', pos)
		if byte(num, -1) == 0x2E then
			return generic_number(mns)
		end
		local postmp = pos + #num
		local c = byte(json, postmp)

		if c == 0x45 or c == 0x65 then -- e or E?
			num = match(json, '^[^eE]*[eE][-+]?[0-9]+', pos)
			if not num then
				return generic_number(mns)
			end
			postmp = pos + #num
		end

		if postmp > jsonlen then
			return generic_number(mns)
		end
		pos = postmp
		num = fixedtonumber(num)-0.0
		if mns then
			num = -num
		end
		return sax_number(num)
	end

	-- skip minus sign
	local function f_mns()
		local c = byte(json, pos) or tellc()
		if c then
			pos = pos+1
			if c > 0x30 then
				if c < 0x3A then
					return f_num(true)
				end
			else
				if c > 0x2F then
					return f_zro(true)
				end
			end
		end
		parseerror("invalid number")
	end

	--[[
		Strings
	--]]
	local f_str_lib = genstrlib(parseerror)
	local f_str_surrogateok = f_str_lib.surrogateok -- whether codepoints for surrogate pair are correctly paired
	local f_str_subst = f_str_lib.subst -- the function passed to gsub that interprets escapes

	local function f_str(iskey)
		local pos2 = pos
		local newpos
		local str = ''
		local bs
		while true do
			while true do -- search '\' or '"'
				newpos = find(json, '[\\"]', pos2)
				if newpos then
					break
				end
				str = str .. sub(json, pos, jsonlen)
				if pos2 == jsonlen+2 then
					pos2 = 2
				else
					pos2 = 1
				end
				jsonnxt()
			end
			if byte(json, newpos) == 0x22 then -- break if '"'
				break
			end
			pos2 = newpos+2 -- skip '\<char>'
			bs = true -- remember that backslash occurs
		end
		str = str .. sub(json, pos, newpos-1)
		pos = newpos+1

		if bs then -- check if backslash occurs
			str = gsub(str, '\\(.)([^\\]*)', f_str_subst) -- interpret escapes
			if not f_str_surrogateok() then
				parseerror("invalid surrogate pair")
			end
		end

		if iskey then
			return sax_key(str)
		end
		return sax_string(str)
	end

	--[[
		Arrays, Objects
	--]]
	-- arrays
	local function f_ary()
		sax_startarray()
		spaces()
		if byte(json, pos) ~= 0x5D then -- check the closing bracket ']', that consists an empty array
			local newpos
			while true do
				f = dispatcher[byte(json, pos)] -- parse value
				pos = pos+1
				f()
				f, newpos = find(json, '^[ \n\r\t]*,[ \n\r\t]*', pos) -- check comma
				if not newpos then
					f, newpos = find(json, '^[ \n\r\t]*%]', pos) -- check closing bracket
					if newpos then
						pos = newpos
						break
					end
					spaces() -- since the current chunk can be ended, skip spaces toward following chunks
					local c = byte(json, pos)
					if c == 0x2C then -- check comma again
						pos = pos+1
						spaces()
						newpos = pos-1
					elseif c == 0x5D then -- check closing bracket again
						break
					else
						parseerror("no closing bracket of an array")
					end
				end
				pos = newpos+1
				if pos > jsonlen then
					spaces()
				end
			end
		end
		pos = pos+1
		return sax_endarray()
	end

	-- objects
	local function f_obj()
		sax_startobject()
		spaces()
		if byte(json, pos) ~= 0x7D then -- check the closing bracket `}`, that consists an empty object
			local newpos
			while true do
				if byte(json, pos) ~= 0x22 then
					parseerror("not key")
				end
				pos = pos+1
				f_str(true)
				f, newpos = find(json, '^[ \n\r\t]*:[ \n\r\t]*', pos) -- check colon
				if not newpos then
					spaces() -- since the current chunk can be ended, skip spaces toward following chunks
					if byte(json, pos) ~= 0x3A then -- check colon again
						parseerror("no colon after a key")
					end
					pos = pos+1
					spaces()
					newpos = pos-1
				end
				pos = newpos+1
				if pos > jsonlen then
					spaces()
				end
				f = dispatcher[byte(json, pos)] -- parse value
				pos = pos+1
				f()
				f, newpos = find(json, '^[ \n\r\t]*,[ \n\r\t]*', pos) -- check comma
				if not newpos then
					f, newpos = find(json, '^[ \n\r\t]*}', pos) -- check closing bracket
					if newpos then
						pos = newpos
						break
					end
					spaces() -- since the current chunk can be ended, skip spaces toward following chunks
					local c = byte(json, pos)
					if c == 0x2C then -- check comma again
						pos = pos+1
						spaces()
						newpos = pos-1
					elseif c == 0x7D then -- check closing bracket again
						break
					else
						parseerror("no closing bracket of an object")
					end
				end
				pos = newpos+1
				if pos > jsonlen then
					spaces()
				end
			end
		end
		pos = pos+1
		return sax_endobject()
	end

	--[[
		The jump table to dispatch a parser for a value, indexed by the code of the value's first char.
		Key should be non-nil.
	--]]
	dispatcher = {
		       f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_str, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_mns, f_err, f_err,
		f_zro, f_num, f_num, f_num, f_num, f_num, f_num, f_num, f_num, f_num, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_ary, f_err, f_err, f_err, f_err,
		f_err, f_err, f_err, f_err, f_err, f_err, f_fls, f_err, f_err, f_err, f_err, f_err, f_err, f_err, f_nul, f_err,
		f_err, f_err, f_err, f_err, f_tru, f_err, f_err, f_err, f_err, f_err, f_err, f_obj, f_err, f_err, f_err, f_err,
	}
	dispatcher[0] = f_err

	--[[
		public funcitons
	--]]
	local function run()
		spaces()
		f = dispatcher[byte(json, pos)]
		pos = pos+1
		f()
	end

	local function read(n)
		if n < 0 then
			error("the argument must be non-negative")
		end
		local pos2 = (pos-1) + n
		local str = sub(json, pos, pos2)
		while pos2 > jsonlen and jsonlen ~= 0 do
			jsonnxt()
			pos2 = pos2 - (jsonlen - (pos-1))
			str = str .. sub(json, pos, pos2)
		end
		if jsonlen ~= 0 then
			pos = pos2+1
		end
		return str
	end

	local function tellpos()
		return acc + pos
	end

	return {
		run = run,
		tryc = tryc,
		read = read,
		tellpos = tellpos,
	}
end

local function newfileparser(fn, saxtbl)
	local fp = io.open(fn)
	local function gen()
		local s
		if fp then
			s = fp:read(8192)
			if not s then
				fp:close()
				fp = nil
			end
		end
		return s
	end
	return newparser(gen, saxtbl)
end

return {
	newparser = newparser,
	newfileparser = newfileparser
}

end
        

package.preload[ "libutils.internal.libs.lunajson.sax" ] = function( ... )
    return require('libutils/internal/libs/lunajson/sax')
end
            
require("libutils.annotation");
require("libutils.debug");
require("libutils.enum");
require("libutils.funcutils");
require("libutils.gc");
require("libutils.global");
require("libutils.json");
require("libutils.math");
require("libutils.messages");
require("libutils.misc");
require("libutils.objInfo");
require("libutils.queue");
require("libutils.sequenceWorks");
require("libutils.stringbuilder");
require("libutils.task");
require("libutils.uniqId");
require("libutils.version");
require("libutils.internal.libs.inspect");
require("libutils.internal.libs.lunajson");
require("libutils.internal.libs.microscope");
require("libutils.internal.libs.lunajson._str_lib");
require("libutils.internal.libs.lunajson.decoder");
require("libutils.internal.libs.lunajson.encoder");
require("libutils.internal.libs.lunajson.sax");