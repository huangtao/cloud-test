
--[[
    游戏管理类，其功能有如下几点
    1：管理大厅和具体游戏间的切换工作
    2：对游戏的一些数据进行管理如：
        (包名、游戏版本号、大厅支持的游戏最低可玩版本号、游戏icon，当前游戏id、当前游戏level、游戏名字等等)；
]]

require("gameData/dataInterfaceBase");
require("hall/main/data/gameLevelData");
require("util/gamePrefixCheckUtil");
require("hall/moreGames/data/moreGamesDataInterface");
require("hall/gameData/screenOrientationManager");
require("hall/main/data/hallFeatureManager");

----------------------------------------------------------------
--@brief 游戏类型，此处只枚举了大厅使用到的id，子游戏则根据其gameid进行跳转即可
GameType = 
{
    HALL                = 100;          -- 大厅
    AGENCY_LUA          = 10000000;     -- 代理商
    MATCH               = 20000000;     -- 抽象比赛类型，用于重连新框架比赛
};

------------------------子游戏gameConfig配置映射表-----------------------

--@brief 游戏版本号映射表
--@note 对应字段 _gameVersion eg-> _gameVersion = 10
local GameVersionMap = {};

--@brief 游戏名称映射表
--@note 对应字段 _gameName eg-> _gameName = "斗地主"
local GameNameMap = {};

--@brief 大厅游戏顶部icon映射表
--@note 对应字段 _gameHallTitle eg-> _gameHallTitle = "games/magu/hall_title.png"
local GameHallTitleMap = {};

--@brief 游戏加载函数映射表 老版本用这个
--@note 对应字段 _LoadFiles eg-> _LoadFiles = function() XXX end
local GameLoadFileFun = {};

--@brief 新的游戏文件加载映射表 以后应该按照这种格式来使用
--@note 对应字段 _LoadCommonFiles & _LoadGameFiles
local GameLoadFileFun_new = {};

--@brief 游戏分辨率映射表
--@note 对应字段 _gameResolution eg-> _gameResolution = {1280, 720}
local GameResolutionMap = {
    [GameType.HALL] = {1280, 720};
}

--@brief 游戏是否竖屏 0:横屏 1:竖屏
--@note 对应字段 _gameVerticalScreen eg-> _gameVerticalScreen = 0;
local GameVerticalScreen = {}

--@brief 游戏是否使用新框架，1：新，0：旧  eg-> gameid:1
--@note 对应字段 _gameDependFrame eg-> _gameDependFrame = 1
local GameDependFrame = {}

--@brief 游戏所依赖的大厅版本号
--@note 对应字段 _gameDependHallMinVersion eg-> _gameDependHallMinVersion = 700
local GameDependHallMinVersion = {};

--@brief 游戏自定义界面配置表
--[[
    @note 对应字段 _gameCustomView
    包含字段 _roomLevelListView -> 对应游戏场次列表自定义界面的路径
    包含字段 _privateRoomParamSetView -> 对应游戏私人房自定义界面的路径
    包含字段 _privateRoomEnterView -> 对应私人房搜索房间后进入房间弹框界面
    包含字段 _gameLevelTab -> 对应游戏选场界面顶部TAB控件

    eg: _gameCustomView = {
        _roomLevelListView = "games/magu/maguGameLevelListView";
        _privateRoomParamSetView = "games/magu/maguCustomParamSetView";
        _privateRoomEnterView = "hall/privateRoom/widget/privateRoomEnterViewCommon";
        _gameLevelTab =  "games/magu/gameLevelTab";
    };
--]]
local GameCustomView = {}

--@brief 游戏自定义数据类
--[[
    @note 对应字段 _gameCustomConfig  大厅只做缓存，具体需要哪些字段由游戏控制
    目前已知字段 _customPlayerInfoHandler  用于登录时扩展传给server的参数
]]
local GameCustomConfig = {}


--@brief 字段 _gameSupportFeatureConfig 具体详情参考 HallFeatureManager 里面内容


----------------------------------------------------------------
GameManager =  class(DataInterfaceBase);

GameManager.Delegate = {
    onGetGameLevelCallBack = "onGetGameLevelCallBack";
    onGetGameListCallBack = "onGetGameListCallBack";
    onGetGameLevelPlayerNumCallBack = "onGetGameLevelPlayerNumCallBack";
    onMonitorStateChangedCallBack = "onMonitorStateChangedCallBack";
}

GameManager.eScreenCallback = {
    Game = 1,
    Scene = 2,
    Module = 3,
}

GameManager.initInstance = function()
    kGameManager = GameManager.getInstance();
end

GameManager.getInstance = function()
    if not GameManager.s_instance then
        GameManager.s_instance = new(GameManager);
    end
    return GameManager.s_instance;
end

GameManager.ctor= function ( self )
    self.m_apkVersion = ""; --版本号

    self.m_gameInitStatus = {}; --游戏初始化状态映射表
    self.m_gamesPlayableConfig = table.verify( RegionConfigDataInterface.getInstance():getRegionGamesPlayableConfig() ); --大厅对应的游戏可玩版本号
    self.m_gamePackagePathMap = { --游戏路径配置 eg-> gameid:"games/gamePkgName"
        [GameType.HALL] = "hall";
    };

    self.m_curGameId = 0; --当前所在游戏的id
    self.m_lastGameId = 0; --刚才所在游戏的id

    self.m_curRoomLevelId = 0; --当前所在房间等级id
    self.m_lastRoomLevelId = 0; --刚才所在房间等级id

    self.m_curTableId = 0; --当前桌子id

    local LastEnterGameLevel = require("hall/main/data/lastEnterGameLevel");
    self.m_curGameLevelTab = new(LastEnterGameLevel,self);
    self.m_gameLevelData = new(GameLevelData, self);
	local HallGameListConfig = require("hall/main/data/hallGameListConfig");
    self.m_gameListConfig = new(HallGameListConfig, self);
    local HallModuleListConfig = require("hall/main/data/hallModuleListConfig");
    self.m_moduleListData = new(HallModuleListConfig,self);

    ScreenOrientationManager.getInstance():setObserver(self)
