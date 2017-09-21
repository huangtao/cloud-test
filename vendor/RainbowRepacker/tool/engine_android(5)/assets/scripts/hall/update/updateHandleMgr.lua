require("core/object");
require("hall/update/updateCheckMgr");
require("hall/update/updateMgr");
require("hall/main/data/hallUpdateConfig");
require("hall/update/downloadDialog");
require("hall/update/newupdateDialog");
require("common/IBaseDialog");
require("hall/update/updateDialog");
require("gameData/clientInfo");

UpdateHandleMgr = class(DataInterfaceBase);

UpdateHandleMgr.s_hallSilenceUpdateMaxSize = 5*1024*1024;
UpdateHandleMgr.s_gameSilenceUpdateMaxSize = 500*1024;

UpdateHandleMgr.Delegate = {
	onCheckUpdateCallBack = "onCheckUpdateCallBack";
	downloadGameSuccessed = "downloadGameSuccessed";
	updateGameSuccessed = "updateGameSuccessed";
};

UpdateHandleMgr.getInstance = function()
	if not UpdateHandleMgr.s_instance then
		UpdateHandleMgr.s_instance = new(UpdateHandleMgr);
	end
	return UpdateHandleMgr.s_instance;
end

UpdateHandleMgr.releaseInstance = function(self)
	delete(UpdateHandleMgr.s_instance);
	UpdateHandleMgr.s_instance = nil;
end

UpdateHandleMgr.ctor = function(self)
	UpdateCheckMgr.getInstance():setObserver(self);
	EventDispatcher.getInstance():register(DownloadDialog.s_downloadedGame,self,self.downloadGameSuccessed); 
	EventDispatcher.getInstance():register(NewUpdateDialog.s_updatedGame,self,self.updateGameSuccessed);
end 

UpdateHandleMgr.dtor = function(self)
	UpdateCheckMgr.getInstance():clearObserver(self);
	EventDispatcher.getInstance():unregister(DownloadDialog.s_downloadedGame,self,self.downloadGameSuccessed);
	EventDispatcher.getInstance():unregister(NewUpdateDialog.s_updatedGame,self,self.updateGameSuccessed);
end

------------------根据本地数据监测是否有更新 ----------------------------
UpdateHandleMgr.checkLocalUpdate = function(self)
	if self:isApkHasUpdate() or self:isHallHasUpdate() then	
		local data = UpdateData.getInstance():getUpdateData();
		self:onUpdateAppOrHall(data);
	else
		local games = UpdateData.getInstance():getGameData();
		for k,v in pairs(games) do
			v.downloadstatus = KDownloadStatus_NotStart;
			if v.flag == 1 and self:isSilenceUpdate(v.update_type, v.size, UpdateHandleMgr.s_gameSilenceUpdateMaxSize) then
				UpdateMgr.getInstance():updateGame(v.id);
			end
		end
	end
end

UpdateHandleMgr.isApkHasUpdate = function(self)
	return UpdateData.getInstance():isApkUpdated();
end

UpdateHandleMgr.isHallHasUpdate = function(self)
	return UpdateData.getInstance():isHallUpdated();
end
-----------------------检测是否有更新--------------------------------------
UpdateHandleMgr.startCheckUpdate = function(self,isForce)
	UpdateCheckMgr.getInstance():startCheckUpdate(isForce);
end

UpdateHandleMgr.onCheckUpdateCallBack = function(self,isSuccess,data)
	Log.i("UpdateHandleMgr.onCheckUpdateCallBack");
	
	local isApkUpdate;
	local isHallUpdate;

	if isSuccess then		
		UpdateData.getInstance():setUpdateData(data);
		self:onUpdateAppOrHall(data);

		isApkUpdate = self:isApkHasUpdate();
		isHallUpdate = self:isHallHasUpdate();

		if isApkUpdate or isHallUpdate then
			Log.i("UpdateHandleMgr onUpDate apk or hall update");
		else
			Log.i("UpdateHandleMgr onUpDate no apk or no hall update");
			local games = UpdateData.getInstance():getGameData();
			for k,v in pairs(games) do
				v.downloadstatus = KDownloadStatus_NotStart;
				if v.flag == 1 and self:isSilenceUpdate(v.update_type, v.size, UpdateHandleMgr.s_gameSilenceUpdateMaxSize) then
					Log.i("UpdateHandleMgr onUpDate no apk or no hall update ==> game silence update  gameid = ",v.id);
					UpdateMgr.getInstance():updateGame(v.id);
				end
			end
		end
	end
	self:notify(UpdateHandleMgr.Delegate.onCheckUpdateCallBack,isSuccess,isApkUpdate,isHallUpdate);
