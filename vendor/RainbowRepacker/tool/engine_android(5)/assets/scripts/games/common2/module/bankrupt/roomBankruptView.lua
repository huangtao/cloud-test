--[[
	房间破产逻辑处理
]]
local ViewBase = require("games/common2/module/viewBase");

local RoomBankruptView = class(ViewBase, false);

RoomBankruptView.Delegate = {
	requestExit 		 		= "requestExitRoom",
	requestRecharge 		 	= "requestRecharge",
	changeOtherState 		 	= "changeOtherState",
};

RoomBankruptView.ctor = function(self,seat)
	super(self);
	self.m_seat = seat;
    self:setFillParent(true, true);
end

RoomBankruptView.dtor = function(self)
end

-- 结算后检查破产状态
RoomBankruptView.checkIsBankruptAfterGameOver = function(self)
	if self:checkIsBankrupt() then 
		if self:isShowBankruptPayInRoom() then 			
			self:requestBankruptRecharge();
		else
			self:requestExitRoom(); -- 没有房间破产充值的情况下，踢出房间
		end
		return true;
	else 
		return false;
	end
end

-- 调用支付
RoomBankruptView.requestBankruptRecharge = function(self)
    PayIsolater.getInstance():setSceneType(UBPaySceneConfig.KRoomBrokenRecharge);
	local data = {};
	data.param = BankruptIsolater.getInstance():getRoomBankruptParams();
	data.scene = PayIsolater.eGoodsListId.Broken;
	data.isOnlySupportSMS = true;
	local action = GameMechineConfig.ACTION_RECHARGE;
	MechineManage.getInstance():receiveAction(action,data);

end

-- 检查是否破产了
RoomBankruptView.checkIsBankrupt = function(self)
	-- 通过大厅接口获取 
	return RoomPropertyData.getInstance():isMineBankrupt();
end

-- 房间破产，是否需要弹出破产支付弹框
RoomBankruptView.isShowBankruptPayInRoom = function(self)
	return BankruptIsolater.getInstance():isShowBankruptPayInRoom();
end

-- 破产界面跳转，如：免费场，大厅等
RoomBankruptView.changeOtherState = function(self,state,...)
	self:execDelegate(RoomBankruptView.Delegate.changeOtherState,...)
end
-- 破产踢出房间
RoomBankruptView.requestExitRoom = function ( self )
	local action = GameMechineConfig.ACTION_REQUEST_EXIT;
	MechineManage.getInstance():receiveAction(action);
end

RoomBankruptView.onGameOver = function(self,seat,uid,info,isFast)
	if GameInfoIsolater.getInstance():isInMatchRoom() then 
		return;
	end 

	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
		return;
	end 

	local propertyId = RoomPropertyData.getInstance():getCurPropertyId();
	if UserPropertyIsolater.getInstance():checkIsCrystal(propertyId) then
		local userMoney = RoomPropertyData.getInstance():getCurPropertyNum();
		if userMoney > 0 then 
			return;
		end 
	elseif (not self:checkIsBankrupt()) then
		return;
	end  

	local action = GameMechineConfig.ACTION_REQUEST_LOGIN_FALSE_ROOM;
	MechineManage.getInstance():receiveAction(action);
end

RoomBankruptView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_GAMEOVER]	= "onGameOver";
}

RoomBankruptView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT]	= "checkIsBankruptAfterGameOver";
};

return RoomBankruptView;