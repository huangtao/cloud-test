require("gameData/dataInterfaceBase");
require("hall/main/data/hallBottomButtonConfig");
require("hall/groupGame/data/groupGameInterface");
require("hall/floatBall/data/floatBallDataInterface");
require("hall/rechargeCard/data/rechargeCardDataInterface");
require("netWork/ServerConfig");

--[[
	大厅数据接口层
]]

local isGameRoomLevelViewShowingFlag = false; --局部变量 防止cleaup时 此变量销毁

HallDataInterface = class(DataInterfaceBase);

HallDataInterface.s_maxCoreInfoTryCount = 5;

HallDataInterface.Delegate = {
	onGetHallBottomButtonListCallBack	= "onGetHallBottomButtonListCallBack";
	onGetHallGamePlayerNumsCallBack		= "onGetHallGamePlayerNumsCallBack";
	onGetCoreInitInfoCallBack			= "onGetCoreInitInfoCallBack";
	onWebViewShowingStatusChanged       = "onWebViewShowingStatusChanged";
}

HallDataInterface.getInstance = function()
	if not HallDataInterface.s_instance then
		HallDataInterface.s_instance = new(HallDataInterface);
	end

	return HallDataInterface.s_instance;
end

HallDataInterface.cleanup = function()
    local lastObserverMap = HallDataInterface.getInstance():getObserverMap();
	local isSupportSilver = HallDataInterface.getInstance():isSupportSilver();
    delete(HallDataInterface.s_instance);
    HallDataInterface.s_instance = nil;

    HallDataInterface.getInstance():setObserverMap(lastObserverMap);
	HallDataInterface.getInstance():setSupportSilverState(isSupportSilver);
end

HallDataInterface.ctor = function(self)
	self.m_hallBottomButtonConfig = new(HallBottomButtonConfig, self);

	local GuideData = require("hall/main/data/guideData");
	self.m_guideData = new(GuideData);
    self.m_hotline = RegionConfigDataInterface.getInstance():getDefaultHotline();
end

HallDataInterface.dtor = function(self)
	delete(self.m_hallBottomButtonConfig);
	self.m_hallBottomButtonConfig = nil;

	delete(self.m_guideData);
	self.m_guideData = nil;
    self.m_hotline = nil;
end

------------------------------请求coreInit信息---------------------------
--请求coreInit信息
HallDataInterface.requestGetCoreInitInfo = function(self)
	local data = {};
	data.w, data.h = System.getScreenWidth(), System.getScreenHeight();
	data.deviceno = kClientInfo:getDeviceId();
	data.networkstate = kClientInfo:getNetworkName();
	data.osversion = kClientInfo:getPhoneModel() .. "," .. kClientInfo:getOSVersion();
	data.macid = kClientInfo:getMachineId();
	data.guid = kClientInfo:getGuid();
    data.config_format = "json";
    data.api_ver = 2;

    OnlineSocketManager.getInstance():sendMsg(PHP_CORE_INIT, data);
end

