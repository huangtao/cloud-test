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

M.get = (function ()
    local id = 0
    return function ()
        id = id + 1
        return id
    end
end)()

return M