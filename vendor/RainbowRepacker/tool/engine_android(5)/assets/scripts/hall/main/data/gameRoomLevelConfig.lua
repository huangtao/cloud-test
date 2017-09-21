
local GameRoomLevelConfig = {}

GameRoomLevelConfig.XINSHOU_ROOMID = 12; --新手场

GameRoomLevelConfig.PRIVATE_ROOMID = 100; --私人房银币场
GameRoomLevelConfig.PRIVATE_ROOMID_CRYSTAL = 10100;--私人房金条场
GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN = 30100;--私人房积分场

GameRoomLevelConfig.MATCH_DINGJU_ROOMID = 500; --定局赛
GameRoomLevelConfig.MATCH_XIANSHI_ROOMID = 600; --限时赛
GameRoomLevelConfig.MATCH_DINGSHI_ROOMID = 700; --定时赛

--私人房
GameRoomLevelConfig.privateRoomLevel = {
    GameRoomLevelConfig.PRIVATE_ROOMID;             --私人房银币场,100
    GameRoomLevelConfig.PRIVATE_ROOMID_CRYSTAL;     --私人房金条场,10100
    GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN;       --私人房积分场,30100
};

--比赛房
GameRoomLevelConfig.matchRoomLevel = {
    GameRoomLevelConfig.MATCH_DINGJU_ROOMID; --定局赛,500
    GameRoomLevelConfig.MATCH_XIANSHI_ROOMID; --限时赛,600
    GameRoomLevelConfig.MATCH_DINGSHI_ROOMID; --定时赛,700
};


return GameRoomLevelConfig;