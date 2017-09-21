require("core/object");
require("core/dict");
local GameRoomLevelConfig = require("hall/main/data/gameRoomLevelConfig");

AppData = class();

AppData.ctor = function(self)
	-- body
	self.m_isFirstOpen = true;
end

AppData.cleanup = function()
    AppData.releaseInstance();
    kAppData = AppData.getInstance();
end

AppData.getInstance = function()
    if not AppData.s_instance then
        AppData.s_instance = new(AppData);
    end

    return AppData.s_instance;
end

AppData.releaseInstance = function()
    delete(AppData.s_instance);
    AppData.s_instance = nil;
end

AppData.setIsFirstOpen = function(self, isFirstOpen)
    self.m_isFirstOpen = isFirstOpen;
end 

AppData.isFirstOpen = function(self)
    return self.m_isFirstOpen;
end 

AppData.isGameToCharge = function(self)
    -- body
    return self.m_isGameToCharge;
end

AppData.setIsGameToCharge = function(self, bool)
    -- body
    self.m_isGameToCharge = bool;
end


AppData.NORMAL_ROOM_RECONNECT = 100 + 10; --普通房间重连
AppData.ROOM_NORMAL = 100 + 0; --普通房间
AppData.PRIVATE_ROOM = 100 + 1;--私人房
AppData.PRIVATE_ROOM_RECONNECT = 100 + 2;--私人房重连
AppData.PRIVATE_ROOM_STATUS_CHECK = 100 + 3;
AppData.NORMAL_ROOM_FRIEND_INVITE = 100 + 4;--普通房间好友邀请进房间


AppData.setCurGameType = function(self, gameType)
    -- body
    self.m_curGameType = gameType;
end

AppData.getCurGameType = function(self)
    -- body
    return self.m_curGameType or AppData.ROOM_NORMAL;
end

AppData.isInPrivateRoom = function(self)
    local curRoomLevel = kGameManager:getCurRoomLevelId();
    return self.m_curGameType == AppData.PRIVATE_ROOM 
    or self.m_curGameType == AppData.PRIVATE_ROOM_RECONNECT 
    or self:checkIsPrivateRoomLevel(curRoomLevel);   
end

AppData.checkIsPrivateRoomLevel = function(self,roomLevel)
    for _,v in pairs(GameRoomLevelConfig.privateRoomLevel) do 
        if v == roomLevel then 
            return true;
        end 
    end

    return false;
end

--保存当前进入的私人房的信息
AppData.setCurPrivateRoomInfo = function(self, data)
    -- body
    self.m_curPrivateRoomInfo = data;
end

AppData.getCurPrivateRoomInfo = function(self)
    -- body
    return self.m_curPrivateRoomInfo;
end

--!!!!!!!!!!!请不要用这个方法  通过gameManager进行使用
AppData.getCurTableId = function(self)
    -- -- body
    -- return self.m_curTableId or 0;
    return kGameManager:getCurTableId();
end

--!!!!!!!!!!!请不要用这个方法 通过gameManager进行使用
AppData.setCurTableId = function(self, tableId)
    -- -- body
    -- self.m_curTableId = tableId;
    kGameManager:setCurTableId(tableId);
end

--!!!!!!!!!!!请不要用这个方法，统一用setJumpData
AppData.setGameToWhereState = function(self, stateId, info)
    CommonJumpLogic.getInstance():setJumpData(nil, stateId, {info} );
end

AppData.isCanEscape = function(self)
    -- body
    return self.m_isPrivateCanEscape;
end

AppData.setIsCanEscape = function(self, canAble)
    -- body
   self.m_isPrivateCanEscape = canAble; 
end

-- 比赛类型
AppData.NORMAL_IMMEDIATE_MATCH     = 0; -- 一般快速赛
AppData.FIXED_TIME_MATCH           = 3; -- 定时赛

AppData.MATCH_RECONNECT            = 1000 + 1;     -- 比赛重连
AppData.MATCH_RECONNECT_INGAME     = 1000 + 2;     -- 比赛游戏中重连
AppData.MATCH_NONE                 = 1000 + 3;     --

-- 判断是否是在定局/定时 比赛房间中
AppData.isInMatchRoom = function(self)
    local curRoomLevel = kGameManager:getCurRoomLevelId();
    return self.m_curGameType == AppData.NORMAL_IMMEDIATE_MATCH 
        or self.m_curGameType == AppData.FIXED_TIME_MATCH 
        or self.m_curGameType == AppData.MATCH_RECONNECT 
        or self.m_curGameType == AppData.MATCH_RECONNECT_INGAME
        or self:checkIsMatchRoomLevel(curRoomLevel);
end

AppData.checkIsMatchRoomLevel = function(self,roomLevel)
    for _,v in pairs(GameRoomLevelConfig.matchRoomLevel) do 
        if v == roomLevel then 
            return true;
        end 
    end 
    return false;
end


AppData.isRoomAntiCheating = function(self, gameId, levelId)
    -- body
    levelId = number.valueOf(levelId);
    gameId = number.valueOf(gameId);
    if levelId >=14 and levelId <= 21 and gameId == GameType.SCDDZ then
        return true;
    else
        return false;
    end
end

AppData.setCurMatchInfo = function(self, info)
    self.m_curMatchInfo = info;
end

-- 设置server时间，并计算与系统时间差值
AppData.setServerTime = function ( self, serverTime )
    -- body
    self.m_serverTime = serverTime;
    local localTime = os.time();
    -- 服务器时间减系统时间，大于0即系统时间慢了，小于0即系统时间快了
    self.m_diffTime = os.difftime(serverTime, localTime); 
end

--获取登录时server时间
AppData.getLoginServerTime = function(self)
    return self.m_serverTime;
end

-- 根据server时间获取当前正确时间
AppData.getRightTimeWithServer = function ( self )
    local time = os.time() + (self.m_diffTime or 0); -- 较准时间
    return time;
end

--应用本次启动时间(本地时间)
AppData.getFirstOpenTime = function(self)
    return self.m_firstOpneTime or 0
end
AppData.setFirstOpenTime = function(self, time)
    self.m_firstOpneTime = time
end

----------------------------------
kAppData = AppData.getInstance();