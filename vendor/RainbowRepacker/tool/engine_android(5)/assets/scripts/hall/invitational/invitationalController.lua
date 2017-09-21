require("isolater/common/commonController")

local GameRoomLevelConfig = require("hall/main/data/gameRoomLevelConfig")

InvitationalController = class(CommonController)

InvitationalController.s_cmds =
{
	goBack = 1,
	signupMatch = 2,
	requestExitMatch = 3,
}

InvitationalController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state
	
end

InvitationalController.dtor = function(self)
	self.m_stayTime = nil
	InvitationalDataInterface.getInstance():clearObserver(self)
	MatchHallDataInterface.getInstance():clearObserver(self)
end

InvitationalController.onGoBack = function(self)
	StateMachine.getInstance():changeState(States.GameMatchHall)
end

InvitationalController.onResponseInvitationalDetail = function(self, info)
	self:updateView(InvitationalScene.s_cmds.onResponseInvitationalDetail, info)
end

InvitationalController.onInvitationalMyApplyLists = function(self, isSuccess, info)
	self:updateView(InvitationalScene.s_cmds.onInvitationalMyApplyLists, isSuccess, info)
end

InvitationalController.resume = function(self)
	self.m_stayTime = os.time()
	CommonController.resume(self)
	InvitationalDataInterface.getInstance():setObserver(self)
	MatchHallDataInterface.getInstance():setObserver(self)
end

InvitationalController.pause = function(self)
	if self.m_stayTime and (os.time() - self.m_stayTime) > 0 then
		UBReport.getInstance():report(UBConfig.kInvitationalAction4, os.time() - self.m_stayTime)
	end
	CommonController.pause(self)
	InvitationalDataInterface.getInstance():clearObserver(self)
	MatchHallDataInterface.getInstance():clearObserver(self)
end

--@brief 报名比赛
InvitationalController.enrollMatch = function (self, info)
	self.m_matchInfo = info;
	MatchHallDataInterface.getInstance():signupMatch(info);
	--InvitationalDataInterface.getInstance():enrollMatch(info);
end

--@delegate 报名成功
InvitationalController.onSignupMatchSuccess = function (self, data)
	Log.v("报名成功==========",data)
	if self.m_matchInfo then 
		self.m_matchInfo.num = data.loginCount;
		self.m_matchInfo.totalNum = data.count;

		GameInfoIsolater.getInstance():setCurGameId(self.m_matchInfo.gameId);
		GameInfoIsolater.getInstance():setCurRoomLevelId(GameRoomLevelConfig.MATCH_DINGJU_ROOMID);
		MatchHallDataInterface.getInstance():setMatchData(self.m_matchInfo);
		GameInfoIsolater.getInstance():setCurGameType(self.m_matchInfo.type);
	    GameInfoIsolater.getInstance():startGame(self.m_matchInfo.gameId,nil,nil);
	end 
	self.m_matchInfo = nil;
end

--@delegate 报名失败
InvitationalController.onSignupMatchFailed = function (self, info)
	info = table.verify(info);
	local code = info.code ;
    local gameId = info.gameId;
    local matchId = info.matchId;   	

    if code == MatchHallDataInterface.ALREADY_SIGN_UP and self.m_matchInfo then 
		GameInfoIsolater.getInstance():setCurGameId(self.m_matchInfo.gameId);
		MatchHallDataInterface.getInstance():setMatchData(self.m_matchInfo);
		GameInfoIsolater.getInstance():setCurGameType(self.m_matchInfo.type);

		GameInfoIsolater.getInstance():setGameToWhereState(States.GameMatchHall);
        GameInfoIsolater.getInstance():startGame(self.m_matchInfo.gameId,nil,nil);
	end
	self.m_matchInfo = nil;
end

--@delegate 更新比赛状态
InvitationalController.onUpdateMatchState = function(self, info)
	Log.v("InvitationalController.onUpdateMatchState================",info)
	self:updateView(InvitationalScene.s_cmds.onUpdateMatchState, info)
	self:updateView(InvitationalScene.s_cmds.onResetInputView);
end

--@brief 请求退赛
InvitationalController.requestExitMatch = function (self, data)
	LoadingView.getInstance():showText("正在退赛...");
	MatchHallDataInterface.getInstance():requestExitMatch(data);
end

--@brief 退赛成功
InvitationalController.onExitMatchSuccess = function (self, itemData, info, flag)
	LoadingView.getInstance():hidden()
	Toast.getInstance():showText("退赛成功",50,30,kAlignLeft,"",30,200,175,115)
	self:updateView(InvitationalScene.s_cmds.onResetInputView);
end

--@brief 退赛失败
InvitationalController.onExitMatchFailed = function (self,info)
	LoadingView.getInstance():hidden()
	Toast.getInstance():showText("退赛未完成，请稍候重试",50,30,kAlignLeft,"",30,200,175,115)
end

--@brief 通知进入比赛
InvitationalController.onTimeToEnterMatch = function (self, data) 

end

--@brief 支付到账回调
InvitationalController.onBroadcastPayMoney = function(self, broadType)
    self:updateView(InvitationalScene.s_cmds.onBroadcastPayMoney, broadType);
end

InvitationalController.onMatchReconnected = function(self,data)
	OnlineSocketManager.getInstance():reopenSocket();
end

InvitationalController.onResponseMyMatchInvitational = function(self, info)
	self:updateView(InvitationalScene.s_cmds.onResponseMyMatchInvitational, info)
end

--邀请赛错误提示
InvitationalController.onResponseErrorTipsInvitational = function(self, info)
	self:updateView(InvitationalScene.s_cmds.onResponseErrorTipsInvitational, info)
end

--邀请赛创建回复
InvitationalController.onResponseInvitationalCreate = function(self, info)
	self:updateView(InvitationalScene.s_cmds.onResponseInvitationalCreate, info)
end

--刷新我创建的邀请赛
InvitationalController.onRefreshMyMatchInvitational = function(self, info)
	self:updateView(InvitationalScene.s_cmds.onRefreshMyMatchInvitational, info)
end

InvitationalController.onUpdateBatteryLevel = function(self, status, json_data)
	if not status or not json_data then
		return
	end
	local level = GetNumFromJsonTable(json_data, "Level")
	self:updateView(InvitationalScene.s_cmds.onUpdateBatteryLevel, level) 
end

--@brief 比赛详情回复
InvitationalController.onResponseMatchDetail = function (self, info)
	self:updateView(InvitationalScene.s_cmds.onResponseMatchDetail, info)
end

InvitationalController.s_cmdConfig = 
{
	[InvitationalController.s_cmds.goBack] = InvitationalController.onGoBack,
	[InvitationalController.s_cmds.signupMatch]			= InvitationalController.enrollMatch,
	[InvitationalController.s_cmds.requestExitMatch]		= InvitationalController.requestExitMatch,
}

InvitationalController.s_nativeEventFuncMap = {
    ["GetBatteryLevel"]					= InvitationalController.onUpdateBatteryLevel,
}