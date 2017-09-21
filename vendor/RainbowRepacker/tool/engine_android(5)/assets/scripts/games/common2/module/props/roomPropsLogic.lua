
require("games/common2/module/props/vipKickConfig2");

RoomPropsLogic = class(DataInterfaceBase);

--[[
	房间内使用道具
]]

RoomPropsLogic.propCmds = {
	PROPS_NO_ENOUGH = 0,	-- 道具不足
	PROPS_VIP 		= 1,	-- VIP道具
	PROPS_OUTDATE	= 2,	-- 道具过时
	PROPS_NORMAL	= 3,	-- 正常使用
}

RoomPropsLogic.getInstance = function()
	if not RoomPropsLogic.s_instance then
		RoomPropsLogic.s_instance = new(RoomPropsLogic);
	end
	return RoomPropsLogic.s_instance;
end

RoomPropsLogic.releaseInstance = function()
	delete(RoomPropsLogic.s_instance);
	RoomPropsLogic.s_instance = nil;
end

RoomPropsLogic.ctor = function(self)
	PropIsolater.getInstance():setObserver(self);
	EventDispatcher.getInstance():register(GameMechineConfig.BROADCAST_ACTION,self,self.monitoringAction);
end

RoomPropsLogic.dtor = function(self)
	PropIsolater.getInstance():clearObserver(self);
	EventDispatcher.getInstance():unregister(GameMechineConfig.BROADCAST_ACTION,self,self.monitoringAction);
end

RoomPropsLogic.monitoringAction = function(self,action,seat,uid,info,isFast)
	if self.s_actionFuncMap and type(self.s_actionFuncMap[action])=="function" then
        self.s_actionFuncMap[action](self,seat,uid,info,isFast);
    end
end

------------------------- 社交道具逻辑开始  --------------------------------------

 --[Comment]
-- 请求使用道具
-- propInfo：道具信息
-- targets：使用者与被使用者座位，格式：1，2
RoomPropsLogic.onRequestUseProps = function (self, cmd, propInfo, targetMid)

	if cmd == RoomPropsLogic.propCmds.PROPS_NO_ENOUGH then 
		-- 不足
		Toast.getInstance():showText(kTextNoTypeProp,50,30,kAlignLeft,"",26,200,175,110);
		return;
	elseif cmd == RoomPropsLogic.propCmds.PROPS_OUTDATE then 
		-- 过期
		Toast.getInstance():showText(kTextPropDue,50,30,kAlignLeft,"",26,200,175,110);
		return;
	elseif cmd == RoomPropsLogic.propCmds.PROPS_VIP then 
		-- 会员使用
		return;
	elseif cmd == RoomPropsLogic.propCmds.PROPS_NORMAL then
		local localseat = PlayerSeat.getInstance():getMyLocalSeat();
		-- self:notify(RoomPropsLogic.Delegate.onHidPlayerInfo,localseat);		
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_CLOSEPLAYERWND);
	end

	local targetInfo = GamePlayerManager2.getInstance():getPlayerByMid(targetMid);
	if not targetInfo then
		return ;
	end

	if targetMid == UserBaseInfoIsolater.getInstance():getUserId()then 
		self:showToast("社交道具无法对自己使用");		-- 不可对自己使用道具
	else
		local targets = string.format("%d,%d", GamePlayerManager2.getInstance():getPlayerBySeat(GameConstant.SEAT_LOCAL_MINE):getSeatId(), targetInfo:getSeatId());
		PropIsolater.getInstance():requestUseProp(propInfo.type, 1,targets);
	end
end

-- 使用踢人卡
RoomPropsLogic.onResponseKick = function(self,seat,uid,data,isFast)
	Log.d("RoomPropsLogic.onResponseKick",data)
	if type(data) == "table" then

		if data.errorcode ~= 0 then
			self:handleKickEvent(data.errorcode);
			return;
		end

		if data.vipuid ~= UserBaseInfoIsolater.getInstance():getUserId() then
			if data.kickuid == UserBaseInfoIsolater.getInstance():getUserId() then
				-- 自己被踢出房间，请求退出
				local action = GameMechineConfig.ACTION_NS_KICKOUT_SUCCESS;
				MechineManage.getInstance():receiveAction(action, {}, data.kickuid);
			end
		else
			local action = GameMechineConfig.ACTION_SHOWKICKANIM;
			MechineManage.getInstance():receiveAction(action, data);
		end
	end
end

RoomPropsLogic.showToast = function(self,msg)
	if not string.isEmpty(msg) then
		Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
	end
end

RoomPropsLogic.handleKickEvent = function ( self, errorCode )
	-- body
	self:showToast(KICK_STR2[errorCode] or "踢人失败");
	if errorCode == KICK_CODE2.VIP_OUTTIME or errorCode == KICK_CODE2.NO_KICK_PROP then
		-- if errorCode == KICK_CODE2.VIP_OUTTIME then
		-- 刷新VIP状态
			UserIdentityIsolater.getInstance():setNormalIdentity();
			UserIdentityIsolater.getInstance():refreshUserIdentity(0, UserIdentityIsolater.getInstance():getIdentity());
			local action = GameMechineConfig.ACTION_NS_UPDATE_USERINFO;
			MechineManage.getInstance():receiveAction(action);
		-- end
		-- 走vip充值
		UBReport.getInstance():report(UBConfig.kHallGetVipKick);
		PayIsolater.getInstance():setSceneType(UBPaySceneConfig.kRoomUserInfoVipRecharge);
		local action = GameMechineConfig.ACTION_RECHARGE;
		local data = {scene=PayIsolater.eGoodsListId.VipCharge};
		MechineManage.getInstance():receiveAction(action,data);
	end
end