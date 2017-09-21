
--[[
	公共房间逻辑类，主要处理监听中间层接口返回的回调
]]

local CommonGameLogic = class();

CommonGameLogic.ctor = function(self)

end

CommonGameLogic.dtor = function(self)

end

CommonGameLogic.setObservers = function(self,observer)
	RadioIsolater.getInstance():setObserver(observer);
	UserPropertyIsolater.getInstance():setObserver(observer);
	GlobalSocketMessageHandler.getInstance():setObserver(observer);
	UserIdentityIsolater.getInstance():setObserver(observer);
	WeiXinIsolater.getInstance():setObserver(observer);
	RoomLevelConfig.getInstance():setObserver(observer);
	QRUtilIsolater.getInstance():setObserver(observer);
	SafeBoxIsolater.getInstance():setObserver(observer);
	UserGameInfoIsolater.getInstance():setObserver(observer);
	PrivateRoomIsolater.getInstance():setObserver(observer);
	PasswordIsolater.getInstance():setObserver(observer);
end

CommonGameLogic.clearObservers = function(self,observer)
	RadioIsolater.getInstance():clearObserver(observer);
	UserPropertyIsolater.getInstance():clearObserver(observer);
	GlobalSocketMessageHandler.getInstance():clearObserver(observer);
	UserIdentityIsolater.getInstance():clearObserver(observer);	
	WeiXinIsolater.getInstance():clearObserver(observer);
	RoomLevelConfig.getInstance():clearObserver(observer);
	QRUtilIsolater.getInstance():clearObserver(observer);
	SafeBoxIsolater.getInstance():clearObserver(observer);
	UserGameInfoIsolater.getInstance():clearObserver(observer);
	PrivateRoomIsolater.getInstance():clearObserver(observer);
	PasswordIsolater.getInstance():clearObserver(observer);
end

--------------------- RadioIsolater --------------------------------------
-- 接收广播
CommonGameLogic.onReciveRadioMsg = function(self,info)
	local action = GameMechineConfig.ACTION_NS_CREATVIEW;
  	local data = {viewName = GameMechineConfig.VIEW_BROADCAST}
	MechineManage.getInstance():receiveAction(action,data);
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_RECEIVE_RADIOMSG,info);
end

-- 发送广播回调
CommonGameLogic.onSendRadioCallBack = function(self,isSuccess,info)
	local data = {};
	data.isSuccess = isSuccess;
	data.info = info;
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_RECEIVE_SENDRAIAOCALLBACK,data);
end

--------------------- RadioIsolater end--------------------------------------

--------------- UserPropertyIsolater --------------------
-- 监听资产变化
CommonGameLogic.refreshUserProperty = function(self, propertyType, curNum, lastNum)
	if UserPropertyIsolater.getInstance():checkIsGold(propertyType) then 	
		self:refreshProperty("money", curNum, lastNum);
	elseif UserPropertyIsolater.getInstance():checkIsDiamond(propertyType) then 
		self:refreshProperty("diamond", curNum, lastNum);
	elseif UserPropertyIsolater.getInstance():checkIsCrystal(propertyType) then 
		self:refreshProperty("crystal", curNum, lastNum);
	end
end

CommonGameLogic.refreshProperty = function(self, tag, curNum, lastNum)
	local uid = UserBaseInfoIsolater.getInstance():getUserId();
	local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(uid);
	if curNum then
		local data = {};
		if tag == "money" then 	
			local tmp = { key = "money", value = curNum,propertyId = UserPropertyIsolater.getInstance():getPropertySilverCoinID() };
			table.insert(data, tmp);
		elseif tag == "diamond" or tag == "crystal" or tag == "silver" then 
			local tmp = { key = tag, value = curNum };
			table.insert(data, tmp);
		end
		GamePlayerManager2.getInstance():updatePlayerInfo(seat,data)
		local action = GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY;
		MechineManage.getInstance():receiveAction(action);
	end
end
--------------- UserPropertyIsolater end--------------------

