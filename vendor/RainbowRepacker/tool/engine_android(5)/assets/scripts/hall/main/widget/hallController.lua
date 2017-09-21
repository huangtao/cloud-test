require("libs/bit");
require("util/ImageCache");
require("util/ImageCacheBatch");
require("util/timeOutTimer");

require("common/httpModule");
require("isolater/common/commonController");
require("isolater/interface/gameConstantIsolater");
require("common/loadingView");
require("common/messageBox");
require("common/syncNativeEvent");
require("common/IBaseDialog");

require("hall/gameData/appData");
require("hall/gameData/pay/goodsListInterface");
require("hall/gameData/pay/payLogic");
require("hall/login/data/loginDataInterface");
require("hall/main/data/hallConstants");
require("hall/setting/settingScene");
require("hall/bankrupt/data/bankruptInterface");
require("isolater/interface/bankruptIsolater");
require("isolater/interface/matchIsolater");
require("hall/announcement/data/announceDataInterface");
require("hall/message/data/messageDataInterface");
require("hall/main/data/hallUpdateConfig");
require("hall/main/data/hallDataInterface");
require("hall/activity/data/activityDataInterface");
require("hall/task/data/taskRewardDataInterface");
require("hall/update/updateLoadingDialog");
require("hall/update/updateHandleMgr");

require("hall/gameData/txtMgr");
require("hall/login/logic/loginLogic");
require("hall/login/logic/registerLogic");
require("hall/recharge/data/rechargeDataInterface");

require("hall/userInfo/data/userLevelConfigInterface");
require("hall/prop/propManager");

require("hall/agency/data/agencyDataInterface");
require("hall/login/data/thirdPartyLoginManager");
require("ubReport/dReport");

require("hall/floatBall/data/floatBallDataInterface");
require("hall/holidaysBg/data/holidaysBgDataInterface")
require("hall/login/data/bindingGuidelinesDataInterface")
require("hall/gameData/QRUtil/QRDataInterface")
require("hall/matchHall/gameMatchHall/data/matchHallDataInterface")

local GameRoomLevelConfig = require("hall/main/data/gameRoomLevelConfig")
local BaseLoginDialog = require("hall/login/widget/baseLoginDialog");

HallController = class(CommonController);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

HallController.s_cmds = 
{	
	onPushToOtherState = getIndex();
    onAddToScene = getIndex();
	onReLogin = getIndex();
	onToDayTask = getIndex();
	onToAgent = getIndex();
	refreshUnReadMessageNum = getIndex();
    isNetWorkConnect = getIndex();
}

HallController.s_eventGoToGameDirect = EventDispatcher.getInstance():getUserEvent();--直接进入游戏
HallController.s_eventRequestGameRoomList = EventDispatcher.getInstance():getUserEvent();--请求房间列表
HallController.s_matchListDispatch = EventDispatcher.getInstance():getUserEvent();

HallController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
	self.m_isNetWorkWell = true;

	self:loadSetting();

	EventDispatcher.getInstance():register(HallController.s_eventGoToGameDirect,self,self.onRequestDirectInToGame); --直接进入游戏
	EventDispatcher.getInstance():register(HallController.s_eventRequestGameRoomList,self,self.onRequestGameRoomList); --请求房间列表
    EventDispatcher.getInstance():register(HallController.s_matchListDispatch, self, self.enterGameMatchHall);

    CommunityDataInterface.getInstance():setObserver(self);
	MessageDataInterface.getInstance():setObserver(self);
	TaskRewardDataInterface.getInstance():setObserver(self);
	HallDataInterface.getInstance():setObserver(self);
	kGameManager:setObserver(self);
	LoginLogic.getInstance():setObserver(self);
	self:initQRInterface()
end

HallController.resume = function(self)	
	CommonController.resume(self);
	require("hall/floatBall/data/floatBallDataInterface");
	FloatBallDataInterface:getInstance():setSceneName("hall");

	NativeEvent.getInstance():closeSecrecy();
  	NativeEvent.getInstance():DelView();
  	NativeEvent.getInstance():CloseStartScreen();
	NativeEvent.getInstance():HideLoadingDialog();
	NativeEvent.getInstance():HideLoadingScene();
	Toast.setDefaultImage("hall/common/loading_bg.png");

	AnnounceDataInterface.getInstance():setObserver(self);
  	UpdateHandleMgr.getInstance():setObserver(self);
	TaskRewardDataInterface.getInstance():setObserver(self);
  	kLoginDataInterface:setObserver(self);
  	kUserInfoData:setObserver(self);
  	EventDispatcher.getInstance():register(CommonJumpLogic.s_commonJumpEvent, self, self.checkCommonJumpParams);
    self:initQRInterface()
    MatchHallDataInterface.getInstance():initSocket()

	self:checkNetWork();

	self:checkIsGameRoomLevelViewShowing(); --先判断上次是否在游戏房间列表界面
	self:log("resume", "isLoginSuccess = ", kLoginDataInterface:getIsLoginSuccess() );
	self:checkLoginStatus();

	if kAppData:isFirstOpen() then
		kAppData:setFirstOpenTime(os.time())
	end

	if  not kAppData:isFirstOpen() and kLoginDataInterface:getIsLoginSuccess() then
		
		local isPushToOtherState = self:checkCommonJumpParams();
		if not isPushToOtherState then
			self:checkDegrade();
			self:checkReadyQuickMatingFailedInfo();
			self:checkBankrupt(true);--检查破产
		end

		self:requestHallGameNums();
		MatchHallDataInterface.getInstance():checkRefreshMatchList();
		TaskRewardDataInterface.getInstance():getDayTaskList();

		self:updateView(HallScene.s_cmds.updateUserInfo);
	end

	kAppData:setCurGameType(nil);
	kAppData:setIsGameToCharge(false);
	kAppData:setIsFirstOpen(false);
	CommonJumpLogic.getInstance():resetJumpData();