end

GameManager.dtor = function(self)
    delete(self.m_gameLevelData);
    self.m_gameLevelData = nil;
    
    delete(self.m_curGameLevelTab);
    self.m_curGameLevelTab = nil;

    delete(self.m_gameListConfig);
    self.m_gameListConfig = nil;

    delete(self.m_gameLevelConfig);
    self.m_gameLevelConfig = nil;
    
    delete(self.m_moduleListData);
    self.m_moduleListData = nil;

    ScreenOrientationManager.getInstance():clearObserver(self)
end

--@brief 大厅内部场景切换接口(特指需要判断屏幕方向的场景切换)
--@param stateId 状态id
--@param orientation 横竖屏方向
--@param resolution 分辨率 eg:{1280,720}
--@param isPushState 是否使用pushState的方法
GameManager.startChangeScene = function(self, stateId, orientation, resolution, isPushState, style, ...)
    if self.m_screenOrienChanging then
        --调用原生切换屏幕方向期间，不允许调用切换场景，否则会导致加载顺序和屏幕切换时机错误，导致界面显示错误
        --一般情况下都是为了防止房间内多次调用切换到大厅引发问题
        self:__log("startChangeScene", "the screen orientation is changing YOU MUST WAIT THE OPERATTION FINISH!!!!!!!!!");
        return;
    end
   
    orientation = orientation or ScreenOrientationManager.eScreenOrien.LANDSCAPE;
    resolution = resolution or {1280, 720};

    local temp = { 
        typ = GameManager.eScreenCallback.Scene,
        stateId = stateId,
        args = {...},
        resolution = resolution,
        isPushState = isPushState,
    };

    local curScreenOrien = ScreenOrientationManager.getInstance():getCurScreenOrientation()
    if curScreenOrien ~= orientation then
        self.m_enterGameCache = temp;
        self:__changeScreenOrien(orientation)
    else
        self:__setResolution(resolution[1], resolution[2]);
        self:__enterScene(temp)
    end
end

--大厅和模块之间的跳转接口
--@param isPushState 是否使用pushState的方法
GameManager.startEnterModule = function(self, gameid, isPushState, style, ...)
    if self.m_screenOrienChanging then
        self:__log("startEnterModule", "the screen orientation is changing YOU MUST WAIT THE OPERATTION FINISH!!!!!!!!!");
        return;
    end

    self:__startGameOrModule(GameManager.eScreenCallback.Module, self.__enterModule, gameid, isPushState, style, ...);
end

--大厅和房间之间的跳转接口
GameManager.startGame = function(self,gameid,style,...)
    if self.m_screenOrienChanging then
        self:__log("startGame", "the screen orientation is changing YOU MUST WAIT THE OPERATTION FINISH!!!!!!!!!");
        return;
    end

    self:__startGameOrModule(GameManager.eScreenCallback.Game, self.__enterGame, gameid, false, style, ...);
end

GameManager.__startGameOrModule = function(self, typ, func, gameid, isPushState, style, ...)
    self:initGame(gameid);

    local bFind = false;
    for k,v in pairs(States) do
        if v == gameid and States[k] then

            local temp = { 
                typ = typ;
                gameid = gameid,
                newState = States[k],
                args = {...},
                isPushState = isPushState,
                resolution = self:getGameResolution(gameid);
            };

            local gameScreenOrien = self:getGameVerticalScreen(gameid);
            local curScreenOrien = ScreenOrientationManager.getInstance():getCurScreenOrientation();

            self:__log("__startGameOrModule", "gameScreenOrien , curScreenOrien = ", gameScreenOrien, curScreenOrien);
            if curScreenOrien ~= gameScreenOrien then
                --如果屏幕方向不同，则调用原生切换方向
                self.m_enterGameCache = temp;
                self:__changeScreenOrien(gameScreenOrien)
            else
                self:__log("__startGameOrModule", "the orientation is same curScreenOrien");
                
                --屏幕方向相同，则直接进入房间
                self:__setResolutionByGameId(gameid);--设置分辨率
                func(self, temp);
            end    

            bFind = true;
            break;
        end
    end

    if not bFind then
        self:__log("__startGameOrModule", "don't find state, please check subgame gameConfig file and confirm gameid equal stateid, stateid = ", gameid, "  States = ", States);
    end
end

GameManager.__changeScreenOrien = function(self, orientation)
    ScreenOrientationManager.getInstance():setCurScreenOrientation(orientation)
    if kPlatformWin32 == NativeEvent.s_platform then
        self:onChangeScreenOrientationCallBack(true)
    else
        self:__log("__changeScreenOrien", "start call changeScreenOrientation orientation = ", orientation);
        self.m_screenOrienChanging = true
        ScreenOrientationManager.getInstance():changeScreenOrientation( orientation == ScreenOrientationManager.eScreenOrien.LANDSCAPE )
    end
end

