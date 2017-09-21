--region gameMatchHallController.lua
--Author : LeoChen
--Date   : 2015/1/8
--此文件由[BabeLua]插件自动生成
require("isolater/common/commonController");
require("common/loadingView");

-- require("games/common2/match/socket/matchSocketReader");
-- require("games/common2/match/socket/matchSocketWriter");
-- require("games/common2/match/socket/matchSocketCmd");

require("isolater/interface/gameInfoIsolater");
require("isolater/interface/userPropertyIsolater");

local GameRoomLevelConfig = require("hall/main/data/gameRoomLevelConfig");

GameMatchHallController = class(CommonController);

GameMatchHallController.s_cmds = {
	requestMatchList 			= 1,
	signupMatch					= 2,
	backToHall 					= 3,
	requestMatchDetail			= 6,
	requestExitMatch			= 7,
	onChangeToOtherState		= 8,
}
GameMatchHallController.s_eventGoToGameByInfo = EventDispatcher.getInstance():getUserEvent();--根据一些信息进入游戏

GameMatchHallController.ctor = function(self, state, viewClass, viewConfig, ...)
	self.m_state = state;
	
	-- self.m_socket = SocketIsolater.getInstance():getSocket();
	-- self.m_commonReader = new(MatchSocketReader);
	-- self.m_commonWriter = new(MatchSocketWriter);
 --    self.m_socket:addSocketReader(self.m_commonReader);
	-- self.m_socket:addSocketWriter(self.m_commonWriter);

	SocketIsolater.getInstance():openSocket();
	EventDispatcher.getInstance():register(GameMatchHallController.s_eventGoToGameByInfo,self,self.onRequestGameByLevel); --根据信息登录游戏

end

GameMatchHallController.resume = function ( self )
	CommonController.resume(self);
	MatchHallDataInterface.getInstance():setObserver(self);

	require("hall/floatBall/data/floatBallDataInterface");
	FloatBallDataInterface:getInstance():setSceneName("match");

	self:requestMatchList();
	MatchHallDataInterface.getInstance():setIsRoomToMatch(false);
end

GameMatchHallController.pause = function ( self )
	MatchHallDataInterface.getInstance():clearObserver(self);
	CommonController.pause(self);
end

GameMatchHallController.dtor = function ( self )
	EventDispatcher.getInstance():unregister(GameMatchHallController.s_eventGoToGameByInfo,self,self.onRequestGameByLevel); --根据信息登录游戏
    MatchHallDataInterface.getInstance():clearObserver(self);
end

--请求比赛场列表
GameMatchHallController.requestMatchList = function (self)
	local matchList = MatchHallDataInterface.getInstance():getMatchList();
	if table.isEmpty(matchList) then
   		LoadingView.getInstance():showText(kTextMatchList);
	end
	MatchHallDataInterface.getInstance():requestMatchList();
end

--获取比赛场列表
GameMatchHallController.onGetMatchList = function (self, data)
    LoadingView.getInstance():hidden();
	self:updateView(GameMatchHallScene.s_cmds.onGetMatchList, data);
end

--@brief 报名比赛
GameMatchHallController.doSignupMatch = function (self, info)
	self.m_matchInfo = info;
	MatchHallDataInterface.getInstance():signupMatch(info);
end

--@delegate 报名成功
GameMatchHallController.onSignupMatchSuccess = function (self, data)
	if self.m_matchInfo then 
		self.m_matchInfo.num = data.loginCount;
		self.m_matchInfo.totalNum = data.count;
		self:updateView(GameMatchHallScene.s_cmds.enterLoading, data);

		GameInfoIsolater.getInstance():setCurGameId(self.m_matchInfo.gameId);
		GameInfoIsolater.getInstance():setCurRoomLevelId(GameRoomLevelConfig.MATCH_DINGJU_ROOMID);
		MatchHallDataInterface.getInstance():setMatchData(self.m_matchInfo);
		GameInfoIsolater.getInstance():setCurGameType(self.m_matchInfo.type);
	    GameInfoIsolater.getInstance():startGame(self.m_matchInfo.gameId,nil,nil);
	end 
	self.m_matchInfo = nil;
end

