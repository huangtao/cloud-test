--------------- 选房及私人房指令开始 -------------------------
CREATE_PRIVATE_ROOM_REQUEST = 0x114; 	--用户创建私人房，回复0x1007或者0x1005

ENTER_PRIVATE_ROOM_REQUEST = 0x115;		--用户进入私人房，回复0x1007或者0x1005

ROOM_BROADCAST_ROOM_INFO = 0x212; 		--server向客户端发送房间信息

SEARCH_PRIVATE_ROOM_REQUEST = 0x10e;	--用户搜索私人房 --回复0x208
PRIVATE_ROOM_LIST_REPONSE = 0x208;		--用户获取私人房列表回复
--------------- 选房及私人房指令结束 -------------------------