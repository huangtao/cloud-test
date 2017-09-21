require("games/common2/mechine/mechineManage");

require("games/common2/match/matchMechine/matchMechine");
require("games/common2/match/socket/matchSocketCmd");
require("games/common2/match/socket/matchSocketReader");
require("games/common2/match/socket/matchSocketWriter");
require("games/common2/match/socket/matchSocketProcesser");

--此处的比赛房间只是一个插件，不能单独使用，只有与游戏房间合并后才是完整的比赛房间
--此处比赛房间里不能有与公共房间、游戏房间相同方法名的方法，包括ctor、dtor，否则会覆盖原来的方法
MatchController = class();

MatchController.TYPE_MATCH_START_TIMER = ToolKit.getIndex(); --开赛定时器
MatchController.initMatchRoom = function(self)
    MatchIsolater.getInstance():setObserver(self);

    self:_addMatchSocketTools();
    self:_registerMatchNotify();
    self:updateView(MatchScene.s_cmds.InitMatchRoom);

    self:_joinMatchRoom();
end

MatchController.releaseMatchRoom = function(self)
    MatchIsolater.getInstance():clearObserver(self);
    GameTimer2.release(MatchController.TYPE_MATCH_START_TIMER);

    self:_unregisterMatchNotify();
    self:_removeMatchSocketTools();
    MatchMechine.releaseInstance();
    self:updateView(MatchScene.s_cmds.ReleaseMatchRoom);
end
--------------------------------------------------------------------------
MatchController.checkIsNeedJumpToView = function(self)
    local viewName,viewParam = self:getViewJumpParams();
    if viewParam[1] then 
        MatchIsolater.getInstance():setMatchData(viewParam[1]);
    end

    if viewName == MatchMechineConfig.VIEW_OVER then 
        self:jumpToMatchOver(viewParam[2]);
        return true;

    elseif viewName == MatchMechineConfig.VIEW_ROUNDOVER then 
        local gameType = GameConstant.MATCH_RECONNECT_INGAME;
        GameInfoIsolater.getInstance():setCurGameType(gameType);

    end 

    return false;
end

MatchController.jumpToMatchOver = function(self,info)
    local action = MatchMechineConfig.ACTION_RESET;
    MatchMechine.getInstance():receiveAction(action,nil,true,"MatchController.jumpToMatchOver");

    local data = {
        viewName = MatchMechineConfig.VIEW_RANK_REWARD,
    };
    self:onCreateMatchViews(nil,nil,data);
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_REQUEST_RANK_DETAIL);

    local action = MatchMechineConfig.ACTION_SIGNUP_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,nil,true,"MatchController.jumpToMatchOver");

    local action = MatchMechineConfig.ACTION_START;
    MatchMechine.getInstance():receiveAction(action,nil,true,"MatchController.jumpToMatchOver");

    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"MatchController.jumpToMatchOver");

    local action = MatchMechineConfig.ACTION_FINISH;
    MatchMechine.getInstance():receiveAction(action,nil,true,"MatchController.jumpToMatchOver");

    local action = MatchMechineConfig.ACTION_FINISH_REWARD;
    MatchMechine.getInstance():receiveAction(action,info,true,"MatchController.jumpToMatchOver");
end
--------------------------------------------------------------------------
MatchController._addMatchSocketTools = function(self)
    -- self.m_socket = SocketIsolater.getInstance();

    -- self.m_matchSocketReader = new(MatchSocketReader); 
    -- self.m_socket:addSocketReader(self.m_matchSocketReader);

    -- self.m_matchSocketWriter = new(MatchSocketWriter); 
    -- self.m_socket:addSocketWriter(self.m_matchSocketWriter);

    self.m_matchSocketProcesser = new(MatchSocketProcesser,self);
end

MatchController._removeMatchSocketTools = function(self)
    -- self.m_socket:removeSocketReader(self.m_matchSocketReader);
    -- self.m_socket:removeSocketWriter(self.m_matchSocketWriter);

    -- delete(self.m_matchSocketReader);
    -- self.m_matchSocketReader = nil;
    -- delete(self.m_matchSocketWriter);
    -- self.m_matchSocketWriter = nil;
    delete(self.m_matchSocketProcesser);
    self.m_matchSocketProcesser = nil;
