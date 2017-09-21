require("isolater/interface/hallImageRefIsolater");
require("isolater/interface/regionConfigIsolater");

local viewBase = Import("games/common2/module/viewBase");

local JiFenRecordView = class(viewBase,false);

JiFenRecordView.VIEW_TYPE_RECORD = 1;
JiFenRecordView.VIEW_TYPE_OVER = 2;

JiFenRecordView.s_controls = {
	contentViewRecord = ToolKit.getIndex();
	contentViewOver = ToolKit.getIndex();

	-- 玩牌记录
	recordCloseBtn = ToolKit.getIndex();
	recordEmptyTips = ToolKit.getIndex();
	recordInfo = ToolKit.getIndex();
	recordTitleView = ToolKit.getIndex();

	-- 本局结算
	overCloseBtn = ToolKit.getIndex();
	overInfo = ToolKit.getIndex();
	overTitleView = ToolKit.getIndex();
	overBtnView = ToolKit.getIndex();
	overSavedBtn = ToolKit.getIndex();
	overContinueBtn = ToolKit.getIndex();
	overContinueName = ToolKit.getIndex();
	overGameInfo = ToolKit.getIndex();
	overGameInfoText = ToolKit.getIndex();
	overGameInfoQrCode = ToolKit.getIndex();
	overContentView = ToolKit.getIndex();
	overShareView = ToolKit.getIndex();
};

JiFenRecordView.ctor = function(self,seat,layoutConfig)
	super(self,layoutConfig);
	self.m_seat = seat;
	self.m_ctrls = JiFenRecordView.s_controls;
	self:setFillParent(true,true);
	self:setEventTouch(self, self.onTouchBg);
    self:setEventDrag(self, self.onEmpty);
	self:initView();

	self:setVisible(false);

end

JiFenRecordView.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
	self:_stopDelayAnim();
	self:_stopWaitGameOverContinueTimer();

	delete(self.m_shareView);
	self.m_shareView = nil;
end

JiFenRecordView.parseConfig = function(self,config)
	config = table.verify(config);
	self.m_showRecordView = config.showRecordView;
	self.m_showOverView = config.showOverView;
end

JiFenRecordView.initView = function(self)
	local contentViewRecord = self:findViewById(self.s_controls.contentViewRecord);
	local contentViewOver = self:findViewById(self.s_controls.contentViewOver);
	contentViewRecord:setEventTouch(self, self.onEmpty);
	contentViewOver:setEventTouch(self, self.onEmpty);
end
------------------------------------------------------------------
JiFenRecordView.onCloseBtnClick = function(self)
	local action = self.m_curShowViewIndex == JiFenRecordView.VIEW_TYPE_RECORD and 
		kPrivateJiFenCloseRecord or kPrivateJiFenCloseGameOver;
	ReportIsolater.getInstance():report(action, true, true);

	-- self:_stopWaitGameOverContinueTimer();--界面关闭，等待继续的倒计时仍然计数

	self:hide();
end

JiFenRecordView.onRecordConfirmBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenRecordConfirm, true, true);

	self:hide();
end

JiFenRecordView.onGameOverSavedBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenGameOverSaved, true, true);

	self:_startDelayAnim(self._handleSaveScreenShot);
end

JiFenRecordView.onGameOverContinueBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenGameOverContinue, true, true);
	self:hide();

	self:_stopWaitGameOverContinueTimer();

	local action = GameMechineConfig.ACTION_NS_PLAYAGAIN;
	MechineManage.getInstance():receiveAction(action);
end

JiFenRecordView.onEmpty = function(self)
end

JiFenRecordView.onTouchBg = function(self,finger_action,x,y,drawing_id_first,drawing_id_current, event_time)
	if finger_action == kFingerUp then
		if self.m_curShowViewIndex and self.m_curShowViewIndex == JiFenRecordView.VIEW_TYPE_RECORD then
			self:onCloseBtnClick();
		end
	end
