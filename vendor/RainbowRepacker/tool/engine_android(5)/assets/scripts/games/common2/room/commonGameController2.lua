require("games/common2/module/roomGameConfig");

require("games/common2/network/socket/commonGameSocketCmd2");
require("games/common2/network/socket/commonGameSocketProcesser2");
require("games/common2/network/socket/commonGameSocketReader2");
require("games/common2/network/socket/commonGameSocketWriter2");

require("games/common2/onlooker/data/onlookerPlayerManager");

CommonGameController2 = class(CommonController, false);

CommonGameController2.s_cmds = {
	pushOtherState = ToolKit.getIndex();
	requestLogoutRoom = ToolKit.getIndex();
	requestExitRoom = ToolKit.getIndex();
	clickDesktop 	= ToolKit.getIndex();
	doubleClickDesktop 	= ToolKit.getIndex();
	requestExitJiFenRoom = ToolKit.getIndex();
	requestEnterRoom = ToolKit.getIndex();
};

CommonGameController2.TYPE_LOGIN_ROOM_TIMEOUT = EventDispatcher.getInstance():getUserEvent();--登录超时
CommonGameController2.TYPE_LOGOUT_DELAY = EventDispatcher.getInstance():getUserEvent(); --错误时延时退出
CommonGameController2.TYPE_CHANGE_TABLE = EventDispatcher.getInstance():getUserEvent();--换桌超时
CommonGameController2.TYPE_RELOGIN_FOR_RECONNECT = EventDispatcher.getInstance():getUserEvent();--非playing状态下重连,重新进房间的超时

--重连超时
CommonGameController2.TYPE_OFFLINE_RECONNECT_TIMEOUT_1 = EventDispatcher.getInstance():getUserEvent(); --socket断链接重连阶段1
CommonGameController2.TYPE_ONLINE_RECONNECT_TIMEOUT_1 = EventDispatcher.getInstance():getUserEvent();--socket未断重连阶段1
CommonGameController2.TYPE_RECONNECT_TIMEOUT_2 = EventDispatcher.getInstance():getUserEvent();--重连阶段2

CommonGameController2.ctor = function(self, state, viewClass, viewConfig, ...)
	Log.d("CommonGameController2.ctor");
	self.m_state = state;--此句话必须存在，为了在getBundleData中调用state的方法
	super(self, state, viewClass, viewConfig, ...);
	MsgProcessTools.releaseInstance();
	self:addSocketTools();
	self:setObservers();
	
	CommunityLogic.getInstance();
	LoginGameLogic2.getInstance();
	IBaseDialog.hide();
	self:getListenMechineMap();

	OnlookerPlayerManager.getInstance():removeAllOnlooker();
end

CommonGameController2.setObservers = function(self)
	self:creatLogic();
	self.m_commonLoigc:setObservers(self);
	EventDispatcher.getInstance():register(Event.Call,self,self.onNativeEvent);
end

CommonGameController2.clearObservers = function(self)
	self:creatLogic();
	self.m_commonLoigc:clearObservers(self);
	EventDispatcher.getInstance():unregister(Event.Call,self,self.onNativeEvent);
end

--@brief 请求进入房间
CommonGameController2.requestEnterRoom = function(self)
	local isInMatchRoom = GameInfoIsolater.getInstance():isInMatchRoom();
	if not isInMatchRoom then
		if self:checkIsNeedEnterOnlookerRoom() then 
			local _,info = self.m_state:getBundleData();
			info = table.verify(info);
			self:onRequestEnterOnlooker(nil,nil,info);
			return;
		end
	end  

	if not self:checkAndSendLogin() then
		if isInMatchRoom then
		
		elseif PrivateRoomIsolater.getInstance():isInPrivateRoom() then	
			-- 大厅调用登陆
		else 
			LoginGameLogic2.getInstance():requestEnterRoom();
			GameTimer2.startTimeOut(CommonGameController2.TYPE_LOGIN_ROOM_TIMEOUT, self, self.onCommonTimeOutCallBack,15000);
		end
	end
end

CommonGameController2.creatLogic = function(self)
	if not self.m_commonLoigc then
		local commonGameLogic = require("games/common2/room/commonGameLogic");
		self.m_commonLoigc = new(commonGameLogic);
		self.m_commonLoigc:setDelegate(self);
	end
end

--检测是否需要跳去围观房间
CommonGameController2.checkIsNeedEnterOnlookerRoom = function(self)
	local _,info = self.m_state:getBundleData();
	info = table.verify(info);

	if info.isEnterOnlooker then 
		if not info.userId then 
			return false;
		end 
		return true;
	end 

	return false;
end