end

HallController.pause = function(self)
	CommonController.pause(self);
	UpdateHandleMgr.getInstance():clearObserver(self);
	kLoginDataInterface:clearObserver(self);
	kUserInfoData:clearObserver(self);
	AnnounceDataInterface.getInstance():clearObserver(self);
	
	LoadingView.getInstance():hidden();
	NativeEvent.getInstance():HideLoadingDialog();

	EventDispatcher.getInstance():unregister(CommonJumpLogic.s_commonJumpEvent, self, self.checkCommonJumpParams);
	self:deleteQRInterface()
end

HallController.dtor = function(self)
	LoginLogic.getInstance():clearObserver(self);
	self:stopLoadingAnim();

	EventDispatcher.getInstance():unregister(HallController.s_eventGoToGameDirect,self,self.onRequestDirectInToGame); --直接进入游戏
	EventDispatcher.getInstance():unregister(HallController.s_eventRequestGameRoomList,self,self.onRequestGameRoomList); --请求房间列表
    EventDispatcher.getInstance():unregister(HallController.s_matchListDispatch, self, self.enterGameMatchHall);
    CommunityDataInterface.getInstance():clearObserver(self);
	MessageDataInterface.getInstance():clearObserver(self);
	TaskRewardDataInterface.getInstance():clearObserver(self);
	HallDataInterface.getInstance():clearObserver(self);
	kLoginDataInterface:clearObserver(self);
	self:deleteQRInterface()
end

HallController.onResume = function(self)
	self:log("onResume");
	CommonController.onResume(self);
	self:checkLoginStatus();
end

HallController.initQRInterface = function(self)
	self.m_QRDataInterface = self.m_QRDataInterface or new(QRDataInterface)
	self.m_QRDataInterface:setObserver(self)
end

HallController.deleteQRInterface = function(self)
	if self.m_QRDataInterface then
		self.m_QRDataInterface:clearObserver(self)
		delete(self.m_QRDataInterface)
		self.m_QRDataInterface = nil
	end
end

HallController.checkLoginStatus = function(self)
	self:log("checkLoginStatus");
	if not kLoginDataInterface:getIsLoginSuccess() then
		if OnlineSocketManager.getInstance():isSocketOpen() then
			if kAppData:isFirstOpen() then
				self:onSocketFirstConnected(true);
			else
				self:requestAutoLogin(true);
			end
		elseif kAppData:isFirstOpen() then
			self:playLoadingAnim();
		else
			self:onReLogin();
		end
	end
end

HallController.checkIsGameRoomLevelViewShowing = function(self)
	local cmd, stateId, params = CommonJumpLogic.getInstance():getJumpParams();

	local isGameRoomLevelViewShowing = HallDataInterface.getInstance():isGameRoomLevelViewShowing();
	self:updateView(HallScene.s_cmds.showGameListView);
	if isGameRoomLevelViewShowing and not (cmd==CommonJumpCmds.GOTO_GAME_ROOM_LIST) and not kBankruptDataInterface:isMineBankrupt() then
		local gameId = kGameManager:getCurGameId();
		if gameId and gameId > 0 then
			self:__showGameRoomListWithGameId(gameId);
		end
	end
end

HallController.checkCommonJumpParams = function(self)
	local cmd, stateId, params = CommonJumpLogic.getInstance():getJumpParams();
	CommonJumpLogic.getInstance():resetJumpData();
	
	local ret = true

	if stateId then
		self.m_state:pushState(stateId, nil, nil, unpack(params) );
	elseif cmd == CommonJumpCmds.GOTO_GAME then
		local gameConfig = kGameManager:getGameConfigById(params.id);
		self:onRequestGameRoomList(gameConfig, {levelId = params.levelId} );
	elseif cmd == CommonJumpCmds.GOTO_TASK then
		self:onToDayTask(true);
	elseif cmd == CommonJumpCmds.GOTO_GAME_ROOM_LIST then
		params.id = params.id or kGameManager:getCurGameId();
		self:onRequestGameRoomList(params);
	elseif cmd == CommonJumpCmds.GOTO_MATCH_ROOM then
		self:enterGameMatchHall();
	elseif cmd == CommonJumpCmds.GOTO_PRIVATE_ROOM then
		self.m_state:pushState(States.PrivateRoom,nil,true);
	elseif cmd == CommonJumpCmds.SEND_DOWNLOAD then
		UpdateHandleMgr.getInstance():startCheckUpdate(true);
    elseif cmd == CommonJumpCmds.GOTO_REGISTER_ACCOUNT then
        self:updateView(HallScene.s_cmds.showRegisterAccountDialog);
	else
		ret = false;
	end

	return ret;
end


