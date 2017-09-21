--[[
    提供关于游戏信息的一些接口
]]

require("core/object");
require("hall/common/gameManager");
require("hall/gameData/appData");
require("hall/userInfo/data/userInfoData");
require("hall/main/data/hallDataInterface");

GameInfoIsolater = class(DataInterfaceBase);

GameInfoIsolater.Delegate = {
}

GameInfoIsolater.getInstance = function()
    if not GameInfoIsolater.s_instance then
        GameInfoIsolater.s_instance = new(GameInfoIsolater); 
    end
    return GameInfoIsolater.s_instance;
end

GameInfoIsolater.ctor = function(self)
    kGameManager:setObserver(self);
end

GameInfoIsolater.dtor = function(self)
    kGameManager:clearObserver(self);
end

--@brief 大厅和房间之间的跳转接口
--@param gameId 游戏id
--@param style 对应stateMachine.changeState 中的style 一般没啥用
--@param ... 扩展参数 或透传给切换的状态
GameInfoIsolater.startGame = function(self, gameId, style, ...)
    kGameManager:startGame(gameId, style, ...);
end

--@brief 标识游戏是否首次启动
--@return (boolean)
GameInfoIsolater.isFirstOpen = function(self)
    return kAppData:isFirstOpen();
end

--@brief 获取游戏版本号
--@param gameId 游戏id
--@return (int)
GameInfoIsolater.getGameVersion = function(self, gameId)
    return kGameManager:getGameVersion(gameId);
end

--@brief 获取大厅版本号
--@return (int)
GameInfoIsolater.getHallVersion = function(self)
    return kGameManager:getGameVersion(GameType.HALL);
end

--@brief 获取游戏分辨率
--@return (table) eg: {1280, 720}
GameInfoIsolater.getGameResolution = function(self, gameId)
    return kGameManager:getGameResolution(gameId);
end

--@brief 获取大厅支持的游戏最低可玩的版本号
--@return (int)
GameInfoIsolater.getGamePlayableMinVersion = function(self, gameId)
    return kGameManager:getGamePlayableMinVersion(gameId);
end

--@brief 获取APK版本号
--@return (string)
GameInfoIsolater.getApkVerison = function(self)
    return kGameManager:getApkVerison();
end

--@brief 获取游戏名字
--@return (string)
GameInfoIsolater.getGameName = function(self, gameId)
    return kGameManager:getGameName(gameId);
end

--@brief 根据游戏获取游戏的package名字\
--@note 这里返回的包名会去掉games/ 
--eg: "games/dgz" 则只会返回"dgz";
GameInfoIsolater.getGamePackageName = function(self,gameId)
    return kGameManager:getGamePackageName(gameId);
end

--@brief 检查本地是否存在该游戏 游戏初始化过，则代表此游戏存在
--@return (boolean)
GameInfoIsolater.checkIsExitGame = function(self, gameId)
    return kGameManager:getInitStatus(gameId);
end

---------------------------------------游戏场次信息相关的接口---------------------------------------------
--@brief 根据money检查是否能在这个房间里面玩牌
--@return (boolean)
GameInfoIsolater.isLegalToPlay = function(self, gameId, levelId, money)
    return kGameManager:isLegalToPlay(gameId, levelId, money);
end

--@brief 是否已经获得房间等级列表
GameInfoIsolater.isGotGameLevel = function(self, gameId)
    return kGameManager:isGotGameLevel(gameId);
end

--@brief 根据入场银币获取可玩的房间等级
--@param currentLevelId 当前场次id
--@return (int) 返回场次id 如果没找到则返回-1
GameInfoIsolater.getPlayableLevelIdByLoginMoney = function(self, gameId, money, currentLevelId)
    return kGameManager:getPlayableLevelIdByLoginMoney(gameId, money, currentLevelId);
end

--@brief 根据退场银币获取可玩的房间等级
--@return (int) 返回场次id 如果没找到则返回-1
GameInfoIsolater.getPlayableLevelIdByExitMoney = function(self, gameId, money, currentLevelId)
    return kGameManager:getPlayableLevelIdByExitMoney(gameId, money, currentLevelId);
