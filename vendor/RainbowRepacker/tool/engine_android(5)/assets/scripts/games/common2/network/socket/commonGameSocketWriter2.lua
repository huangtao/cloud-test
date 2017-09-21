
CommonGameSocketWriter2 = class(CommonSocketWriter);

CommonGameSocketWriter2.ctor = function(self)
	self.m_logFileName = "CommonGameSocketWriter2";
end

CommonGameSocketWriter2.log = function(self,...)
	local fileName = self:getBaseLogFileName();
	Log.addModuleCache(fileName,...);	
end 

CommonGameSocketWriter2.getBaseLogFileName = function(self)
	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local fileName = GameInfoIsolater.getInstance():getGamePackageName(gameId);

	return fileName or "commonRoom";
end 

--全局公用 大厅请求房间
CommonGameSocketWriter2.onSendJoinGame = function(self,packetId,info)
	self.m_socket:writeShort(packetId,info.roomLevel);
	self.m_socket:writeInt(packetId,info.money);
end

--请求登录房间
CommonGameSocketWriter2.onRequestLoginRoom = function(self, packetId, info)
	self.m_socket:writeInt(packetId,info.roomId or 0);--房间id==桌子id
	self.m_socket:writeInt(packetId,info.mid or 0);--用户id
	self.m_socket:writeString(packetId,info.key);--key
	self.m_socket:writeString(packetId,info.userInfo or "");--用户信息，json格式
	self.m_socket:writeInt(packetId,1);--目前内容待定
end

--房间内邀请登录房间
CommonGameSocketWriter2.onRequestLoginRoomForInvite = function(self, packetId, info)
	self.m_socket:writeInt(packetId,info.mid or 0);--用户id
	self.m_socket:writeInt(packetId,info.inviteUid or 0);--邀请人的id
	self.m_socket:writeString(packetId,info.userInfo or "");--邀请人的信息字符串
	Log.i("CommonGameSocketWriter2.onRequestLoginRoomForInvite",info);
end


--登出房间  0x1002
CommonGameSocketWriter2.onRequestExit = function (self, packetId)
	-- do nothing
	Log.d("CommonGameSocketWriter2","onRequestExit 0x1002");
end

--房间内请求准备  0x2001
CommonGameSocketWriter2.onRequestReady = function(self, packetId)
	-- body
	-- 请求准备无内容  空实现
end

--一条指令登录   0x119
CommonGameSocketWriter2.onRequestLoginGameByOneKey = function(self, packetId, info)
	-- body
	self.m_socket:writeInt(packetId, info.gameId or 0);
	self.m_socket:writeInt(packetId, info.levelId or 0);
	self.m_socket:writeString(packetId, info.key or "");
	self.m_socket:writeString(packetId, info.userInfo or "");
	self.m_socket:writeInt(packetId, info.flag or 0);
	self.m_socket:writeShort(packetId, info.changeTableType or 0); -- 0为正常进 1为换桌
	self.m_socket:writeString(packetId, info.extParam or ""); --扩展参数 用于每个游戏的扩展
	self.m_socket:writeInt(packetId,info.gameVersion or 0);
	self.m_socket:writeInt(packetId,info.playType or 0);
	self.m_socket:writeInt(packetId,info.propertyId or 0);
end

--请求ai
CommonGameSocketWriter2.onRequestAi = function ( self, packetId, param )
	Log.wWF("record_bug_ai ","CommonGameSocketWriter2.onRequestAi","info = ",param);
	self.m_socket:writeInt(packetId, param.ai or 0);
	self:log("CommonGameSocketWriter2.onRequestAi,ai = ",param.ai or 0);
end
------全局公用方法，获取房间等级
-- CommonGameSocketWriter2.onSendGetRoomLevel = function(self,packetId,info)
--  	self.m_socket:writeShort(packetId, info.gameId);
--     self.m_socket:writeInt(packetId, info.uid);
--     self.m_socket:writeString(packetId, info.platformId);
--     self.m_socket:writeString(packetId, info.ver);
-- end

--请求ai
CommonGameSocketWriter2.onRequestAi = function ( self, packetId, param )
	Log.wWF("record_bug_ai ","CommonGameSocketWriter2.onRequestAi","info = ",param);
	self.m_socket:writeInt(packetId, param.ai or 0);
end