--重写返回键事件
--@override
HallController.onBackPressed = function(self)
	CommonController.onBackPressed(self);
	if MessageBox.isShowing() then
		MessageBox.hide();
		return;
	end

	if BaseLoginDialog.isDialogShowing() and not kLoginDataInterface:isForbidLogin()  then
		--如果为强制登录，则登录弹框不能关闭
		
		BaseLoginDialog.hideTopDialog();
		return;
	end

	if IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		return;
	end

	if HallDataInterface.getInstance():isGameRoomLevelViewShowing() then
		self:updateView(HallScene.s_cmds.onRoomLevelViewBackToHall); 
		return;
	end

	--关掉属于这个场景的层
	require("isolater/widget/layerManagerIsolater");
	local _layerName = {'goldBar','redenvelope_config',"redenvelope_record"};
	for i = 1 ,table.getn(_layerName) do
		if LayerManagerIsolater.getInstance():hide(_layerName[i]) then
			return;
		end
	end
    
	--退出
	local onExit = function()
		UpdateData.getInstance():save();

		if SyncNativeEvent.getInstance():syncIsThirdPartySupportLogout() then
			ThirdPartyLoginManager.getInstance():requestLogout();
		else
			sys_exit();
		end
	end

	local onContinue = function()
	end

	local onClose = function()
	end

	local exitGameDialog = nil;
	if HallDataInterface.getInstance():isSupportSilver() then
		UBReport.getInstance():report(UBConfig.PopUpExitGameDialog);
		local ExitFreeGameDialog = require("hall/main/widget/exitFreeGameDialog");
		exitGameDialog = new(ExitFreeGameDialog, "ExitFreeGameDialog", 99, self, onExit, onContinue, onClose);
	else
		local ExitGameDialog = require("hall/main/widget/exitGameDialog");
		exitGameDialog = new(ExitGameDialog,"ExitGameDialog",99,self,onExit,onContinue,onClose);
	end
	self:updateView(HallScene.s_cmds.onPushBaseDialog, exitGameDialog);
	return true;
end

--@brief 加载设置
HallController.loadSetting = function(self)
	kSettingDataInterface:getSettingInfo();
end 

-------------------------- login --------------------------------
--@brief server 通知重新登录
HallController.onServerRequestReLogin = function(self)
	self:log("onServerRequestReLogin");
	self:requestAutoLogin();
end

--@brief 请求登录
HallController.requestAutoLogin = function(self, autoRelogin)
	self:log("requestAutoLogin");
	NativeEvent.getInstance():closeSecrecy();
  	NativeEvent.getInstance():DelView();

  	if autoRelogin then
  		self:onReLogin();
  	else
		self:onRequestAutoLogin();
	end
end 

HallController.onRequestAutoLogin = function(self)
	self:log("onRequestAutoLogin");

	self:checkNetWork();
	MessageBox.hide();
	if kLoginDataInterface:getLoginState() == LoginConstants.eLoginState.None
       or kLoginDataInterface:getLoginState() == LoginConstants.eLoginState.LoginFailed  then

		self.m_hasHandleErrLoginState = false;
       	if OnlineSocketManager.getInstance():isSocketOpen() then
			self:playLoadingAnim();
			self:log("onRequestAutoLogin", "begin auto login");
			LoginLogic.getInstance():requestAutoLogin();
		else
			self:log("onRequestAutoLogin", "begin reopen socket");
			self:playLoadingAnim();
			OnlineSocketManager.getInstance():reopenSocket();
		end

	elseif kLoginDataInterface:getIsLoging() then
		self:log("onRequestAutoLogin", "is login requesting now");

	elseif kLoginDataInterface:getIsLoginSuccess() then
		self:log("onRequestAutoLogin", "getIsLoginSuccess");

	elseif self:__handleErrLoginState() then
		self:log("onRequestAutoLogin", "__handleErrLoginState");

	else
		self:log("onRequestAutoLogin", "curLoginState = ", kLoginDataInterface:getLoginState() );
		self:onLoginTimeout();
	end
end

--delegate
HallController.onLoginStateChanged = function(self, loginState, lastLoginState)
	self:log("onLoginStateChanged", "loginState = ", loginState, " lastLoginState = ", lastLoginState);
	
	if not self.m_hasHandleErrLoginState then
		self.m_hasHandleErrLoginState = self:__handleErrLoginState();
	end
end

--处理错误的登录状态
HallController.__handleErrLoginState = function(self)
	local isDone = true;

	if kLoginDataInterface:getIsMultiLogin() then
		self:log("__handleErrLoginState", "getIsMultiLogin");
		self:updateView(HallScene.s_cmds.loginErr, "异地登录");
		MessageBox.show("安全提示", GameString.get("loginMultipleLogin"), GameString.get("messageBoxOkBtnName"), nil, false);

	elseif kLoginDataInterface:getIsPhpKickout() then
		self:log("__handleErrLoginState", "getIsPhpKickout");
		self:updateView(HallScene.s_cmds.loginErr);
	elseif kLoginDataInterface:getIsPhpSessionTimeOut() then
		self:log("__handleErrLoginState", "getIsPhpSessionTimeOut");
		self:updateView(HallScene.s_cmds.loginErr);
		MessageBox.show("会话超时", GameString.get("phpError_sessionTimeout"), "重新登录", nil, true, self, self.onReLogin);

	elseif kLoginDataInterface:getIsStopServer() then
		self:log("__handleErrLoginState", "getIsStopServer");
		self:updateView(HallScene.s_cmds.loginErr);

		local serverStopAnnounceInfo = AnnounceDataInterface.getInstance():getServerStopAnnounceInfo();
		if not table.isEmpty(serverStopAnnounceInfo) then
			self:updateView(HallScene.s_cmds.showAnnouncementStopServer, serverStopAnnounceInfo);
		end			

	elseif kLoginDataInterface:getIsOffline() then
		self:log("__handleErrLoginState", "getIsOffline");
		self:updateView(HallScene.s_cmds.loginErr);

		if LoginDataInterface:getNetWorkAvalible() then
			--请求防攻击配置
			ServerConfig.getInstance():requestDefendAttackConfig();
			if not AnnounceDataInterface.getInstance():hasPhpResponsed() then
				--请求停服公告
	    		AnnounceDataInterface.getInstance():requestStopServer(AnnounceDataInterface.eStatusType.PRORUPTION);
	    	else
	    		self:__checkNetworkState();
	    	end
    	else
			self:__checkNetworkState();
		end
	else
		isDone = false;
	end

	return isDone;
