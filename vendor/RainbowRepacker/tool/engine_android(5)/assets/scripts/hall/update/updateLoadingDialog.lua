require("hall/loading/LoadingDialog");

--[[
	更新界面(全屏)，此处是大厅点击游戏弹出的全屏更新界面
]]

UpdateLoadingDialog = class(LoadingDialog);


----------------------------------------------
UpdateLoadingDialog.ctor = function(self,gameid)
	self.gameid=gameid;
	self:init();

Log.v("UpdateLoadingDialog.ctor");
end

UpdateLoadingDialog.dtor = function(self)
Log.v("UpdateLoadingDialog.dtor");
	UpdateMgr.getInstance():unRegistDownloadListener();
	UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	self:clearHiddenDialogTimeoutTimer();
end

UpdateLoadingDialog.init = function(self)
	self:updateProgress(0);

	UpdateMgr.getInstance():registDownloadListener(self,self.onUpdateListener);
	UpdateMgr.getInstance():registDownloadProgressListener(self,self.onUpdateProgressListener);
	UpdateMgr.getInstance():updateGame(self.gameid);
end

UpdateLoadingDialog.onUpdateListener = function(self,data,isSuccess)


	Log.v("UpdateLoadingDialog.onUpdateListener");

	if data and data.id and (self.gameid == data.id) then
		if isSuccess then

	    	UpdateMgr.getInstance():unRegistDownloadListener();
			UpdateMgr.getInstance():unRegistDownloadProgdressListener();
			UpdateMgr.getInstance():installLua(false);

			UpdateHandleMgr.getInstance():updateGameSuccessed(self.gameid);
		else
			--当非强制更新不成功的时候，仍然让用户可以进入游戏
			local isForce = UpdateData.getInstance():isForceGameUpdated(self.gameid);

			if not isForce then
				local gameVersion=kGameManager:getGameVersion(self.gameid);--本地版本号
				local minVersionCanPlay= kGameManager:getGamePlayableMinVersion(self.gameid);
				isForce = (gameVersion < minVersionCanPlay);
			end

			Log.v("UpdateLoadingDialog.onUpdateListener",isForce);

			if not isForce then
				UpdateHandleMgr.getInstance():updateGameSuccessed(self.gameid);
			end
		end
	end

	self:startHiddenDialogTimeoutTimer();
end

UpdateLoadingDialog.onUpdateProgressListener = function(self,data,progress)
	if data and data.id and (self.gameid == data.id) then
		self:updateProgress(progress);
	end
end


UpdateLoadingDialog.startHiddenDialogTimeoutTimer = function(self)
	self:clearHiddenDialogTimeoutTimer();
	self.m_hiddenDialogTimeOut = AnimFactory.createAnimInt(kAnimNormal,0,1,200,-1);
	ToolKit.setDebugName(self.m_hiddenDialogTimeOut,"AnimInt|UpdateLoadingDialog.startHiddenDialogTimeoutTimer|timeOut");
	self.m_hiddenDialogTimeOut:setEvent(self,self.onUpdateRequestTimeout);
end 

UpdateLoadingDialog.clearHiddenDialogTimeoutTimer = function(self)
	delete(self.m_hiddenDialogTimeOut);
	self.m_hiddenDialogTimeOut = nil;
end

UpdateLoadingDialog.onUpdateRequestTimeout = function(self)
	self:clearHiddenDialogTimeoutTimer();
	UpdateLoadingDialog.hide();
end

UpdateLoadingDialog.show = function(data)	
	UpdateLoadingDialog.hide(true);

	if not UpdateMgr.getInstance():checkGameUpdateData(data) then
		local function recheckUpdate()
			UpdateCheckMgr.getInstance():startCheckUpdate(true);
		end
		local instance = MessageBox.show("温馨提示", "由于网络问题更新信息获取失败，请重试", "重新获取",nil, true, self, recheckUpdate);
		IPopDialogManager.getInstance():addPopDialog(instance, 100, MessageBox.hide);
		return nil;
	end

	UpdateLoadingDialog.s_instance = new(UpdateLoadingDialog, data);
	UpdateLoadingDialog.s_instance:addToRoot();
	UpdateLoadingDialog.s_instance:setFillParent(true,true);
	UpdateLoadingDialog.s_instance:setLevel(99);
	return UpdateLoadingDialog.s_instance;

end

UpdateLoadingDialog.hide = function()	
	delete(UpdateLoadingDialog.s_instance);
	UpdateLoadingDialog.s_instance = nil;
end