--coreInit信息回调
HallDataInterface.onGetCoreInitInfoCallBack = function(self, isSuccess, info)
	if not isSuccess then
		self.m_coreInfoTryCount = number.valueOf(self.m_coreInfoTryCount, 0) + 1;
		if self.m_coreInfoTryCount <= HallDataInterface.s_maxCoreInfoTryCount then
			self:requestGetCoreInitInfo();
		end
		self:notify(HallDataInterface.Delegate.onGetCoreInitInfoCallBack, false);
		return;
	end

	self.m_coreInfoTryCount = 0;

	ActivityDataInterface.getInstance():setActivityUrl(info.activity_url);
	GroupGameInterface.getInstance():setGroupGameUrl(info.groupgame_url);
	BroadcastDataInterface.getInstance():setRadioMoney(info.broatcast_money);
	BroadcastDataInterface.getInstance():setSendHallBroadcastLimitMoney(info.broadcast_limit_money);            -- 在大厅发送广播最低银币限制
	BroadcastDataInterface.getInstance():setSendPrivateBroadcastLimitMoney(info.broadcast_zijian_limit_money);  -- 在私人房发送广播最低银币限制  
	kUserInfoData:setAgentCode(info.agentcode);
	kUserInfoData:setAgentPhone(info.agentPhone);
	kUserInfoData:setkefuGid(info.kefu_gid);
	kUserInfoData:setkefuSid(info.kefu_sid);
	FloatBallDataInterface.getInstance():setPhpSwitchStatus( number.valueOf(info.assistiveBallFlag) == 1);
	RechargeCardDataInterface.getInstance():setRechargeCardWebUrl(info.rechargecardurl);
	RechargeCardDataInterface.getInstance():setRechargeCardPayUrl(info.rechargepayurl);
	kGameManager:setTwoDimensionalCodeUrl(info.qrcode or "");
	ServerConfig.getInstance():setCdn(info.cdnSite, info.cdnSite_ver);

	ImageCache.getInstance():request(info.qrcode or "",self,self.onGetImageForTwoDimensionCode);

	
	--大厅新手引导开关
	local isGuided = self:isCurUserGuided();
	if not isGuided then
		if number.valueOf(info.beginnerGuide) ~= 1 then
			--新手引导开关是关状态,则将用户设置为已新手引导状态
			self:setCurUserGuided(true);
		end
	end
    --客服电话
    self:setHotline(info.servicePhone);
	--保险箱开关
	self:setSafeBoxSwitchState( number.valueOf(info.boxFlag,1)==1 and true or false );
	--首冲开关
	self:setFirstPaySwitchState( number.valueOf(info.firstpay_display,1)==1 and true or false );
	--个人信息一键注册开关
	self:setRegisterSwitchState( number.valueOf(info.registerFlag,1)==1 and true or false );
	--个人信息切换账号开关
	self:setAccountSwitchState( number.valueOf(info.accountFlag,1)==1 and true or false );
	--个人信息照相开关
	self:setTakePhotoSwitchState( number.valueOf(info.takephotoFlag,1)==1 and true or false);
	--日志开关
	self:setDebugSwitchState( number.valueOf(info.debugFlag,0)==1 and true or false );
	--微信分享开关
	self:setShareWechatSwitchState( number.valueOf(info.shareWechatFlag,1)==1 and true or false);

	Log.i("--------- ",info.ios_3rd_pay);
    kUserInfoData:setPayStatus(info.is_pay);
	if info.ios_3rd_pay then
   		 RechargeDataInterface.getInstance():setIOSPayMode(info.ios_3rd_pay or 0);
	end
	RechargeDataInterface.getInstance():setGoodsClassifyCommonInfo(info.goodsbase_url);
	
	--防攻击代理服务器地址
	ServerConfig.getInstance():setDefendAttackProxyWebServerUrl(info.proxy_web_url);

	if info.bankrupt_pay then
		kBankruptDataInterface:setBankruptPaySceneSatus(info.bankrupt_pay);
	end

	kUserInfoData:updateHighestScore(tonumber(info.winmax) or 0);
	kAppData:setServerTime(info.srvtime or os.time()); -- 获取php系统时间
	
	self:setIsSnow(info.showSnow)
    self:notify(HallDataInterface.Delegate.onGetCoreInitInfoCallBack, true);
end


HallDataInterface.setHotline = function(self, hotline)
    self.m_hotline = string.isEmpty(hotline) and self.m_hotline or tostring(hotline);
end

HallDataInterface.getHotline = function(self)
	return self.m_hotline or "";
end

HallDataInterface.callHotline = function(self)
	local data = {tel = self.m_hotline};
	NativeEvent.getInstance():autoDial(json.encode(data));
end

--预先下载好要用的二维码图片
HallDataInterface.onGetImageForTwoDimensionCode = function(self,url,path)
	if path then
		Log.v("onGetImageForTwoDimensionCode",path);
	end
end


------------------------------版本审核开关 (android / ios)--------------------

--@brief 请求版本审核开关
HallDataInterface.requestVersionFilterSwitch = function(self)
	if System.getPlatform() == kPlatformIOS then
		self:__requestIosFilterSwitch();
	else
		self:__requestAndroidFilterSwitch();
	end
end

