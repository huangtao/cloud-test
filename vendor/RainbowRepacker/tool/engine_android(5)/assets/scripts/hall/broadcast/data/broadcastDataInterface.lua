require("gameData/dataInterfaceBase");


local RADIO_TYPE = {
	HALL = 1;				--大厅广播
	PRIVATE_ROOM = 2;		--私人房广播
	INVITE_MATCH = 3;		--比赛房邀请
	INVITE_PRIVATE = 4;		--私人房邀请
}

BroadcastDataInterface = class(DataInterfaceBase);

BroadcastDataInterface.Delegate = {
	refreshRadioList = "refreshRadioList";	
	onSendRadioCallBack = "onSendRadioCallBack";
};

--大厅上面的广播、跑马灯
BroadcastDataInterface.getInstance = function()
	if not BroadcastDataInterface.s_instance then
		BroadcastDataInterface.s_instance = new(BroadcastDataInterface);
	end

	return BroadcastDataInterface.s_instance;
end

BroadcastDataInterface.cleanup = function()
	local lastObserverMap = BroadcastDataInterface.getInstance():getObserverMap();
	delete(BroadcastDataInterface.s_instance);
	BroadcastDataInterface.s_instance = nil;

	BroadcastDataInterface.getInstance():setObserverMap(lastObserverMap);
end

BroadcastDataInterface.ctor = function(self)
	self.m_broadcastData = new(require("hall/broadcast/data/broadcastData"),self);

	self:getRadioMsgList();
	self:getOverRadioMsgList();
end

BroadcastDataInterface.dtor = function(self)
	delete(self.m_broadcastData);
	self.m_broadcastData = nil;
end

BroadcastDataInterface.getRadioMsgList = function(self)
	self.m_radioMsgList = table.verify(self.m_broadcastData:getRadioMsgList());

	return self.m_radioMsgList;
end

BroadcastDataInterface.addRadioMsg = function(self,data)
	Log.i("BroadcastDataInterface.addRadioMsg","data = ",data);
	self.m_broadcastData:addRadioMsg(data);
end

BroadcastDataInterface.addRadioMsgWithoutNotify = function(self,data)
	Log.i("BroadcastDataInterface.addRadioMsgWithoutNotify","data = ",data);
	self.m_broadcastData:addRadioMsgWithoutNotify(data);
end

BroadcastDataInterface.removeFirstRadioMsg = function(self)
 	local list = table.remove(self.m_radioMsgList,1);
 	self:setRadioMsgList();

 	return list;
end

BroadcastDataInterface.setRadioMsgList = function(self,radioMsgList)
	self.m_radioMsgList = radioMsgList or self.m_radioMsgList;
	self.m_broadcastData:setRadioMsgList(self.m_radioMsgList);
end

-------过期广播-------
BroadcastDataInterface.getOverRadioMsgList = function(self)
	self.m_overRadioMsgList = table.verify(self.m_broadcastData:getOverRadioMsgList());
	return self.m_overRadioMsgList;
end

BroadcastDataInterface.addOverRadioMsgList = function(self,data)
	if table.isEmpty(data) then
		return;
	end
	table.insert(self.m_overRadioMsgList,data);
	self:setOverRadioMsgList();
end

BroadcastDataInterface.removeFirstOverRadioMsg = function(self)	
	table.remove(self.m_overRadioMsgList,1);
	self:setOverRadioMsgList();
end

BroadcastDataInterface.setOverRadioMsgList = function(self)
	self.m_broadcastData:setOverRadioMsgList(self.m_overRadioMsgList);
end

--发一条消息的费用
BroadcastDataInterface.getRadioMoney = function(self)
	return self.m_broadcastData:getRadioMoney();
end

BroadcastDataInterface.setRadioMoney = function(self, money)
	self.m_broadcastData:setRadioMoney(money);
end

--在大厅发送广播最低银币限制
BroadcastDataInterface.setSendHallBroadcastLimitMoney = function ( self, money )
	self.m_sendHallBroadcastLimitMoney = number.valueOf(money);
end

BroadcastDataInterface.getSendHallBroadcastLimitMoney = function ( self )
	return self.m_sendHallBroadcastLimitMoney or 5000;
end

--在私人房发送广播最低银币限制
BroadcastDataInterface.setSendPrivateBroadcastLimitMoney = function ( self, money )
	self.m_sendPrivateBroadcastLimitMoney = number.valueOf(money);
end

BroadcastDataInterface.getSendPrivateBroadcastLimitMoney = function ( self )
	return self.m_sendPrivateBroadcastLimitMoney;
end

BroadcastDataInterface.refreshRadioList = function(self,isSuccess,radioMsgList)
	if isSuccess then 
		self.m_radioMsgList = radioMsgList;
	end 
	self:notify(BroadcastDataInterface.Delegate.refreshRadioList,isSuccess,radioMsgList);
end

--@brief 获取大厅广播类型
BroadcastDataInterface.getHallRadioType = function(self)
	return RADIO_TYPE.HALL;
end

--@brief 获取私人房广播类型
BroadcastDataInterface.getPrivateRoomRadioType = function(self)
	return RADIO_TYPE.PRIVATE_ROOM;
end

--@brief 获取比赛邀请广播类型
BroadcastDataInterface.getMatchInviteRadioType = function(self)
	return RADIO_TYPE.INVITE_MATCH;
end

--@brief 获取私人房邀请广播类型
BroadcastDataInterface.getPrivateInviteRadioType = function(self)
	return RADIO_TYPE.INVITE_PRIVATE;
end

--@brief 发送广播
--@param content string 消息内容
--@param radioType int 广播类型
BroadcastDataInterface.sendRadio = function(self, content, radioType)
	local info = {
		content = content;
		radioType = radioType;
	};
	OnlineSocketManager.getInstance():sendMsg(PHP_Radio_Send, info);
end

BroadcastDataInterface.onSendRadioCallBack = function(self,isSuccess,info)
	Log.i("BroadcastDataInterface.onSendRadioCallBack","isSuccess = ",isSuccess,"info = ",info);
	if isSuccess then 
		local radioMoney = self:getRadioMoney();
		local currentMoney = kUserInfoData:getMoney()-radioMoney;

	    kUserInfoData:setMoney(currentMoney);
	end 
	self:notify(BroadcastDataInterface.Delegate.onSendRadioCallBack,isSuccess,info);
end

BroadcastDataInterface.s_socketCmdFuncMap = {
	[PHP_Radio_Send] 		         = BroadcastDataInterface.onSendRadioCallBack;
};