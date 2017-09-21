require("core/dict");
require("common/commonScene");
require("ui/toast");
require("util/StringLib");
require("util/TableLib");
require("ui/toast");
require("hall/common/gameManager");
require("hall/privateRoom/data/privateRoomDataInterface");

local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")

PrivateRoomScene = class(CommonScene);

PrivateRoomScene.s_controls = 
{
	backBtn = ToolKit.getIndex(),
    qrCodeBtn = ToolKit.getIndex();
    leftView = ToolKit.getIndex(),
    rightView = ToolKit.getIndex(),
    createRoomBtnMoney = ToolKit.getIndex(),
    createRoomBtnScore = ToolKit.getIndex(),
    recordBtn = ToolKit.getIndex(),
    tipsView = ToolKit.getIndex(),
};

PrivateRoomScene.s_cmds = 
{
};

PrivateRoomScene.ctor = function(self, viewConfig, controller)
	self.m_controller = controller;
	self:setFillParent(true,true);

    PrivateRoomDataInterface.getInstance():setObserver(self);

    self:_initView();
    self:_checkJumpInfo();
end 

PrivateRoomScene.resume = function(self)
	CommonScene.resume(self);
	UpdateHandleMgr.getInstance():setObserver(self);
	self.m_downloadMonitor = nil;
end

PrivateRoomScene.pause = function(self)
	UpdateHandleMgr.getInstance():clearObserver(self);
	CommonScene.pause(self);
end

PrivateRoomScene.dtor = function(self)
	self:_hideTipsView();
	PrivateRoomDataInterface.getInstance():setCreateData();
	
	self.m_downloadMonitor = nil;
	PrivateRoomDataInterface.getInstance():clearObserver(self);
	IBaseDialog.hideAll();
end

--------------------------------------------------------------------------------------------------------------------------------
PrivateRoomScene.onBackBtnClick = function(self)
	self:requestCtrlCmd(PrivateRoomController.s_cmds.GoBack);
end

---------------------------------安装逻辑--------------------------------------------------
PrivateRoomScene.onCheckGameInstallStatus = function(self, gameId, callbackObj, callbackFunc, args)
	return self:checkGameInstallStatus(gameId, callbackObj, callbackFunc, args);
end

--@brief 判断游戏是否安装
PrivateRoomScene.checkGameInstallStatus = function(self,gameId, callbackObj, callbackFunc, args)
	local isGameCanPlay,msg = PrivateRoomDataInterface.getInstance():checkGameInstallStatus(gameId);
	if not isGameCanPlay and (msg and msg ~= "") then
		if callbackObj and callbackFunc then
			self.m_downloadMonitor = { callbackObj = callbackObj, callbackFunc = callbackFunc, args = args};
		else
			self.m_downloadMonitor = nil;
		end

		self:showToast(msg);
	else
		self.m_downloadMonitor = nil;
	end
	return isGameCanPlay;
end


--@brief 下载游戏成功回调
PrivateRoomScene.downloadGameSuccessed = function(self, data)
	if not table.isEmpty(self.m_downloadMonitor) then
		self.m_downloadMonitor.callbackFunc(self.m_downloadMonitor.callbackObj, args);
		self.m_downloadMonitor = nil;
	end
end 

--@brief 更新游戏成功回调
PrivateRoomScene.updateGameSuccessed = function(self, gameId)
	if not table.isEmpty(self.m_downloadMonitor) then
		self.m_downloadMonitor.callbackFunc(self.m_downloadMonitor.callbackObj, args);
		self.m_downloadMonitor = nil;
	end
end

-----------------------------------------下载游戏二维码弹框--------------------------------------------------------
PrivateRoomScene.onQrCodeBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kPrivateRoomOpenDownloadQR);
	local x, y = self.m_qrCodeBtn:getAbsolutePos();
	local w, h = self.m_qrCodeBtn:getSize();
	self:onQrCodeLayerOpen(x + w, y + h);
