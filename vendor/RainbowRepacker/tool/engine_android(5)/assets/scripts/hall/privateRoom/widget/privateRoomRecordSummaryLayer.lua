require("uilibs/richText");

local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")
-- 玩牌结算
local PrivateRoomRecordSummaryLayer = class(CommonGameLayer, false);

PrivateRoomRecordSummaryLayer.Delegate = {
	onRecordSummaryLayerClose = "onRecordSummaryLayerClose";
	onRecordSummaryLayerScreenShot = "onRecordSummaryLayerScreenShot";
	onRecordSummaryLayerShare = "onRecordSummaryLayerShare";
	onRecordSummaryLayerPlayAgain = "onRecordSummaryLayerPlayAgain";
}


PrivateRoomRecordSummaryLayer.s_controls = {
	background = ToolKit.getIndex(),
	closeBtn = ToolKit.getIndex(),
	shareBtn = ToolKit.getIndex(),
	screenShotBtn = ToolKit.getIndex(),
	playAgainBtn = ToolKit.getIndex(),
	gameNameView = ToolKit.getIndex(),
	gameName = ToolKit.getIndex(),
	regionName = ToolKit.getIndex(),
	roundsView = ToolKit.getIndex(),
	timeTop = ToolKit.getIndex(),
	timeBottom = ToolKit.getIndex(),
	contentView = ToolKit.getIndex(),
	btnView = ToolKit.getIndex(),
	titleView = ToolKit.getIndex(),
	shotView = ToolKit.getIndex(),
}

PrivateRoomRecordSummaryLayer.s_cmd = {
	
}

PrivateRoomRecordSummaryLayer.ctor = function(self, data)
	local privateRoomRecordSummaryLayout = require(ViewPath.."hall/privateRoom/privateRoomRecordSummaryLayout");
	super(self, privateRoomRecordSummaryLayout);
	self:setFillParent(true, true);
	self:setEventTouch(self, function() end);
    self:setEventDrag(self, function() end);

	local blur = require('libEffect.shaders.blurWidget')
	self.m_blurImg = blur.createBlurWidget(nil,{onRoot = true, intensity = 5})

	local background = self:findViewById(self.s_controls.background);
	background:getWidget():add(self.m_blurImg);

	self.m_data = data;
    self.m_data.data = self:_sortData(self.m_data.data);
	self:_initView();

	WeixinShareUtil.getInstance():setObserver(self);
end

PrivateRoomRecordSummaryLayer.dtor = function(self)
	WeixinShareUtil.getInstance():clearObserver(self);

	if self.m_blurImg then
		self.m_blurImg:remove_from_parent();
		self.m_blurImg = nil;
	end
	
	if self.m_shareLayer then
		delete(self.m_shareLayer);
		self.m_shareLayer = nil;
	end

	self:_stopDelayAnim();
end

PrivateRoomRecordSummaryLayer.setPlayAgain = function(self, playAgain)
	self.m_playAgain = playAgain;
	self:_initBtnView();
end

PrivateRoomRecordSummaryLayer.onCloseBtnClick = function(self)
	self:_report(UBConfig.kPrivateJiFenCloseFinish);
	self:execDelegate(PrivateRoomRecordSummaryLayer.Delegate.onRecordSummaryLayerClose);
end

PrivateRoomRecordSummaryLayer.onShareBtnClick = function(self)
	self:_report(UBConfig.kPrivateJiFenFinishWeiChat);
	local path = System.offscreenRender(self.m_shareLayer);
	if not string.isEmpty(path) then
		Clock.instance():schedule_once(function()
			WeixinShareUtil.getInstance():weixinSendImage(path, false);
		end);
	end

	self:execDelegate(PrivateRoomRecordSummaryLayer.Delegate.onRecordSummaryLayerShare);
end

PrivateRoomRecordSummaryLayer.onScreenShotBtnClick = function(self)
	self:_report(UBConfig.kPrivateJiFenFinishSave);
	self:_startDelayAnim(self._handleSaveScreenShot);

	self:execDelegate(PrivateRoomRecordSummaryLayer.Delegate.onRecordSummaryLayerScreenShot);
end

PrivateRoomRecordSummaryLayer.onPlayAgainBtnClick = function(self)
	self:_report(UBConfig.kPrivateJiFenFinishContinue);
	self:execDelegate(PrivateRoomRecordSummaryLayer.Delegate.onRecordSummaryLayerPlayAgain);
end

