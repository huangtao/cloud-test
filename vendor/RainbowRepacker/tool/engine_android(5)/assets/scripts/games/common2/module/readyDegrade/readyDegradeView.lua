local ViewBase = require("games/common2/module/viewBase");

require("games/common2/module/readyDegrade/readyDegradeData");

local ReadyDegradeView = class(ViewBase,false);

ReadyDegradeView.ctor = function ( self, seat, layoutConfig )
	super(self,nil);
	self:setFillParent(true,true);
	self.m_seat = seat;
end

ReadyDegradeView.dtor = function (self)
	self:_stopWaitAnim();

	delete(self.m_readyDegradeData);
	self.m_readyDegradeData = nil;
end
-----------------------------------------------------------------------------------
ReadyDegradeView.onUserLogin = function(self,seat, uid, info, isFast)
	if self.m_waitingLevelId then 
		local curLevelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
		if curLevelId ~= self.m_waitingLevelId and self:getIsDuringChangeDegrade() then --降场进入不同等级的房间，情况存储的降场数据
			self.m_waitingLevelId = nil;
			self:setIsDuringChangeDegrade(false);
			self:setReadyDegradeSavedMoney(0);
		else--换桌进入相同等级的桌子 

		end 
	end 
end 

ReadyDegradeView.onUserReady = function(self,seat, uid, info, isFast)
	if isFast then 
		return;
	end 

	if self.m_waitingLevelId then --等待开局过程中换桌，进入了等级相同的不同桌
		self:_handleResumeDegradeLogic();

	else --刚开始等待开局，或进入了不同等级的桌子
		self:_handleStartDegradeLogic();
	end 
end

ReadyDegradeView.startGame = function(self)
	self:_stopWaitAnim();
	self.m_waitingLevelId = nil;

	if self.m_degradeTipsWnd then 
		self.m_degradeTipsWnd:hide();
	end
end

ReadyDegradeView.onUserLogout = function ( self, seat, uid, info, isFast )
	if self:getIsDuringChangeDegrade() then		
		if self.m_needSaveMoney then 
			--请求存钱
			self:requestSaveMoney(self.m_needSaveMoney);
		else
			local action = GameMechineConfig.ACTION_NS_CHANGEDEGRADE_ANIM;
			MechineManage.getInstance():receiveAction(action,nil,nil,nil,"ReadyDegradeView.onUserLogout");

			--直接请求进新房间，自动准备
			self:requestLoginAndReady();
		end 		
	end
end

---------------------------------------------------------------------------------
ReadyDegradeView._handleStartDegradeLogic = function(self)
	self:_stopWaitAnim();

	if self:checkIsNeedDegrade() then 
		local waitTime = self:_getLevelConfigInfoByName("readyDegradeTime");
		waitTime = tonumber(waitTime) or 0;

		if waitTime > 0 then 
			self.m_waitingLevelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
			self:_startWaitAnim(waitTime);
		end 
	end
end

ReadyDegradeView._handleResumeDegradeLogic = function(self) 
	if not self.m_remainTime then --在换桌过程中，原来的等待时间结束了
		self:_startWaitAnim(3);
	else 
		local remainTime = self.m_remainTime + 3;
		local waitTime = self:_getLevelConfigInfoByName("readyDegradeTime");
		waitTime = number.valueOf(waitTime);

		remainTime = remainTime <= waitTime and remainTime or waitTime;

		self.m_remainTime = remainTime;
	end 
end

ReadyDegradeView.checkIsNeedDegrade = function(self)
	if self:_isCloseToday() then 
		Log.d("ReadyDegradeView.checkIsNeedDegrade ==> CloseToday");
		return false;
	end

	if not self:_getLevelConfigInfoByName("readyDegradeSwitch") then 
		Log.d("ReadyDegradeView.checkIsNeedDegrade ==> switch close");
		return false;
	end 

	local newLevelId = self:_getLowerLevelId();
	Log.d("ReadyDegradeView.checkIsNeedDegrade","newLevelId = ",newLevelId);
	return newLevelId ~= -1;
end

-----------------------------------------------------------------------------
ReadyDegradeView._startWaitAnim = function(self,time)
	self:_stopWaitAnim();

	self.m_remainTime = number.valueOf(time);

	self.m_waitingTimer = AnimFactory.createAnimInt(kAnimLoop, 0, 1, 1000, 0);
	self.m_waitingTimer:setDebugName("ReadyDegradeView|waitingTimer");
	self.m_waitingTimer:setEvent(nil,function()
		self.m_remainTime = self.m_remainTime -1;
		Log.d("ReadyDegradeView._startWaitAnim","self.m_remainTime = ",self.m_remainTime);

		if self.m_remainTime == 0 then 
			self:_onWaitFinished();
		end 
	end);
