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

M.map = function (fn, t)
    local result = {}

    for k, v in pairs(t) do
        result[k] = fn(v)
    end

    return result
end

M.export = function ()
    for k, v in pairs(M) do
        if v ~= M.export then
            _G[k] = v
        end
    end
end

return M