end

HallController.__checkNetworkState = function(self)
    if kLoginDataInterface:getIsStopServer() then
        return;
    end

    if kLoginDataInterface:getIsLoginSuccess() or kLoginDataInterface:getIsLoging() then
    	--登录成功或登录中，则返回
    	return;
    end

	if kLoginDataInterface:getNetWorkAvalible() then
		MessageBox.show(GameString.get("loginNetWordErrTitle") , GameString.get("loginNetWordErrContent"), GameString.get("loginNetworkConnectGame"), nil, true, self, self.onReLogin);
	else
		MessageBox.show(GameString.get("loginNetworkCloseTitle") , GameString.get("loginNetworkCloseContent"), GameString.get("loginNetworkSettingNetwork"), nil, true, self, self.onNetWorkSetting, nil, nil, nil, nil, nil, nil, nil, kAlignLeft);
	end
end

--@brief 重新登录
HallController.onReLogin = function(self)
	self:log("onReLogin");

	if not kLoginDataInterface:getIsLoging() and not kLoginDataInterface:getIsLoginSuccess() then
		self:log("onReLogin", "requestAutoLogin");

		kLoginDataInterface:setLoginState(LoginConstants.eLoginState.None);
		self:onRequestAutoLogin();
	else
		if kLoginDataInterface:getIsLoginSuccess() then
			self:log("onReLogin", "LoginSuccess");
			self:updateView(HallScene.s_cmds.loginSuccess);
		end
		if kLoginDataInterface:getIsLoging() then
			self:log("onReLogin", "playLoading");
           self:playLoadingAnim();
		end
	end
end

--@brief 设置网络
HallController.onNetWorkSetting = function(self)
	self:log("onNetWorkSetting")
	kLoginDataInterface:openNetSettings();
end

--@brief 登录成功回调
HallController.onLoginSuccess = function(self,userinfo,gameinfo,accountinfo)
	self:log("onLoginSuccess");
	self:stopLoadingAnim();
	MessageBox.hide();
	self.m_hasHandleErrLoginState = false;

	if self.m_socketReconnected and not kLoginDataInterface:getSwitchFlag() then
		Toast.getInstance():showText(GameString.get("loginNetworkReconnetSuccesss"),50,30,kAlginLeft,"",26,255,255,255);
		self.m_socketReconnected = false;
	end
	UpdateHandleMgr.getInstance():checkLocalUpdate();
	self:requestHallGameNums();--请求大厅的游戏人数
	self:updateView(HallScene.s_cmds.loginSuccess);
	self:checkBankrupt(true);--检查破产
	
	self:checkPasswordOnLogin();
end

HallController.__showDisableAccountDialog = function (self, cid)
    local DisableAccountDialog = require("hall/login/widget/disableAccountDialog");
	DisableAccountDialog.show({cid = cid});
end

--@brief 登录失败回调
HallController.onLoginFailed = function(self, errorInfo, byPassWordAccount)
	self:log("onLoginFailed", "errorInfo = ", errorInfo, " byPassWordAccount = ", byPassWordAccount);
	local OldAccountLoginDialog = require("hall/login/widget/oldAccountLoginDialog");
	self:stopLoadingAnim();
	self.m_hasHandleErrLoginState = false;
    
	local errorType = errorInfo and errorInfo.errorType;
    local extraInfo	= errorInfo and errorInfo.extraInfo;	
	if errorType == LoginConstants.eLoginFailErr.ERR_FOBID_GUEST_LOGIN then
		self:log("onLoginFailed", "LoginConstants.eLoginFailErr.ERR_FOBID_GUEST_LOGIN");
		self:updateView(HallScene.s_cmds.loginErr, "");

		kLoginDataInterface:setLoginState(LoginConstants.eLoginState.ForbidGuestLogin);
		kLoginDataInterface:setShieldGuestLogin(true);
		kLoginDataInterface:setForbidLogin(true);
		OldAccountLoginDialog.show();

	elseif errorType == LoginConstants.eLoginFailErr.ERR_STOP_SERVER then
        self:updateView(HallScene.s_cmds.loginErr, "");
    elseif errorType == LoginConstants.eLoginFailErr.ERR_DISABLE_ACCOUNT then
        self:updateView(HallScene.s_cmds.loginErr, "");
        self:__showDisableAccountDialog(extraInfo.cid or 0);
    elseif errorType == LoginConstants.eLoginFailErr.ERR_FORBID_VIRTUAL_MACHINE_LOGIN then
    	self:updateView(HallScene.s_cmds.loginErr, "模拟器禁止登录~");

	elseif BaseLoginDialog.isDialogShowing() then
		self:log("onLoginFailed", "dialog is showing");
		self:updateView(HallScene.s_cmds.loginErr, errorInfo and errorInfo.errorTips or "");

	elseif byPassWordAccount then
		self:log("onLoginFailed", " byPassWordAccount = ", byPassWordAccount);
		self:updateView(HallScene.s_cmds.loginErr);
		OldAccountLoginDialog.show();

	else
		self:log("onLoginFailed", "LoginErr");
		self:updateView(HallScene.s_cmds.loginErr,errorInfo and errorInfo.errorTips or "");

		self:__checkNetworkState();
	end