--@delegate 报名失败
GameMatchHallController.onSignupMatchFailed = function (self, info)
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
GameMatchHallController.onUpdateMatchState = function(self, matchInfo)
	self:updateView(GameMatchHallScene.s_cmds.signUpMatchSuccess, matchInfo);
end

--@brief 通过gameid level直接请求房间
GameMatchHallController.onRequestGameByLevel = function(self, gameId, levelId,from)
	if levelId == 500 or levelId == 600 or levelId == 700 then		
		LoadingView.getInstance():showText(kTextMatchList);
		self:getMatchList();
		return;
	end

	GameInfoIsolater.getInstance():setCurGameId(gameId);
	GameInfoIsolater.getInstance():setCurRoomLevelId(levelId);
	if not from then
		if GameInfoIsolater.getInstance():isRoomAntiCheating(gameId, levelId) then
			NativeEvent.getInstance():ShowLoadingDialog(kTextPreventCheat);	
		else
			NativeEvent.getInstance():ShowLoadingDialog(GameString.get("start_game"));
		end
	end

	GameInfoIsolater.getInstance():setCurGameType(GameConstant.TIME_LIMITED_MATCH);
	GameInfoIsolater.getInstance():startGame(gameId);
end

GameMatchHallController.onBackPressed = function(self)
    if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return true ;
	end
	GameInfoIsolater.getInstance():startGame(GameInfoIsolater.getInstance():getHallGameType());
end

-- socket断线
GameMatchHallController.onSocketOffline = function(self)
	self:onBackPressed();
end

--@brief 请求比赛详情
GameMatchHallController.requestMatchDetail = function (self, data)
	MatchHallDataInterface.getInstance():requestMatchDetail(data.id);
end

--@brief 比赛详情回复
GameMatchHallController.onResponseMatchDetail = function (self, info)
	self:updateView(GameMatchHallScene.s_cmds.updateMatchDetail, info);
end

--@brief 请求退赛
GameMatchHallController.requestExitMatch = function (self, data)
	MatchHallDataInterface.getInstance():requestExitMatch(data);
end

--@brief 退赛成功
GameMatchHallController.onExitMatchSuccess = function (self, itemData, info, flag)
	self:updateView(GameMatchHallScene.s_cmds.UpdateExitMatchResult, itemData, info, flag);
end

--@brief 退赛失败
GameMatchHallController.onExitMatchFailed = function (self,info)
	self:updateView(GameMatchHallScene.s_cmds.UpdateExitMatchResult,nil, info,false);
end

--@brief 通知进入比赛
GameMatchHallController.onTimeToEnterMatch = function (self, data) 
	self:updateView(GameMatchHallScene.s_cmds.ShowEnterMatchDlg, data);
end

--@brief 支付到账回调
GameMatchHallController.onBroadcastPayMoney = function(self, broadType)
    self:updateView(GameMatchHallScene.s_cmds.onBroadcastPayMoney, broadType);
end

GameMatchHallController.onInvitationalMyApplyLists = function(self, isSuccess, info)
	self:updateView(GameMatchHallScene.s_cmds.onInvitationalMyApplyLists, isSuccess, info)
end

GameMatchHallController.onMatchReconnected = function(self,data)
	OnlineSocketManager.getInstance():reopenSocket();
end

GameMatchHallController.onChangeToOtherState = function(self, state, ...)
	self.m_state:changeState(state, ...);
end

GameMatchHallController.s_cmdConfig = {
	[GameMatchHallController.s_cmds.requestMatchList]	= GameMatchHallController.requestMatchList; -- 请求比赛列表
	[GameMatchHallController.s_cmds.signupMatch]			= GameMatchHallController.doSignupMatch; -- 报名
 	[GameMatchHallController.s_cmds.backToHall]				= GameMatchHallController.onBackPressed;
	[GameMatchHallController.s_cmds.requestMatchDetail]		= GameMatchHallController.requestMatchDetail; -- 请求比赛详情
	[GameMatchHallController.s_cmds.requestExitMatch]		= GameMatchHallController.requestExitMatch; -- 请求退出比赛
	[GameMatchHallController.s_cmds.onChangeToOtherState] 	= GameMatchHallController.onChangeToOtherState;
}