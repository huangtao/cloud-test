require("common/commonScene");
require("hall/update/updateMgr");
require("hall/moreGames/data/moreGamesDataInterface");
require("hall/moreGames/data/moreGamesConstants");

MoreGamesScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end
MoreGamesScene.s_controls = 
{
	returnBtn = getIndex();
	gameListView = getIndex();
};

MoreGamesScene.s_cmds = 
{
	CheckCanExit = getIndex();
};

MoreGamesScene.ctor = function(self,viewConfig,control)
	self.m_ctrl = MoreGamesScene.s_controls;
	MoreGamesDataInterface.getInstance():setObserver(self);

	self.m_gameList = {};

	self:_loadGamesList();

	self.m_root:setEventTouch(self, self.onTouchBg);
end

MoreGamesScene.dtor = function(self)
	self:_pauseDownloadAndGoBack();
	MoreGamesDataInterface.getInstance():clearObserver(self);
end 

MoreGamesScene.resume = function(self)
	CommonScene.resume(self);
end

MoreGamesScene.pause = function(self)
	CommonScene.pause(self);
end

MoreGamesScene._loadGamesList = function(self)
	if not self.m_moreGamesListView then 
		local gameListView = self:findViewById(self.m_ctrl.gameListView);
		
		local gameList = MoreGamesDataInterface.getInstance():getMoreGamesList();

		local moreGamesPageView = require("hall/moreGames/widget/moreGamesPageView");
		self.m_moreGamesListView = new(moreGamesPageView,gameList,gameListView:getParent():getSize());
		gameListView:addChild(self.m_moreGamesListView);

		self.m_gameList = gameList;
	end 
end

MoreGamesScene.onGetMoreGamesListCallBack = function(self,isSuccess,data)
	if isSuccess and (not table.equal(data,self.m_gameList)) then
		self.m_gameList = data;

		self.m_moreGamesListView:updateData(data);
	end  
end

-------------------------------------------------------------------------------------------
MoreGamesScene.onCheckCanExit = function(self)
	if MessageBox.isShowing() then 
		MessageBox.hide();

		return false;
	elseif self.m_moreGamesListView and self.m_moreGamesListView:isPopupWindownShowing() then
		EventDispatcher.getInstance():dispatch(kClosePopupWindows);
		return false;
	else 
		if self:_checkIsDownloading() then
			return false;
		else 
			return true;
		end 
	end 
end


-------------------------------------------------------------------------------------------
MoreGamesScene.onReturnBtnClick = function(self)
	if not self:_checkIsDownloading() then 
		self:requestCtrlCmd(MoreGamesController.s_cmds.GoBack);
	end 
end
-------------------------------------------------------------------------------------------
MoreGamesScene._checkIsDownloading = function(self)
	local downloadingGame = MoreGamesDataInterface.getInstance():getDataByDownloadStatus(MoreGamesDownloadStatus.Downloading);

	if #downloadingGame > 0 then  
		local msg = "返回大厅将停止正在进行的下载，是否停止下载并返回大厅？";
		MessageBox.show("提示", msg,"继续下载", "返回大厅", false, nil, nil, self, self._pauseDownloadAndGoBack);

		return true;
	end 

	return false;
end

MoreGamesScene._pauseDownloadAndGoBack = function(self)
	local downloadingGame = MoreGamesDataInterface.getInstance():getDataByDownloadStatus(MoreGamesDownloadStatus.Downloading);
	self.m_moreGamesListView:pauseDownloadAllGames(downloadingGame);

	self:requestCtrlCmd(MoreGamesController.s_cmds.GoBack);
end
-------------------------------------------------------------------------------------------
-- 处理点击空白区域关闭下载弹框
MoreGamesScene.onTouchBg = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
	if finger_action == kFingerUp then
		EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	end
end
-------------------------------------------------------------------------------------------
MoreGamesScene.s_controlConfig = 
{
	[MoreGamesScene.s_controls.returnBtn] = {"topView","returnBtn"};
	[MoreGamesScene.s_controls.gameListView] = {"contentView","gameListView"};
};

MoreGamesScene.s_controlFuncMap = 
{
	[MoreGamesScene.s_controls.returnBtn] = MoreGamesScene.onReturnBtnClick;
};

MoreGamesScene.s_cmdConfig = 
{
	[MoreGamesScene.s_cmds.CheckCanExit] = MoreGamesScene.onCheckCanExit;
};