end

--@brief 登录超时回调
HallController.onLoginTimeout = function(self)
	self:log("onLoginTimeout");
	self.m_hasHandleErrLoginState = false;
	self:stopLoadingAnim();
	self:__checkNetworkState();
    self:updateView(HallScene.s_cmds.loginErr, "登录超时");
end

--@brief 开始进行登录
HallController.playLoadingAnim = function(self)
	self:stopLoadingAnim();
	self.m_loadingAnim = AnimFactory.createAnimInt(kAnimNormal,0,1,1000*30,-1);
	self.m_loadingAnim:setDebugName("HallController|self.m_loadingAnim");
	self.m_loadingAnim:setEvent(self, self.onLoginTimeout);

	self:updateView(HallScene.s_cmds.playLoading);
end

HallController.stopLoadingAnim = function(self)
	delete(self.m_loadingAnim);
	self.m_loadingAnim = nil;
end

-------------------------------------socket-------------------------------
--socket第一次打开
HallController.onSocketFirstConnected = function(self, autoRelogin)
	self:log("onSocketFirstConnected");

	self:requestAutoLogin(autoRelogin);-- 登录
	
	kGameManager:requestGameList();
	HallDataInterface.getInstance():requestVersionFilterSwitch();
	AnnounceDataInterface.getInstance():getAnnounceData();
	IBaseDialog.startQueue();
end

HallController.onSocketReconnected = function(self)
	--这个时候代表socket打开成功，上次登录请求发送失败，此时重新发送
	self:log("onSocketReconnected begin reLogin");
	self.m_socketReconnected = true;
	self:requestAutoLogin();
end
-------------------------------------请求--------------------------

HallController.onGetCoreInitInfoCallBack = function(self, isSuccess)
	self:updateView(HallScene.s_cmds.onGetCoreInitInfo);
	self:updateView(HallScene.s_cmds.showBindingGuidelines)
end

-----------------------------各个区域点击功能-----------------------------
HallController.onPushToOtherState = function(self, state, isPopState, ...)
	if not self:isNetWorkConnect() and state ~= States.Setting then
		return;
	end

	self.m_state:pushState(state, nil, isPopState, ...);
end

HallController.onAddToScene = function(self,wndName, ...)
	if not self:isNetWorkConnect() then
		return;
	end

	require("isolater/widget/layerManagerIsolater");
    local layer = LayerManagerIsolater.getInstance():show(wndName,...);
    if layer then
    	self.m_view.m_root:addChild(layer);
    end
end

-------------------------------网络--------------------------------
HallController.checkNetWork = function(self)
	NativeEvent.getInstance():GetNetworkAvailability();
	NativeEvent.getInstance():GetNetworkActivity();
end

HallController.isNetWorkConnect = function(self)
	local ret = true;
	if not self.m_isNetWorkWell or (not kLoginDataInterface:getIsLoginSuccess()) then
		ret = false;

		self:__checkNetworkState();
	end
	return ret;
end

--检测是否有网络
HallController.onGetNetworkAvailabilityCallback = function(self,status,jsonTable)
	self:__onGetNetworkStatus(status, jsonTable, "isNetwork");
end

--活动网络是否有效
HallController.onGetNetworkActivityCallback = function(self,status,jsonTable)
	self:__onGetNetworkStatus(status, jsonTable, "isActiveNetwork");
end

HallController.__onGetNetworkStatus = function(self, status, jsonTable, key)
	self.m_isNetWorkWell = true;
	if status and jsonTable then
		local ret = GetNumFromJsonTable(jsonTable, key, 0);
		self.m_isNetWorkWell = (ret == 0) and true or false;
	end

	if not self.m_isNetWorkWell then
		self:updateView(HallScene.s_cmds.loginErr, GameString.get("netWorkError") );
		kLoginDataInterface:setLoginState(LoginConstants.eLoginState.Offline);
	end
end

--@brief 判断是否破产
HallController.checkBankrupt = function(self, isMustOpen)
	if not kLoginDataInterface:getIsLoginSuccess() then
		return;
	end 
    
	if kBankruptDataInterface:isMineBankrupt() and isMustOpen and not kBankruptDataInterface:isHaveDialog() then
		require("hall/bankrupt/bankruptDialog");
		local _bankruptDialog = new(BankruptDialog);
		self:updateView(HallScene.s_cmds.onPushBaseDialog, _bankruptDialog);
	end
end 