--private
--检测状态并根据房间状态发送login指令
CommonGameController2.checkAndSendLogin = function(self)
	local curGameType = GameInfoIsolater.getInstance():getCurGameType();
	local privateRoomReconnectType = PrivateRoomIsolater.getInstance():getPrivateRoomReconnectType();
	local normalRenoonectType = GameInfoIsolater.getInstance():getNormalRoomReconnectType();

	if curGameType == privateRoomReconnectType or curGameType == normalRenoonectType then
		--重连
		Log.a("CommonGameController2","checkAndSendLogin","==> requestLoginRoom");
		self:requestLoginRoom();
		GameTimer2.startTimeOut(CommonGameController2.TYPE_RECONNECT_TIMEOUT_2, self, self.reconnectRoomTimeOut);
		return true;
	end
	return false;
end

CommonGameController2.dtor = function(self)
	Log.d("CommonGameController2.dtor");
	delete(self.m_commonLoigc);
	self.m_commonLoigc = nil;
	ServerLifeDetector2.releaseInstance();
	GameTimer2.clearTimeOutClock();
	GameTimer2.release();
	CommonRoomTimer2.releaseInstance();
	
	self:removeSocketTools();
	self:clearObservers();
	
	MsgProcessTools.releaseInstance(); -- 必须先释放消息队列再删除状态机！！！！！
	MechineManage.releaseInstance();
	MechineLog.releaseInstance();
	LoginGameLogic2.releaseInstance();
	GameRoomData.releaseInstance();
	CommonPlayerInfoHandler2.releaseInstance();
	RoomTaskLogic.releaseInstance();
	CommunityLogic.releaseInstance();
	DialogLogic.releaseInstance();
	RoomLevelConfig.releaseInstance();
	RoomLogic.releaseInstance();
	InteractionInfo.releaseInstance();
	GameCommonData.releaseInstance();

	self.m_isIgnored = nil;
	MessageBox.hide();
	-- GameProcessManager2.getInstance():reset();
	-- GamePlayerManager2.getInstance():reset(true);
	-- PlayerSeat.getInstance():reset();
end 

--virtual
CommonGameController2.addSocketTools = function(self)
	self.m_socket = SocketIsolater.getInstance():getSocket();	
end

--@override
CommonGameController2.removeSocketTools = function(self)
	self.m_socket:removeSocketReader(self.m_roomSocketReader);
	self.m_socket:removeSocketWriter(self.m_roomSocketWriter);

	delete(self.m_roomSocketReader);
	self.m_roomSocketReader = nil;
	delete(self.m_roomSocketWriter);
	self.m_roomSocketWriter = nil;
	delete(self.m_roomSocketProcesser);
	self.m_roomSocketProcesser = nil;
end

--@override
CommonGameController2.run = function(self)
	Log.d("CommonGameController2.run");
	CommonController.run(self);
	self:registerAction();
end

--@override
CommonGameController2.resume = function(self)
	Log.d("CommonGameController2.resume");
	CommonController.resume(self);
	self:checkIsExitRoom();
end

--@override
CommonGameController2.pause = function(self)
	Log.d("CommonGameController2.pause");
	CommonController.pause(self);
end

--@override
CommonGameController2.stop = function(self)
	Log.d("CommonGameController2.stop");
	CommonController.stop(self);
	self:unRegisterAction();
end

--@override
CommonGameController2.onPause = function(self)
	CommonController.onPause(self);
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_LOGOUT_VIDEO, true);
end

--@override
CommonGameController2.onResume = function(self)
	CommonController.onResume(self);
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_LOGIN_VIDEO, true);
end

-- 注册游戏状态、动作监听
CommonGameController2.registerAction = function(self)
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_STATE,self,self.monitoringState);
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_ACTION,self,self.monitoringAction);
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_MAINSTATE, self, self.mainStateChange);
end

CommonGameController2.unRegisterAction = function(self)
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_STATE, self, self.monitoringState);
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_ACTION, self, self.monitoringAction);
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_MAINSTATE, self, self.mainStateChange);
end

CommonGameController2.monitoringAction = function(self,action,seat,uid,info,isFast)
 	self:notifyActionMap(action,seat,uid,info,isFast);
end

-- 查找当前view需要监听的所有状态和动作
CommonGameController2.getListenMechineMap = function(self)
	if self.m_listenStateFuncMap then
		return;
	end
	self.m_listenStateFuncMap = {};
	self.m_listenActionFuncMap = {};
    local curObj = self;
    while curObj do
    	if curObj.s_stateFuncMap then
			self.m_listenStateFuncMap = CombineTables(curObj.s_stateFuncMap, self.m_listenStateFuncMap);
		end
		if curObj.s_actionFuncMap then
			self.m_listenActionFuncMap = CombineTables(curObj.s_actionFuncMap, self.m_listenActionFuncMap);
		end
        curObj = curObj.super;
    end
end