end

JiFenRecordView.hide = function(self)
	DialogLogic.getInstance():popDialogStack();

	self.m_curShowViewIndex = nil;
	self:setVisible(false);
end
------------------------------------------------------------------
JiFenRecordView._startDelayAnim = function(self,callFunc)
	self:_readyForTakeScreen();

	self:_stopDelayAnim();

	self.m_delayAnim = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 1000, 0);
	self.m_delayAnim:setDebugName("JiFenRecordView|_startDelayAnim|delayAnim");
	self.m_delayAnim:setEvent(self, callFunc);
end

JiFenRecordView._stopDelayAnim = function(self)
	delete(self.m_delayAnim);
	self.m_delayAnim = nil;
end

JiFenRecordView._handleSaveScreenShot = function(self)
	local savePath = string.format("%scapture_jifen_%s.jpg", System.getStorageImagePath(), os.time());

	local contentView = self:findViewById(self.m_ctrls.overContentView);
	local shareView = self:findViewById(self.m_ctrls.overShareView);
	local pos = contentView:getWidget():to_world(Point(0,0));
	local width, height = self:getRealSize();
	local w, h = contentView:getRealSize();

	local drawingList = {contentView, shareView};
	System.offscreenRenderWithDrawingList(drawingList, width, height, pos.x, pos.y, w, h, savePath);

	WeiXinIsolater.getInstance():saveImageToPhotoAlbum(savePath, nil);
end

JiFenRecordView._readyForTakeScreen = function(self)
	local text = self:findViewById(self.m_ctrls.overGameInfoText);	
	local textStr = string.format("%s · %s %s", RegionConfigIsolater.getInstance():getRegionProductName(),
		self.m_showRecordData.gameName or "", os.date("%y年%m月%d日 %H:%M:%S",os.time()));
	text:setText(textStr);


end

JiFenRecordView._afterTakeScreen = function(self)

end

------------------------------------------------------------------

JiFenRecordView.showPlayRecordView = function(self,seat, uid, info, isFast)
	if not self.m_showRecordView then 
		return;
	end

	DialogLogic.getInstance():pushDialogStack(self,self.hide);

	self:_showViews(JiFenRecordView.VIEW_TYPE_RECORD);
	self:_refreshDatasRecord(self.m_recordData);

	self:setVisible(true);
end

JiFenRecordView.showGameOverView = function(self,seat, uid, info, isFast)
	if not self.m_showOverView then 
		return;
	end

	DialogLogic.getInstance():pushDialogStack(self,self.hide);
	
	self:_showViews(JiFenRecordView.VIEW_TYPE_OVER);
	self:_refreshDatasOver(info);

	self:_startWaitGameOverContinueTimer();

	self:setVisible(true);
end

JiFenRecordView.showFinishedView = function(self,seat, uid, info, isFast)
	self:_stopWaitGameOverContinueTimer();

	if self:getVisible() then 
		self:hide();
	end 
end

JiFenRecordView.onReceiveJiFenPlayRecord = function(self,seat, uid, info, isFast)
	self.m_recordData = table.verify(info);

	local state = self.m_recordData.state;
	if state and state == 3 then
		self:_getPlayerList();
	end
end

JiFenRecordView.onReceiveJiFenContinuePlay = function(self)
	self.m_isJiFenFinishedContinue = true;
end

JiFenRecordView.onSaveImageToPhotoAlbumCallBack = function(self,seat, uid, info, isFast)
	self:_afterTakeScreen();

	info = table.verify(info);
	if info.isSuccess then 
		Toast.getInstance():showText("截图已存至相册",50,30,kAlignLeft,"",24,200,175,110);
	end 
end

JiFenRecordView.onGameStart = function(self)
	self:_getPlayerList();
	
	if self.m_isJiFenFinishedContinue then 
		self.m_recordData = nil;
		self:_refreshDatasRecord({});
	end 

	self.m_isJiFenFinishedContinue = nil;
	self:hide();
