require("core/object");

--[[
	一个常量类
	@作者：王金鹏
	@时间：2014-10-30
]]

GameConstant = class();

--定义自己的本地座位是  1， 下家为2 ，依次往后
GameConstant.SEAT_LOCAL_MINE	= 1;

--定义游戏状态
GameConstant.STATUS_NONE 		= 0;
GameConstant.STATUS_LOGIN 		= 1;
GameConstant.STATUS_LOGOUT 		= 2;
GameConstant.STATUS_READY 		= 3;
GameConstant.STATUS_PLAYING 	= 4;
GameConstant.STATUS_GAMEOVER 	= 5;
GameConstant.STATUS_ASKLANDLORD = 6;

ChangeTableErr = class();
ChangeTableErr.ERROR_ILLEGAL_TABLE_STATUS	= 0; --桌子状态错误(通常为桌子非结束状态)
ChangeTableErr.ERROR_ILLEGAL_USER_STATUS	= 1; --玩家状态错误(通常为玩家未进入、已准备已开始)
ChangeTableErr.ERROR_CANT_LEAVE_OLD_TABLE	= 2; --离开原有桌子失败
ChangeTableErr.ERROR_OTHER_REASON			= 10;--其他错误

-- 比赛类型
GameConstant.NORMAL_IMMEDIATE_MATCH 	= 0; -- 一般快速赛
GameConstant.FIXED_TIME_MATCH 			= 3; -- 定时赛

GameConstant.MATCH_RECONNECT 			= 1000 + 1;		-- 比赛重连
GameConstant.MATCH_RECONNECT_INGAME 	= 1000 + 2;		-- 比赛游戏中重连
GameConstant.MATCH_NONE  				= 1000 + 3;		--

-- 报名状态
GameConstant.NOT_SIGN_UP				= 0; -- 未报名
GameConstant.HAVE_SIGN_UP				= 1; -- 已报名/已报名未开赛
GameConstant.ALLOW_JOIN_IN				= 2; -- 允许进入
GameConstant.MATCH_HAVE_START			= 3; -- 比赛已经开始
GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN	= 4; -- 报名并且比赛可以进入
GameConstant.SIGN_UP_BUT_HAVE_START		= 5; -- 报名但比赛已经开始