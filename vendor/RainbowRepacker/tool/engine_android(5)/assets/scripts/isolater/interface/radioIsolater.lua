require("gameData/dataInterfaceBase");
require("hall/broadcast/data/broadcastDataInterface");

RadioIsolater = class(DataInterfaceBase);

RadioIsolater.Delegate = {
	onReciveRadioMsg = "onReciveRadioMsg";
	onSendRadioCallBack = "onSendRadioCallBack";
};

RadioIsolater.getInstance = function()
	if not RadioIsolater.s_instance then
		RadioIsolater.s_instance = new(RadioIsolater); 
	end
	return RadioIsolater.s_instance;
end

RadioIsolater.ctor = function(self)
	BroadcastDataInterface.getInstance():setObserver(self);
end

RadioIsolater.dtor = function(self)
	BroadcastDataInterface.getInstance():clearObserver(self);
end
------------- 广播相关 -----------------------------------------------
--收到广播消息
RadioIsolater.refreshRadioList = function(self,isSuccess,radioMsgList)
	local radioMsgList = table.verify(radioMsgList);
	if #radioMsgList < 1 then
		return;
	end

	local info = radioMsgList[#radioMsgList];
	if not table.isEmpty(info) then
		self:notify(RadioIsolater.Delegate.onReciveRadioMsg,info);
 	end 
end

--删除最后一条广播信息
RadioIsolater.delLastRadioMsg = function(self)
	local radioMsgList = BroadcastDataInterface.getInstance():getRadioMsgList();
	local temp = radioMsgList[#radioMsgList];
    BroadcastDataInterface.getInstance():addOverRadioMsgList(temp);
    table.remove(radioMsgList,#radioMsgList);
    BroadcastDataInterface.getInstance():setRadioMsgList(radioMsgList);
end

--获取最后一条广播信息
RadioIsolater.getLastRadioMsg = function(self)
	local radioMsgList = BroadcastDataInterface.getInstance():getRadioMsgList();
	return radioMsgList[#radioMsgList];
end

--获取广播列表
RadioIsolater.getRadioMsgList = function(self)
	return BroadcastDataInterface.getInstance():getRadioMsgList();
end

--获取发一条消息的费用
RadioIsolater.getRadioMoney = function(self)
	return BroadcastDataInterface.getInstance():getRadioMoney();
end

--获取私人房广播类型
RadioIsolater.getPrivateRoomRadioType = function(self)
	return BroadcastDataInterface.getInstance():getPrivateRoomRadioType();
end

--@brief 获取比赛邀请广播类型
RadioIsolater.getMatchInviteRadioType = function(self)
	return BroadcastDataInterface.getInstance():getMatchInviteRadioType();
end

--@brief 获取私人房邀请广播类型
RadioIsolater.getPrivateInviteRadioType = function(self)
	return BroadcastDataInterface.getInstance():getPrivateInviteRadioType();
end

--发送广播
RadioIsolater.sendRadio = function(self,content,radioType)
	BroadcastDataInterface.getInstance():sendRadio(content,radioType);
end

--在私人房发送广播最低银币限制
RadioIsolater.getSendPrivateBroadcastLimitMoney = function(self)
	return BroadcastDataInterface.getInstance():getSendPrivateBroadcastLimitMoney() or 0;
end

RadioIsolater.onSendRadioCallBack = function(self,isSuccess,info)
	self:notify(RadioIsolater.Delegate.onSendRadioCallBack,isSuccess,info);
end

RadioIsolater.addRadioMsgWithoutNotify = function(self,data)
	BroadcastDataInterface.getInstance():addRadioMsgWithoutNotify(data);
end
------------- 广播相关 -----------------------------------------------