--@brief 进入场景
GameManager.__enterScene = function(self, temp)
    self:__log("__enterScene", " data = ", temp);

    local stateId = temp.stateId;
    StateMachine.getInstance():changeState(stateId)
    self:notify(GameManager.Delegate.onMonitorStateChangedCallBack);
end

--@brief 进入模块
GameManager.__enterModule = function(self, temp)
    self:__log("__enterModule", " data = ", temp);

    local gameid = temp.gameid;
    local newState = temp.newState;
    local isPushState = temp.isPushState;

    self:__loadFiles(gameid, false);

    local isInHall = (gameid == GameType.HALL) and true or false;
    self:__setFPS(isInHall);
    self:setIsInRoom(false);
    self:setIsInModule(not isInHall);

    if isPushState then
        StateMachine.getInstance():pushState(newState, style, gameid, unpack(temp.args) );
    else
        StateMachine.getInstance():changeState(newState, style, gameid, unpack(temp.args) );
    end

    self:notify(GameManager.Delegate.onMonitorStateChangedCallBack);
end

--@brief 进入房间逻辑
GameManager.__enterGame = function(self, temp)
    self:__log("__enterGame", " data = ", temp);

    local gameid = temp.gameid;
    local newState = temp.newState;
    local isPushState = temp.isPushState;

    -- 同一个房间内重连，不需要重新加载资源，否则会导致全局表被重置，导致游戏异常！！！
    -- 从一个游戏房间跳到另一个游戏房间需重新加载资源
    -- 从大厅进游戏需要重新加载资源
    if (not self:isInRoom()) or (gameid ~= self:getLastGameId()) then 
        ClearGameRequiredPath(); --先清除游戏内包含的文件，防止游戏间的冲突
        self:__loadFiles(gameid, false);
    end

    local isInHall = (gameid == GameType.HALL) and true or false;
    self:__setFPS(isInHall);
    self:setIsInModule(false);
    self:setIsInRoom(not isInHall);

    if (gameid ~= GameType.HALL) then
        self:setCurGameId(gameid);
        OnlineSocketManager.getInstance():setHeartBeatInterval(6000)
    else
        OnlineSocketManager.getInstance():setHeartBeatInterval(10000)
    end

    if kAppData:isInMatchRoom() then
        local isNewFrame = self:getGameDependFrame(gameid) == 1; --使用新框架，并且比赛场景存在，则跳入比赛场景
        self:__log("__enterGame", "current is in match room, begin goto match room and isNewFrame = ", isNewFrame);
        if isNewFrame then 
            local bFindMatchRoom = false;
            for kk,vv in pairs(States) do
                if vv == GameType.MATCH and States[kk] then
                    bFindMatchRoom = true;
                    newState = States[kk];
                    break;
                end 
            end

            if not bFindMatchRoom then
                self:__log("__enterGame", " don't find right match room, please check sub game gameConfig");
            end
        end 
    end  

    StateMachine.getInstance():changeState(newState, style, gameid, unpack(temp.args) );
    self:notify(GameManager.Delegate.onMonitorStateChangedCallBack);
end

--设置帧率
GameManager.__setFPS = function(self, isInHall)
    --帧率控制 (房间内改为60帧/s，房间外改为30帧/s)
    -- local fps = isInHall and 30 or 60;
    Clock.instance().maxfps = 60;
end

--屏幕方向切换完成回调
GameManager.onChangeScreenOrientationCallBack = function( self, flag, info )
    self.m_screenOrienChanging = false;

    if table.isEmpty(self.m_enterGameCache) then
        self:__log("onChangeScreenOrientationCallBack", "empty self.m_enterGameCache");
        return;
    end

    self:__log("onChangeScreenOrientationCallBack", "width = ", System.getScreenWidth(),
                                                    "height = ", System.getScreenHeight(),
                                                    "self.m_enterGameCache = ", self.m_enterGameCache);

    local temp = self.m_enterGameCache;
    self.m_enterGameCache = {};

    System.refreshScreenWidth()
    System.refreshScreenHeight()
    self:__setResolution(temp.resolution[1], temp.resolution[2]);

    if temp.typ == GameManager.eScreenCallback.Scene then
        self:__enterScene(temp);
    elseif temp.typ == GameManager.eScreenCallback.Game then
        self:__enterGame(temp);
    elseif temp.typ == GameManager.eScreenCallback.Module then
        self:__enterModule(temp);
    end
end

--将单个游戏的配置动态添加到整体配置中
GameManager.initGame = function(self,gameid)
    self:__log("initGame", "gameid = ", gameid);

    if self.m_gameInitStatus[gameid] then
        self:__log("initGame", "this game has inited");
        return;
    end
    
    self:__parseGameConfig(gameid, false);
end

--更新完毕后，重新初始化游戏
GameManager.reInitGame = function(self,gameid)
    if not gameid then
        return;
    end

    self:__log("reInitGame", "gameid = ", gameid);
    self:__resetGameStatus(gameid);
    self:__parseGameConfig(gameid, true);
end