--@brief 请求ios审核开关
HallDataInterface.__requestIosFilterSwitch = function(self)
	local param = {
		version = kClientInfo:getApkVersion();
	};
	OnlineSocketManager.getInstance():sendMsg(PHP_IOS_FILTER_OPEN, param);
end

HallDataInterface.onGetIosFilterSwitchCallBack = function(self, isSuccess, info, sendParam)
	Log.v("onGetIosFilterSwitchCallBack", "info = ", info);
	if isSuccess then
		self.m_iosFilterSwitch = (info.info == 1) and true or false;
		self:saveData();
	end
end

--@brief 获取ios审核开关
--@note 默认为审核状态
HallDataInterface.getIosFilterSwitch = function(self)
	return self.m_iosFilterSwitch or (self.m_iosFilterSwitch == nil);
end

--@brief 请求android审核开关
HallDataInterface.__requestAndroidFilterSwitch = function(self)
	local param = {
		version = kClientInfo:getApkVersion();
	};
	OnlineSocketManager.getInstance():sendMsg(PHP_ANDROID_FILTER_OPEN, param);	
end

HallDataInterface.onGetAndroidFilterSwitchCallBack = function(self, isSuccess, info, sendParam)
	Log.v("onGetAndroidFilterSwitchCallBack", "info = ", info);
	if isSuccess then
		self.m_androidFilterSwitch = (info.info == 1) and true or false;
		self:saveData();
	end
end

--@brief 获取android审核开关
--@note 默认为审核状态
HallDataInterface.getAndroidFilterSwitch = function(self)
	return self.m_androidFilterSwitch or (self.m_androidFilterSwitch == nil);
end

--@brief 获取版本审核开关 包含ios 以及android
HallDataInterface.getVersionFilterSwitch = function(self)
	local platform = System.getPlatform();
	if platform == kPlatformAndroid then
		return self.m_androidFilterSwitch;
	elseif platform == kPlatformIOS then
		return self.m_iosFilterSwitch;
	else
		return false;
	end
end

--@brief 保险箱开关
HallDataInterface.isSafeBoxSwitchOpen = function(self)
	return self.m_safeBoxSwitchState or (self.m_safeBoxSwitchState == nil);--默认为打开状态
end

HallDataInterface.setSafeBoxSwitchState = function(self, state)
	self.m_safeBoxSwitchState = state;
end

--@brief 首冲开关
HallDataInterface.isFistPaySwitchOpen = function(self)
	return self.m_firstPaySwitchState or (self.m_firstPaySwitchState == nil);--默认为打开状态
end

HallDataInterface.setFirstPaySwitchState = function(self, state)
	self.m_firstPaySwitchState = state;
end

--@brief 一键注册开关
HallDataInterface.isRegisterSwitchOpen = function(self, state)
	return self.m_registerSwitchState or (self.m_registerSwitchState == nil);--默认为打开状态
end

HallDataInterface.setRegisterSwitchState = function(self, state)
	self.m_registerSwitchState = state;
end

--@brief 切换账号开关
HallDataInterface.isAccountSwitchOpen = function(self)
	return self.m_accountSwitchState or (self.m_accountSwitchState == nil);--默认为打开状态
end

HallDataInterface.setAccountSwitchState = function(self, state)
	self.m_accountSwitchState = state;
end

--@brief 照相是否可用，如果不可用，则房间内头像设置为默认头像
HallDataInterface.isTakePhotoSwitchOpen = function(self)
	return self.m_takePhotoSwitchState or (self.m_takePhotoSwitchState == nil); --默认为打开状态
end

HallDataInterface.setTakePhotoSwitchState = function(self, state)
	self.m_takePhotoSwitchState = state;
end

--@brief 是否下雪
HallDataInterface.isSnow = function(self)
	self.m_isSnow = self.m_isSnow or false; --默认为关闭状态
	return self.m_isSnow ;
end

HallDataInterface.setIsSnow = function(self, state)
	if state == 0 or state == 1 then
		self.m_isSnow = (state == 1 and true or false)
	end
end

