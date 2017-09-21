require("games/common2/match/matchMechine/matchMechine");
require("games/common2/match/socket/matchSocketCmd");
require("games/common2/mechine/mechineManage");

MatchSocketProcesser = class(SocketHandlerBase);

MatchSocketProcesser.ctor = function(self)
    MatchIsolater.getInstance():setObserver(self);
end

MatchSocketProcesser.dtor = function(self)
    MatchIsolater.getInstance():clearObserver(self);
end

--b07
MatchSocketProcesser.onSignupMatchSuccess = function(self,info)
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP, info);
    return true;
end
MatchSocketProcesser.onHandleSignupMatchSuccess = function(self,info,packetInfoId)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onSignupMatchSuccess","0x0b07");

    local action = MatchMechineConfig.ACTION_RESET;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"onSignupMatchSuccess");

    local action = MatchMechineConfig.ACTION_SIGNUP_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onSignupMatchSuccess");

    local data = {};
    data.num = info.num;
    data.totalNum = info.totalNum;
    data.matchpartitions = info.matchpartitions;
    local action = MatchMechineConfig.ACTION_GET_PLAYER_COUNT;
    MatchMechine.getInstance():receiveAction(action,data,nil,"onSignupMatchSuccess");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b05
MatchSocketProcesser.onSignupMatchFailed = function(self,info)
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP_FAIL, info);
    return true;
end

MatchSocketProcesser.FATAL_ERROR = 0;          --服务器内部异常
MatchSocketProcesser.MATCH_NOT_EXSITS = 1; --比赛信息错误
MatchSocketProcesser.NOT_ENOUGH_ENTRY_FEE = 2; --银币小于报名费用
MatchSocketProcesser.MATH_IS_PLAYING = 3;      --比赛已经开始且不属于重连
MatchSocketProcesser.ALREADY_SIGN_UP = 4;      --玩家已經報名
MatchSocketProcesser.NOT_REACH_TIME = 5; -- 没到时间
MatchSocketProcesser.SIGN_UP_ERROR = 6; -- 收到该错误码时，啥都不用处理
MatchSocketProcesser.MATCH_OVER_MAX_USER = 7; -- 超过比赛报名最大人数
MatchSocketProcesser.onHandleSignupMatchFailed = function(self,info,packetInfoId)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onSignupMatchFailed","0x0b05");

    local code = info.code;
    local gameId = info.gameId;
    local matchId = info.matchId; 

    local action = MatchMechineConfig.ACTION_RESET;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"onSignupMatchFailed");

    if code == MatchSocketProcesser.ALREADY_SIGN_UP then --已经报名
        local action = MatchMechineConfig.ACTION_SIGNUP_SUCCESS;
        MatchMechine.getInstance():receiveAction(action,nil,nil,"onSignupMatchFailed");

    else 
        local action = MatchMechineConfig.ACTION_EXIT_SUCCESS;
        MatchMechine.getInstance():receiveAction(action,nil,nil,"onSignupMatchFailed");
    end 
    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b08
