local ViewBase = require("games/common2/module/viewBase");

local ReadyView = class(ViewBase,false);

ReadyView.s_controls = {
	btn_view 		= ToolKit.getIndex();
	changeTableBtn 	= ToolKit.getIndex();
	readyBtn 		= ToolKit.getIndex();
};

ReadyView.ctor = function ( self, seat, layoutConfig )
	super(self,layoutConfig);
	self:setFillParent(true,true);
	self.m_seat = seat;
	self.m_ctrl = ReadyView.s_controls;

	self.m_btnView = self:findViewById(self.m_ctrl.btn_view);
	self.m_readyBtn = self:findViewById(self.m_ctrl.readyBtn);
	self.m_changeBtn = self:findViewById(self.m_ctrl.changeTableBtn);
	self:setVisible(false);

	local gameConfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
	if gameConfig.isAutoReady ~= nil then 
		self.m_isNeedAutoReady = gameConfig.isAutoReady;
	end 
end

ReadyView.dtor = function (self)
	self:_stopWaitAnim(true);
	self:_stopWaitAnim(false);
end

ReadyView.parseConfig = function(self,config)
	config = table.verify(config);

	if self.m_isNeedAutoReady == nil then 
		self.m_isNeedAutoReady = config.isAutoReady;
	end 
end

ReadyView.setViewVisible = function ( self, readyVisible, changeVisible )
	self:setVisible(true);

	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then 
		self.m_readyBtn:setVisible(readyVisible);

		self.m_changeBtn:setVisible(false);
		-- 私人房准备按钮居中
		local old_x, old_y = self.m_readyBtn:getPos();
		local p_w, p_h = self.m_btnView:getSize();
		local b_w, b_h = self.m_changeBtn:getSize();
		self.m_readyBtn:setPos((p_w-b_w) / 2, old_y);
		return;
	elseif GameInfoIsolater.getInstance():isInMatchRoom() then
		self.m_readyBtn:setVisible(false);
		self.m_changeBtn:setVisible(false);
		return;
	end
	self.m_readyBtn:setVisible(readyVisible);
	self.m_readyBtn:setAlign(kAlignRight);
	self.m_changeBtn:setVisible(changeVisible);
	self.m_changeBtn:setAlign(kAlignLeft);

	if not readyVisible and changeVisible then
		local old_x, old_y = self.m_changeBtn:getPos();
		local b_w, b_h = self.m_changeBtn:getSize();
		local p_w, p_h = self.m_btnView:getSize();
		self.m_changeBtn:setPos((p_w-b_w)/2,old_y);
	else
		local old_x, old_y = self.m_changeBtn:getPos();
		self.m_changeBtn:setPos(0,old_y);
	end
end

ReadyView.hideAllView = function ( self )
	self:setViewVisible(false,false);
end

-------------------------------------------------------------------------
ReadyView.loginGameTable = function ( self, seat, uid, info, isFast )
	self.m_isChangeTable = nil;
	self.m_isUpChange = nil;
	self.m_isChangeTableWithNewCmd = nil;
	self.m_isDuringChangeTable = nil;

	self:onShowReadyView();

	if (not self.m_lastGameOverTime) --没有玩过牌
		and (not self.m_firstLoginTime) then --第一次进入房间到第一局开始玩，中途有换桌之类的也不重置时间
		self.m_firstLoginTime = os.time();
	end 

	if self.m_requestReady then
		self.m_requestReady = false;
		SocketIsolater.getInstance():sendMsg(USER_READY_REQUEST);

	elseif (not isFast) and (self.m_isNeedAutoReady ~= false) then 
		self.m_isNeedAutoReady = false; --刚进入房间时默认为自动准备
		if not PrivateRoomIsolater.getInstance():isInPrivateRoom() then 
            self:onReadyBtnClick();		
        end		 
	end 	
end

ReadyView.logout = function ( self, seat, uid, info, isFast )
	Log.d("ReadyView.logout");
	if self.m_isChangeTable then
		self.m_isChangeTable = false;
		if self.m_isChangeTableWithNewCmd then --使用0x1028时，相同场次之间的换桌不需要发送0x119,server会直接进入新桌子，需要升场的时候需要发送0x119
			self.m_isChangeTableWithNewCmd = nil;

			if self.m_isUpChange then 
				Log.d("ReadyView.logout ==>new requestEnterRoom");
				LoginGameLogic2.getInstance():requestEnterRoom(true);
			else 
				Log.d("ReadyView.logout ==> 退场银币判断为相同场次换桌，入场银币判断是否需要升场");
				RoomLogic.getInstance():checkIsLevelUp(true); --换桌退场时判断为同等级间换桌，在需要入场时也需要用入场银币判断是否为同等级的
			end 
		else --发送1002换桌的一定要发0x119
			Log.d("ReadyView.logout ==> requestEnterRoom");
			LoginGameLogic2.getInstance():requestEnterRoom(true);
		end 
	end
	self:onShowReadyView();