CommonGameSocketWriter2.onVipKick = function(self, packetId, info)
	self.m_socket:writeInt(packetId, info.beKickedUid or 0);
	self.m_socket:writeString(packetId, info.kickName);
	self.m_socket:writeInt(packetId, info.kickPropNum or 0);
end

-- 请求重连
CommonGameSocketWriter2.onRequestReconnectRoom = function(self,packetId,info)
	-- body
end

--发送文字
CommonGameSocketWriter2.onSendChatText = function ( self, packetId, info )
	self.m_socket:writeString(packetId,info.msg or "");
	self.m_socket:writeShort(packetId,info.index or -1);
end

--发送表情
CommonGameSocketWriter2.onSendFaceImg = function ( self, packetId, param )
	self.m_socket:writeInt(packetId,param.faceValue or 0);
	self.m_socket:writeInt(packetId,param.vipType);
end

CommonGameSocketWriter2.onRequestJiFenKickUser = function(self,packetId,info)
	-- self.m_socket:writeInt(packetId, info.sUid or 0);
	self.m_socket:writeString(packetId,info.sName or "");
	self.m_socket:writeInt(packetId, info.tUid or 0);
	self.m_socket:writeString(packetId,info.tName or "");
end

CommonGameSocketWriter2.onApplyJiFenChangeSeat = function(self,packetId,info)
	self.m_socket:writeInt(packetId, info.sUid or 0);--申请换位置的玩家mid
	self.m_socket:writeInt(packetId,info.sSeatId or -1);
	self.m_socket:writeInt(packetId, info.tUid or 0);--玩家要换座的位置上的玩家id
	self.m_socket:writeInt(packetId, info.tSeatId or -1);--玩家要换座的位置号nSeatId	
end

CommonGameSocketWriter2.onReplyJiFenChangeSeat = function(self,packetId,info)
	self.m_socket:writeInt(packetId,info.replyType or 0);--回复是否同意换座，1：同意，0：不同意
	self.m_socket:writeInt(packetId, info.sUid or 0);--申请换位置的玩家mid
	self.m_socket:writeInt(packetId,info.sSeatId or -1);
	self.m_socket:writeInt(packetId, info.tUid or 0);--玩家要换座的位置上的玩家id
	self.m_socket:writeInt(packetId, info.tSeatId or -1);--玩家要换座的位置号nSeatId
end 

CommonGameSocketWriter2.onRequestJiFenContinuePlay = function(self,packetId,info)
end 

-- 配置解析方法，如果游戏接口特殊，可以继承该类，自定义方法
CommonGameSocketWriter2.s_clientCmdFunMap = {
	[ROOM_SEND_JOIN_GAME] 						= "onSendJoinGame"; -- 进入房间
	[ROOM_SEND_LOGIN] 							= "onRequestLoginRoom"; --请求登录房间
	[ROOM_SEND_LOGOUT] 							= "onRequestExit"; -- 请求退出
	[USER_READY_REQUEST] 						= "onRequestReady"; -- 请求准备
	[ROOM_LOGIN_GAME_ONE_KEY]					= "onRequestLoginGameByOneKey"; -- 一键登录
	-- [REQUEST_ROOMLEVEL]             			= "onSendGetRoomLevel"; --请求房间等级
	[CLIENT_COMMAND_REQUEST_AI] 				= "onRequestAi"; -- 请求托管
	[CLIENT_COMMAND_VIPKICK]					= "onVipKick"; -- VIP踢人
	[ROOM_REQUEST_RECONNECT]					= "onRequestReconnectRoom"; -- 请求重连
	[ROOM_USER_CHAT]							= "onSendChatText"; -- 发送聊天信息
	[ROOM_USER_FACE] 							= "onSendFaceImg"; -- 发送聊天表情
	[ROOM_USER_INVITE]          				= CommonGameSocketWriter2.onRequestLoginRoomForInvite;
	[CLIENT_COMMAND_JIFEN_ROOM_KICK_USER] 		= "onRequestJiFenKickUser";
	[CLIENT_APPLY_JIFEN_ROOM_CHANGE_SEAT]		= "onApplyJiFenChangeSeat";
	[CLIENT_REPLY_JIFEN_ROOM_CHANGE_SEAT]		= "onReplyJiFenChangeSeat";
	[CLIENT_COMMAND_JIFEN_ROOM_CONTINUE_PLAY]	= "onRequestJiFenContinuePlay";
};