MatchSocketProcesser.onExitMatchSuccess = function(self,info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onExitMatchSuccess","0x0b08");

    local action = MatchMechineConfig.ACTION_EXIT_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onExitMatchSuccess");
end

--b06
MatchSocketProcesser.onExitMatchFailed = function(self,info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onExitMatchFailed","0x0b06");
    Toast.setDefaultDisplayTime(3000);
    local errorType = info.errorType;
    local action = MatchMechineConfig.ACTION_EXIT_FAIL;
    if errorType == 1 -- 该玩家未报名或者已经被淘汰    退出成功  （不退报名费）
        or errorType == 2 -- 其他错误原因，退出成功（不退还报名费）
        or errorType == 3 then -- 用户不存在
        action = MatchMechineConfig.ACTION_NS_FORCE_EXIT;

    elseif errorType == 0 then -- 游戏已经开始，而且该玩家处于比赛中   退出失败
        self:showToast(kTextNotAllowQuitMatch, nil, 70);
        if info.gameId > 0 and info.matchId > 0 then
            -- 此时是在游戏中并且重连
            GameInfoIsolater.getInstance():setCurGameType(GameConstant.MATCH_RECONNECT_INGAME);
            local data = table.verify(MatchIsolater.getInstance():getMatchData());
            if data.gameid == info.gameId then --同一个游戏的比赛直接重连
                if data.id == info.realMatchId then --同一场比赛不再重连
                elseif data.id ~= info.realMatchId then --比赛Id不同则重连
                    data.id = info.realMatchId;
                    MatchIsolater.getInstance():setMatchData(data);
                    action = MatchMechineConfig.ACTION_REQUEST_RECONNECT_INGAME;
                end 

            else--不同游戏的比赛,退出当前比赛场
                
                action = MatchMechineConfig.ACTION_EXIT_SUCCESS;
            end
        end
    elseif errorType == 4 then 
        self:showToast("比赛即将开始，不允许退赛.", nil, 70);
    end  
    Toast.setDefaultDisplayTime();
    MatchMechine.getInstance():receiveAction(action,info,nil,"onExitMatchFailed"); 
end

--b43 定时赛报名成功（可入场前的成功）
MatchSocketProcesser.onUpdateMatchState = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onUpdateMatchState","0x0b43");

    local action = MatchMechineConfig.ACTION_SIGNUP_XIANSHI_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onUpdateMatchState");
end

----------------------------------------------------------------------------
--b04
MatchSocketProcesser.onResponseUpdatePeoleCount = function(self, info)
    local action = MatchMechineConfig.ACTION_GET_PLAYER_COUNT;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onResponseUpdatePeoleCount");
    return true;
end

--b55
-- 广播等待聊天信息
MatchSocketProcesser.onServerSendMsg = function(self, info)
    if not info or not info.msgInfo then 
        return; 
    end
    local jsonTable = json.decode(info.msgInfo);
    if table.isEmpty(jsonTable) then 
        return;
    end
    local action = MatchMechineConfig.ACTION_GET_CHAT_MSG;
    MatchMechine.getInstance():receiveAction(action,jsonTable,nil,"onServerSendMsg");
    return true;
end

--b58
--禁言推送
MatchSocketProcesser.onServerShutup = function(self,info)
    if not info or not info.msgInfo then
        return;
    end
    
    info.sendFlag = -1;
    local action = MatchMechineConfig.ACTION_GET_CHAT_MSG;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onServerShutup");
end

--b11
MatchSocketProcesser.onResponseMatchDingJuMatchStart = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseMatchDingJuMatchStart","0x0b11");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_MATCH_START_RESPONSE, info);
    return true;
end
MatchSocketProcesser.onMatchStart = function(self, info, packetInfoId)
    MatchIsolater.getInstance():setIsJustStart(true);
    MatchIsolater.getInstance():setLastConnectInMatch(true);

    local param = {userId = UserBaseInfoIsolater.getInstance():getUserId()};
    local curState = MatchMechine.getInstance():getStates();
    if curState == MatchMechineConfig.STATUS_ONLOOKER then 
        param.userId = GameRoomData.getInstance():getInfoByType("onlookerId");
    end
    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_GROUP_INFO_REQUEST, param);

    local action = MatchMechineConfig.ACTION_ANIM_MATCH_START;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"onMatchStart");

    local action = MatchMechineConfig.ACTION_START;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onMatchStart");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);

    return true;
end 

--b17
MatchSocketProcesser.onResponseMatchDingJuMatchContinue = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseMatchDingJuMatchContinue","0x0b17");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_MATCH_CONTINUE_RESPONSE, info);
    return true;
end
MatchSocketProcesser.onMatchContonue = function(self, info, packetInfoId)
    self.m_isJustStart = true;
    MatchIsolater.getInstance():setIsJustStart(true);

    local action = MatchMechineConfig.ACTION_START;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onMatchContonue");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);

    return true;
end 

--b66
MatchSocketProcesser.onServerBroadcastPlayerScore = function(self, info)
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.BROADCAST_PLAYER_SCORE, info);
    return true;
end
-- 广播玩家积分，比赛时用
MatchSocketProcesser.onGetPlayerScore = function ( self, info,packetInfoId )
    MatchIsolater.getInstance():setMatchScoreInfo(info);

    local action = MatchMechineConfig.ACTION_GET_PLAYER_SCORE;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onGetPlayerScore");

    local action = GameMechineConfig.ACTION_NS_MATCH_SCORE;
    MechineManage.getInstance():receiveAction(action,nil,-1,nil,"MatchSocketProcesser.onGetPlayerScore");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b68