end

ReadyView.showReady = function ( self, seat, uid, info, isFast )
	self:setViewVisible(false,true);

	self:_stopWaitAnim(true);
end

ReadyView.updateMainState = function(self,state)
    self.m_mainState = state;
    if self.m_mainState == GameMechineConfig.STATUS_PLAYING then
    	self:startGame();
    end
end

ReadyView.startGame = function ( self, seat, uid, info, isFast )
	self:hideAllView();

	local ubAction;
   	local lastTime;
	if self.m_firstLoginTime then 
		lastTime = self.m_firstLoginTime;
		self.m_firstLoginTime = nil;
		
		ubAction = UBConfig.kGameReadyAction1;
   	elseif self.m_lastGameOverTime then 
   		lastTime = self.m_lastGameOverTime;
		self.m_lastGameOverTime = nil;
		
		ubAction = UBConfig.kGameReadyAction2;
   	end  
   	if ubAction and tonumber(lastTime) then 
   		local curTime = os.time();
		local time = curTime - number.valueOf(lastTime);
		local curGameId = GameInfoIsolater.getInstance():getCurGameId();
		local curLevelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
		local val = string.format("gameId%s_levelId%s_time%s",curGameId, curLevelId, time);
		
		ReportIsolater.getInstance():reportWithVal(ubAction,val);
   	end 
end

ReadyView.gameover = function ( self, seat, uid, info, isFast )
	if not PrivateRoomIsolater.getInstance():isInJiFenRoom() then
		self:onShowReadyView();
	end 
	self.m_lastGameOverTime = os.time();
end

ReadyView.onShowReadyView = function (self)
	self:setViewVisible(true,true);
end

ReadyView.onHidReadyView = function (self)
	self:hideAllView();
end
-------------------------------------------------------------------------

ReadyView.onReadyBtnClick = function ( self )
	if self.m_isDuringChangeTable then 
		return;
	end 
	if RoomLogic.getInstance():checkIsLevelUp() then
		return;
	end
	if RoomLogic.getInstance():checkIsBankrupt() then  
		-- 准备前先检查是否破产
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT);
		return;
	end

	if self.m_curState == GameMechineConfig.STATUS_LOGIN or self.m_curState == GameMechineConfig.STATUS_GAMEOVER then
		SocketIsolater.getInstance():sendMsg(USER_READY_REQUEST);
	else
		Log.d("ReadyView.onReadyBtnClick ==> requestEnterRoom");
		-- 先登录，再准备
		self.m_requestReady = true;
		LoginGameLogic2.getInstance():requestEnterRoom();
	end
	self:_startWaitAnim(true);
end

ReadyView.onChangeBtnClick = function ( self )
	self:onHandleChangeTable();
end 

ReadyView.onHandleChangeTable = function(self,seat, uid, info)
	info = table.verify(info);
	if self.m_readyCountDownAnim then 
		return;
	end
	if RoomLogic.getInstance():checkIsLevelUp() then
		return;
	end
	if RoomLogic.getInstance():checkIsBankrupt() then  
		local action = GameMechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT;
		MechineManage.getInstance():receiveAction(action);
		return;
	end

	if self.m_curState == GameMechineConfig.STATUS_READY then --准备后点换桌，换桌成功后自动准备
		self.m_requestReady = true;
	end 
	self.m_isDuringChangeTable = true;

	self:onChangeTable(info.isMiddleChange);
	self:disableChangeTable();
end

ReadyView.disableChangeTable = function ( self )
	self:_startWaitAnim(false);
end 

ReadyView.onChangeTable = function (self,isMiddleChange)
	if self.m_curState == GameMechineConfig.STATUS_NONE or self.m_curState == GameMechineConfig.STATUS_LOGOUT then
		Log.d("ReadyView.onChangeTable ==> requestEnterRoom");
		self.m_isChangeTable = nil;
		LoginGameLogic2.getInstance():requestEnterRoom(true);
	else
		self.m_isChangeTable = true;
		if isMiddleChange then --血战游戏，提前赢牌换桌时一定要使用0x1002
			Log.d("ReadyView.onChangeTable ==> middle change ==> sendMsg 0x1002");
			SocketIsolater.getInstance():sendMsg(ROOM_SEND_LOGOUT);
		else 		
			local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
			if config.changeTableWithNewCmd then
				self.m_isChangeTableWithNewCmd = true;
				Log.d("ReadyView.onChangeTable ==> sendMsg 0x1028");

				SocketIsolater.getInstance():sendMsg(CLIENT_COMMAND_CHANGE_TABLE);
			else
				Log.d("ReadyView.onChangeTable ==> sendMsg 0x1002");
				SocketIsolater.getInstance():sendMsg(ROOM_SEND_LOGOUT);
			end
		end 
	end
