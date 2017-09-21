require("gameData/dataInterfaceBase");
require("hall/privateRoom/data/privateRoomDataInterface");
require("hall/gameData/txtMgr");
local GameRoomLevelConfig = require("hall/main/data/gameRoomLevelConfig");
require("hall/gameData/appData");
require("isolater/interface/userPropertyIsolater");

--[[
	私人房中间层
--]]

PrivateRoomIsolater = class(DataInterfaceBase);

PrivateRoomIsolater.Delegate = {
	onResponseEscapePrivateRoom = "onResponseEscapePrivateRoom"; -- 已弃用 
	onReceivePrivateRoomInfo = "onReceivePrivateRoomInfo";
	onSearchPrivateRoom = "onSearchPrivateRoom";
	onRequestPrivatRoomConfigCallback = "onRequestPrivatRoomConfigCallback";
};


PrivateRoomIsolater.getInstance = function()
	if not PrivateRoomIsolater.s_instance then
		PrivateRoomIsolater.s_instance = new(PrivateRoomIsolater); 
	end
	return PrivateRoomIsolater.s_instance;
end

PrivateRoomIsolater.ctor = function(self)
	PrivateRoomDataInterface.getInstance():setObserver(self);
	TxtMgr.getInstance():setObserver(self);
end

PrivateRoomIsolater.dtor = function(self)
	PrivateRoomDataInterface.getInstance():clearObserver(self);
	TxtMgr.getInstance():clearObserver(self);
end

--[[
	@brief 获取私人房银币场房间等级
	@return (number) 私人房银币场房间等级, 100
--]]
PrivateRoomIsolater.getPrivateRoomLevel = function(self)
	return GameRoomLevelConfig.PRIVATE_ROOMID;
end

--[[
	@brief 获取私人房金条场房间等级
	@return (number) 私人房金条场房间等级, 100
--]]
PrivateRoomIsolater.getPrivateRoomCrystalLevel = function(self)
	return GameRoomLevelConfig.PRIVATE_ROOMID_CRYSTAL;
end

--[[
	@brief 获取私人房积分场房间等级
	@return (number) 私人房积分场房间等级, 100
--]]
PrivateRoomIsolater.getPrivateRoomJiFenLevel = function(self)
	return GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN;
end

--[[
	@brief 获取私人房游戏类型
	@return (number) 私人房游戏类型, AppData.PRIVATE_ROOM = 101
--]]
PrivateRoomIsolater.getPrivateRoomGameType = function(self)
	return AppData.PRIVATE_ROOM;
end

--[[
	@brief 获取私人房重连类型
	@return (number) 私人房重连类型, AppData.PRIVATE_ROOM_RECONNECT = 102
--]]
PrivateRoomIsolater.getPrivateRoomReconnectType = function(self)
	return AppData.PRIVATE_ROOM_RECONNECT;
end

--[[
	@brief 判断是否为私人房房间等级
	@param roomLevel (number) 房间等级
	@return (boolean) true：是私人房房间等级 false：不是私人房房间等级
--]]
PrivateRoomIsolater.checkIsPrivateRoomLevel  = function(self,roomLevel)
	return kAppData:checkIsPrivateRoomLevel(roomLevel);
end

--[[
	@brief 判断是否为私人房游戏类型
	@param gameType (number) 游戏类型
	@return (boolean) true：是私人房游戏类型 false：不是私人房游戏类型
--]]
PrivateRoomIsolater.checkIsPrivateRoomGameType = function(self,gameType)
	return gameType == AppData.PRIVATE_ROOM or gameType == AppData.PRIVATE_ROOM_RECONNECT;
end

--[[
	@brief 判断是否为私人房重连类型
	@param gameType (number) 游戏类型
	@return (boolean) true：是私人房重连类型 false：不是私人房重连类型
--]]
PrivateRoomIsolater.checkIsPrivateRoomReconnectType = function(self,gameType)
	return gameType == AppData.PRIVATE_ROOM_RECONNECT;
end

--[[
	@brief 获取私人房招募格式
	@return (table) 私人房招募格式
--]]
PrivateRoomIsolater.getPrivateRoomRecruitDesFormat = function(self)
	local tInvite_content = TxtMgr.getInstance():getDescByKey("invite_content_710");
	if table.isEmpty(tInvite_content) then
		tInvite_content = {
			"%s%s“%s”房间，%s底注，缺人，速来！！",
			"gameName",
			"game_level",
			"room_id",
			"room_basechips",
		};
	end

	return tInvite_content;
end

--[[
	@brief 请求进入私人房
	@param info (table) 私人房数据，即私人房列表数据项
		info = {
			tId 				桌子id，必传
			gameId 				游戏id，必传
			password 			私人房密码，必传
			svId 				服务器id
			userCount_on 		当前人数
			userCount_max 		最大人数
			requireMoney 		银币要求
			baseChip 			底注
			roomName 			房间名称
			isCanEscape 		是否允许逃跑
			isAlwaysBanker 		此字段暂时无用
		}
--]]
PrivateRoomIsolater.requestEnterPrivateRoom = function(self,info)
	PrivateRoomDataInterface.getInstance():requestEnterPrivateRoom(info);
end

--[[
	@brief 请求逃离私人房
	@note server表示没有此命令
--]]
PrivateRoomIsolater.requestEscapePrivateRoom = function(self)
end

--[[
	@brief server广播玩家逃离私人房
	@param info (table) 广播数据
		info = {
			escapeMid		逃离玩家mid
			escapeMoney		逃离玩家银币数
			userMoneys = {	当前玩家银币列表
				[1] = {			列表项
					mid 			玩家mid
					money 			玩家银币数
				},
				...
			}
		}
	@note server表示没有此命令
--]]
PrivateRoomIsolater.onResponseEscapePrivateRoom = function(self,info)
	self:notify(PrivateRoomIsolater.Delegate.onResponseEscapePrivateRoom,info);
