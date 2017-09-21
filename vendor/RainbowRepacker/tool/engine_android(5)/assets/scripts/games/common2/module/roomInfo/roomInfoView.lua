require("games/common2/module/invite2/data/inviteConfig");
local viewBase = require("games/common2/module/viewBase");

local RoomInfoView = class(viewBase, false);

RoomInfoView.s_controls = {
	privateRoomInfoNode 	= ToolKit.getIndex();
	privateRoomId 			= ToolKit.getIndex();
	qrCodeBtn 				= ToolKit.getIndex();
	qrCodeView 				= ToolKit.getIndex();
	qrCode 					= ToolKit.getIndex();
	qrCodeShiled 			= ToolKit.getIndex();
	qrCodeBg 				= ToolKit.getIndex();
	jifenRoomInfoView 		= ToolKit.getIndex();
	jifenTimes 				= ToolKit.getIndex();
	jifenRounds 			= ToolKit.getIndex();
};

RoomInfoView.ctor = function ( self, seat, layoutConfig )
	super(self, layoutConfig);
	self:setFillParent(true, true);
	self.m_seat = seat;
	self.m_ctrls = RoomInfoView.s_controls;
	self:initViews();
end

RoomInfoView.dtor = function ( self )

end

RoomInfoView.initViews = function ( self )
	self:initPrivateRoomInfoView();
end

-- 初始化私人房view
RoomInfoView.initPrivateRoomInfoView = function ( self )
	self.m_privateRoomInfoNode = self:findViewById(self.m_ctrls.privateRoomInfoNode);
	self.m_privateRoomId = self:findViewById(self.m_ctrls.privateRoomId);
	local viewCommonConfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
    local config = table.verify(viewCommonConfig.privateConfig);
    self.m_privateRoomInfoNode:setAlign(config.align or kAlignTopLeft);
    self.m_privateRoomInfoNode:setPos(config.x or 150, config.y or 0);
	self:showRoomId();
	self:_startDelayTimer(1,self,self.refreshQRBg);
	-- self:refreshQRBg();
	self:refreshJiFenRoomInfo();
end

RoomInfoView.refreshQRBg = function(self)
	local isInJiFenRoom = PrivateRoomIsolater.getInstance():isInJiFenRoom();
	local fileName = isInJiFenRoom and "games/common/qr_bg_2.png" or "games/common/qr_bg.png";
	local bg = self:findViewById(self.m_ctrls.qrCodeBg);
	bg:setFile(fileName);
	bg:setSize(bg.m_res:getWidth(),bg.m_res:getHeight());

	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_INITINVITE, InviteConfig.TYPE_PRIVATE_ROOM);
end

RoomInfoView.refreshJiFenRoomInfo = function(self)
	local isInJiFenRoom = PrivateRoomIsolater.getInstance():isInJiFenRoom();
	local jifenRoomInfoView = self:findViewById(self.m_ctrls.jifenRoomInfoView);
	jifenRoomInfoView:setVisible(isInJiFenRoom);

	if isInJiFenRoom then 
		local info = table.verify(PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo());
		local times = info.times or 0;
		local rounds = info.rounds or 0;

		local jifenTimes = self:findViewById(self.m_ctrls.jifenTimes);
		local jifenRounds = self:findViewById(self.m_ctrls.jifenRounds);
		-- jifenTimes:setVisible(times ~= 0); -- 部分游戏没有倍数，倍数为0时不显示
		jifenTimes:setText("倍数:"..times);
		jifenRounds:setText("局数:"..rounds);
		self:refreshJifenInfoPos();
	end 
end

RoomInfoView.refreshJifenInfoPos = function(self)
	local jifenTimes = self:findViewById(self.m_ctrls.jifenTimes);
	local jifenRounds = self:findViewById(self.m_ctrls.jifenRounds);
	if jifenTimes:getVisible() then
		jifenTimes:setAlign(kAlignLeft);
		jifenRounds:setAlign(kAlignRight);
	else
		jifenRounds:setAlign(kAlignCenter);
	end
end

RoomInfoView.showRoomId = function ( self, seat, uid, info, isFast )
	-- body
	self:setPrivateRoomInfoVisible(PrivateRoomIsolater.getInstance():isInPrivateRoom());
	local tableId = GameInfoIsolater.getInstance():getCurTableId();
	local tableIdShort = GameInfoIsolater.getInstance():getCurShortTableId();
	tableId = tableIdShort > 0 and tableIdShort or tableId;
	self:setPrivateRoomId(tableId);
end

RoomInfoView.setPrivateRoomInfoVisible = function ( self, visible )
	self.m_privateRoomInfoNode:setVisible(visible);
end

RoomInfoView.setPrivateRoomId = function ( self, roomId )
	self.m_privateRoomId:setText(string.concat("房号:", roomId or ""));
end