MatchSocketProcesser.onBroadcastMatchStageInfo = function ( self, info )
    MatchIsolater.getInstance():setMatchStageInfo(info);
    return true;
end

--b50
MatchSocketProcesser.onGetMatchBaseChipInfo = function(self, info,packetInfoId)

    local action = MatchMechineConfig.ACTION_GET_BASECHIP_INFO;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onGetMatchBaseChipInfo");
    return true;
end

--b47
MatchSocketProcesser.onGetTableInfo = function(self, info)
    local action = MatchMechineConfig.ACTION_GET_TABLE_INFO;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onGetTableInfo");
    return true;
end

--b49
MatchSocketProcesser.onResponseDingshiWaitTable = function ( self, info )
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseDingshiWaitTable","0x0b49");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_WAIT_TABLE, info);
    return true;
end
MatchSocketProcesser.onWaitMatchTable = function ( self, info,packetInfoId)
    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onWaitMatchTable");

    local action = MatchMechineConfig.ACTION_WAIT_TABLE;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onWaitMatchTable");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b51
MatchSocketProcesser.onResponseDingshiUserPromotion = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseDingshiUserPromotion","0x0b51");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGSHI_ROOM_USER_PROMOTION, info);

    return true;
end
MatchSocketProcesser.onMatchPromotion = function(self, info,packetInfoId)
    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchPromotion");

    local action = MatchMechineConfig.ACTION_ROUND_OVER;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onMatchPromotion");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b13
MatchSocketProcesser.onResponseMatchDingJuRoundOver = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseMatchDingJuRoundOver","0x0b13");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_ROUND_OVER_RESPONSE, info);
    return true;
end
MatchSocketProcesser.onMatchRoundOver = function(self, info,packetInfoId)
    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchRoundOver");

    local action = MatchMechineConfig.ACTION_ROUND_OVER;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onMatchRoundOver");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b16
MatchSocketProcesser.onResponseMatchDingJuInfo = function(self, info)
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_ROOM_INFO_RESPONSE, info);
    return true;
end 
MatchSocketProcesser.onGetMatchInfo = function(self, info,packetInfoId)
     local data = {};
    data.stage = info.stage; -- 阶段 1:打立出局 2:定局移位 3:定局积分
    data.roundNum = info.roundNum;-- 当前轮数
    data.roundCount = info.roundCount;-- 总轮数
    data.bureauNum = info.bureauNum;-- 当前局数
    data.bureauCount = info.bureauCount;-- 总局数
    local action = MatchMechineConfig.ACTION_GET_STAGE_INFO;
    MatchMechine.getInstance():receiveAction(action,data,nil,"onGetMatchInfo");

    local matchType = GameInfoIsolater.getInstance():getCurGameType();
    if self.m_isJustStart 
        and (data.stage == 2 or data.stage == 3) --2:定局移位 3:定局积分
        and (data.bureauNum == 1) then --每轮的第1局
        if data.roundNum == data.roundCount then --最后一轮
            local action = MatchMechineConfig.ACTION_ANIM_MATCH_JUESAI;
            MatchMechine.getInstance():receiveAction(action,nil,nil,"onGetMatchInfo");

        elseif data.roundNum < data.roundCount then 
            local action = MatchMechineConfig.ACTION_ANIM_MATCH_FUSAI;
            MatchMechine.getInstance():receiveAction(action,nil,nil,"onGetMatchInfo");

        end 
    end
    self.m_isJustStart = nil;
    
    local temp = {};
    temp.curPos = info.curPos;
    temp.totalNum = info.totalNum;
    
    local action = MatchMechineConfig.ACTION_GET_TABLE_INFO;
    MatchMechine.getInstance():receiveAction(action,temp,nil,"onGetMatchInfo");

    MatchIsolater.getInstance():setMatchScoreInfo(info.userList);

    local action = MatchMechineConfig.ACTION_GET_PLAYER_SCORE;
    MatchMechine.getInstance():receiveAction(action,info.userList,nil,"onGetMatchInfo");

    local action = GameMechineConfig.ACTION_NS_MATCH_SCORE;
    MechineManage.getInstance():receiveAction(action,nil,-1,nil,"MatchSocketProcesser.onGetMatchInfo");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b12(所有人都已打完比赛)