--解析gameConfig
GameManager.__parseGameConfig = function(self, gameid, isReInit)
    require("isolater/gamePreloadCompatible/gamePreloadCompatibleIsolater");

    self:__log("__parseGameConfig", "gameid = ", gameid, "isReInit = ", isReInit);
    if not gameid or gameid <= 0 then
        self:__log("__parseGameConfig", "illegal gameid");
        return;
    end

    local gamePkg=self.m_gamePackagePathMap[gameid];
    if gamePkg == nil or gamePkg =="" then
        self:__log("__parseGameConfig", "gamePkg is null");
        return;
    end

    local fileName=gamePkg .. "/gameConfig";
    if isReInit then
        --如果是reInit，则需要重新加载此文件
        package.loaded[fileName] = nil;
    end
    
    local isSuccess ,errMsg = pcall(require,fileName);
    if not isSuccess then
        self:__log("__parseGameConfig", "load gameConfig failed, please check gameConfig file of the subgame");
        return;
    end
        
    if not GameVersionMap[gameid] then
        GameVersionMap[gameid]=_gameVersion;
    end

    if not self:isGamePlayable(gameid) then
        --如果版本不兼容，则不继续往下走
        self:__log("__parseGameConfig", "this game isn't playable");
        self:__resetGameConfigVariable();
        return;
    end

    self.m_gameInitStatus[gameid]=true;

    if _initGameFun then
        _initGameFun(isReInit);
    end

    if not GameNameMap[gameid] then
        GameNameMap[gameid]=_gameName;
    end

    if not GameHallTitleMap[gameid] then
        GameHallTitleMap[gameid] = _gameHallTitle ;
    end

    if not GameResolutionMap[gameid] then
        GameResolutionMap[gameid] = _gameResolution; --eg:{1280, 800}
    end

    if not GameVerticalScreen[gameid] then
        GameVerticalScreen[gameid] = _gameVerticalScreen;
    end

    if not GameCustomView[gameid] then
        GameCustomView[gameid] = _gameCustomView;
    end

    if not GameCustomConfig[gameid] then
        GameCustomConfig[gameid] = _gameCustomConfig;
    end

    if not GameDependFrame[gameid] then 
        GameDependFrame[gameid] = _gameDependFrame;
    end 

    if not GameDependHallMinVersion[gameid] then
        GameDependHallMinVersion[gameid] = _gameDependHallMinVersion;
    end


    HallFeatureManager.getInstance():setGameSupportFeatureConfig(gameid, _gameSupportFeatureConfig);

    self:__log("__parseGameConfig", "_gameVersion = ", GameVersionMap[gameid],
                                    "_gameVerticalScreen = ", GameVerticalScreen[gameid], 
                                    "_gameResolution = ", GameResolutionMap[gameid],
                                    "_gameCustomView = ", GameCustomView[gameid],
                                    "_gameCustomConfig = ", GameCustomView[gameid],
                                    "_gameDependHallMinVersion = ", GameDependHallMinVersion[gameid]);

    --兼容
    if not GameLoadFileFun_new[gameid] and _LoadCommonFiles then
        --优先级高
        --{commonLoadFun, gameLoadFun}
        GameLoadFileFun_new[gameid] = {};
        GameLoadFileFun_new[gameid].commonLoadFun = _LoadCommonFiles
        GameLoadFileFun_new[gameid].gameLoadFun = _LoadGameFiles;

    elseif not GameLoadFileFun[gameid] and _LoadFiles then
        GameLoadFileFun[gameid] = _LoadFiles;
    end

    if isReInit then
        self:__setResolutionByGameId(gameid); --设置游戏分辨率，防止游戏初始化控件位置时出问题
        self:__loadFiles(gameid, true);
        self:__setResolutionByGameId(GameType.HALL);--还原到大厅分辨率
    end

    if _dependApkVersion then
        self.m_apkVersion = _dependApkVersion; --只有 hall gameConfig才会有
    end

    --将gameConfig中的状态copy到stateMachine中去
    for k,v in pairs(_States) do
        States[k]=v;
    end

    for k,v in pairs(_StatesMap) do
        StatesMap[k]=v;
    end

    self:__resetGameConfigVariable();

    dict_load(kDFQPGame);
    local data = "";
    for k,v in pairs(GameVersionMap) do
        data = data.."{"..tostring(self:getGameName(k)) ..":";
        data = data.."gameId:"..tostring(k)..",";
        data = data.."version:"..tostring(v).."},";
    end 
    dict_set_string(kDFQPGame , "GamesVersionMap" , data);
    dict_save(kDFQPGame);
end

--设置游戏分辨率
GameManager.__setResolutionByGameId = function(self, gameid)
    local resolution = self:getGameResolution(gameid);
    if not table.isEmpty(resolution) then
        self:__setResolution(resolution[1], resolution[2]);
    end
end

--设置分辨率
GameManager.__setResolution = function(self, width, height)
    System.setLayoutWidth(width);
    System.setLayoutHeight(height);
    WidgetBase.refreshRootNodeSize();
end

--重置游戏的状态
GameManager.__resetGameStatus = function(self, gameid)
    if not gameid then
        return;
    end

    GameVersionMap[gameid]=nil;
    GameNameMap[gameid]=nil;
    GameHallTitleMap[gameid]=nil;
    GameResolutionMap[gameid] = nil;
    GameVerticalScreen[gameid] = nil;
    GameDependFrame[gameid] = nil;
    GameLoadFileFun[gameid] = nil ;
    GameLoadFileFun_new[gameid] = nil;
    GameCustomView[gameid] = nil;
    GameDependHallMinVersion[gameid] = nil;
end

--重置游戏gameConfig中的数据，防止游戏间的相互影响
GameManager.__resetGameConfigVariable = function(self)
    _gameVersion=nil;
    _gameName=nil;
    _gameHallTitle=nil;
    _gameResolution = nil;
    _gameVerticalScreen = nil;
    _gameDependFrame = nil;
    _LoadFiles = nil;
    _LoadCommonFiles = nil;
    _LoadGameFiles = nil;
    _States={};
    _StatesMap={};
    _initGameFun = nil;
    _gameCustomView = nil;
    _gameCustomConfig = nil;
    _gameDependHallMinVersion = nil;
    _gameSupportFeatureConfig = nil;