RoomInfoView.onReceivePrivateRoomInfo = function ( self, seat, uid, data, isFast )
	local tableId = GameInfoIsolater.getInstance():getCurTableId();
	local tableIdShort = GameInfoIsolater.getInstance():getCurShortTableId();
	tableId = tableIdShort > 0 and tableIdShort or tableId;
	self:setPrivateRoomId(tableId);

	self:refreshQRBg();
	self:refreshJiFenRoomInfo();
end

RoomInfoView.onSearchPrivateRoom = function(self, seat, uid, data, isFast)
	self:refreshQRBg();
	self:refreshJiFenRoomInfo();
end

RoomInfoView.onQRCodeBtnClick = function(self)
	local qrCodeView = self:findViewById(self.m_ctrls.qrCodeView);
	local isVisible = qrCodeView:getVisible();

	if isVisible then
		ReportIsolater.getInstance():report(UBConfig.kPrivateRoomOpenQR, true, true);
	end 

	self:_showQRCodeVisible(not isVisible);
end

RoomInfoView.onQRCodeShiledTouch = function(self,finger_action)
	if finger_action == kFingerUp then 
		self:_showQRCodeVisible(false);
	end 
end

RoomInfoView._showQRCodeVisible = function(self,isVisible)
	local qrCodeView = self:findViewById(self.m_ctrls.qrCodeView);
	local qrCodeShiled = self:findViewById(self.m_ctrls.qrCodeShiled);

	if not self.m_qrImg then
		isVisible = false;
	end 

	qrCodeView:setVisible(isVisible);
	qrCodeShiled:setVisible(isVisible);
end

--------------------------私人房二维码--------------------------------------
RoomInfoView._createQRImage = function(self)
	if string.isEmpty(self.m_password) then
		return;
	end

	if self.m_createQrImageFlag then
		return;
	end

	self.m_createQrImageFlag = true;

	local qrType, params = PasswordIsolater.getInstance():shareByQr(InviteConfig.TYPE_PRIVATE_ROOM, self.m_password);
	if qrType and params then
	    local w, h = self:findViewById(self.s_controls.qrCode):getSize();
	    local sideLength = math.max(w,h);
	    QRUtilIsolater.getInstance():createQR(qrType, sideLength, params);
	end
end

RoomInfoView.onCreateQRCallBack = function(self,seat,uid,info,isFast)
    local isSuccess = info.isSuccess;
    local qrType = info.qrType;
    local fileName = info.fileName;

    if isSuccess and qrType == QRUtilIsolater.eQRType.PRIVATE_ROOM and fileName then
    	self.m_qrImg = fileName;

        local qrCode = self:findViewById(self.s_controls.qrCode);
        qrCode:setFile(fileName);
    end
end

RoomInfoView.onGetPasswordByInfo = function(self,seat,uid,info,isFast)
    if info then
        self.m_password = info;
        self:_createQRImage();
    end
end

RoomInfoView.s_controlConfig = {
	[RoomInfoView.s_controls.privateRoomInfoNode]			= {"privateRoomView"};
	[RoomInfoView.s_controls.privateRoomId]					= {"privateRoomView", "bg", "roomId"};
	[RoomInfoView.s_controls.qrCodeBtn]						= {"privateRoomView", "bg", "qrCodeBtn"};
	[RoomInfoView.s_controls.qrCodeView]					= {"privateRoomView", "qrCodeView"};
	[RoomInfoView.s_controls.qrCode]						= {"privateRoomView", "qrCodeView","qrCode"};
	[RoomInfoView.s_controls.qrCodeShiled]					= {"qrCodeShiled"};
	[RoomInfoView.s_controls.qrCodeBg]						= {"privateRoomView", "qrCodeView","bg"};
	[RoomInfoView.s_controls.jifenRoomInfoView]				= {"privateRoomView", "qrCodeView","jifenRoomInfoView"};
	[RoomInfoView.s_controls.jifenTimes]					= {"privateRoomView", "qrCodeView","jifenRoomInfoView","times"};
	[RoomInfoView.s_controls.jifenRounds]					= {"privateRoomView", "qrCodeView","jifenRoomInfoView","rounds"};
};

RoomInfoView.s_controlFuncMap = {
	[RoomInfoView.s_controls.qrCodeBtn]						= RoomInfoView.onQRCodeBtnClick;
	[RoomInfoView.s_controls.qrCodeShiled]					= RoomInfoView.onQRCodeShiledTouch;
};

RoomInfoView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGIN]						= "showRoomId";
};

RoomInfoView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_CREATE_QR_CALLBACK]        	= "onCreateQRCallBack";
	[GameMechineConfig.ACTION_NS_RECEIVE_PRIVATEROOMINFO]       = "onReceivePrivateRoomInfo";
	[GameMechineConfig.ACTION_NS_SEARCH_PRIVATEROOM]        	= "onSearchPrivateRoom";
	[GameMechineConfig.ACTION_NS_GET_PASSWORD_BY_INFO]			= "onGetPasswordByInfo";
};

return RoomInfoView;