--------------------------------------------------------------------------------------------
PrivateRoomRecordSummaryLayer._initView = function(self)
	self.m_shareLayer = PrivateRoomDataInterface.getInstance():createRecordShareLayer(self.m_data);

	self:_initContentView();
	self:_initRegionView();
	self:_initGameView();
	self:_initRoundsView();
	self:_initTimeView();
	self:_initListView();
	self:_initBtnView();
end

PrivateRoomRecordSummaryLayer._initBtnView = function(self)
	local screenShotBtn = self:findViewById(self.s_controls.screenShotBtn);
	local shareBtn = self:findViewById(self.s_controls.shareBtn);
	local playAgainBtn = self:findViewById(self.s_controls.playAgainBtn);
	if self.m_playAgain then
		screenShotBtn:setPos(-340);
		shareBtn:setPos(0)
		playAgainBtn:setPos(340);
		playAgainBtn:setVisible(true);
	else
		screenShotBtn:setPos(-240);
		shareBtn:setPos(240)
		playAgainBtn:setVisible(false);
	end
end

PrivateRoomRecordSummaryLayer._initRegionView = function(self)
	local regionName = self:findViewById(self.s_controls.regionName);
	if regionName and regionName.m_res then
		local wRes = regionName.m_res:getWidth();
		local hRes = regionName.m_res:getHeight();
		local _, h = regionName:getSize();
		regionName:setSize(wRes * h / hRes, h)
	end
end

PrivateRoomRecordSummaryLayer._initGameView = function(self)
	local gameNameView = self:findViewById(self.s_controls.gameNameView);
	local gameName = self:findViewById(self.s_controls.gameName);

	gameName:setText(self.m_data.gameName, 1);

	local w, _ = gameName:getSize();
	local space = 10;
	gameNameView:setSize(w + space*2);
end

PrivateRoomRecordSummaryLayer._initRoundsView = function(self)
	local roundsView = self:findViewById(self.s_controls.roundsView);
	local roomName = PrivateRoomConstant.ROOM_NAME_MAP[self.m_data.propType] or "";
	local str = string.format("#cfee5b7%s#c59c5ee%s#cfee5b7次对局", roomName, self.m_data.roundsCurrent)
	local text = new(RichText, str, 30, 30, kAlignCenter, nil, 30);
	text:setAlign(kAlignCenter);
	roundsView:addChild(text);
end

PrivateRoomRecordSummaryLayer._initTimeView = function(self)
	local timeTop = self:findViewById(self.s_controls.timeTop);
	local timpBottom = self:findViewById(self.s_controls.timeBottom);
	timeTop:setText(os.date("%m月%d日", self.m_data.time));
	timpBottom:setText(os.date("%H:%M", self.m_data.time));
end

-- 适配分辨率
PrivateRoomRecordSummaryLayer._initContentView = function(self)
	local screenWidth = System.getScreenScaleWidth();
	local screenHeight = System.getScreenScaleHeight();
	local newY = screenHeight * 95 / 720;
	local contentView = self:findViewById(self.s_controls.contentView);
	local fillRegion, topLeftX, topLeftY, bottomRightX, bottomRightY = contentView:getFillRegion();
	contentView:setFillRegion(fillRegion, topLeftX, topLeftY, bottomRightX, newY)
	local btnView = self:findViewById(self.s_controls.btnView);
	btnView:setSize(nil, newY);

	local shotView = self:findViewById(self.s_controls.shotView);
	shotView:setSize(screenWidth, screenHeight - newY);
end

PrivateRoomRecordSummaryLayer._initListView = function(self)
	self:_initListViewConfig();
	self:_initListViewPlayerList();
	self:_initListViewRecordList();
end