end

ReadyDegradeView._onWaitFinished = function(self)
	self:_stopWaitAnim();
	self.m_needSaveMoney = nil;
	Log.d("ReadyDegradeView._onWaitFinished","self.m_curState = ",self.m_curState);

	if self.m_curState == GameMechineConfig.STATUS_READY then 
		local newLevelId = self:_getLowerLevelId();
		self.m_newLevelId = newLevelId;

		local maxLoginMoney = self:_getLevelConfigInfoByName("max_money",nil,newLevelId) or -1;
		local userMoney = RoomPropertyData.getInstance():getCurPropertyNum();

		Log.d("ReadyDegradeView._onWaitFinished","maxLoginMoney = ",maxLoginMoney,"userMoney = ",userMoney);

		if maxLoginMoney == -1 then 
			self:showDegradeTipsWnd(newLevelId);

		elseif userMoney <= maxLoginMoney then 
			self:showDegradeTipsWnd(newLevelId);

		elseif userMoney > maxLoginMoney then 

			if SafeBoxIsolater.getInstance():isSafeBoxSwitchOpen() then
				local minLoginMoney = self:_getLevelConfigInfoByName("min_money",nil,newLevelId);
				local saveMoney = userMoney - math.ceil((minLoginMoney+maxLoginMoney)/2);
				self.m_needSaveMoney = saveMoney;

				self:showDegradeTipsWnd(newLevelId);
			else 
				Log.d("ReadyDegradeView._onWaitFinished","保险箱未打开");
			end 
		end 
	end 
end

ReadyDegradeView._stopWaitAnim = function(self)
	self.m_remainTime = nil;

	delete(self.m_waitingTimer);
	self.m_waitingTimer = nil;
end 

----------------------------------------------------------------------------------
ReadyDegradeView.showDegradeTipsWnd = function(self,newLevelId)
	Log.d("ReadyDegradeView.showDegradeTipsWnd");

	local baseChip = self:_getLevelConfigInfoByName("baseChip",nil,newLevelId);
	self:createDegradeTipsWnd();
	self.m_degradeTipsWnd:setData(baseChip);

	if DialogLogic.getInstance():getStackNum() > 0 then 
		DialogLogic.getInstance():pushDialogStack(self,self._handleShowDegradeTipsWnd);
	else 
		self:_handleShowDegradeTipsWnd();
	end 
end

ReadyDegradeView._handleShowDegradeTipsWnd = function(self)
	if self.m_degradeTipsWnd then 
		self.m_degradeTipsWnd:show();
	end 
end

ReadyDegradeView.createDegradeTipsWnd = function(self)
	if not self.m_degradeTipsWnd then 
		local ReadyDegradeTipsWnd = Import("games/common2/module/readyDegrade/readyDegradeTipsWnd")
		self.m_degradeTipsWnd = new(ReadyDegradeTipsWnd);
		self.m_degradeTipsWnd:setDelegate(self);
		self:addChild(self.m_degradeTipsWnd);
	end 
end

--选择降场换桌
ReadyDegradeView.onSelecteChange = function(self)
	Log.d("ReadyDegradeView.onSelecteChange");
	self:setIsDuringChangeDegrade(true);

	if self.m_curState == GameMechineConfig.STATUS_NONE or self.m_curState == GameMechineConfig.STATUS_LOGOUT then
		--是否需要存钱，请求进入新房间
		
		self:onUserLogout();
	else
		-- 先请求登出，在进入房间

		SocketIsolater.getInstance():sendMsg(ROOM_SEND_LOGOUT);
	end
end

--选择继续等待
ReadyDegradeView.onSelecteWait = function(self,isCloseTips)
	if isCloseTips then 
		self.m_waitingLevelId = nil;
		self:_setCloseTipsToday();
	else 
		self:_handleStartDegradeLogic();
	end 
end

------------------------------------------------------------------
ReadyDegradeView.setIsDuringChangeDegrade = function(self,isChanging)
	local readyDegradeData = self:_getReadyDegradeData();
	readyDegradeData:setIsDuringChangeDegrade(isChanging);
end

ReadyDegradeView.getIsDuringChangeDegrade = function(self)
	local readyDegradeData = self:_getReadyDegradeData();
	return readyDegradeData:getIsDuringChangeDegrade();
