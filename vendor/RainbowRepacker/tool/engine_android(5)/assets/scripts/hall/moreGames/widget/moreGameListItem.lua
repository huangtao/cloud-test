require("util/ImageCache");
require("common/animFactory");
require("ui/node");
local moreGameListItem = require(ViewPath .. "hall/moreGames/moreGameListItem");
require("hall/animation/animScale");
require("hall/moreGames/data/moreGamesConstants");
local moreGames_pin_map = require("qnFiles/qnPlist/hall/moreGames_pin");
local num_download_pin_map = require("qnFiles/qnPlist/hall/num_download_pin");
require("uilibs/userMoneyItem");

local MoreGameListItem = class(Node);

MoreGameListItem.s_moreGamesDownloadResult = EventDispatcher.getInstance():getUserEvent();
MoreGameListItem.s_moreGamesDownloadProgress = EventDispatcher.getInstance():getUserEvent();
MoreGameListItem.s_moreGameHandleEvent = EventDispatcher.getInstance():getUserEvent();

MoreGameListItem.s_handleEvent = {
	StartDownload = 1;
	CancleDownload = 2;
};

MoreGameListItem.ctor = function(self, data)
	if not table.isTable(data) then
		return;
	end
	self.m_data = data;

	self.m_root = SceneLoader.load(moreGameListItem);
	local w, h = self.m_root:getSize();
	self:setSize(w, h);	
	self:addChild(self.m_root);

	self:_getBaseView();
	self:_initData(data);

	self:setEventTouch(self,self._onBgTouch);
end

MoreGameListItem.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
	AnimScale.release();
	self:_unregistDownloadEvent();
end

MoreGameListItem.isPopupWindownShowing = function(self)
	if self.m_moreGameInfoView and self.m_moreGameInfoView:isShowing() then
		return true;
	end
	return false;
end
-------------------------------------------------------------------------------------
MoreGameListItem._onBgTouch = function(self , finger_action , x , y, drawing_id_first , drawing_id_current)
	local startXPos = self:getUnalignPos();
	if not self.m_colors then
		self.m_colors = self:getColor();
	end
    if finger_action == kFingerDown then
    	self:setColor(128,128,128);
      	AnimScale.play(self, true);
      	self.m_startX = x;
      	self.m_startY = y;
      	self.m_touchBeginTime = os.time();

    elseif finger_action == kFingerUp then
    	AnimScale.play(self, false);
    	self:setColor(255,255,255);
    	local disX = math.abs(x - self.m_startX);
    	local disY = math.abs(y - self.m_startY);
    	local isLong = (os.time() - self.m_touchBeginTime) >= 1;
    	if drawing_id_first == drawing_id_current and disX < 15 and disY < 15 then
    		kEffectPlayer:play(EffectsCommon.AudioButtonClick);
    		self:_onItemClick(isLong);
    	end
    end
end

MoreGameListItem._onItemClick = function(self,isLong)
	if self.m_data.gameDownloadStatus == MoreGamesDownloadStatus.None then 
		self:_showInfoView();
	elseif self.m_data.gameDownloadStatus == MoreGamesDownloadStatus.Downloading then 

	elseif self.m_data.gameDownloadStatus == MoreGamesDownloadStatus.Successed then
		-- 已下载跳转到房间列表
		local params = {};
		params.id = self.m_data.id;
		CommonJumpLogic.getInstance():setJumpData(CommonJumpCmds.GOTO_GAME_ROOM_LIST, nil, params);
        HallDataInterface.getInstance():setMoreGamesToRoomLevelListFlag(true);
		kGameManager:startGame(GameType.HALL);
	end
end

-- infoView 回调
MoreGameListItem.onMoreGameInfoViewDownload = function(self)
	self:_hideInfoView();
	self:_startDownloadGame();
end

-- infoView 回调
MoreGameListItem.onMoreGameInfoViewCloseStart = function(self)
	self:_hideInfoView();
end

-- infoView 回调 infoView展开显示背景光和改变层次
MoreGameListItem.onMoreGameInfoViewShowEnd = function(self)
	self:_changeInfoView();
	self:_showIconBgLight();
end

-- infoView 回调 infoView收起隐藏背景光和改变层次
MoreGameListItem.onMoreGameInfoViewCloseEnd = function(self)
	self:_hideIconBgLight();
	self:_changeInfoViewBack();