-- -- 接收广播状态消息
CommonGameController2.monitoringState = function(self,state,laststate,action,seat,uid,info,isFast)
	if not self.m_listenStateFuncMap[state] then
		return;
	end
  	local func = self:getCurListenFunc(state,"s_stateFuncMap");
    if func then
    	func(self,seat,uid,info,isFast);
    end
    self:notifyActionMap(action,seat,uid,info,isFast)
end

CommonGameController2.notifyActionMap = function(self,action,seat,uid,info,isFast)
	if not self.m_listenActionFuncMap[action] then
		return;
	end
    local func = self:getCurListenFunc(action,"s_actionFuncMap");
    if func then
    	func(self,seat,uid,info,isFast);
    end
end

CommonGameController2.getCurListenFunc = function(self,cmd,map)
	local curObj = self;
	local func = nil;
	 while curObj and curObj[map] do
        func = curObj[map][cmd];
        if func then
            break;
        else
            curObj = curObj.super;
        end
    end
	if type(func) == "function" then
    	return func;
    elseif type(func) == "string" then
        local funcSelf = nil;
        local curObj = self;
        while curObj do
            funcSelf = curObj[func];
            if funcSelf then
                break;
            else
                curObj = curObj.super;
            end
        end
        return funcSelf;
    end
end

-- 游戏主状态
CommonGameController2.mainStateChange = function(self,state,laststate)
	self.m_mainState = state;
end

--@override
CommonGameController2.onBackPressed = function(self)
	if DialogLogic.getInstance():popDialog() then
		return;
	end
	if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return;
	end
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 	
		self:requestExitJiFenRoom();
		return;
	end 
	if self:requestExitRoom() then 
		return;
	end 
	return true;
end

-- 设置只需要再controller中处理的消息
----------------------------------------------------------------------------------------------------

-- CommonGameController2.onRoomLoginSuccess = function(self)
-- 	Log.d("-------------");
-- end

--protect 
--请求登出房间，仅仅是在指令层，对界面无影响
CommonGameController2.requestLogoutRoom = function(self)
	self.m_socket:sendMsg(ROOM_SEND_LOGOUT);
end

-- 退出房间
CommonGameController2.requestExitRoom = function(self)
	Log.a("CommonGameController2","requestExitRoom");
	local mainState = MechineManage.getInstance():getMainState(UserBaseInfoIsolater.getInstance():getUserId());
	if mainState == GameMechineConfig.STATUS_PLAYING then 
		self:showToast("牌局还未结束，请打完再走！");
		return false;
	end
    
	self:requestLogoutRoom();

	Log.a("TOHALL","CommonGameController2.requestExitRoom","==> hall");
	self:changeOtherGame(GameInfoIsolater.getInstance():getHallGameType());
end

-- 强制退出房间
CommonGameController2.onForceExitRoom = function(self,seat,uid,info,isFast)
	if info and info.isOffLine then
		-- 掉线，回到大厅需要重新登录
		GameInfoIsolater.getInstance():setLoginOffline();
	end
	self:requestLogoutRoom();
	self:changeOtherGame(GameInfoIsolater.getInstance():getHallGameType());
end

CommonGameController2.loginError = function(self)
	LoadingView.getInstance():hidden();
	self:releaseRoomTimer();
	GameTimer2.startTimeOut(CommonGameController2.TYPE_LOGOUT_DELAY, self, self.onCommonTimeOutCallBack, 1000);
end

CommonGameController2.onLoginSuccess = function(self,seat,uid,info,isFast)
	if uid == UserBaseInfoIsolater.getInstance():getUserId() then 
		LoadingView.getInstance():hidden();

		self:releaseRoomTimer();
	end 
end

-- 退出房间成功
CommonGameController2.onLogOutSuccess = function(self,seat,uid,info,isFast)
end

-- private  
-- 用的timeOut的回调，子类尽量命名成其他的
CommonGameController2.onCommonTimeOutCallBack = function(self, id)
	-- self:onCommonRoomTimeOut(id);

	if id == CommonGameController2.TYPE_LOGIN_ROOM_TIMEOUT then
		--登录房间超时
		self:showToast(netWorkErrorTips);
		self:onForceExitRoom();
	elseif id == CommonGameController2.TYPE_LOGOUT_DELAY then
		--延时调用退出回调
		--此处登出房间
		self:onForceExitRoom();
	elseif id == CommonGameController2.TYPE_CHANGE_TABLE then
		-- 换桌超时
	end
end

CommonGameController2.requestRecharge = function(self,action,uid,info)
	local scene = info.scene or PayIsolater.eGoodsListId.RoomPay;
	self:onPushOtherState(States.ShortCutRecharge,nil,true,scene,info.param,info.goodInfo,info.isOnlySupportSMS)
end

CommonGameController2.showToast = function(self,msg)
	if not string.isEmpty(msg) then
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end
end
-------------------cmd func start ----------------------------------------------------------------------
CommonGameController2.onPushOtherState = function(self,state,...)
	self.m_state:pushState(state, ...);
