
package.preload[ "animation" ] = function( ... )
if kAnimNormal == nil then
    -- from core.constants
    kAnimNormal	= 0;
    kAnimRepeat	= 1;
    kAnimLoop	    = 2;
end

local M = {}

local function table_merge(t1, t2)
    for k,v in pairs(t2) do
        t1[k] = v
    end
end

function M.callable(o)
    if type(o) == 'function' then
        return true
    elseif type(o) == 'table' then
        local m = getmetatable(o)
        return m ~= nil and m.__call ~= nil
    else
        return false
    end
end

local function interp(v1, v2, f)
    if type(v1) == 'table' then
        local r = {}
        for k,v in pairs(v1) do
            if v2[k] ~= nil then
                r[k] = interp(v, v2[k], f)
            else
                r[k] = v
            end
        end
        return r
    elseif type(v1) == 'userdata' then
        return v1:interpolate(v2, f)
    else
        return v1 + (v2 - v1) * f
    end
end

function M.get_duration(item)
    if type(item) == 'table' and item.duration ~= nil then
        return item.duration
    else
        return 1
    end
end

-- combinators
function M.constant(value)
    return function(f)
        return value
    end
end

M.empty = M.constant(nil)

function M.identity(f)
    return f
end

function M.swfFrame(swf,startFrame,endFrame,repeatCount)
    return M.duration(swf:getTimeBetween(startFrame,endFrame) * repeatCount, function(f)
                        f = (f * repeatCount)%1 * (endFrame - startFrame) + startFrame;
                        swf:setAnimParams(startFrame,endFrame,repeatCount);
                        swf:gotoAndStop(f);
                        return {};
                        end);
end

function M.keyframes(frames)
    return function(f)
        for i, frame in ipairs(frames) do
            if i == #frames then
                return frame[2]
            else
                local t1, v1, timing = unpack(frame)
                if f >= t1 then
                    local t2, v2, _ = unpack(frames[i+1])
                    if f < t2 then
                        f = timing((f - t1) / (t2 - t1))
                        return interp(v1, v2, f)
                    end
                end
            end
        end
    end
end

function M.value(from, to)
    return function(f)
        return interp(from, to, f)
    end
end

function M.prop(name, from, to, duration, timing)
    local ac = M.named(name, M.value(from, to))
    if timing then
        ac = M.timing(timing, ac)
    end
    if duration then
        ac = M.duration(duration, ac)
    end
    return ac
end

function M.prop_by(name, from, to, duration, timing)
    assert(string.sub(name, 1, 9) ~= 'relative_', 'duplicate relative_ prefix.')
    return M.prop('relative_' .. name, from, to, duration, timing)
end

