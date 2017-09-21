
--[[
	聊天记录
]]
RoomChatTextRecord = class(DataInterfaceBase);

RoomChatTextRecord.getInstance = function(self)
    if not RoomChatTextRecord.s_instance then
        RoomChatTextRecord.s_instance = new(RoomChatTextRecord);
    end
    return RoomChatTextRecord.s_instance;
end

RoomChatTextRecord.releaseInstance = function()
	delete(RoomChatTextRecord.s_instance);
	RoomChatTextRecord.s_instance = nil;
end

RoomChatTextRecord.Delegate = {
	updateChatRecord = "onUpdateChatRecord";
};

RoomChatTextRecord.ctor = function(self)
	self.m_record = {};
end

RoomChatTextRecord.dtor = function(self)
	self.m_record = {};
end

RoomChatTextRecord.reset = function(self)
	self.m_record = {};
end

RoomChatTextRecord.addChat = function(self,userName,str,seat,isNotify)
	if userName and userName == UserBaseInfoIsolater.getInstance():getNickname() then
		userName = nil;
		seat = PlayerSeat.getInstance():getMyLocalSeat();
	end
	local temp = {};
	temp.userName = userName;
	temp.chat = str;
	temp.seat = seat;
	table.insert(self.m_record,#self.m_record+1,temp);
	if isNotify then 
		self:notify(RoomChatTextRecord.Delegate.updateChatRecord);
	end 
end

RoomChatTextRecord.getChatRecord = function(self)
	return self.m_record;
end