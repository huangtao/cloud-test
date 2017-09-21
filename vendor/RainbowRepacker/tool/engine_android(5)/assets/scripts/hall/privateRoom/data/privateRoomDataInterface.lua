require("hall/userInfo/data/userInfoData");
require("gameData/dataInterfaceBase");
require("util/log");
require("common/loadingView");
require("hall/privateRoom/data/privateRoomConstant");
require("hall/onlineSocket/onlineSocketManager");
require("hall/privateRoom/socket/privateRoomSocketCmd");
require("hall/privateRoom/socket/privateRoomSocketReader");
require("hall/privateRoom/socket/privateRoomSocketWriter");
require("games/common2/data/commonPlayerInfoHandler2");

require("hall/main/data/hallConstants");
local GameRoomLevelConfig = require("hall/main/data/gameRoomLevelConfig");
require("hall/main/data/hallUpdateConfig");
require("hall/update/updateHandleMgr");
require("hall/gameData/QRUtil/QRUtil");


PrivateRoomDataInterface = class(DataInterfaceBase);


PrivateRoomDataInterface.Delegate = {
	onRequestPrivatRoomConfigCallback = "onRequestPrivatRoomConfigCallback";
	onGetPrivatRoomConfigCallback = "onGetPrivatRoomConfigCallback";
	onSearchPrivateRoom = "onSearchPrivateRoom";
	onReceivePrivateRoomInfo = "onReceivePrivateRoomInfo";

	onGetPrivateRoomRecordListCallback = "onGetPrivateRoomRecordListCallback";
	onGetPrivateRoomRecordDetailCallback = "onGetPrivateRoomRecordDetailCallback";
};

PrivateRoomDataInterface.getInstance = function()
	if not PrivateRoomDataInterface.s_instance then
		PrivateRoomDataInterface.s_instance = new(PrivateRoomDataInterface);
	end
	return PrivateRoomDataInterface.s_instance;
end

PrivateRoomDataInterface.releaseInstance = function()
	delete(PrivateRoomDataInterface.s_instance);
	PrivateRoomDataInterface.s_instance = nil;
end

PrivateRoomDataInterface.ctor = function(self)	
	self.m_logFileName = "PrivateRoomDataInterface";

	self.m_privateRoomConfig = new(require("hall/privateRoom/data/privateRoomConfig"), self);
	self.m_privateRoomRecordData = new(require("hall/privateRoom/data/privateRoomRecordData"), self);

	self:initSocketManager();
	self:createSocketReader();
	self:createSocketWriter();
end

PrivateRoomDataInterface.dtor = function(self)
	LoadingView.getInstance():hidden();

	delete(self.m_privateRoomConfig);
	self.m_privateRoomConfig = nil;
end

-- 是否支持语音聊天
PrivateRoomDataInterface.isOpenVideo = function(self, gameId, tableType)
	return self.m_privateRoomConfig:isOpenVideo(gameId, tableType);
end

PrivateRoomDataInterface.log = function(self,funcName,...)
	Log.iWF(self.m_logFileName," ",funcName," ",...);
end
------------------------------------------------------------------------
PrivateRoomDataInterface.initSocketManager = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
end 

PrivateRoomDataInterface.createSocketReader = function(self)
	self.m_socketReader = new(PrivateRoomSocketReader);
	self.m_socket:addSocketReader(self.m_socketReader);
end

PrivateRoomDataInterface.createSocketWriter = function(self)
	self.m_socketWriter = new(PrivateRoomSocketWriter);
	self.m_socket:addSocketWriter(self.m_socketWriter);
end
--------------------------------------------------------------------
--获取能够建立私人房的游戏列表
PrivateRoomDataInterface.getPrivateConfig = function(self, typeList)
	self.m_privateRoomConfig:getData(typeList);
end

PrivateRoomDataInterface.requestPrivateConfig = function(self, typeList)
	self.m_privateRoomConfig:requestData(typeList);
end

PrivateRoomDataInterface.onGetPrivatRoomConfigCallback = function(self, isSuccess, data)
	self:notify(PrivateRoomDataInterface.Delegate.onGetPrivatRoomConfigCallback, isSuccess, data);
end

PrivateRoomDataInterface.onRequestPrivatRoomConfigCallback = function(self, isSuccess, data)
	self:notify(PrivateRoomDataInterface.Delegate.onRequestPrivatRoomConfigCallback, isSuccess, data);
end

-- 私人房大厅红点提示标记
PrivateRoomDataInterface.getOpenFlagHall = function(self)
	return self.m_privateRoomConfig:getOpenFlagHall();
end

