require("core/object");
require("hall/onlineSocket/onlineSocketManager");
require("util/timer");
require("hall/php/phpSocketCmd");

UpdateCheckMgr = class(DataInterfaceBase);

UpdateCheckMgr.s_maxCheckCount = 10;

UpdateCheckMgr.checkState = {
	None = 0; 		--未开始检测
	Checking = 1;	--检测中
	Checked = 2;	--检测完成
	CheckFailed = 3;--检测失败
}

UpdateCheckMgr.Delegate = {
	onCheckUpdateCallBack = "onCheckUpdateCallBack";
};


UpdateCheckMgr.getInstance = function()
	if not UpdateCheckMgr.s_instance then
		UpdateCheckMgr.s_instance = new(UpdateCheckMgr);
	end
	return UpdateCheckMgr.s_instance;
end

UpdateCheckMgr.releaseInstance = function(self)
	delete(UpdateCheckMgr.s_instance);
	UpdateCheckMgr.s_instance = nil;
end

UpdateCheckMgr.ctor = function(self)
	self.m_checkState = UpdateCheckMgr.checkState.None;
	self.m_checkCount = 0;
end

UpdateCheckMgr.dtor = function(self)
	self:stopCheckTimer();
end

-------------------------------------------------------------------------
UpdateCheckMgr.startCheckUpdate = function(self,isForce)
	if (not self:isChecking()) and (isForce or not self:isChecked()) then
		self.m_checkCount = self.m_checkCount + 1;

		self:setCheckState(UpdateCheckMgr.checkState.Checking);

		local updateParam = self:getCheckParam();
		OnlineSocketManager.getInstance():sendMsg(PHP_UPDATE,updateParam);

		self:startCheckTimer();
	end 
end

UpdateCheckMgr.onCheckUpdateCallBack = function(self,isSuccess,info)
	self:stopCheckTimer();

	if isSuccess then 
		self.m_checkCount = 0;
		self:setCheckState(UpdateCheckMgr.checkState.Checked);
	else
		self:setCheckState(UpdateCheckMgr.checkState.CheckFailed);
		self.m_checkCount = self.m_checkCount or 0;
		if self.m_checkCount <= UpdateCheckMgr.s_maxCheckCount then
			self:startCheckUpdate();
		end
	end 

	self:notify(UpdateCheckMgr.Delegate.onCheckUpdateCallBack,isSuccess,info);
end

UpdateCheckMgr.cancleCheckUpdate = function(self)
	self.m_checkCount = 0;

	self:stopCheckTimer();
	
	self:setCheckState(UpdateCheckMgr.checkState.None);
end
---------------------------------------------------------------------------
UpdateCheckMgr.setCheckState = function(self,state)
	self.m_checkState = state;
end

UpdateCheckMgr.getCheckState = function(self)
	return self.m_checkState;
end

UpdateCheckMgr.isChecked = function(self)
	return self.m_checkState == UpdateCheckMgr.checkState.Checked;
end

UpdateCheckMgr.isChecking = function(self)
	return self.m_checkState == UpdateCheckMgr.checkState.Checking;
end

UpdateCheckMgr.getCheckParam = function(self)
	kClientInfo:getPhoneInfo();
	
	local apkVersion = kClientInfo:getApkVersion();

	local updateParam = {};
	updateParam.app_version = apkVersion;
	updateParam.hall_version = kGameManager:getGameVersion(GameType.HALL);
	updateParam.app = kClientInfo:getAppId();
	updateParam.channel_id = kClientInfo:getChannelId();
	updateParam.channel_key = kClientInfo:getChannelKey();
	updateParam.network = kClientInfo:getNetworkType();
	updateParam.lastLoginMid = kLoginDataInterface:getLastMid();--用户上次登录的Mid,用于更新灰度

	local _games = {};
	local gameList = kGameManager:getGameList();

	for k, v in ipairs(gameList) do
		local gameVersion = kGameManager:getGameVersion(v.id);
		if gameVersion > 0 then
			_games[#_games+1] = {id = v.id, version = gameVersion};
		end
	end

	local moduleList = kGameManager:getModuleList();
	for k, v in ipairs(moduleList) do
		local gameVersion = kGameManager:getGameVersion(v.id);
		if gameVersion > 0 then
			_games[#_games+1] = {id = v.id, version = gameVersion};
		end
	end

	updateParam.games = _games;
	updateParam.guid = kClientInfo:getGuid();
	updateParam.branch = kBranch;
	--IOS不需要传branch，否则PHP返回数据会出现错误
	if System.getPlatform() == kPlatformIOS then
		updateParam.branch = nil;
	end

	--android 将apk包的md5值带给php,如果php校验这个md5值不合法，则将返回完整包更新数据
	--用于防止解析包出错这个问题!!!
	if System.getPlatform() == kPlatformAndroid then
		updateParam.app_hash = kClientInfo:getApkMd5();
	end
	
	updateParam.apk_install_time = kClientInfo:getApkInstallTime();
	updateParam.time = os.time();

	return updateParam;
end

UpdateCheckMgr.startCheckTimer = function(self)
	self:stopCheckTimer();

	self.m_checkTimer = new(Timer,"UpdateCheckMgr|checkTimer",15000,self,self.onCheckTimeout);
end 

UpdateCheckMgr.stopCheckTimer = function(self)
	delete(self.m_checkTimer);
	self.m_checkTimer = nil;
end

UpdateCheckMgr.onCheckTimeout = function(self)
	self:stopCheckTimer();

	self:setCheckState(UpdateCheckMgr.checkState.CheckFailed);

	self.m_checkCount = self.m_checkCount or 0;
	if  self.m_checkCount <= UpdateCheckMgr.s_maxCheckCount then
		self:startCheckUpdate();
	else
		self.m_checkCount = 0;
	end
end

UpdateCheckMgr.s_socketCmdFuncMap = {
	[PHP_UPDATE] 				= UpdateCheckMgr.onCheckUpdateCallBack;
};
