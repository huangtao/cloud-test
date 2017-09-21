require("games/common2/module/layerShowTypeData");

local LayerBase = class(CommonGameLayer, false);

LayerBase.s_stateFuncMap = {
    -- custom ur config like this
    -- [GameMechineConfig.STATUS_xx]          ="xxxxxx";  
};

LayerBase.s_actionFuncMap = {
	 -- [GameMechineConfig.ACTION_xx]          ="xxxxxx";  
};

function LayerBase:ctor()
	super(self, nil);	
	self.m_views = {};
	self.m_viewConfig = {};
	self:setFillParent(true,true);
	self:initBroadcast();
	self:initBaseViewConfig();
	self.m_mainState = GameMechineConfig.STATUS_NONE;
	self:initMetatable();
	self.m_viewStateListenMap = {};
	self.m_viewActionListenMap = {};
	self.m_layerStateListenMap = {};
	self.m_layerActionListenMap = {};
	self:getLayerListenMap();
end

-- layer的监听列表设置元表，当前layer找不到，会去遍历父类
function LayerBase:initMetatable()
	-- local curObj = self;
	-- while curObj and curObj.s_stateFuncMap do
 --        if curObj.super then
	-- 	    setmetatable(curObj.s_stateFuncMap, { __index = curObj.super.s_stateFuncMap;});
	-- 	    setmetatable(curObj.s_actionFuncMap, { __index = curObj.super.s_actionFuncMap;});
	-- 	end
 --        curObj = curObj.super;
 --    end
end

--[[
	config{view的路径、坐标信息、布局信息、配置信息}
]]
function LayerBase:addView(seat,layoutConfig,state,action)
	if self.m_views[seat] then
		return true;
	end
	if layoutConfig and layoutConfig.path then
		local className = Import(layoutConfig.path);
		if state or action then
			self:getViewListenMap(className);
			if (not self.m_viewStateListenMap[state or ""]) and (not self.m_viewActionListenMap[action or ""]) then
				return false;
			end
		end
		local viewLayout = nil;
		local view = nil;
		if layoutConfig.viewLayer then
			viewLayout = Import(layoutConfig.viewLayer);
		end
		if layoutConfig.viewConfig then
			view = new(className,seat,_G[layoutConfig.viewConfig]);
		else
			view = new(className,seat,viewLayout);
		end			
		view:setDelegate(self);
		self:addChild(view);
		self.m_views[seat] = view;
		if layoutConfig.pos and layoutConfig.pos.x and layoutConfig.pos.y then
			view:setPos(layoutConfig.pos.x,layoutConfig.pos.y);
		end	
		if layoutConfig.align then 
			view:setAlign(layoutConfig.align);
		end
		if layoutConfig.config then
			view:parseConfig(layoutConfig.config);
		end
	end
end

-- 查找当前view需要监听的所有状态和动作
function LayerBase:getLayerListenMap()
	if not table.isEmpty(self.m_layerStateListenMap) then
		return;
	end
	self.m_layerStateListenMap = {};
	self.m_layerActionListenMap = {};
	local curObj = self;
    while curObj do
    	if curObj.s_stateFuncMap then
			self.m_layerStateListenMap = CombineTables(curObj.s_stateFuncMap or {}, self.m_layerStateListenMap);
		end
		if curObj.s_actionFuncMap then
			self.m_layerActionListenMap = CombineTables(curObj.s_actionFuncMap or {}, self.m_layerActionListenMap);
		end
        curObj = curObj.super;
    end
end

-- 查找当前view需要监听的所有状态和动作
function LayerBase:getViewListenMap(className)
	if not table.isEmpty(self.m_viewStateListenMap) then
		return;
	end
	self.m_viewStateListenMap = {};
	self.m_viewActionListenMap = {};
    local curObj = className;
    while curObj do
    	if curObj.s_stateFuncMap then
			self.m_viewStateListenMap = CombineTables(curObj.s_stateFuncMap or {}, self.m_viewStateListenMap);
		end
		if curObj.s_actionFuncMap then
			self.m_viewActionListenMap = CombineTables(curObj.s_actionFuncMap or {}, self.m_viewActionListenMap);
		end
        curObj = curObj.super;
    end
end