--@brief 是否打开Debug开关
HallDataInterface.setDebugSwitchState = function (self, state)
    if not _DEBUG then
        RegionConfigDataInterface.getInstance():setDebugSwitch(state);
    end
end

--银元开关 
HallDataInterface.setSupportSilverState = function ( self, state )
	-- (0表示都关闭 1表示金条开启银元关闭 2表示金条关闭银元开启 3表示都开启)
	self.m_isSupportSilver = state;
end

HallDataInterface.isSupportSilver = function ( self )
	return self.m_isSupportSilver == 2;
end

--微信分享开关
HallDataInterface.setShareWechatSwitchState = function(self, state)
	self.m_isShareWechat = state;
end

HallDataInterface.isShareWechatSwitchOpen = function(self)
	return self.m_isShareWechat or (self.m_isShareWechat == nil);--默认为打开状态;
end

------------------------------大厅底部按钮的配置-------------------------
--@brief 获取大厅底部配置
HallDataInterface.getBottomButtonConfig = function(self, gameId)
	return Copy( self.m_hallBottomButtonConfig:getConfig(gameId) );
end

--@brief 获取大厅底部配置回调
HallDataInterface.onGetHallBottomButtonListCallBack = function(self, isSuccess, bottomBtnConfig, gameid)
	self:notify(HallDataInterface.Delegate.onGetHallBottomButtonListCallBack, isSuccess, bottomBtnConfig, gameid);
end

--@brief 获取某项的数据
HallDataInterface.getBottomButtonConfigById = function(self, gameId, id)
	return Copy( self.m_hallBottomButtonConfig:getConfigById(gameId, id) );
end

--@brief 判断某个按钮是否显示
HallDataInterface.isButtonDisplay = function(self, gameId, id)
	local config = self.m_hallBottomButtonConfig:getConfigById(gameId, id);
	if config and tonumber(config.display) == 1 then
		return true;
	else
		return false;
	end
end

HallDataInterface.getLeftTopBtnIds = function(self, gameId)
	return self.m_hallBottomButtonConfig:getLeftTopBtnIds(gameId);
end

HallDataInterface.getLeftCenterBtnIdsBtnIds = function(self, gameId)
	return self.m_hallBottomButtonConfig:getLeftCenterBtnIds(gameId);
end

HallDataInterface.getLeftBottomBtnIds = function(self, gameId)
	return self.m_hallBottomButtonConfig:getLeftBottomBtnIds(gameId);
end

HallDataInterface.getRightBottomBtnIds = function(self,gameId)
    return self.m_hallBottomButtonConfig:getRightBottomBtnIds(gameId);
end

HallDataInterface.isCanShowTip = function(self)
	return self.m_hallBottomButtonConfig:isCanShowTip();
end

HallDataInterface.setCanShowTip = function(self,p_bool)
	return self.m_hallBottomButtonConfig:setCanShowTip(p_bool);
end


----------------------------每个游戏的在线人数信息--------------
--@brief 请求大厅各游戏玩家人数
HallDataInterface.requestHallGamePlayerNums = function(self)
	if self:__isNeedRefreshPlayerNums() then
		OnlineSocketManager.getInstance():sendMsg(PHP_HALL_GAME_PLAYER_NUM,{});
	end
end

HallDataInterface.onGetHallGamePlayerNumsCallBack = function(self, isSuccess, info)
	if not isSuccess then
		self:notify(HallDataInterface.Delegate.onGetHallGamePlayerNumsCallBack, false);
		return;
	end

	self.m_gamePlayerNumsMap = table.verify(self.m_gamePlayerNumsMap);
	for k,v in pairs(info) do
		self.m_gamePlayerNumsMap[number.valueOf(k)] = number.valueOf(v);	
	end

	self:notify(HallDataInterface.Delegate.onGetHallGamePlayerNumsCallBack, true, Copy(self.m_gamePlayerNumsMap) );
end

--根据游戏ID获取这个游戏的玩家人数
HallDataInterface.getGamePlayerNumsByGameId = function(self, gameId)
	self.m_gamePlayerNumsMap = table.verify(self.m_gamePlayerNumsMap);
	return self.m_gamePlayerNumsMap[gameId] or 0;