PrivateRoomDataInterface.setOpenFlagHall = function(self, flag)
	self.m_privateRoomConfig:setOpenFlagHall(flag)
end

-- 私人房实时对讲提示标记
PrivateRoomDataInterface.getOpenFlagVideo = function(self)
	return self.m_privateRoomConfig:getOpenFlagVideo();
end

PrivateRoomDataInterface.setOpenFlagVideo = function(self, flag)
	self.m_privateRoomConfig:setOpenFlagVideo(flag)
end

-- 私人房积分房提示标记
PrivateRoomDataInterface.getOpenFlagScore = function(self)
	return self.m_privateRoomConfig:getOpenFlagScore();
end

PrivateRoomDataInterface.setOpenFlagScore = function(self, flag)
	self.m_privateRoomConfig:setOpenFlagScore(flag)
end

-- 跳转数据
PrivateRoomDataInterface.getJumpInfo = function(self)
	return self.m_jumpInfo;
end

PrivateRoomDataInterface.setJumpInfo = function(self, data)
	self.m_jumpInfo = data;
end

-- 选场跳私人房
PrivateRoomDataInterface.setCreateData = function(self, data)
	self.m_createData = data;
end

PrivateRoomDataInterface.getCreateData = function(self)
	return self.m_createData;
end
----------------------------------------------------------------------
--搜索私人房
PrivateRoomDataInterface.searchPrivateRoom = function(self,keyWords)
	keyWords = string.format("%.4d", tonumber(keyWords) or 0);
	if keyWords ~= "" then 
		self.m_socket:sendMsg(SEARCH_PRIVATE_ROOM_REQUEST,keyWords);
	end 
end

--请求私人房列表返回
PrivateRoomDataInterface.onSearchPrivateRoom = function(self, info)
	--搜索的内容
	local data = self:_analyseData(info);
 	self:notify(PrivateRoomDataInterface.Delegate.onSearchPrivateRoom,data);
end
---------------------------------------------------------------------
PrivateRoomDataInterface.requestCreatePrivateRoom = function(self, info)
	if table.isEmpty(info) then 
		return;
	end 

	local gameId = number.valueOf(info.gameId);
	if gameId <= 0 then
        return ;
    end

    local isGameCanPlay = self:checkGameInstallStatus(gameId);
    if not isGameCanPlay then 
    	return;
    end

	LoadingView.getInstance():showText(kTextCreateRoom);--创建房间中
	info.roomLevel = self:_getPrivateRoomByTableType(info.tableType);
	kGameManager:setCurRoomLevelId(info.roomLevel);
	info.userinfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(gameId);
	info.flag = 500;
	info.autoReady = info.roomLevel ~= GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN;
	info.isCreator = true;

	kAppData:setCurGameType(AppData.PRIVATE_ROOM);
	kAppData:setGameToWhereState(States.PrivateRoom);
	kGameManager:setCurGameId(gameId);
	kGameManager:setCurTableId();
	kGameManager:setCurShortTableId();
	
	local data = Copy(info);
	kAppData:setCurPrivateRoomInfo(data);
	
    kGameManager:startGame(gameId, nil, info);
	
    self.m_socket:sendMsg(CREATE_PRIVATE_ROOM_REQUEST, info);
end

PrivateRoomDataInterface.requestEnterPrivateRoom = function(self, info)	
    local gameId = number.valueOf(info.gameId);
    local tableId = number.valueOf(info.tId);
    local tableIdLong = number.valueOf(info.tIdLong);
    local serverId = number.valueOf(info.svId);

    if gameId <= 0 then
        return ;
    end

    local isGameCanPlay = self:checkGameInstallStatus(gameId);
    if not isGameCanPlay then 
    	return;
    end 
    info.roomLevel = self:_getPrivateRoomByTableType(info.tableType);
    kAppData:setCurPrivateRoomInfo(info);

    LoadingView.getInstance():showText(kTextEnterIntoRoom);--进入房间中

    local data = {};
	data.gameId = gameId;
	data.serverId = serverId;
	data.tableId = tableId;
    data.roomLevel = info.roomLevel;
    kGameManager:setCurRoomLevelId(data.roomLevel);

	data.mid = kUserInfoData:getUserId();
	data.userinfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(gameId);
	data.password = info.password or "";
    data.tableType = info.tableType;
    data.times = info.times;
    data.rounds = info.rounds;

    kAppData:setCurGameType(AppData.PRIVATE_ROOM);
    kAppData:setGameToWhereState(States.PrivateRoom);

    Log.d("wanpg-----请求创建私人房,从大厅去游戏",States.PrivateRoom);
    kGameManager:setCurGameId(gameId);
    kGameManager:setCurTableId(tableIdLong);
    kGameManager:setCurShortTableId(tableId);
        
    kGameManager:startGame(gameId, nil, data);
    self.m_socket:sendMsg(ENTER_PRIVATE_ROOM_REQUEST, data);