MatchSocketProcesser.onResponseMatchDingJuMatchOver = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseMatchDingJuMatchOver","0x0b12");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_RESPONSE, info);
    return true;
end
MatchSocketProcesser.onMatchOver = function(self, info,packetInfoId)
    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchOver");

    local action = MatchMechineConfig.ACTION_FINISH;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onMatchOver");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b18
MatchSocketProcesser.onResponseMatchDingJuMatchOverReward = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseMatchDingJuMatchOverReward","0x0b18");

    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_REWARD, info);
    return true;
end
MatchSocketProcesser.onMatchOverReward = function(self, info,packetInfoId)
    MatchIsolater.getInstance():setLastConnectInMatch(false);

    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchOverReward");
    
    local propList = table.verify(info.propList);
    for k, v in ipairs(info.propList) do
        PropIsolater.getInstance():updatePropNum(v.type, v.count);
    end

    self:_checkReviveAndMatchOverData(info);

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end
------------------------------------ 定局赛开始 ------------------------------------------------
MatchSocketProcesser.showToast = function(self,msg,x,y)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110,x,y);
    end
end

--b0c
-- 长时间未开始游戏被踢
-- flag参数：
-- WAIT_LONG_TIME               = 1,        //长时间未开始游戏
-- MATCH_START_ERROR            = 2,        //比赛开始异常
-- MATCH_CONTINUE_ERROR         = 3,        //比赛继续异常
-- MATCH_LONG_TIME_NOT_END      = 4,        //比赛长时间未结束
-- UNKOWN_REASON                = 5,        //未知原因
-- SIGN_UP_ENOUGH_COUNT         = 6,        //报名人数不足
MatchSocketProcesser.onResponseDingJuSaiKickUser = function(self, info)
    local curState = MatchMechine.getInstance():getStates();
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseDingJuSaiKickUser","0x0b0c","info = ",info,"curState = ",curState);
    
    -- 更新银币数
    UserPropertyIsolater.getInstance():setMoney(info.money or 0);
    -- 更新道具数量
    for k, v in ipairs(info.propList or {}) do 
        if v and (v.propType ~= 1 and v.propType ~= 2 and v.propType ~= 1000) then
            PropIsolater.getInstance():updatePropNum(v.propType, v.propNum);
        end
    end

    local userInfo = info.userInfo;
    if not table.isEmpty(userInfo) then
        local diamond = number.valueOf(userInfo.diamond, -1);
        local cystal = number.valueOf(userInfo.silver, -1);

        if diamond >= 0 then
            UserPropertyIsolater.getInstance():setDiamond(diamond);
        end

        if cystal >= 0 then
            UserPropertyIsolater.getInstance():setCrystal(cystal);
        end

        -- 道具
    end

    local matchData = table.verify(MatchIsolater.getInstance():getMatchData());
    if matchData.id and info.matchId and info.matchId > 0 and info.matchId ~= number.valueOf(matchData.id) then
        Log.d(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onResponseDingJuSaiKickUser","matchData.id = ",matchData.id,"info.matchId = ",info.matchId);
        return true;
    end 

    if info.flag == 6 and curState ~= MatchMechineConfig.STATUS_LOADING then 
        return true;
    end 

    local action = MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS;
    local info = {};
    info.viewName = MatchMechineConfig.VIEW_FAIL_TIPS;
    MatchMechine.getInstance():receiveAction(action,info);

    local msg = nil;
    if info.flag == 1 then
        msg = "长时间未开始比赛，比赛无法开始，请重新报名";
    elseif  info.flag == 2 then
        msg = "由于系统问题，比赛无法开始，请重新报名";
    elseif info.flag == 3 or info.flag == 4 or info.flag == 5 then 
        msg = "比赛异常，无法继续游戏，请重新报名";
    end

    if matchData and (not matchData.fee or #matchData.fee == 0) then
        msg = msg or "由于报名人数不足,比赛已经取消,请选择其他比赛报名。";
    else
        msg = msg or kTextApplyLessPlayerAndrefund;
    end

    local data = {};
    data.msg = msg;
    data.errorType = info.flag;
    data.matchId = info.matchId;

    local action = MatchMechineConfig.ACTION_NS_SHOW_FAIL_TIPS;
    MatchMechine.getInstance():receiveAction(action,data,nil,"onResponseDingJuSaiKickUser");
    return true;
end

MatchSocketProcesser.onMatchReconnected = function(self,info)
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_DINGJU_MATCH_RECONNECT_RESPONSE, info);
    return true;
end

--b09 
MatchSocketProcesser.onHandleMatchReconnected = function(self, info,packetInfoId)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onMatchReconnected","0x0b09");
    local gameId = info.gameId;
    local matchId = info.matchId;
    local matchData = table.verify(MatchIsolater.getInstance():getMatchData());
    matchData.id = info.readMatchId or matchData.id;
    MatchIsolater.getInstance():setMatchData(matchData);

    if gameId > 0 and matchId > 0 then 
        if info.gameType and info.gameType >= 0 then
            GameInfoIsolater.getInstance():setCurGameType(info.gameType);
            if info.gameType == GameConstant.FIXED_TIME_MATCH then 
                GameInfoIsolater.getInstance():setCurRoomLevelId(700)
            else 
                GameInfoIsolater.getInstance():setCurRoomLevelId(500)
            end
        end
    end

    local action = MatchMechineConfig.ACTION_RESET;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchReconnected");

    local action = MatchMechineConfig.ACTION_SIGNUP_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchReconnected");

    local action = MatchMechineConfig.ACTION_START;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onMatchReconnected");

    if number.valueOf(info.isPlayIng) == 1 then
        -- 比赛中，需要重连
        MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_OFFLINE_RECONNECT_GAME,nil,nil,nil,"MatchSocketProcesser.onMatchReconnected");
    end

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b48
MatchSocketProcesser.onGetDingshiStagePos = function(self, info)
    local action = MatchMechineConfig.ACTION_GET_STAGE_POS;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onGetDingshiStagePos");
    return true;