end

HallDataInterface.__isNeedRefreshPlayerNums = function(self)
	if not self.m_refreshTime then
		self.m_refreshTime = os.time();
		return true;
	else
		local lastRefreshTime = self.m_refreshTime;
		local curTime = os.time();
		local interval = curTime - lastRefreshTime;

		if (interval >= 300) then 
			--大于5分钟才拉取一次在线人数，防止因为过于频繁调用此接口，导致获取用户获取场次列表变卡
			self.m_refreshTime = curTime;
			return true;
		else
			return false;
		end 
	end  
end

--------------------------------------临时变量---------------------------------
--@brief 判断房间等级列表是否正在显示中
HallDataInterface.isGameRoomLevelViewShowing = function(self)
	return isGameRoomLevelViewShowingFlag;
end

--@brief 设置房间等级列表显示状态
HallDataInterface.setGameRoomLevelViewShowing = function(self, isShowing)
	isGameRoomLevelViewShowingFlag = isShowing;
end

--@brief 设置更多游戏跳转到场次列表标记
HallDataInterface.setMoreGamesToRoomLevelListFlag = function(self, bMoreGamesToRoomLevel)
	self.m_moreGamesToRoomLevel = bMoreGamesToRoomLevel;
end

--@brief 获取更多游戏跳转到场次列表标记
HallDataInterface.getMoreGamesToRoomLevelListFlag = function(self)
	return self.m_moreGamesToRoomLevel;
end

HallDataInterface.isWebViewShowing = function(self)
	return self.m_isWebViewShowing;
end

HallDataInterface.setWebViewShowing = function(self, isShowing)
	self.m_isWebViewShowing = isShowing;
	self:notify(HallDataInterface.Delegate.onWebViewShowingStatusChanged);
end

--当前用户是否做过新手提示
HallDataInterface.isCurUserGuided = function(self)
	local userId = kUserInfoData:getUserId();
	return self.m_guideData:checkIsGuided(userId);
end

--设置当前用户已进行过新手提示
HallDataInterface.setCurUserGuided = function(self)
	local userId = kUserInfoData:getUserId();
	self.m_guideData:setUserGuided(userId);
end

--临时变量
-- 赶场信息
--[[
    upLevelInfo = {};
    upLevelInfo.level = level; --用户将进入的等级
    upLevelInfo.flag = flag; -- -1:向下赶,1:向上赶
    upLevelInfo.exp = exp; --赶场加的经验
    upLevelInfo.msg = msg; --提示信息
]]
HallDataInterface.setRoomUpLevelInfo = function(self,upLevelInfo)
    self.m_roomUpLevelInfo = upLevelInfo;
end 

HallDataInterface.getRoomUpLevelInfo = function(self)
    return self.m_roomUpLevelInfo or {};
end 

--降级时用的信息
HallDataInterface.getDegradeInfo = function(self)
    return self.m_degradeInfo;
end

HallDataInterface.setDegradeInfo = function(self, degradeInfo)
    self.m_degradeInfo = degradeInfo;
end

HallDataInterface.loadDictData = function(self, dict)
	self.m_androidFilterSwitch = dict:getBoolean("androidFilter", true);
	self.m_iosFilterSwitch = dict:getBoolean("iosFilter", true);
end

HallDataInterface.saveDictData = function(self, dict)
	dict:setBoolean("androidFilter", self:getAndroidFilterSwitch() );
	dict:setBoolean("iosFilter", self:getIosFilterSwitch() );
end

HallDataInterface.getLocalDictName = function(self)
	return "HallDataInterface";
end

HallDataInterface.s_socketCmdFuncMap = {
	[PHP_CORE_INIT]				= HallDataInterface.onGetCoreInitInfoCallBack;
	[PHP_HALL_GAME_PLAYER_NUM]	= HallDataInterface.onGetHallGamePlayerNumsCallBack;
	[PHP_IOS_FILTER_OPEN]       = HallDataInterface.onGetIosFilterSwitchCallBack;
	[PHP_ANDROID_FILTER_OPEN]	= HallDataInterface.onGetAndroidFilterSwitchCallBack;
};