end

--加载游戏中的文件
GameManager.__loadFiles = function(self, gameid, isUpdate)
    if GameLoadFileFun[gameid] or GameLoadFileFun_new[gameid] then
        if GameLoadFileFun_new[gameid] then
            GameLoadFileFun_new[gameid].commonLoadFun();

            if gameid == GameType.HALL then
                GamePrefixCheckUtil.getInstance():clearPrefix();
            else
                local pkgName = self:getGamePackageName(gameid);
                GamePrefixCheckUtil.getInstance():addPrefix(pkgName);
            end
            GameLoadFileFun_new[gameid].gameLoadFun(isUpdate);

        else
            GameLoadFileFun[gameid](isUpdate);
        end
    end
end

--初始化游戏包名
GameManager.initPkgName = function(self,gameid,pkgName)
    self.m_gamePackagePathMap[gameid] = pkgName;--初始化packageMap
end

--获取游戏版本号
GameManager.getGameVersion = function(self,gameid)
    return GameVersionMap[gameid] or 0;
end

--获取游戏分辨率
GameManager.getGameResolution = function(self, gameid)
    return GameResolutionMap[gameid] or {1280, 720};
end

GameManager.getGameVerticalScreen = function(self,gameid)
    return GameVerticalScreen[gameid] or ScreenOrientationManager.eScreenOrien.LANDSCAPE;
end

--获取子游戏框架类型 1:新框架 0：旧框架
GameManager.getGameDependFrame = function(self,gameid)
    return GameDependFrame[gameid] or 0;
end

--获取子游戏依赖的大厅最小版本号
GameManager.getGameDependHallMinVersion = function(self, gameid)
    return GameDependHallMinVersion[gameid] or 0;
end

--获取大厅支持的游戏最低可玩的版本号
GameManager.getGamePlayableMinVersion = function(self, gameid)
    for k, v in ipairs(self.m_gamesPlayableConfig) do
        if tonumber(v.gameid) ==  tonumber(gameid) then
            return v.ver or 0;
        end
    end

    return 0;
end

--判断游戏是否兼容
--兼容条件 1：子游戏版本号 >= 大厅所依赖的子游戏最小版本号
--         2：大厅版本号 >= 子游戏依赖的大厅版本号
GameManager.isGamePlayable = function(self, gameid)
    local isGamePlayable = (self:getGameVersion(gameid) >= self:getGamePlayableMinVersion(gameid) )
            and ( self:getGameVersion(GameType.HALL) >= self:getGameDependHallMinVersion(gameid) );

    self:__log("isGamePlayable", "gameid = ", gameid, "isGamePlayable = ", isGamePlayable);
    return isGamePlayable;
end

--获取游戏名字
GameManager.getGameName=function(self,gameid)
    return GameNameMap[gameid] or "";
end

--获取大厅顶部游戏图标
GameManager.getGameHallTitleFile = function(self, gameid)
    return GameHallTitleMap[gameid] or "";
end

--判断游戏是否已经初始化
GameManager.getInitStatus = function(self, gameid)
    return self.m_gameInitStatus[gameid];
end

--获取初始化后的游戏列表
GameManager.getInitedGameIds = function(self)
    local gameids = {};
    for id, value in pairs(self.m_gameInitStatus) do
        if value then
            table.insert(gameids, id);
        end
    end
    return gameids;
end

--获取大厅依赖的apkVersion
GameManager.getHallDependentApkVersion = function(self)
    return self.m_apkVersion or "";
end

--获取版本号
GameManager.getApkVerison = function(self)
    return kClientInfo:getApkVersion();
end

--根据gameId来获取本地游戏列表游戏的icon
GameManager.getGameIconPath = function(self, gameid)
    if not gameid then
        return "";
    end

    return self:getGameIconWithGamePkgname( self:getGamePackageName(gameid) );
end

--根据gamePkgName来动态的获取游戏Icon
GameManager.getGameIconWithGamePkgname = function(self, gamePkgName)
    if string.isEmpty(gamePkgName) then
        return "";
    end

    return string.format("hall/gameIcons/%s.png",  self:__getRealGamePackageName(gamePkgName) or "" );
end

--根据游戏获取游戏的package名字
--@note 这里返回的包名会去掉games/ 
--eg: "games/dgz" 则只会返回"dgz";
GameManager.getGamePackageName = function(self, gameid)
    local path = self.m_gamePackagePathMap[gameid];
    if not path then 
        return;
    end

    return self:__getRealGamePackageName(path);
end

--将传过来的gamePkgName截取games/
GameManager.__getRealGamePackageName = function(self, orgGamePackageName)
    local s, e = string.find(orgGamePackageName, "games/");
    if s and e then
        return string.sub(orgGamePackageName, e+1);
    else
        return orgGamePackageName;
    end
end

--设置是否在模块里面
GameManager.setIsInModule = function(self, isInModule)
    self.m_isInModule = isInModule;
end

--获取是否在模块里面
GameManager.isInModule = function(self)
    return self.m_isInModule;
end

--设置是否在房间内
GameManager.setIsInRoom = function(self, isInRoom)
    self.m_isInRoom = isInRoom;
end

