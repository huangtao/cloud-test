require("gameData/dataInterfaceBase");
require("games/common2/data/commonPlayerInfoHandler2");
require("isolater/interface/propIsolater");
require("isolater/interface/gameInfoIsolater");
require("isolater/interface/userPropertyIsolater");
require("isolater/interface/userBaseInfoIsolater");
require("isolater/interface/socketIsolater");
require("isolater/interface/communityIsolater");
require("hall/matchHall/gameMatchHall/gameMatchTipsDialog");
require("hall/matchHall/gameMatchHall/data/gameMatchHallConstants");
require("games/common2/match/socket/matchSocketCmd");
require("hall/floatBall/data/floatBallDataInterface");
require("hall/matchHall/gameMatchHall/data/gameMatchData");

require("games/common2/match/socket/matchSocketReader");
require("games/common2/match/socket/matchSocketWriter");
require("games/common2/match/socket/matchSocketCmd");
require("hall/setting/data/settingDataInterface");

local TimeFormatUtil = require("util/timeFormatUtil");

--[[
    比赛列表数据接口层
]]

MatchHallDataInterface = class(DataInterfaceBase);

MatchHallDataInterface.Delegate = {
    -- 比赛列表
    onGetMatchList                      = "onGetMatchList",
    onGetFriendsInviteList              = "onGetFriendsInviteList",
    onTimeToEnterMatch                  = "onTimeToEnterMatch";
    -- 报名
    onSignupMatchSuccess                = "onSignupMatchSuccess";
    onUpdateMatchState                  = "onUpdateMatchState",
    onSignupMatchFailed                 = "onSignupMatchFailed",

    -- 退赛
    onExitMatchSuccess                  = "onExitMatchSuccess";
    onExitMatchFailed                   = "onExitMatchFailed";
    -- 
    onResponseMatchDetail               = "onResponseMatchDetail",
    onResponseMatchBasicInfo            = "onResponseMatchBasicInfo",
    
    onGetNextLoopMatchInfo              = "onGetNextLoopMatchInfo";

    -- 比赛标签列表
    onGetMatchTagList                   = "onGetMatchTagList";

    onMatchReconnected                  = "onMatchReconnected";

    onInvitationalMyApplyLists          = "onInvitationalMyApplyLists";
}

MatchHallDataInterface.getInstance = function ()
    if not MatchHallDataInterface.s_instance then 
        MatchHallDataInterface.s_instance = new(MatchHallDataInterface);
    end
    return MatchHallDataInterface.s_instance;
end

MatchHallDataInterface.ctor = function (self)
    CommunityIsolater.getInstance():setObserver(self);
    self.m_matchDetailData = new(require("hall/matchHall/gameMatchHall/data/matchDetailData"), self);
    self.m_matchListData = new(require("hall/matchHall/gameMatchHall/data/matchListData"), self);
    self.m_matchTagList = {};
end

MatchHallDataInterface.dtor = function (self)
    CommunityIsolater.getInstance():clearObserver(self);

    delete(self.m_matchDetailData);
    self.m_matchDetailData = nil;

    delete(self.m_matchListData);
    self.m_matchListData = nil;

    self.m_matchTagList = {};

    self:removeSocket()
end

MatchHallDataInterface.initSocket = function(self)
    if not self.m_isInitSocket then
        self.m_isInitSocket = true
        self.m_commonReader = new(MatchSocketReader)
        self.m_commonWriter = new(MatchSocketWriter)
        OnlineSocketManager.getInstance():addSocketReader(self.m_commonReader)
        OnlineSocketManager.getInstance():addSocketWriter(self.m_commonWriter)
    end
end

MatchHallDataInterface.removeSocket = function(self)
    if m_isInitSocket then
        OnlineSocketManager.getInstance():removeSocketReader(self.m_commonReader)
        OnlineSocketManager.getInstance():removeSocketWriter(self.m_commonWriter)
        delete(self.m_commonReader)
        delete(self.m_commonWriter)
        self.m_commonReader = nil
        self.m_commonWriter = nil
        self.m_isInitSocket = false
    end
end

-----------------------------------------比赛列表相关--------------------------

--@brief 请求比赛列表
MatchHallDataInterface.requestMatchList = function(self)
    self.m_matchListData:requestMatchList();
end

--@brief 获取比赛列表 （注意不要直接在外部更改此table的item）
MatchHallDataInterface.getMatchList = function(self)
    return self.m_matchListData:getMatchList();
end

--@brief 获取到完整的比赛列表
MatchHallDataInterface.onGetMatchList = function(self, matchList)
    self:notify(MatchHallDataInterface.Delegate.onGetMatchList, matchList);
    self.m_matchDetailData:cleanUnuseData(matchList);