end

--@brief 根据退场银币获取可玩的房间等级
--@return (int) 返回场次id 如果没找到则返回-1
GameInfoIsolater.getPlayableLevelIdWithMoney = function(self, gameId, money, currentLevelId)
    return kGameManager:getPlayableLevelIdWithMoney(gameId, money, currentLevelId);
end

--@brief 判断当前游戏是否开启了防作弊
--@return (boolean)
GameInfoIsolater.checkIsDuringDefenseCheatTime = function(self, roomLevelId, gameId)
    return kGameManager:isDuringDefenseCheatTime( (roomLevelId or self:getCurRoomLevelId()), (gameId or self:getCurGameId()) );
end

--[[
    @brief 根据游戏ID获取游戏配置,包含id,pkg,sort,display
    return {table} 
        t = 
        {
            ["isPrivate"] = false;
            ["sort"] = 2;
            ["url"] = "http://365.oa.com/share/release/dfqp/dongbei/203001/resources/g203/55/55.zip?v=1470306206";
            ["iconcomming"] = "http://365.oa.com/cdn/images/games/logo_ddz_nf.png?v=1406887571";
            ["size"] = 6937283;
            ["hash"] = "70316428664fe7b722052c99edfc7ecc";
            ["pushdate"] = 0;
            ["id"] = 203;
            ["has_free"] = 0;
            ["isMatch"] = false;
            ["desc"] = "这是一款老少咸宜的棋牌游戏，刺激有趣，快来试试吧！";
            ["name"] = "斗地主";
            ["position"] = 0;
            ["display"] = 0;
            ["icon"] = "http://uchead.static.17c.cn/dfqp/images/games/235b5ed5.png";
            ["isnew"] = 0;
            ["game_pkg"] = "games/ddz";
        };
--]]
GameInfoIsolater.getGameConfigById = function(self, gameId)
    return kGameManager:getGameConfigById(gameId);
end

--@brief 获取游戏自定义房间列表配置 （WARNING 没啥用！！！）
GameInfoIsolater.getGameCustomRoomLevelConfig = function(self,gameId)
    return kGameManager:getGameCustomRoomLevelConfig(gameId);
end

--[[
    @brief 获取游戏房间信息
    @return 房间信息
    t = 
        {
            ["baseChip"] = 50;
            ["extra_info"] = 
            {
            };
            ["levelId"] = 12;
            ["canExit"] = false;
            ["defense_cfg"] = 
            {
            };
            ["isSilver"] = 0;
            ["auto_by_money"] = 0;
            ["sort"] = 12;
            ["icon"] = "http://uchead.static.17c.cn/dfqp/images/games/249c4c10.png";
            ["exitMaxMoney"] = 40000;
            ["maxMoney"] = 34999;
            ["minMoney"] = 3000;
            ["isZuan"] = false;
            ["isMatch"] = false;
            ["desc"] = "";
            ["levelName"] = "nil";
            ["min_chip"] = 0;
            ["max_chip"] = 0;
            ["gameId"] = 203;
            ["min_buy_money"] = 0;
            ["exitMinMoney"] = 3000;
            ["max_buy_money"] = 0;
            ["playerNum"] = 284;
            ["invitation"] = true;
        };
--]]
GameInfoIsolater.getGameLevelInfo = function(self,gameId, levelId)
    return kGameManager:getGameLevelInfo(gameId, levelId);
end

--@brief 判断场次是否存在
--@return  true:存在  false:不存在
GameInfoIsolater.isLevelExist = function(self, gameId, levelId)
    return kGameManager:isLevelExist(gameId, levelId);
end