end

MatchController._registerMatchNotify = function(self)
    EventDispatcher.getInstance():register(MatchMechineConfig.NOTIFY_STATUS,self,self._onMatchStateChange);
    EventDispatcher.getInstance():register(MatchMechineConfig.NOTIFY_ACTION,self,self._monitoringMatchAction);

    EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_STATE,self,self._onGameStateChange);
end

MatchController._unregisterMatchNotify = function(self)
    EventDispatcher.getInstance():unregister(MatchMechineConfig.NOTIFY_STATUS,self,self._onMatchStateChange);
    EventDispatcher.getInstance():unregister(MatchMechineConfig.NOTIFY_ACTION,self,self._monitoringMatchAction);
    EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_STATE,self,self._onGameStateChange);
end

MatchController._onGameStateChange = function(self,curstate,laststate,action,seatid,uid,info,isFast)
    Log.d("MatchController"," _onGameStateChange "," curstate = ",curstate," laststate = ",laststate);
    
    if curstate == GameMechineConfig.STATUS_LOGIN then 
        GameTimer2.release(MatchController.TYPE_MATCH_START_TIMER);
    end 
end

MatchController._onMatchStateChange = function(self,curState,lastState,action,seat,uid,info,isFast)
    Log.d("MatchController"," _onMatchStateChange "," curstate = ",curState," laststate = ",lastState);
    self.m_curMatchState = curState;
    self.m_lastMatchState = lastState;

    self:_monitoringMatchAction(action,seat,uid,info,isFast);
end

MatchController._monitoringMatchAction = function(self,action,seat,uid,info,isFast)
    if self.s_matchActionFuncMap and type(self.s_matchActionFuncMap[action])=="function" then
        self.s_matchActionFuncMap[action](self,seat,uid,info,isFast);
    end
end
----------------------------------------------------------------------
MatchController._matchJumpToOnlooker = function(self)
    local curGameType = GameInfoIsolater.getInstance():getCurGameType();
    local gameId = GameInfoIsolater.getInstance():getCurGameId();  
    local viewName,viewParam;      
    if curGameType == GameConstant.MATCH_RECONNECT  
        or curGameType == GameConstant.MATCH_RECONNECT_INGAME --比赛重连
        or curGameType == GameConstant.NORMAL_IMMEDIATE_MATCH 
        or curGameType == GameConstant.FIXED_TIME_MATCH then --正常进入比赛房间 
        viewName = MatchMechineConfig.VIEW_ROUNDOVER;
        viewParam = {
            MatchIsolater.getInstance():getMatchData();
        };
    else 
        gameId = GameInfoIsolater.getInstance():getHallGameType();
    end 

    local _,data = self.m_state:getBundleData();
    data = table.verify(data);       
    local info = {};
    info.userId = data.userId;
    info.gameId = gameId;
    info.viewName = viewName;
    info.viewParam = viewParam;
    self:onRequestEnterOnlooker(nil,nil,info);
end

MatchController._joinMatchRoom = function(self)
    self.m_curMatchState = MatchMechineConfig.STATUS_NONE;

    if self:checkIsNeedJumpToView() then 
        return;
    end 

    if self:checkIsNeedEnterOnlookerRoom() then 
        self:_matchJumpToOnlooker();
        return; 
    end 

    local curGameType = GameInfoIsolater.getInstance():getCurGameType();    
    if curGameType == GameConstant.NORMAL_IMMEDIATE_MATCH 
        or curGameType == GameConstant.FIXED_TIME_MATCH then--正常进入比赛房间
        Log.a(GameMatchConfig.matchLogFileName,"MatchController._joinMatchRoom","正常进入比赛房间");

        local action = MatchMechineConfig.ACTION_SIGNUP_SUCCESS;
        MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchController._joinMatchRoom");

    elseif curGameType == GameConstant.MATCH_RECONNECT then -- 未开赛时的比赛重连
        GameInfoIsolater.getInstance():setCurGameType(GameConstant.NORMAL_IMMEDIATE_MATCH);

        Log.a(GameMatchConfig.matchLogFileName,"MatchController._joinMatchRoom","未开赛时的比赛重连");
        self:_sighUpMatch();

    elseif curGameType == GameConstant.MATCH_RECONNECT_INGAME then-- 比赛游戏中重连
        Log.a(GameMatchConfig.matchLogFileName,"MatchController._joinMatchRoom","比赛游戏中重连");
        self:reconnectMatchInGame();
        GameTimer2.startTimeOut(MatchController.TYPE_MATCH_START_TIMER, self, self.onMatchTimerOut, 15 * 1000); 
    else 
        
        self:onExitMatchSuccess();
    end