end


UpdateHandleMgr.isWifi = function(self)
	if System.getPlatform() == kPlatformWin32 then
		return false;
	else
		return kClientInfo:getNetworkType() == ClientInfo.eNetworkType.wifi;
	end
end

--判断是否静默更新
--update_type 更新类型 0:无更新 1:可选更新 2:强制更新 3:静默更新
--update_mode 更新方式 0:增量更新 1:第三方(发布渠道)更新 2:完整更新
UpdateHandleMgr.isSilenceUpdate = function(self, update_type, size, maxSize)
	if update_type == 2 then --后台选择强制更新,则不采用静默更新
		return false;

	elseif update_type == 3 then --后台选择静默更新,则直接采用静默更新
		return true

	elseif update_type == 1 and self:isWifi() and number.valueOf(size) <= number.valueOf(maxSize) then --后台选择可选更新，如果在wifi且大小满足情况下，则采用静默更新
		return true;
	end

	return false;
end
----------------------------------------------------------------------------------
UpdateHandleMgr.onUpdateAppOrHall = function(self,data)
	if not data then
		return;
	end

	local isApkUpdate  = (data and data.app  and data.app.flag == 1 or false);
	local isHallUpdate = (data and data.hall and data.hall.flag == 1 or false);
	
	local version;
	local desc;
	local update_type = 0;
	local size = 0;

	if isApkUpdate then 
		version = data.app.version;
		desc = data.app.desc;
		update_type = data.app.update_type;
		size = data.app.size or -1;

	elseif isHallUpdate then
		version = data.hall.version;
		desc = data.hall.desc;
		update_type = data.hall.update_type;
		size = data.hall.size or -1;
	else
		HallUpdateConfig.getInstance():setHallUpdateStatus(0);
	end

	if isApkUpdate or isHallUpdate then
		local status = HallUpdateConfig.getInstance():getHallUpdateStatus();
		if bit.band(status, 1) == 0 then--原来没有更新
			status = 3;
			HallUpdateConfig.getInstance():setHallUpdateStatus(status);
		end
		if update_type==3 then--静默更新不显示红点
			status = 0;
			HallUpdateConfig.getInstance():setHallUpdateStatus(status);
		end
		
		--1:可选更新 2:强制更新 3:静默更新
		if update_type == 2 then
			--2:强制更新
			self.dialog = new(UpdateDialog,"UpdateDialog",1000,version,desc,update_type,size);
			self.dialog:setOnClickListener(self,self.onUpdateClick);
			IBaseDialog.pushDialog(self.dialog);

		elseif isApkUpdate or not self:isSilenceUpdate(update_type, size, UpdateHandleMgr.s_hallSilenceUpdateMaxSize) then
			--1：可选更新 (apk更新 或 大厅可选更新且不能转化为静默更新)
			if kGameManager:isInHall() then
				self.dialog = new(UpdateDialog,"UpdateDialog",1000,version ,desc , update_type,size);
				self.dialog:setOnClickListener(self,self.onUpdateClick,self,self.onUpdateCancelClick);
				self.dialog:setOnCloseListener(self,self.onUpdateCloseWindow);
				IBaseDialog.pushDialog(self.dialog);
			end

		else
			--3：静默更新 大厅静默更新或大厅可选更新可转化为静默更新
			HallUpdateConfig.getInstance():setHallUpdateStatus(0);
			UpdateMgr.getInstance():update();
		end  
	end
	
end

UpdateHandleMgr.onUpdateCancelClick = function(self)
    UpdateMgr.getInstance():unRegistDownloadListener();
	UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	self.dialog=nil;
end

UpdateHandleMgr.onUpdateCloseWindow = function(self)
	UpdateMgr.getInstance():unRegistDownloadListener();
	UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	self.dialog=nil;
end