end

--b71
MatchSocketProcesser.onReviveNotify = function(self, info)
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onReviveNotify","0x0b71");
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_REVIVE_NOTIFY, info);
    return true;
end
MatchSocketProcesser.onGetReviveNotify = function(self, info,packetInfoId)
    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onGetReviveNotify");

    local action = MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS;
    local temp = {viewName = MatchMechineConfig.VIEW_REVIVE};
    MatchMechine.getInstance():receiveAction(action,temp,nil,"onGetReviveNotify");

    self.m_reviveNotifyInfo = info;

    local temp = {};
    temp.reviveType = 1;--复活类型：1--可复活,2--不可复活
    temp.data = info;
    local action = MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY;
    MatchMechine.getInstance():receiveAction(action,temp,nil,"onGetReviveNotify");

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end

--b73
MatchSocketProcesser.onReviveResponse = function(self, info) 
    Log.a(GameMatchConfig.matchLogFileName,"MatchSocketProcesser.onReviveResponse","0x0b73");
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.MATCH_REVIVE_RESPONSE, info);

    return true;
end 
-- ret: 0(复活成功),1(复活卡不足),2(复活人数限制),3(复活数量限制),4(用户是离线状态),10(其他错误)
MatchSocketProcesser.onGetReviveResponse = function(self, info,packetInfoId)  
    self.m_reviveResponseInfo = info;
    
    local action = MatchMechineConfig.ACTION_GAME_OVER;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onGetReviveResponse");

    if info.ret == 0 then -- 复活成功
        self:showToast(string.format("恭喜您复活成功，获得%s积分", info.score));

        local action = MatchMechineConfig.ACTION_REVIVE_SUCCESS;
        MatchMechine.getInstance():receiveAction(action,nil,nil,"onGetReviveResponse");

        --复活成功后，2s未配桌成功再显示配桌等待
        -- local action = MatchMechineConfig.ACTION_WAIT_TABLE;
        -- MatchMechine.getInstance():receiveAction(action,nil,nil,"onGetReviveResponse");
        
        local data = {};
        data.mid = UserBaseInfoIsolater.getInstance():getUserId();
        data.score = info.score;
        local action = MatchMechineConfig.ACTION_GET_PLAYER_SCORE;
        MatchMechine.getInstance():receiveAction(action,{data},nil,"onGetReviveResponse");

        local data = {};
        data.curPos = info.rank;
        data.totalNum = info.total;
        local action = MatchMechineConfig.ACTION_GET_TABLE_INFO;
        MatchMechine.getInstance():receiveAction(action,data,nil,"onGetReviveResponse");

        -- 扣除复活卡
        if not table.isEmpty(self.m_reviveNotifyInfo) then
            for k, v in ipairs(self.m_reviveNotifyInfo.prop_list) do
                if v.prop_type and v.need_count and info.prop_type == v.prop_type then
                    if v.prop_type == UserPropertyIsolater.getInstance():getPropertyGoldBarID() or 
                        v.prop_type == UserPropertyIsolater.getInstance():getPropertySilverCoinID()  or 
                        v.prop_type == UserPropertyIsolater.getInstance():getPropertyDiamondID()  then
                        local num = UserPropertyIsolater.getInstance():getMoneyById(v.prop_type);
                        UserPropertyIsolater.getInstance():setMoneyById(v.prop_type, num - v.need_count);
                        
                    else
                        local propNum = PropIsolater.getInstance():getPropNumByPropType(v.prop_type);
                        PropIsolater.getInstance():updatePropNum(v.prop_type, propNum - v.need_count);
                    end
                end
            end
        end

        self:_cleanLocalReviveData();
    else 
        local action = MatchMechineConfig.ACTION_REVIVE_FAILED;
        MatchMechine.getInstance():receiveAction(action,info,nil,"onGetReviveResponse");
    end

    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);

    return true;