--WARN 游戏中依赖大厅定义的数据结构。不合理，少用。
--@获取游戏各房间级别信息
--@param gameId:游戏id
--@param islevel_500:是否返回快速场数据，不传或0不返回，1返回
--@return {table} 一个数组 数组内包含了从每个场次的信息
GameInfoIsolater.getGameLevelListByGameId = function(self,gameId, islevel_500)  
    --数据结构改变，兼容老接口
    local levelList = {}
    local tmpList = kGameManager:getGameLevelListByGameId(gameId, islevel_500);
    if not(table.isEmpty(tmpList)) and  not(table.isEmpty(tmpList.data)) then
        for k,v in pairs(tmpList.data) do 
            for kk,vv in pairs(v.tab_data or {}) do
                table.insert(levelList,vv);
            end
        end
    end
    return levelList;
end


--@brief 当前游戏类型
GameInfoIsolater.setCurGameType = function(self,gameType)
    kAppData:setCurGameType(gameType);
end
GameInfoIsolater.getCurGameType = function(self)
    return kAppData:getCurGameType();
end

--@brief 当前游戏id
GameInfoIsolater.setCurGameId = function(self,gameId)
    kGameManager:setCurGameId(gameId);
end
GameInfoIsolater.getCurGameId = function(self)
    return kGameManager:getCurGameId();
end

--@brief 设置上一次的游戏id
GameInfoIsolater.setLastGameId = function(self,gameId)
    return kGameManager:setLastGameId(gameId);
end
GameInfoIsolater.getLastGameId = function(self)
    return kGameManager:getLastGameId();
end

--@brief 设置当前房间等级id
GameInfoIsolater.setCurRoomLevelId = function(self,roomLevelId)
    kGameManager:setCurRoomLevelId(roomLevelId);
end
GameInfoIsolater.getCurRoomLevelId = function(self)
    return kGameManager:getCurRoomLevelId();
end

--@brief 获取上一次房间等级id
GameInfoIsolater.getLastRoomLevelId = function(self)
    return kGameManager:getLastRoomLevelId();
end

--@brief 设置当前桌子id
GameInfoIsolater.setCurTableId = function(self,tableId)
     kGameManager:setCurTableId(tableId);
end
GameInfoIsolater.getCurTableId = function(self)
    return kGameManager:getCurTableId();
end

--@brief 设置当前桌子短id
GameInfoIsolater.setCurShortTableId = function(self,tableId)
     kGameManager:setCurShortTableId(tableId);
end
GameInfoIsolater.getCurShortTableId = function(self)
    return kGameManager:getCurShortTableId();
end

--@brief 当前房间ip
GameInfoIsolater.setCurRoomIp = function(self,ip)
    kGameManager:setCurRoomIp(ip);
end
GameInfoIsolater.getCurRoomIp = function(self)
    return kGameManager:getCurRoomIp();
end

--@brief 当前房间port
GameInfoIsolater.setCurRoomPort = function(self,ip)
    kGameManager:setCurRoomPort(ip);
end
GameInfoIsolater.getCurRoomPort = function(self)
    return kGameManager:getCurRoomPort();
end

--@brief 是否在游戏房间
GameInfoIsolater.setIsInRoom = function(self,isInRoom)
    kGameManager:setIsInRoom(isInRoom);
end
GameInfoIsolater.isInRoom = function(self)
    return kGameManager:isInRoom();
end

--@brief 是否在比赛房间
GameInfoIsolater.isInMatchRoom = function(self)
    return kAppData:isInMatchRoom();
end

--[[
    @brief 设置当前比赛信息
    @param info 比赛信息
        local info = {
            mid
            time
            nick
            matchId
            matchName
            matchEntyfee
            matchCoin
            matchCcsq
            message
        };
--]]
GameInfoIsolater.setCurMatchInfo = function(self,info)
    kAppData:setCurMatchInfo(info);
end

--@brief 是否在防作弊房间
GameInfoIsolater.isRoomAntiCheating = function(self,gameId,levelId)
    return kAppData:isRoomAntiCheating(gameId,levelId);
end

--@brief 设置跳转命令
--@param stateId 状态id
--@param info (table) 跳转参数
GameInfoIsolater.setGameToWhereState = function(self,stateId, info)
    kAppData:setGameToWhereState(stateId, info);