end

MatchController._sighUpMatch = function(self, gameId)
    local action = MatchMechineConfig.ACTION_RECONNECT;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchController._sighUpMatch");

    Log.a(GameMatchConfig.matchLogFileName,"MatchController._sighUpMatch","send 0x0B61");
    local djInfo = MatchIsolater.getInstance():getMatchData();
    local data = {};
    data.id = djInfo.id or 0;
    data.gameId = gameId or GameInfoIsolater.getInstance():getCurGameId();
    MatchIsolater.getInstance():signupMatch(data);

    self:requestMatchInfo();
end
----------------------------------------------------------------------
--重写比赛房间中返回键的处理
MatchController.onBackPressed = function(self)
    if IBaseDialog.isDialogShowing() then
        IBaseDialog.onBackHidden();
        return;
    end
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.onBackPressed");

    if not self.m_curMatchState then 
        self:onExitMatchSuccess();

    elseif self.m_curMatchState == MatchMechineConfig.STATUS_NONE then 
        self:onExitMatchSuccess();

    elseif self.m_curMatchState == MatchMechineConfig.STATUS_LOADING then  
        MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_REQUEST_EXIT,nil,nil,"MatchController.onBackPressed");

    elseif self.m_curMatchState == MatchMechineConfig.STATUS_PLAYING then 
    elseif self.m_curMatchState == MatchMechineConfig.STATUS_WAITING then 
        local _,_,curSubState = MatchMechine.getInstance():getStates();
        if curSubState == MatchMechineConfig.STATUS_WAITING_ROUNDOVER then
            MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_REQUEST_EXIT,nil,nil,"MatchController.onBackPressed");
        end
    elseif self.m_curMatchState == MatchMechineConfig.STATUS_FINISH then 
        self:onExitMatchSuccess();
    end     
end
----------------------------------------------------------------------
-- MatchIsolater deglete
MatchController.onResponseMatchBasicInfo = function(self,data)
    if not data then return end
    data.name = data.mname;
    local matchData = MatchIsolater.getInstance():getMatchData();
    matchData = data;
    MatchIsolater.getInstance():setMatchData(matchData);
end
--------------------------------------------------------------------
MatchController.resetMacthInfo = function(self)
    local data = MatchIsolater.getInstance():getMatchData();
    if not table.isEmpty(data) then
        MatchIsolater.getInstance():cleanMatchDetailByMatchId(data.id); --清空比赛奖励
    end
    
    MatchIsolater.getInstance():setSignMatchId(nil);
    GameInfoIsolater.getInstance():setCurRoomLevelId(nil);
    GameInfoIsolater.getInstance():setGameToWhereState(States.GameMatchHall);
end

--离开比赛房间,直接退出都可不发1002
-- 从比赛房间离开几种情况：
-- 1. 退赛，赛前或赛间才可退赛，不在真正的游戏房间中
-- 2. 比赛异常收到0xb0c，不管什么状态一定要退出
-- 3. 比赛结束，已不在真正的游戏房间中
-- 4. 报名错误时，不在真正的游戏房间中
MatchController.onExitMatchSuccess = function(self)
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.onExitMatchSuccess");
    self:resetMacthInfo();
   
    MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_FORCE_EXIT,nil,nil,nil,"MatchController.onExitMatchSuccess");
end

-- 强制退出比赛
MatchController.onForceExitMatch = function(self)
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.onForceExitMatch");
    self:resetMacthInfo();
    MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_FORCE_EXIT,nil,nil,nil,"MatchController.onForceExitMatch");
end

