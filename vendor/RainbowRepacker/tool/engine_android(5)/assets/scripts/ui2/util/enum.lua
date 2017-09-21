--
-- @@LIB_NAME@@, Version: @@Version@@
--
-- This file is a part of @@LIB_NAME@@.
--
-- Author:
-- Xiaofeng Yang     2015
--
--


return function(table)
    return setmetatable( {}, {
        __index = function (t, k)
            local value = table[k]
            if k == nil then
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
