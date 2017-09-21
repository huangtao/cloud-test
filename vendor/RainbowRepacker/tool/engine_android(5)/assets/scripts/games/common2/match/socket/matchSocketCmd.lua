MatchSocketCmd = {};
-------------------------------- 比赛相关指令--------------------------------------
MatchSocketCmd.MATCH_DINGJU_RQUEST_SIGHUP 					= 0x0B61;--报名
MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP 				= 0x0B07;--报名成功,进入赛前等待界面
MatchSocketCmd.MATCH_XIANSHI_RESPONSE_SIGHUP 				= 0x0B43;--报名成功,未到等待进入时间,不进入赛前等待界面
MatchSocketCmd.MATCH_DINGJU_RESPONSE_SIGHUP_FAIL 			= 0x0B05;--报名失败

MatchSocketCmd.MATCH_DINGJU_MATCH_UPDATEPEOPLE_REQUEST 		= 0x0B03;--点击报名后,弹出对话框信息，人数需要实时刷新
MatchSocketCmd.MATCH_DINGJU_MATCH_UPDATEPEOPLE_RESPONSE 	= 0x0B04;--服务器回应报名信息

MatchSocketCmd.MATCH_DINGJU_MATCH_START_RESPONSE 			= 0x0B11;--比赛开始
MatchSocketCmd.BROADCAST_PLAYER_SCORE 	 					= 0x0B66;--广播桌用户积分
MatchSocketCmd.BROADCAST_MATCH_STAGE_INFO 					= 0x0B68 --广播赛制晋级信息

MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_REQUEST 			= 0x0B62;--玩家退赛
MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_RESPONSE 		= 0x0B08;--退赛成功
MatchSocketCmd.MATCH_DINGJU_MATCH_WITHDRAW_ERROR_RESPONSE 	= 0x0B06;--退赛错误

MatchSocketCmd.MATCH_DINGJU_MATCH_RECONNECT_RESPONSE 		= 0x0B09;--比赛重连成功

MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_RESPONSE 			= 0x0B12;--比赛结束--只有所有比赛结束的时候才会收到，中途被淘汰的人直接收到0x0b18
MatchSocketCmd.MATCH_DINGJU_ROUND_OVER_RESPONSE 			= 0x0B13;--轮结束，通知其他桌子还在比赛
MatchSocketCmd.MATCH_DINGJU_ROUND_OVER_OUT_EXIT_REQUEST		= 0x0B0B;--轮结束淘汰的人请求退出

MatchSocketCmd.MATCH_DINGJU_ROOM_INFO_RESPONSE 				= 0x0B16;--通知客户端本桌信息

MatchSocketCmd.MATCH_DINGJU_MATCH_CONTINUE_RESPONSE 		= 0x0B17;--比赛继续进行 --指令读取和处理与B11比赛开始一致
MatchSocketCmd.MATCH_DINGJU_MATCH_OVER_REWARD 				= 0x0B18;--比赛结束的发奖，会在比赛结束指令之后发

MatchSocketCmd.SERVER_CMD_LONG_TIME_NOT_START_KICK_USER 	= 0x0B0C;--超时踢出定局赛

MatchSocketCmd.CLIENT_CMD_SEND_CHAT_MSG 					= 0x0B54; -- 玩家发送聊天消息(报名后比赛开始前进行等待时) requestParam = { userName = "", msgInfo = ""}
MatchSocketCmd.SERVER_CMD_SEND_CHAT_MSG 					= 0x0B55; -- 服务器广播聊天信息 responseParam = {flag = 1(系统) or 2(玩家), userName = "", msgInfo = "", time = ""}
MatchSocketCmd.TIME_TO_ENTER_MATCH 	 						= 0x0B56; -- 比赛前15分钟广播

MatchSocketCmd.CLIENT_CMD_MATCH_CHAT_COMPLAINT 				= 0x0B57   --比赛等待界面举报。
MatchSocketCmd.SERVER_CMD_USER_SHUTUP 						= 0x0B58   --比赛等待聊天禁言

---------------- 定局赛比赛场指令结束 -----------------------------------

----------------- 定时赛 ------------------------------------------------
MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_TABLE_INFO     = 0x0B47;      -- 服务器推送排名信息(当有用户完成结算时)
MatchSocketCmd.MATCH_DINGSHI_ROOM_DETAIL_REQUEST           = 0x0B45;      -- 请求排名详情(已废弃)
MatchSocketCmd.MATCH_DINGSHI_ROOM_DETAIL_RESPONSE          = 0x0B46;      -- 服务器回应排名详情(已废弃)
MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_STAGE_INFO     = 0x0B48;      -- 服务器推送阶段消息(某个阶段的开始或结束)
MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_WAIT_TABLE     = 0x0B49;      -- 等待配桌
MatchSocketCmd.MATCH_DINGSHI_ROOM_BROADCAST_BASE_INFO      = 0x0B50;      -- 服务器推送底注增长信息
MatchSocketCmd.MATCH_DINGSHI_ROOM_USER_PROMOTION           = 0x0B51;      -- 玩家晋级(进入赛间等待界面)

------------------ 复活赛 -----------------------------------------------
MatchSocketCmd.MATCH_REVIVE_NOTIFY = 0x0B79; -- 通知复活
MatchSocketCmd.MATCH_REVIVE_REQUEST = 0x0B72; -- 请求复活
MatchSocketCmd.MATCH_REVIVE_RESPONSE = 0x0B80; -- server响应复活
------------------ 复活赛 -----------------------------------------------

MatchSocketCmd.MATCH_RANK_DETAIL_REQUEST = 0x0B75;--请求排名详情
MatchSocketCmd.MATCH_RANK_DETAIL_RESPONSE = 0x0B76;--服务器回应排名详情

MatchSocketCmd.MATCH_RULE_REQUEST = 0x0B77;--请求赛制
MatchSocketCmd.MATCH_RULE_RESPONSE = 0x0B78;--服务器回应赛制

MatchSocketCmd.S_BROADCAST_ENTER_ONLOOKER = 0x0B19;--服务器通知进入比赛围观

MatchSocketCmd.MATCH_GROUP_INFO_REQUEST = 0x0B81; -- 请求比赛分组信息
MatchSocketCmd.MATCH_GROUP_INFO_RESPONSE = 0x0B82; -- 服务器回复分组信息