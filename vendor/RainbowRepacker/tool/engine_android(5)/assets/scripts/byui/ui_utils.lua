local anim = require('animation')
local M = {}
local focus = nil
M.set_focus = function  ( obj )
    if focus ~= obj  then
        if focus and focus.on_focus_change then
            focus:on_focus_change(false)
        end
        focus = obj
    end 
    
end
M.get_focus = function ( )
    return focus
end

M.remove_focus = function (  )
    focus = nil
end

M.default_t_border = function (unit)
    return {unit.size.x / 2, unit.size.y / 2, unit.size.x / 2, unit.size.y / 2}
end

M.get_dimension = function (p, d)
    if d == kVertical then
        return p.y
    else
        return p.x
    end
end

M.play_attr_anim = function (animator, desc, duration)
    -- { { widget, name, to } }
    local anims = {}
    for i, d in ipairs(desc) do
        local a = anim.named(i, anim.value(d[1][d[2]], d[3]))
        if d[4] ~= nil then
            a = anim.timing(d[4], a)
        end
        table.insert(anims, a)
    end
    local function upd(v)
        for i, d in ipairs(v) do
            desc[i][1][desc[i][2]] = d
        end
    end
    local a = anim.spawn(unpack(anims))
    animator:start(anim.duration(duration or 1,a), upd)
end
return M