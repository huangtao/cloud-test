require("games/common2/mechine/mechineBase");

MatchMechine = class(MechineBase);

MatchMechine.getInstance = function()
	if not MatchMechine.s_instance then
		MatchMechine.s_instance = new(MatchMechine);
	end	
	return MatchMechine.s_instance;
end

MatchMechine.releaseInstance = function()
	delete(MatchMechine.s_instance);
	MatchMechine.s_instance = nil;
end

--[[
	比赛中的状态机
]]
MatchMechine.init = function(self)
	self:addMatchStateOpt();
	self:addMatchNoStateOpt();	
end

-- 检测状态是否可以跳转
MatchMechine.checkStateValid = function(self,action,info,isFast,tag)
	if self.m_onlookerMatchMechine and self.m_onlookerMatchMechine:checkAction(action) then 
		self.m_onlookerMatchMechine:checkStateValid(action,info,isFast,tag);
	elseif self.m_reconnectMechine then 
		self.m_reconnectMechine:checkStateValid(action,info,isFast,tag);
	elseif self.m_matchNoStateOpt:isNoStateAction(action) then
		self.m_matchNoStateOpt:updateNoStateInfo(action,info,isFast,tag);
	else 
		self.m_matchStateOpt:checkStateValid(action,info,isFast,tag);
	end 
end

MatchMechine.receiveAction = function(self,action,info,isFast,tag)
	if action == MatchMechineConfig.ACTION_RECONNECT then
		self:addReconnectMechine();
	elseif action == MatchMechineConfig.ACTION_RESET then 
		self:removeReconnectMechine();
	elseif action == MatchMechineConfig.ACTION_ENTER_ONLOOKER then 
		self:addOnlookerMechine();

		info = table.verify(info);
		self:removeMatchStateOpt();
		self:addMatchStateOpt(info.userId);

		self:removeMatchNoStateOpt();
		self:addMatchNoStateOpt(info.userId);
	end 

	self:checkStateValid(action,info,isFast,tag);
end

-- 获取当前状态和上一次的状态
MatchMechine.getStates = function(self)
	if self.m_onlookerMatchMechine then 
		return self.m_onlookerMatchMechine:getStates();
	else 
		local curState,lastSate,curSubState = self.m_matchStateOpt:getStates();
		if self.m_reconnectMechine then 
			return MatchMechineConfig.STATUS_RECONNECT,curState,MatchMechineConfig.STATUS_RECONNECT;
		else 
			return curState,lastSate,curSubState;
		end 
	end 
end

-- 重置状态机
MatchMechine.reset = function(self)
	self.m_matchStateOpt:resetState();
end

MatchMechine.dtor = function(self)
	self:removeMatchStateOpt();
	self:removeMatchNoStateOpt();
	self:removeReconnectMechine();
	self:removeOnlookerMechine();
end
-------------------------------------------------------------------------------------
MatchMechine.addReconnectMechine = function(self)
	local ReconnectMechine = require("games/common2/mechine/reconnectMechine");
	self.m_reconnectMechine = new(ReconnectMechine);
end

MatchMechine.removeReconnectMechine = function(self)
	delete(self.m_reconnectMechine);
	self.m_reconnectMechine = nil;
end

MatchMechine.addMatchStateOpt = function(self,userId)
	local MatchMechineOperation = require("games/common2/match/matchMechine/matchMechineOperation");
	self.m_matchStateOpt = new(MatchMechineOperation,userId);
end

MatchMechine.removeMatchStateOpt = function(self)
	delete(self.m_matchStateOpt);
	self.m_matchStateOpt = nil;
end

MatchMechine.addMatchNoStateOpt = function(self,userId)
	local MatchNoStateAction = require("games/common2/match/matchMechine/matchNoStateAction");
	self.m_matchNoStateOpt = new(MatchNoStateAction,userId);
end

MatchMechine.removeMatchNoStateOpt = function(self)
	delete(self.m_matchNoStateOpt);
	self.m_matchNoStateOpt = nil;
end

MatchMechine.addOnlookerMechine = function(self)
	local OnlookerMatchMechine = require("games/common2/match/matchMechine/onlookerMatchMechine");
	self.m_onlookerMatchMechine = new(OnlookerMatchMechine);
end

MatchMechine.removeOnlookerMechine = function(self)
	delete(self.m_onlookerMatchMechine);
	self.m_onlookerMatchMechine = nil;
end