PrivateRoomRecordSummaryLayer._initListViewConfig = function(self)
	local titleView = self:findViewById(self.s_controls.titleView);
	local contentView = self:findViewById(self.s_controls.contentView);

	local scoreSize = self.m_data.roundsCurrent;
	
	local fillRegion, topLeftX, topLeftY, bottomRightX, bottomRightY = contentView:getFillRegion();
	local screenWidth = System.getScreenScaleWidth();
	local screenHeight = System.getScreenScaleHeight();
	
	local listViewWidth = screenWidth - topLeftX - bottomRightX;
	local listViewHeight = screenHeight - topLeftY - bottomRightY;
	local _, titleHeight = titleView:getSize();
	
	local scaleTag = 0.05;
	local scaleHead = 0.10;
	local scaleName = 0.20;
	local scaleScore = 0.10;

	local limit = 5;
	local limitListSize = 7;
	local hasScrollbar = scoreSize >= limit;
	local scoreListSize = hasScrollbar and limit or scoreSize;
	local sizeTotal = scaleTag + scaleHead + scaleName + scaleScore + scaleScore * scoreListSize;
	local tagWidth = scaleTag / sizeTotal * listViewWidth;
	local headWidth = scaleHead / sizeTotal * listViewWidth;
	local nameWidth = scaleName / sizeTotal * listViewWidth;
	local scoreWidth = scaleScore / sizeTotal * listViewWidth;
	local scoreListRightSpace = hasScrollbar and 0.5 or 0;
	local scoreListWidth = scoreWidth * (scoreListSize - scoreListRightSpace);
	
	local itemHeight = (listViewHeight - titleHeight) / limitListSize;
	self.m_configPlayerList = {
		width = tagWidth + headWidth + nameWidth + scoreWidth,
		height = listViewHeight,
		widthList = {
			tagWidth,
			headWidth,
			nameWidth,
			scoreWidth,
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

PrivateRoomRecordSummaryLayer._initListViewPlayerList = function(self)
	local contentView = self:findViewById(self.s_controls.contentView);
	local node = UIFactory.createNode();
	node:setSize(self.m_configPlayerList.width, self.m_configPlayerList.height);
	contentView:addChild(node);

	local text = {"", "", "玩家", privateRoom_pin_map["record_score_title.png"]};
	local posX = 0;
	for k, v in ipairs(self.m_configPlayerList.widthList) do
		if not string.isEmpty(text[k]) then
			local imgNode = UIFactory.createImage(text[k]);
			local widthImg, heightImg = imgNode:getSize();
			imgNode:setPos(posX + (v - widthImg) / 2, (self.m_configPlayerList.heightTitle - heightImg) / 2)
			node:addChild(imgNode);
		elseif table.isTable(text[k]) then
			local textNode = UIFactory.createText(text[k], 24, v, self.m_configPlayerList.heightTitle, kAlignCenter);
			textNode:setPos(posX)
			node:addChild(textNode);
		end
		posX = posX + v;
	end

	local propType = self.m_data.propType;
	local posY = self.m_configPlayerList.heightTitle;
	for k, v in ipairs(self.m_data.data) do
		local playerItem = require("hall/privateRoom/widget/privateRoomRecordSummaryPlayerItem");
		local item = new(playerItem, v, propType, k, self.m_configPlayerList.widthList);
		item:setSize(self.m_configPlayerList.width, self.m_configPlayerList.heightItem);
		item:setPos(nil, posY);
		node:addChild(item);
		posY = posY + self.m_configPlayerList.heightItem;
	end
end

PrivateRoomRecordSummaryLayer._initListViewRecordList = function(self)
	local contentView = self:findViewById(self.s_controls.contentView);
	local listView = UIFactory.createListView(self.m_configPlayerList.width, nil, self.m_configRecordList.width, self.m_configRecordList.height);
	listView:setDirection(kHorizontal);
	contentView:addChild(listView);

	local data = self:_operateData(self.m_data);
	local listItem = require("hall/privateRoom/widget/privateRoomRecordSummaryRecordItem");
	listItem.setConfig(self.m_configRecordList);
	local adapter = UIFactory.createCacheAdapter(listItem, data);
	listView:setAdapter(adapter);

	listView:setPickable(self.m_configRecordList.hasScrollbar);
	if not self.m_configRecordList.hasScrollbar then
		listView:setScrollBarWidth(0);
	end
end

PrivateRoomRecordSummaryLayer._sortData = function(self, data)
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

PrivateRoomRecordSummaryLayer._operateData = function(self, data)
	local tmp = {};

	local roundsTotal = data.roundsTotal;
	local roundsCurrent = data.roundsCurrent;
	local propType = data.propType;
	for i = roundsCurrent, 1, -1 do
		local list = {};
		for k, v in ipairs(data.data) do
			local propList = v.propList;
			table.insert(list, {propNum = propList[i], mid = v.mid});
		end

		local item = {
			roundsCurrent = i,
			roundsTotal = roundsTotal,
			propType = propType,
			propList = list,
		}
		table.insert(tmp, item);
	end

	return tmp;
end
-----------------------------------------------------------------
PrivateRoomRecordSummaryLayer.onSaveImageToPhotoAlbumCallBack = function(self, isSuccess, imagePath, imageName, customParam)
	self:_afterTakeScreen();

	if isSuccess then 
		Toast.getInstance():showText("截图已存至相册",50,30,kAlignLeft,"",24,200,175,110);
	end 
end

PrivateRoomRecordSummaryLayer._startDelayAnim = function(self,callFunc)
	self:_readyForTakeScreen();

	self:_stopDelayAnim();

	self.m_delayAnim = AnimFactory.createAnimInt(kAnimNormal, 0, 1, 1000, 0);
	self.m_delayAnim:setDebugName("PrivateRoomRecordSummaryLayer|_startDelayAnim|delayAnim");
	self.m_delayAnim:setEvent(self, callFunc);
end

PrivateRoomRecordSummaryLayer._stopDelayAnim = function(self)
	delete(self.m_delayAnim);
	self.m_delayAnim = nil;
end

PrivateRoomRecordSummaryLayer._handleSaveScreenShot = function(self)
	local rect = self:_getTakeScreenRange();
	local savePath = string.format("%scapture_jifen_%s.jpg", System.getStorageImagePath(), os.time());
	System.captureScreen(rect.x, rect.y, rect.width, rect.height, savePath);
	WeixinShareUtil.getInstance():saveImageToPhotoAlbum(savePath, nil);
end

PrivateRoomRecordSummaryLayer._getTakeScreenRange = function(self)
	local shotView = self:findViewById(self.s_controls.shotView);
	local p = shotView:getWidget():to_world(Point(0,0));
    local w, h = shotView:getRealSize();

    local rect = {
        x = p.x,
        y = p.y,
        width = w;
        height = h;
    };
    return rect;
end

PrivateRoomRecordSummaryLayer._readyForTakeScreen = function(self)
	self:_setBtnVisible(false);
end

PrivateRoomRecordSummaryLayer._afterTakeScreen = function(self)
	self:_setBtnVisible(true);
end

PrivateRoomRecordSummaryLayer._setBtnVisible = function(self, visible)
	local closeBtn = self:findViewById(self.s_controls.closeBtn);
	closeBtn:setVisible(visible);
end

PrivateRoomRecordSummaryLayer._report = function(self, action)
	if action then
		PrivateRoomDataInterface.getInstance():report(action, self.m_data.gameId, self.m_data.propType);
	end
end

PrivateRoomRecordSummaryLayer.s_controlConfig = {
	[PrivateRoomRecordSummaryLayer.s_controls.background] = {"background"};
	[PrivateRoomRecordSummaryLayer.s_controls.closeBtn] = {"bg", "closeBtn"};
	[PrivateRoomRecordSummaryLayer.s_controls.shareBtn] = {"bg", "btnView", "shareBtn"};
	[PrivateRoomRecordSummaryLayer.s_controls.screenShotBtn] = {"bg", "btnView", "shotScreenBtn"};
	[PrivateRoomRecordSummaryLayer.s_controls.playAgainBtn] = {"bg", "btnView", "playAgainBtn"};
	[PrivateRoomRecordSummaryLayer.s_controls.gameNameView] = {"bg", "top", "gameView", "gameNameView"};
	[PrivateRoomRecordSummaryLayer.s_controls.gameName] = {"bg", "top", "gameView", "gameNameView", "gameName"};
	[PrivateRoomRecordSummaryLayer.s_controls.regionName] = {"bg", "top", "gameView", "game"};
	[PrivateRoomRecordSummaryLayer.s_controls.roundsView] = {"bg", "top", "roundsView"};
	[PrivateRoomRecordSummaryLayer.s_controls.timeTop] = {"bg", "top", "timeTop"};
	[PrivateRoomRecordSummaryLayer.s_controls.timeBottom] = {"bg", "top", "timeBottom"};
	[PrivateRoomRecordSummaryLayer.s_controls.contentView] = {"bg", "contentView"};
	[PrivateRoomRecordSummaryLayer.s_controls.btnView] = {"bg", "btnView"};
	[PrivateRoomRecordSummaryLayer.s_controls.titleView] = {"bg", "contentView", "titleView"};
	[PrivateRoomRecordSummaryLayer.s_controls.shotView] = {"shotView"};
}

PrivateRoomRecordSummaryLayer.s_controlFuncMap = {
	[PrivateRoomRecordSummaryLayer.s_controls.closeBtn] = PrivateRoomRecordSummaryLayer.onCloseBtnClick;
	[PrivateRoomRecordSummaryLayer.s_controls.shareBtn] = PrivateRoomRecordSummaryLayer.onShareBtnClick;
	[PrivateRoomRecordSummaryLayer.s_controls.screenShotBtn] = PrivateRoomRecordSummaryLayer.onScreenShotBtnClick;
	[PrivateRoomRecordSummaryLayer.s_controls.playAgainBtn] = PrivateRoomRecordSummaryLayer.onPlayAgainBtnClick;
};

PrivateRoomRecordSummaryLayer.s_cmdConfig = {
	
};

return PrivateRoomRecordSummaryLayer;