end

CommonGameController2.changeOtherGame = function(self,state,...)
	OnlookerPlayerManager.getInstance():removeAllOnlooker();

	self:_clearSameNameTools();
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	GameInfoIsolater.getInstance():setLastGameId(curGameId);
	GameInfoIsolater.getInstance():startGame(state,...);
end

--在游戏房间往另一个游戏房间跳转前先释放common2与common中的名字相同的工具类，去掉加载标记，下次可以重新require
CommonGameController2._clearSameNameTools = function(self)
	CommonRoomTimer.releaseInstance();
	local pkg = package.loaded;
	pkg["games/common2/tools/commonRoomTimer"] = nil;
end
-------------------cmd func end ----------------------------------------------------------------------
--@override
--重写此方法为了监听指令收发，保证不超时
CommonGameController2.handleSocketCmd = function(self,cmd,...)
    local func = nil;
    local curObj = self;
    while curObj and curObj.s_socketCmdFuncMap do
        func = curObj.s_socketCmdFuncMap[cmd];
        if func then
            break;
        else
            curObj = curObj.super;
        end
    end

	if type(func) == "function" then
    	func(self, ...);
    	return true;
    elseif type(func) == "string" then
        local funcSelf = nil;
        local curObj = self;
        while curObj do
            funcSelf = curObj[func];
            if func then
                break;
            else
                curObj = curObj.super;
            end
        end
        if funcSelf then
            local info = funcSelf(self,...);
            return true;--此处有争议
        end
    end
	Log.w("Not such socket cmd[", string.format("%X",number.valueOf(cmd,0)), "] in current controller");	
	return false;
end

CommonGameController2.onCreatView = function(self,seat,uid,info,isFast)
	self:updateView(CommonGameScene2.s_cmds.ceatView,seat,uid,info,isFast);
end

CommonGameController2.onClickDesktop = function ( self )
	-- body
	local action = GameMechineConfig.ACTION_NS_CLICK_DESKTOP;
	MechineManage.getInstance():receiveAction(action);
end

CommonGameController2.onDoubleClickDesktop = function ( self )
	-- body
	local action = GameMechineConfig.ACTION_NS_DOUBLE_CLICK_DESKTOP;
	MechineManage.getInstance():receiveAction(action);
end
------------------------- socket重连 开始 ----------------------------------------
--@override
-- socket 重连中
CommonGameController2.onSocketReconnecting = function(self, data)
	Log.a("CommonGameController2","onSocketReconnecting");
	CommonController.onSocketReconnecting(self);
	
	LoadingView.getInstance():hidden();
	local str = ClientInfoIsolater.getInstance():getNetWorkAvalible() and 
		GameString.get("roomNetworkErrorWeak") or GameString.get("roomNetworkErrorSetting");

	self.m_soketReconnectCount = number.valueOf(data.count);
	LoadingView.getInstance():showText(str, nil, nil, true);
end

--@override
-- socket重连成功
CommonGameController2.onSocketReconnected = function(self)
	Log.a("CommonGameController2","onSocketReconnected");
	ServerLifeDetector2.getInstance():updateLifeTime();--此处更新监听器的时间
	CommonController.onSocketReconnected(self);
	
	LoadingView.getInstance():hidden();

	if self.m_soketReconnectCount and self.m_soketReconnectCount < 10 then
	    local str = ClientInfoIsolater.getInstance():getNetWorkAvalible() and 
			GameString.get("roomNetworkErrorWeak") or GameString.get("roomNetworkErrorSetting");
		LoadingView.setDefaultDisplayTime(5000);
		LoadingView.getInstance():showText(str, nil, nil, true);
		LoadingView.setDefaultDisplayTime();
	end

	self:startReconnect();
end

--@override
-- socket断线
CommonGameController2.onSocketReConnectFailed = function(self)
	Log.a("CommonGameController2","onSocketReConnectFailed");
	CommonController.onSocketReConnectFailed(self);

	LoadingView.getInstance():hidden();

	self:startExit();
end

CommonGameController2.onPhpRequestTimeout = function(self)
end

CommonGameController2.onBroadcastPayMoney = function(self)
end

CommonGameController2.onGetPhpPushMessageCallBack = function(self)
end


