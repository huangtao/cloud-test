--[[
	公共状态机，处理游戏开始前的状态逻辑
]]

local NoneMechineBase = class(MechineBase);

function NoneMechineBase:ctor()
	self.m_lastState 	= GameMechineConfig.STATUS_NONE;
	self.m_curState 	= GameMechineConfig.STATUS_NONE;
	self:getActionListenMap();
end

function NoneMechineBase:getActionListenMap()
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

function NoneMechineBase:dtor()
end

function NoneMechineBase:checkAction(action)
	if self.actionConfig[action] then
		return true;
	end
	return false;
end

function NoneMechineBase:getStates()
	return self.m_curState, self.m_lastState;
end

-- 重置
function NoneMechineBase:reset()
	Log.d("NoneMechineBase:reset");
	self.m_lastState = GameMechineConfig.STATUS_NONE;
	self.m_curState = GameMechineConfig.STATUS_NONE;
end

function NoneMechineBase:checkStateValid(uid, action, info, isFast, tag)
	if not self:checkAction(action) then
		return true;
	end
	
	if self:modifyState(uid, action, info, isFast, tag) then
		self:_recordLog(uid,tag,info);
		return true, self.m_curState, self.m_lastState, true;
	end

	self.m_from = tag;
	Log.d("NoneMechineBase.checkStateValid", "uid=",uid, "-----self.m_curState=",self.m_curState,"---self.m_lastState=",self.m_lastState ,"---action=",action);
	local result = true;
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
		result 				= self:updatePlayerInfo(action,uid,info,isFast);
	else
		checkValid 			= self:amendmentStatus(action,uid,info,isFast);
		result 				= checkValid;
	end
	if not result then
		-- 状态错误，需要上报
		self:sthrowErro(uid,info,"状态错误"..",action = "..(action or ""));
	end
	return checkValid, self.m_curState, self.m_lastState, result;
end

function NoneMechineBase:modifyState(uid, action, info, isFast, tag)
	-- 修正错误状态
	if self.stateChangeConfig[action] == self.m_curState then
		-- a动作会导致状态修改为A，当前已经是A状态，又接收到动作a时，直接返回
		self:sthrowErro(uid,info,"状态错误，当前状态已经是" ..(self.m_curState or "")..",action = "..(action or "")..",tag = "..(tag or ""));
		return true
	end
	-- 强制修改当前状态机的状态
	if action == GameMechineConfig.ACTION_REFRESH_NONESTATUS then
		self:onRefreshNoneStatus(uid, info, isFast);
		return true
	end

	if action == GameMechineConfig.ACTION_LOGOUT and self.m_curState == GameMechineConfig.STATUS_NONE then
		-- 修正状态
		return true
	end
end

-- 修正状态错误，上报
-- 状态校验错误时，某些无数据并且不影响游戏正常流程的，可以通过容错纠正状态
function NoneMechineBase:amendmentStatus(action, uid, info, isFast)
	self:sthrowErro(uid,info,"状态错误，容错校验"..",action = "..(action or ""));
	local result = false;
	local playerInfo = GamePlayerManager2.getInstance():getPlayerByMid(uid);
	if playerInfo and self.stateChangeConfig[action] then
		self.m_lastState 	= self.m_curState;
		self.m_curState 	= self.stateChangeConfig[action];
		self.m_action 		= action;
		result 				= self:updatePlayerInfo(action,uid,info,isFast);
	end
	return result;
end

-- 更新数据
function NoneMechineBase:updatePlayerInfo(action, uid, info, isFast)
	local func = self.actionConfig[action];
	local result = false;
	if type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
            result = funcSelf(self,uid,info,isFast);
        end
    elseif type(func) == "function" then
    	self:sthrowErro(uid,info,"状态机配置表，需要修改为string类型--action=" .. action);
    	result = func(self,uid,info,isFast);
    end
	return result;
end

----------------------------------------------------------------------------------------------------------------
-- 初始化游戏 -- info = { roomLevel, baseChip, seatid }
function NoneMechineBase:onInitGame(uid, info, isFast)
	-- 保存个人信息
	if uid == UserBaseInfoIsolater.getInstance():getUserId() then
		if (not info) or (not info.roomLevel) or (not info.baseChip) or (not info.seatid) then
			return false;
		end
		GameInfoIsolater.getInstance():setCurRoomLevelId(info.roomLevel);
		GameRoomData.getInstance():setBaseChip(info.baseChip);
		GameRoomData.getInstance():setRoomLevel(info.roomLevel);
		PlayerSeat.getInstance():setMyServerSeatId(info.seatid);		
	end
	return self:sendStateBroadCastMsg(uid,info,isFast);
end

-- 玩家进入游戏房间，保存个人信息
function NoneMechineBase:onJoinGame(uid, info, isFast)
	if (not info) or (not info.m_info) then
		return false;
	end
	local flag = GamePlayerManager2.getInstance():addPlayer(info);
	if flag then
		return self:sendStateBroadCastMsg(info:getMid(),info,isFast);
	end
	return false;
end