end

PrivateRoomScene.onQrCodeLayerOpen = function(self, x, y)
	self:pushStateStack(self, self.onQrCodeLayerClose);

    if not self.m_qrCodePopDialog then
        self.m_qrCodePopDialog = new( require("hall/privateRoom/widget/privateRoomQrCodeDialog") );
        self.m_qrCodePopDialog:setDelegate(self);
        self:addChild(self.m_qrCodePopDialog);
    end
    self.m_qrCodePopDialog:setContentPos(x, y);
    self.m_qrCodePopDialog:show();
end

PrivateRoomScene.onQrCodeLayerClose = function(self, popStack)
    if popStack then
        self:popStateStack();
    end

    if self.m_qrCodePopDialog then
        self.m_qrCodePopDialog:hide();
        delete(self.m_qrCodePopDialog);
        self.m_qrCodePopDialog = nil;
    end
end

-------------------------------约牌记录-----------------------
PrivateRoomScene.onRecordBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kPrivateRoomOpenRecord);
	self:onRecordLayerOpen();
end

PrivateRoomScene.onRecordLayerOpen = function(self)
	self:pushStateStack(self, self.onRecordLayerClose);

    if not self.m_recordLayer then
    	local privateRoomRecordLayer = require("hall/privateRoom/widget/privateRoomRecordLayer");
        self.m_recordLayer = new(privateRoomRecordLayer);
        self.m_recordLayer:setDelegate(self);
        self:addChild(self.m_recordLayer);
    end
    self.m_recordLayer:show();
end

PrivateRoomScene.onRecordLayerClose = function(self, popStack)
	if self.m_recordLayer:hasOpenLayer() then
		self:pushStateStack(self, self.onRecordLayerClose);
		return;
	end

    if popStack then
        self:popStateStack();
    end

    if self.m_recordLayer then
        self.m_recordLayer:hide();
        delete(self.m_recordLayer);
        self.m_recordLayer = nil;
    end
end

-- PrivateRoomScene.onScanQRCallBack = function(self, isSuccess, strData)
-- 	Toast.setDefaultDisplayTime(4000);

-- 	if isSuccess then
-- 		UBReport.getInstance().report(UBConfig.kPrivateRoomScanQRSuc);
-- 		local data = json.decode(strData);
-- 		local paramValue = PrivateRoomDataInterface.getInstance():parseQRParams(data);
-- 		if paramValue == QRUtil.eScanQRParamType.VALID_PARAM then
-- 			self:_searchRoom(data.tableId, PrivateRoomConstant.ENTER_TYPE_QR_CODE);
-- 		elseif paramValue == QRUtil.eScanQRParamType.ERROR_REGION then
-- 			self:showToast("请扫描本应用的约牌房二维码");
-- 		elseif paramValue == QRUtil.eScanQRParamType.ERROR_VERSION then
-- 			MessageBox.show("更新提醒",  "当前游戏版本过低，更新游戏后才可进入房间！", "确定", nil, false);
-- 		else
-- 			self:showToast("请扫描约牌房二维码");
-- 		end
-- 	else
-- 		--self:showToast("扫码失败，请重试一下");
-- 	end

-- 	Toast.setDefaultDisplayTime(nil);
-- end

----------------------------------输入层-----------------------------------------
PrivateRoomScene._initInputLayer = function(self)
	if not self.m_inputLayer then
		local rightView = self:findViewById(self.s_controls.rightView);
		local privateRoomInputLayer = require("hall/privateRoom/widget/privateRoomInputLayer");
		self.m_inputLayer = new(privateRoomInputLayer);
		self.m_inputLayer:setDelegate(self);
		rightView:addChild(self.m_inputLayer);
	end
end

PrivateRoomScene.onInputNumberCallback = function(self, number)
	self:_searchRoom(number, PrivateRoomConstant.ENTER_TYPE_SEARCH);