--方便特殊房间处理重连
CommonGameController2.startReconnect = function(self)
	if self.m_mainState == GameMechineConfig.STATUS_PLAYING then 
		self:_offlineReconnectRoom_1();
	else 
		local action = GameMechineConfig.ACTION_NS_RELOGIN_FOR_RECONNECT;
		MechineManage.getInstance():receiveAction(action);

		local action = GameMechineConfig.ACTION_NS_REFRESH_READY_STATUS;
		MechineManage.getInstance():receiveAction(action,{isShow = false});

		local allPlayer = table.verify(GamePlayerManager2.getInstance():getOtherPlayers());
		for _,v in pairs(allPlayer) do
			local curState = MechineManage.getInstance():getStates(v:getMid());
			if curState and curState ~= GameMechineConfig.STATUS_NONE then
				local action = GameMechineConfig.ACTION_EXIT;
				MechineManage.getInstance():receiveAction(action, nil, v:getMid(), false, "CommonGameController2.startReconnect");
			end
		end

		OnlookerPlayerManager.getInstance():removeAllOnlooker();

		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_REFRESH_MAINSTATUS, 
			GameMechineConfig.STATUS_RECONNECT, -1);

		if PrivateRoomIsolater.getInstance():isInPrivateRoom() then	
			MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_LOGOUT_VIDEO);
			local privateRoomInfo = PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo();
			privateRoomInfo = table.verify(privateRoomInfo);
			PrivateRoomIsolater.getInstance():requestEnterPrivateRoom(privateRoomInfo);
			LoadingView.getInstance():showText("正在连接网络");

		else 
			LoginGameLogic2.getInstance():requestEnterRoom();
		end
		GameTimer2.startTimeOut(CommonGameController2.TYPE_RELOGIN_FOR_RECONNECT, self, self.reconnectRoomTimeOut,5000); 
	end 
end


CommonGameController2.startExit = function(self)
	Log.a("CommonGameController2","_onlineReconnectRoom_2");
	self:requestExitRoom();
end 
-------------------------socket重连 结束----------------------------------------
-------------------------游戏房间重连 开始----------------------------------------
--请求登录房间,发送指令是0x1001
--成功回复1009
CommonGameController2.requestLoginRoom = function(self, gameId)
	Log.a("CommonGameController2","requestLoginRoom","sendMsg 0x1001");

	local gameId = gameId or GameInfoIsolater.getInstance():getCurGameId();--取到当前的gameId
	local info = {};
	info.roomId = GameInfoIsolater.getInstance():getCurTableId();
	info.mid = UserBaseInfoIsolater.getInstance():getUserId();
	info.userInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(gameId);
	info.key = "55ff85e777d50680fb52935076d7e55b";

	local data = {};
	data.api = ClientInfoIsolater.getInstance():getApi();
	data.version = ClientInfoIsolater.getInstance():getApkVersion();
	info.plateInfo = json.encode(data);

	self.m_socket:sendMsg(ROOM_SEND_LOGIN, info);
end

--刷新所有信息，发送指令是0x2117
--成功回复1009
CommonGameController2.requestRefreshAllGameInfo = function(self)
	Log.a("CommonGameController2","requestRefreshAllGameInfo","sendMsg 0x2117");

	self.m_socket:sendMsg(ROOM_REQUEST_RECONNECT);
end

-- socket断了后,先尝试发0x1001,超时后再尝试发0x2127
CommonGameController2._offlineReconnectRoom_1 = function(self)
	Log.a("CommonGameController2","_offlineReconnectRoom_1","==> requestLoginRoom");	
	self:releaseRoomTimer();

	LoadingView.getInstance():showText("正在连接网络");
	self:requestLoginRoom();
	GameTimer2.startTimeOut(CommonGameController2.TYPE_OFFLINE_RECONNECT_TIMEOUT_1, self, self.reconnectRoomTimeOut);
end
CommonGameController2._offlineReconnectRoom_2 = function(self)
	Log.a("CommonGameController2","_offlineReconnectRoom_2","==> requestRefreshAllGameInfo");
	LoadingView.getInstance():showText("正在连接网络");
	self:requestRefreshAllGameInfo();
	GameTimer2.startTimeOut(CommonGameController2.TYPE_RECONNECT_TIMEOUT_2, self, self.reconnectRoomTimeOut);
end

-- socket未断,先尝试发0x2127,超时后再尝试发0x1001
CommonGameController2._onlineReconnectRoom_1 = function(self)
	Log.a("CommonGameController2","_onlineReconnectRoom_1","==> requestRefreshAllGameInfo");
	self:releaseRoomTimer();

	self:requestRefreshAllGameInfo();	
	GameTimer2.startTimeOut(CommonGameController2.TYPE_ONLINE_RECONNECT_TIMEOUT_1, self, self.reconnectRoomTimeOut);
end
CommonGameController2._onlineReconnectRoom_2 = function(self)
	Log.a("CommonGameController2","_onlineReconnectRoom_2","==> requestLoginRoom");
	self:requestLoginRoom();
	GameTimer2.startTimeOut(CommonGameController2.TYPE_RECONNECT_TIMEOUT_2, self, self.reconnectRoomTimeOut);
end