--获取是否在房间内
GameManager.isInRoom = function(self)
    return self.m_isInRoom;
end

--获取是否在大厅
GameManager.isInHall = function(self)
    return (not self.m_isInRoom and not self.m_isInModule);
end

--设置当前游戏id
GameManager.setCurGameId = function(self, gameid)
    gameid = number.valueOf(gameid);
    if self.m_curGameId == gameid then
        return;
    end

    self.m_lastGameId = self.m_curGameId;
    self.m_curGameId = gameid;
end

--获取当前游戏id
GameManager.getCurGameId = function(self)
    return self.m_curGameId or 0;
end

--设置上一次的游戏id
GameManager.setLastGameId = function(self,gameid)
    self.m_lastGameId = gameid;
end

--获取上一次的游戏id
GameManager.getLastGameId = function(self)
    return self.m_lastGameId or 0;
end

--设置当前房间等级id
GameManager.setCurRoomLevelId = function(self, roomLevelId)
    roomLevelId = number.valueOf(roomLevelId);
    if self.m_curRoomLevelId == roomLevelId then
        return;
    end

    self.m_lastRoomLevelId = (self.m_curRoomLevelId ~= 0) and self.m_curRoomLevelId or nil;
    self.m_curRoomLevelId = roomLevelId;
end

--获取当前房间等级id
GameManager.getCurRoomLevelId = function(self)
    return self.m_curRoomLevelId or 0;
end

GameManager.getLevelIdsByGameId = function(self,game_id)
    return self.m_gameLevelData:getLevelIdsByGameId(game_id);
end

--记录当前游戏LEVEL的TAB
GameManager.setCurGameLevelTab = function(self,gameId,whichTab)
    self.m_curGameLevelTab:setCurGameLevelTab(gameId,whichTab);
end

--等到当前游戏LEVEL的TAB
GameManager.getCurGameLevelTab = function(self,gameId)

    return self.m_curGameLevelTab:getCurGameLevelTab(gameId);
end

--设置地区二维码图片url
GameManager.setTwoDimensionalCodeUrl = function(self,p_url)
    self.m_twoDimensionalCodeUrl = p_url;
end

--获取地区二维码图片url
GameManager.getTwoDimensionalCodeUrl = function(self)
    return self.m_twoDimensionalCodeUrl or "";
end

--登陆房间的扩展信息
GameManager.setGameExtParam = function(self,extparam)
    self.m_gameExtparam = extparam;
end

GameManager.getGameExtParam = function(self)
    return self.m_gameExtparam;
end

--获取上一次房间等级id
GameManager.getLastRoomLevelId = function(self)
    return self.m_lastRoomLevelId or self:getCurRoomLevelId();
end

--设置当前桌子id 长id
GameManager.setCurTableId = function(self, tableId)
    self.m_curTableId = number.valueOf(tableId);
end

--获取当前桌子id 长id
GameManager.getCurTableId = function(self)
    return self.m_curTableId or 0;
end

--设置当前桌子id 短id
GameManager.setCurShortTableId = function(self,tableId)
    self.m_curShortTableId = number.valueOf(tableId);
end

--获取当前桌子id 短id
GameManager.getCurShortTableId = function(self)
    return self.m_curShortTableId or 0;
end

--当前房间ip
GameManager.setCurRoomIp = function(self,ip)
    self.m_curRoomIp = ip;
end

GameManager.getCurRoomIp = function(self)
    return self.m_curRoomIp or 0;
end

--当前房间端口
GameManager.setCurRoomPort = function(self,port)
    self.m_curRoomPort = port;
end
GameManager.getCurRoomPort = function(self)
    return self.m_curRoomPort or 0;
end
-----------------------游戏列表现相关配置------------------------------
GameManager.requestGameList = function(self)
    self.m_gameListConfig:requestGameList();
end

--获取游戏列表
GameManager.getGameList = function(self)
   return Copy(self.m_gameListConfig:getGameList());
end

--获取分页后的游戏列表
GameManager.getGamePageList = function(self)
   return Copy( self.m_gameListConfig:getGamePageList() ); 
end

--根据游戏ID获取游戏配置,包含id,pkg,sort,display
GameManager.getGameConfigById = function(self, gameId)
    return Copy(self.m_gameListConfig:getGameDataById(gameId));
end

--根据pkg获取游戏排序值
GameManager.getGameConfigSortByPkg = function(self, pkg)
    return self.m_gameListConfig:getGameConfigSortByPkg(pkg);
end

--游戏列表获取后的回调
GameManager.onGetGameListCallBack = function(self, isSuccess, gamePageList)
    self:notify(GameManager.Delegate.onGetGameListCallBack, isSuccess, gamePageList);
end

--当游戏列表刷新时，对游戏进行初始化
GameManager.onGameListUpdated = function(self, gameList)
    for k,v in pairs( table.verify(gameList) ) do
        self:initPkgName(v.id, v.game_pkg);--从代码里读取到的version
        self:initGame(v.id);--从代码里读取到的version
    end
end

--更多游戏列表获取后的回调
GameManager.onGetMoreGamesListCallBack = function(self, isSuccess, gameListMore)
   MoreGamesDataInterface.getInstance():setGameList(isSuccess, gameListMore);
end

--获取更多游戏是否有新游戏
GameManager.getMoreGamesOpenStatus = function(self)
    if MoreGamesDataInterface.hasInstance() then
        return MoreGamesDataInterface.getInstance():getOpenStatus();
    else
        return false;
    end
end

