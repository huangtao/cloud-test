require("core/eventDispatcher");

EventDispatcher.dispatch = function(self, event, ...)
    if not self.m_listener[event] then return end;

    self.m_dispatching = true;

    local ret = false;
    local dispatchSuccess = false;
    local listeners = self.m_listener[event] or {};
    --for _,v in pairs(listeners) do 
    for i=1,table.maxn(listeners) do 
        local listener = listeners[i]
        if listener then
            if listener["func"] and  listener["mark"] ~= EventState.RemoveMarked then 
                ret = ret or listener["func"](listener["obj"],...);
                dispatchSuccess = true;
            end
        end
    end

    self.m_dispatching = false;

    EventDispatcher.cleanup(self);

    return ret, dispatchSuccess;
end

EventDispatcher.unregister = function(self, event, obj, func)
    if not self.m_listener[event] then return end; 

    if event == 8 then
        print_string("unregister = " .. tostring(obj));
    end

    local arr = self.m_listener[event] or {};
    --for k,v in pairs(arr) do 
    for i=1,table.maxn(arr) do 
        local listerner = arr[i];
        if listerner then
            if (listerner["func"] == func) and (listerner["obj"] == obj) then 
                arr[i].mark = EventState.RemoveMarked;
                if event == 8 then
                    print_string("unregister success " .. tostring(obj));
                end
                if not self.m_dispatching then
                    arr[i] = nil;
                end

                --don't break so fast now,take care of the dump event listener
                --return;
            end
        end
    end

    --*fix the unregister failed caused by execute register and unregister when dispatching
    arr = self.m_tmpListener[event] or {};

    for i=1,table.maxn(arr) do 
        local listerner = arr[i];
        if listerner then
            if (listerner["func"] == func) and (listerner["obj"] == obj) then 
                arr[i] = nil;
            end
        end
    end
end

EventDispatcher.breadthDispatch = function(self, event, ...)
    self.m_breadthDispatch = table.verify(self.m_breadthDispatch);
    if table.isEmpty(self.m_listener[event]) then
        if self.m_tmpListener[event] then
            local data = {};
            data.event = event;
            data.info = {...};
            table.insert(self.m_breadthDispatch, data);
        end
        return;
    end;

   
    local data = {};
    data.event = event;
    data.info = {...};
    table.insert(self.m_breadthDispatch, data);

    if self.m_breadthDispatching then
        return true;
    else
        return self:dispatchNext();
    end
end

EventDispatcher.sendDispatchMsg = function(self, event, ...)
    self.m_breadthDispatching = true;
    local ret = true;
    local listeners = self.m_listener[event] or {};
    local num = table.maxn(listeners);
    if num > 0 then
        local donum = 0;
        for i=1, num do 
            local listener = listeners[i]
            if listener then
                if listener["func"] and  listener["mark"] ~= EventState.RemoveMarked then
                    donum = donum + 1;
                    local result = listener["func"](listener["obj"],...);
                    if not result then
                        ret = result;
                    end
                end
            end
        end
        if donum == 0 then
            ret = false;
        end
    else
        ret = false;
    end
    EventDispatcher.cleanup(self,true);
    return ret;
end

EventDispatcher.dispatchNext = function(self)
    self.m_breadthDispatching = false;
    self.m_breadthDispatch = table.verify(self.m_breadthDispatch);
    if #self.m_breadthDispatch > 0 then
        local dispatchInfo = table.remove(self.m_breadthDispatch, 1);
        local event = dispatchInfo.event;
        local info = dispatchInfo.info;
        self:sendDispatchMsg(event,unpack(info));
    end
end

EventDispatcher.cleanup = function(self,isBreadth)
    for event,listeners in pairs(self.m_tmpListener) do 
        self.m_listener[event] = self.m_listener[event] or {};
        local arr = self.m_listener[event];
        --for k,v in pairs(listeners) do 
        for i=1,table.maxn(listeners) do 
            local listener = listeners[i];
            if listener then
                arr[#arr+1] = listener;
            end
        end
    end

    self.m_tmpListener = {};

    for _,listeners in pairs(self.m_listener) do
        --for k,v in pairs(listeners) do 
        for i=1,table.maxn(listeners) do 
            local listener = listeners[i];
            if listener and (listener.mark == EventState.RemoveMarked or listener.func == nil) then 
                listeners[i] = nil;
            end
        end
    end
    if isBreadth or (not self.m_breadthDispatching) then
        self:dispatchNext();
    end
end