
require("games/common2/animation/animSocialBomb2");
require("games/common2/animation/animRose2");
require("games/common2/animation/animEgg2");
require("games/common2/animation/animSlippers2");
require("games/common2/animation/envelopeAnim2")
require("games/common2/animation/animLevelUp2");
require("games/common2/animation/animKickOut2");

require("games/common2/module/chatWnd/anim/expressionAnim2");
require("games/common2/module/chatWnd/anim/messageTextAnim2");
require("games/common2/animation/envelopeRefuseAnim");
--[[
	动画逻辑处理
]]
local ViewBase = require("games/common2/module/viewBase");

local RoomAnimView = class(ViewBase, false);

RoomAnimView.ctor = function(self,seat)
	super(self);
	self.m_seat = seat;
    self:setFillParent(true, true);
    self.m_animList = {};
    self.m_animListView = {};
end

RoomAnimView.dtor = function(self)
	if self.m_animList then -- 动画集合
	 	for k, v in pairs(self.m_animList) do
	 		if v.stop then
		 		v:stop();
		 	end
		 	if v.release then
		 		v:release();
		 	end
	 		delete(v);
		end
		self.m_animList = {};
	end

	if self.m_animListView then -- 动画view集合
	 	for k, v in pairs(self.m_animListView) do
	 		delete(v);
		end
		self.m_animListView = {};
	end

	AnimLevelUp2.stop();
	AnimKickOut2.release();
	EnvelopeRefuseAnim.release();
end

-- 踢人
RoomAnimView.updateVipKickSuccessAnim = function(self,seat,uid,info,isFast)
	local kickInfo = GameRoomData.getInstance():getKickUserInfo();
    Log.v("RoomAnimView.updateVipKickSuccessAnim", kickInfo);
    local seatId = kickInfo.seatId or -1;
    local userId = kickInfo.userId;
    local sex = number.valueOf(kickInfo.sex,1);
    local url = kickInfo.url;
    local x,y = kickInfo.x or 0,kickInfo.y or 0;
    local playerNum = PlayerSeat.getInstance():getCurGamePlayerMaxCount();
    if playerNum == 1 then
    	playerNum = nil;
    end
    AnimKickOut2.play(self,seatId,url,sex,96,96,x+(106-96)/2,y,nil,nil,nil,playerNum);
end

-- 互动道具
RoomAnimView.useSocialProp = function(self,seat,uid,info,isFast)
	if GameInfoIsolater.getInstance():checkIsDuringDefenseCheatTime() then
		return;
	end
	local fromSeat = PlayerSeat.getInstance():getLocalSeat(info.seat);
	local toSeat = PlayerSeat.getInstance():getLocalSeat(info.targetSeat);
	Log.d("RoomAnimView.useSocialProp", fromSeat, toSeat);
	if not GamePlayerManager2.getInstance():getPlayerBySeat(fromSeat) or not GamePlayerManager2.getInstance():getPlayerBySeat(toSeat) then
		return;
	end
	local x1, y1 = InteractionInfo.getInstance():getHeadAbsolutePos(fromSeat)-- 使用者坐标位置
	local x2, y2 = InteractionInfo.getInstance():getHeadAbsolutePos(toSeat);		-- 被使用者坐标位置
	if not self.m_animList then  -- 动画集合
		self.m_animList = {};
	end
	local anim = 0;
	local tag = "";
	Log.d("RoomAnimView.useSocialProp start time=:", os.clock());
	if info.propType == PropIsolater.propTypeMap.TYPE_BOMB then					-- 炸弹动画
		anim = new(AnimSocialBomb2, self);
		tag = "bomb" .. fromSeat;
	elseif info.propType == PropIsolater.propTypeMap.TYPE_EGG then				-- 鸡蛋动画
		anim = new(AnimEgg2, self);
		tag = "egg" .. fromSeat;
	elseif info.propType == PropIsolater.propTypeMap.TYPE_ROSE then				-- 鲜花动画
		anim = new(AnimRose2, self);
		tag = "rose" .. fromSeat;
	elseif info.propType == PropIsolater.propTypeMap.TYPE_SHOES then			-- 拖鞋动画
		anim = new(AnimSlippers2, self);
		tag = "shoes" .. fromSeat;
	end
	Log.d("RoomAnimView.useSocialProp ent time=:", os.clock());
	if tag ~= "" then
		Log.d("RoomAnimView--tag=" .. tag);
		if self.m_animList[tag] then
			if self.m_animList[tag].stop then
				self.m_animList[tag]:stop();
			end
			delete(self.m_animList[tag]);
			self.m_animList[tag] = nil;
		end
		self.m_animList[tag] = anim;
		
		self.m_animListView = self.m_animListView or {};
		if self.m_animListView[tag] then
			self:removeChild(self.m_animListView[tag]);
			delete(self.m_animListView[tag]);
			self.m_animListView[tag] = nil;
		end
		local view = self.m_animList[tag]:play({x = x1, y = y1}, {x = x2, y = y2});
		self.m_animListView[tag] = view;
		self:addChild(view);
	end
