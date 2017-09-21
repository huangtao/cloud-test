--local inspect = require('inspect')

local function index(self, name, meta)
    if meta == nil then
        meta = getmetatable(self)
    end
    local result
    while true do
        result = rawget(meta, name)
        if result ~= nil then
            return result
        end
        local getters = rawget(meta, '___getters')
        if getters ~= nil then
            result = getters[name]
            if result ~= nil then
                return result(self)
            end
        end

        meta = rawget(meta, '___super')
        if meta == nil then
            if type(self) == 'userdata' then
                return Widget.get_uservalue(self, name)
            else
                return rawget(self, name)
            end
        end
    end
end

local function newindex(self, name, value, meta)
    if meta == nil then
        meta = getmetatable(self)
    end
    local result
    while true do
        local setters = rawget(meta, '___setters')
        if setters ~= nil then
            result = setters[name]
            if result ~= nil then
                result(self, value)
                return
            end
        end
        meta = rawget(meta, '___super')
        if meta == nil then
            if type(self) == 'userdata' then
                Widget.set_uservalue(self, name, value)
            else
                rawset(self, name, value)
            end
            return
        end
    end
end

local function is_property(t)
    return type(t) == 'table' and type(t[1]) == 'function' and (#t==1 or (#t==2 and type(t[2]) == 'function'))
end

local function process_meta(meta)
    local new_meta = {}
    local getters = {}
    local setters = {}
    for k, v in pairs(meta) do
        if is_property(v) then
            getters[k] = v[1]
            setters[k] = v[2]
        else
            rawset(new_meta, k, v)
        end
    end
    rawset(new_meta, '___getters', getters)
    rawset(new_meta, '___setters', setters)
    return new_meta
end

local function find_native_class(meta)
    if meta.___lua == true then
        if meta.___super == nil then
            return
        end
        return find_native_class(meta.___super)
    else
        return meta
    end
end

local function class(name, super, meta)
    name = name or "";
    meta = meta or {};

    meta = process_meta(meta)
    if super ~= nil then
        meta.___super = super.___class
    end
    local type_name = string.format('class(%s)', name)
    meta.___lua = true
    meta.___native = find_native_class(meta)
    local native = meta.___native ~= nil

    -- auto-call super's gc
    local self_gc = meta.__gc
    function meta.__gc(self)
        --if self.___deleted ~= true then
            if self_gc then
                self_gc(self)
            end
            if meta.___super ~= nil then
                rawget(meta.___super, '__gc')(self)
            end
        --    self.___deleted = true
        --end
    end

    local cls = {
        ___name = name,
        ___type = 'static_' .. type_name,
        ___class = meta,
        __call = function(_, ...)
            local obj
            if native then
                if meta.__new__ then
                    obj = meta.__new__(...)
                else
                    obj = meta.___native.class()
                end
                assert(type(obj) == 'userdata')
                obj.metatable = meta
                obj.contain_children = true
                obj = obj:to_lua()
            else
                obj = setmetatable({}, meta)
            end
            local fn = obj.__init__
            if fn then
                fn(obj, ...)
            end
            return obj
        end
    }
    setmetatable(cls, cls)
    meta.class = cls
    meta.___type = type_name
    meta.__index = index
    meta.__newindex = newindex

    if super == nil or not rawget(super.___class, '___lua') then
        meta.setDelegate = function(self, d)
            self.m_delegate = d
        end
    end

    return cls
end

local function mixin(...)
    local tt = {...}
    assert(#tt >= 1)
    local r = tt[#tt]
    if #tt == 1 then
        return r
    end
    for i, t in ipairs(tt) do
        if i < #tt then
            table.merge(r, t, false)
        end
    end
    return r
end

local function super(cls, obj)
    assert(cls.___class.___super ~= nil)
    return setmetatable({}, {
        __index = function(_, name)
            return index(obj, name, cls.___class.___super)
        end,
        __newindex = function(_, name, value)
            newindex(obj, name, value, cls.___class.___super)
        end,
    })
end
local function isinstance(obj, cls)
    local meta = cls.___class
    local m = getmetatable(obj)
    while m do
        if m == meta then
            return true
        end
        m = m.___super
    end
    return false
end
local function issubclass(cls1, cls2)
    local meta1 = cls1.___class
    local meta2 = cls2.___class
    while true do
        if meta1 == meta2 then
            return true
        end
        meta1 = meta1.___super
    end
    return false
end
return {class, mixin, super, {
    index = index,
    newindex = newindex,
    isinstance = isinstance,
    issubclass = issubclass,
}}
