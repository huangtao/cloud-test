require("gameData/dataInterfaceBase");
require("gameData/dataInterfaceBase");

MoraGameDataInterface = class(DataInterfaceBase);

MoraGameDataInterface.Delegate = {
	onRequestConfigCallback = "onRequestConfigCallback";
    onRequestRecordCallback = "onRequestRecordCallback";
};

MoraGameDataInterface.getInstance = function()
	if not MoraGameDataInterface.s_instance then
		MoraGameDataInterface.s_instance = new(MoraGameDataInterface);
	end
	return MoraGameDataInterface.s_instance;
end

MoraGameDataInterface.releaseInstance = function()
	delete(MoraGameDataInterface.s_instance);
	MoraGameDataInterface.s_instance = nil;
end

MoraGameDataInterface.ctor = function(self)
	self.m_moraGameConfig = new(require("hall/moraGame/data/moraGameConfig"), self);

end

MoraGameDataInterface.dtor = function(self)
	delete(self.m_moraGameConfig);
	self.m_moraGameConfig = nil;
end

MoraGameDataInterface.requestSwitch = function (self)
    self.m_moraGameConfig:requestSwitch();
end

MoraGameDataInterface.requestConfig = function (self)
    self.m_moraGameConfig:requestConfig();
end

MoraGameDataInterface.getConfig = function (self)
    return self.m_moraGameConfig:getConfig();
end

MoraGameDataInterface.getLastBet = function (self)
    return self.m_moraGameConfig:getLastBet();
end

MoraGameDataInterface.setLastBet = function (self,lastBet)
    self.m_moraGameConfig:setLastBet(lastBet);
end

MoraGameDataInterface.isMoneyEnough = function (self,index,isPlay)
    return self.m_moraGameConfig:isMoneyEnough(index,isPlay);
end

MoraGameDataInterface.requestRecord = function (self)
    self.m_moraGameConfig:requestRecord();
end

MoraGameDataInterface.requestReward = function (self, bet, gesture)
    self.m_moraGameConfig:requestReward(bet, gesture);
end

MoraGameDataInterface.getRewardData = function (self)
    return self.m_moraGameConfig:getRewardData();
end

MoraGameDataInterface.setRewardData = function (self)
    self.m_moraGameConfig:setRewardData();
end

MoraGameDataInterface.onRequestConfigCallback = function (self, isSuccess, data)
    self:notify(MoraGameDataInterface.Delegate.onRequestConfigCallback, isSuccess, data);
end

MoraGameDataInterface.onRequestRecordCallback = function (self, isSuccess, data)
    self:notify(MoraGameDataInterface.Delegate.onRequestRecordCallback, isSuccess, data);
end

MoraGameDataInterface.isOpen = function(self)
	return self.m_moraGameConfig:isOpen();
end