CommonGameLogic.onGetGamePlayInfoCallBack = function(self,isSuccess,gameId, gameRecordInfo)
	if isSuccess and gameId == GameInfoIsolater.getInstance():getCurGameId() then
		gameRecordInfo = table.verify(gameRecordInfo);

		local seat = PlayerSeat.getInstance():getMyLocalSeat();
		local player = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
		player:setLoseCount(gameRecordInfo.loseTimes or 0);
		player:setWinCount(gameRecordInfo.winTimes or 0);
		player:setDrawCount(gameRecordInfo.drawTimes or 0);
		GamePlayerManager2.getInstance():addPlayer(player,seat);

		local data = {};
		table.insert(data, tmp);
		local tmp = {
			key = "winMax";
			value = gameRecordInfo.winMax or 0; 
		};
		table.insert(data, tmp);

		GamePlayerManager2.getInstance():updatePlayerInfo(seat,data);

		local action = GameMechineConfig.ACTION_NS_REFRESH_USERGAMERECORD;
		MechineManage.getInstance():receiveAction(action);
	end 
end 

--------------------------- GlobalSocketMessageHandler ---------------------------
-- 房间内牌局任务进度广播
CommonGameLogic.onBroadcastRoomBoxProgress = function(self, msgInfo)
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_BROAD_BOXTASK, msgInfo);
end

--[Comment]
-- 广播房间内使用道具
-- modified:zzb  为解决在房间内使用道具后马上退出无法更新道具数量的问题，把接收指令移到globalsocketprocesser
-- data:
CommonGameLogic.onServerBroadPhpUseProps = function (self, data)
	Log.d("CommonGameLogic.onServerBroadPhpUseProps","info = ",data);
	if not data or table.isEmpty(data) then
		self:showToast(kTextOperationFail);
		return;
	end
	local tb = string.split(data.propTarget, ",");
	if #tb > 0 then
		data.seat = tonumber(tb[1]);
		data.targetSeat = tonumber(tb[2]);
		local action = GameMechineConfig.ACTION_SHOWPROPNIM;
		MechineManage.getInstance():receiveAction(action, data, UserBaseInfoIsolater.getInstance():getUserId());
	end
end

-- 踢人结果回调
CommonGameLogic.onServerBroadVipKick = function(self, data)
	local action = GameMechineConfig.ACTION_VIPKICK;
	MechineManage.getInstance():receiveAction(action,data);
end

-- 广播银元牌局任务进度
CommonGameLogic.onBroadcastSilverInning = function ( self, info )
    SilverroomDataInterface2.getInstance():onPushCurInning(info);
	local action = GameMechineConfig.ACTION_NS_GET_SILVER_DATA;
	info.isPush = true;
	MechineManage.getInstance():receiveAction(action, info, nil, nil, "CommonGameLogic.onBroadcastSilverInning");
end

CommonGameLogic.onSocketUpdateNetIcon = function(self, info)
	local action = GameMechineConfig.ACTION_NS_REFRESH_WIFI;
	MechineManage.getInstance():receiveAction(action, info, UserBaseInfoIsolater.getInstance():getUserId());
end

--------------------------- GlobalSocketMessageHandler end---------------------------

--------------------- userIdentityIsolater ---------------------------
-- 用户身份变化、vip状态等
CommonGameLogic.refreshUserIdentity = function(self, curIdentity, lastIdentity)
	Log.d("GamePlayerManager2.refreshUserIdentity", curIdentity, lastIdentity);
	local uid = UserBaseInfoIsolater.getInstance():getUserId();
	local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(uid);
	local data = {}; -- 用户身份变化
	local tmp = { key = "identity", value = curIdentity };
	table.insert(data, tmp);
	GamePlayerManager2.getInstance():updatePlayerInfo(seat,data);

	local data = {};
	data.lastIdentity = lastIdentity;
	data.curIdentity = curIdentity;
	local action = GameMechineConfig.ACTION_NS_UPDATE_USERINFO;
	MechineManage.getInstance():receiveAction(action,data);
end
--------------------- userIdentityIsolater end---------------------------

-------------------- WeiXinIsolater -----------------------------


-- 微信分享回调
CommonGameLogic.onGetWeiChatCallback = function(self, isSuccess, param, shareChannel)
	LoadingView.getInstance():hidden();
	local action = GameMechineConfig.ACTION_NS_WEIXIN_SHARE_CALLBACK;
	MechineManage.getInstance():receiveAction(action);
end

