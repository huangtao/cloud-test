require("core/object");

SocketHandlersStack = class();

SocketHandlersStack.getInstance = function()
    if not SocketHandlersStack.s_instance then 
        SocketHandlersStack.s_instance = new(SocketHandlersStack);
    end
    return SocketHandlersStack.s_instance;
end

SocketHandlersStack.ctor = function(self)
    self.m_handlerMap = {};
    self.m_add = {};
    self.m_remove = {};

    self:_resetSequence();
end

SocketHandlersStack.dtor = function(self)
    self.m_handlerMap = nil;
end

SocketHandlersStack.add = function(self,obj,func)
    if not (obj and func) then
        return;
    end 

    local temp = {};
    temp.obj = obj;
    temp.func = func;

    if self.m_isDispathing then
        temp.time = self:_getSequence();
        table.insert(self.m_add,temp);
    else 
        if not self:_checkExist(obj) then
            table.insert(self.m_handlerMap,temp);
        end
    end 
end

SocketHandlersStack.remove = function(self,obj)
    if not obj then
        return;
    end

    if self.m_isDispathing then
        local temp = {};
        temp.obj = obj;
        temp.time = self:_getSequence();
        table.insert(self.m_remove,temp);
    else 
        local index = self:_getIndex(obj);
        if index ~= -1 then 
            table.remove(self.m_handlerMap,index);
        end
    end 
end

SocketHandlersStack.handlePacket = function(self,cmd,...)
    if not cmd then 
        return;
    end 

    self.m_isDispathing = true;

    local isHandle = false;
    for k,v in pairs(self.m_handlerMap) do
        if type(v) == "table" and v.obj and type(v.func) == "function" and not self:_hasRemoved(v.obj) then 
            local flag = v.func(v.obj,cmd,...);
            if flag then 
                isHandle = true;
            end 
        end 
    end

    self.m_isDispathing = false;

    self:_cleanup();

    return isHandle;
end

SocketHandlersStack._hasRemoved = function(self, obj)
    for k, v in pairs(self.m_remove) do
        if v.obj == obj then
            return true;
        end
    end

    return false;
end

SocketHandlersStack._getSequence = function(self)
    self.m_sequence = self.m_sequence + 1;
    return self.m_sequence;
end

SocketHandlersStack._resetSequence = function(self)
    self.m_sequence = 0; --序列号,用于区分操作的先后顺序
end

SocketHandlersStack._cleanup = function(self)
    self:_resetSequence();
    self:_kickUselessValue();

    if #self.m_remove > 0 then 
        for k,v in ipairs(self.m_remove) do 
            local index = self:_getIndex(v.obj);
            if index ~= -1 then 
                table.remove(self.m_handlerMap,index);
            end 
        end 
    end 
    self.m_remove = {};

    if #self.m_add > 0 then 
        for k,v in ipairs(self.m_add) do 
            if not self:_checkExist(v.obj) then
                table.insert(self.m_handlerMap,v);
            end 
        end 
    end 
    self.m_add = {};
end

SocketHandlersStack._kickUselessValue = function(self)
    local tempInRemove = {};
    local tempInAdd = {};

    --判断哪些值是无用的
    if #self.m_remove > 0 and #self.m_add > 0 then
        for k, remove in ipairs(self.m_remove) do
            for kk, add in ipairs(self.m_add) do
                if remove.obj == add.obj then
                    if remove.time > add.time then
                        --表明先add再remove，代表add是无效的
                        table.insert(tempInAdd, add);
                    else
                        --表明先remove再add，代表remove是无效的
                        table.insert(tempInRemove, remove);
                    end
                end
            end
        end
    end

    --去掉无用的值
    for k, v in ipairs(tempInRemove) do
        for index=#self.m_remove, 1, -1 do
            if self.m_remove[index] == v then
                table.remove(self.m_remove, index);
            end
        end
    end

    --去掉无用的值
    for k, v in ipairs(tempInAdd) do
        for index=#self.m_add, 1, -1 do
            if self.m_add[index] == v then
                table.remove(self.m_add, index);
            end
        end
    end    
end

SocketHandlersStack._getIndex = function(self,obj)
    for k,v in pairs(self.m_handlerMap) do 
        if v.obj == obj then
            return k;
        end
    end

    return -1;
end

SocketHandlersStack._checkExist = function(self,obj)
    return self:_getIndex(obj) ~= -1;
end