end

JiFenRecordView.onUserReady = function(self)
	self:_stopWaitGameOverContinueTimer();
end

------------------------------------------------------------------
JiFenRecordView._startWaitGameOverContinueTimer = function(self)
	local remainTime = 14;
	self:_showWaitGameOverContinueTimer(remainTime);

	self:_stopWaitGameOverContinueTimer();

	self.m_waitGameOverContinueTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 1000, 0);
	self.m_waitGameOverContinueTimer:setDebugName("JiFenRecordView|_startWaitGameOverContinueTimer|waitGameOverContinueTimer");
	self.m_waitGameOverContinueTimer:setEvent(self, function(self)
		remainTime = remainTime - 1;
		if remainTime >= 0 then 
			self:_showWaitGameOverContinueTimer(remainTime);
		else 
			self:_stopWaitGameOverContinueTimer();
			self:onGameOverContinueBtnClick();
		end 
	end);
end

JiFenRecordView._stopWaitGameOverContinueTimer = function(self)
	delete(self.m_waitGameOverContinueTimer);
	self.m_waitGameOverContinueTimer = nil;
end

JiFenRecordView._showWaitGameOverContinueTimer = function(self,remainTime)
	remainTime = tonumber(remainTime) or -1;
	local remainTimeStr = remainTime >= 0 and string.format("(%s)",remainTime) or "";

	local overContinueName = self:findViewById(self.m_ctrls.overContinueName);
	overContinueName:setText("下一局"..remainTimeStr);
end

JiFenRecordView._showViews = function(self,viewIndex)
	self.m_curShowViewIndex = viewIndex;

	local contentViewRecord = self:findViewById(self.s_controls.contentViewRecord);
	local contentViewOver = self:findViewById(self.s_controls.contentViewOver);

	if viewIndex == JiFenRecordView.VIEW_TYPE_OVER then
		contentViewRecord:setVisible(false);
		contentViewOver:setVisible(true);
	else
		contentViewRecord:setVisible(true);
		contentViewOver:setVisible(false);
	end
end

JiFenRecordView._refreshDatasRecord = function(self,data)
	data = table.verify(data);

	local curJu = data.roundsCurrent or 0;

	if curJu == 0 then
		self:_refreshRecord({});
	else
		self:_refreshRecord(self:_analyseDataRecord(data) or {});
	end
end

JiFenRecordView._refreshDatasOver = function(self,data)
	data = table.verify(data);
	local curJu = data.roundsCurrent or 0;

	if curJu == 0 then
		self:_refreshRecord({});
	else
		self:_refreshRecord(self:_analyseDataOver(data));
	end
end

JiFenRecordView._refreshRecord = function(self,data)
	data = table.verify(data);

	local recordEmptyTips = self:findViewById(self.m_ctrls.recordEmptyTips);
	local recordInfo = self:findViewById(self.m_ctrls.recordInfo);
	local overInfo = self:findViewById(self.m_ctrls.overInfo);

	if table.isEmpty(data) then 
		recordEmptyTips:setVisible(true);
		recordInfo:setVisible(false);
		overInfo:setVisible(false);
	else
		recordEmptyTips:setVisible(false);

		self.m_showRecordData = data;

		if self.m_curShowViewIndex == JiFenRecordView.VIEW_TYPE_OVER then
			overInfo:setVisible(true);
			self:_initListViewOver();
		else
			recordInfo:setVisible(true);
			self:_initListViewRecord();
		end
	end 
end

JiFenRecordView._initListViewRecord = function(self)
	self:_initListViewConfigRecord();
	self.m_showRecordData.data = self:_sortDataBySeat(self.m_showRecordData.data);
	self:_initListViewPlayerList(self.m_showRecordData.data);
	self:_initListViewRecordList(self:_operateData(self.m_showRecordData));