end

--@brief 根据配置id获取比赛数据
--@param config 配置id(定时赛或循环赛)
--@return #1 比赛数据 #2 index
MatchHallDataInterface.getMatchItemByConfigid = function(self, configid)
    return self.m_matchListData:getMatchItemByConfigid(configid);
end

--@brief 更新比赛列表项数据
MatchHallDataInterface.updateMatchItemInfo = function(self, newItem)
    self.m_matchListData:updateMatchItemInfo(newItem);
end


--@brief 获取开赛时间距离现在最近的一场定时赛，报名下一场用
MatchHallDataInterface.getClosestMatch = function(self)
    return self.m_matchListData:getClosestMatch();
end

--@brief 获取开赛时间距离现在最近的一场定时赛，报名下一场用
MatchHallDataInterface.getClosestMatchCanSiginup = function(self, data)
    return self.m_matchListData:getClosestMatchCanSiginup(data);
end

--@brief 根据比赛ID判断是否为邀请赛
MatchHallDataInterface.checkInvitationalById = function(self, matchId)
    if matchId and string.len(tostring(matchId)) == 4 then
        return true
    end
    return false
end

--@brief 获取已报名的比赛列表
MatchHallDataInterface.getEnrollList = function(self)
    return self.m_matchListData:getEnrollList();
end

--@brief 获取已报名的邀请赛
MatchHallDataInterface.getInvitationalEnrollList = function(self)
    return self.m_matchListData:getInvitationalEnrollList();
end

--@brief 根据标签id获取比赛列表
MatchHallDataInterface.getMatchListWithTagId = function(self, tagId)
    return self.m_matchListData:getMatchListWithTagId(tagId);
end