CommonGameController2.reconnectRoomTimeOut = function(self,id)
	if id == CommonGameController2.TYPE_OFFLINE_RECONNECT_TIMEOUT_1 then
		--socket断后重连发送0x1001超时，接下来发0x2127
		self:_offlineReconnectRoom_2();
	
	elseif id == CommonGameController2.TYPE_ONLINE_RECONNECT_TIMEOUT_1 then 
		--socket未断重连发送0x2127超时，接下来发0x1001
		self:_onlineReconnectRoom_2();

	elseif id == CommonGameController2.TYPE_RECONNECT_TIMEOUT_2 or id == CommonGameController2.TYPE_RELOGIN_FOR_RECONNECT then
		LoadingView.getInstance():hidden();
		--重连阶段2超时,退出房间
		self:onForceExitRoom();
	end 
end


CommonGameController2.releaseRoomTimer = function(self)
	GameTimer2.release(CommonGameController2.TYPE_LOGIN_ROOM_TIMEOUT);
	GameTimer2.release(CommonGameController2.TYPE_OFFLINE_RECONNECT_TIMEOUT_1);
	GameTimer2.release(CommonGameController2.TYPE_ONLINE_RECONNECT_TIMEOUT_1);
	GameTimer2.release(CommonGameController2.TYPE_RECONNECT_TIMEOUT_2);
	GameTimer2.release(CommonGameController2.TYPE_RELOGIN_FOR_RECONNECT);
end

-- 游戏流程发送错误，请求同步server状态
CommonGameController2.onSysGameInfo = function(self, seat, uid, info, isFast)
	Log.a("CommonGameController2.onSysGameInfo");
	if self.m_mainState == GameMechineConfig.STATUS_PLAYING then
		self:_onlineReconnectRoom_1();
		return;
	end
	self:showToast(kTextReturnHall);
	self:onForceExitRoom();
end

CommonGameController2.onGameLoginSate = function(self, seat, uid, info, isFast)
	if uid == UserBaseInfoIsolater.getInstance():getUserId() then 
		LoadingView.getInstance():hidden();

		self:releaseRoomTimer();
	end
	self:onRefreshPrivateRoom();
end

CommonGameController2.onJiFenStart = function(self,seat,uid,info,isFast)
	self.m_isDuringJiFenGame = true;
end 

CommonGameController2.onJiFenFinished = function(self,seat,uid,info,isFast)
	self.m_isDuringJiFenGame = nil;
end

CommonGameController2.onKickOutSuccess = function(self,seat,uid,info,isFast)
	local mainState = MechineManage.getInstance():getMainState(UserBaseInfoIsolater.getInstance():getUserId());
	if mainState == GameMechineConfig.STATUS_PLAYING then
		return false;
	end
	self:requestExitRoom();
end

CommonGameController2.requestExitJiFenRoom = function(self)
	if self.m_isDuringJiFenGame then 	
		if self.m_mainState == GameMechineConfig.STATUS_PLAYING then
			self:showToast("牌局还未结束，请打完再走！");
			return;
		end		
		local params = {
	    	title = "提示";
	    	text = "牌局尚未结束，确认此刻退出牌局？";
	    	textColor = {143,92,31};
	    	textSize = 30;
	    	textAlign = kAlignCenter;
	    	okBtnText = "确认退出";
	    	okObj = self;
	    	okFunc = self.requestLogoutRoom;
	    	doNeedCloseBtn = true;
		};
	    MessageBox.showWithParams(params);
	else 
		self:requestExitRoom();
	end
end

CommonGameController2.checkIsExitRoom = function ( self )
	Log.d("===>CommonGameController2.checkIsExitRoom");
	if GameInfoIsolater.getInstance():isInMatchRoom() then
		Log.d("===>CommonGameController2.checkIsExitRoom match ==> ingore");
		return;
	end

	if not self.m_isIgnored then
		self.m_isIgnored = true; 
		local curGameType = GameInfoIsolater.getInstance():getCurGameType();
		local privateRoomReconnectType = PrivateRoomIsolater.getInstance():getPrivateRoomReconnectType();
		local normalRenoonectType = GameInfoIsolater.getInstance():getNormalRoomReconnectType();

		if curGameType == privateRoomReconnectType or curGameType == normalRenoonectType then --从大厅重连回房间时，第一次忽略检测升级破产
			Log.d("===>CommonGameController2.checkIsExitRoom reconnect ==> ingore");
			return;
		end 
	end 

	local mainState = MechineManage.getInstance():getMainState(UserBaseInfoIsolater.getInstance():getUserId());
	if mainState == GameMechineConfig.STATUS_PLAYING then --playing过程中点击充值,返回房间时忽略检测升级破产
		Log.d("===>CommonGameController2.checkIsExitRoom playing status ==> ingore");
		return;
	end

	if RoomPropertyData.getInstance():isMineBankrupt() or RoomLogic.getInstance():checkIsLevelDown() then 
		self:requestExitRoom();
	end
end

CommonGameController2.onRefreshPrivateRoom = function ( self )
	self:updateView(CommonGameScene2.s_cmds.updatePrivateRoom);
end

