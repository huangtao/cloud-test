--[[
	公共状态机，处理游戏开始后的状态逻辑
]]

local PlayIngMechineBase = class();

function PlayIngMechineBase:ctor()
	self.m_lastState 	= GameMechineConfig.STATUS_PLAYING; -- 记录上一次的状态
	self.m_curState 	= GameMechineConfig.STATUS_PLAYING; -- 当前状态
	self:getActionListenMap();
end

function PlayIngMechineBase:getActionListenMap()
	local curObj = self;
    while curObj do
		if curObj.actionConfig then
			self.actionConfig = CombineTables(curObj.actionConfig or {}, self.actionConfig);
		end
		if curObj.stateChangeConfig then
			self.stateChangeConfig = CombineTables(curObj.stateChangeConfig or {}, self.stateChangeConfig);
		end
        curObj = curObj.super;
    end
end

function PlayIngMechineBase:dtor()
	self.actionConfig = {};
	self.stateChangeConfig = {};
end

function PlayIngMechineBase:checkAction(action)
	if self.actionConfig[action] then
		return true;
	end
	return false;
end

function PlayIngMechineBase:getStates()
	return self.m_curState, self.m_lastState;
end

-- 重置

function PlayIngMechineBase:reset()
	self.m_lastState = GameMechineConfig.STATUS_PLAYING;
	self.m_curState = GameMechineConfig.STATUS_PLAYING;
end

function PlayIngMechineBase:resetState()
	self:reset();
end

function PlayIngMechineBase:checkStateValid(uid, action, info, isFast, tag)
	if not self:checkAction(action) then
		return true;
	end
	self.m_from = tag;
	Log.d("PlayIngMechineBase.checkStateValid", "uid=",uid , "-----self.m_curState=", self.m_curState,"---self.m_lastState=",self.m_lastState,"---action=",action);

	local result = true;
	if self.stateChangeConfig and self.stateChangeConfig[action] == self.m_curState then
		-- a动作会导致状态修改为A，当前已经是A状态，又接收到动作a时，直接返回
		self:sthrowErro(uid,info,"状态错误，当前状态已经是" ..(self.m_curState or "")..",action = "..(action or "")..",tag = "..(tag or ""));
		return true, self.m_curState, self.m_lastState, result;
	end
	local checkValid = false;
	local state = self.m_curState;
	local config = self.stateCheckConfig[self.m_curState];
	if config then
		for k, v in pairs(config) do
			if v[1] == action then
				state = v[2] or state;
				checkValid = true;
				break;
			end
		end
	end
	self:_recordLog(uid,tag,info);
	if checkValid then
		self.m_lastState 	= self.m_curState;
		self.m_curState 	= state;
		self.m_action 		= action;
		result 				= self:onUpdatePlayerInfo(action,uid,info,isFast);
	end
	if (not result) or (not checkValid) then
		-- 状态错误，需要上报
		local msg = "状态错误：" ..(self.m_curState or "")..",action = "..(action or "")..",tag = "..(tag or "");
		self:sthrowErro(uid,info,msg);
	end
	return checkValid, self.m_curState, self.m_lastState, result;
end

-- 更新数据
function PlayIngMechineBase:onUpdatePlayerInfo(action, uid, info, isFast)
	local func = self.actionConfig[action];
	local result = true;
	if type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
            result = funcSelf(self,action,uid,info,isFast);
        end
    elseif type(func) == "function" then
    	local msg = "状态机配置表，需要修改为string类型：" ..(self.m_curState or "")..",action = "..(action or "")..",tag = "..(self.m_from or "");
    	self:sthrowErro(uid,info,msg);
    	result = func(self,action,uid,info,isFast);
    end
	return result;
end

-- 广播通知状态变化
function PlayIngMechineBase:sendBroadCastMsg(uid, info, isFast)
	if number.valueOf(uid) == 0 then
		if _DEBUG then
			self:showToast("PlayIngMechineBase.sendBroadCastMsg:广播通知的uid参数不对，请检查代码。uid=" .. uid);
		end
		return false;
	end
	local simpleInfo = GamePlayerManager2.getInstance():getSimpleInfo(uid);
	if simpleInfo and simpleInfo.seatId then
		if not PlayerSeat.getInstance():isSeatLegal(simpleInfo.seatId) then
			return false;
		end
		EventDispatcher.getInstance():breadthDispatch(GameMechineConfig.BROADCAST_STATE,
		self.m_curState, self.m_lastState, self.m_action, simpleInfo.seatId, uid, info, isFast);
		return true;
	end
	return false;
end

-- 不改变当前状态的事件，触发动作监听消息
function PlayIngMechineBase:sendActionBroadCastMsg(uid, info, isFast)
	if number.valueOf(uid) == 0 then
		if _DEBUG then
			self:showToast("PlayIngMechineBase.sendActionBroadCastMsg:广播通知的uid参数不对，前检查代码。uid=" .. uid);
		end
		return false;
	end
	local simpleInfo = GamePlayerManager2.getInstance():getSimpleInfo(uid);
	if simpleInfo and simpleInfo.seatId then
		if not PlayerSeat.getInstance():isSeatLegal(simpleInfo.seatId) then
			return false;
		end
		EventDispatcher.getInstance():breadthDispatch(GameMechineConfig.BROADCAST_ACTION,self.m_action,simpleInfo.seatId,uid,info,isFast);
		return true;
	end
	return false;	
end

function PlayIngMechineBase:showToast(msg)
	if type(msg) == "string" and msg ~= "" then
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end
end

-- 上报错误
function PlayIngMechineBase:_recordLog(uid,tag,info)
	local data = {};
	data.action = self.m_action;
	data.curState = self.m_curState;
	data.lastState = self.m_lastState;
	data.time = os.date();
	data.uid = uid;
	data.tag = tag;
	data.info = info;
	data.mainState = self.m_mainState;
	MechineLog.getInstance():d("PlayIngMechineBase",uid,data);
end

function PlayIngMechineBase:sthrowErro(uid,info,msg)
	if _DEBUG and uid then
		self:_recordLog(uid,self.m_from,info);
		MechineLog.getInstance():reportLog("PlayIngMechineBase",uid);
		debug.traceback();
		--error(msg);
	end
end
----------------------------------------------------------------------------------------------------------------

-- 状态配置表
PlayIngMechineBase.stateCheckConfig = {
	
	-- [curStatus] = {
	-- 	{ action1,			lastStatus1},
	-- 	{ action2,			lastStatus2},
	-- };
};


-- 会引起状态变化的动作配置表
PlayIngMechineBase.stateChangeConfig = {
	-- [action]				= status;
};


-- 事件响应
PlayIngMechineBase.actionConfig = {
	-- [action] 			= "function";
};

return PlayIngMechineBase;
