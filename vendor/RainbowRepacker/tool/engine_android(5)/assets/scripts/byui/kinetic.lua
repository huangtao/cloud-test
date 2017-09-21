require('byui/class')
local Am = require('animation')
local M = {}
local class, mixin, super = unpack(require('byui/class'))
local NORMAL_DECAY = 0.95
local FAST_DECAY = 0.70
local Decay = class('Decay', nil, {
    __init__ = function(self, on_value)
        self.on_value = on_value
        self._handler = nil
        self.decay = NORMAL_DECAY
        self.min_distance = 0.1
        self.extra_force = 0
        self.velocity = 0
    end,
    running = {function(self)
        return self._handler ~= nil and not self._handler.stopped
    end},
    start = function(self, value, velocity, decay, on_value, on_stop)
        if self._handler ~= nil then
            self._handler:cancel()
        end
        self.velocity = velocity
        self.extra_force = 0
        self.decay = decay
        on_value = on_value or self.on_value
        self._handler = Clock.instance():schedule(function(dt)
            dt = math.min(dt, 2/60)
            self.velocity = self.velocity * self.decay + self.extra_force
            local diff = self.velocity * dt
            value = value + diff
            if on_value(value) then
                if on_stop then
                    on_stop()
                end
                self:stop()
            end
        end)
    end,
    stop = function(self)
        if self._handler ~= nil then
            self._handler:cancel()
            self._handler = nil
        end
    end,
})

M.KineticEffect = class('KineticEffect', nil, {
    __init__ = function(self, args)
        self.velocity = 0
        self._value = 0

        self.min_distance = 0.1

        -- history
        self.last_value = nil

        self.on_value_changed = args.on_value_changed 
        self.on_stop = args.on_stop
        self.drag_threshold = 20 -- unit

        self.decay = Decay(function(v)
            if math.abs(v - self.value) < self.min_distance then
                return true
            end
            self.value = v
        end)
        
        self.anim = Am.Animator()
        self.anim.on_stop = function()
            self:_on_stop()
        end

        self.min = args.min or 0
        self.max = args.max or 0
    end,
    min = {function(self)
        return self._min or 0
    end, function(self, v)
        if self._min ~= v then
            if self.max and v > self.max then
                v = self.max
            end
            self._min = v
            self:_range_updated()
        end
    end},
    max = {function(self)
        return self._max or 0
    end, function(self, v)
        if self._max ~= v then
            if self.min and v < self.min then
                v = self.min
            end
            self._max = v
            self:_range_updated()
        end
    end},
    _range_updated = function(self)
        if self._min and self._max and self.decay then
            local overscroll = self:get_overscroll(self.value)
            if overscroll ~= 0 then
                self.value = overscroll > 0 and self.max or self.min
                self:cancel()
            end
            --if overscroll ~= 0 and not self.decay.running then
            --    local target = overscroll > 0 and self.max or self.min
            --    local velocity = (target - self.value) / 0.8
            --    self.decay:start(self.value, velocity, FAST_DECAY, function(v)
            --        self.value = v
            --        local overscroll = self:get_overscroll(self.value)
            --        if overscroll == 0 then
            --            return true
            --        end
            --        self.decay.extra_force = -overscroll * 2
            --    end, function()
            --        self.value = target
            --        self:_on_stop()
            --    end)
            --end
        end
    end,
    value = {function(self)
        return self._value
    end, function(self, v)
        if self.is_mannal then
            local overscroll = math.abs(self:get_overscroll(v))
            local diff = v - self._value
            if overscroll > 0 then
                diff = diff / (1.0 + overscroll * self.viscosity)
            end
            v = self._value + diff
        end
        self._value = v
        if self.on_value_changed then
            self:on_value_changed(self._value)
        end
    end},
    get_overscroll = function(self, v)
        if v < self.min then
            return v - self.min
        elseif v > self.max then
            return v - self.max
        else
            return 0
        end
    end,
    start = function(self, val, t)
        if t == nil then
            t = Clock.now() / 1000
        else
            t = t / 1000
        end
        self.velocity = 0
        self.last_value = {val, t}
        self.is_mannal = true

        self.decay:stop(self.history)
        self.anim:stop()
    end,
    update = function(self, val, t)
        if not self.is_mannal then
            -- canceled
            return
        end
        t = t / 1000
        local offset = val - self.last_value[1]
        self:apply(offset)

        local duration = math.max(t - self.last_value[2], 0.03)
        local v = 1000 * offset / (1 + duration * 1000)
        if t - self.last_value[2] < 10/60 then
            -- moving average
            self.velocity = 0.8 * v + 0.2 * self.velocity
        else
            self.velocity = v
        end

        self.velocity = self.velocity * self.velocity_factor

        self.last_value = {val, t}
        --self.is_mannal = true
    end,
    stop = function(self, val, t)
        if not self.is_mannal then
            -- canceled
            return
        end
        t = t / 1000
        if val - self.last_value[1] < 0.0001 and t - self.last_value[2] < 5/60 then
            -- ignore this value
        else
            --self:update(val, t * 1000)
        end
        self.is_mannal = false

        -- check overscroll
        local overscroll = self:get_overscroll(self.value)
        if overscroll == 0 and self.velocity == 0 then
            self:_on_stop()
            return
        end

        local status = 'normal'
        local target
        local direction
        if overscroll ~= 0 then
            target = overscroll > 0 and self.max or self.min
            direction = overscroll > 0 and 1 or -1
        else
            target = self.velocity > 0 and self.max or self.min
            direction = self.velocity > 0 and 1 or -1
        end
        self.decay:start(self.value, self.velocity, NORMAL_DECAY, function(v)
            local diff = math.abs(v - self.value)
            self.value = v
            local overscroll = self:get_overscroll(self.value)
            if status == 'normal' then
                if overscroll ~= 0 then
                    status = 'edge'
                    self.decay.decay = FAST_DECAY
                elseif diff < self.min_distance then
                    return true
                end
            end
            if status == 'edge' then
                if math.abs(overscroll) <= self.min_distance then
                    self.value = target
                    return true
                else
                    self.decay.extra_force = -overscroll * 2
                end
            end
        end, function()
            self:_on_stop()
        end)
    end,
    scroll_to = function(self, target,duration)
        self:cancel()

        if target < self.min then
            target = self.min
        elseif target > self.max then
            target = self.max
        end

        -- use animation to scroll_to target
        self.anim:start(Am.duration(duration or 0.25,Am.timing(Am.kinetic, Am.value(self.value, target))), function(v)
            self.value = v
        end)
    end,
    cancel = function(self)
        self.decay:stop()
        self.is_mannal = false
        self.last_value = nil
        self.anim:stop()
        -- self:_on_stop() 
    end,
    apply = function(self, distance)
        if math.abs(distance) < self.min_distance then
            self.velocity = 0
        end
        self.value = self.value + distance
    end,
    update_velocity = function(self, dt)
        if math.abs(self.velocity) <= self.min_velocity then
            self.velocity = 0
            return
        end

        self.velocity = self.velocity - self.velocity * self.friction
        self:apply(self.velocity * dt)
    end,
    _on_stop = function(self)
        if self.on_stop then
            self:on_stop()
        end
    end,
    velocity_factor = {function ( self )
        return self._velocity_factor or 1 
    end,function ( self,value )
        self._velocity_factor = value
    end},
    viscosity = {function ( self )
        return self._viscosity or 1/50 
    end,function ( self,value )
        self._viscosity = value 
    end},
})

return M.KineticEffect