--info = {
-- 	userId = xxx;--请求的被围观者的userId
-- 	gameId = xxx;--从围观返回时需跳到的场景id,
-- 	viewName = xx; --从围观返回后需跳到的指定的页面
-- 	viewParam = {};--绘制指定页面需要的参数
-- };
CommonGameController2.onRequestEnterOnlooker = function(self,seat,uid,info,isFast)
	if not info.userId then 
		return;
	end 

	require("statesConfig");
	local lastStates = Copy(States);
	local lastStatesMap = Copy(StatesMap);

	States.Onlooker = 30000000;
	StatesMap[States.Onlooker] = {"games/common2/onlooker/room/onlookerState","OnlookerState"};

	local data = self.m_state:getCurShowStateConfig();
	data = table.verify(data);
	data.gameId = GameInfoIsolater.getInstance():getCurGameId();
	data.isInMatchRoom = GameInfoIsolater.getInstance():isInMatchRoom();
	data.jumpStateId = info.gameId;
	data.viewJumpParam = {
		viewName = info.viewName;
		viewParam = table.verify(info.viewParam);
	};
	data.enterOnlookerExtendParam = self:getEnterOnlookerExtendParam();

	self.m_state:changeState(States.Onlooker,nil,data,info.userId,lastStates,lastStatesMap);
end 

CommonGameController2.getViewJumpParams = function(self)
    local _,info = self.m_state:getBundleData();
    info = table.verify(info);

    local viewJumpParam = table.verify(info.viewJumpParam);
    local viewName = viewJumpParam.viewName;
    local viewParam = table.verify(viewJumpParam.viewParam);
    return viewName,viewParam;
end

--游戏自己提供，请求进入围观模式的扩展字段，json字符串
CommonGameController2.getEnterOnlookerExtendParam = function(self)
	return "";
end
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

CommonGameController2.initGameInfo = function (self)
	self:updateView(CommonGameScene2.s_cmds.updatePrivateRoom);
end

----------------------------- 监听中间层接口返回 ----------------------------------------
CommonGameController2.onReciveRadioMsg = function(self,info)
	self:onCommonLogicEvent("onReciveRadioMsg",info);
end

CommonGameController2.onSendRadioCallBack = function(self,isSuccess,info)
	self:onCommonLogicEvent("onSendRadioCallBack",isSuccess,info);
end

CommonGameController2.refreshUserProperty = function(self, propertyType, curNum, lastNum)
	self:onCommonLogicEvent("refreshUserProperty", propertyType, curNum, lastNum);
end

CommonGameController2.refreshProperty = function(self, tag, curNum, lastNum)
	self:onCommonLogicEvent("refreshProperty", tag, curNum, lastNum);
end

CommonGameController2.onBroadcastRoomBoxProgress = function(self, msgInfo)
	self:onCommonLogicEvent("onBroadcastRoomBoxProgress",msgInfo);
end

CommonGameController2.onSocketUpdateNetIcon = function(self, data)
	self:onCommonLogicEvent("onSocketUpdateNetIcon",data);
end

CommonGameController2.onServerBroadPhpUseProps = function (self, data)
	self:onCommonLogicEvent("onServerBroadPhpUseProps",data);
end

CommonGameController2.onServerBroadVipKick = function(self, data)
	self:onCommonLogicEvent("onServerBroadVipKick",data);
end

CommonGameController2.onBroadcastSilverInning = function ( self, info )
	self:onCommonLogicEvent("onBroadcastSilverInning",info);
end

CommonGameController2.refreshUserIdentity = function(self, curIdentity, lastIdentity)
	self:onCommonLogicEvent("refreshUserIdentity",curIdentity, lastIdentity);
end

CommonGameController2.onGetGamePlayInfoCallBack = function(self,isSuccess,gameId, gameRecordInfo)
	self:onCommonLogicEvent("onGetGamePlayInfoCallBack",isSuccess,gameId, gameRecordInfo);
end

CommonGameController2.onGetWeiChatCallback = function(self, isSuccess, param, shareChannel)
	self:onCommonLogicEvent("onGetWeiChatCallback",isSuccess, param, shareChannel);
end

CommonGameController2.onDownloadShareImageCallBack = function(self, isSuccess, downloadShareImageParams, filePath, fileName)
	self:onCommonLogicEvent("onDownloadShareImageCallBack",isSuccess, downloadShareImageParams, filePath, fileName);
end

CommonGameController2.onSaveImageToPhotoAlbumCallBack = function(self, isSuccess, imagePath, imageName, customParam)
	Log.v("CommonGameController2.onSaveImageToPhotoAlbumCallBack","isSuccess = ",isSuccess, "imagePath = ", imagePath, "imageName = ", imageName);
	self:onCommonLogicEvent("onSaveImageToPhotoAlbumCallBack",isSuccess, imagePath, imageName, customParam);
end