--强制刷新游戏列表
GameManager.forceRefreshGameList = function(self)
    self.m_gameListConfig:forceRefreshGameList();
end

--加载子游戏自定义界面
GameManager.__loadCustomView = function(self, gameid, customViewClassPath, commonClassPath)
    local isSuccess, viewClass = pcall(require, customViewClassPath);
    self:__log("__loadCustomView", "isSuccess = ", isSuccess, "gameid = ", gameid, "customViewClassPath = ", customViewClassPath, "commonClassPath = ", commonClassPath);
    if isSuccess and self:isGamePlayable(gameid) and viewClass then
        self:__log("__loadCustomView", "load game custom view");
        return viewClass;
    else
        self:__log("__loadCustomView", "load common view");
        return require(commonClassPath);
    end 
end

--获取游戏列表界面
GameManager.getGameLevelListView = function(self, gameid)
    gameid = gameid or self:getCurGameId();

    local commonView = "isolater/widget/gameLevelListCustomView/commonGameLevelListView";
    local customView = GameCustomView[gameid];
    if customView then
        return self:__loadCustomView(gameid, customView._roomLevelListView, commonView);
    else
        --兼容老版本
        local pkgName = self:getGamePackageName(gameid) or "";
        local customRoomLevelView = string.format("games/%s/%sGameLevelListView", pkgName, pkgName);
        return self:__loadCustomView(gameid, customRoomLevelView, commonView);
    end    
end

--获取私人房选房界面
GameManager.getPrivateRoomCustomCreateView = function(self,gameid)
    gameid = gameid or self:getCurGameId();

    local commonView = "hall/privateRoom/widget/privateRoomCreateLayer";
    local customView = GameCustomView[gameid];
    return self:__loadCustomView(gameid, customView and customView._privateRoomParamSetView720, commonView);    
end

--获取私人房选房界面
GameManager.getPrivateRoomCustomCreateViewScore = function(self,gameid)
    gameid = gameid or self:getCurGameId();

    local commonView = "hall/privateRoom/widget/privateRoomCreateScoreLayer";
    local customView = GameCustomView[gameid];
    return self:__loadCustomView(gameid, customView and customView._privateRoomParamSetViewScore720, commonView); 
end

--获取私人房选房界面
GameManager.getRivateRoomCustomParamSetView = function(self,gameid)
    gameid = gameid or self:getCurGameId();

    local commonView = "isolater/widget/privateRoomCustomView/customParamSetView";
    local customView = GameCustomView[gameid];
    if customView then
        return self:__loadCustomView(gameid, customView._privateRoomParamSetView, commonView);
    else
        --兼容老版本
        local pkgName = self:getGamePackageName(gameid) or "";
        local customParamSetView = string.format("games/%s/%sGameLevelListView", pkgName, pkgName);
        return self:__loadCustomView(gameid, customParamSetView, commonView);
    end    
end

--获取私人房选房界面
GameManager.getRivateRoomCustomParamSetViewScore = function(self,gameid)
    gameid = gameid or self:getCurGameId();

    local commonView = "isolater/widget/privateRoomCustomView/customParamSetViewScore";
    local customView = GameCustomView[gameid];
    return self:__loadCustomView(gameid, customView and customView._privateRoomParamSetViewScore, commonView); 
end

--获取私人房进房界面
GameManager.getPrivateRoomCustomEnterView = function(self,gameid)
    gameid = gameid or self:getCurGameId();

    local commonView = "hall/privateRoom/widget/privateRoomEnterViewCommon";
    local customView = GameCustomView[gameid];
    return self:__loadCustomView(gameid, customView and customView._privateRoomEnterView, commonView); 
end

--获取GameLevelTab对应的图片路径
GameManager.getLevelTab = function(self,gameid)
    gameid = gameid or self:getCurGameId();

    local customView = GameCustomView[gameid];
    local commonView = "hall/main/widget/gameLevelTab"
    return self:__loadCustomView(gameid, customView and customView._gameLevelTab, commonView);
end

--获取游戏自定义配置
GameManager.getGameCustomConfigWithKey = function(self, gameid, key)
    if not (gameid and key) then
        return;
    end

    return GameCustomConfig[gameid] and GameCustomConfig[gameid][key] or nil;
end
-----------------------房间等级相关信息(PHP发过来的)----------------------
--@获取游戏各房间级别信息
--@param game_id:游戏id
--@param islevel_500:是否返回快速场数据，不传或0不返回，1返回
GameManager.getGameLevelListByGameId = function(self, game_id, islevel_500)
    return Copy( self.m_gameLevelData:getGameLevelListByGameId(game_id, islevel_500) );
end

--请求各个游戏等级的在线人数
GameManager.requestGameLevelPlayerNum = function(self, game_id)
    self.m_gameLevelData:requestGameLevelPlayerNum(game_id);
end

--@brief 获取房间玩牌人数回调
GameManager.onGetGameLevelPlayerNumCallBack = function(self)
    self:notify(GameManager.Delegate.onGetGameLevelPlayerNumCallBack)
end

--根据游戏ID和level获取在线人数
GameManager.getGameLevelPlayerNum = function(self, game_id,level_id)
    return self.m_gameLevelData:getGameLevelPlayerNum(game_id,level_id);
end

--@brief 房间等级列表回调
GameManager.onGetGameLevelCallBack = function(self, isSuccess, gameId, gamelevelList)
    self:notify(GameManager.Delegate.onGetGameLevelCallBack, isSuccess, gameId, gamelevelList);
end

