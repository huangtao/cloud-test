require("games/common2/match/matchMechine/matchMechineConfig");
require("games/common2/mechine/mechineLog");

local MatchMechineOperation = class();

MatchMechineOperation.ctor = function(self,uid)
	self.m_lastState = MatchMechineConfig.STATUS_NONE;
	self.m_curState = MatchMechineConfig.STATUS_NONE;
	self.m_curSubState = self.m_curState;

	self.m_uid = uid or UserBaseInfoIsolater.getInstance():getUserId();
	local data = {};
	data.tag = "MatchMechineOperation.ctor";
	data.time = os.date();
	data.curState = self.m_curState;
	data.lastState = self.m_lastState;
	data.self = tostring(self);
	MechineLog.getInstance():d(MechineLog.TAG4,self.m_uid,data);
end

MatchMechineOperation.dtor = function(self)
	self:resetState("MatchMechineOperation.dtor");
end

MatchMechineOperation.getStates = function(self)
	return self.m_curState,self.m_lastState,self.m_curSubState;
end

MatchMechineOperation.resetState = function(self,tag)
	local uid = self.m_uid;
	local data = {};
	data.tag = tag or "MatchMechineOperation.resetState";
	data.time = os.date();
	data.curState = self.m_curState;
	data.lastState = self.m_lastState;
	data.self = tostring(self);
	data.nextState = MatchMechineOperation.STATUS_NONE;
	MechineLog.getInstance():d(MechineLog.TAG4,uid,data);

	self.m_lastState = MatchMechineConfig.STATUS_NONE;
	self.m_curState = MatchMechineConfig.STATUS_NONE;	
	self.m_curSubState = self.m_curState;
end

MatchMechineOperation.checkStateValid = function(self,action,info,isFast,tag)
	if MatchMechineOperation.stateChangeConfig[action] == self.m_curState 
		and action ~= MatchMechineConfig.ACTION_EXIT_SUCCESS then
		return true;
	end

	local config = MatchMechineOperation.stateCheckConfig[self.m_curState];
	local state = self.m_curState;
	local flag;--当前状态机是否有处理
	if config then
		for k,v in pairs(config) do
			if v[1] == action then
				state = v[2] or state;
				flag = true;
				break;
			end
		end
	end
	
	local uid = self.m_uid;
	local data = {};
	data.action = action;
	data.info = info;
	data.isFast = isFast;
	data.tag = tag;
	data.time = os.date();
	data.type = flag and "handle" or "no_handle";
	data.curState = self.m_curState;
	data.lastState = self.m_lastState;
	data.nextState = state;
	data.self = tostring(self);
	MechineLog.getInstance():d(MechineLog.TAG4,uid,data);

	if flag then
		self.m_lastState = self.m_curState;
		self.m_curState = state;
		self:refreshSubState(state,action);

		self:updatePlayerInfo(self.m_curState,self.m_lastState,action,info,isFast);--
	else
		local isAmend,isReport = self:amendmentStatus(action,info,isFast);
		if isReport then 
			local tmp = table.verify(MatchIsolater.getInstance():getMatchData());
			local data = {};
			data.userId = uid;
			data.matchId = tmp.id;
			MechineLog.getInstance():d(MechineLog.TAG4,uid,data);
			MechineLog.getInstance():reportLog(MechineLog.TAG4,uid,true);
		end 
		if not isAmend then 
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_STATUS_ERROR);
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_REFRESH_MAINSTATUS, 
			GameMechineConfig.STATUS_RECONNECT, -1);
		end 
	end
end

-- 修正状态错误
MatchMechineOperation.amendmentStatus = function(self,action,info,isFast)
	local isAmend = true;
	local isReport = true;	

	local state = MatchMechineOperation.stateChangeConfig[action];

	if state then --会引起状态变化的动作,可能让界面卡死，固先将其作为有效动作，执行后修正状态
		self.m_lastState = self.m_curState;
		self.m_curState = state;
		self:refreshSubState(state,action);
		self:updatePlayerInfo(self.m_curState,self.m_lastState,action,info,isFast);

		if state == MatchMechineConfig.STATUS_FINISH 
			or state == MatchMechineConfig.STATUS_NONE then --比赛已结束，已无修正必要		
			isAmend = false;
		end
	else --不会引起状态变化的动作，直接修正状态
	end 		
	return isAmend,isReport;
end

MatchMechineOperation.refreshSubState = function(self,state,action)
	local subConfig = MatchMechineOperation.subStateChangeConfig[state];
	local subState = state;
	if subConfig then
		subState = subConfig[action] or self.m_curSubState;
	end  
	self.m_curSubState = subState;
end

-- 更新数据
MatchMechineOperation.updatePlayerInfo = function(self,curstate,laststate,action,info,isFast)
	if MatchMechineOperation.actionConfig[action] then
		MatchMechineOperation.actionConfig[action](self,curstate,laststate,action,info,isFast);
	end
end