end
-------------------------------------------------------------------------------------
MoreGameListItem._getBaseView = function(self)
	self.m_showView = self.m_root:getChildByName("show_view");

	local downloadGameIcon = self.m_showView:getChildByName("game_icon");
    self.m_undownloadView = downloadGameIcon:getChildByName("undownload_view");
	self.m_downloadingView = downloadGameIcon:getChildByName("downloading_view");
	self.m_downloadProgressLight = self.m_downloadingView:getChildByName("progress_light");
	self.m_gameNameIcon = downloadGameIcon:getChildByName("game_name");
	self.m_onlineNumView = downloadGameIcon:getChildByName("onlineNumView");

	local gameStatusView = downloadGameIcon:getChildByName("gameStatusView");
	self.m_newGamesIcon = gameStatusView:getChildByName("newGamesIcon");

	local progress = self.m_downloadingView:getChildByName("progress");
	local progress_num1 = progress:getChildByName("num_1");
	local progress_num2 = progress:getChildByName("num_2");
	local progress_num3 = progress:getChildByName("num_3");

	local files = {};
	for i =  1,10 do 
		files[i] = num_download_pin_map[string.format("%s.png",i-1)];
	end 
	local imgs1 = UIFactory.createImages(files);	
	progress_num1:addChild(imgs1);
	self.m_subProgress1 = imgs1;

	local imgs2 = UIFactory.createImages(files);	
	progress_num2:addChild(imgs2);
	self.m_subProgress2 = imgs2;

	local imgs3 = UIFactory.createImages(files);	
	progress_num3:addChild(imgs3);
	self.m_subProgress3 = imgs3;

	self.m_infoView = self.m_root:getChildByName("info_view");
	local x, y = self.m_infoView:getPos();
	local w, h = self.m_infoView:getSize();
	self.m_infoView:setClip2(true, 0, 0, w, h);
	
	local iconView = self.m_root:getChildByName("icon_view");
	self.m_iconBgLight = iconView:getChildByName("bg_light");
	self.m_iconNew = iconView:getChildByName("new");
end

MoreGameListItem._initData = function(self,data)
	local url = string.trim(data.icon or "");
	if url ~= "" then 
		ImageCache.getInstance():request(url,self,self._onDownloadGameIcon);
	end

	local urlText = string.trim(data.iconcomming or "");
	if urlText ~= "" then 
		ImageCache.getInstance():request(urlText,self,self._onDownloadGameName);
	end	

	local gameDownloadStatus = data.gameDownloadStatus or MoreGamesDownloadStatus.None;

	self:_showDownloadStatus(gameDownloadStatus);

	if gameDownloadStatus == MoreGamesDownloadStatus.Successed then
		self:_refreshOnlineNums();
	end 

	self:setLevel(data.level);
	self.m_infoView:setAlign(data.isPageEnd and kAlignRight or kAlignLeft);

	local isNew = self:_isNewGame();
	self.m_iconNew:setVisible(isNew);
end

MoreGameListItem._refreshOnlineNums = function(self)
    if self.m_data.game_pkg == "games/private_room" or self.m_data.game_pkg == "games/match_room" 
        or self.m_data.game_pkg == "games/more_games" then
        self.m_onlineNumView:setVisible(false);
        return;
    end

    local isValidPlay = self:_isValidPlay();
    self.m_newGamesIcon:setVisible(not isValidPlay);
    self.m_onlineNumView:setVisible(isValidPlay);

    UserMoneyItem.setFilePath( UserMoneyItem.s_onlineNumFilePath );
    if not self.m_onlineNum then
        self.m_onlineNum = new(UserMoneyItem);
        self.m_onlineNumView:addChild(self.m_onlineNum);
    end

    local num = HallDataInterface.getInstance():getGamePlayerNumsByGameId(self.m_data.id);
    self.m_onlineNum:setMoneyNum(num);
    self.m_onlineNum:setAlign(kAlignRight);

    local w,_ = self.m_onlineNum:getSize();

    local word = self.m_onlineNumView:getChildByName("word");
    local word_w,_ = word:getSize();
    self.m_onlineNumView:setSize(w+word_w+3);

    UserMoneyItem.setFilePath(nil);
end

MoreGameListItem._showDownloadStatus = function(self,status)	
	self.m_undownloadView:setVisible(status == MoreGamesDownloadStatus.None);
	self.m_downloadingView:setVisible(status == MoreGamesDownloadStatus.Downloading);

	if self.m_data.gameDownloadStatus ~= status then 
		MoreGamesDataInterface.getInstance():updateGameDownloadStatus(self.m_data.id,status);
	end 
	self.m_data.gameDownloadStatus = status;
end

MoreGameListItem._isNetWorkAvalible = function(self)
	local isAvalible = NativeEvent.getInstance():getNetWorkAvalible();
	if not isAvalible then 
		local msg = GameString.get("netWorkErrorTips");
		MessageBox.show("",msg, "确认",nil, false);
	end 
	return isAvalible;
end 

-- 后台配置为新游戏并首次打开则视为新游戏
MoreGameListItem._isNewGame = function(self)
	return self.m_data.isnew == 1 and self.m_data.isFirstOpen == 1;
end

MoreGameListItem._isValidPlay = function(self)
    local getGameStatus = HallUpdateConfig.getInstance():getGameStatus(self.m_data.id);
    if getGameStatus == HallGameStatus.CanPlay then
        return true;
    else
        return false;
    end
end