end

--@brief 获取当前服务器时间
GameInfoIsolater.getRightTimeWithServer = function(self)
    return kAppData:getRightTimeWithServer();
end

--@brief 设置|获取升场信息
GameInfoIsolater.setRoomUpLevelInfo = function(self,upLevelInfo)
    HallDataInterface.getInstance():setRoomUpLevelInfo(upLevelInfo);
end
GameInfoIsolater.getRoomUpLevelInfo = function(self)
    return HallDataInterface.getInstance():getRoomUpLevelInfo();
end

--@brief 设置房间降场被踢信息
--@param degradeInfo 降场信息
--[[
    eg:
    degradeInfo = {
        disMoney = 100; --还缺多少钱
        curGameId  = 203; --当前游戏id
        tarLevelId = 11; --被踢到的场次id
    }
]]
GameInfoIsolater.setDegradeInfo = function(self,degradeInfo)
    HallDataInterface.getInstance():setDegradeInfo(degradeInfo);
end
GameInfoIsolater.getDegradeInfo = function(self)
    return HallDataInterface.getInstance():getDegradeInfo();
end

--@brief 设置房间准备速配失败信息
--@param quickMatingInfo 速配信息
--[[
    eg:
    quickMatingInfo = {
        savedMoney = 100; --存入保险箱的钱
    }
]]
GameInfoIsolater.setReadyQuickMatingFailedInfo = function(self, quickMatingInfo)
    self.m_quickMatingInfo = quickMatingInfo;
end
GameInfoIsolater.getReadyQuickMatingFailedInfo = function(self)
    return self.m_quickMatingInfo;
end

--此部分为踢人的status
--status --- true 被踢出
--status --- 9001 server升级踢出
GameInfoIsolater.setKickUserStatus = function(self,status)
    self.m_kickUserStatus = status;
end
GameInfoIsolater.getKickUserStatus = function(self)
    return self.m_kickUserStatus;
end

--是否有点击房间里面的支付按钮
GameInfoIsolater.setClickRoomRecharge = function(self,isClick)
    self.m_hasClickRoomRecharge = click;
end
GameInfoIsolater.hasClickRoomRecharge = function(self)
    return self.m_hasClickRoomRecharge;
end

----------------------------------------------
--@brief 普通房间类型
GameInfoIsolater.getNormalRoomGameType = function(self)
    return AppData.ROOM_NORMAL;
end

--@brief 普通房间重连类型
GameInfoIsolater.getNormalRoomReconnectType = function(self)
    return AppData.NORMAL_ROOM_RECONNECT;
end

--@brief 普通房间好友邀请进房间
GameInfoIsolater.getNormalRoomFriendInviteType = function(self)
    return AppData.NORMAL_ROOM_FRIEND_INVITE;
end

--@brief 设置普通房间重连类型
GameInfoIsolater.setInNormalReconnectRoom = function(self)
    self:setCurGameType(AppData.NORMAL_ROOM_RECONNECT);
end

--@brief 判断是否在普通房间
GameInfoIsolater.isInNormalRoom = function(self)
    local curGameType = self:getCurGameType();
    return curGameType == AppData.ROOM_NORMAL 
        or curGameType == AppData.NORMAL_ROOM_FRIEND_INVITE
        or curGameType == AppData.NORMAL_ROOM_RECONNECT;
end

--@brief 是否在普通房间内重连
GameInfoIsolater.isInNormalReconnectRoom = function(self)
    local curGameType = self:getCurGameType();
    return curGameType == AppData.NORMAL_ROOM_RECONNECT;
end

--@brief 获取大厅类型
GameInfoIsolater.getHallGameType = function(self)
    return GameType.HALL;
end

--@brief 设置登陆房间的扩展信息
--@param extparam (table) 此扩展信息会在0x119命令里面带给server，server可以对此进行解析
--@note 通过此接口，子游戏可以带上子游戏的扩展参数
--根据gameId,levelId 获取玩法信息 没有获取到时返回 nil
GameInfoIsolater.getPlayTypeByLevelId  = function(self,p_gameId,p_levelId)
    return  kGameManager:getPlayTypeByLevelId(p_gameId,p_levelId); 
