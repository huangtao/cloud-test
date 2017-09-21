require("common/commonGameLayer");
require("uilibs/dotView");
require("common/uiFactory");
require("hall/update/updateMgr");
require("hall/moreGames/data/moreGamesConstants");

local ListItem = require("hall/moreGames/widget/moreGameListItem");

local MoreGamesPageView = class(CommonGameLayer, false);

MoreGamesPageView.s_itemCountPerPage = 4;
MoreGamesPageView.s_maxDownloadCount = 5;

MoreGamesPageView.ctor = function(self, data, w, h)
	if not table.isTable(data) then
		return;
	end

    super(self, nil);
    self:setSize(w,h);

   	MoreGamesDataInterface.getInstance():setObserver(self);
    EventDispatcher.getInstance():register(ListItem.s_moreGameHandleEvent,self,self._onGameItemHandleEvent);
    UpdateMgr.getInstance():registDownloadListener(self,self._onDownloadListener);
	UpdateMgr.getInstance():registDownloadProgressListener(self,self._onDownloadProgressListener);
	
	self.m_data = data;
    self.m_gamePageList = {};
    self.m_downloadTaskData = {}; -- 未下载未安装队列
    self.m_downloadSuccessedData = {}; -- 已下载未安装队列
    self.m_downloadCount = {};

    self:updateData(self.m_data);
end

MoreGamesPageView.dtor = function(self)
	UpdateMgr.getInstance():unRegistDownloadProgdressListener();
	UpdateMgr.getInstance():unRegistDownloadListener();
	EventDispatcher.getInstance():unregister(ListItem.s_moreGameHandleEvent,self,self._onGameItemHandleEvent);
	MoreGamesDataInterface.getInstance():clearObserver(self);	

	self:updateOpenStatus();
end

MoreGamesPageView.isPopupWindownShowing = function(self)
	if self.m_viewPager then
		local views = table.verify(self.m_viewPager.m_views);
		
		for k, v in pairs(views) do
			if v:isPopupWindownShowing() then
				return true;
			end
		end
	end

	return false;
end

MoreGamesPageView.updateData = function(self,data)
	if not table.isTable(data) then
		return;
	end
	self.m_data = data;
	self:_packetData();
    self:_initViews();
end

MoreGamesPageView.pauseDownloadAllGames = function(self,data)
	self:_log("pauseDownloadAllGames");
	data = table.verify(data);

	for k,v in pairs(data) do 
		MoreGamesDataInterface.getInstance():updateGameDownloadStatus(v.id,MoreGamesDownloadStatus.None);
	end 
	self.m_downloadingData = nil;
	UpdateMgr.getInstance():cancelAllHttpDownload();
end

MoreGamesPageView._packetData = function(self)	
	self.m_gamePageList = MoreGamesDataInterface.getInstance():packePageList(self.m_data,MoreGamesPageView.s_itemCountPerPage);
end

MoreGamesPageView._initViews = function(self)
	if #self.m_gamePageList > 0 then 
		if not self.m_adapter then 
			local w, h = self:getSize();
			MoreGamesPageItem.setDefaultWidth(w);
			self.m_adapter = UIFactory.createCacheAdapter(MoreGamesPageItem, self.m_gamePageList);
			self.m_viewPager = UIFactory.createListView(0, 0,self:getSize());
			self.m_viewPager:setAdapter(self.m_adapter);				
			self:addChild(self.m_viewPager);

			local viewPageBg = new(Node);
			viewPageBg:setFillParent(true, true);
			viewPageBg:setLevel(-1);
			self.m_viewPager:addChild(viewPageBg);
			viewPageBg:setEventTouch(self, self.onTouchBg);
		else 
			self.m_adapter:changeData(self.m_gamePageList);
		end 

		self.m_viewPager:setVisible(true);
		if self.m_noneGameTips then 
			self.m_noneGameTips:setVisible(false);
		end 

	else 
		if self.m_viewPager then 
			self.m_viewPager:setVisible(false);
		end 

		if not self.m_noneGameTips then 
			local msg = "敬请期待！"
			self.m_noneGameTips = UIFactory.createText(msg,36, 10, 10, kAlignCenter, 118,72,18);
			self.m_noneGameTips:setAlign(kAlignCenter);
			self:addChild(self.m_noneGameTips);
		end 
	end 
end

-- 下载完成
MoreGamesPageView._onDownloadListener = function(self,data,isSuccess)
	self:_log("onDownloadListener", data.name, isSuccess);	
	if not (not table.isEmpty(data) and data.id) then
		return;
	end

	for k,v in pairs(self.m_data) do 
		if type(v) == "table" then
			if v.id == data.id then 
				v.gameDownloadStatus = isSuccess and MoreGamesDownloadStatus.Successed or MoreGamesDownloadStatus.Failed;
			end 
		end 
	end

	if isSuccess then 
		UpdateMgr.getInstance():installLua(false);
		
		table.insert(self.m_downloadSuccessedData,data);	

		self:_updateGameInstallStatus();
		
		self.m_downloadingData = nil;

		self:_startDownloadTask();
	else
		Toast.getInstance():showText(string.format("%s下载失败，请确保您的网络通畅", data.name),50,30,kAlginLeft,"",26,255,255,255);
	end  

	EventDispatcher.getInstance():dispatch(ListItem.s_moreGamesDownloadResult,data,isSuccess);
