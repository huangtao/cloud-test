require("games/common2/mechine/mechineBase");

local OnlookerMechine = class(MechineBase);

function OnlookerMechine:ctor()
	self.m_lastState 	= GameMechineConfig.STATUS_ONLOOKER;
	self.m_curState 	= GameMechineConfig.STATUS_ONLOOKER;
	self:initMetatable();
end

function OnlookerMechine:initMetatable()
	local curObj = self;
	while curObj and curObj.actionConfig do
        if curObj.super then
		    setmetatable(curObj.actionConfig, { __index = curObj.super.actionConfig;});
		end
        curObj = curObj.super;
    end
end

function OnlookerMechine:sthrowErro(msg)
	if _DEBUG then
		debug.traceback();
		error(msg);
	end
end

function OnlookerMechine:checkAction(action)
	return self.actionConfig[action];
end

function OnlookerMechine:checkStateValid(uid,action,info,isFast,tag)
	local func = self.actionConfig[action];
	local checkValid;
	local result = false;
	if type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
        	checkValid = true;
            result = funcSelf(self,action,uid,info,isFast,tag);
        end
    elseif type(func) == "function" then
    	checkValid = true;
    	self:sthrowErro("状态机配置表，需要修改为string类型");
    	result = func(self,action,uid,info,isFast,tag);
    else 
    	checkValid = false;
    end
	return checkValid,self.m_curState,self.m_lastState,result;
end

function OnlookerMechine:sendBroadCastMsg(action,uid,info,isFast,tag)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	EventDispatcher.getInstance():breadthDispatch(GameMechineConfig.BROADCAST_ACTION,action,seat,uid,info,isFast);

	return true;
end
-------------------------------------------------------------------------------------------
function OnlookerMechine:onNotifyView(action,uid,info,isFast,tag)
	return self:sendBroadCastMsg(action,uid,info,isFast,tag);
end

OnlookerMechine.actionConfig = {
	[GameMechineConfig.ACTION_NS_RECEIVE_BARRAGE_MSG]			= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SHOW_ONLOOKER_DETAIL_INFO]		= "onNotifyView";
	[GameMechineConfig.ACTION_ENTER_ONLOOKER_SUC]				= "onNotifyView";
	[GameMechineConfig.ACTION_EXIT_ONLOOKER_SUC]				= "onNotifyView";
	[GameMechineConfig.ACTION_REQUEST_EXIT_ONLOOKER]			= "onNotifyView";
	[GameMechineConfig.ACTION_ONLOOKER_LOGIN]					= "onNotifyView";
	[GameMechineConfig.ACTION_ONLOOKER_LOGOUT]					= "onNotifyView";
	[GameMechineConfig.ACTION_NS_ADDFRIEND_CALLBACK]      		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_FRIENDS_LIST]      	= "onNotifyView";
	[GameMechineConfig.ACTION_NS_RECEIVE_SHUTUP] 				= "onNotifyView";
	[GameMechineConfig.ACTION_SHOWPROPNIM]						= "onNotifyView";
	[GameMechineConfig.ACTION_NS_BARRAGE_SWITCH_CHANGE]			= "onNotifyView";
	[GameMechineConfig.ACTION_NS_RECEIVE_ONLOOKER_EXTEND] 		= "onNotifyView";
};

return OnlookerMechine;