--下载分享图片回调
CommonGameLogic.onDownloadShareImageCallBack = function(self, isSuccess, downloadShareImageParams, filePath, fileName)
	local info = {
		isSuccess = isSuccess;
		downloadShareImageParams = downloadShareImageParams;
		filePath = filePath;
		fileName = fileName;
	};
	local action = GameMechineConfig.ACTION_NS_DOWNLOAD_SHARE_IMAGE_CALLBACK;
	MechineManage.getInstance():receiveAction(action, info);
end

--截屏回调
CommonGameLogic.onSaveImageToPhotoAlbumCallBack = function(self, isSuccess, imagePath, imageName, customParam)
	Log.d("CommonGameLogic.onSaveImageToPhotoAlbumCallBack");
	local info = {
		isSuccess = isSuccess;
		imagePath = imagePath;
		imageName = imageName;
		customParam = customParam;
	};
	local action = GameMechineConfig.ACTION_NS_SAVEIMAGE_TO_PHOTOALBUM__CALLBACK;
	MechineManage.getInstance():receiveAction(action, info);
end

-------------------- WeiXinIsolater end-----------------------------

----------------------- QRUtilIsolater ----------------------------
-- 二维码创建结果回调
CommonGameLogic.onCreateQRCallBack = function(self, isSuccess, qrType, fileName)
	local info = {
		isSuccess = isSuccess;
		qrType = qrType;
		fileName = fileName;
	};
	local action = GameMechineConfig.ACTION_NS_CREATE_QR_CALLBACK;
	MechineManage.getInstance():receiveAction(action, info);
end
----------------------- QRUtilIsolater ----------------------------

------------------------- SafeBoxIsolater --------------------
-- 保险箱取款回调
CommonGameLogic.onUpdateSafeBoxCallBack = function(self,isSuccess, data)
	if isSuccess then
		local info = {};
		local tmp = { key = "money", value = UserPropertyIsolater.getInstance():getMoney(),propertyId = UserPropertyIsolater.getInstance():getPropertySilverCoinID() };
		table.insert(info, tmp);
		local uid = UserBaseInfoIsolater.getInstance():getUserId();
		local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(uid);
		GamePlayerManager2.getInstance():updatePlayerInfo(seat,info);
		local action = GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY;
		MechineManage.getInstance():receiveAction(action);
	end
	local info = {};
	info.isSuccess = isSuccess;
	info.data = data;
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SAFEBOXRESULT,info);
end
------------------------- SafeBoxIsolater --------------------

-- 电量刷新
CommonGameLogic.onUpdateBatteryLevel = function (self, status, json_data)
	if not status or not json_data then
		Log.i("CommonGameLogic.onUpdateBatteryLevel--电量获取失败。")
		return;
	else
		local level = GetNumFromJsonTable(json_data, "Level");
		Log.i("CommonGameLogic.onUpdateBatteryLevel--电量获取成功。", level)
		if level then 
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_GET_BATTERYLEVEL, level);
		end 
	end
end

------------------------- PrivateRoomIsolater --------------------

CommonGameLogic.onReceivePrivateRoomInfo = function ( self, data )
	local tableId = GameInfoIsolater.getInstance():getCurTableId();
	local tableIdShort = GameInfoIsolater.getInstance():getCurShortTableId();
	tableId = tableIdShort > 0 and tableIdShort or tableId;
	PrivateRoomIsolater.getInstance():searchPrivateRoom(tableId);
	
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_RECEIVE_PRIVATEROOMINFO,data);
end


CommonGameLogic.onSearchPrivateRoom = function(self, data)
	if not table.isEmpty(data) and not table.isEmpty(data[1]) then
		local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
    	privateRoomInfo = table.verify(privateRoomInfo);
    	local info = CombineTables(privateRoomInfo,data[1]);
		PrivateRoomIsolater.getInstance():setCurPrivateRoomInfo(info);

		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SEARCH_PRIVATEROOM,data);
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM);
	end
end

CommonGameLogic.onRequestPrivatRoomConfigCallback = function(self, isSuccess, data)
	if isSuccess then
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM);
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_LOGIN_VIDEO);
	end
end

CommonGameLogic.onGetPasswordByInfoCallback = function(self, isSuccess, password)
    if isSuccess then
        MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_GET_PASSWORD_BY_INFO, password);
    end
