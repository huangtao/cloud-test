

--[[
	房间支付逻辑处理
]]
local ViewBase = require("games/common2/module/viewBase");

local RoomRecharge = class(ViewBase, false);

RoomRecharge.Delegate = {
	pushOtherState 		 	= "pushOtherState",
};

RoomRecharge.ctor = function(self)
	super(self);
    self:setFillParent(true, true);
end

RoomRecharge.dtor = function(self)
end

-- 购买商品
RoomRecharge.startRecharge = function(self,action,uid,info)
	Log.v("RoomRecharge.startRecharge", info);
	local scene = info.scene or PayIsolater.eGoodsListId.RoomPay;
	local _param = {
      		scene = scene,
      		gameid = GameInfoIsolater.getInstance():getCurGameId(),
      		level = GameInfoIsolater.getInstance():getCurRoomLevelId()
      	};
    info.param = info.param or _param;
	StateMachine.getInstance():pushState(States.ShortCutRecharge,nil,true,scene,info.param,info.goodInfo,info.isOnlySupportSMS);
end

-- 购买道具
RoomRecharge.startRechargeProps = function(self,scene,pid,isOnlySupportSMS)
	self:execDelegate(RoomRecharge.Delegate.pushOtherState,scene,param,goodInfo,isOnlySupportSMS);
end

RoomRecharge.s_actionFuncMap = { 
    [GameMechineConfig.ACTION_RECHARGE]          = "startRecharge";  
};

return RoomRecharge;