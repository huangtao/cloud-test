local viewBase = Import("games/common2/module/viewBase");

local JiFenExtraBtnView = class(viewBase,false);

JiFenExtraBtnView.s_controls = {
	createAgainBtn = ToolKit.getIndex();
	recordBtn 	   = ToolKit.getIndex();
};

JiFenExtraBtnView.ctor = function(self,seat,layoutConfig)
	super(self,layoutConfig);
	self.m_ctrls = JiFenExtraBtnView.s_controls;
	self.m_seat = seat;
	self:setFillParent(true,true);

	self:initView();
end

JiFenExtraBtnView.dtor = function(self)
end

JiFenExtraBtnView.parseConfig = function(self,config)
	config = table.verify(config);

	local function _init(ctrl,btnConfig)
		btnConfig = table.verify(btnConfig);

		local btn = self:findViewById(ctrl);
		if btn then 
			if btnConfig.align then 
				btn:setAlign(btnConfig.align);
			end 

			if btnConfig.x and btnConfig.y then 
				btn:setPos(btnConfig.x,btnConfig.y);
			end 

			if btnConfig.file and btnConfig.file ~= "" then 
				btn:setFile(btnConfig.file);
				local w = btn.m_res:getWidth();
				local h = btn.m_res:getHeight();
				btn:setSize(w,h);
			end 

			btn:setVisible(btnConfig.visible == nil and true or btnConfig.visible);
		end 
	end

	_init(self.m_ctrls.createAgainBtn,config.createAgainConfig);
	_init(self.m_ctrls.recordBtn,config.recordConfig);
end

JiFenExtraBtnView.initView = function(self)
	self:hideCreateAgainBtn();
end
------------------------------------------------------------------
JiFenExtraBtnView.onCreateAgainBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenCreateAgain, true, true);

	self:onHanleCreateAgain();
end

JiFenExtraBtnView.onRecordBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenPlayRecord, true, true);

	local action = GameMechineConfig.ACTION_NS_JIFEN_RECORD_CLICK;
	MechineManage.getInstance():receiveAction(action);
end

------------------------------------------------------------------
JiFenExtraBtnView.onHanleCreateAgain = function(self)
	SocketIsolater.getInstance():sendMsg(CLIENT_COMMAND_JIFEN_ROOM_CONTINUE_PLAY);
end

JiFenExtraBtnView.onGameStart = function(self)
	if not self.m_isDuringJiFenGame then 
		local action = GameMechineConfig.ACTION_JIFEN_STARTGAME;
		MechineManage.getInstance():receiveAction(action);
	end 
	self.m_isDuringJiFenGame = true;

	self:hideCreateAgainBtn();

	MessageBox.hide();
end

JiFenExtraBtnView.onJiFenFinished = function(self)
	self.m_isWaitExecuteContinuePlay = true;
	self.m_isDuringJiFenGame = nil;

	self:showCreateAgainBtn();
end

JiFenExtraBtnView.onBroadcastJiFenContinuePlay = function(self)
	self.m_isWaitExecuteContinuePlay = nil;
	self:hideCreateAgainBtn();
end

JiFenExtraBtnView.onBroadcastJiFenMaster = function(self)
	if self.m_isWaitExecuteContinuePlay then 
		self:showCreateAgainBtn();
	else 
		self:hideCreateAgainBtn();
	end 
end
------------------------------------------------------------------
JiFenExtraBtnView.showCreateAgainBtn = function(self)
	local isMaster;
	local player = GamePlayerManager2.getInstance():getPlayerBySeat(self.m_seat);
	if player then 
		isMaster = player:getInfoByType("isMaster");
	end 

	if isMaster then 
		local action = GameMechineConfig.ACTION_NS_HIDRWNDVIEW;
		MechineManage.getInstance():receiveAction(action);

		local action = GameMechineConfig.ACTION_NS_REFRESH_READY_STATUS;
		MechineManage.getInstance():receiveAction(action,{isShow = false});
	else 
		if not player:isReady() then 
			local action = GameMechineConfig.ACTION_NS_SHOWRWNDVIEW;
			MechineManage.getInstance():receiveAction(action);
		end 
	end 
	local createAgainBtn = self:findViewById(self.m_ctrls.createAgainBtn);
	createAgainBtn:setVisible(isMaster);
end

JiFenExtraBtnView.hideCreateAgainBtn = function(self)
	local createAgainBtn = self:findViewById(self.m_ctrls.createAgainBtn);
	createAgainBtn:setVisible(false);
end
------------------------------------------------------------------
JiFenExtraBtnView.s_controlConfig = 
{	
	[JiFenExtraBtnView.s_controls.createAgainBtn]			= {"createAgainBtn"};
	[JiFenExtraBtnView.s_controls.recordBtn]				= {"recordBtn"};
};

JiFenExtraBtnView.s_controlFuncMap =
{
	[JiFenExtraBtnView.s_controls.createAgainBtn]		= JiFenExtraBtnView.onCreateAgainBtnClick;
	[JiFenExtraBtnView.s_controls.recordBtn]			= JiFenExtraBtnView.onRecordBtnClick;
};


JiFenExtraBtnView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_START]					= "onGameStart";
};


JiFenExtraBtnView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_JIFEN_FINISHED]							= "onJiFenFinished";
	[GameMechineConfig.ACTION_NS_JIFEN_FINISHED_CONTINUE_CLICK] 		= "onHanleCreateAgain";
	[GameMechineConfig.ACTION_NS_JIFEN_CONTINUE_PLAY]					= "onBroadcastJiFenContinuePlay";
	[GameMechineConfig.ACTION_NS_JIFEN_MASTER]							= "onBroadcastJiFenMaster";
	[GameMechineConfig.ACTION_NS_JIFEN_SHOW_FINISHED_CONTINUE] 			= "onJiFenFinished";
};

return JiFenExtraBtnView;