end

-- interafce callback
PrivateRoomScene.onSearchPrivateRoom = function(self, data)
	if table.isEmpty(data) or table.isEmpty(data[1]) then
		if self.m_enterType == PrivateRoomConstant.ENTER_TYPE_SEARCH then
			self.m_inputLayer:showEmptyView();
		else
			self:showToast(kTextPrivateRoomDataEmptyJump);
		end
	else
		self:showEnterLayer(data[1], self.m_enterType);
	end
end

-- 进入弹框
PrivateRoomScene.showEnterLayer = function(self, data, enterType)
	self:pushStateStack(self, self.onEnterLayerClose);

	if not self.m_enterLayer then
		local privateRoomEnterLayer = require("hall/privateRoom/widget/privateRoomEnterLayer");
		self.m_enterLayer = new(privateRoomEnterLayer);
		self.m_enterLayer:setDelegate(self);
		self.m_root:addChild(self.m_enterLayer);
	end
	self.m_enterLayer:show(data, enterType);
end

PrivateRoomScene.onEnterLayerClose = function(self, popStack)
	if popStack then
        self:popStateStack();
    elseif IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		self:pushStateStack(self, self.onEnterLayerClose);
		return;
    end

    if self.m_enterLayer then
        self.m_enterLayer:hide();
        delete(self.m_enterLayer);
        self.m_enterLayer = nil;
    end
end

-- sub view callback
PrivateRoomScene.onShowEnterTipsView = function(self)
	self:showEnterTipsView();
end

-- 人满提示
PrivateRoomScene.showEnterTipsView = function(self)
	self:pushStateStack(self, self.onEnterTipsViewClose);

	if not self.m_enterTipsView then
		local privateRoomEnterTipsView = require("hall/privateRoom/widget/privateRoomEnterTipsView");
		self.m_enterTipsView = new(privateRoomEnterTipsView);
		self.m_enterTipsView:setDelegate(self);
		self.m_root:addChild(self.m_enterTipsView);
	end
	self.m_enterTipsView:show();
end

PrivateRoomScene.onEnterTipsViewClose = function(self, popStack)
	if popStack then
        self:popStateStack();
    end

    if self.m_enterTipsView then
        self.m_enterTipsView:hide();
        delete(self.m_enterTipsView);
        self.m_enterTipsView = nil;
    end
end

-- 确认人满提示，重置输入
PrivateRoomScene.onEnterTipsViewConfirm = function(self)
	self.m_inputLayer:resetInput();
end

----------------------------------货币房逻辑-----------------------------------------
PrivateRoomScene.onCheckCanEnterRoom = function(self, tableType, requireMoney, callbackObj, callbackFunc)
	return self:_checkIsCanEnterRoom(tableType, requireMoney, false, callbackObj, callbackFunc);
end

PrivateRoomScene.onCreateRoomBtnMoneyClick = function(self)
	UBReport.getInstance():report(UBConfig.kPrivateRoomCreateYouXiBi);

	self.m_isRequestCreateRoom = true; -- 标记是否为创建货币房,创建货币房保证银币大于20000
	self:_handleShowCreateRoom();
end

PrivateRoomScene._handleShowCreateRoom = function(self)
	self:showCreateCommonLayer(PrivateRoomConstant.CREATE_TYPE_MONEY_CRYSTAL);
	self.m_isRequestCreateRoom = false;
end