end

-- 被淘汰时判断淘汰类型
MatchSocketProcesser._checkReviveAndMatchOverData = function(self,matchOverData)
    local stateNotify = table.isEmpty(self.m_reviveNotifyInfo) and 0 or 1;
    local stateResponse = table.isEmpty(self.m_reviveResponseInfo) and 0 or 1;
    local stateReward = table.isEmpty(matchOverData) and 0 or 1;
    local state = stateNotify * 4 + stateResponse * 2 + stateReward;
    if (state == 0 * 4 + 1 * 2 + 1) and self.m_reviveResponseInfo.ret == 1 then -- 弹提示淘汰(3)
        -- 复活卡不足
        local temp = {};
        temp.reviveType = 2;--复活类型：1--可复活,2--不可复活
        temp.data = self.m_reviveResponseInfo;
        temp.matchOverData = matchOverData;

        local action = MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS;
        local info = {viewName = MatchMechineConfig.VIEW_REVIVE};
        MatchMechine.getInstance():receiveAction(action,info,nil,"_checkReviveAndMatchOverData");

        local action = MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY;
        MatchMechine.getInstance():receiveAction(action,temp,nil,"_checkReviveAndMatchOverData");

        local action = MatchMechineConfig.ACTION_REVIVE_FAILED;
        MatchMechine.getInstance():receiveAction(action,nil,nil,"_checkReviveAndMatchOverData");
    else
        self:_checkMatchOverStatus(matchOverData);
    end
end

MatchSocketProcesser._showMatchOverReward = function(self,info)
    local action = MatchMechineConfig.ACTION_FINISH;
    MatchMechine.getInstance():receiveAction(action,info,nil,"_showMatchOverReward");

    local action = MatchMechineConfig.ACTION_FINISH_REWARD;
    MatchMechine.getInstance():receiveAction(action,info,nil,"_showMatchOverReward");

    self:_cleanLocalReviveData();
end

MatchSocketProcesser._delayShowMatchOverReward = function(arg)
    GameTimer2.release("delay_broadcast_matchOverReward");

    local self = arg[1];
    self:_showMatchOverReward(arg[2]);
end