end

--申请加好友
RoomAnimView.showEnvelopeAnim = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	Log.d("RoomAnimView.onSomeOnApplyMe")
	if not self.m_animList then  -- 道具动画集合
		self.m_animList = {};
	end
	local tag = "envelope_apply";
	if self.m_animList[tag] then
		Log.d("RoomAnimView.onSomeOnApplyMe ==> applyStack")
		self.m_applyStack = table.verify(self.m_applyStack);
		table.insert(self.m_applyStack,{seat,uid,info,isFast});
		return;
	end

	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(info.dseat);
	if not playerInfo then 
		--玩家已经离开
		Log.d("目标已经离开");
		return ;
	end
	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(info.seat);
	if not playerInfo then 
		--玩家已经离开
		Log.d("发送者已经离开");
		return ;
	end
	local startPoint = {};
	local endPoint = {};
	startPoint.x,startPoint.y = InteractionInfo.getInstance():getHeadAbsolutePos(info.seat);
	endPoint.x,endPoint.y = InteractionInfo.getInstance():getHeadAbsolutePos(info.dseat);
	startPoint.x = startPoint.x - 140;
	startPoint.y = startPoint.y - 20;
	if endPoint.x  > System.getScreenWidth()/2 then
		endPoint.x = endPoint.x - 140;
	else
		endPoint.x = endPoint.x - 100;
	end	
	endPoint.y = endPoint.y - 20;

	local anim = new(EnvelopeAnim2,info);
	self.m_animList[tag] = anim;
	self:addChild(self.m_animList[tag]);
	anim:setEndCallBack(self,self.onSomeOnApplyMe);
	self.m_animList[tag]:play(startPoint,endPoint);
end

---申请加好友动画完成回调函数
RoomAnimView.onSomeOnApplyMe = function(self,data)
	local tag = "envelope_apply";
	if self.m_animList[tag] then
		self:removeChild(self.m_animList[tag]);
		delete(self.m_animList[tag]);
		self.m_animList[tag] = nil;
	end

    if data.ducid == UserBaseInfoIsolater.getInstance():getUserCid() then 
        local action = GameMechineConfig.ACTION_NS_FRIENDAPPLY;
    	MechineManage.getInstance():receiveAction(action,data);
    end
    
    self.m_applyStack = table.verify(self.m_applyStack);
    if #self.m_applyStack > 0 then 
    	Log.d("RoomAnimView.onSomeOnApplyMe ==> showEnvelopeAnim")
    	local arg = table.remove(self.m_applyStack,1);
    	self:showEnvelopeAnim(unpack(arg));
    end 
end

--同意加好友
RoomAnimView.showEnvelopeAgreeAnim = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(info.dseat);
	if not playerInfo then 
		--玩家已经离开
		Log.d("目标已经离开");
		return ;
	end
	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(info.seat);
	if not playerInfo then 
		--玩家已经离开
		Log.d("发送者已经离开");
		return ;
	end
	local startPoint = {};
	local endPoint = {};
	startPoint.x,startPoint.y = InteractionInfo.getInstance():getHeadAbsolutePos(info.seat);
	endPoint.x,endPoint.y = InteractionInfo.getInstance():getHeadAbsolutePos(info.dseat);
	startPoint.x = startPoint.x - 140;
	startPoint.y = startPoint.y - 20;
	if endPoint.x  > System.getScreenWidth()/2 then
		endPoint.x = endPoint.x - 140;
	else
		endPoint.x = endPoint.x - 100;
	end	
	endPoint.y = endPoint.y - 20;

	local tag = "envelope_agree";
	if self.m_animList[tag] then
		self:removeChild(self.m_animList[tag]);
		delete(self.m_animList[tag]);
		self.m_animList[tag] = nil;
	end

	local anim = new(EnvelopeAnim2,info);
	self.m_animList[tag] = anim;
	self:addChild(self.m_animList[tag]);
	self.m_animList[tag]:play(startPoint,endPoint);