-- 取款或充值校验
PrivateRoomScene._checkIsCanEnterRoom = function(self, tableType, requireMoney, isCreate, callbackObj, callbackFunc)
	tableType = number.valueOf(tableType);
	requireMoney = number.valueOf(requireMoney);
	local money = self:_getMoneyByTableType(tableType);
	local totalMoney = self:_getTotalMoneyByTableType(tableType);
	local unit = PrivateRoomConstant.UNIT_MAP[tableType] or "";
	local msgStr = isCreate and "创建" or "进入";
	local minMoney = requireMoney;
	if money >= minMoney then 
		return true;
	elseif money < minMoney and totalMoney >= minMoney then --需保险箱取钱
		local getMoney = minMoney - money;
		local data = {
			id = 100;
			levelId = 100;
			moneyId = tableType;
			getMoney = number.valueOf(getMoney);
			msg = "#c8F5c1F"..msgStr.."房间还需要取出"..getMoney.."#c8F5C1F"..unit;
			callFunc = callbackFunc;
			callObj = callbackObj;
		};

		IBaseDialog.pushDialog(new(require("hall/main/widget/getMoneyToGameView"), data));

		return false;
	elseif totalMoney < minMoney then--需要购买银币
		local difMoney = minMoney - money;
		local data = {
			id = 100;
			levelId = 100;
			difMoney = number.valueOf(difMoney);
			moneyType = tableType;
		};

		local msg = "#c8F5c1F您还需要#cF65814"..difMoney.."#c8F5C1F"..unit.."才能"..msgStr.."房间"
		IBaseDialog.pushDialog(new(require("hall/main/widget/chooseRoomPayLayer"),data,msg));

		return false;
	end 
	return true;
end

PrivateRoomScene._getMoneyByTableType = function(self, tableType)
	if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then
		return kUserInfoData:getCrystal();
	else
		return kUserInfoData:getMoney();
	end
end

PrivateRoomScene._getTotalMoneyByTableType = function(self, tableType)
	if tableType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_CRYSTAL then
		return kUserInfoData:getTotalCrystal();
	else
		return kUserInfoData:getTotalMoney();
	end
end

---------------------------------私人房创建逻辑--------------------------------------------------
PrivateRoomScene.showCreateCommonLayer = function(self, layerType)
	self:pushStateStack(self, self.onCreateCommonLayerClose);

	if not self.m_createCommonLayer then
		local privateRoomCreateCommonLayer = require("hall/privateRoom/widget/privateRoomCreateCommonLayer");
		self.m_createCommonLayer = new(privateRoomCreateCommonLayer, layerType);
		self.m_createCommonLayer:setDelegate(self);
		self.m_root:addChild(self.m_createCommonLayer);
	end
	self.m_createCommonLayer:show();
end

PrivateRoomScene.onCreateCommonLayerClose = function(self, popStack)
	if popStack then
        self:popStateStack();
    elseif IBaseDialog.isDialogShowing() then
		IBaseDialog.onBackHidden();
		self:pushStateStack(self, self.onCreateCommonLayerClose);
		return;
    end

    if self.m_createCommonLayer then
        self.m_createCommonLayer:hide();
        delete(self.m_createCommonLayer);
        self.m_createCommonLayer = nil;
    end
end

-- 积分房
PrivateRoomScene.onCreateRoomBtnScoreClick = function(self)
	UBReport.getInstance():report(UBConfig.kPrivateRoomCreateJiFen);

	self:_hideTipsView();

	self:showCreateCommonLayer(PrivateRoomConstant.CREATE_TYPE_SCORE);
end
---------------------------------------------------------------------------

PrivateRoomScene._initView = function(self)
	self:_initViewSize();
	self:_initInputLayer();
	self:_initTipsView();

	self.m_qrCodeBtn = self:findViewById(self.s_controls.qrCodeBtn);
end

PrivateRoomScene._initViewSize = function(self)
    local leftView = self:findViewById(self.s_controls.leftView);
    local rightView = self:findViewById(self.s_controls.rightView);

    local w = System.getScreenScaleWidth();
    local fillWidth = w * 5 / 11;
    local fillRegion, topLeftX, topLeftY, bottomRightX, bottomRightY = leftView:getFillRegion();
    leftView:setFillRegion(fillRegion, topLeftX, topLeftY, w / 2, bottomRightY);

    fillRegion, topLeftX, topLeftY, bottomRightX, bottomRightY = rightView:getFillRegion();
    rightView:setFillRegion(fillRegion, fillWidth, topLeftY, bottomRightX, bottomRightY);