UpdateHandleMgr.onUpdateClick = function(self)
	self.userClickUpdate=true;--用户主动点击

	UpdateMgr.getInstance():registDownloadListener(self,UpdateHandleMgr.onUpdateDownloadListener);
	UpdateMgr.getInstance():registDownloadProgressListener(self,UpdateHandleMgr.onUpdateDownloadProgressListener);
	if self.dialog then
		self.dialog:hideCloseBtn();
		self.dialog:initProgressView();
	end
	UpdateMgr.getInstance():update();

	if self:isApkHasUpdate() then
		local data = UpdateData.getInstance():getApkData();
		if data.update_mode == 1 then
			UpdateDialog.hide(true);
		end
	end
end

UpdateHandleMgr.onUpdateDownloadListener = function(self,data,isSuccess)
    if self.dialog then
    	if isSuccess then
    		self.dialog:updateDownloadSuccessClick(self,UpdateHandleMgr.onUpdateDownloadCompletedClick);
    	else
    		self.dialog:updateDownloadFaildClick(self,UpdateHandleMgr.onUpdateDownloadFailedClick);
    	end
    end

    if not UpdateMgr.getInstance():hasUpdateTask() then
    	UpdateMgr.getInstance():unRegistDownloadListener();
		UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	end
end

UpdateHandleMgr.onUpdateDownloadProgressListener = function(self,data,progress)
    if self.dialog then
    	self.dialog:updateProgress(progress);
	end
end

UpdateHandleMgr.onUpdateDownloadCompletedClick = function(self)
	HallUpdateConfig.getInstance():setHallUpdateStatus(0);
	UpdateMgr.getInstance():install();
	self.dialog = nil;
end

UpdateHandleMgr.onUpdateDownloadFailedClick = function(self)
	UpdateMgr.getInstance():registDownloadListener(self,UpdateHandleMgr.onUpdateDownloadListener);
	UpdateMgr.getInstance():registDownloadProgressListener(self,UpdateHandleMgr.onUpdateDownloadProgressListener);

	if self.dialog then
		self.dialog:hideCloseBtn();
		self.dialog:initProgressView();
	end
	UpdateMgr.getInstance():update();
end

----------------------------------------------------------
UpdateHandleMgr.startDownloadOrUpdateGame = function(self,data)
	Log.v("UpdateHandleMgr.onDownloadOrUpdateGame------------------------");
	data = table.verify(data);
	local status = number.valueOf(data.status);
	if status == HallGameStatus.CanInstall then--下载
		self:downloadGame(data);
	elseif status == HallGameStatus.CanUpdate then--更新
		local gameid  = number.valueOf(data.id);
		if gameid > 0 then 
			self:updateGame(gameid);
		end 
	end
end

------------------------------------------------------
UpdateHandleMgr.downloadGame = function(self,data)
	if table.isEmpty(data) or string.isEmpty(data.url) then
		local function recheckUpdate()
			UpdateCheckMgr.getInstance():startCheckUpdate(true);
		end
		local instance = MessageBox.show("温馨提示", "由于网络问题更新信息获取失败，请重试", "重新获取",nil, true, self, recheckUpdate);
	    IPopDialogManager.getInstance():addPopDialog(instance, 100, MessageBox.hide);
		return;
	end

	local downloadDialog = new(DownloadDialog,"DownloadDialog",99,data);
	IBaseDialog.pushDialog(downloadDialog);	
end

UpdateHandleMgr.downloadGameSuccessed = function(self,data)
	self:notify(UpdateHandleMgr.Delegate.downloadGameSuccessed,data);
end
------------------------------------------------------------
UpdateHandleMgr.updateGame = function(self,gameid)
	if not UpdateMgr.getInstance():checkGameUpdateData(gameid) then
		local function recheckUpdate()
			UpdateCheckMgr.getInstance():startCheckUpdate(true);
		end
		local instance = MessageBox.show("温馨提示", "由于网络问题更新信息获取失败，请重试", "重新获取",nil, true, self, recheckUpdate);
		IPopDialogManager.getInstance():addPopDialog(instance, 100, MessageBox.hide);
		return nil;
	end

	local updateDialog = new(NewUpdateDialog,"NewUpdateDialog",99,gameid);
	IBaseDialog.pushDialog(updateDialog);
end

UpdateHandleMgr.updateGameSuccessed = function(self,gameid)
	self:notify(UpdateHandleMgr.Delegate.updateGameSuccessed,gameid);
end