end

JiFenRecordView._initListViewOver = function(self)
	self:_initListViewConfigOver();
	self:_initListViewOverList(self:_sortDataByScore(self.m_showRecordData.data), self.m_showRecordData.roundsCurrent, self.m_showRecordData.roundsTotal);
end

------------------------------------------------------------------------------------------------
JiFenRecordView._initListViewConfigRecord = function(self)
	local titleView = self:findViewById(self.s_controls.recordTitleView);
	local contentView = self:findViewById(self.s_controls.recordInfo);

	local scoreSize = self.m_showRecordData.roundsCurrent + 1;
	
	local listViewWidth, listViewHeight = contentView:getSize();
	local _, titleHeight = titleView:getSize();
	
	local scaleTag = 0.05;
	local scaleHead = 0.10;
	local scaleName = 0.20;
	local scaleScore = 0.15;

	local limit = 3.5;
	local limitListSize = 7;
	local hasScrollbar = scoreSize >= limit;
	local scoreListSize = hasScrollbar and limit or scoreSize;
	local sizeTotal = scaleTag + scaleHead + scaleName + scaleScore * scoreListSize;
	local tagWidth = scaleTag / sizeTotal * listViewWidth;
	local headWidth = scaleHead / sizeTotal * listViewWidth;
	local nameWidth = scaleName / sizeTotal * listViewWidth;
	local scoreWidth = scaleScore / sizeTotal * listViewWidth;
	local scoreListWidth = scoreWidth * scoreListSize;
	
	local itemHeight = (listViewHeight - titleHeight) / limitListSize;
	self.m_configPlayerList = {
		width = tagWidth + headWidth + nameWidth,
		height = listViewHeight,
		widthList = {
			tagWidth,
			headWidth,
			nameWidth,
		},
		heightTitle = titleHeight,
		heightItem = itemHeight,
	};
	
	self.m_configRecordList = {
		width = scoreListWidth,
		height = listViewHeight,
		widthItem = scoreWidth,
		heightTitle = titleHeight,
		heightItem = itemHeight,
		hasScrollbar = hasScrollbar,
	};
end

JiFenRecordView._initListViewPlayerList = function(self, data)
	local contentView = self:findViewById(self.m_ctrls.recordInfo);
	local bg = contentView:getChildByName("bg");
	contentView:removeChild(bg);
	contentView:removeAllChildren(true);
	contentView:addChild(bg);
	local node = UIFactory.createNode();
	node:setSize(self.m_configPlayerList.width, self.m_configPlayerList.height);
	contentView:addChild(node);

	local text = {"", "", "玩家"};
	local posX = 0;
	for k, v in ipairs(self.m_configPlayerList.widthList) do
		if not string.isEmpty(text[k]) then
			local text = UIFactory.createText(text[k], 28, v, self.m_configPlayerList.heightTitle, kAlignCenter, 143, 92, 31);
			text:setPos(posX)
			node:addChild(text);
		end
		posX = posX + v;
	end

	local posY = self.m_configPlayerList.heightTitle;
	for k, v in ipairs(data) do
		local playerItem = Import("games/common2/module/jifen/jifenRecord/jifenRecordItemPlayer");
		local item = new(playerItem, v, self.m_configPlayerList.widthList);
		item:setSize(self.m_configPlayerList.width, self.m_configPlayerList.heightItem);
		item:setPos(nil, posY);
		node:addChild(item);

		if k ~= 1 then
			local line = UIFactory.createImage("isolater/content_line.png");
			line:setPos(nil, posY);
			line:setSize(self.m_configPlayerList.width + self.m_configRecordList.width);
			node:addChild(line);
		end
		posY = posY + self.m_configPlayerList.heightItem;
	end
end