end

PrivateRoomScene._initTipsView = function(self)
	if not PrivateRoomDataInterface.getInstance():getOpenFlagScore() then
		self:_showTipsView();
		PrivateRoomDataInterface.getInstance():setOpenFlagScore(true)
	end
end

PrivateRoomScene._showTipsView = function(self)
	local tipsView = self:findViewById(self.s_controls.tipsView);
 --    local glow = require 'libEffect.shaders.glow'
 --    glow.applyToDrawing(tipsView, {intensity = 0.0})

 --    local anim = new(AnimDouble,kAnimLoop,0, 1,1000,0)
 --    Clock.instance():schedule(function (dt)
 --        glow.applyToDrawing(tipsView, {intensity = anim:getCurValue()})
	-- end)

	tipsView:setVisible(true);
    Clock.instance():schedule(function()
            self:_hideTipsView();
            return true;
        end, 5);
end

PrivateRoomScene._hideTipsView = function(self)
	local tipsView = self:findViewById(self.s_controls.tipsView);
	tipsView:setVisible(false);
end	

-- 校验是否需要弹出私人房进入弹框
PrivateRoomScene._checkJumpInfo = function(self)
	local info = PrivateRoomDataInterface.getInstance():getJumpInfo();
	if not table.isEmpty(info) then
		local tableId = info.tableId;
		local enterType = info.enterType or PrivateRoomConstant.ENTER_TYPE_SEARCH;
		if tableId then
			self:_searchRoom(tableId, enterType);	
		end
	end

    PrivateRoomDataInterface.getInstance():setJumpInfo();
end

PrivateRoomScene._searchRoom = function(self, tableId, enterType)
	self.m_enterType = enterType; 
	PrivateRoomDataInterface.getInstance():searchPrivateRoom(tableId);	
end

PrivateRoomScene.showToast = function(self, message)
	Toast.getInstance():showText(message,50,30,kAlginLeft,"",26,250,210,70);
end

---------------------------------------------------------------------------

PrivateRoomScene.s_controlConfig = 
{
	[PrivateRoomScene.s_controls.backBtn] = {"topView","returnBtn"};
    [PrivateRoomScene.s_controls.qrCodeBtn] = {"topView","qrCodeBtn"};
    [PrivateRoomScene.s_controls.recordBtn] = {"topView", "recordBtn"};
    [PrivateRoomScene.s_controls.leftView] = {"contentView", "leftView"};
    [PrivateRoomScene.s_controls.rightView] = {"contentView", "rightView"};
    [PrivateRoomScene.s_controls.createRoomBtnMoney] = {"contentView", "leftView", "createRoomBtnMoney"};
    [PrivateRoomScene.s_controls.createRoomBtnScore] = {"contentView", "leftView", "createRoomBtnScore"};
    [PrivateRoomScene.s_controls.tipsView] = {"contentView", "leftView", "tipsView"};
};

PrivateRoomScene.s_controlFuncMap = 
{
	[PrivateRoomScene.s_controls.backBtn] = PrivateRoomScene.onBackBtnClick;
    [PrivateRoomScene.s_controls.qrCodeBtn] = PrivateRoomScene.onQrCodeBtnClick;
    [PrivateRoomScene.s_controls.recordBtn] = PrivateRoomScene.onRecordBtnClick;
    [PrivateRoomScene.s_controls.createRoomBtnMoney] = PrivateRoomScene.onCreateRoomBtnMoneyClick;
    [PrivateRoomScene.s_controls.createRoomBtnScore] = PrivateRoomScene.onCreateRoomBtnScoreClick;
};	

PrivateRoomScene.s_cmdConfig = 
{
};