end 

--拒绝加好友
RoomAnimView.showEnvelopeRefuseAnim = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(info.dseat);
	if not playerInfo then 
		--玩家已经离开
		Log.d("目标已经离开");
		return ;
	end
	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(info.seat);
	if not playerInfo then 
		--玩家已经离开
		Log.d("发送者已经离开");
		return ;
	end

	local x1,y1 = InteractionInfo.getInstance():getHeadAbsolutePos(info.seat);	
	local w1,h1 = InteractionInfo.getInstance():getHeadSize(info.seat);
	local space1 = math.min(w1,h1);
	x1 = x1 + space1/2;
	y1 = y1 + space1/3;

	local x2,y2 = InteractionInfo.getInstance():getHeadAbsolutePos(info.dseat);
	local w2,h2 = InteractionInfo.getInstance():getHeadSize(info.dseat);
	local space2 = math.min(w2,h2);
	x2 = x2 + space2/2;
	y2 = y2 + space2/3;

	EnvelopeRefuseAnim.play({x = x1,y = y1},{x = x2,y = y2});
end

-- 结算时，检测场次升降级
RoomAnimView.showLevelUpAnim = function ( self, seat, uid, info, isFast)
	if info and info.exp and info.level then
		AnimLevelUp2.play(self, info.exp, info.level);
	end
end

RoomAnimView.chatFaceAnim = function ( self, seat, uid, info, isFast)
	local tag = "chatFaceAnim" .. info.seat;
	if self.m_animList[tag] then
		self:removeChild(self.m_animList[tag]);
		delete(self.m_animList[tag]);
		self.m_animList[tag] = nil;
	end
	local anim = new(ExpressionAnim2);
	anim:play(info.seat,info.faceType,info.faceIndex,info.x, info.y,nil,nil, info.align, info.playerNum);
    Log.d("RoomAnimView.chatFaceAnim  ",tag)
	self.m_animList[tag] = anim;
	self:addChild(self.m_animList[tag]);
end

RoomAnimView.chatMsgAnim = function ( self, seat, uid, info, isFast)
	local tag = "chatMsgAnim" .. info.seat
	if self.m_animList[tag] then
		self:removeChild(self.m_animList[tag]);
		delete(self.m_animList[tag]);
		self.m_animList[tag] = nil;
	end
	local anim = new(MessageTextAnim2);
	anim:play(info.chatText, info.x, info.y, info.align, info.sex, info.chatTextConfig,info.seat);
	
	self.m_animList[tag] = anim;
	self:addChild(self.m_animList[tag]);
end

RoomAnimView.showReadyDegradeAnim = function ( self, seat, uid, info, isFast)
	if not self.m_readyDegradeAnim then 
		require("games/common2/animation/readyDegradeAnim");
		self.m_readyDegradeAnim = new(ReadyDegradeAnim);		
		self:addChild(self.m_readyDegradeAnim);
		self.m_readyDegradeAnim:setAlign(kAlignCenter);
	end 
	self.m_readyDegradeAnim:play();
end 

RoomAnimView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_SHOWKICKANIM] 			= "updateVipKickSuccessAnim";
	[GameMechineConfig.ACTION_SHOWPROPNIM] 				= "useSocialProp";
	[GameMechineConfig.ACTION_NS_ENVELOPANIM] 			= "showEnvelopeAnim";
	[GameMechineConfig.ACTION_NS_ENVELOP_AGREE_ANIM] 	= "showEnvelopeAgreeAnim";
	[GameMechineConfig.ACTION_NS_ENVELOP_REFUSE_ANIM] 	= "showEnvelopeRefuseAnim";
	[GameMechineConfig.ACTION_NS_ROOMLEVELUP_ANIM] 		= "showLevelUpAnim";
	[GameMechineConfig.ACTION_NS_CHATFASEANIM] 			= "chatFaceAnim";
	[GameMechineConfig.ACTION_NS_CHATMSGANIM] 			= "chatMsgAnim";
	[GameMechineConfig.ACTION_NS_CHANGEDEGRADE_ANIM]	= "showReadyDegradeAnim";
};
RoomAnimView.s_stateFuncMap = {
}
return RoomAnimView;