end

ReadyView.onRoomUpChange = function (self, seat, uid, info, isFast)
	self.m_isUpChange = true;
	Log.d("ReadyView.onRoomUpChange");
	self:onChangeTable();
end

-------------------------------------------------------------------------
ReadyView._showWaitTime = function(self,isReadyBtn,time)
	time = number.valueOf(time);

	local btn = isReadyBtn and self.m_readyBtn or self.m_changeBtn;
	local btnNameView = btn:getChildByName("nameView");
	if btnNameView then 
		local btnName = btn:getChildByName("img");
		local btnTime = btnNameView:getChildByName("time");

		if btnName and btnTime then 
			local showTime = isReadyBtn and 0 or time;
			local str = showTime == 0 and "" or string.format("(%d)", showTime);
			local w_1 = btnName:getSize();
			local w_2 = showTime == 0 and 0 or 40;
			btnTime:setText(str,w_2);
			btnNameView:setSize(w_1+w_2,nil);
			btnName:setPos(-w_2/2,nil);
			btn:setEnable(time == 0);
		end 
	end 
end

ReadyView._startWaitAnim = function(self,isReadyBtn)
	self:_stopWaitAnim(isReadyBtn);

	local remainTime = 3;		
	self:_showWaitTime(isReadyBtn,remainTime);

	local timerDebugName = isReadyBtn and "ReadyView.m_readyCountDownAnim" or "ReadyView.m_changeTableCountDownAnim";	
	local countDownAnim = AnimFactory.createAnimInt(kAnimLoop, 0, 1, 1000, 500);	
	countDownAnim:setDebugName(timerDebugName);
	countDownAnim:setEvent(nil,function()
		remainTime = remainTime - 1;

		if remainTime == 0 then 
			self:_stopWaitAnim(isReadyBtn);
		else 
			self:_showWaitTime(isReadyBtn,remainTime);
		end 
	end);
	if isReadyBtn then 
		self.m_readyCountDownAnim = countDownAnim;
	else 
		self.m_changeTableCountDownAnim = countDownAnim;
	end 
end

ReadyView._stopWaitAnim = function(self,isReadyBtn)
	self:_showWaitTime(isReadyBtn,0);

	if isReadyBtn then 
		delete(self.m_readyCountDownAnim);
		self.m_readyCountDownAnim = nil;
	else
		delete(self.m_changeTableCountDownAnim);
		self.m_changeTableCountDownAnim = nil;
	end 
end


ReadyView.s_controlConfig = {
	[ReadyView.s_controls.btn_view]			= {"btn_view"};
	[ReadyView.s_controls.changeTableBtn]	= {"btn_view","changeTableBtn"};
	[ReadyView.s_controls.readyBtn]			= {"btn_view","readyBtn"};
};

ReadyView.s_controlFuncMap = {
	[ReadyView.s_controls.changeTableBtn]	= ReadyView.onChangeBtnClick;
	[ReadyView.s_controls.readyBtn]			= ReadyView.onReadyBtnClick;
};

ReadyView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGIN]			= "loginGameTable";
	[GameMechineConfig.STATUS_LOGOUT]			= "logout";
	[GameMechineConfig.STATUS_READY]			= "showReady";
	[GameMechineConfig.STATUS_START]			= "startGame";
	[GameMechineConfig.STATUS_PLAYING]			= "startGame";
	[GameMechineConfig.STATUS_GAMEOVER]			= "gameover";
};

ReadyView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_PLAYAGAIN]			= "onReadyBtnClick";
	[GameMechineConfig.ACTION_AUTO_READY]			= "onReadyBtnClick";
	[GameMechineConfig.ACTION_NS_CHANGETABLE]		= "onHandleChangeTable";
	[GameMechineConfig.ACTION_NS_ROOMUPCHANGE]		= "onRoomUpChange";
	[GameMechineConfig.ACTION_NS_SHOWRWNDVIEW]		= "onShowReadyView";
	[GameMechineConfig.ACTION_NS_HIDRWNDVIEW]		= "onHidReadyView";
	[GameMechineConfig.ACTION_JIFEN_GAMEOVER]		= "onShowReadyView";
};

return ReadyView;
