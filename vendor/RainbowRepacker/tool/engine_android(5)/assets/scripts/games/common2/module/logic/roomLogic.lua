--[[
	处理房间公共的逻辑、升降场、破产判断等
]]

RoomLogic = class();


RoomLogic.getInstance = function()
	if not RoomLogic.s_instance then
		RoomLogic.s_instance = new(RoomLogic);
	end
	return RoomLogic.s_instance;
end

RoomLogic.releaseInstance = function()
	delete(RoomLogic.s_instance);
	RoomLogic.s_instance = nil;
end

RoomLogic.ctor = function(self)
end

RoomLogic.dtor = function(self)
end

RoomLogic.checkIsLevelDown = function(self)
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
		return false;
	end
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local userMoney = self:getCurRoomProperty();
	local curLevelId = GameRoomData.getInstance():getRoomLevel(); -- 当前房间的level
	if curLevelId == 0 then
		return false;
	end
	
	local newLevelId = GameInfoIsolater.getInstance():getPlayableLevelIdByLoginMoney(curGameId, userMoney, curLevelId);
	return newLevelId < curLevelId;
end


-- 结算时，检测场次升降级
RoomLogic.checkIsLevelUp = function (self,isByLoginMoney)
	Log.d("RoomLogic----checkIsLevelUp" , "isByLoginMoney = ",isByLoginMoney);
	local kickStatus = GameInfoIsolater.getInstance():getKickUserStatus();
	if kickStatus and number.valueOf(kickStatus) == 9001 then
		--此时server要升级，重新走换桌流程
		GameInfoIsolater.getInstance():setKickUserStatus(false);
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_CHANGETABLE);
		return true;
	end

	local flag = false;
	local roomUpLevelInfo = GameInfoIsolater.getInstance():getRoomUpLevelInfo(); -- 升降级信息
	Log.d("RoomLogic----checkIsLevelUp" , "roomUpLevelInfo = ",roomUpLevelInfo);
	if not table.isEmpty(roomUpLevelInfo) then
		if roomUpLevelInfo.flag == 1 then --升级           
			self:_handleLevelUp(roomUpLevelInfo.level);

			flag =  true;
		elseif roomUpLevelInfo.flag == -1 then --降级
			-- 降级时，调用支付
			GameInfoIsolater.getInstance():setRoomUpLevelInfo({});

			self:_handleLevelDown();
			flag = true;
		end
    else
    	if isByLoginMoney then
    		return not self:checkIsLegalPlay();
    	else 
    		return not self:isLegalToPlay();
		end
	end
	return flag;
end

-- 银币发生变化，校验当前场次是否满足继续游戏
-- 根据场次退场银币上下线判断
RoomLogic.isLegalToPlay = function(self)	
	return self:_checkIsLegal(true);
end

--当前场次是否能继续游戏
--根据入场银币上下线来判断
RoomLogic.checkIsLegalPlay = function(self)
	return self:_checkIsLegal(false);
end

--获取当前这个房间对应的资产
RoomLogic.getCurRoomProperty = function(self)
	return RoomPropertyData.getInstance():getCurPropertyNum();
end

-- 检查是否破产了
RoomLogic.checkIsBankrupt = function(self) 
	return  RoomPropertyData.getInstance():isMineBankrupt();
end

-- 房间里面是否显示破产
RoomLogic.isShowBankruptPayInRoom = function(self)
	return BankruptIsolater.getInstance():isShowBankruptPayInRoom();
end

RoomLogic._handleLevelUp = function(self,newLevelId)
	if not newLevelId then 
		return;
	end 
	Log.d("RoomLogic","_handleLevelUp");
	GameRoomData.getInstance():setRoomLevel(newLevelId);
	GameInfoIsolater.getInstance():setCurRoomLevelId(newLevelId);
    MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_ROOMUPCHANGE);
    local data = {exp = 0, level = newLevelId};
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_ROOMLEVELUP_ANIM,data);
	GameInfoIsolater.getInstance():setRoomUpLevelInfo({});
end