--@brief 排序比赛列表
MatchHallDataInterface.sortMatchList = function(self, list)
    if table.isEmpty(list) then
        return {}
    end

    --分为有图及无图组并排序
    local adIconList, noAdIconList = {}, {}
    for _,v in pairs(list) do
        if v.adIcon ~= "" then
            table.insert(adIconList, v)
        else
            table.insert(noAdIconList, v)
        end
    end
    local function sort_item(a, b)
        if a.listSort ~= 0 and b.listSort == 0 then
            return true
        elseif a.listSort == 0 and b.listSort ~= 0 then
            return false
        elseif a.listSort ~= b.listSort then
            return a.listSort < b.listSort
        else
            return a.stime < b.stime
        end
    end
    table.sort(adIconList, sort_item)
    table.sort(noAdIconList, sort_item)

    local l_adIconList, r_adIconList = {}, {} --有图左右组
    local l_noAdIconList, r_noAdIconList = {}, {} --无图左右组
    local l_List, r_List = {}, {} --左右组

    --将有图组分为有图左右组
    for i=1, #adIconList do 
        table.insert((i%2 == 1) and l_adIconList or r_adIconList, adIconList[i])
    end

    --将无图组分为无图左右组(如果大图为奇数，小图从3开始)
    for i=(#adIconList%2 == 0) and 1 or 3, #noAdIconList do
        table.insert((i%2 == 1) and l_noAdIconList or r_noAdIconList, noAdIconList[i])
    end

    --合并有图左边组与无图左边组
    l_List = l_adIconList
    for i=1,(#l_noAdIconList) do
        table.insert(l_List, l_noAdIconList[i])
    end

    --合并有图右边组与无图右边组
    r_List = r_adIconList
    for i=1,#r_noAdIconList do
        table.insert(r_List, r_noAdIconList[i])
    end

    --如果大图为奇数,将前两张小图放在右边
    if #adIconList%2 == 1 then
        for i=1,2 do
            if noAdIconList[i] then
                table.insert(r_List, noAdIconList[i])
            end
        end
    end

    --排序左右组
    table.sort(l_List, sort_item)
    table.sort(r_List, sort_item)

    --合并左右组
    local count = (#l_List >= #r_List) and #l_List or #r_List
    local tab = {}
    for i=1,count do
        if l_List[i] then
            table.insert(tab, l_List[i])
        end
        if r_List[i] then
            table.insert(tab, r_List[i])
        end
    end
    adIconList, noAdIconList, l_adIconList, r_adIconList, l_noAdIconList, r_noAdIconList, l_List, r_List = nil, nil, nil, nil, nil, nil, nil, nil

    return tab
end

--@brief 判断是否是循环赛
--@param data 比赛列表数据
MatchHallDataInterface.checkIsLoopMatch = function(self, data)
   return self.m_matchListData:checkIsLoopMatch(data);
end

--@brief 获取下一场循环赛信息
--@param 比赛配置id
MatchHallDataInterface.getNextLoopMatchInfo = function(self, configid)
    self.m_matchListData:getNextLoopMatchInfo(configid);
end

--@brief 判断能否报名
MatchHallDataInterface.checkCanSignup = function(self, data)
    return self.m_matchListData:checkCanSignup(data);
end

--@brief 检查是否满足报名条件
MatchHallDataInterface.checkFee = function(self, fee)
    return self.m_matchListData:checkFee(fee);
end

--@brief 判断是否满足报名条件
MatchHallDataInterface.checkFeeItem = function(self, feeItem)
    return self.m_matchListData:checkFeeItem(feeItem);
end

--检查是否能够报名 结果返回布尔值，结果为false时同时返回错误类型
--typ:道具类型
--num:道具数量
--checkRuin:是否检查破产
MatchHallDataInterface.checkEnroll = function(self, typ, num, checkRuin)
    return self.m_matchListData:checkEnroll(typ, num, checkRuin);
end

--@brief 排序报名方式， 将可报名的翻盖第一位
MatchHallDataInterface.sortFee = function(self, data)
    return self.m_matchListData:sortFee(data);
end

--@brief 下一场循环赛信息获取回调
MatchHallDataInterface.onGetNextLoopMatchInfo = function(self, isSuccess, matchItem)
    self:notify(MatchHallDataInterface.Delegate.onGetNextLoopMatchInfo, isSuccess, matchItem);
end

--@brief 检查是否需要刷新比赛列表
--@note 从其它界面返回到大厅界面 且和上次请求相隔时间大于5分钟
MatchHallDataInterface.checkRefreshMatchList = function(self)
    self.m_matchListData:checkRefreshMatchList();
end


----------------------------------------------------报名流程--------------------------------------------

--@brief 报名参赛
MatchHallDataInterface.signupMatch = function(self, info)
    Log.d("MatchHallDataInterface.doSignupMatch","报名",info);

    local isGameSupportMatchFeature = HallFeatureManager.getInstance():isGameSupportMatchFeature(info.gameId);
    if not isGameSupportMatchFeature then
        LoadingView.getInstance():hidden();
        Toast.getInstance():showText("当前游戏版本不支持比赛",50,30,kAlginLeft,"",26,255,255,255);
        return;
    end

    local data = {};
    data.uid = UserBaseInfoIsolater.getInstance():getUserId();
    data.matchRoomId = info.id;
    data.key = "55ff85e777d50680fb52935076d7e55b";
    local userLoginInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginInfo(info.gameId);
    userLoginInfo.feeType = (info.fee and info.fee[1] and info.fee[1][1]) and number.valueOf(info.fee[1][1].type) or 0
    data.userInfo = CommonPlayerInfoHandler2.getInstance():encodeUserLoginJsonInfo(userLoginInfo)
    data.flag = 0;
    data.matchentrycode = info.matchentrycode or ""
    data.matchOnlookerType = kSettingDataInterface:getMatchOnlookerSwitch() and 1 or 0;
    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_DINGJU_RQUEST_SIGHUP, data);

    self.m_matchInfo = info;
end

--@brief 报名成功且可以直接进入比赛
MatchHallDataInterface.onSignupMatchSuccess = function(self, data)
    Log.d("MatchHallDataInterface.onSignupMatchSuccess","报名成功", data);
    if data.totalMoney >= 0 then 
        UserPropertyIsolater.getInstance():setMoney(data.totalMoney);
    end

    local userInfo = data.userInfo;
    if not table.isEmpty(userInfo) then
        local diamond = number.valueOf(userInfo.diamond, -1);
        local goldBar = number.valueOf(userInfo.silver, -1); --金条

        if diamond >= 0 then
            UserPropertyIsolater.getInstance():setDiamond(diamond);
        end

        if goldBar >= 0 then
            UserPropertyIsolater.getInstance():setCrystal(goldBar);
        end

        --道具统一通过广播进行刷新
    end

	self.m_matchInfo = nil;
	self:notify(MatchHallDataInterface.Delegate.onSignupMatchSuccess, data);	
end

-- @brief 定时赛报名成功，但不能立刻进入
MatchHallDataInterface.onUpdateMatchState = function(self, data)
    Log.d("MatchHallDataInterface.onUpdateMatchState", data);

    if not data or table.isEmpty(data) then 
        -- 报名失败
        Toast.getInstance():showText(kTextApplyInformationError,50,30,kAlginLeft,"",26,255,255,255);
        return;
    end

    if data.type < 0 or data.count < 0 then 
        Toast.getInstance():showText(kTextApplyInformationError,50,30,kAlginLeft,"",26,255,255,255);
        return;
    end

    if data.type ==  PropIsolater.propTypeMap.TYPE_MATCHCARD_LOW or PropIsolater.propTypeMap.TYPE_SILVER or (data.type >= 280 and data.type <= 299) then
        -- 道具
        PropIsolater.getInstance():updatePropNum(data.type, data.count);
    end

    if data.extenalMoney and data.extenalMoney >= 0 then 
        -- 只有组合报名费才有这个值
        UserPropertyIsolater.getInstance():setMoney(data.extenalMoney);
    end

    local userInfo = data.userInfo
    if not table.isEmpty(userInfo) then
        local money = number.valueOf(userInfo.money, -1);
        local diamond = number.valueOf(userInfo.diamond, -1);
        local goldBar = number.valueOf(userInfo.silver, -1);

        if money >= 0 then 
            UserPropertyIsolater.getInstance():setMoney(money);
        end

        if diamond >= 0 then
            UserPropertyIsolater.getInstance():setDiamond(diamond);
        end

        if goldBar >= 0 then
            UserPropertyIsolater.getInstance():setCrystal(goldBar);
        end

        --道具统一通过广播进行刷新
    end

    if self.m_matchInfo then
        --刷新比赛报名状态
        self.m_matchInfo.status = GameConstant.HAVE_SIGN_UP;
        self.m_matchInfo.applynum = number.valueOf(self.m_matchInfo.applynum, 0) + 1;
        self.m_matchInfo.allapplynum = number.valueOf(self.m_matchInfo.allapplynum, 0) + 1;
        self:updateMatchItemInfo(self.m_matchInfo);
        if number.valueOf(self.m_matchInfo.type) == GameConstant.FIXED_TIME_MATCH then  
            self:notify(MatchHallDataInterface.Delegate.onUpdateMatchState, self.m_matchInfo);
        end
    end
    self.m_matchInfo = nil;
end

-- 报名失败
MatchHallDataInterface.FATAL_ERROR = 0;          --服务器内部异常
MatchHallDataInterface.MATCH_NOT_EXSITS = 1; --比赛信息错误
MatchHallDataInterface.NOT_ENOUGH_ENTRY_FEE = 2; --银币小于报名费用
MatchHallDataInterface.MATH_IS_PLAYING = 3;      --比赛已经开始且不属于重连
MatchHallDataInterface.ALREADY_SIGN_UP = 4;      --玩家已經報名
MatchHallDataInterface.NOT_REACH_TIME = 5; -- 没到时间
MatchHallDataInterface.SIGN_UP_ERROR = 6; -- 收到该错误码时，啥都不用处理
MatchHallDataInterface.MATCH_OVER_MAX_USER = 7; -- 超过比赛报名最大人数

--@brief 报名失败
MatchHallDataInterface.onSignupMatchFailed = function(self, info)
    LoadingView.getInstance():hidden();
    self.m_matchInfo = nil;

    local code = info.code ;

    if code == MatchHallDataInterface.FATAL_ERROR then 
        Toast.getInstance():showText(kTextServerInformationError, 50, 30, kAliginCenter, "", 24, 255, 255, 255);

    elseif code == MatchHallDataInterface.MATCH_NOT_EXSITS then 
        Toast.getInstance():showText(kTextMatchInformationError, 50, 30, kAliginCenter, "", 24, 255, 255, 255);

    elseif code == MatchHallDataInterface.NOT_ENOUGH_ENTRY_FEE then 
        Toast.getInstance():showText(kTextNoSufficientMoney, 50, 30, kAliginCenter, "", 24, 255, 255, 255); 

    elseif code == MatchHallDataInterface.MATH_IS_PLAYING then 
        Toast.getInstance():showText(kTextMatchStarted, 50, 30, kAliginCenter, "", 24, 255, 255, 255); 
        
    elseif code == MatchHallDataInterface.ALREADY_SIGN_UP then 
    elseif code == MatchHallDataInterface.NOT_REACH_TIME then 
        Toast.getInstance():showText(kTextMatchLate, 50, 30, kAliginCenter, "", 24, 255, 255, 255); 

    elseif code == MatchHallDataInterface.SIGN_UP_ERROR then 
        GameInfoIsolater.getInstance():startGame(GameInfoIsolater.getInstance():getHallGameType());

    elseif code == MatchHallDataInterface.MATCH_OVER_MAX_USER then 
        Toast.getInstance():showText(kTextMatchOverMaxUser, 50, 30, kAliginCenter, "", 24, 255, 255, 255); 

    end 

    self:notify(MatchHallDataInterface.Delegate.onSignupMatchFailed, info);
end


----------------------------------------------------比赛详情---------------------------------------------

--@brief 请求比赛详情
--@param matchId 比赛id
MatchHallDataInterface.requestMatchDetail = function (self, matchId, groupId)
    self.m_matchDetailData:requestMatchDetail(matchId, groupId);
end

--@delegate MatchDetailData 更新等待界面
MatchHallDataInterface.onResponseMatchDetail = function (self, data,matchId)
    local curMatchId = number.valueOf(table.verify(self.m_matchData).id);
    if curMatchId > 0 and  matchId == curMatchId then     
        self:setCurMatchIsSupportReport(table.verify(data).isSupportReport);
    end 
    self:notify(MatchHallDataInterface.Delegate.onResponseMatchDetail, data,matchId);
end

--@brief 清空比赛详情
MatchHallDataInterface.cleanMatchDetailByMatchId = function(self, matchId)
    self.m_matchDetailData:cleanMatchDetailByMatchId(matchId);
end

--@brief 请求某个比赛的完整信息
MatchHallDataInterface.requestMatchBasicInfo = function(self, matchid)
    if not matchid then return; end
    SocketIsolater.getInstance():sendMsg(PHP_REQUEST_MATCH_BASIC,{matchid = matchid});
end

--@brief 请求某个比赛的完整信息 回应
MatchHallDataInterface.onResponseMatchBasicInfo = function(self, isSuccess, data, sendParam)
    if not isSuccess then
        self:requestMatchBasicInfo(sendParam.matchid);
        return;
    end
    self:notify(MatchHallDataInterface.Delegate.onResponseMatchBasicInfo, data);
end


----------------------------------------------------退赛-------------------------------------------------

--@brief 请求退赛
MatchHallDataInterface.requestExitMatch = function (self, data)
    self.m_exitMatchInfo = data;
    local param = {};
    param.mid = UserBaseInfoIsolater.getInstance():getUserId();
    param.matchId = data.id;
    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_REQUEST, param);
end

--@brief 收到退赛回复
MatchHallDataInterface.onResponseExitMatch = function(self, info)
    if info.totalMoney >= 0 then
        UserPropertyIsolater.getInstance():setMoney(info.totalMoney);
    end
    
    local userInfo = info.userInfo;
    if not table.isEmpty(userInfo) then
        local diamond = number.valueOf(userInfo.diamond, -1);
        local crystal = number.valueOf(userInfo.silver, -1);

        if diamond >= 0 then
            UserPropertyIsolater.getInstance():setDiamond(diamond);
        end

        if crystal >= 0 then
            UserPropertyIsolater.getInstance():setCrystal(crystal);
        end
    end

    -- 更新道具
    if info.hasProp then 
        if info.count > 0 then 
            PropIsolater.getInstance():updatePropNum(info.type, info.count);
        end
    end

    if self.m_exitMatchInfo then 
        --刷新列表状态
        self.m_exitMatchInfo.status = GameConstant.NOT_SIGN_UP;
        local applynum = number.valueOf(self.m_exitMatchInfo.applynum, 1) - 1;
        local allapplynum = number.valueOf(self.m_exitMatchInfo.allapplynum, 1) - 1;
        self.m_exitMatchInfo.applynum = applynum < 0 and 0 or applynum;
        self.m_exitMatchInfo.allapplynum = allapplynum < 0 and 0 or allapplynum;
        self:updateMatchItemInfo(self.m_exitMatchInfo);
    end
    self:notify(MatchHallDataInterface.Delegate.onExitMatchSuccess, table.verify(self.m_exitMatchInfo), info, true);
    self.m_exitMatchInfo = nil;

    self:setSignMatchId(nil);
    self:setMatchStatus(GameMatchData.DINGJUSAI_STATE_NONE);
    self:setLastConnectInMatch(false);
end

--@brief 退赛失败
MatchHallDataInterface.onResponseExitMatchError = function (self, info)
    local result = "退赛失败";
    if info.errorType == 0 then 
        --游戏已经开始，而且该玩家处理比赛中   退出失败
        result = "游戏已经开始，退赛失败!";
    elseif info.errorType == 1 then 
        --该玩家未报名或者已经被淘汰    退出成功  （不退报名费）
        result = "您未报名或已经被淘汰，退赛失败!";
    elseif info.errorType == 2 then 
        --其他错误原因，退出成功（不退还报名费）
        result = "退赛失败!";
    elseif info.errorType == 3 then 
        --用户不存在
        result = kTextNoNetwork;
    elseif info.errorType == 4 then 
        result = "比赛即将开始，不允许退赛.";
    end
    Toast.getInstance():showText(result,50,30,kAlginLeft,"",26,255,255,255);
    info.result = result;
    self:notify(MatchHallDataInterface.Delegate.onExitMatchFailed, info);
end

--@brief 通知定时赛可以进入比赛了
MatchHallDataInterface.onTimeToEnterMatch = function (self, data) 
    if table.isEmpty(data) then 
        return;
    end

    local matchList = self:getMatchList();
    if self:checkInvitationalById(data.matchId) then
        matchList = self:getInvitationalEnrollList()
    end
    for k, v in ipairs(matchList) do
        if v.id == data.matchId then
            --将比赛状态从已报名状态设置为允许进入报名状态
            v.status = GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN;
            break;
        end
    end

    if FloatBallDataInterface.getInstance():isSwitchOpen() then
        --如果浮动球开关开启，则走浮动球通知
        FloatBallDataInterface.getInstance():insertMatchMessage(data);
    else
        if not kGameManager:isInRoom() then
            local function enter_cb()
                UBReport.getInstance():report(UBConfig.kHallMatchTimeToEnterConfirm)
                if not data.matchId then 
                    return
                end
                self:setSignMatchId(data.matchId)
                if GameInfoIsolater.getInstance():isInRoom() or PrivateRoomIsolater.getInstance():isInPrivateRoom() then 
                    self:setIsRoomToMatch(true)
                else
                    EventDispatcher.getInstance():dispatch(HallController.s_matchListDispatch)
                end
                GameMatchTipsDialog.hide()
            end

            local name = string.gsub(data.matchName or "", "#", "")
            local time = os.date("%H:%M", data.startTime)
            local tips = string.format("#c8f5c1f您报名的#cf9600d%s#c8f5c1f将于#cf9600d%s#c8f5c1f开始", name, time)
            local dialog = GameMatchTipsDialog.show("开赛提醒")
            local function close_cb()
                UBReport.getInstance():report(UBConfig.kHallMatchTimeToEnterClose)
                GameMatchTipsDialog.hide()
            end
            dialog:initStartView(tips, data.startTime, nil, enter_cb, close_cb)
        end
    end
	
    self:notify(MatchHallDataInterface.Delegate.onTimeToEnterMatch, data);
end

--@brief 请求好友邀请列表
MatchHallDataInterface.requestFriendInviteList = function ( self )
    CommunityIsolater.getInstance():requestFriendsInviteList();
end

--@brief 获取比赛邀请好友列表
MatchHallDataInterface.onGetFriendsInviteList = function ( self, isSuccess, data )
    if not isSuccess or not data then 
        return;
    end

    self:notify(MatchHallDataInterface.Delegate.onGetFriendsInviteList, data);
end

--@brief 邀请好友
MatchHallDataInterface.requestInviteFriends = function (self, cidList, data)
    CommunityIsolater.getInstance():requestInviteFriend(cidList, data);
end


-----------------------------------------------------比赛标签------------------------------------------

--@brief 请求比赛标签列表
MatchHallDataInterface.requestMatchTagList = function(self)
    SocketIsolater.getInstance():sendMsg(PHP_REQUEST_MATCH_TAG_LIST)
end

--@brief 请求比赛标签列表
MatchHallDataInterface.getMatchTagList = function(self)
    return self.m_matchTagList
end

--@brief 请求有比赛数据的比赛标签列表
MatchHallDataInterface.getHaveDataMatchTagList = function(self)
    local matchTagList = self.m_matchTagList
    local matchList = self:getMatchList()
    local data = {}
    for _,v in ipairs(matchTagList) do
        local isHave = false
        for _,v2 in ipairs(matchList) do
            for _,v3 in pairs(table.verify(v2.matchtags)) do
                if v.id and tonumber(v.id) == tonumber(v3) then
                    isHave = true
                    break
                end
            end
            if isHave then
                break
            end
        end
        if isHave then
            table.insert(data, v)
        end
    end
    return Copy(data)
end

--@brief 获取比赛标签列表
MatchHallDataInterface.onGetMatchTagList = function(self, isSuccess, info)
    if isSuccess then
        self.m_matchTagList = self:_analyseDataTagList(info);
        self:notify(MatchHallDataInterface.Delegate.onGetMatchTagList, self.m_matchTagList);
    end
end

--@brief 解析比赛标签列表
MatchHallDataInterface._analyseDataTagList = function(self, data)
    local tmp = {};
    for k, v in ipairs(table.verify(data)) do
        local dataItem = table.verify(v);
        local item = {
            id = tonumber(dataItem.id) or 0,
            name = tostring(dataItem.name or "") or "",
            image = tostring(dataItem.image or "") or "",
            desc = tostring(dataItem.desc or "") or "",
        }
        table.insert(tmp, item);
    end
    return tmp;
end


------------------------------------------- 缓存变量接口-----------------------------

--@brief 比赛重连
MatchHallDataInterface.onMatchReconnected = function(self,data)
    self:notify(MatchHallDataInterface.Delegate.onMatchReconnected, data);
end

--@brief 标记上次是否在比赛中进行重连的
MatchHallDataInterface.setLastConnectInMatch = function(self, bFlag)
    self.m_lastConnectInMatch = bFlag;
    Log.d("MatchHallDataInterface.setLastConnectInMatch", self.m_lastConnectInMatch);
end

MatchHallDataInterface.getLastConnectInMatch = function(self)
    return self.m_lastConnectInMatch;
end

MatchHallDataInterface.checkLastConnect = function(self, matchInfo)
    -- 重连比赛已结束并且上次连接比赛未结束并且当前不在比赛中
    if table.isEmpty(matchInfo) and self:getLastConnectInMatch() then
        Toast.getInstance():showText("亲，比赛已经结束。成绩可以在【比赛-战绩】中查看喔！",50,30,kAlginLeft,"",26,255,255,255);
        self:setLastConnectInMatch();
    end
end

--@brief 获取时间字符串
MatchHallDataInterface.getSimpleTimeString = function(self, data)
    if not table.isEmpty(data) then
        local isLoopMatch = self:checkIsLoopMatch(data)
        local serverTime = kAppData:getRightTimeWithServer()
        local delta = data.firstbegintime - serverTime
        if isLoopMatch and data.loopinterval <= 20 and delta < 0 then
            return string.format("每%s分钟1场", data.loopinterval)
        else
            local isSameDay = TimeFormatUtil.isSameDay(serverTime, data.stime)
            if isSameDay then
                return string.format("今天%s", os.date("%H:%M", data.stime))
            else
                local isInTwoDay, dayStr = TimeFormatUtil.isInTwoDay(serverTime, data.stime)
                if isInTwoDay then
                    --明天
                    return string.format("%s%s", dayStr, os.date("%H:%M", data.stime))                    
                else
                    return TimeFormatUtil.getTimeMD(data.stime);                   
                end
            end
        end
    end
    return ""
end

--@brief 获取时间显示
MatchHallDataInterface.getTimeStringWithTime = function(self, time)
    local serverTime = kAppData:getRightTimeWithServer();
    local isSameMonth = TimeFormatUtil.isSameMonth(time, serverTime);

    local day = TimeFormatUtil.getDayInterval(time, serverTime);

    if day == 0 then
        return os.date("%H:%M", time);
    elseif day == 1 then
        return "昨天";
    elseif day == 2 then
        return "前天";
    elseif isSameMonth then
        return TimeFormatUtil.getTimeMD(time);
    else
        return TimeFormatUtil.getTimeYM(time);
    end
end

MatchHallDataInterface.setMatchData = function(self, data)
    self.m_matchData = data;
    self:setCurMatchType(data.type);
end

MatchHallDataInterface.getMatchData = function(self)
    if table.isEmpty(self.m_matchData) then
        return {};
    else
        if string.isEmpty(self.m_matchData.name) then
            local name = GameInfoIsolater.getInstance():getGameName(self.m_matchData.gameId);
            if GameInfoIsolater.getInstance():getCurGameType() == GameConstant.NORMAL_IMMEDIATE_MATCH then 
                self.m_matchData.name = string.concat(name, "快速赛");
            elseif GameInfoIsolater.getInstance():getCurGameType() == GameConstant.FIXED_TIME_MATCH then
                self.m_matchData.name = string.concat(name, "定时赛");
            else 
                self.m_matchData.name = string.concat(name, "比赛");
            end
        end
        return self.m_matchData;
    end
end

--@brief 设置当前比赛类型
MatchHallDataInterface.setCurMatchType = function (self, type)
    self.m_matchType = type;
end

MatchHallDataInterface.getCurMatchType = function (self)
    return self.m_matchType or -1;
end

--@brief 设置比赛状态
MatchHallDataInterface.setMatchStatus = function(self, state)
    self.m_matchState = state;
end

--@brief 获取比赛状态
MatchHallDataInterface.getMatchStatus = function(self)
    return self.m_matchState or -1;
end

--@brief 设置比赛报名id
MatchHallDataInterface.setSignMatchId = function(self, matchId)
    self.m_signMatchId = matchId;
end

MatchHallDataInterface.getSignMatchId = function(self)
    return self.m_signMatchId or 0;
end

--@brief 是否从房间接收广播进入比赛
MatchHallDataInterface.setIsRoomToMatch = function(self, flag)
    self.m_isRoomToMatch = flag;
end

MatchHallDataInterface.getIsRoomToMatch = function(self)
    return self.m_isRoomToMatch or false;
end

--@brief 设置比赛列表过滤的游戏id（用作房间列表往比赛列表跳转）
MatchHallDataInterface.setFilterGameId = function (self, gameId)
    self.m_filterGameId = gameId;
end

MatchHallDataInterface.getFilterGameId = function (self)
    return self.m_filterGameId or 0;
end

--@brief 设置定时赛底注变化状态，主要用来区分方案显示,只有0，1两个值
MatchHallDataInterface.setIsJustStart = function(self, value)
    self.m_tipsStatus = value;
end

MatchHallDataInterface.getIsJustStart = function(self)
    return self.m_tipsStatus;
end

--@brief 获取比赛分享模板
MatchHallDataInterface.getShareTemplate = function(self)
    return ShareDataInterface.getInstance():getShareTemplate()
end

--@brief 设置下一场比赛类型
MatchHallDataInterface.setNextMatchType = function ( self, matchType )
    self.m_matchType = matchType;
end

--@brief 获取下一场比赛类型，默认为定局赛
MatchHallDataInterface.getNextMatchType = function ( self )
    return self.m_matchType or GameConstant.NORMAL_IMMEDIATE_MATCH;
end

--@brief 缓存比赛玩家分数
MatchHallDataInterface.setMatchScoreInfo = function (self, data)
    self.m_matchScore = data;
end

--@brief 获取比赛缓存的玩家分数
MatchHallDataInterface.getMatchScoreInfo = function (self)
    return self.m_matchScore or {};
end

--@brief 缓存定时赛阶段信息
MatchHallDataInterface.setMatchStageInfo = function ( self, info )
    self.m_matchStageInfo = info;
end

MatchHallDataInterface.getMatchStageInfo = function ( self )
    return self.m_matchStageInfo or {};
end

--@brief 设置比赛跳转信息
--@param jumpInfo (table) 比赛跳转信息
MatchHallDataInterface.setMatchJumpInfo = function(self, jumpInfo)
    self.m_matchJumpInfo = jumpInfo;
end

--@brief 获取比赛跳转信息
--@return (table) 比赛跳转信息
MatchHallDataInterface.getMatchJumpInfo = function(self)
    return self.m_matchJumpInfo;
end

--请求我报名的列表
MatchHallDataInterface.getMyApplyLists = function(self)
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_MY_APPLY_LISTS, {ssid = kUserInfoData:getSsid()})
end

