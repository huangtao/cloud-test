require("isolater/interface/hallImageRefIsolater");
require("isolater/interface/regionConfigIsolater");

local viewBase = Import("games/common2/module/viewBase");

local JiFenFinishView = class(viewBase,false);

JiFenFinishView.s_controls = {
	contentView = ToolKit.getIndex();
};

JiFenFinishView.ctor = function(self,seat,layoutConfig)
	super(self,layoutConfig);
	self.m_seat = seat;
	self.m_ctrls = JiFenFinishView.s_controls;
	self:setFillParent(true,true);
	self:initView();

	self:setVisible(false);
end

JiFenFinishView.dtor = function(self)
	ImageCache.getInstance():cleanRef(self);
end

JiFenFinishView.parseConfig = function(self,config)
	config = table.verify(config);
	self.m_showFinishView = config.showFinishView;
end

JiFenFinishView.initView = function(self)
end
------------------------------------------------------------------
JiFenFinishView.onCloseBtnClick = function(self)
	self:hide();

	local action = GameMechineConfig.ACTION_REQUEST_EXIT;
	MechineManage.getInstance():receiveAction(action,nil, UserBaseInfoIsolater.getInstance():getUserId(), false, "JiFenFinishView.onCloseBtnClick");
end

JiFenFinishView.onFinishWeiChatBtnClick = function(self)
end

JiFenFinishView.onFinishContinueBtnClick = function(self)
	self:hide();

	local isMaster = self:_checkIsMaster();
	if isMaster then 
		action = GameMechineConfig.ACTION_NS_JIFEN_FINISHED_CONTINUE_CLICK;
	else 
		action = GameMechineConfig.ACTION_NS_PLAYAGAIN;
	end
	MechineManage.getInstance():receiveAction(action);
end

JiFenFinishView.onEmpty = function(self)
end

JiFenFinishView.hide = function(self)
	DialogLogic.getInstance():popDialogStack();

	self:setVisible(false);

	if self.m_isMyselfLeaveJiFenInHalf then 
		local action = GameMechineConfig.ACTION_REQUEST_EXIT;
		MechineManage.getInstance():receiveAction(action,nil, UserBaseInfoIsolater.getInstance():getUserId(), false, "JiFenFinishView.hide");
	end 
	self.m_isMyselfLeaveJiFenInHalf = nil;
end

------------------------------------------------------------------
JiFenFinishView.showFinishedView = function(self,seat, uid, info, isFast)
	if not self.m_showFinishView then
		return;
	end

	if info.leaveUserId and info.leaveUserId == UserBaseInfoIsolater.getInstance():getUserId() then
		self.m_isMyselfLeaveJiFenInHalf = true;
	end 

	self.m_isWaitExecuteContinuePlay = true;

	DialogLogic.getInstance():pushDialogStack(self,self.hide);

	self:_refreshDatas(info);

	self:setVisible(true);
end

JiFenFinishView.onBroadcastJiFenContinuePlay = function(self)
	self.m_isWaitExecuteContinuePlay = nil;
end

JiFenFinishView.onBroadcastJiFenMaster = function(self)
end


JiFenFinishView.onGameStart = function(self)
	self:_getPlayerList();
end

JiFenFinishView.onReceiveJiFenPlayRecord = function(self,seat, uid, info, isFast)
	local recordData = table.verify(info);

	local state = recordData.state;
	if state and state == 3 then
		self:_getPlayerList();
	end
end

------------------------------------------------------------------

JiFenFinishView._refreshDatas = function(self,data)
	self:_refreshRecord(self:_analyseDataRecord(data));
end

JiFenFinishView._refreshRecord = function(self,data)
	if table.isEmpty(data) then
		return;
	end

	if self.m_summaryLayer then
		delete(self.m_summaryLayer);
		self.m_summaryLayer = nil;
	end

	self.m_summaryLayer = PrivateRoomIsolater.getInstance():createRecordSummaryLayer(data);
	if self.m_summaryLayer then
		local contentView = self:findViewById(self.s_controls.contentView);
		self.m_summaryLayer:setFillParent(true, true);
		self.m_summaryLayer:setAlign(kAlignCenter);
		self.m_summaryLayer:setDelegate(self);
		self.m_summaryLayer:setPlayAgain(true);
		contentView:addChild(self.m_summaryLayer);		
	end
end


JiFenFinishView._checkIsMaster = function(self)
	local isMaster;
	local player = GamePlayerManager2.getInstance():getPlayerBySeat(self.m_seat);
	if player then 
		isMaster = player:getInfoByType("isMaster");
	end

	return isMaster;
end

JiFenFinishView.onRecordSummaryLayerClose = function(self)
	self:onCloseBtnClick();
end

JiFenFinishView.onRecordSummaryLayerScreenShot = function(self)
end

JiFenFinishView.onRecordSummaryLayerShare = function(self)
	self:onFinishWeiChatBtnClick();
end
	
JiFenFinishView.onRecordSummaryLayerPlayAgain = function(self)
	self:onFinishContinueBtnClick();
end

JiFenFinishView._analyseDataRecord = function(self, data)
	if table.isEmpty(data) then
		return {};
	end

	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local info = {
		gameId = gameId,
		gameName = GameInfoIsolater.getInstance():getGameName(gameId),
		time = data.time,
		roundsTotal = data.roundsTotal,
		roundsCurrent = data.roundsCurrent,
		propType = UserPropertyIsolater.getInstance():getJifenID(),
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
					winCount = 0,
					propNum = propNum,
					propList = {},
				}

				for i = 1, roundsCount do
					item.propList[i] = v.list[i].wlscore;
					if item.propList[i] > 0 then
						item.winCount = item.winCount + 1;
					end
				end

				table.insert(info.data, item);
				info.roundsCurrent = roundsCount;
			end
		end
	end
    return info;
end


JiFenFinishView._getPlayerByMid = function(self, mid)
	if table.isEmpty(self.m_playerInfo) then
		self:_getPlayerList();
	end

	for k,v in pairs(table.verify(self.m_playerInfo)) do
		if v and v:getMid() == mid then
			return Copy(v);
		end
	end
end

JiFenFinishView._getPlayerList = function(self)
	self.m_playerInfo = GamePlayerManager2.getInstance():getAllPlayer();
end

------------------------------------------------------------------
JiFenFinishView.s_controlConfig = 
{	
	[JiFenFinishView.s_controls.contentView]			= {"contentView"};
};

JiFenFinishView.s_controlFuncMap =
{
	
};


JiFenFinishView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_JIFEN_FINISHED]				= "showFinishedView";
	[GameMechineConfig.ACTION_NS_RECEIVE_JIFEM_RECORD]		= "onReceiveJiFenPlayRecord";
	[GameMechineConfig.ACTION_NS_JIFEN_CONTINUE_PLAY]		= "onBroadcastJiFenContinuePlay";
	[GameMechineConfig.ACTION_NS_JIFEN_MASTER]				= "onBroadcastJiFenMaster";
};

JiFenFinishView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_START]						= "onGameStart";
};

return JiFenFinishView;