-- 发送广播,当前状态、上一次的状态、动作、本地座位号、用户id、返回信息、是否为快速响应
MatchMechineOperation.sendBroadCastMsg = function(self,curState,lastState,action,info,isFast)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	local uid = self.m_uid;

	if curState ~= lastState then --比赛状态改变，广播状态更改
		EventDispatcher.getInstance():dispatch(MatchMechineConfig.NOTIFY_STATUS,curState,lastState,action,localseat,uid,info,isFast);
	else
		EventDispatcher.getInstance():dispatch(MatchMechineConfig.NOTIFY_ACTION,
			action,localseat,uid,info,isFast);
	end 
end

MatchMechineOperation.createMatchViews = function(self,viewName,isFast)
	if viewName then 
		local action = MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS;
		local info = {};
		info.viewName = viewName;

		self:sendBroadCastMsg(nil,nil,action,info,isFast);
	end 
end

---------------------------------------------------------------------------------------------------------------
MatchMechineOperation.onSignupMatchSuccess = function(self,curstate,laststate,action,info,isFast)
	if not isFast then 
		self:createMatchViews(MatchMechineConfig.VIEW_LOADING);
	end 

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onSignupXianShiMatchSuccess = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onMatchStart = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onExitMatch = function(self,curstate,laststate,action,info,isFast)
	MatchIsolater.getInstance():setSignMatchId(nil);
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onGetStageInfo = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end
MatchMechineOperation.onMatchGameOver = function(self,curstate,laststate,action,info,isFast)
	if not isFast then 
		self:createMatchViews(MatchMechineConfig.VIEW_GAMEOVER);
	end 

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end
MatchMechineOperation.onWaitTable = function(self,curstate,laststate,action,info,isFast)
	self:createMatchViews(MatchMechineConfig.VIEW_WAIT_TABLE,isFast);
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onRoundOver = function(self,curstate,laststate,action,info,isFast)
	if not isFast then 
		self:createMatchViews(MatchMechineConfig.VIEW_ROUNDOVER);
	end 

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end
MatchMechineOperation.onMatchFinsh = function(self,curstate,laststate,action,info,isFast)
	self:createMatchViews(MatchMechineConfig.VIEW_OVER);

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onMatchReward = function(self,curstate,laststate,action,info,isFast)
	self:createMatchViews(MatchMechineConfig.VIEW_OVER);

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onGetReviveNotify = function(self,curstate,laststate,action,info,isFast)
	self:createMatchViews(MatchMechineConfig.VIEW_REVIVE);

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onReviveFailed = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onReviveSuccess = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onGetPlayerScore = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onRequestExitMatch = function(self,curstate,laststate,action,info,isFast)
	self:createMatchViews(MatchMechineConfig.VIEW_EXIT,isFast);

	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.onReconnectMatchInGame = function(self,curstate,laststate,action,info,isFast)
	self:sendBroadCastMsg(curstate,laststate,action,info,isFast);
end

MatchMechineOperation.stateCheckConfig = {
	--[current status] = {{action,next status}};

	[MatchMechineConfig.STATUS_NONE] = {
		{MatchMechineConfig.ACTION_SIGNUP_SUCCESS,MatchMechineConfig.STATUS_LOADING},
		{MatchMechineConfig.ACTION_SIGNUP_XIANSHI_SUCCESS,nil},
		{MatchMechineConfig.ACTION_EXIT_SUCCESS,nil},
		{MatchMechineConfig.ACTION_RESET,nil},
	};

	[MatchMechineConfig.STATUS_LOADING] = {
		{MatchMechineConfig.ACTION_START,MatchMechineConfig.STATUS_PLAYING},
		{MatchMechineConfig.ACTION_REQUEST_EXIT,nil},

		{MatchMechineConfig.ACTION_EXIT_SUCCESS,MatchMechineConfig.STATUS_NONE},
		{MatchMechineConfig.ACTION_RESET,MatchMechineConfig.STATUS_NONE},
	};


	[MatchMechineConfig.STATUS_PLAYING] = {
		{MatchMechineConfig.ACTION_GAME_OVER,MatchMechineConfig.STATUS_WAITING},

		{MatchMechineConfig.ACTION_EXIT_SUCCESS,MatchMechineConfig.STATUS_NONE},
		{MatchMechineConfig.ACTION_RESET,MatchMechineConfig.STATUS_NONE},

		{MatchMechineConfig.ACTION_REQUEST_RECONNECT_INGAME,nil},
		{MatchMechineConfig.ACTION_FINISH,MatchMechineConfig.STATUS_FINISH},
	};


	[MatchMechineConfig.STATUS_WAITING] = {
		{MatchMechineConfig.ACTION_WAIT_TABLE,nil},
		{MatchMechineConfig.ACTION_GAME_OVER,nil},
		{MatchMechineConfig.ACTION_ROUND_OVER,nil},	
		{MatchMechineConfig.ACTION_REQUEST_EXIT,nil},
		{MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY,nil},
		{MatchMechineConfig.ACTION_REVIVE_FAILED,nil},	
		{MatchMechineConfig.ACTION_REVIVE_SUCCESS,nil},
		{MatchMechineConfig.ACTION_START,MatchMechineConfig.STATUS_PLAYING},		
		{MatchMechineConfig.ACTION_FINISH,MatchMechineConfig.STATUS_FINISH},

		{MatchMechineConfig.ACTION_EXIT_SUCCESS,MatchMechineConfig.STATUS_NONE},
		{MatchMechineConfig.ACTION_RESET,MatchMechineConfig.STATUS_NONE},
	};

	[MatchMechineConfig.STATUS_FINISH] = {
		{MatchMechineConfig.ACTION_GAME_OVER,nil},
		{MatchMechineConfig.ACTION_FINISH_REWARD,nil},
		{MatchMechineConfig.ACTION_SIGNUP_SUCCESS,MatchMechineConfig.STATUS_LOADING},
		{MatchMechineConfig.ACTION_SIGNUP_XIANSHI_SUCCESS,nil},
 
		{MatchMechineConfig.ACTION_EXIT_SUCCESS,MatchMechineConfig.STATUS_NONE},
		{MatchMechineConfig.ACTION_RESET,MatchMechineConfig.STATUS_NONE},		
	};
};

