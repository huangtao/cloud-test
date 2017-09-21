KICK_CODE2 = {
	NO_VIP		 		= 100;
	KICK_VIP_ERROR		= 101;
	KICK_IN_PLAYING		= 102;
	SYSTEM_ERROR 		= 103;
	KICK_LOGOUT_PLAYER 	= 104;
	KICK_IN_MATCH		= 105;
	VIP_OUTTIME 		= 106;
	NO_KICK_PROP 		= 108;
	KICK_NOT_ENDING_DGZ	= 109;
}

KICK_STR2 = 
{
    [KICK_CODE2.NO_VIP] 				= "非vip没踢人权限",
    [KICK_CODE2.KICK_VIP_ERROR] 		= "vip不能被踢",
    [KICK_CODE2.KICK_IN_PLAYING] 	= "游戏进行中，无法将该玩家请出房间",
    [KICK_CODE2.SYSTEM_ERROR] 		= kTtextSystemError,
    [KICK_CODE2.KICK_LOGOUT_PLAYER] 	= "该玩家已离开",
    [KICK_CODE2.KICK_IN_MATCH] 		= "比赛场不能踢人",
    [KICK_CODE2.VIP_OUTTIME] 		= "VIP已经过期",
    [KICK_CODE2.NO_KICK_PROP] 		= "您的踢人卡不足",
    [KICK_CODE2.KICK_NOT_ENDING_DGZ] = "这一锅还没结束，踢人功能无法使用",
};