--获取我报名的列表回调
MatchHallDataInterface.onInvitationalMyApplyLists = function(self, isSuccess, info)
    self:notify(MatchHallDataInterface.Delegate.onInvitationalMyApplyLists, isSuccess, info)
end

--当前比赛是否支持举报
MatchHallDataInterface.setCurMatchIsSupportReport = function(self,isSupport)
    self.m_curMatchIsSupportReport = isSupport;
end

MatchHallDataInterface.getCurMatchIsSupportReport = function(self)
    return self.m_curMatchIsSupportReport;
end

MatchHallDataInterface.s_socketCmdFuncMap = {
    [PHP_REQUEST_MATCH_BASIC]                       = MatchHallDataInterface.onResponseMatchBasicInfo;              -- php获取单个比赛基础信息
    
    [MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP]                   = MatchHallDataInterface.onSignupMatchSuccess;              --报名成功
    [MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP_FAIL]              = MatchHallDataInterface.onSignupMatchFailed;               -- 报名失败
    [MatchSocketCmd.MATCH_XIANSHI_RESPONSE_SIGHUP]                  = MatchHallDataInterface.onUpdateMatchState;
    [MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_RESPONSE]           = MatchHallDataInterface.onResponseExitMatch;               -- 退出比赛成功
    [MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_ERROR_RESPONSE]     = MatchHallDataInterface.onResponseExitMatchError;          -- 退出比赛失败

    [MatchSocketCmd.MATCH_DINGJU_MATCH_RECONNECT_RESPONSE]          = MatchHallDataInterface.onMatchReconnected;   

    [MatchSocketCmd.TIME_TO_ENTER_MATCH]                            = MatchHallDataInterface.onTimeToEnterMatch;
    [PHP_REQUEST_MATCH_TAG_LIST]                                   = MatchHallDataInterface.onGetMatchTagList;
};
