local OnlookerSocketCmd = {};

OnlookerSocketCmd.C_REQUEST_LOGIN_ONLOOKER = 0x0b88; --请求进围观
OnlookerSocketCmd.S_REPLY_LOGIN_ONLOOKER = 0x0b89;--回复进围观

OnlookerSocketCmd.C_REQUEST_LOGOUT_ONLOOKER = 0x0b90; --请求退出围观
OnlookerSocketCmd.S_REPLY_LOGOUT_ONLOOKER = 0x0b91;--回复退出围观

OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGIN = 0x0b92; --广播围观者进房间
OnlookerSocketCmd.S_BROADCAST_ONLOOKER_LOGOUT = 0x0b93;--广播围观者退出房间

OnlookerSocketCmd.C_REQUEST_SEND_BARRAGE = 0x0b94; --发弹幕
OnlookerSocketCmd.S_BROADCAST_BARRAGE = 0x0b95;--收弹幕

OnlookerSocketCmd.S_BROADCAST_ONLOOKER_GAMEINFO = 0x1209;--server推送被围观房间的玩牌信息(字段同游戏重连)

OnlookerSocketCmd.C_REQUEST_CHAT_COMPLAINT 	= 0x0B57   --举报禁言
OnlookerSocketCmd.S_BROADCAST_USER_SHUTUP = 0x0B58   --聊天禁言

return OnlookerSocketCmd;