MatchSocketProcesser._checkMatchOverStatus = function(self, info)
    local curState,lastState,curSubState = MatchMechine.getInstance():getStates();
    if curState == MatchMechineConfig.STATUS_FINISH then --正常比赛结束
        Log.d("MatchSocketProcesser._checkMatchOverStatus","正常结束，显示奖状~~~~~~~~~~~");
        self:_showMatchOverReward(info);

    elseif curState == MatchMechineConfig.STATUS_WAITING then --提前淘汰，播放淘汰动画
        if curSubState ~= MatchMechineConfig.STATUS_WAITING_ROUNDOVER --晋级等待界面淘汰的不播
            and curSubState ~= MatchMechineConfig.STATUS_WAITING_REVIVE then --复活后淘汰的不播

            Log.d("MatchSocketProcesser._checkMatchOverStatus","curSubState = ",curSubState,"播放淘汰动画~~~~~~~~~~~");

            local action = MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI;
            MatchMechine.getInstance():receiveAction(action,nil,nil,"_checkMatchOverStatus");

            GameTimer2.startTimeOut("delay_broadcast_matchOverReward", {self,info}, self._delayShowMatchOverReward, 3000);
        else 
            Log.d("MatchSocketProcesser._checkMatchOverStatus","curSubState = ",curSubState,"直接显示奖状~~~~~~~~~~~");
            self:_showMatchOverReward(info);
        end 
    end      
end
-- 清空复活数据
MatchSocketProcesser._cleanLocalReviveData = function(self)
    self.m_reviveNotifyInfo = nil;
    self.m_reviveResponseInfo = nil;
end

--b76
MatchSocketProcesser.onResponseRankDetail = function(self,info)
    local action = MatchMechineConfig.ACTION_GET_RANK_DETAIL;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onResponseRankDetail");
end

--b78
MatchSocketProcesser.onResponseRule = function(self,info)
    local action = MatchMechineConfig.ACTION_GET_RULE_INFO;
    MatchMechine.getInstance():receiveAction(action,info,nil,"onResponseRule");
end

--b19
MatchSocketProcesser.onServerBroadcastEnterOnlooker = function(self, info)
    MsgProcessTools.getInstance():onPreHandlePacktInfo(self,MatchSocketCmd.S_BROADCAST_ENTER_ONLOOKER, info);
    return true;
end
MatchSocketProcesser.onHandleEnterOnlooker = function(self, info, packetInfoId)
    local gameId = info.gameId;
    local matchId = info.matchId;
    local matchData = table.verify(MatchIsolater.getInstance():getMatchData());
    matchData.id = info.readMatchId or matchData.id;
    MatchIsolater.getInstance():setMatchData(matchData);
    
    if gameId > 0 and matchId > 0 then 
        if info.gameType and info.gameType >= 0 then
            GameInfoIsolater.getInstance():setCurGameType(info.gameType);
            if info.gameType == GameConstant.FIXED_TIME_MATCH then 
                GameInfoIsolater.getInstance():setCurRoomLevelId(700)
            else 
                GameInfoIsolater.getInstance():setCurRoomLevelId(500)
            end
        end
    end

    local action = MatchMechineConfig.ACTION_RESET;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onHandleEnterOnlooker");

    local action = MatchMechineConfig.ACTION_SIGNUP_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onHandleEnterOnlooker");

    local action = MatchMechineConfig.ACTION_START;
    MatchMechine.getInstance():receiveAction(action,nil,true,"onHandleEnterOnlooker");
   
    MsgProcessTools.getInstance():expectProcessCompleteTime(packetInfoId);
    return true;
end 

MatchSocketProcesser.onResponseGroupInfo = function(self, info)
    local groupId = info.groupId;

    local data = MatchIsolater.getInstance():getMatchData();
    if not table.isEmpty(data) then
        MatchIsolater.getInstance():cleanMatchDetailByMatchId(data.id); --清空比赛奖励
        MatchIsolater.getInstance():requestMatchDetail(data.id, groupId); --请求比赛奖励
    end

end

