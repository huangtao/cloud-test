require("common/commonSocketReader");
require("hall/bankrupt/socket/bankruptSocketCmd");

BankruptSocketReader = class(CommonSocketReader);

BankruptSocketReader.ctor = function(self)
	self.m_logFileName = "BankruptSocketReader";
end

BankruptSocketReader.onBankruptConfig = function(self,pid)
	local info = {};
	info.curBankruptTime = self.m_socket:readInt(pid,0);--当前破产次数
	info.lowestMoney = self.m_socket:readInt64(pid,0); --破产下限
	local count = self.m_socket:readInt(pid,0); 
	info.intervals = {};
	for i = 1,count do 
		info.intervals[i] = self.m_socket:readInt(pid,0); --每次领取破产时间间隔
	end 
	return info;
end

BankruptSocketReader.onBankruptCount = function(self,pid)
	local info = {};
	info.curCount = self.m_socket:readInt(pid,0);--第几次破产
	info.leftTime = self.m_socket:readInt(pid,0); --当前剩余时间
	info.vipExpires = self.m_socket:readInt(pid,0);--vip过期时间
	info.vipActualTime = self.m_socket:readInt(pid,0);--vip等待的真实时间
	info.get_money = self.m_socket:readInt(pid,0);--vip等待的真实时间
	info.shard_cd_flag = self.m_socket:readInt(pid,0);--vip等待的真实时间
	return info;
end

BankruptSocketReader.onBankruptMoney = function(self,pid)
	local info = {};
	info.flag = self.m_socket:readInt(pid,0); --请求破产是否成功(1.成功 0失败)
	info.brokeMoney = self.m_socket:readInt64(pid,0); --破产领取的钱数
	info.money = self.m_socket:readInt64(pid,0); --用户当前的钱数
	info.errType = self.m_socket:readInt(pid,0); --失败原因（1、server记没有破产，2、已经领取完了所有破产奖励 3、还没有到领取破产奖励的时间 4、其他原因）
	return info;
end

BankruptSocketReader.s_severCmdFunMap = {
	[RESPONSE_BANKRUPT_CONFIG]		= BankruptSocketReader.onBankruptConfig;
	[RESPONSE_BANKRUPT_MONEY]		= BankruptSocketReader.onBankruptMoney;
	[RESPONSE_BANKRUPT_COUNT]		= BankruptSocketReader.onBankruptCount;
};