end

ReadyDegradeView.setReadyDegradeSavedMoney = function(self,saveMoney)
	local readyDegradeData = self:_getReadyDegradeData();
	readyDegradeData:setReadyDegradeSavedMoney(saveMoney);
end

ReadyDegradeView._isCloseToday = function(self)
	local readyDegradeData = self:_getReadyDegradeData();

	return readyDegradeData:isCloseReadyDegradeToday();
end

ReadyDegradeView._setCloseTipsToday = function(self)
	local readyDegradeData = self:_getReadyDegradeData();
	readyDegradeData:setCloseReadyDegradeToday();
end

ReadyDegradeView._getReadyDegradeData = function(self)
	if not self.m_readyDegradeData then 
		self.m_readyDegradeData = new(ReadyDegradeData);
	end 

	return self.m_readyDegradeData;
end
-----------------------------------------------------------------------
ReadyDegradeView._getLevelConfigInfoByName = function(self,configName,gameId,levelId)
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local curLevelId = GameInfoIsolater.getInstance():getCurRoomLevelId();

	return GameInfoIsolater.getInstance():getPropByLevelPropName(gameId or curGameId,levelId or curLevelId,configName);
end

ReadyDegradeView._getLowerLevelId = function(self)
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local curLevelId = GameInfoIsolater.getInstance():getCurRoomLevelId();

	local levelIdList = GameInfoIsolater.getInstance():getLevelIdMatchPlayTypeAndMoneyTypeByLevelId(curGameId,curLevelId);
	table.sort(levelIdList, function(a, b)
		if a and b then
			return a < b;  
		end
	end);

	local newLevelId = -1;
	for i = #levelIdList,1,-1 do 
		if levelIdList[i] < curLevelId then 
			newLevelId = levelIdList[i];
			break;
		end 
	end 

	return newLevelId;
end

------------------------------------------------------------------------------------------------
ReadyDegradeView.requestSaveMoney = function(self,saveMoney)
	SafeBoxIsolater.getInstance():updateSafeBox(1, math.abs(saveMoney),RoomPropertyData.getInstance():getCurPropertyId());
end

-- 存款结果
ReadyDegradeView.onUpdateSafeBoxCallBack = function(self, seat, uid, info, isFast)
	if not self:getIsDuringChangeDegrade() then 
		return;
	end 
	info = table.verify(info);

	if info.isSuccess then
		data = table.verify(info.data);
		local money = number.valueOf(data.money);

		self:setReadyDegradeSavedMoney(money);
		
		--弹存款提示，请求进入新房间
		self:showSavedMoneyTipsWnd(money);
		self:requestLoginAndReady();
	else
		--强制退出
		local action = GameMechineConfig.ACTION_NS_FORCE_EXIT;
		MechineManage.getInstance():receiveAction(action,nil,nil,nil,"ReadyDegradeView.onUpdateSafeBoxCallBack");
	end
end

ReadyDegradeView.showSavedMoneyTipsWnd = function(self,savedMoney)
	self:createSavedMoneyTipsWnd();
	self.m_savedMoneyTipsWnd:show(savedMoney);
end

ReadyDegradeView.createSavedMoneyTipsWnd = function(self)
	if not self.m_savedMoneyTipsWnd then
		local ReadyDegradeSavedMoneyTipsWnd = Import("games/common2/module/readyDegrade/readyDegradeSavedMoneyTipsWnd");
		self.m_savedMoneyTipsWnd = new(ReadyDegradeSavedMoneyTipsWnd);
		self:addChild(self.m_savedMoneyTipsWnd);
	end 
end

ReadyDegradeView.requestLoginAndReady = function(self)
	GameRoomData.getInstance():setRoomLevel(self.m_newLevelId);
	GameInfoIsolater.getInstance():setCurRoomLevelId(self.m_newLevelId);
	self.m_newLevelId = nil;

	local action = GameMechineConfig.ACTION_AUTO_READY;
    MechineManage.getInstance():receiveAction(action,nil,nil,nil,"ReadyDegradeView.requestLoginAndReady");
end


ReadyDegradeView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGIN]			= "onUserLogin";
	[GameMechineConfig.STATUS_READY]			= "onUserReady";
	[GameMechineConfig.STATUS_START]			= "startGame";
	[GameMechineConfig.STATUS_LOGOUT]			= "onUserLogout";
};

ReadyDegradeView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_SAFEBOXRESULT]		= "onUpdateSafeBoxCallBack";
};

return ReadyDegradeView;