-- 玩家配桌成功
function NoneMechineBase:onLoginSucc(uid, info, isFast)
	return self:sendStateBroadCastMsg(uid,{},isFast);
end

-- 退出房间，返回大厅
function NoneMechineBase:onExitGame(uid, info, isFast)
	local result = self:sendStateBroadCastMsg(uid,info,isFast);
	MechineManage.getInstance():removeMechine(uid);
	return result;
end

-- 玩家登出房间0x1008
function NoneMechineBase:onLogoutTable(uid, info, isFast)
	local result = self:sendStateBroadCastMsg(uid,info,isFast);	

	if uid ~= UserBaseInfoIsolater.getInstance():getUserId() then
		MechineManage.getInstance():removeMechine(uid);
	end
	return result;
end


--[[
	玩家进入桌子失败0x1005
	-1：登陆时分配的桌子id异常；2：房间人数已满；
	3：金币低于房间入场下限；4：金币高于房间入场上限；
	5：用户ID错误；6：桌子不存在；
	10：账号异常;11积分房被房主踢出超过两次
]]
function NoneMechineBase:onLoginTableErro(uid, info, isFast)
	Log.d("NoneMechineBase:onLoginTableErro",info);
	local toastStr = "";
	if info.errorType == 2 then
		if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
			--退出房间
			toastStr = GameString.get("kTextRoomFullStrength");
		else
			-- 进行换桌操作
			LoadingView.getInstance():showText("正在安排房间，请稍等");
			GameTimer2.startTimeOut(EventDispatcher.getInstance():getUserEvent(), self, function() 
				local action = GameMechineConfig.ACTION_NS_CHANGETABLE;
				MechineManage.getInstance():receiveAction(action,nil,uid);
			end, 1000);			
			return true;
		end
	else
		toastStr = "登陆房间失败";
		if not string.isEmpty(info.errorMsg) then
			toastStr = info.errorMsg;
		elseif info.errorType == 3 then
			toastStr = "您的资产没达到房间最低金额";
		elseif info.errorType == 4 then
			toastStr = "您的资产超过了房间最高金额";
		elseif info.errorType == 5 then
			
		elseif info.errorType == 6 then
			if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
				toastStr = "您前往的好友房已解散，无法成功加入"
			else
				toastStr = "登陆房间失败";
			end
		elseif info.errorType == 10 then
			toastStr = "您的账号或密码出现异常，请重新登陆";
		elseif info.errorType == 11 then 
			toastStr = "你被房主踢出去了两次，不能再进入该房间";
		end
	end
	self:showToast(toastStr);
	return self:sendStateBroadCastMsg(uid,info,isFast);
end

-- 准备
function NoneMechineBase:onReady(uid, info, isFast)
	local simpleInfo = GamePlayerManager2.getInstance():getSimpleInfo(uid);
	if simpleInfo and simpleInfo.seatId then
		local data = {};
		local tmp = { key = "ready", value = true };
		table.insert(data,tmp);
		tmp = { key = "ai", value = false };
		table.insert(data,tmp);
		GamePlayerManager2.getInstance():updatePlayerInfo(simpleInfo.seatId,data);
		return self:sendStateBroadCastMsg(uid,info,isFast);
	end
	return false;
end

-- 开始游戏
function NoneMechineBase:onStartGame(uid, info, isFast)
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_REFRESH_MAINSTATUS,
		GameMechineConfig.STATUS_PLAYING,uid,isFast,"NoneMechineBase");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_START,info,uid,isFast,"NoneMechineBase");
	return true;
end

-- 换桌失败
function NoneMechineBase:onChangeTableErro(uid, info, isFast)
	return self:sendActionBroadCastMsg(uid,info,isFast);
end

-- 通知当前状态机更新状态
function NoneMechineBase:onRefreshNoneStatus(uid, info, isFast)
	if info and (info.curState or info.curstate) and (info.lastState or info.laststate) then
		self.m_curState = info.curState or info.curstate;
		self.m_lastState = info.lastState or info.laststate;
		return true;
	end
	return false;
end

function NoneMechineBase:sendBroadCastMsg (uid, info, isFast)
	if (not uid) or number.valueOf(uid) == 0 then
		if _DEBUG then
			self:showToast("NoneMechineBase.sendBroadCastMsg:广播通知的uid参数不对，请检查代码。uid=" .. (uid or ""));
		end
	end
	return self:sendStateBroadCastMsg(uid, info, isFast);
end

function NoneMechineBase:sendStateBroadCastMsg(uid, info, isFast)
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
function NoneMechineBase:sendActionBroadCastMsg(uid, info, isFast)
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

function NoneMechineBase:showToast(msg)
	if type(msg) == "string" and msg ~= "" then
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end
end

-- 上报错误
function NoneMechineBase:_recordLog(uid,tag,info)
	local data = {};
	data.action = self.m_action;
	data.curState = self.m_curState;
	data.lastState = self.m_lastState;
	data.time = os.date();
	data.uid = uid;
	data.tag = tag;
	data.info = info;
	data.mainState = self.m_mainState;
	MechineLog.getInstance():d("NoneMechineBase",uid,data);
