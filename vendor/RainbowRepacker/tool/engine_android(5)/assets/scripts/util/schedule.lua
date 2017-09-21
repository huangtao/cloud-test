
Schedule = class();

Schedule.TIME_STEP = 1000;

Schedule.getInstance = function()
    if not Schedule.s_instance then
        Schedule.s_instance = new(Schedule);
    end

    return Schedule.s_instance;
end

Schedule.releaseInstance = function()
    delete(Schedule.s_instance);
    Schedule.s_instance = nil;
end

Schedule.ctor = function(self)
    self.m_stack = {};
end

Schedule.dtor = function(self)
    self:__stopTimer();
end

Schedule.registerListener = function(self, obj, func, duration, animType, extParams, tag)
    local item = {
        obj = obj;
        func = func;
        duration = duration;
        animType = animType;
        passTime = 0;
        extParams = extParams;
        tag = tag;
    };

    if self:__getItem(obj, func, tag) == -1 then
        table.insert(self.m_stack, item);
    end

    self:__startTimer();
end

Schedule.unregisterListener = function(self, obj, func, tag)
    for k, v in pairs(self.m_stack) do
        if obj == v.obj and func == v.func and tag == v.tag then
            self.m_stack[k] = nil;
        end
    end
end

Schedule.__startTimer = function(self)
    if not self.m_timer then
        self.m_lastTime = os.time()*1000;
        self.m_timer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, Schedule.TIME_STEP, 0);
        self.m_timer:setDebugName("Schedule|self.m_timer");
        self.m_timer:setEvent(self, self.__onTimer);
    end
end

Schedule.__stopTimer = function(self)
    delete(self.m_timer);
    self.m_timer = nil;
end

Schedule.__getItem = function(self, obj, func, tag)
    for k, v in pairs(self.m_stack) do
        if obj == v.obj and func == v.func and tag == v.tag then
            return k, v;
        end
    end

    return -1;
end

Schedule.__onTimer = function(self)
    local callbacks = {};

    for k, v in pairs(self.m_stack) do
        v.passTime = v.passTime + Schedule.TIME_STEP;
        if v.passTime >= v.duration then
            table.insert(callbacks, k);
        end
    end

    for _, index in ipairs(callbacks) do
        local itemInfo = self.m_stack[index];
        if itemInfo then
            itemInfo.func(itemInfo.obj, itemInfo.extParams);

            if itemInfo.animType == kAnimRepeat then
                itemInfo.passTime = 0;
            else
                self.m_stack[index] = nil;
            end
        end
    end

    if table.isEmpty(self.m_stack) then
        self:__stopTimer();
    end
end