JiFenRecordView._initListViewRecordList = function(self, data)
    local contentView = self:findViewById(self.m_ctrls.recordInfo);
	local listView = UIFactory.createListView(self.m_configPlayerList.width, nil, self.m_configRecordList.width, self.m_configRecordList.height);
	listView:setDirection(kHorizontal);
	contentView:addChild(listView);

	local listItem = Import("games/common2/module/jifen/jifenRecord/jifenRecordItemRecord");
	listItem.setConfig(self.m_configRecordList);
	local adapter = UIFactory.createCacheAdapter(listItem, data);
	listView:setAdapter(adapter);

	listView:setPickable(self.m_configRecordList.hasScrollbar);
	if not self.m_configRecordList.hasScrollbar then
		listView:setScrollBarWidth(0);
	end
end

------------------------------------------------------------------------------
JiFenRecordView._initListViewConfigOver = function(self)
	local titleView = self:findViewById(self.s_controls.overTitleView);
	local contentView = self:findViewById(self.s_controls.overInfo);

	local scoreSize = self.m_showRecordData.roundsCurrent;
	
	local listViewWidth, listViewHeight = contentView:getSize();
	local _, titleHeight = titleView:getSize();
	
	local scaleTag = 0.10;
	local scaleHead = 0.10;
	local scaleName = 0.30;
	local scaleScore = 0.3;

	local sizeTotal = scaleTag + scaleHead + scaleName + scaleScore * 2;
	local tagWidth = scaleTag / sizeTotal * listViewWidth;
	local headWidth = scaleHead / sizeTotal * listViewWidth;
	local nameWidth = scaleName / sizeTotal * listViewWidth;
	local scoreWidth = scaleScore / sizeTotal * listViewWidth;
	
	self.m_configOverList = {
		width = tagWidth + headWidth + nameWidth + scoreWidth * 2,
		height = listViewHeight,
		widthList = {
			tagWidth,
			headWidth,
			nameWidth,
			scoreWidth,
			scoreWidth,
		},
		heightTitle = titleHeight,
		heightItem = 65,
	};
end	


JiFenRecordView._initListViewOverList = function(self, data, roundsCurrent, roundsTotal)
	local contentView = self:findViewById(self.m_ctrls.overInfo);
	contentView:removeAllChildren(true);

	local space = 2;
	local node = UIFactory.createScrollView(nil, self.m_configOverList.heightTitle + space, 
		self.m_configOverList.width, self.m_configOverList.height - self.m_configOverList.heightTitle - space * 2, true);
	contentView:addChild(node);

	local text = {"", "", "玩家", "总成绩", string.format("%s/%s局", roundsCurrent or "", roundsTotal or "")};
	local posX = 0;
	for k, v in ipairs(self.m_configOverList.widthList) do
		if not string.isEmpty(text[k]) then
			local text = UIFactory.createText(text[k], 28, v, self.m_configOverList.heightTitle, kAlignCenter, 143, 92, 31);
			text:setPos(posX)
			contentView:addChild(text);
		end
		posX = posX + v;
	end

	local posY = self.m_configOverList.heightTitle;
	for k, v in ipairs(data) do
		local playerItem = Import("games/common2/module/jifen/jifenRecord/jifenRecordItem");
		local item = new(playerItem, v, k, self.m_configOverList.widthList);
		item:setSize(self.m_configOverList.width, self.m_configOverList.heightItem);
		item:setPos(nil, posY);
		node:addChild(item);

		posY = posY + self.m_configOverList.heightItem;
	end
end

---------------------------------------------------------------------
JiFenRecordView._sortDataBySeat = function(self, data)
	local tmp = {};
	local maxNum = 0;
	for k, v in pairs(table.verify(data)) do
		v.isWiner = false;
		if v.propNum > maxNum then
			maxNum = v.propNum;
		end
		tmp[v.mid] = v;
	end

    if table.isEmpty(self.m_playerInfo) then
        self:_getPlayerList();
    end

	local players = table.verify(self.m_playerInfo);

	local result = {};
	for k, v in pairs(players) do
		if v then
			local mid = v:getMid();
			local info = tmp[mid];
			if info then
				table.insert(result, info);
			end
		end
	end

	for k, v in ipairs(result) do
		if v.propNum == maxNum and maxNum > 0 then
			v.isWiner = true;
			break;
		end
	end
	return result;