end

--[[
	@brief server广播私人房信息
	@param info (table) 私人房信息
		info = {
			tableId 			短桌子id
			longTableId 		长桌子id
			isCanEscape 		是否能逃跑
			time 				私人房超时踢出时间
			isAlwaysBanker 		此字段暂时无用
			sgid				此字段暂时无用
		}
--]]
PrivateRoomIsolater.onReceivePrivateRoomInfo = function(self,info)
	self:notify(PrivateRoomIsolater.Delegate.onReceivePrivateRoomInfo,info);
end

--[[
	@brief 判断是否在私人房
	@return (boolean) true：在私人房，false：不在私人房
--]]
PrivateRoomIsolater.isInPrivateRoom = function(self)
	return kAppData:isInPrivateRoom();
end

--[[
	@brief 设置当前私人房数据
	@param data (table) 私人房数据，同私人房列表数据项
--]]
PrivateRoomIsolater.setCurPrivateRoomInfo = function(self,data)
	kAppData:setCurPrivateRoomInfo(data);
end

--[[
	@brief 获取当前私人房数据
	@return (table) 私人房数据，同私人房列表数据项
--]]
PrivateRoomIsolater.getCurPrivateRoomInfo = function(self)
	return kAppData:getCurPrivateRoomInfo();
end

--[[
	@brief 设置当前私人房是否可逃跑
	@param isCanEscape (boolean) true：可逃跑，false：不可逃跑
--]]
PrivateRoomIsolater.setPrivateRoomIsCanEscape = function(self,isCanEscape)
	kAppData:setIsCanEscape(isCanEscape);
end

--[[
	@brief 获取当前私人房是否可逃跑
	@return (boolean) true：可逃跑，false：不可逃跑
--]]
PrivateRoomIsolater.getPrivateRoomIsCanEscape = function(self)
	return kAppData:isCanEscape();
end

--[[
	@brief 生成二维码参数
	@param gameId (number) 游戏id
	@param tableId (number) 桌子id
	@param password (number) 房间密码
	@note 已弃用，只用作子游戏兼容
--]]
PrivateRoomIsolater.generateQRParams = function(self, gameId, tableId, password)
	return PrivateRoomDataInterface.getInstance():generateQRParams(gameId, tableId, password);
end

--[[
	@brief 获取是否开启语音聊天
	@param gameId (number) 游戏id
--]]
PrivateRoomIsolater.isOpenVideo = function(self, gameId, tableType)
	return PrivateRoomDataInterface.getInstance():isOpenVideo(gameId, tableType);
end

--[[
	@brief 获取私人房实时对讲提示标记
	@return (boolean) 标记值
--]]
PrivateRoomIsolater.getOpenFlagVideo = function(self)
	return PrivateRoomDataInterface.getInstance():getOpenFlagVideo();
end

--[[
	@brief 设置私人房实时对讲提示标记
	@param tableId (boolean) 标记值
--]]
PrivateRoomIsolater.setOpenFlagVideo = function(self, flag)
	PrivateRoomDataInterface.getInstance():setOpenFlagVideo(flag);
end

------------- 私人房 -------------------------------------------------
--[[
	@brief 判断是不是在私人房积分场
	@return boolean
--]]
PrivateRoomIsolater.isInJiFenRoom = function(self)
	return GameInfoIsolater.getInstance():getCurRoomLevelId() == GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN;
end

--[[
	@brief 判断是不是在私人房积分场
	@param roomLevel (number) 房间等级
	@return 货币类型(number)
]]
PrivateRoomIsolater.getPrivateRoomMoneyType = function(self,roomLevel)
	if roomLevel == GameRoomLevelConfig.PRIVATE_ROOMID_CRYSTAL then
		return UserPropertyIsolater.getInstance():getPropertyGoldBarID();
	elseif roomLevel == GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN then
		return UserPropertyIsolater.getInstance():getJifenID();
	else 
		return UserPropertyIsolater.getInstance():getPropertySilverCoinID();
	end 
end

--[[
	@brief 搜索私人房
	@param tableId (number) 房间id
]]
PrivateRoomIsolater.searchPrivateRoom = function(self, tableId)
	PrivateRoomDataInterface.getInstance():searchPrivateRoom(tableId);
end

--[[
	@brief 搜索私人房回复
	@param info (table) 房间列表
]]
PrivateRoomIsolater.onSearchPrivateRoom = function(self, info)
	self:notify(PrivateRoomIsolater.Delegate.onSearchPrivateRoom, info)
end

--[[
	@brief 拉取私人房配置回调
	@param isSucess (boolean) 是否拉取成功
	@param data (table) 私人房配置信息
]]
PrivateRoomIsolater.onRequestPrivatRoomConfigCallback = function(self, isSucess, data)
	self:notify(PrivateRoomIsolater.Delegate.onRequestPrivatRoomConfigCallback, isSucess, data);
end

--[[
	@brief 拉取私人房记录详情
	@param tableKey (string) 记录索引
]]
PrivateRoomIsolater.getPrivateRoomRecordDetailForce = function(self, tableKey)
	PrivateRoomDataInterface.getInstance():getPrivateRoomRecordDetailForce(tableKey);
end

--[[
	@brief 创建私人房结算界面
	@param data (table) 私人房结算数据
	@param isMaster (boolean) 是否是房主
]]
PrivateRoomIsolater.createRecordSummaryLayer = function(self, data)
	return PrivateRoomDataInterface.getInstance():createRecordSummaryLayer(data);
end