--@brief 降级后提示补助
HallController.checkDegrade = function(self)
	if not kLoginDataInterface:getIsLoginSuccess() then
		return;
	end 

	local degradeInfo = HallDataInterface.getInstance():getDegradeInfo();--  flat == -1 为降级，为1为升级
	HallDataInterface.getInstance():setDegradeInfo();
	if not kBankruptDataInterface:isMineBankrupt() and not table.isEmpty(degradeInfo) then 
		HallDataInterface.getInstance():setRoomUpLevelInfo({});

		local param = {
			gameid = kGameManager:getCurGameId();
			level = degradeInfo.tarLevelId;
			scene = PayConfig.eGoodsListId.Degrade,
			cm = degradeInfo.disMoney;
		};

        RechargeDataInterface.getInstance():setSceneType(UBPaySceneConfig.KGameDescendRecharege);
		self:onPushToOtherState(States.ShortCutRecharge, true, PayConfig.eGoodsListId.Degrade, param );
	else
	    HallDataInterface.getInstance():setRoomUpLevelInfo({});
	end		
end

HallController.checkReadyQuickMatingFailedInfo = function(self)
	local quickMatingInfo = GameInfoIsolater.getInstance():getReadyQuickMatingFailedInfo();
	if quickMatingInfo then
		local savedMoney = quickMatingInfo.savedMoney or 0;
	    local tips = "未能为你成功速配,请重新选择场次进行游戏";
	    if savedMoney > 0 then 
	        tips = string.format("%s\n%s",tips,"(有部分游戏币已安全存入保险箱)");
	    end

	    local params = {
	    	title = "速配未成功";
	    	text = tips;
	    	textColor = {143,92,31};
	    	textSize = 30;
	    	textAlign = kAlignCenter;
	    	okBtnText = "我知道了";
	    	doNeedCloseBtn = true;
	    	width = 812;
	    	height = 418;
		}
	    MessageBox.showWithParams(params);
	end

	GameInfoIsolater.getInstance():setReadyQuickMatingFailedInfo();
end

--@brief 获取公告回调
HallController.refreshAnnouncement = function(self,data)
	self:updateView(HallScene.s_cmds.showAnnouncementView, data);
end

--@brief delegate 停服公告回调
HallController.onStopServerCallBack = function (self, isSuccess, data, param)  
    if isSuccess and not table.isEmpty(data) then
    	MessageBox.hide();
    	Toast.getInstance():hidden();
        self:updateView(HallScene.s_cmds.showAnnouncementStopServer, data);
    else
        self:__checkNetworkState(param);
    end
end

--@brief 获取签到信息回调
HallController.onGetSigninInfosCallBack = function(self, isSuccess, todaySigninInfos, tomorrowSigninConfig, continueSigninInfo, rewardAdConfig, autoopen)
	if isSuccess and autoopen == 1 then
		self:onToDayTask();--第一次弹出签到
	end
end

HallController.onToDayTask = function(self, isClick)
	if not self:isNetWorkConnect() then
		return;
	end

	local isSignToday = TaskRewardDataInterface.getInstance():isSignToday();
 	local todaySigninInfos = TaskRewardDataInterface.getInstance():getTodaySigninInfos();
 	local isCanSignToday = not ( table.isEmpty(todaySigninInfos) or isSignToday );
	if not isClick and not isCanSignToday then
		return;
	end

 	local showType = isCanSignToday and TaskRewardDialog.TAB_DAYREWARD or TaskRewardDialog.TAB_TASK;
 	IBaseDialog.remove("TaskRewardDialog");
 	self:updateView(HallScene.s_cmds.onPushBaseDialog, new(TaskRewardDialog, showType) );
end

HallController.onCheckUpdateCallBack = function(self,isSuccess)
	Log.i("HallController.onCheckUpdateCallBack");
	if isSuccess then
		self:updateView(HallScene.s_cmds.showGameListView, true);
	end
end

HallController.onToAgent = function(self)
	self:requestEnterModule(GameType.AGENCY_LUA);
end

-----------------------------进入房间-----------------------------------
--@brief 获取游戏列表回调
HallController.onGetGameListCallBack = function(self, isSuccess, gamePageList)
	if isSuccess and not table.isEmpty(gamePageList) then
		UpdateHandleMgr.getInstance():startCheckUpdate(true);
		self:updateView(HallScene.s_cmds.showGameListView, true);
	end
end

--@brief 检查游戏状态
HallController.checkGameStatus = function(self , gameId)
	local msg = nil;
	self:checkNetWork();
	if not self.m_isNetWorkWell then
		msg = GameString.get("roomLoginNoneNetWork");

	elseif not kLoginDataInterface:getIsLoginSuccess() then
		MessageBox.show(GameString.get("loginNetWordErrTitle") , GameString.get("loginNetWordErrContent"), GameString.get("loginNetworkConnectGame"), nil, true, self, self.onReLogin);
		return false;
	elseif kLoginDataInterface:getIsLoginSuccess() and self.m_isNetWorkWell then
		return true;

	else
		msg = GameString.get("roomLoginbankrupt");
		self:updateView(HallScene.s_cmds.showNotice,msg);
		return false;
	end

	self:updateView(HallScene.s_cmds.showNotice,msg);
	return false;
end

--@brief检查当前银币或者金条数能否进入房间
HallController.__checkCurrentMoneyOrGoldEnterRoom = function (self, data)
    local isEnterRoom = false;
    local money = kUserInfoData:getMoney();
    local gold = kUserInfoData:getCrystal();
    for k,v in pairs(table.verify(data)) do
        for s, t in pairs(table.verify(v.tab_data)) do
           if v.base_chip_type == 0 then
               if money >= t.minMoney then
                    isEnterRoom = true;
                    break;
               end
           elseif v.base_chip_type == 1 then
               if gold >= t.minMoney then
                    isEnterRoom = true; 
                    break;
               end
           end
        end
        if isEnterRoom then
            break;
        end
    end    
    return isEnterRoom;