end

JiFenRecordView._sortDataByScore = function(self, data)
	local tmp = table.verify(data);
	table.sort(tmp, function(a, b)
		if not table.isEmpty(a) and not table.isEmpty(b) then
			local aValue = number.valueOf(a.propNum);
			local bValue = number.valueOf(b.propNum);
			return aValue > bValue;
		else
			return false;
		end
	end);

	return tmp;
end

JiFenRecordView._operateData = function(self, data)
	local tmp = {};

	local propList = {}
	for k, v in ipairs(data.data) do
		local mid = v.mid;
		local propNum = v.propNum;
		table.insert(propList, {mid = mid, propNum = propNum});
	end

	local propItem = {
		title = "总成绩",
		propList = propList,
	}
	table.insert(tmp, propItem);

	local roundsTotal = data.roundsTotal;
	local roundsCurrent = data.roundsCurrent;
	for i = roundsCurrent, 1, -1 do
		local list = {};
		for k, v in ipairs(data.data) do
			local mid = v.mid;
			local propList = v.propList;
			table.insert(list, {mid = mid, propNum = propList[i]});
		end

		local item = {
			title = string.format("%s/%s局", i, roundsTotal);
			propList = list,
		}
		table.insert(tmp, item);
	end

	return tmp;
end


JiFenRecordView._analyseDataOver = function(self, data)
	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local info = {
		gameId = gameId,
		gameName = GameInfoIsolater.getInstance():getGameName(gameId),
		roundsTotal = data.roundsTotal,
		roundsCurrent = data.roundsCurrent,
		data = {},		
	}

	for k, v in pairs(data.recordList) do
		if v.userId then 
			local player = self:_getPlayerByMid(v.userId);
			if player then 
				local roundsCount = v.roundsCount;
				local propNum = v.list[roundsCount].currscore;
				local item = {
					mid = v.userId,
					nick = player:getNick(),
					sex = player:getSex(),
					icon = player:getAvatar(),
					propNum = propNum,
					propList = {},
				}

				for i = 1, roundsCount do
					item.propList[i] = v.list[i].wlscore;
				end

				table.insert(info.data, item);
				info.roundsCurrent = roundsCount;
			end
		end
	end
    return info;
end

JiFenRecordView._analyseDataRecord = function(self, data)
	if table.isEmpty(data) then
		return {};
	end

	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local info = {
		gameId = gameId,
		gameName = GameInfoIsolater.getInstance():getGameName(gameId),
		roundsTotal = data.roundsTotal,
		roundsCurrent = data.roundsCurrent,
		data = {},		
	}

	for k, v in pairs(data.recordList) do
		if v.userId then 
			local player = self:_getPlayerByMid(v.userId);
			if player then 
				local roundsCount = v.roundsCount;
				local propNum = v.list[roundsCount].currscore;
				local item = {
					mid = v.userId,
					nick = player:getNick(),
					sex = player:getSex(),
					icon = player:getAvatar(),
					propNum = propNum,
					propList = {},
				}

				for i = 1, roundsCount do
					item.propList[i] = v.list[i].wlscore;
				end

				table.insert(info.data, item);
				info.roundsCurrent = roundsCount;
			end
		end
	end
    return info;
end

JiFenRecordView._getPlayerByMid = function(self, mid)
	if table.isEmpty(self.m_playerInfo) then
		self.m_playerInfo = GamePlayerManager2.getInstance():getAllPlayer();
	end

	for k,v in pairs(table.verify(self.m_playerInfo)) do
		if v and v:getMid() == mid then
			return Copy(v);
		end
	end