end

--根据gameId,levelId 获取底注类型 没有获取到时返回 nil
GameInfoIsolater.getMoneyTypeByLevelId =  function(self,p_gameId,p_levelId)
    return  kGameManager:getMoneyTypeByLevelId(p_gameId,p_levelId);
end

--加一个用名字来取对应的level属性的方法，，不需要一个属性对应一个接口
--以后增加属性的时候也不需要重新加接口
GameInfoIsolater.getPropByLevelPropName =  function(self,p_gameId,p_levelId,p_propName)
                                                          -- p_propName 
                                                                        -- "min_money"          --进入房间的下限  没拿到返回nil
                                                                        -- "max_money"          --进入房间的上限  没拿到返回nil
                                                                        -- "exitMinMoney"       --退出房间的下限  没拿到返回nil
                                                                        -- "exitMaxMoney"       --退出房间的上限  没拿到返回nil
                                                                        -- "readyDegradeSwitch" --配桌降场开关,返回true和false,没拿到返回false
                                                                        -- "readyDegradeTime"   --配桌降场等待的时间，没拿到返回nil
                                                                        -- "baseChip"           --底注 没拿到返回0
    local levelInfo = kGameManager:getGameLevelInfo(p_gameId, p_levelId) or {};

    if p_propName == "min_money" then
        return levelInfo.minMoney;
    elseif p_propName == "max_money" then
        return levelInfo.maxMoney;
    elseif p_propName == "exitMinMoney" then
        return levelInfo.maxMoney;
    elseif p_propName == "exitMaxMoney" then
        return levelInfo.maxMoney;  
    elseif p_propName == "readyDegradeSwitch" then 
        return levelInfo.descend_switch == 1;
    elseif p_propName == "readyDegradeTime" then 
        return levelInfo.descend_seconds;
    elseif p_propName == "baseChip" then 
        return levelInfo.baseChip or 0;
    end
end

--获取与指定levelId相同玩法、相同货币类型的所有的levelId列表（包含原来的场次id）
GameInfoIsolater.getLevelIdMatchPlayTypeAndMoneyTypeByLevelId = function(self,p_gameId,p_levelId)
    return kGameManager:getLevelIdMatchPlayTypeAndMoneyTypeByLevelId(p_gameId,p_levelId);
end

--获取游戏中指定玩法和指定货币类型的所有的levelId列表
GameInfoIsolater.getLevelIdByPlayTypeAndMoneyType = function(self,p_gameId,playType,moneyType)
    return kGameManager:getLevelIdByPlayTypeAndMoneyType(p_gameId,playType,moneyType);
end

--得到游戏ID对应的所有的 levelId列表
GameInfoIsolater.getLevelIdsByGameId =  function(self,p_gameId)
    return kGameManager:getLevelIdsByGameId(p_gameId);
end

--进入游戏扩展参数接口
GameInfoIsolater.setGameExtParam = function(self,extparam)
    kGameManager:setGameExtParam(extparam);
end
GameInfoIsolater.getGameExtParam = function(self)
    return kGameManager:getGameExtParam();
end

--获取游戏自定义配置
GameInfoIsolater.getGameCustomConfigWithKey = function(self, gameid, key)
    return kGameManager:getGameCustomConfigWithKey(gameid, key);
end

--@brief 判断是否支持银元场
GameInfoIsolater.isSupportSilver = function(self)
    return HallDataInterface.getInstance():isSupportSilver();
end

--@brief 判断是否在银元场
GameInfoIsolater.isInSilverroom = function ( self )
    local gameId = kGameManager:getCurGameId();
    local levelId = kGameManager:getCurRoomLevelId();
    if kGameManager:isSilverRoom(gameId, levelId) then 
        return true;
    else 
        return false;
    end
end