--会引起状态变化的动作
MatchMechineOperation.stateChangeConfig = {
	[MatchMechineConfig.ACTION_RESET] 				= MatchMechineConfig.STATUS_NONE;
	[MatchMechineConfig.ACTION_EXIT_SUCCESS] 		= MatchMechineConfig.STATUS_NONE;

	[MatchMechineConfig.ACTION_SIGNUP_SUCCESS] 		= MatchMechineConfig.STATUS_LOADING;
	[MatchMechineConfig.ACTION_START] 				= MatchMechineConfig.STATUS_PLAYING;

	[MatchMechineConfig.ACTION_GAME_OVER] 			= MatchMechineConfig.STATUS_WAITING;

	[MatchMechineConfig.ACTION_FINISH] 				= MatchMechineConfig.STATUS_FINISH;
};

MatchMechineOperation.subStateChangeConfig = {
	[MatchMechineConfig.STATUS_WAITING] = {
		[MatchMechineConfig.ACTION_GAME_OVER] 			= MatchMechineConfig.STATUS_WAITING_GAMEOVER;
		[MatchMechineConfig.ACTION_ROUND_OVER]			= MatchMechineConfig.STATUS_WAITING_ROUNDOVER;
		[MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY] 	= MatchMechineConfig.STATUS_WAITING_REVIVE;
		[MatchMechineConfig.ACTION_REVIVE_SUCCESS] 		= MatchMechineConfig.STATUS_WAITING_GAMEOVER;
		[MatchMechineConfig.ACTION_REVIVE_FAILED]		= MatchMechineConfig.STATUS_WAITING_FINISH;
		[MatchMechineConfig.ACTION_WAIT_TABLE]		 	= MatchMechineConfig.STATUS_WAITING_TABLE;
	};
};

MatchMechineOperation.actionConfig = {
	[MatchMechineConfig.ACTION_SIGNUP_SUCCESS]		= MatchMechineOperation.onSignupMatchSuccess,
	[MatchMechineConfig.ACTION_SIGNUP_XIANSHI_SUCCESS]	= MatchMechineOperation.onSignupXianShiMatchSuccess,
	[MatchMechineConfig.ACTION_START]				= MatchMechineOperation.onMatchStart,

	[MatchMechineConfig.ACTION_RESET]				= MatchMechineOperation.resetState;
	[MatchMechineConfig.ACTION_EXIT_SUCCESS]		= MatchMechineOperation.onExitMatch,
		
	[MatchMechineConfig.ACTION_GAME_OVER]			= MatchMechineOperation.onMatchGameOver,
	[MatchMechineConfig.ACTION_WAIT_TABLE]			= MatchMechineOperation.onWaitTable;
	[MatchMechineConfig.ACTION_ROUND_OVER]			= MatchMechineOperation.onRoundOver,
	[MatchMechineConfig.ACTION_FINISH]				= MatchMechineOperation.onMatchFinsh,
	[MatchMechineConfig.ACTION_FINISH_REWARD]		= MatchMechineOperation.onMatchReward,
	[MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY]	= MatchMechineOperation.onGetReviveNotify,
	[MatchMechineConfig.ACTION_REVIVE_FAILED]		= MatchMechineOperation.onReviveFailed,
	[MatchMechineConfig.ACTION_REVIVE_SUCCESS]		= MatchMechineOperation.onReviveSuccess,

	[MatchMechineConfig.ACTION_REQUEST_EXIT] 		= MatchMechineOperation.onRequestExitMatch,
	[MatchMechineConfig.ACTION_REQUEST_RECONNECT_INGAME] 	= MatchMechineOperation.onReconnectMatchInGame,
};

return MatchMechineOperation;