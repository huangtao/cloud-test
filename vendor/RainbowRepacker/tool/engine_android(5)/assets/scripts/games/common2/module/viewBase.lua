
ViewBase = class(CommonGameLayer, false);

ViewBase.s_stateFuncMap = {
    -- custom ur config like this
    -- [GameMechineConfig.STATUS_xx]          = ViewBase.xxx;  
};

ViewBase.s_actionFuncMap = {
    -- custom ur config like this
    -- [GameMechineConfig.ACTION_xx]          = ViewBase.xxx;  
};

function ViewBase:ctor(config)
	super(self, config);
	self.m_curState = GameMechineConfig.STATUS_NONE;
    self.m_lastState = GameMechineConfig.STATUS_NONE;
    self.m_mainState = GameMechineConfig.STATUS_NONE;
    self:init();
    self.m_myStateFuncListenMap = {};
    self.m_myActionFuncListenMap = {};
    self:getMyListenMechineMap();
end

-- 查找当前view需要监听的所有状态和动作
function ViewBase:getMyListenMechineMap()
    if not table.isEmpty(self.m_myStateFuncListenMap) then
        return;
    end
    self.m_myStateFuncListenMap = {};
    self.m_myActionFuncListenMap = {};
    local curObj = self;
    while curObj do
        if curObj.s_stateFuncMap then
            self.m_myStateFuncListenMap = CombineTables(curObj.s_stateFuncMap or {}, self.m_myStateFuncListenMap);
        end
        if curObj.s_actionFuncMap then
            self.m_myActionFuncListenMap = CombineTables(curObj.s_actionFuncMap or {}, self.m_myActionFuncListenMap);
        end
        curObj = curObj.super;
    end
end

function ViewBase:dtor()
    self:_stopDelayTimer();
    self.m_myStateFuncListenMap = {};
    self.m_myActionFuncListenMap = {};
    self.m_delegate = nil;
end

function ViewBase:init()
    return -1;
end

function ViewBase:updateMainState(state)
    self.m_mainState = state;
end

-- laststate,seat,action,uid,info,isFast
function ViewBase:monitoringState(state,laststate,action,seat,uid,info,isFast)
    self.m_curState = state;
    self.m_lastState = laststate; 
    if  (not self.m_myStateFuncListenMap[state]) and (not self.m_myActionFuncListenMap[action])  then
        return true;
    end
    self:notifyStateMap(state,laststate,action,seat,uid,info,isFast);
    return self:notifyActionMap(action,seat,uid,info,isFast);
end

function ViewBase:monitoringAction(action,seat,uid,info,isFast)
    return self:notifyActionMap(action,seat,uid,info,isFast);
end


function ViewBase:notifyStateMap(state,laststate,action,seat,uid,info,isFast)
    local func = self.m_myStateFuncListenMap[state];
    if type(func) == "function" then
        if not self:sthrowErro() then
            func(self,seat,uid,info,isFast);
            return true;
        end
    elseif type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
            funcSelf(self,seat,uid,info,isFast);
            return true;
        end
    end
    return false;
end

function ViewBase:notifyActionMap(action,seat,uid,info,isFast)
    local func = self.m_myActionFuncListenMap[action];
    if type(func) == "function" then
        if not self:sthrowErro() then
            func(self,seat,uid,info,isFast);
            return true;
        end
    elseif type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
            funcSelf(self,seat,uid,info,isFast);
            return true;
        end
    end
    return false;
end

function ViewBase:execDelegate(func,...)
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

--virtual
function ViewBase:parseConfig(config)
    
end

function ViewBase:showToast(msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

function ViewBase:_startDelayTimer(delay,callObj,callFunc,...)
    delay = number.valueOf(delay);
    self:_stopDelayTimer();
    if delay > 0 then 
        local arg = {};
        arg.self = self;
        arg.callObj = callObj;
        arg.callFunc = callFunc;
        arg.param = {...};
        self.m_delayTimer = AnimFactory.createAnimInt(kAnimNormal,0,1,delay,-1);
        self.m_delayTimer:setDebugName("AnimInt|MatchLayerBase|m_delayTimer");
        self.m_delayTimer:setEvent(arg,self._onDelayTimerOut);
    else 
        if callFunc then
            callFunc(callObj,...);
        end 
    end 
end

ViewBase._onDelayTimerOut = function(arg)
    local self = arg.self;
    self:_stopDelayTimer();
    if arg.callFunc then 
        arg.callFunc(arg.callObj,unpack(arg.param));
    end 
end

function ViewBase:_stopDelayTimer()
    if self.m_delayTimer then
        delete(self.m_delayTimer);
        self.m_delayTimer = nil;
    end
end


function ViewBase:sthrowErro()
    if _DEBUG then
        debug.traceback();
        error("状态机监听配置表不是string类型");
        return true;
    end
end

return ViewBase;