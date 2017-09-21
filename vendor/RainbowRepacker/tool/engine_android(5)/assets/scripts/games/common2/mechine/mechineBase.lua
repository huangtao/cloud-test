--[[
	游戏状态机的接口类
]]

MechineBase = class();

MechineBase.ctor = function(self,uid)
	self:init(uid);
end

--virtual
MechineBase.getStates = function(self)
	
end

--virtual
MechineBase.getMainState = function(self)

end

--virtual
MechineBase.init = function(self)

end

--virtual
MechineBase.checkStateValid = function(self,curState,id,action,info,isSucc,isFast)

end

--virtual
MechineBase.addMechine = function(self,state,mechine)

end

--virtual
MechineBase.removeMechine = function(self,uid,seat)

end

--virtual
MechineBase.reset = function(self)

end

--virtual
MechineBase.checkAction = function(self,action)

end

MechineBase.dtor = function(self)

end