end

--@brief 点击游戏房间/快速开始进入房间
HallController.onRequestDirectInToGame = function(self, data, from, gameExtParam)
	if not self:isNetWorkConnect() or ToolKit.clickLimit() or table.isEmpty(data) or not data.id then
		return;
	end

	if table.isEmpty(data) or (not data.id) then
		return;
	end

	Log.v("HallController.onRequestDirectInToGame", "data = ", data, "gameExtParam = ", gameExtParam);
	self:requestGamePlayInfo(data.id);

	local gameStatus = self:checkGameStatus(data.id);
	if gameStatus then
		local status = HallUpdateConfig.getInstance():getGameStatus(data.id);
     	if (status == HallGameStatus.CanPlay or status == HallGameStatus.CanUpdate ) and data.id >0 then

     		local isBankrupt = self:__checkGameStatusForBankrupt(data.id, data.levelId);
     		if not isBankrupt then
                if number.valueOf(data.levelId) ==  0 then
                    local gameLevelList = kGameManager:getGameLevelListByGameId(data.id);
                    if table.isEmpty(gameLevelList) then
                        self.m_gameLevelListIsEmptyFlag = true;
                    else
                        self:__checkEnterRoom(gameLevelList.data, data, from, gameExtParam);
                    end
                else
                    self:__requestEnterGame(data.id, number.valueOf(data.levelId), from, gameExtParam);
                end
			end
		elseif status == HallGameStatus.CanInstall then
			self:__startDownLoadOrUpdateGame(data);
		end
	end 
end

--检查是否破产
HallController.__checkGameStatusForBankrupt = function(self, gameId, levelId)
	local __moneyType = GameManager.getInstance():getMoneyTypeByLevelId(gameId, levelId);
	if __moneyType == RechargeDataInterface.getInstance():getPropertySilverCoinID() and kBankruptDataInterface:isMineBankrupt() then
		self:checkBankrupt(true);
		return true;
	else
		return false;
	end
end

HallController.__checkEnterRoom = function (self, gameLevelList, data, from, gameExtParam)
    if self:__checkCurrentMoneyOrGoldEnterRoom(gameLevelList) then
        self:__requestEnterGame(data.id, number.valueOf(data.levelId), from, gameExtParam);
    else
        Toast.getInstance():showText("银币不足，无法开始牌局",50,30,kAlginLeft,"",26,255,255,255);
    end
end

--@brief 通过gameid level直接请求房间
HallController.__requestEnterGame = function(self, gameId, levelId, from, gameExtParam)
    Toast.getInstance():hidden();

	local status= HallUpdateConfig.getInstance():getGameStatus(gameId);
	if gameId and status == HallGameStatus.CanUpdate then --需要更新,更新后进入游戏
		self.m_cacheToGameData={cacheType=2,gameId=gameId,levelId=levelId,gameExtParam=gameExtParam};
		UpdateLoadingDialog.show(gameId);
		return ;
	end

	if not from then
		local msg = kAppData:isRoomAntiCheating(gameId, levelId) and kTextPreventCheat or GameString.get("start_game");
		NativeEvent.getInstance():ShowLoadingDialog(msg); --调用android loading框
	end
	kGameManager:getGameLevelListByGameId(gameId, 1);
	kGameManager:setCurGameId(gameId);
	kGameManager:setCurRoomLevelId(levelId);
	kGameManager:setGameExtParam(gameExtParam);
	GameInfoIsolater.getInstance():startGame(gameId,nil,nil);
end

--@brief 请求房间列表 从游戏列表->房间列表
HallController.onRequestGameRoomList = function(self, data, autoEnterLevelInfo)
	if not self:isNetWorkConnect() then
		return;
	end

	if data.game_pkg == "games/private_room" then
		self.m_state:pushState(States.PrivateRoom,nil,true);
		return;
	end
    
    if data.game_pkg == "games/match_room" then
		LoadingView.getInstance():showText(kTextMatchList);
		
		self:enterGameMatchHall();
		return;
	end

	if data.game_pkg == "games/more_games" then
		self.m_state:pushState(States.MoreGames,nil,true);
		return;
	end

	self:requestGamePlayInfo(data.id);
	local gameStatus=self:checkGameStatus(data.id);
	if gameStatus and data then  
		local status = HallUpdateConfig.getInstance():getGameStatus(data.id);
     	if (status == HallGameStatus.CanPlay) and data.id >0 then

			GameInfoIsolater.getInstance():setCurGameId(data.id);
			self:__showGameRoomListWithGameId(data.id, nil, autoEnterLevelInfo);

		elseif (status == HallGameStatus.CanUpdate) and data.id > 0 then
			self.m_cacheToGameData={cacheType=1, param=data};
			UpdateLoadingDialog.show(data.id);

		elseif status == HallGameStatus.CanInstall then
			self:__startDownLoadOrUpdateGame(data);
		end
	end 
end

--@brief 根据游戏id显示房间列表
HallController.__showGameRoomListWithGameId = function(self, gameId, whichTab, autoEnterLevelInfo)
	local levelList = kGameManager:getGameLevelListByGameId(gameId, 1);--返回快速场数据
	if table.isEmpty(levelList) then
		--记录下需要自动进入的场次信息
		self.m_autoEnterLevelInfo = autoEnterLevelInfo;			
		LoadingView.getInstance():showText("正在获取房间列表，请稍候...");
	else
		self:updateView(HallScene.s_cmds.showGameRoomLevelView, gameId, levelList,whichTab,autoEnterLevelInfo); 
	end	
