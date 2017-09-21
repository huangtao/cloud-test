require("games/common2/mechine/mechineBase");

local ReconnectMechine = class(MechineBase);

--[[
	重连状态机，状态校验错误时，请求重连。停止接收消息，必须等待重连成功后，重置所有的状态机。
]]

ReconnectMechine.getStates = function(self)
	
end

ReconnectMechine.getMainState = function(self)

end

ReconnectMechine.checkStateValid = function(self, uid, action, info, isFast, tag)
	return true,nil,nil,true;
end

ReconnectMechine.addMechine = function(self,state,mechine)

end

ReconnectMechine.removeMechine = function(self,uid,seat)

end

ReconnectMechine.reset = function(self)

end

ReconnectMechine.checkAction = function(self,action)
	return true;
end

ReconnectMechine.dtor = function(self)

end

return ReconnectMechine;