end

-----------------------------------------------------------------------------------------------------
PrivateRoomDataInterface.onReceivePrivateRoomInfo = function(self, info)
	info = table.verify(info);
	kAppData:setIsCanEscape(info.isCanEscape);
	kGameManager:setCurTableId(info.longTableId);
	kGameManager:setCurShortTableId(info.tableId);

	self:notify(PrivateRoomDataInterface.Delegate.onReceivePrivateRoomInfo,info);
end 
-----------------------------------------------------------------------------------------------------
PrivateRoomDataInterface.checkGameInstallStatus = function(self,gameId)
	local status = HallUpdateConfig.getInstance():getGameStatus(gameId);
    local msg = "";
    local isGameCanPlay = false;
    local gameConfig = GameInfoIsolater.getInstance():getGameConfigById(gameId);
    local name = table.isEmpty(gameConfig) and "" or gameConfig.name;
    if string.isEmpty(name) then
	    name = "此游戏";
    end
    if status == HallGameStatus.Expect then
	    isGameCanPlay = false;
	    msg = string.format("%s未上线，敬请期待！",name);

    elseif status == HallGameStatus.CanPlay then
	    isGameCanPlay = true;
        
    elseif status == HallGameStatus.CanInstall then
	    isGameCanPlay = false;
	    msg = string.format("%s未安装，请安装后再试~",name);

	    local data = kGameManager:getGameConfigById(gameId);
	    data.status = status;
	    UpdateHandleMgr.getInstance():startDownloadOrUpdateGame(data);

    elseif status == HallGameStatus.CanUpdate then
	    msg = string.format("%s可更新，请更新后再试~",name);
	    isGameCanPlay = false;

	    local data = {};
	    data.status = status;
	    data.id = gameId;
	    UpdateHandleMgr.getInstance():startDownloadOrUpdateGame(data);

    else
	    msg = string.format("%s未上线，敬请期待！",name);
	    isGameCanPlay = false;
    end

    return isGameCanPlay,msg;
end

PrivateRoomDataInterface.checkCanEnterRoom = function(self, info)
	if table.isEmpty(info) then
		return false, "您前往的约牌房不存在，无法成功加入";
	end

	local money = kUserInfoData:getMoney();

	local message = nil;
	if kBankruptDataInterface:checkIsBankrupt(money) then
		--银币过低
		message = kTextNoSufficientMoney;
	elseif number.valueOf(info.requireMoney) > money then
		--银币过低
		message = "您的银币没有达到房主设置的最低银币！";
	elseif number.valueOf(info.userCount_on) >= number.valueOf(info.userCount_max) then
		--房间已满
		message = "您前往的约牌房已满座，无法成功加入";
	end
	if message then
		return false, message;
	end
	return true;
end

-------------------------------扫码进入私人房--------------------------
-- @note 已弃用，只用作子游戏兼容
PrivateRoomDataInterface.generateQRParams = function(self, gameId, tableId, password)
    local t = {
        gameId = number.valueOf(gameId),
        tableId = number.valueOf(tableId),
        password = string.valueOf(password),
        regionId = kClientInfo:getRegionId(),
    }

    return t;
end


PrivateRoomDataInterface.parseQRParams = function(self, params)
    if table.isEmpty(params) or not params.dfqp_qrType then
        return QRUtil.eScanQRParamType.ERROR_PARAM;
    end

    if params.dfqp_createQrVersion ~= nil and tonumber(params.dfqp_createQrVersion) ~= QRUtil.CREATE_QR_VERSION[params.dfqp_qrType] then
        --版本不兼容
        return QRUtil.eScanQRParamType.ERROR_VERSION;
    end

    if number.valueOf(params.dfqp_qrType) ~= QRUtil.eQRType.PRIVATE_ROOM then
        --不是私人房
        return QRUtil.eScanQRParamType.ERROR_SCENE;
    end

    if number.valueOf(params.regionId) ~= kClientInfo:getRegionId() then
        --不是本地区
        return QRUtil.eScanQRParamType.ERROR_REGION;
    end

    if params.gameId and params.tableId and params.password then
        return QRUtil.eScanQRParamType.VALID_PARAM;
    end

    return QRUtil.eScanQRParamType.ERROR_PARAM;
