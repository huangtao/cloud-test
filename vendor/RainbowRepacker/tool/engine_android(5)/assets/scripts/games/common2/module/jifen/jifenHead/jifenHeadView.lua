local viewBase = Import("games/common2/module/viewBase");

local JiFenHeadView = class(viewBase,false);

JiFenHeadView.s_controls = {
	selectBtn = ToolKit.getIndex();
	inviteBtn = ToolKit.getIndex();
	changeBtn = ToolKit.getIndex();
};


JiFenHeadView.ctor = function(self,seat,layoutConfig)
	super(self,layoutConfig);
	self.m_ctrls = JiFenHeadView.s_controls;
	self:setSize(self.m_root:getSize());
	self.m_seat = seat;
	
	self:_setViewsVisible(true,true,false);
end

JiFenHeadView.dtor = function(self)
	self.m_seat = nil;
end

JiFenHeadView.parseConfig = function(self,config)
	config = table.verify(config);
	self.m_isNeedChangeSeate = config.isNeedChangeSeate;
	self:_setViewsVisible(true,true,false);
end
-----------------------------------------------------------------------------
JiFenHeadView.onUserLogin = function(self,seat, uid, info, isFast)
	Log.d("JiFenHeadView.onUserLogin seat = ",seat);
	self:_setViewsVisible(false,false,true);
end

JiFenHeadView.onUserReady = function(self,seat, uid, info, isFast)
	Log.d("JiFenHeadView.onUserReady seat = ",seat);
	self:_setViewsVisible(false,false,false);
end

JiFenHeadView.onUserLogout = function(self,seat, uid, info, isFast)
	Log.d("JiFenHeadView.onUserLogout seat = ",seat);
	self:_setViewsVisible(true,true,false);
end

JiFenHeadView.onGameStart = function(self,seat,uid,info,isFast)
	self:onHideChangeSeate();
end

JiFenHeadView.onGameOver = function(self,seat, uid, info, isFast)
	Log.d("JiFenHeadView.onGameOver seat = ",seat);
	self:_setViewsVisible(false,false,true);
end

JiFenHeadView.onJiFenFinished = function(self,seat,uid,info,isFast)
	self.m_isHideChangeSeate = nil;
	self:_setViewsVisible(self.m_isNeedShowSelect,self.m_isNeedShowInvite,self.m_isNeedShowChange);
end

JiFenHeadView.onHideChangeSeate = function(self,seat, uid, info, isFast)
	self.m_isHideChangeSeate = true;

	self:_setViewsVisible(self.m_isNeedShowSelect,self.m_isNeedShowInvite,self.m_isNeedShowChange);
end
-----------------------------------------------------------------------------

JiFenHeadView.onSelectBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenSelectEmptySeat, true, true);

	if self:_checkCanChangeSeat() then 
		self:_handleChangeSeate(false);
	end 
end

JiFenHeadView.onInviteBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenInvite, true, true);
	local action = GameMechineConfig.ACTION_NS_REQUESTINVITELIST;
	local inviteType = InviteConfig.TYPE_PRIVATE_ROOM;
    MechineManage.getInstance():receiveAction(action, inviteType);
end

JiFenHeadView.onChangeBtnClick = function(self)
	ReportIsolater.getInstance():report(UBConfig.kPrivateJiFenChangeSeat, true, true);

	if self:_checkCanChangeSeat() then 
		self:_handleChangeSeate(true);

		self:_showToast("换座请求已发出...");
	end 
end

JiFenHeadView._handleChangeSeate = function(self,hasUser)
	local info = {};
	info.sUid = UserBaseInfoIsolater.getInstance():getUserId();
	info.sSeatId = PlayerSeat.getInstance():getMyServerSeatId();
	info.tUid = 0;
	info.tSeatId  = PlayerSeat.getInstance():getServerSeat(self.m_seat);

	if hasUser then 
		local player = GamePlayerManager2.getInstance():getPlayerBySeat(self.m_seat);
		if player then 
			info.tUid = player:getMid();
		end 
	end 
	Log.d("JiFenHeadView","_handleChangeSeate","info = ",info);
	if info.sSeatId ~= -1 then 
		SocketIsolater.getInstance():sendMsg(CLIENT_APPLY_JIFEN_ROOM_CHANGE_SEAT,info);
	end 
end
-----------------------------------------------------------------------------
JiFenHeadView._setViewsVisible = function(self,isShowSelect,isShowInvite,isShowChange)
	local selectBtn = self:findViewById(self.m_ctrls.selectBtn);
	local inviteBtn = self:findViewById(self.m_ctrls.inviteBtn);
	local changeBtn = self:findViewById(self.m_ctrls.changeBtn);

	selectBtn:setVisible(isShowSelect);
	inviteBtn:setVisible(isShowInvite);
	changeBtn:setVisible(isShowChange);
	self.m_isNeedShowSelect = isShowSelect;
	self.m_isNeedShowInvite = isShowInvite;
	self.m_isNeedShowChange = isShowChange;

	if (not self.m_isNeedChangeSeate) or self.m_isHideChangeSeate then 
		selectBtn:setVisible(false);
		changeBtn:setVisible(false);
	end 
end

JiFenHeadView._checkCanChangeSeat = function(self)
	local time = os.time();
	if self.m_lastTime and time - self.m_lastTime < 5 then
		self:_showToast("不能频繁操作！");
		return false;
	else
		self.m_lastTime = time;
	end

	local myMid = UserBaseInfoIsolater.getInstance():getUserId();
	local player = GamePlayerManager2.getInstance():getPlayerByMid(myMid);
	local isReady;
	if player then
		isReady = player:isReady();
	end 
	if isReady then 
		self:_showToast("在已准备状态下，不可更换座位！");
	end 
	return not isReady;
end

JiFenHeadView._showToast = function(self,msg)
	if msg and msg ~="" then 
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end 
end
-----------------------------------------------------------------------------
JiFenHeadView.s_controlConfig = 
{	
	[JiFenHeadView.s_controls.selectBtn]			= {"selectBtn"};
	[JiFenHeadView.s_controls.inviteBtn]			= {"inviteBtn"};
	[JiFenHeadView.s_controls.changeBtn]			= {"changeBtn"};
};

JiFenHeadView.s_controlFuncMap =
{
	[JiFenHeadView.s_controls.selectBtn]			 	= JiFenHeadView.onSelectBtnClick;
	[JiFenHeadView.s_controls.inviteBtn]			 	= JiFenHeadView.onInviteBtnClick;
	[JiFenHeadView.s_controls.changeBtn]			 	= JiFenHeadView.onChangeBtnClick;
};

JiFenHeadView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_NONE]						= "onUserLogout";	
	[GameMechineConfig.STATUS_LOGIN]					= "onUserLogin";
	[GameMechineConfig.STATUS_READY]					= "onUserReady";
	[GameMechineConfig.STATUS_LOGOUT]					= "onUserLogout";
	[GameMechineConfig.STATUS_START]					= "onGameStart";
	[GameMechineConfig.STATUS_GAMEOVER]					= "onGameOver";
};


JiFenHeadView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_JIFEN_FINISHED]			= "onJiFenFinished";
};

return JiFenHeadView;

