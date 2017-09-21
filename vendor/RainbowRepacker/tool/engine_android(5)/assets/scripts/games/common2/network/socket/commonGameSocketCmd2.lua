
--游戏房间、大厅都用到的指令 到时提出了作为公用指令
	ROOM_SEND_JOIN_GAME 										= 0x113;  --请求加入游戏
	ROOM_SEND_LOGIN 											= 0x1001; --登录房间
	ROOM_SEND_LOGOUT 											= 0x1002; --退出房间
	USER_READY_REQUEST 											= 0x2001; --用户请求准备
	ROOM_LOGIN_GAME_ONE_KEY										= 0x119;  --一条指令登录，省去了118,210,1001
	-- REQUEST_ROOMLEVEL 											= 0x0051; --请求房间等级
	CLIENT_COMMAND_REQUEST_AI     								= 0x2005; --用户托管或取消托管
	CLIENT_COMMAND_VIPKICK										= 0x1023; --VIP踢人
	ROOM_REQUEST_RECONNECT 										= 0x2127; --请求重连
	ROOM_USER_CHAT 												= 0x1003; --用户对话
	ROOM_USER_FACE 												= 0x1004; --用户表情
	CLIENT_COMMAND_LOGOUT_IN_GAME 								= 0x1039; --玩家请求退出(游戏中)
	CLIENT_COMMAND_CHANGE_TABLE 								= 0x1028; --请求换桌
	ROOM_USER_INVITE 											= 0x1090; --用户普通房间内邀请登录房间


---------------------- 接收命令 ----------------------
	ROOM_JOIN_GAME_RESPONSE 									= 0x210;  --请求加入游戏回复
	ROOM_LOGIN_ERR 												= 0x1005; --登录房间失败
	ROOM_LOGIN_SUCCESS 											= 0x1007; --房间登录成功 --此指令由个游戏处理
	ROOM_RECONNECT 												= 0x1009; --重连进入房间
	SERVER_COMMAND_LOGOUT_INGAME_RSP							= 0x1062; --Server回应退出请求(游戏中退出)
	ROOM_LOGOUT_SUCCESS 										= 0x1008; --退出房间成功
	SERVER_BROADCAST_STOP_GAME_IN_PLAY							= 0x4016; --广播游戏强制结束（游戏中有玩家退出）
	SERVER_BROADCAST_PLAYER_LOGOUT 								= 0x100E; --广播用户退出
	SERVER_BROADCAST_PLAYER_LOGIN 								= 0x100D; --广播用户进入
	SERVER_COMMAND_CHANGE_TABLE_ERR 							= 0x1029; --请求换桌失败
	SERVER_BROADCAST_PLAYER_READY 								= 0x4001; --广播玩家准备
	SERVER_BROADCAST_PLAYER_AI	 								= 0x4007; --广播用户托管
	ROOM_USER_CHAT 												= 0x1003; --用户对话
	ROOM_USER_FACE 												= 0x1004; --用户表情
	-- RESPONE_ROOMLEVEL 											= 0x0052; --请求房间等级回复
	ROOM_UP_LEVEL 												= 0x2203; --房间等级变化
	SERVER_BROADCAST_TASK_GAME    								= 0x600A; --广播牌局任务
	SERVER_BROADCAST_TASK_COMPLETE    							= 0x6017; --广播完成的任务

	ROOM_SERVER_UPDATE_KICK 									= 0x9001; --server升级踢人
	ROOM_BROADCAST_ROOM_INFO 									= 0x212;  --server向客户端发送房间信息
	ROOM_SERVER_RESPONSE_TABLE_INFO 							= 0x214;  --server返回桌子信息

-------------------------------------------------------------------------------------------------------------
	CLIENT_COMMAND_JIFEN_ROOM_KICK_USER 						= 0x7025;-- 客户端命令字熟人积分房房主T人
	SERVER_COMMAND_BROAD_JIFEN_ROOM_KICK_USER	 				= 0x7026; -- 熟人积分房广播玩家被房主T出
	SERVER_COMMAND_JIFEN_ROOM_SENDTO_BEKICKED_USER       		= 0x7027; -- 熟人积分房告知被T者被谁T了
	CLIENT_APPLY_JIFEN_ROOM_CHANGE_SEAT 						= 0x7031;--积分房客户端发起换位置
	SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_APPLY				= 0x7032;--积分房客户端收到换座请求
	CLIENT_REPLY_JIFEN_ROOM_CHANGE_SEAT							= 0x7033;--积分房客户端回复是否同意换座
	SERVER_BROADCAST_JIFEN_ROOM_CHANGE_SEAT_RESULT				= 0x7034;--server广播最终换座结果
	CLIENT_COMMAND_JIFEN_ROOM_CONTINUE_PLAY						= 0x7037;--积分房再来一轮
	SERVER_BROADCAST_JIFEN_ROOM_CONTINUE_PLAY 					= 0x7038;--积分房再来一轮
	SERVER_BROADCAST_JIFEN_ROOM_MASTER							= 0x7040;--广播房主
	SERVER_BROADCAST_JIFEN_ROOM_CANCLE_READY 					= 0x7043;--熟人积分房等待再开一轮过程中，玩家在成为房主前已准备，在他变为房主后准备状态取消
	SERVER_BROADCAST_JIFEN_RECORD_INFO							= 0x8001;--广播积分房记录信息