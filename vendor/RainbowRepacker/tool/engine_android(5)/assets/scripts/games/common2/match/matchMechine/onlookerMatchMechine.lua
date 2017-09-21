require("games/common2/mechine/mechineBase");

local OnlookerMatchMechine = class(MechineBase);

function OnlookerMatchMechine:ctor(uid)
	self.m_lastState 	= MatchMechineConfig.STATUS_ONLOOKER;
	self.m_curState 	= MatchMechineConfig.STATUS_ONLOOKER;

	self.m_uid = uid or UserBaseInfoIsolater.getInstance():getUserId();
	self:initMetatable();
end

function OnlookerMatchMechine:initMetatable()
	local curObj = self;
	while curObj and curObj.actionConfig do
        if curObj.super then
		    setmetatable(curObj.actionConfig, { __index = curObj.super.actionConfig;});
		end
        curObj = curObj.super;
    end
end

function OnlookerMatchMechine:sthrowErro(msg)
	if _DEBUG then
		debug.traceback();
		error(msg);
	end
end

function OnlookerMatchMechine:checkAction(action)
	return self.actionConfig[action];
end

function OnlookerMatchMechine:checkStateValid(action,info,isFast,tag)
	local func = self.actionConfig[action];
	local checkValid;
	local result = false;
	if type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
        	checkValid = true;
            result = funcSelf(self,action,info,isFast,tag);
        end
    elseif type(func) == "function" then
    	checkValid = true;
    	self:sthrowErro("状态机配置表，需要修改为string类型");
    	result = func(self,action,info,isFast,tag);
    else 
    	checkValid = false;
    end
	return checkValid,self.m_curState,self.m_lastState,result;
end

function OnlookerMatchMechine:sendBroadCastMsg(action,info,isFast,tag)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();

	EventDispatcher.getInstance():dispatch(MatchMechineConfig.NOTIFY_ACTION,
			action,seat,self.m_uid,info,isFast);

	return true;
end

function OnlookerMatchMechine:getStates()
	return self.m_curState,self.m_lastState,self.m_curState;
end
-------------------------------------------------------------------------------------------
function OnlookerMatchMechine:onNotifyView(action,info,isFast,tag)
	return self:sendBroadCastMsg(action,info,isFast,tag);
end

OnlookerMatchMechine.actionConfig = {
	[MatchMechineConfig.ACTION_ENTER_ONLOOKER]			= "onNotifyView";
};

return OnlookerMatchMechine;