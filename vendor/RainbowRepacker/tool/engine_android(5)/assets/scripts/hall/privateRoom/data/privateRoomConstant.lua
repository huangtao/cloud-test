PrivateRoomConstant = class()

-- 私人房类型
PrivateRoomConstant.PRIVATE_ROOM_TYPE_MONEY = 0; 		-- 银币房
PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL = 1;		-- 金条房
PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE = 3;		-- 积分房

PrivateRoomConstant.UNIT_MAP = {
	[PrivateRoomConstant.PRIVATE_ROOM_TYPE_MONEY] = "银币",
	[PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL] = "金条",
	[PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE] = "积分",
}

PrivateRoomConstant.ROOM_NAME_MAP = {
	[PrivateRoomConstant.PRIVATE_ROOM_TYPE_MONEY] = "银币房",
	[PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL] = "金条房",
	[PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE] = "熟人积分房",
}

-- 私人房进入方式
PrivateRoomConstant.ENTER_TYPE_SEARCH = 1; -- 搜索
PrivateRoomConstant.ENTER_TYPE_QR_CODE = 2; -- 扫码
PrivateRoomConstant.ENTER_TYPE_PASSWORD = 3; -- 口令
PrivateRoomConstant.ENTER_TYPE_ONLINE = 4; -- 在线好友邀请
PrivateRoomConstant.ENTER_TYPE_HTML = 5; -- H5调起

PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL = 1;
PrivateRoomConstant.CREATE_TYPE_SCORE = 2;