--@brief 获取游戏房间信息
GameManager.getGameLevelInfo = function(self, gameId, levelId)
    return Copy( self.m_gameLevelData:getGameLevelInfo(gameId, levelId) );
end

--@brief 判断场次是否存在
GameManager.isLevelExist = function(self, gameId, levelId)
    return self.m_gameLevelData:isLevelExist(gameId, levelId);
end

--检查是否能进入房间
GameManager.isLegalToPlay = function(self, gameId, levelId, money)
    return self.m_gameLevelData:isLegalToPlay(gameId, levelId, money);
end

--@brief 根据入场银币获取可玩的房间等级
GameManager.getPlayableLevelIdByLoginMoney = function(self, gameId, money, currentLevelId)
    return self.m_gameLevelData:getPlayableLevelIdByLoginMoney(gameId, money, currentLevelId);
end

--@brief 根据退场银币获取可玩的房间等级
GameManager.getPlayableLevelIdByExitMoney = function(self, gameId, money, currentLevelId)
    return self.m_gameLevelData:getPlayableLevelIdByExitMoney(gameId, money, currentLevelId);
end

--@brief 获取可玩的房间等级
--@brief 根据退场银币获取可玩的房间等级
GameManager.getPlayableLevelIdWithMoney = function(self, gameId, money, currentLevelId)
    return self.m_gameLevelData:getPlayableLevelIdWithMoney(gameId, money, currentLevelId);
end

--@brief 根据退场银币获取可玩的房间的最高等级
GameManager.getPlayableMaxLevelIdByMoney = function(self, gameId, money, currentLevelId)
    return self.m_gameLevelData:getPlayableMaxLevelIdByMoney(gameId, money, currentLevelId);
end

--@brief 检查是否已经获得房间等级列表
GameManager.isGotGameLevel = function(self, gameId)
    return self.m_gameLevelData:isGotGameLevel(gameId);
end

--@brief 判断当前时间某个游戏某个场次是否开启了防作弊模式
GameManager.isDuringDefenseCheatTime = function(self, levelId, gameId)
    return self.m_gameLevelData:isDuringDefenseCheatTime(gameId, levelId);
end

GameManager.isSilverRoom = function ( self, gameId, levelId )
    return self.m_gameLevelData:isSilverRoom(gameId, levelId);
end

--设置当前玩法
GameManager.setFastStartPlayType = function(self, p_playType)
    p_playType = number.valueOf(p_playType);
    if p_playType then
        self.m_currentFastStartPlayType = p_playType;
    end   
end

--获取当前房间玩法类型
GameManager.getFastStartPlayType  = function(self)
    return self.m_currentFastStartPlayType ;         
end

--设置当前玩法
GameManager.setFastStartMoneyType = function(self, p_moneyType)
    p_moneyType = number.valueOf(p_moneyType);
    if p_moneyType then
        self.m_currentFastStartMoneyType = p_moneyType;
    end   
end

--获取当前房间底注类型
GameManager.getFastStartMoneyType  = function(self)
    return self.m_currentFastStartMoneyType ;         
end

--根据gameId,levelId 获取玩法信息
GameManager.getPlayTypeByLevelId  = function(self,p_gameId,p_levelId)
    --兼容快速开始,快速开始时 levelId == 0
    if p_levelId == 0 then
        return self:getFastStartPlayType();
    end
    return self.m_gameLevelData:getPlayTypeByLevelId(p_gameId,p_levelId);
end

--根据gameId,levelId 获取底注类型
GameManager.getMoneyTypeByLevelId =  function(self,p_gameId,p_levelId)
    --兼容快速开始,快速开始时 levelId == 0
    if p_levelId == 0 then
        return self:getFastStartMoneyType();
    end
    if PrivateRoomIsolater.getInstance():checkIsPrivateRoomLevel(p_levelId) then 
        return PrivateRoomIsolater.getInstance():getPrivateRoomMoneyType(p_levelId);
    end 
    return self.m_gameLevelData:getMoneyTypeByLevelId(p_gameId,p_levelId);
end

-- --获取与指定levelId相同玩法、相同货币类型的所有的levelId列表（包含原来的场次id）
GameManager.getLevelIdMatchPlayTypeAndMoneyTypeByLevelId = function(self,p_gameId,p_levelId)
    return self.m_gameLevelData:getLevelIdMatchPlayTypeAndMoneyTypeByLevelId(p_gameId,p_levelId);
end 

--获取游戏中指定玩法和指定货币类型的所有的levelId列表
GameManager.getLevelIdByPlayTypeAndMoneyType = function(self,p_gameId,playType,moneyType)
    return self.m_gameLevelData:getLevelIdByPlayTypeAndMoneyType(p_gameId,playType,moneyType);
end 

--@brief 请求模块列表
GameManager.requestModuleList = function(self)
   self.m_moduleListData:requestData();
end

--@brief 获取模块列表
GameManager.getModuleList = function(self)
   return Copy( self.m_moduleListData:getModuleList() );
end

--根据游戏ID获取游戏配置
GameManager.getModuleConfigById = function(self, gameId)
    return Copy( self.m_moduleListData:getModuleConfigById(gameId) ); 
end

--@brief 模块配置更新
GameManager.onModuleListUpdated = function(self,moduleList)
    for k,v in pairs( table.verify(moduleList) ) do
        self:initPkgName(v.id, v.game_pkg);--从代码里读取到的version
        self:initGame(v.id);--从代码里读取到的version
    end
end

GameManager.__log = function(self, ...)
    Log.v("GameManager", ...);
end