end

MoreGamesPageView._updateGameInstallStatus = function(self)
	if #self.m_downloadSuccessedData > 0 and (not self.m_notifyInstallData) then
		-- 当前安装 
		self.m_notifyInstallData = table.remove(self.m_downloadSuccessedData,1);
		MoreGamesDataInterface.getInstance():updateGameInstallStatus(self.m_notifyInstallData.id);
	end 
end

MoreGamesPageView.updateGameInstallStatusCallBack = function(self,isSuccess,gameId)
	if isSuccess then 
		kGameManager:forceRefreshGameList();
		self.m_notifyInstallData = nil;
	elseif gameId then 
		local count = number.valueOf(self.m_downloadCount[gameId]);

		if count < MoreGamesPageView.s_maxDownloadCount then
			self:_log("updateGameInstallStatusCallBack", "gameId", gameId, "count", count);
			self.m_downloadCount[gameId] = count + 1;
			table.insert(self.m_downloadSuccessedData,Copy(self.m_notifyInstallData));
		end
		self.m_notifyInstallData = nil;	
	end

	self:_updateGameInstallStatus();
end

MoreGamesPageView._onDownloadProgressListener = function(self,data,progress)
	if not (not table.isEmpty(data) and data.id) then
		return;
	end

	EventDispatcher.getInstance():dispatch(ListItem.s_moreGamesDownloadProgress,data,progress);
end

-- 下载处理
MoreGamesPageView._onGameItemHandleEvent = function(self,event,data)
	local events = ListItem.s_handleEvent;

	local isInDownloadTask,key = self:_isInDownloadTask(data); -- 已在下载队列
	local isDownloading = self:_isDownloading(data); -- 已在下载中

	if event == events.StartDownload then 
		if not (isInDownloadTask or isDownloading) then 
			table.insert(self.m_downloadTaskData,data);
		end 
	elseif event == events.CancleDownload then
		if isDownloading then 
			self.m_downloadingData = nil;
			UpdateMgr.getInstance():cancelAllHttpDownload();
		else 
			if isInDownloadTask and key then 
				table.remove(self.m_downloadTaskData,key);
			end 
		end 
	end

	self:_startDownloadTask();

	for k,v in pairs(self.m_data) do 
		if type(v) == "table" then
			if v.id == data.id then 
				self.m_data[k] = data;
			end 
		end 
	end 
	self:_packetData();
end

-- 处理下载队列 
MoreGamesPageView._startDownloadTask = function(self)
	if not self.m_downloadingData and #self.m_downloadTaskData > 0 then 
		-- 当前下载
		self.m_downloadingData = table.remove(self.m_downloadTaskData,1);
		UpdateMgr.getInstance():downloadGame(self.m_downloadingData);
	end 
end

MoreGamesPageView._isInDownloadTask = function(self,data)
	for k,v in pairs(self.m_downloadTaskData) do 
		if v.id == data.id then 
			return true,k;
		end 
	end 

	return false;
end

MoreGamesPageView._isDownloading = function(self,data)
	if self.m_downloadingData and self.m_downloadingData.id == data.id then 
		return true;
	end 

	return false;
end

-- 处理点击空白区域关闭下载弹框
MoreGamesPageView.onTouchBg = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
	if finger_action == kFingerUp then
		EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	end
end

MoreGamesPageView.updateOpenStatus = function(self)
	MoreGamesDataInterface.getInstance():updateOpenStatus();
end

MoreGamesPageView._log = function(self, ...)
	Log.d("MoreGamesPageView", ...);
end

--------------------------------------------------------------
MoreGamesPageItem = class(Node);

MoreGamesPageItem.s_pageWidth = 300;

MoreGamesPageItem.setDefaultWidth = function(width)
	MoreGamesPageItem.s_pageWidth = width or 300;
end

MoreGamesPageItem.ctor = function(self,data)	
	if not table.isTable(data) then
		return;
	end

	self:_initViews(data);
end

MoreGamesPageItem.dtor = function(self)	
end

MoreGamesPageItem._initViews = function(self,data)
	local pageWidth = MoreGamesPageItem.s_pageWidth / MoreGamesPageView.s_itemCountPerPage;
	local itemWidth = 0;
	local itemHeight = 0;
	for k,v in pairs(data) do
		if type(v) == "table" then
			local view = new(ListItem,v);
			itemWidth, itemHeight = view:getSize();
			self:addChild(view);
			view:setAlign(kAlignLeft);
			view:setPos(pageWidth*(k-1) + (pageWidth - itemWidth) / 2, 0);
		end
	end
	self:setSize(MoreGamesPageItem.s_pageWidth, itemHeight);
end

MoreGamesPageItem.isPopupWindownShowing = function(self)
	local children = self:getChildren();
	for k, v in pairs(children) do
		if v:isPopupWindownShowing() then
			return true;
		end
	end
	return false;
end

--------------------------------------------------------------------------

return MoreGamesPageView;