-- 房间level发生变化
CommonGameController2.onGameLevelUpdate = function(self, layerlName)
	self:updateView(CommonGameScene2.s_cmds.gameLevelUpdate,layerlName);
end

CommonGameController2.onCreateQRCallBack = function(self, isSuccess, qrType, fileName)
	self:onCommonLogicEvent("onCreateQRCallBack",isSuccess, qrType, fileName);
end

CommonGameController2.onUpdateSafeBoxCallBack = function(self,isSuccess, data)
	self:onCommonLogicEvent("onUpdateSafeBoxCallBack",isSuccess, data);
end

CommonGameController2.onUpdateBatteryLevel = function (self, status, json_data)
	self:onCommonLogicEvent("onUpdateBatteryLevel",status, json_data);
end

CommonGameController2.onReceivePrivateRoomInfo = function(self, data)
	self:onCommonLogicEvent("onReceivePrivateRoomInfo", data);
end

CommonGameController2.onSearchPrivateRoom = function(self, data)
	self:onCommonLogicEvent("onSearchPrivateRoom", data);
end
CommonGameController2.onRequestPrivatRoomConfigCallback = function(self, isSuccess, data)
	self:onCommonLogicEvent("onRequestPrivatRoomConfigCallback",isSuccess, data);
end

CommonGameController2.onGetPasswordByInfoCallback = function(self, isSuccess, data)
	self:onCommonLogicEvent("onGetPasswordByInfoCallback",isSuccess, data);
end

-- 资产变化
CommonGameController2.onServerPushOtherUserInfo = function(self,data)
	self:onCommonLogicEvent("onServerPushOtherUserInfo", data);
end

CommonGameController2.onCommonLogicEvent = function (self,param,...)
	if self.m_commonLoigc then
		self.m_commonLoigc:onEventFunc(param,...);
	end
end

CommonGameController2.onNativeEvent = function(self,param,...)
	if self.s_nativeEventFuncMap[param] then
		self.s_nativeEventFuncMap[param](self,...);
	end
end

CommonGameController2.s_nativeEventFuncMap = {
	["GetBatteryLevel"]			= CommonGameController2.onUpdateBatteryLevel;
};

------------------------------------------------------------------------------------------------------------------
----scene向controller发送消息的映射表
CommonGameController2.s_cmdConfig = {
	[CommonGameController2.s_cmds.pushOtherState] 			= "onPushOtherState";
	[CommonGameController2.s_cmds.requestLogoutRoom] 		= "requestLogoutRoom";
	[CommonGameController2.s_cmds.requestExitRoom] 			= "requestExitRoom";
	[CommonGameController2.s_cmds.clickDesktop]				= "onClickDesktop";
	[CommonGameController2.s_cmds.doubleClickDesktop]		= "onDoubleClickDesktop";
	[CommonGameController2.s_cmds.requestExitJiFenRoom]		= "requestExitJiFenRoom";
	[CommonGameController2.s_cmds.requestEnterRoom]			= "requestEnterRoom";
};

CommonGameController2.s_actionFuncMap = {
    [GameMechineConfig.ACTION_LOGINERRO]                    = "loginError";
    [GameMechineConfig.ACTION_ONLINE_RECONNECT_GAME]        = "_onlineReconnectRoom_1";
    [GameMechineConfig.ACTION_OFFLINE_RECONNECT_GAME]       = "_offlineReconnectRoom_1";
    [GameMechineConfig.ACTION_REQUEST_EXIT]                 = "requestExitRoom";
    [GameMechineConfig.ACTION_NS_FORCE_EXIT]                = "onForceExitRoom";
    [GameMechineConfig.ACTION_NS_CREATVIEW]                 = "onCreatView";
    [GameMechineConfig.ACTION_NS_STATUS_ERROR]              = "onSysGameInfo";
    [GameMechineConfig.ACTION_JIFEN_STARTGAME]              = "onJiFenStart";
    [GameMechineConfig.ACTION_JIFEN_FINISHED]               = "onJiFenFinished";
    [GameMechineConfig.ACTION_NS_KICKOUT_SUCCESS]           = "onKickOutSuccess";
    [GameMechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM]		= "onRefreshPrivateRoom";
    [GameMechineConfig.ACTION_REQUEST_ENTER_ONLOOKER]		= "onRequestEnterOnlooker";
    [GameMechineConfig.ACTION_REQUEST_LOGIN_FALSE_ROOM]		= "requestLogoutRoom";
};

CommonGameController2.s_stateFuncMap = {
    [GameMechineConfig.STATUS_INIT]                         = "initGameInfo";
    [GameMechineConfig.STATUS_LOGIN]                        = "onGameLoginSate";
    [GameMechineConfig.STATUS_LOGOUT]                       = "onLogOutSuccess";
    [GameMechineConfig.STATUS_LOGIN_ERROR]                  = "loginError";
};