RoomLogic._handleLevelDown = function(self)
	Log.d("RoomLogic","_handleLevelDown");
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local curLevelId = GameRoomData.getInstance():getRoomLevel();
	local minLoginMoney = GameInfoIsolater.getInstance():getPropByLevelPropName(curGameId,curLevelId,"min_money");
	minLoginMoney = number.valueOf(minLoginMoney);
	local userMoney = self:getCurRoomProperty();
	
	local diff = minLoginMoney - userMoney;
	local data = {
		gameid = curGameId;
		level = curLevelId;
		scene = PayConfig.eGoodsListId.Degrade,
		cm = diff;
	};
	local info = {};
	info.param = data;
	info.scene = data.scene;
	local action = GameMechineConfig.ACTION_RECHARGE;
	MechineManage.getInstance():receiveAction(action,info);
	GameInfoIsolater.getInstance():setDegradeInfo({});
end

RoomLogic._checkIsLegal = function(self,isByExitMoney)
	if self:checkIsBankrupt() then 
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT);
		return false;
	end 

	local curLevelId = GameRoomData.getInstance():getRoomLevel(); -- 当前房间的level
	if PrivateRoomIsolater.getInstance():checkIsPrivateRoomLevel(curLevelId) then 
		local propertyId = RoomPropertyData.getInstance():getCurPropertyId();
		local userMoney = self:getCurRoomProperty();
		if UserPropertyIsolater.getInstance():checkIsCrystal(propertyId) and userMoney <= 0 then 
			self:_handleLackCrystalInPrivateRoom();
			return false;
		end 

		return true;
	end 

	local curGameId = GameInfoIsolater.getInstance():getCurGameId();
	local userMoney = self:getCurRoomProperty();

	local newLevelId;
	if isByExitMoney then 
		newLevelId = GameInfoIsolater.getInstance():getPlayableLevelIdWithMoney(curGameId, userMoney, curLevelId);
	else 
		newLevelId = GameInfoIsolater.getInstance():getPlayableLevelIdByLoginMoney(curGameId, userMoney, curLevelId);
	end
	if newLevelId and curLevelId > 0 then
		Log.d("RoomLogic._checkIsLegal----","isByExitMoney = ",isByExitMoney,"curLevelId = ",curLevelId," newLevelId = " , newLevelId);
		
		if GameInfoIsolater.getInstance():isLevelExist(curGameId,curLevelId) then
			-- 本地保存的level是合法的
			if newLevelId > curLevelId then --升级
				self:_handleLevelUp(newLevelId);
				GameInfoIsolater.getInstance():setDegradeInfo({});

				return false;
			elseif newLevelId == curLevelId then --保级
		        GameInfoIsolater.getInstance():setCurRoomLevelId(newLevelId);
		        GameInfoIsolater.getInstance():setDegradeInfo({});

		        return true;
		    else --降级
				self:_handleLevelDown();

				return false;
			end
		else
			-- 本地保存的level是非法的
			if _DEBUG then
				debug.traceback();
				error("本地保存的level是非法的");
			end
		end
	end

	return true;
end

RoomLogic._handleLackCrystalInPrivateRoom = function(self)
	local params = {
    	title = "金条不足";
    	text = "你的金条已经不够了，即将离开房间。请在补充金条后再继续约牌。";
    	textColor = {143,92,31};
    	textSize = 30;
    	textAlign = kAlignLeft;		    	
    	okBtnText = "离开房间";
    	okObj = self;
    	okFunc = self._jumpToHall;
    	cancleBtnText = "前往商场";
    	cancleObj = self;
    	cancleFunc = self._jumpToShop;
    	doNeedCloseBtn = true;
    	closeObj = self;
    	closeFunc = self._jumpToHall;
	};
    MessageBox.showWithParams(params);
end

RoomLogic._jumpToShop = function(self)
	PayIsolater.getInstance():jumpToMarket("crystal");
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_FORCE_EXIT);
end

RoomLogic._jumpToHall = function(self)
	GameInfoIsolater.getInstance():setGameToWhereState(States.Hall);
	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_FORCE_EXIT);
end

RoomLogic.s_actionFuncMap = {
}