MatchController.onReconnectMatchInGame = function(self,seat,uid,info,isFast)
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.onReconnectMatchInGame");
    info = table.verify(info);
    self:reconnectMatchInGame(info.gameId);
end

-- 收到比赛开始，起一个超时定时器，检测具体游戏是否开始，超时则重连游戏
MatchController.onStartMatch = function(self,seat,uid,info,isFast)
    if not isFast then 
        GameTimer2.startTimeOut(MatchController.TYPE_MATCH_START_TIMER, self, self.onMatchTimerOut, 15 * 1000); 
        MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_CLEAR_TABLE,nil,nil,nil,"MatchController.onStartMatch");
    end    
end

MatchController.onMatchTimerOut = function(self,id)
    GameTimer2.release(id);
    if id == MatchController.TYPE_MATCH_START_TIMER then 
        Log.a(GameMatchConfig.matchLogFileName,"MatchController.onMatchTimerOut");

        self:reconnectMatchInGame();--相当于比赛开始但没收到具体游戏开始的信息
    end 
end

MatchController.onCreateMatchViews = function(self,seat,uid,info,isFast)
    self:updateView(MatchScene.s_cmds.CreateMatchViews,info,isFast);
end

MatchController.onMatchStartFail = function(self,seat,uid,info,isFast)
    GameTimer2.release(MatchController.TYPE_MATCH_START_TIMER);
end 

MatchController.onReleaseMatchViews = function(self,seat,uid,info,isFast)
    self:updateView(MatchScene.s_cmds.ReleaseMatchViews,info,isFast);
end

--------------------------------------------------------------------
--断网后重连
MatchController.startReconnect = function(self)
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.startReconnect","self.m_curMatchState = ",self.m_curMatchState);
    if (not self.m_curMatchState) 
        or self.m_curMatchState == MatchMechineConfig.STATUS_NONE 
        or self.m_curMatchState == MatchMechineConfig.STATUS_FINISH then 

    elseif self.m_curMatchState == MatchMechineConfig.STATUS_PLAYING then 
        self:reconnectMatchInGame();

    elseif self.m_curMatchState == MatchMechineConfig.STATUS_WAITING then 
        local _,_,curSubState = MatchMechine.getInstance():getStates();
        if curSubState == MatchMechineConfig.STATUS_WAITING_FINISH then --已确认淘汰时不再重连
        else
            self:_sighUpMatch(); 
        end 
    else
        self:_sighUpMatch();
    end 
end

MatchController.reconnectMatchInGame = function(self,gameId)
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.reconnectMatchInGame");
    self:_sighUpMatch(gameId);
    -- MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_OFFLINE_RECONNECT_GAME,nil,nil,nil,"MatchController.reconnectMatchInGame");
end

MatchController.requestMatchInfo = function(self)
    Log.a(GameMatchConfig.matchLogFileName,"MatchController.requestMatchInfo");

    local data = MatchIsolater.getInstance():getMatchData();
    MatchIsolater.getInstance():requestMatchBasicInfo(data.id);

    local param = {userId = UserBaseInfoIsolater.getInstance():getUserId()};
    local curState = MatchMechine.getInstance():getStates();
    if curState == MatchMechineConfig.STATUS_ONLOOKER then 
        param.userId = GameRoomData.getInstance():getInfoByType("onlookerId");
    end
    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_GROUP_INFO_REQUEST, param);
end

MatchController.s_matchActionFuncMap = {
    [MatchMechineConfig.ACTION_EXIT_SUCCESS]                = MatchController.onExitMatchSuccess;
    [MatchMechineConfig.ACTION_NS_FORCE_EXIT]               = MatchController.onForceExitMatch;
    [MatchMechineConfig.ACTION_REQUEST_RECONNECT_INGAME]    = MatchController.onReconnectMatchInGame;
    [MatchMechineConfig.ACTION_START]                       = MatchController.onStartMatch;
    [MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS]          = MatchController.onCreateMatchViews;
    [MatchMechineConfig.ACTION_NS_SHOW_FAIL_TIPS]           = MatchController.onMatchStartFail;
    [MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS]         = MatchController.onReleaseMatchViews;
};
--------------------------------------------------------------------