MatchSocketProcesser.s_socketCmdFuncMap = {	
    [MatchSocketCmd.MATCH_DINGJU_MATCH_UPDATEPEOPLE_RESPONSE]   = MatchSocketProcesser.onResponseUpdatePeoleCount;
    [MatchSocketCmd.SERVER_CMD_SEND_CHAT_MSG]                   = MatchSocketProcesser.onServerSendMsg; -- server广播等待聊天信息
    [MatchSocketCmd.SERVER_CMD_USER_SHUTUP]                     = MatchSocketProcesser.onServerShutup;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_START_RESPONSE]          = MatchSocketProcesser.onResponseMatchDingJuMatchStart;
    [MatchSocketCmd.BROADCAST_PLAYER_SCORE]                     = MatchSocketProcesser.onServerBroadcastPlayerScore;

    [MatchSocketCmd.BROADCAST_MATCH_STAGE_INFO]                 = MatchSocketProcesser.onBroadcastMatchStageInfo;
    [MatchSocketCmd.SERVER_CMD_LONG_TIME_NOT_START_KICK_USER]   = MatchSocketProcesser.onResponseDingJuSaiKickUser;

    [MatchSocketCmd.MATCH_DINGJU_ROOM_INFO_RESPONSE]            = MatchSocketProcesser.onResponseMatchDingJuInfo;
    [MatchSocketCmd.MATCH_DINGJU_ROUND_OVER_RESPONSE]           = MatchSocketProcesser.onResponseMatchDingJuRoundOver;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_RESPONSE]           = MatchSocketProcesser.onResponseMatchDingJuMatchOver;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_CONTINUE_RESPONSE]       = MatchSocketProcesser.onResponseMatchDingJuMatchContinue;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_REWARD]             = MatchSocketProcesser.onResponseMatchDingJuMatchOverReward;   
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_STAGE_INFO]    = MatchSocketProcesser.onGetDingshiStagePos;
    
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_TABLE_INFO]    = MatchSocketProcesser.onGetTableInfo;
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_WAIT_TABLE]    = MatchSocketProcesser.onResponseDingshiWaitTable;
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_BASE_INFO]     = MatchSocketProcesser.onGetMatchBaseChipInfo;
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_USER_PROMOTION]          = MatchSocketProcesser.onResponseDingshiUserPromotion;
    
    ---------------------------------------- 复活赛 --------------------------------------------
    [MatchSocketCmd.MATCH_REVIVE_NOTIFY]                        = MatchSocketProcesser.onReviveNotify;
    [MatchSocketCmd.MATCH_REVIVE_RESPONSE]                      = MatchSocketProcesser.onReviveResponse;

    [MatchSocketCmd.MATCH_RANK_DETAIL_RESPONSE]                 = MatchSocketProcesser.onResponseRankDetail;
    [MatchSocketCmd.MATCH_RULE_RESPONSE]                        = MatchSocketProcesser.onResponseRule;

    [MatchSocketCmd.S_BROADCAST_ENTER_ONLOOKER]                 = MatchSocketProcesser.onServerBroadcastEnterOnlooker;

    [MatchSocketCmd.MATCH_GROUP_INFO_RESPONSE]                  = MatchSocketProcesser.onResponseGroupInfo;
};

MatchSocketProcesser.m_socketCmdFuncMap = {
    [MatchSocketCmd.MATCH_DINGJU_MATCH_START_RESPONSE]          = MatchSocketProcesser.onMatchStart;
    [MatchSocketCmd.MATCH_DINGJU_ROUND_OVER_RESPONSE]           = MatchSocketProcesser.onMatchRoundOver;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_RESPONSE]           = MatchSocketProcesser.onMatchOver;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_CONTINUE_RESPONSE]       = MatchSocketProcesser.onMatchContonue;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_REWARD]             = MatchSocketProcesser.onMatchOverReward;   
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_WAIT_TABLE]    = MatchSocketProcesser.onWaitMatchTable;
    [MatchSocketCmd.MATCH_DINGSHI_ROOM_USER_PROMOTION]          = MatchSocketProcesser.onMatchPromotion;
    [MatchSocketCmd.MATCH_REVIVE_NOTIFY]                        = MatchSocketProcesser.onGetReviveNotify;
    [MatchSocketCmd.MATCH_REVIVE_RESPONSE]                      = MatchSocketProcesser.onGetReviveResponse;

    [MatchSocketCmd.BROADCAST_PLAYER_SCORE]                     = MatchSocketProcesser.onGetPlayerScore;
    [MatchSocketCmd.MATCH_DINGJU_ROOM_INFO_RESPONSE]            = MatchSocketProcesser.onGetMatchInfo;

    [MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP]               = MatchSocketProcesser.onHandleSignupMatchSuccess;
    [MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP_FAIL]          = MatchSocketProcesser.onHandleSignupMatchFailed;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_RECONNECT_RESPONSE]      = MatchSocketProcesser.onHandleMatchReconnected;

    [MatchSocketCmd.S_BROADCAST_ENTER_ONLOOKER]                 = MatchSocketProcesser.onHandleEnterOnlooker;
};