end

JiFenRecordView._getPlayerList = function(self)
	self.m_playerInfo = GamePlayerManager2.getInstance():getAllPlayer();
end

------------------------------------------------------------------
JiFenRecordView.s_controlConfig = 
{	
	[JiFenRecordView.s_controls.contentViewOver]		= {"contentViewOver"};
	[JiFenRecordView.s_controls.contentViewRecord]		= {"contentViewRecord"};

	[JiFenRecordView.s_controls.recordCloseBtn]			= {"contentViewRecord","closeBtn"};
	[JiFenRecordView.s_controls.recordEmptyTips]		= {"contentViewRecord","recordView","recordEmptyTips"};
	[JiFenRecordView.s_controls.recordInfo]				= {"contentViewRecord","recordView","recordInfo"};
	[JiFenRecordView.s_controls.recordTitleView]		= {"contentViewRecord", "recordView", "titleView"};

	[JiFenRecordView.s_controls.overCloseBtn]				= {"contentViewOver", "closeBtn"};
	[JiFenRecordView.s_controls.overInfo]					= {"contentViewOver", "contentView", "overView", "overInfo"};
	[JiFenRecordView.s_controls.overTitleView]				= {"contentViewOver", "contentView", "overView", "titleView"};
	[JiFenRecordView.s_controls.overSavedBtn]				= {"contentViewOver", "btnView", "saveBtn"};
	[JiFenRecordView.s_controls.overContinueBtn]			= {"contentViewOver", "btnView", "playAgainBtn"};
	[JiFenRecordView.s_controls.overContinueName]			= {"contentViewOver", "btnView", "playAgainBtn", "text"};
	[JiFenRecordView.s_controls.overBtnView]				= {"contentViewOver", "btnView"};
	[JiFenRecordView.s_controls.overGameInfo]				= {"contentViewOver", "shareView", "gameInfo"};
	[JiFenRecordView.s_controls.overGameInfoText]			= {"contentViewOver", "shareView", "gameInfo", "text"};
	[JiFenRecordView.s_controls.overGameInfoQrCode]			= {"contentViewOver", "shareView", "qrCode"};
	[JiFenRecordView.s_controls.overContentView]			= {"contentViewOver", "contentView"};
	[JiFenRecordView.s_controls.overShareView]				= {"contentViewOver", "shareView"};
};

JiFenRecordView.s_controlFuncMap =
{
	[JiFenRecordView.s_controls.recordCloseBtn]				= JiFenRecordView.onCloseBtnClick;
	[JiFenRecordView.s_controls.overCloseBtn]				= JiFenRecordView.onCloseBtnClick;
	[JiFenRecordView.s_controls.overSavedBtn]				= JiFenRecordView.onGameOverSavedBtnClick;
	[JiFenRecordView.s_controls.overContinueBtn]			= JiFenRecordView.onGameOverContinueBtnClick;
};


JiFenRecordView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_JIFEN_RECORD_CLICK]	 			= "showPlayRecordView";
	[GameMechineConfig.ACTION_JIFEN_GAMEOVER]						= "showGameOverView";
	[GameMechineConfig.ACTION_NS_RECEIVE_JIFEM_RECORD]				= "onReceiveJiFenPlayRecord";
	[GameMechineConfig.ACTION_JIFEN_FINISHED]						= "showFinishedView";
	[GameMechineConfig.ACTION_NS_JIFEN_CONTINUE_PLAY]				= "onReceiveJiFenContinuePlay";

	[GameMechineConfig.ACTION_NS_SAVEIMAGE_TO_PHOTOALBUM__CALLBACK] = "onSaveImageToPhotoAlbumCallBack";
};

JiFenRecordView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_READY]						= "onUserReady";
	[GameMechineConfig.STATUS_START]						= "onGameStart";
};

return JiFenRecordView;