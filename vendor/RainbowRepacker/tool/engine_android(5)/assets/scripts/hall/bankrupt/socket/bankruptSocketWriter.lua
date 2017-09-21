require("common/commonSocketWriter");
require("hall/bankrupt/socket/bankruptSocketCmd");

BankruptSocketWriter = class(CommonSocketWriter);

BankruptSocketWriter.onSendBankruptConfig = function(self,packetId)
end 

BankruptSocketWriter.onSendBankruptCount = function(self,packetId,info)
	self.m_socket:writeInt(packetId,info.userId);
	self.m_socket:writeInt(packetId,info.hasShard);
end

BankruptSocketWriter.onSendBankruptMoney = function(self,packetId,userId)
	self.m_socket:writeInt(packetId,userId);
end

BankruptSocketWriter.s_clientCmdFunMap = {
	[SEND_BANKRUPT_CONFIG]			= BankruptSocketWriter.onSendBankruptConfig;
	[SEND_BANKRUPT_COUNT]			= BankruptSocketWriter.onSendBankruptCount;
	[SEND_BANKRUPT_MONEY]			= BankruptSocketWriter.onSendBankruptMoney;	
};