end

--@brief 获取游戏列表回调
HallController.onGetGameLevelCallBack = function(self, isSuccess, gameId, gameLevelList)
	LoadingView.getInstance():hidden();
    if not table.isEmpty(gameLevelList) then
        if self.m_gameLevelListIsEmptyFlag then
		     self:__checkEnterRoom(gameLevelList.data, {id = gameId});    
        else
            self:updateView(HallScene.s_cmds.showGameRoomLevelView, gameId, gameLevelList, nil, self.m_autoEnterLevelInfo);
        end
	else
		Toast.getInstance():showText(kTextGetRoomListFail,50,30,kAlginLeft,"",26,255,255,255);
	end
	self.m_autoEnterLevelInfo = nil;
    self.m_gameLevelListIsEmptyFlag = false;
end

HallController.onRefreshUnReadMessageNumCallBack = function(self)
    self:updateView(HallScene.s_cmds.refreshUnReadMessageNum); 
end

--@brief 请求进入模块
HallController.requestEnterModule = function(self, moduleId)
	if not self:isNetWorkConnect() then
		return;
	end

	local status = HallUpdateConfig.getInstance():getGameStatus(moduleId);
 	if (status == HallGameStatus.CanPlay) then
		kGameManager:startEnterModule(moduleId, true);

	elseif (status == HallGameStatus.CanUpdate) then
		self.m_cacheToGameData={cacheType=3, param={moduleId=moduleId}};
		UpdateLoadingDialog.show(moduleId);

	elseif status == HallGameStatus.CanInstall then
		local data = kGameManager:getModuleConfigById(moduleId);
	    data.status = status;
		self:__startDownLoadOrUpdateGame(data);
	end
end

--@brief 更新游戏
HallController.__startDownLoadOrUpdateGame = function(self, data)
	 local isSDCardAvailable=NativeEvent.getInstance():isSDCardAvailable();
	 if isSDCardAvailable then
	 	data.status = HallUpdateConfig.getInstance():getGameStatus(data.id);
	 	UpdateHandleMgr.getInstance():startDownloadOrUpdateGame(data);
	 else
	 	Toast.getInstance():showText(GameString.get("sdcard_invaild_download"),50,30,kAlginLeft,"",26,255,255,255);
	 end
end

--@brief 下载游戏成功回调
HallController.downloadGameSuccessed = function(self, data)
	for k,v in pairs(kGameManager:getGameList()) do
		if v.id == data.id then
			self:onRequestGameRoomList(v);
			break;
		end
	end

	for k, v in pairs(kGameManager:getModuleList()) do
		if v.id == data.id then
			self:requestEnterModule(v.id);
			break;
		end
	end
end 

--@brief 更新游戏成功回调
HallController.updateGameSuccessed = function(self, gameId)
	if table.isEmpty(self.m_cacheToGameData) then
		return;
	end

	local data = self.m_cacheToGameData;
	self.m_cacheToGameData = nil;

	if data.cacheType == 1 then --在游戏列表时更新游戏
		self:onRequestGameRoomList( table.verify(data.param) );

	elseif data.cacheType == 2 then
		local gameId = data.gameId or 0;
		local levelId = data.levelId or 0;
		local gameExtParam = data.gameExtParam;

		self:__requestEnterGame(gameId, levelId, false, gameExtParam);

	elseif data.cacheType == 3 then
		self:requestEnterModule(data.moduleId);
	end
end 

--请求此用户在此游戏中的输赢数据
HallController.requestGamePlayInfo = function(self, gameId)
	kUserInfoData:getGameRecordData(gameId);
end

--@请求大厅游戏人数
HallController.requestHallGameNums = function(self)
	HallDataInterface.getInstance():requestHallGamePlayerNums();
end

--override
HallController.handleSockePhpDead = function(self)
 	kLoginDataInterface:setLoginState(LoginConstants.eLoginState.None); 
	self:requestAutoLogin();
end

--@brief 跳转至比赛场
HallController.enterGameMatchHall = function(self)
	self.m_state:pushState(States.GameMatchHall);
end

--@brief 使用道具事件
HallController.onServerBroadPhpUseProps = function(self,data)
    if not data or table.isEmpty(data) then 
		self:showToast("道具使用失败");
		return; 
	end
end

HallController.log = function(self,funcName,...)
	Log.record("HallController"," ",funcName," ",...);
end

HallController.checkPasswordOnLogin = function(self)
	PasswordDataInterface.getInstance():checkPasswordOnLogin();
end

HallController.s_nativeEventFuncMap = {
	["GetNetworkAvailability"] 		= HallController.onGetNetworkAvailabilityCallback;
	["GetNetworkActivity"] 			= HallController.onGetNetworkActivityCallback;
};

------------------------------------- 命令响应函数配置 ------------------------
HallController.s_cmdConfig = 
{
	[HallController.s_cmds.onPushToOtherState] = HallController.onPushToOtherState;
    [HallController.s_cmds.onAddToScene] = HallController.onAddToScene;
	[HallController.s_cmds.onReLogin] = HallController.onReLogin;
	[HallController.s_cmds.onToDayTask] = HallController.onToDayTask;
	[HallController.s_cmds.onToAgent] = HallController.onToAgent;
	[HallController.s_cmds.isNetWorkConnect] = HallController.isNetWorkConnect;
};
