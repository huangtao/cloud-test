
local SilverData = class();

SilverData.getInstance = function ( )
	if not SilverData.s_instance then 
		SilverData.s_instance = new(SilverData);
	end
	
	return SilverData.s_instance;
end

SilverData.releaseInstance = function ( )
	delete( SilverData.s_instance );
	SilverData.s_instance = nil;
end

SilverData.ctor = function ( self )
	self.m_inning = 0;
	self.m_done = 0;
	self.m_prize = 0;
end

SilverData.dtor = function ( self )
	
end
-- 已完成的牌局数
SilverData.setInning = function (self, inning)
    self.m_inning = inning;
end

SilverData.getInning = function (self)
    return self.m_inning or 0;
end
-- 任务牌局
SilverData.setDone = function ( self, done )
	self.m_done = done;
end

SilverData.getDone = function ( self )
	return self.m_done or 0;
end
-- 任务奖励
SilverData.setPrize = function ( self, prize )
	self.m_prize = prize;
end

SilverData.getPrize = function ( self )
	return self.m_prize or 0;
end 
-- 未完成局数
SilverData.getLeftInning = function ( self )
	return self:getDone() - self:getInning();
end
-- 是否完成牌局任务
SilverData.isFinishTask = function ( self )
	return self:getDone() > 0 and self:getDone() == self:getInning();
end

return SilverData;