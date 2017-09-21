
GameMatchData = {};

GameMatchData.DINGJUSAI_STATE_LOADING	= 1;--报名成功--等待界面
GameMatchData.DINGJUSAI_STATE_ROUNDOVER = 2;--轮结束等待界面
GameMatchData.DINGJUSAI_STATE_MATCHOVER = 3;--比赛游戏结束
GameMatchData.DINGJUSAI_STATE_PLAYING	= 4;--游戏中
GameMatchData.DINGJUSAI_STATE_NONE		= 5;--无状态

--结算结果
GameMatchData.MATH_STATE_OUT		= 1;--提前出局
GameMatchData.MATH_STATE_SUCCESS	= 2;--成功获得奖励
GameMatchData.MATH_STATE_FAILED		= 3;--失败不能获得奖励