end
--------------------------------------------玩牌记录-------------------------------------------------
PrivateRoomDataInterface.createRecordShareLayer = function(self, data)
	local privateRoomRecordShareLayer = require("hall/privateRoom/widget/privateRoomRecordShareLayer");
	local shareLayer = new(privateRoomRecordShareLayer, data);
	return shareLayer;
end

PrivateRoomDataInterface.createRecordSummaryLayer = function(self, data)
	local privateRoomRecordSummaryLayer = require("hall/privateRoom/widget/privateRoomRecordSummaryLayer");
	local summaryLayer = new(privateRoomRecordSummaryLayer, data);
	return summaryLayer;
end

-- 约牌记录列表
PrivateRoomDataInterface.requirePrivateRoomRecordList = function(self)
	self.m_privateRoomRecordData:requirePrivateRoomRecordList();
end

PrivateRoomDataInterface.getPrivateRoomRecordList = function(self)
	self.m_privateRoomRecordData:getPrivateRoomRecordList();
end

PrivateRoomDataInterface.onGetPrivateRoomRecordListCallback = function(self, isSuccess, data)
	self:notify(PrivateRoomDataInterface.Delegate.onGetPrivateRoomRecordListCallback, isSuccess, data)
end

-- 玩牌记录详情
PrivateRoomDataInterface.getPrivateRoomRecordDetail = function(self, tableKey)
	self.m_privateRoomRecordData:getPrivateRoomRecordDetail(tableKey);
end

PrivateRoomDataInterface.getPrivateRoomRecordDetailForce = function(self, tableKey)
	self.m_privateRoomRecordData:getPrivateRoomRecordDetailForce(tableKey);
end

PrivateRoomDataInterface.onGetPrivateRoomRecordDetailCallback = function(self, isSuccess, data)
	self:notify(PrivateRoomDataInterface.Delegate.onGetPrivateRoomRecordDetailCallback, isSuccess, data);
end
-----------------------------------------------------------------------------------------------------
PrivateRoomDataInterface.report = function(self, action, gameId, tableType)
	if action and gameId and tableType then
		UBReport.getInstance():report(action, string.format("gameId%s_levelId%s", gameId, self:_getPrivateRoomByTableType(tableType) or 0));
	end
end


PrivateRoomDataInterface._analyseData = function(self, data)
	local tmp = table.verify(data);
	for k, v in pairs(tmp) do
		v = table.verify(v);
        v.tId = number.valueOf(v.tId);
        v.svId = number.valueOf(v.svId);
        v.gameId = number.valueOf(v.gameId);
        v.userCount_on = number.valueOf(v.userCount_on);
        v.userCount_max = number.valueOf(v.userCount_max);
        v.requireMoney = number.valueOf(v.requireMoney);
		v.baseChip = number.valueOf(v.baseChip);
        v.roomName = tostring(v.roomName or "") or "";
		v.password = tostring(v.password or "") or "";
        v.isCanEscape = number.valueOf(v.isCanEscape);
		v.isAlwaysBanker = number.valueOf(v.isAlwaysBanker); -- 此字段无用

        v.ownerName = tostring(v.ownerName) or "";-- 房主名
        v.tableType = number.valueOf(v.tableType); --桌子类型
        v.times = number.valueOf(v.times); --倍数
        v.rounds = number.valueOf(v.rounds); --局数
        v.extParams = tostring(v.extParams) or ""; --扩展字段，交由游戏去解析(用于透传游戏特殊信息，便于自定义展示界面)
        v.tIdLong = number.valueOf(v.tIdLong); -- 真实tId
        v.roomLevel = self:_getPrivateRoomByTableType(v.tableType);
	end
	return tmp;
end

PrivateRoomDataInterface._getPrivateRoomByTableType = function(self,tableType)
	local roomLevel;
	if number.valueOf(tableType) == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then 
		roomLevel = GameRoomLevelConfig.PRIVATE_ROOMID_CRYSTAL;
	elseif number.valueOf(tableType) == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE then  
		roomLevel = GameRoomLevelConfig.PRIVATE_ROOMID_JIFEN;
	else 
		roomLevel = GameRoomLevelConfig.PRIVATE_ROOMID;
	end 
	return roomLevel;
end

PrivateRoomDataInterface.isGameSupportPrivateRoomFeature = function(self, gameId, tableType)
    return self.m_privateRoomConfig:isGameSupportPrivateRoomFeature(gameId, tableType);
end

PrivateRoomDataInterface.s_socketCmdFuncMap = {
	[PRIVATE_ROOM_LIST_REPONSE]				= PrivateRoomDataInterface.onSearchPrivateRoom;		
	[ROOM_BROADCAST_ROOM_INFO]				= PrivateRoomDataInterface.onReceivePrivateRoomInfo;
};