--@brief  设置登录状态为掉线，会重新登录
GameInfoIsolater.setLoginOffline = function(self)
    kLoginDataInterface:setLoginState(LoginConstants.eLoginState.Offline);
end

----------------------------------------------提供一些接口帮助子游戏or子模块管理全局变量 or DICT 文件--------------- 

--@brief 此组接口帮子游戏or子模块维护了其全局变量，用于解决子游戏需要将数据缓存到内存时，避免采用全局变量。
--@param gameId 这里传的gameId必须保证合法
--@param variableName 变量名 variable在相同的gameId内应该是唯一的
--@return 如果值存在则返回对应值的引用，如果不存在，则返回nil
GameInfoIsolater.getSubGameGloablVariable = function(self, gameId, variableName)
    Log.v("GameInfoIsolater.getSubGameGloablVariable", " gameId = ", gameId , " variableName = ", variableName);
    if not (gameId and variableName) then
        return nil;
    end

    gameId = tostring(gameId);
    self.m_subGameGlobalVeriableMap = table.verify(self.m_subGameGlobalVeriableMap);
    return self.m_subGameGlobalVeriableMap[gameId] and self.m_subGameGlobalVeriableMap[gameId][variableName];
end

--@brief 将子游戏需要维护的数据保存到内存中，防止进入游戏每次都需要重新加载
--@param gameId 这里传的gameId必须保证合法
--@param variableName 变量名 variable在相同的gameId内应该是唯一的
--@param value 任何值
GameInfoIsolater.setSubGameGlobalVariable = function(self, gameId, variableName, value)
    Log.v("GameInfoIsolater.setSubGameGlobalVariable", " gameId = ", gameId , " variableName = ", variableName, " value = ", value);
    if not (gameId and variableName and value) then
        return;
    end

    gameId = tostring(gameId);
    self.m_subGameGlobalVeriableMap = table.verify(self.m_subGameGlobalVeriableMap);
    self.m_subGameGlobalVeriableMap[gameId] = table.verify(self.m_subGameGlobalVeriableMap[gameId]);
    self.m_subGameGlobalVeriableMap[gameId][variableName] = value;
end

--@brief 获取子游戏or子模块DICT文件名前缀，防止子游戏&子模块&大厅存储DICT文件时，文件名冲突
GameInfoIsolater.getSubGameDictNamePrefix = function(self, gameId)
    if not gameId then
        return nil;
    end

    return string.format("SubGameDictName%s", gameId);
end

--[[
    @brief 判断微信分享开关是否开启
    @return boolean
--]]
GameInfoIsolater.isShareWechatSwitchOpen = function(self)
    return HallDataInterface.getInstance():isShareWechatSwitchOpen();
end

--[[
    @brief 是否支持比赛模块
    @return boolean
--]]
GameInfoIsolater.isGameSupportMatchFeature = function(self, gameId)
    return HallFeatureManager.getInstance():isGameSupportMatchFeature(gameId);
end

--[[
    @brief 是否支持积分房模块
    @return boolean
--]]
GameInfoIsolater.isGameSupportPrivateRoomScoreFeature = function(self, gameId)
    return HallFeatureManager.getInstance():isGameSupportPrivateRoomScoreFeature(gameId);
end

--[[
    @brief 是否支持私人房银币场
    @return boolean
--]]
GameInfoIsolater.isGameSupportPrivateRoomSilverCoinFeature = function(self, gameId)
    return HallFeatureManager.getInstance():isGameSupportPrivateRoomSilverCoinFeature(gameId);
end

--[[
    @brief 是否支持私人房金条场
    @return boolean
--]]
GameInfoIsolater.isGameSupportPrivateRoomGoldBarFeature = function(self, gameId)
    return HallFeatureManager.getInstance():isGameSupportPrivateRoomGoldBarFeature(gameId);
end

--[[
    @brief 是否支持比赛围观
    @return boolean
--]]
GameInfoIsolater.isGameSupportOnlookerMatchFeature = function(self, gameId)
    return HallFeatureManager.getInstance():isGameSupportOnlookerMatchFeature(gameId);
end