---------------------------- icon 拉取 ---------------------------------
MoreGameListItem._onDownloadGameIcon = function(self,url,imagePath)
	if imagePath then
		local showGameIcon = self.m_showView:getChildByName("game_icon");
		showGameIcon:setFile(imagePath); 
	end
end

MoreGameListItem._onDownloadGameName = function(self,url,imagePath)
	if imagePath then
		self.m_gameNameIcon:setFile(imagePath);
	end
end

---------------------------- 游戏下载框 -------------------------------
MoreGameListItem._showInfoView = function(self)
	if not self.m_moreGameInfoView then
		local moreGameInfoView = require("hall/moreGames/widget/moreGameInfoView");
		self.m_moreGameInfoView = new(moreGameInfoView, self.m_data);
		self.m_moreGameInfoView:setDelegate(self);
		self.m_infoView:addChild(self.m_moreGameInfoView);
	end

	self.m_moreGameInfoView:show();
end

MoreGameListItem._hideInfoView = function(self)
	if self.m_moreGameInfoView then
		EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	end
end


MoreGameListItem._changeInfoView = function(self)
	if self.m_data.isPageEnd then
		self:setLevel(self.m_data.levelPre + 1);
	end
end

MoreGameListItem._changeInfoViewBack = function(self)
	if self.m_data.isPageEnd then
		self:setLevel(self.m_data.level);
	end
end

---------------------------- 绿光 ------------------------------------------
MoreGameListItem._showIconBgLight = function(self)
	self.m_iconBgLight:setVisible(true);
end

MoreGameListItem._hideIconBgLight = function(self)
	self.m_iconBgLight:setVisible(false);
end

----------------------------------- 下载逻辑 --------------------------------------------------
--开始下载
MoreGameListItem._startDownloadGame = function(self)
	if not self:_isNetWorkAvalible() then 
		return;
	end 
	self:_updateProgress(0);
	self:_showDownloadStatus(MoreGamesDownloadStatus.Downloading);

	self:_registDownloadEvent();
	self:_dispatchHandleEvent(MoreGameListItem.s_handleEvent.StartDownload);
end

--取消下载
MoreGameListItem._cancleDownloadGame = function(self)
	self:_showDownloadStatus(MoreGamesDownloadStatus.None);

	self:_unregistDownloadEvent();
	self:_dispatchHandleEvent(MoreGameListItem.s_handleEvent.CancleDownload);
end

MoreGameListItem._updateProgress = function(self,progress)
	progress = tonumber(progress) or 0 ;

	Log.d("MoreGameListItem._updateProgress", "progress", progress);

	local num1 = math.floor(progress/100);
	local num2 = math.floor(progress%100/10);
	local num3 = progress%10;

	Log.d("MoreGameListItem._updateProgress", "num1", num1, "num2", num2, "num3", num3);

	if num1 > 0 then
		self.m_subProgress1:setImageIndex(num1);
		self.m_subProgress1:setVisible(true);
	else
		self.m_subProgress1:setVisible(false);
	end

	if num1 > 0 or num2 > 0 then
		self.m_subProgress2:setImageIndex(num2);
		self.m_subProgress2:setVisible(true);
	else
		self.m_subProgress2:setVisible(false);
	end

	self.m_subProgress3:setImageIndex(num3);
	
	local w, h = self.m_downloadProgressLight:getSize();
	self.m_downloadProgressLight:setClip2(true, 0,0, w * progress / 100, h);

end

MoreGameListItem._showDownloadResult = function(self,isSuccess)
	if isSuccess then
		self:_showDownloadStatus(MoreGamesDownloadStatus.Successed);
		self:_refreshOnlineNums();
	else
		self:_cancleDownloadGame();
	end
end

----------------------------------- 下载事件 -------------------------------------------------------
MoreGameListItem._dispatchHandleEvent = function(self,event)
	EventDispatcher.getInstance():dispatch(MoreGameListItem.s_moreGameHandleEvent,event,self.m_data);
end	

MoreGameListItem._registDownloadEvent = function(self)
	EventDispatcher.getInstance():register(MoreGameListItem.s_moreGamesDownloadResult,self,self._onDownloadResultListener);
    EventDispatcher.getInstance():register(MoreGameListItem.s_moreGamesDownloadProgress,self,self._onDownloadProgressListener);
end

MoreGameListItem._unregistDownloadEvent = function(self)
	EventDispatcher.getInstance():unregister(MoreGameListItem.s_moreGamesDownloadResult,self,self._onDownloadResultListener);
    EventDispatcher.getInstance():unregister(MoreGameListItem.s_moreGamesDownloadProgress,self,self._onDownloadProgressListener);
end

MoreGameListItem._onDownloadResultListener = function(self,data,isSuccess)	
	if data and data.id and (self.m_data.id == data.id) then
		self:_showDownloadResult(isSuccess);	
	end
end

MoreGameListItem._onDownloadProgressListener = function(self,data,progress)
	if data and  data.id and self.m_data.id == data.id then
		self:_updateProgress(progress);
	end
end

return MoreGameListItem;