end

function NoneMechineBase:sthrowErro(uid,info,msg)
	if _DEBUG and uid then
		self:_recordLog(uid,self.m_from,info);
		MechineLog.getInstance():reportLog("NoneMechineBase",uid);
		debug.traceback();
		error(msg);
	end
end

function NoneMechineBase:execDelegate(func, ...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate, ...);
    end
end
----------------------------------------------------------------------------------------------------------------


NoneMechineBase.stateCheckConfig = {
	-- 初始状态
	[GameMechineConfig.STATUS_NONE] = {
		{ GameMechineConfig.ACTION_INITGAME,		GameMechineConfig.STATUS_INIT 	},
		{ GameMechineConfig.ACTION_JOINGAME,		GameMechineConfig.STATUS_JOIN 	},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
		{ GameMechineConfig.ACTION_LOGINERRO,		GameMechineConfig.STATUS_LOGIN_ERROR },
	};

	[GameMechineConfig.STATUS_INIT] = {
		{ GameMechineConfig.ACTION_JOINGAME,		GameMechineConfig.STATUS_JOIN 	},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
	};

	-- 加入房间状态
	[GameMechineConfig.STATUS_JOIN] = {
		{ GameMechineConfig.ACTION_LOGIN,			GameMechineConfig.STATUS_LOGIN 	},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
	};

	-- 登陆桌子状态
	[GameMechineConfig.STATUS_LOGIN] = {
		{ GameMechineConfig.ACTION_LOGOUT,			GameMechineConfig.STATUS_LOGOUT },
		{ GameMechineConfig.ACTION_READY,			GameMechineConfig.STATUS_READY 	},
		{ GameMechineConfig.ACTION_CHANGETABLEERRO,	nil 							},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
	};

	-- 登出桌子状态
	[GameMechineConfig.STATUS_LOGOUT] = {
		{ GameMechineConfig.ACTION_JOINGAME,		GameMechineConfig.STATUS_JOIN 	},
		{ GameMechineConfig.ACTION_LOGIN,			GameMechineConfig.STATUS_LOGIN 	},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
		{ GameMechineConfig.ACTION_INITGAME,		GameMechineConfig.STATUS_INIT 	},
		{ GameMechineConfig.ACTION_LOGINERRO,		GameMechineConfig.STATUS_LOGIN_ERROR },
	};

	-- 准备状态
	[GameMechineConfig.STATUS_READY] = {
		{ GameMechineConfig.ACTION_START,			nil 							},
		{ GameMechineConfig.ACTION_LOGOUT,			GameMechineConfig.STATUS_LOGOUT },
		{ GameMechineConfig.ACTION_CHANGETABLEERRO,	nil 							},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
	};

	-- 结算状态
	[GameMechineConfig.STATUS_GAMEOVER] = {
		{ GameMechineConfig.ACTION_LOGOUT,			GameMechineConfig.STATUS_LOGOUT },
		{ GameMechineConfig.ACTION_READY,			GameMechineConfig.STATUS_READY 	},
		{ GameMechineConfig.ACTION_CHANGETABLEERRO,	nil 							},
		{ GameMechineConfig.ACTION_EXIT,			GameMechineConfig.STATUS_NONE 	},
	};
};

NoneMechineBase.stateChangeConfig = {
	[GameMechineConfig.ACTION_INITGAME]				= GameMechineConfig.STATUS_INIT;
	[GameMechineConfig.ACTION_JOINGAME]				= GameMechineConfig.STATUS_JOIN;
	[GameMechineConfig.ACTION_EXIT]					= GameMechineConfig.STATUS_NONE;
	[GameMechineConfig.ACTION_LOGIN]				= GameMechineConfig.STATUS_LOGIN;
	[GameMechineConfig.ACTION_LOGINERRO]			= GameMechineConfig.STATUS_LOGIN_ERROR;
	[GameMechineConfig.ACTION_LOGOUT]				= GameMechineConfig.STATUS_LOGOUT;
	[GameMechineConfig.ACTION_READY]				= GameMechineConfig.STATUS_READY;
};

NoneMechineBase.actionConfig = {
	[GameMechineConfig.ACTION_INITGAME] 			= "onInitGame";
	[GameMechineConfig.ACTION_JOINGAME] 			= "onJoinGame";
	[GameMechineConfig.ACTION_EXIT]					= "onExitGame";
	[GameMechineConfig.ACTION_LOGIN]				= "onLoginSucc";
	[GameMechineConfig.ACTION_LOGINERRO]			= "onLoginTableErro";
	[GameMechineConfig.ACTION_LOGOUT]				= "onLogoutTable";
	[GameMechineConfig.ACTION_READY]				= "onReady";
	[GameMechineConfig.ACTION_START]				= "onStartGame";
	[GameMechineConfig.ACTION_CHANGETABLEERRO]		= "onChangeTableErro";
	[GameMechineConfig.ACTION_REFRESH_NONESTATUS]	= "onRefreshNoneStatus";
};

return NoneMechineBase;