-- 广播通知界面状态更新
function LayerBase:notifyStateMap(state,laststate,action,seat,uid,info,isFast)
	if not self.m_views[seat] then
    	local result = self:addView(seat,self.m_viewConfig[seat],state,action);
    end
	if not self.m_layerStateListenMap[state] then
		return;
	end
	local func = self.m_layerStateListenMap[state];
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

-- 广播通知界面接收动作
function LayerBase:notifyActionMap(action,seat,uid,info,isFast)
	if not self.m_views[seat] then
    	local result = self:addView(seat,self.m_viewConfig[seat],nil,action);
    end
	if not self.m_layerActionListenMap[action] then
		return;
	end
	local func = self.m_layerActionListenMap[action];
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

function LayerBase:dtor()
	self:_stopDelayTimer();
	self.m_viewStateListenMap = {};
	self.m_viewActionListenMap = {};
	self.m_layerStateListenMap = {};
	self.m_layerActionListenMap = {};
	self:removeBroadcast();
	self:removeAllView();
end

-- 注册需要监听的状态
function LayerBase:initBroadcast()
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_STATE,self,self.monitoringState);
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_ACTION,self,self.monitoringAction);
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_MAINSTATE,self,self.updateMainState);
end

function LayerBase:removeBroadcast()
	self:removeStateBroadcast();
	self:removeActionBroadcast();
	self:removeMainStateBroadcast();
end

function LayerBase:removeStateBroadcast()
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_STATE,self,self.monitoringState);
end

function LayerBase:removeActionBroadcast()
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_ACTION,self,self.monitoringAction);
end

function LayerBase:removeMainStateBroadcast()
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_MAINSTATE,self,self.updateMainState);
end

function LayerBase:initBaseViewConfig()
	local curShowType = LayerShowTypeData.getInstance():getCurShowType();
	local config = table.verify(self:parseViewConfig());
	local viewConfig = config[curShowType];
	if viewConfig then 
		self.m_viewConfig = table.verify(viewConfig);
	else 
		self:initViewConfig();
	end 
end

--virtual
function LayerBase:parseViewConfig()
	return {};
end 

--virtual
function LayerBase:initViewConfig()
end

-- 游戏主状态
function LayerBase:updateMainState(state,laststate)
	self.m_mainState = state;
	self.m_mainstateUpdate = true;
end

-- 接收广播状态消息
function LayerBase:monitoringState(state,laststate,action,seat,uid,info,isFast)
	if not state then
        return;
    end
 	self:notifyStateMap(state,laststate,action,seat,uid,info,isFast);
    if self.m_views[seat] then
		-- 校验是否为当前位置的用户
		if self.m_mainstateUpdate then
			self.m_mainstateUpdate = false;
			self.m_views[seat]:updateMainState(self.m_mainState);
		end
		self.m_views[seat]:monitoringState(state,laststate,action,seat,uid,info,isFast);
	end
	
end

function LayerBase:checkState(state)
	return true;
end

function LayerBase:monitoringAction(action,seat,uid,info,isFast)
	if not action then
		return;
	end
	self:notifyActionMap(action,seat,uid,info,isFast);
	if self.m_views[seat] then
		-- 校验是否为当前位置的用户
		self.m_views[seat]:monitoringAction(action,seat,uid,info,isFast);
	end
end

function LayerBase:removeAllView()
	for k,v in pairs(table.verify(self.m_views)) do
		self:removeChild(v);
		delete(v);
		v = nil;
	end
	self.m_views = {};
end

function LayerBase:removeView(seat)
	if self.m_views[seat] then
		self:removeChild(self.m_views[seat]);
		delete(self.m_views[seat]);
		self.m_views[seat] = nil;
	end
end

function LayerBase:execDelegate(func,...)
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

function LayerBase:showToast(msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end


function LayerBase:_startDelayTimer(delay,callObj,callFunc,...)
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

LayerBase._onDelayTimerOut = function(arg)
	local self = arg.self;
	self:_stopDelayTimer();
	if arg.callFunc then 
		arg.callFunc(arg.callObj,unpack(arg.param));
	end 
end

function LayerBase:_stopDelayTimer()
	delete(self.m_delayTimer);
	self.m_delayTimer = nil;
end

function LayerBase:sthrowErro()
    if _DEBUG then
        debug.traceback();
        error("状态机监听配置表不是string类型");
        return true;
    end
end

return LayerBase;