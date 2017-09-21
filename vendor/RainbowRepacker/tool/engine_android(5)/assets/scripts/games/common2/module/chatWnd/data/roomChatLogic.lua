
require("games/common2/network/socket/commonGameSocketCmd2");

RoomChatLogic = class(CommonLogic);

RoomChatLogic.Delegate = {
	PlayChatFaceAnim = "playChatFaceAnim";
	PlayChatTextAnim = "playChatTextAnim";
};

RoomChatLogic.ctor = function(self)	

end

RoomChatLogic.dtor = function(self)

end

RoomChatLogic.initSocketManager = function(self)
	self.m_socket = SocketIsolater.getInstance():getSocket();
end 
-----------------------------------------------------
--protect
--返回此用户是否合法
RoomChatLogic.onCheckUserLegal = function(self, uid, seatId)
	local seat;
	if uid then
		seat = GamePlayerManager2.getInstance():getLocalSeatByMid(uid);
	end
	if not seat and seatId then
		seat = PlayerSeat.getInstance():getLocalSeat(seatId);
	end
	
	local playerInfo = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
	if playerInfo then
		return PlayerSeat.getInstance():isSeatLegal(seat),playerInfo:getMid(),playerInfo:getSeatId(),seat;
	else
		return false;
	end
end

--private
--接收用户发来的文本信息
RoomChatLogic.onReceiveText = function ( self, mid, msg ,index)
	if (not mid) or (not msg) then
		return false;
	end

	local isLegal,uid,seatId,localSeat = self:onCheckUserLegal(mid, nil);
	if isLegal then
		local myLocalSeat = self:getMyLocalSeat();
		if localSeat and localSeat ~= myLocalSeat then  -- 是自己发的则不用重复播，发送时已播了一次
			self:execDelegate(RoomChatLogic.Delegate.PlayChatTextAnim,localSeat,msg,index);
		end
		return true;
	else
		return false;
	end
end

--private
--接收用户发来的图像信息
RoomChatLogic.onReceiveFace = function ( self, info )
	if table.isEmpty(info) then
		return false;
	end
	local isLegal,uid,seatId,localSeat = self:onCheckUserLegal(info.uid, nil);
	if isLegal then
		local myLocalSeat = self:getMyLocalSeat();
		if localSeat and localSeat ~= myLocalSeat then  -- 是自己发的则不用重复播，发送时已播了一次
			local page,faceIndex = RoomChatConfig.convertFromFaceValue(info.faceValue);
			local vipType = info.vipType;
			self:execDelegate(RoomChatLogic.Delegate.PlayChatFaceAnim,localSeat,page,faceIndex,vipType);
		end
		return true;
	else
		return false;
	end
end

--private
--我请求发送文本信息
RoomChatLogic.requestChatText = function ( self, chatStr, index)
	local info = {};
	info.msg = chatStr;
	info.index = index or -1;
	self.m_socket:sendMsg(ROOM_USER_CHAT,info);
end

--private
--我请求发送表情
RoomChatLogic.requestChatFace = function ( self,page, faceIndex,vipType)
	local faceValue = RoomChatConfig.convertToFaceValue(page,faceIndex);
	local param = {};
	param.faceValue = faceValue;
	param.vipType = vipType;
	self.m_socket:sendMsg(ROOM_USER_FACE,param);
end	

--获取玩家本地座位号
RoomChatLogic.getMyLocalSeat = function(self)
	return PlayerSeat.getInstance():getMyLocalSeat();
end