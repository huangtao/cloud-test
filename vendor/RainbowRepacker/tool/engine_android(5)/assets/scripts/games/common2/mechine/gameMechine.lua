require("games/common2/mechine/mechineBase");
require("games/common2/mechine/mechineLog");
require("games/common2/module/players/gamePlayer2");

GameMechine = class(MechineBase);

GameMechine.Delegate = {
    removeMechine = "removeMechine";
}

--[[
	维护3状态机，游戏状态、非游戏状态、重连状态
]]

function GameMechine:init(uid)
	self.m_uid = uid; -- 用户id
	self.m_mainState = GameMechineConfig.STATUS_NONE; -- 当前游戏的主状态
	self.m_lastState = GameMechineConfig.STATUS_NONE; -- 上一次的游戏状态
	self.m_curState = GameMechineConfig.STATUS_NONE; -- 当前游戏状态
	self.m_statesConfig = {
		[GameMechineConfig.STATUS_NONE] = true,
		[GameMechineConfig.STATUS_PLAYING] = true,
		};

	self.m_subMechines = {}; -- 游戏状态机
	self:creatMechine();
	self:creatNoStateAction();
	self:addReconnectMechine();

	self:_recordLog(nil,"GameMechine:init");
end

-- 添加重连中的状态机
function GameMechine:addReconnectMechine()
	local reconnect = require("games/common2/mechine/reconnectMechine");
	local reconnectMechine = new(reconnect);
	self:addMechine(GameMechineConfig.STATUS_RECONNECT,reconnectMechine);
end

-- 添加无状态的状态机
function GameMechine:creatNoStateAction()
	local config = GameMechineConfig.mechineConfig or {};
	local nostateConfig = config[GameMechineConfig.STATUS_NOSTATUS];
	local noStateAction = require("games/common2/mechine/noStateAction");
	if nostateConfig and nostateConfig[1] then
		noStateAction = Import(nostateConfig[1]);
	end
	if noStateAction then
		self.m_nostateObj = new(noStateAction);
		self.m_nostateObj:setDelegate(self);
	end
end

-- 创建状态机
function GameMechine:creatMechine()
	local config = GameMechineConfig.mechineConfig or {};
	if table.isEmpty(config) then
		-- 子游戏状态机未配置
	else
		for k,v in pairs(self.m_statesConfig) do
			if config[k] then
				local mechine = Import(config[k][1]);
				if mechine then
					local stateClass = new(mechine);
					stateClass:setDelegate(self);
					self:addMechine(k,stateClass);
				end
			end
		end
	end	
end

-- 检测状态是否可以跳转uid,action,info,isFast
function GameMechine:checkStateValid(uid, action, info, isFast,tag)
	Log.i("------GameMechine.checkStateValid", "uid=" ,uid, "---self.m_curState=",self.m_curState,"--self.m_mainState=",self.m_mainState,"---action=",action, "--tag=",(tag or ""));

	if GameMechine.actionConfig[action] then
		GameMechine.actionConfig[action](self,info);
		return;
	end
	self.m_action = action;
	local checkValid = true;
	local result = true;
	local curstate = self.m_curState;
	local laststate = self.m_lastState;

	local subMechine = self.m_subMechines[self.m_mainState];
	if subMechine and subMechine:checkAction(action) then
		-- 游戏状态机
		checkValid,curstate,laststate,result = subMechine:checkStateValid(uid,action,info,isFast,tag);
		
	elseif self.m_nostateObj and self.m_nostateObj:checkAction(action) then
		-- 无状态动作
		self.m_nostateObj:updateNoStateInfo(action, uid, info, isFast,tag);
	end
	self:_recordLog(uid,tag,info);

	-- 更新当前状态
	if checkValid  then
		self.m_curState = curstate or self.m_curState;
		self.m_lastState = laststate or self.m_lastState;
	end
	-- 校验错误、消息发送或处理失败时，请求重连
	if (not result) or (not checkValid) then
		if self.m_nostateObj and self.m_nostateObj:checkAction(GameMechineConfig.ACTION_NS_STATUS_ERROR) then
			self.m_nostateObj:updateNoStateInfo(GameMechineConfig.ACTION_NS_STATUS_ERROR, uid, {}, false,"GameMechine.checkStateValid");
		end
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_REFRESH_MAINSTATUS, 
			GameMechineConfig.STATUS_RECONNECT, -1);
		self:sthrowErro(uid,info,tag,action);
	end
end

-- 返回状态机的状态
function GameMechine:getStates()
	return self.m_curState,self.m_lastState;
end

-- 重置主状态
function GameMechine:resetMainState()
	self.m_mainState = GameMechineConfig.STATUS_NONE;
end

-- 获取主状态(游戏中、非游戏中)
function GameMechine:getMainState()
	return self.m_mainState;
end

function GameMechine:refreshMainStatus(info,uid)
	if info and info ~= self.m_mainState then
		self.m_mainState = info;
		EventDispatcher.getInstance():breadthDispatch(GameMechineConfig.BROADCAST_MAINSTATE, self.m_mainState, self.m_mainState, uid);
	end
end

-- 给状态state添加子状态机
function GameMechine:addMechine(state,mechine)
	if (not mechine) or (not state) then
		return;
	end
	self.m_subMechines[state] = mechine;
end

-- 移除状态state的子状态机
function GameMechine:removeMechine(uid,seat)
	delete(self.m_subMechines[state]);
	self.m_subMechines[state] = nil;
	self:execDelegate(GameMechine.Delegate.removeMechine,uid);
end

-- 重置状态机
function GameMechine:reset(action,uid,info,isFast,tag)
	for k,v in pairs(self.m_subMechines) do
		v:reset();
	end
	tag = "GameMechine.reset" .. (tag or "");
	self:_recordLog(uid,tag,info);

	self.m_mainState = GameMechineConfig.STATUS_NONE;
	self.m_lastState = GameMechineConfig.STATUS_NONE;
	self.m_curState = GameMechineConfig.STATUS_NONE;
end

-- 释放子状态机
function GameMechine:resetMechine()
	for k,v in pairs(self.m_subMechines) do
		delete(v);
		v = nil;
	end
	self:_recordLog(nil,"GameMechine:resetMechine");
	self.m_subMechines = {};
end

function GameMechine:dtor()	
	self:_recordLog(nil,"GameMechine:dtor");
	self:resetMechine();
	delete(self.m_nostateObj);
	self.m_nostateObj = nil;
end

function GameMechine:_recordLog(uid,tag,info)
	local data = {};
	data.curState = curstate or self.m_curState
	data.lastState = laststate or self.m_lastState
	data.mainState = self.m_mainState;
	data.action = self.m_action;
	data.time = os.date();
	data.uid = uid or self.m_uid;
	data.tag = tag;
	data.info = info or debug.traceback();
	MechineLog.getInstance():d(MechineLog.TAG1,data.uid,data);
end

function GameMechine:execDelegate(func, ...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate, ...);
    end
end

function GameMechine:sthrowErro(uid,info,from,action)
	if _DEBUG then
		self:_recordLog(uid,from,info);
		MechineLog.getInstance():reportLog(MechineLog.TAG1,uid);
		debug.traceback();
		error("状态校验错误，请导出sd卡下对应包名目录下的log日志，提供给开发查找原因--action=" .. action);
		return true;
	end
end

-- 根据动作修改数据
GameMechine.actionConfig = {
	[GameMechineConfig.ACTION_REFRESH_MAINSTATUS] 				= GameMechine.refreshMainStatus;
};