function M.bezier_path(points)
    local sp = BSpline(3, 2, #points, BSpline.TS_BEZIERS)
    local ctrlp = {}
    for _, p in ipairs(points) do
        table.insert(ctrlp, p.x)
        table.insert(ctrlp, p.y)
    end
    sp.ctrlp = ctrlp
    return function(f)
        return {pos=Point(unpack(sp:evaluate(f).result))}
    end
end

function M.timing(time_fn, action)
    return setmetatable({
        duration = M.get_duration(action)
    }, {
        __call = function(self, f)
            return action(time_fn(f))
        end
    })
end

function M.sequence(...)
    local actions = {...}
    local sum_duration = 0
    for _, item in ipairs(actions) do
        sum_duration = sum_duration + M.get_duration(item)
    end
    return setmetatable({
        duration = sum_duration
    }, {
        __call = function(self, f)
            f = f * sum_duration
            for _, action in ipairs(actions) do
                local duration = M.get_duration(action)
                if f <= duration then
                    return action(f / duration)
                else
                    f = f - duration
                end
            end
            return actions[#actions](1)
        end
    })
end

function M.spawn(...)
    local actions = {...}
    local max_d = 0
    for _, item in ipairs(actions) do
        local d = M.get_duration(item)
        if d > max_d then
            max_d = d
        end
    end

    return setmetatable({
        duration = max_d,
    }, {
        __call = function(self, f)
            local t = {}
            for _, action in ipairs(actions) do
                local d = M.get_duration(action)
                local ff
                if d ~= 0 then
                    ff = f * max_d / d
                    if ff < 0 then
                        ff = math.abs(ff)%1;
                    end
                    if ff <= 1 then
                        table_merge(t, action(ff))
                    end
                end
            end
            return t
        end
    })
end

function M.named(name, action)
    return setmetatable({
        duration = M.get_duration(action),
    }, {
        __call = function(self, f)
            return { [name] = action(f) }
        end,
    })
end

function M.duration(d, ac)
    return setmetatable({
        duration = d
    }, {
        __call = function(self, f)
            return ac(f)
        end
    })
end

function M.scale_duration(ac, s)
    return setmetatable({
        duration = M.get_duration(ac) * s
    }, {
        __call = function(self, f)
            return ac(f)
        end
    })
end

-- timing functions
function M.linear(f)
    return f
end

function M.reverse(f)
    return 1-f
end

function M.repeat_(s)
    return function(f)
        local _, f = math.modf(f / s)
        return f
    end
end

function M.pow3_in (f)
    return math.pow(f, 3)
end

function M.pow3_out(f)
    return math.pow(f, 1/3)
end

function M.pow3_in_out(f)
    f = f * 2
    if f < 1 then
        return math.pow(f, 3) / 2
    else
        return math.pow(2-f, 3) / 2;
    end
end

function M.smooth_step(f)
    return f * f * (3 - 2 * f)
end

function M.spring( factor )
    local _factor = factor or 0.4
    return function ( f )
        return math.pow(2,-10*f) * math.sin((f- _factor / 4 ) * (2 * math.pi) / _factor)+1
    end
end

function M.anticipate_overshoot( tension )
    tension = tension or 1.5
    local _t = 2.0 * tension
    local function a(t,s)  return t * t * ((s + 1) * t - s) end
    local function o(t,s)  return t * t * ((s + 1) * t + s) end 
    return function ( f )
        if f < 0.5 then
            return 0.5 * a(f * 2.0, tension)
        else
            return 0.5 * (o(f * 2.0 - 2.0, tension) + 2.0)
        end
    end
end

function M.accelerate_decelerate( f )
    return (math.cos((f + 1) * math.pi) / 2.0) + 0.5
end

function M.accelerate( factor )
    local _factor = factor or 1.0
    return function ( f )
        if _factor == 1.0 then
            return f*f
        else
            return math.pow(f,2*_factor)
        end
    end
end

function M.anticipate( tension )
    local _t = tension or 1.5
    return function ( f )
        return f*f*((_t + 1) *f - _t)
    end
end

function M.overshoot( tension )
    local _t = tension or 2.0
    return function ( f )
        f = f - 1.0
        return f * f * ((_t + 1)*f + _t) + 1.0 
    end
end

function M.bounce_timing( f )
    local function bounce(t) return t*t*8 end
    if f < 0.3535 then
        return bounce(f)
    elseif f < 0.7408 then
        return bounce(f - 0.54719) + 0.7
    elseif f < 0.9644 then
        return bounce(f - 0.8526) + 0.9
    else
        return bounce(f - 1.0435) + 0.95
    end
end

function M.cycles( count )
    local _count = count 
    return function ( f )
        return math.sin(2 * _count * math.pi * f)
    end
end

function M.decelerate( factor )
    local _factor = factor or 1.0
    return function ( f )
        if _factor == 1.0 then
            return ( 1.0 - ( 1.0 - f ) * ( 1.0 - f ) )
        else
            return ( 1.0 - math.pow( ( 1.0 - f ) , 2 * _factor ))
        end
    end
end

function M.cubic_hermite( _start,_end ,tangent0,tangent1)
    local function CubicHermite( t,p0,p1,m0,m1)
        local t_2 = t*t
        local t_3 = t_2*t
        return (2*t_3 - 3*t_2 + 1)*p0 + (t_3 - 2 * t_2 + t )*m0 + (-2*t_3+3*t_2)*p1 + (t_3 - t_2)*m1
    end
    return function (f )
        _start = _start or 0
        _end = _end or 1
        tangent0 = tangent0 or 4
        tangent1 = tangent1 or 4
        return CubicHermite(f,_start,_end ,tangent0,tangent1)
    end
end
-- timing function used in kinetic scroll effect.
function M.kinetic(f)
    -- http://ariya.ofilabs.com/2013/11/javascript-kinetic-scrolling-part-2.html
    return (1 - math.exp(-f * 1000 / 325)) * 1.0483288923594
end

function M.kinetic_fast(f)
    return (1 - math.exp(-f * 1000 / 240))
end

function M.bezier(c1, c2)
    if c1.x == c1.y and c2.x == c2.y then
        return linear
    end
    return BezierTiming(c1, c2)
end

-- builtin bezier timing functions.
M.ease = M.bezier(Point(0.25,0.1),Point(0.25,1))
M.ease_in = M.bezier(Point(0.42,0),Point(1,1))
M.ease_out = M.bezier(Point(0,0),Point(0.58,1))
M.ease_in_out = M.bezier(Point(0.42,0),Point(0.58,1))

M.timing_bounce = M.bezier(Point(.1,.26), Point(.3,1.29))

function M.Animator(action, fn, loop)
    local clock = Clock.instance()
    return {
        action = action,
        duration = action and M.get_duration(action) or 0,
        _stop_listeners = {},
        handler = nil,
        fn = fn,
        interval = 0,
        passed = 0,
        loopWay = 1,
        loop_count = 0,
        on_loop = nil,
        on_stop = nil,

        update = function(self, f)
            if self.loopWay == -1 then
                f = 1 - f
            end
            self.fn(self.action(f))
        end,

        pause = function(self)
            if self.handler and not self.handler.stopped then
                self.handler:cancel()
                return true
            end
            self.handler = nil
            return false
        end,

        resume = function(self)
            self.handler = clock:schedule(function(dt)
                if self.passed == -1 then
                    self.passed = 0
                    self:update(0)
                    return;
                end
                self.passed = self.passed + dt
                local f = self.passed / self.duration
                if f >= 1 then
                    f = 1
                end
                self:update(f)
                if f == 1 then
                    self.loop_count = self.loop_count + 1
                    if loop == kAnimRepeat then
                        self.passed = -1
                        if self.on_loop then
                            self:on_loop(self.loop_count)
                        end
                    elseif loop == kAnimLoop then
                        self.passed = -1
                        self.loopWay = self.loopWay * -1
                        if self.on_loop then
                            self:on_loop(self.loop_count)
                        end
                    else
                        self:stop()
                    end
                end
            end, self.interval)
        end,

        start = function(self, action, fn, loop)
            self:stop()

            if action ~= nil then
                self.action = action
                self.duration = M.get_duration(action)
            end
            if fn ~= nil then
                self.fn = fn
            end
            if loop ~= nil then
                if loop == true then
                    loop = kAnimRepeat
                end
                self.loop = loop
            end
            --self.interval = interval or 0
            self.passed = 0
            self:update(0)
            self:resume()
        end,

        stop = function(self)
            if self:pause() then
                if self.action then
                    self:update(1)
                end

                self.passed = 0
                if self.on_stop then
                    self:on_stop()
                end
            end
        end,
    }
end

function M.updator(w)
    local init = {}
    return function(state)
        for k, v in pairs(state) do
            local relative = false
            if string.sub(k, 1, 9)=='relative_' then
                relative = true
                k = string.sub(k, 10)
            end
            if relative then
                if init[k] == nil then
                    init[k] = w[k]
                end
                w[k] = init[k] + v
            else
                w[k] = v
            end
        end
    end
end

function M.updators(t)
    return function(v)
        for k, vv in pairs(v) do
            local fn = t[k]
            if fn then
                fn(vv)
            end
        end
    end
end

-- examples
function M.bounce()
    local b1 = M.bezier(Point(0.215, 0.610), Point(0.355, 1.000))
    local b2 = M.bezier(Point(0.755, 0.050), Point(0.855, 0.060))
    return M.keyframes{
        {0.0,  {relative_y=0   }, b1},
        {0.2,  {relative_y=0   }, b1},
        {0.4,  {relative_y=-30 }, b2},
        {0.43, {relative_y=-30 }, b2},
        {0.53, {relative_y=0   }, b1},
        {0.70, {relative_y=-15 }, b2},
        {0.80, {relative_y=0   }, b1},
        {0.90, {relative_y=-4  }, M.ease},
        {1.0,  {relative_y=0   }, nil},
    }
end

function M.flash()
    return M.keyframes{
        {0.0,  {opacity=1}, M.ease},
        {0.25, {opacity=0}, M.ease},
        {0.50, {opacity=1}, M.ease},
        {0.75, {opacity=0}, M.ease},
        {1.0,  {opacity=1}, nil}
    }
end

function M.shake()
    return M.keyframes{
        {0.0, {relative_x=0  }, M.ease},
        {0.1, {relative_x=-10}, M.ease},
        {0.2, {relative_x=10 }, M.ease},
        {0.3, {relative_x=-10}, M.ease},
        {0.4, {relative_x=10 }, M.ease},
        {0.5, {relative_x=-10}, M.ease},
        {0.6, {relative_x=10 }, M.ease},
        {0.7, {relative_x=-10}, M.ease},
        {0.8, {relative_x=10 }, M.ease},
        {0.9, {relative_x=-10}, M.ease},
        {1.0, {relative_x=0  }, nil},
    }
end

function M.head_shake()
    return M.keyframes{
        {0,     {relative_x=0,  rotation=0},   M.ease_in_out},
        {0.065, {relative_x=-6, rotation=-9},  M.ease_in_out},
        {0.185, {relative_x=5,  rotation=7},   M.ease_in_out},
        {0.315, {relative_x=-3, rotation=-5},  M.ease_in_out},
        {0.435, {relative_x=2,  rotation=3},   M.ease_in_out},
        {0.50,  {relative_x=0,  rotation=0},   M.ease_in_out},
    }
end

function M.jello()
    return M.keyframes{
        {0,     {skew=Point(0,0), scale_at_anchor_point=true}, M.ease},
        {0.111, {skew=Point(0,0)}, M.ease},
        {0.222, {skew=Point(-12.5, -12.5)}, M.ease},
        {0.333, {skew=Point(6.25, 6.25)}, M.ease},
        {0.444, {skew=Point(-3.125, -3.125)}, M.ease},
        {0.555, {skew=Point(1.5625, 1.5625)}, M.ease},
        {0.666, {skew=Point(-0.78125, -0.78125)}, M.ease},
        {0.777, {skew=Point(0.390625, 0.390625)}, M.ease},
        {0.888, {skew=Point(-0.1953125, -0.1953125)}, M.ease},
        {1.0,   {skew=Point(0,0)}, M.ease},
    }
end

function M.pulse()
    return M.keyframes{
        {0.0, {scale=Point(1,1), scale_at_anchor_point=true}, M.ease},
        {0.5, {scale=Point(1.05,1.05)}, M.ease},
        {1.0, {scale=Point(1,1)},       M.ease},
    }
end

function M.rubber_band()
    return M.keyframes{
        {0.0, {scale=Point(1,1), scale_at_anchor_point=true}, M.ease},
        {0.3, {scale=Point(1.25,1.25)}, M.ease},
        {0.4, {scale=Point(0.75,0.75)}, M.ease},
        {0.5, {scale=Point(1.15,0.85)}, M.ease},
        {0.65,{scale=Point(0.95,1.05)}, M.ease},
        {0.75,{scale=Point(1.05,0.95)}, M.ease},
        {1.0, {scale=Point(1,1)},       M.ease},
    }
end

function M.swing()
    return M.keyframes{
        {0.2, {rotation=15, anchor=Point(0.5, 0)}, M.ease},
        {0.4, {rotation=-10}, M.ease},
        {0.6, {rotation=5}, M.ease},
        {0.8, {rotation=-5}, M.ease},
        {1.0, {rotation=0}, M.ease},
    }
end

function M.tada()
    return M.keyframes{
        {0.0, {scale=Point(1,1),     rotation=0, scale_at_anchor_point=true},  M.ease},
        {0.1, {scale=Point(0.9,0.9), rotation=-3}, M.ease},
        {0.2, {scale=Point(0.9,0.9), rotation=-3}, M.ease},
        {0.3, {scale=Point(1.1,1.1), rotation=3},  M.ease},
        {0.4, {rotation=-3}, M.ease},
        {0.5, {rotation=3},  M.ease},
        {0.6, {rotation=-3}, M.ease},
        {0.7, {rotation=3},  M.ease},
        {0.8, {rotation=-3}, M.ease},
        {0.9, {scale=Point(1.1,1.1), rotation=3},  M.ease},
        {1.0, {scale=Point(1,1),     rotation=0},  M.ease},
    }
end

function M.bounce_in_down()
    local t = M.bezier(Point(0.215, 0.610), Point(0.355, 1.000))
    return M.keyframes{
        {0.0, {relative_y=-3000, opacity=0}, t},
        {0.6, {relative_y=25, opacity=1},    t},
        {0.75,{relative_y=-10},              t},
        {0.9, {relative_y=5},                t},
        {1.0, {relative_y=0},                nil},
    }
end

function M.bounce_out_down()
    return M.keyframes{
        {0.0, {relative_y=0},              M.ease},
        {0.2, {relative_y=10},             M.ease},
        {0.4, {relative_y=-20,  opacity=1}, M.ease},
        {0.45,{relative_y=-20,  opacity=1}, M.ease},
        {1.0, {relative_y=2000, opacity=0},nil},
    }
end

local function test1(root)
    -- combined animation
    local unit = TextureUnit(TextureCache.instance():get('sprite.png'))
    local ss = {}
    for i=0,2 do
        local t = {}
        for j=0,2 do
            local s = Sprite(unit)
            --s.size = Point(150,150)
            s.pos = Point(150 * i + 50, 180 * j + 50)
            root:add(s)
            table.insert(t, s)
        end
        table.insert(ss, t)
    end

    local ac1 = M.spawn(M.sequence(
        M.named('bounce', M.bounce()),
        M.named('flash',  M.flash()),
        M.named('shake',  M.shake())
    ), M.sequence(
        M.named('head_shake',  M.head_shake()),
        M.named('jello',  M.jello()),
        M.named('pulse',  M.pulse())
    ), M.sequence(
        M.named('rubber_band', M.rubber_band()),
        M.named('swing', M.swing()),
        M.named('tada', M.tada())
    ))

    --ac1 = M.sequence{ac1, M.timing(M.reverse, ac1)}
    return M.Animator(ac1, M.updators{
        bounce      = M.updator(ss[1][1]),
        flash       = M.updator(ss[1][2]),
        shake       = M.updator(ss[1][3]),
        head_shake  = M.updator(ss[2][1]),
        jello       = M.updator(ss[2][2]),
        pulse       = M.updator(ss[2][3]),
        rubber_band = M.updator(ss[3][1]),
        swing       = M.updator(ss[3][2]),
        tada        = M.updator(ss[3][3]),
    }, kAnimRepeat)
end

local function test_simple(root)
    -- simple animation
    local s = Sprite(TextureUnit.default_unit())
    s.size = Point(100,100)
    s.pos = Point(10,10)
    root:add(s)

    local simple = M.flash()
    return M.Animator(simple, M.updator(s), kAnimRepeat)
end

local function test2(root)
    local ac2 = M.spawn(M.named('1', M.sequence(
        M.bounce(),
        M.flash(),
        M.shake()
    )), M.named('2', M.sequence(
        M.head_shake(),
        M.jello(),
        M.pulse()
    )), M.named('3', M.sequence(
        M.rubber_band(),
        M.swing(),
        M.tada()
    )))

    local lbl = Label()
    lbl:set_rich_text('<b><i><font size=120 color=#000000 weight=3 glow=#ff0000>Hello 富文本! </font></i></b>')
    local fbo = lbl:render_to_fbo()
    local unit = TextureUnit(fbo.texture)
    local nodes = {}
    for i=0,2 do
        local nd = Sprite(unit)
        nd.pos = Point(550, i * 200 + 50)
        root:add(nd)
        table.insert(nodes, nd)
    end
    return M.Animator(ac2, M.updators{
        ['1'] = M.updator(nodes[1]),
        ['2'] = M.updator(nodes[2]),
        ['3'] = M.updator(nodes[3]),
    }, kAnimRepeat)
end

-- test bezier path animation
local function test_bezier_path(root)
    if BSpline == nil then
        return
    end
    local w = LuaWidget()
    w.size = root.size
    local nvg = Nanovg(bit.bor(Nanovg.NVG_ANTIALIAS, Nanovg.NVG_DEBUG, Nanovg.NVG_STENCIL_STROKES))
    local draw = function ( w,nvg )

        nvg:reset()
        nvg:scale(Point(NewScale,NewScale))
        -- nvg:translate(circle_pos)
        nvg:begin_path()
        nvg:move_to(Point(0, 500))
        nvg:bezier_to(Point(100, 600), Point(0, 0),Point(400, 0))
        nvg:stroke_color(Colorf.white)
        nvg:stroke()

        nvg:begin_path()
        nvg:move_to(Point(400, 0))
        nvg:bezier_to(Point(600, 0), Point(800, 500),Point(500, 500))
        nvg:stroke_color(Colorf.red)
        nvg:stroke()

        nvg:begin_path()
        nvg:move_to(Point(500, 500))
        nvg:bezier_to(Point(200, 500), Point(700, 0),Point(800, 200))
        nvg:stroke_color(Colorf.blue)
        nvg:stroke()
    end
    local inst = LuaInstruction(function(self, canvas)
        nvg:begin_frame(canvas)
        draw(w, nvg)
        nvg:end_frame()
    end, true)

    w.lua_do_draw = function(self, canvas)
        canvas:add(inst)
    end
    root:add(w)
    local points = {
        Point(0, 500),
        Point(100, 600),
        Point(0, 0),
        Point(400, 0),

        Point(400, 0),
        Point(600, 0),
        Point(800, 500),
        Point(500, 500),

        Point(500, 500),
        Point(200, 500),
        Point(700, 0),
        Point(800, 200),
    }

    local s = Sprite(TextureUnit.default_unit())
    root:add(s)
    M.Animator(M.bezier_path(points), function(p)
        s.pos = p
    end, kAnimLoop):start()
end

local function test_callback(root)
    local s = Sprite(TextureUnit.default_unit())
    s.size = Point(100,100)
    root:add(s)
    --local tfn = M.bezier(Point(0.1, 0.1),Point(0.2, 1.0))
    return M.Animator(M.timing(M.kinetic, M.move(0, 300)), function(v)
        s.x = v
    end, kAnimLoop)
end

function M.test(root)
    test1(root):start()
    test_simple(root):start()
    test2(root):start()
    test_bezier_path(root)
    test_callback(root):start()
end
return M

end
        