end

-- 资产信息刷新
CommonGameLogic.onServerPushOtherUserInfo = function(self, data)
	if not data then return end
	Log.d("CommonGameLogic.onServerPushOtherUserInfo",data);
	local mid = data.userMid;
	local seatId = GamePlayerManager2.getInstance():getLocalSeatByMid(mid);
	local updateInfo = {};
	for k,v in pairs(data.propertyArr) do
  		local propertyId = number.valueOf(v.propertyId);
  		local num = number.valueOf(v.num);
		if propertyId == UserPropertyIsolater.getInstance():getPropertySilverCoinID() 
            or propertyId == UserPropertyIsolater.getInstance():getPropertyGoldBarID()
            or propertyId == UserPropertyIsolater.getInstance():getPropertyDiamondID() then

            local temp = {key = "money",value = num, propertyId = propertyId};
            table.insert(updateInfo, temp);
         end		
	end
	if table.isEmpty(updateInfo) then return end;
	GamePlayerManager2.getInstance():updatePlayerInfo(seatId,updateInfo);
	local action = GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY;
	MechineManage.getInstance():receiveAction(action,{},mid);
end

CommonGameLogic.onEventFunc = function(self,param,...)
	if self.eventFuncMap[param] then
		self.eventFuncMap[param](self,...);
	end
end

CommonGameLogic.eventFuncMap = {
	["onReciveRadioMsg"]					= CommonGameLogic.onReciveRadioMsg;
	["onSendRadioCallBack"] 				= CommonGameLogic.onSendRadioCallBack;
	["refreshUserProperty"] 				= CommonGameLogic.refreshUserProperty;
	["refreshProperty"] 					= CommonGameLogic.refreshProperty;
	["onGetGamePlayInfoCallBack"]			= CommonGameLogic.onGetGamePlayInfoCallBack;

	-- ["onPhpRequestTimeout"]					= CommonGameLogic.onPhpRequestTimeout;
	-- ["onBroadcastPayMoney"]					= CommonGameLogic.onBroadcastPayMoney;
	-- ["onGetPhpPushMessageCallBack"] 		= CommonGameLogic.onGetPhpPushMessageCallBack;

	["onBroadcastRoomBoxProgress"]			= CommonGameLogic.onBroadcastRoomBoxProgress;
	["onServerBroadPhpUseProps"]			= CommonGameLogic.onServerBroadPhpUseProps;
	["onServerBroadVipKick"]				= CommonGameLogic.onServerBroadVipKick;
	["onBroadcastSilverInning"]				= CommonGameLogic.onBroadcastSilverInning;
    ["onSocketUpdateNetIcon"]				= CommonGameLogic.onSocketUpdateNetIcon;
	["refreshUserIdentity"]					= CommonGameLogic.refreshUserIdentity;
	["onGetWeiChatCallback"]				= CommonGameLogic.onGetWeiChatCallback;
	["onDownloadShareImageCallBack"]		= CommonGameLogic.onDownloadShareImageCallBack;
	["onSaveImageToPhotoAlbumCallBack"]		= CommonGameLogic.onSaveImageToPhotoAlbumCallBack;
	-- ["onGameLevelUpdate"]					= CommonGameLogic.onGameLevelUpdate;

	["onCreateQRCallBack"]					= CommonGameLogic.onCreateQRCallBack;
	["onUpdateSafeBoxCallBack"]				= CommonGameLogic.onUpdateSafeBoxCallBack;
	["onUpdateBatteryLevel"]				= CommonGameLogic.onUpdateBatteryLevel;

	["onReceivePrivateRoomInfo"] 			= CommonGameLogic.onReceivePrivateRoomInfo;
	["onSearchPrivateRoom"] 				= CommonGameLogic.onSearchPrivateRoom;
	["onRequestPrivatRoomConfigCallback"] 	= CommonGameLogic.onRequestPrivatRoomConfigCallback;
    ["onGetPasswordByInfoCallback"]			= CommonGameLogic.onGetPasswordByInfoCallback;
    ["onServerPushOtherUserInfo"]			= CommonGameLogic.onServerPushOtherUserInfo;
};

return CommonGameLogic;