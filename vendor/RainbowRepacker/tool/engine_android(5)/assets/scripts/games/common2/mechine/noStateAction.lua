
--[[
	无状态的逻辑处理
]]

local NoStateAction = class();

function NoStateAction:ctor()
	self.m_actionListenMap = {};
	self:getActionListenMap();
end

function NoStateAction:dtor()
	self.m_actionListenMap = {};
end

function NoStateAction:getActionListenMap()
	if not table.isEmpty(self.m_actionListenMap) then
		return;
	end	
	local curObj = self;
    while curObj do
		if curObj.noStateActionConfig then
			self.m_actionListenMap = CombineTables(curObj.noStateActionConfig or {}, self.m_actionListenMap);
		end
        curObj = curObj.super;
    end
end

-------------------------------------无状态动作------------------------------------------------------------
function NoStateAction:checkAction(action)
	return self.m_actionListenMap[action];
end

function NoStateAction:updateNoStateInfo(action,uid,info,isFast,tag)
	local func = self.m_actionListenMap[action];
	local result = true;
	if type(func) == "string" then
        local funcSelf = self[func];
        if funcSelf then
            result = funcSelf(self,action,uid,info,isFast,tag);
        end
    elseif type(func) == "function" then
    	self:sthrowErro("状态机配置表，需要修改为string类型");
    	result = func(self,action,uid,info,isFast,tag);
    end
	return result;
end


function NoStateAction:sthrowErro(msg)
	if _DEBUG then
		debug.traceback();
		error(msg);
	end
end

-- 房间等级提升
function NoStateAction:responseUpLevel(action,uid,packetInfo)
	packetInfo.degradeInfo = {};
	if packetInfo.flag == -1 then		
		packetInfo.degradeInfo.disMoney = packetInfo.dis;
		packetInfo.degradeInfo.curGameId = GameInfoIsolater.getInstance():getCurGameId();
		packetInfo.degradeInfo.tarLevelId = GameInfoIsolater.getInstance():getCurRoomLevelId();
		GameInfoIsolater.getInstance():setDegradeInfo(packetInfo.degradeInfo);
	end
	UserExpInfoIsolater.getInstance():setExp(UserExpInfoIsolater.getInstance():getExp() + packetInfo.exp);
	GameInfoIsolater.getInstance():setRoomUpLevelInfo(packetInfo);
	
	-- 更新经验值
	local seat = self:getLocalSeatId(uid);
	local updateData = {}; 
	local tmp = { key 	= "exp", value = UserExpInfoIsolater.getInstance():getExp() };
	table.insert(updateData, tmp);
	GamePlayerManager2.getInstance():updatePlayerInfo(seat,updateData);
end

function NoStateAction:responseVipKick(action,uid,info)	
	local seat = self:getLocalSeatId(uid);
    RoomPropsLogic.getInstance():onResponseKick( seat, uid, info, false );
	self:sendBroadCastMsg(action,uid,info);
end

-- 玩家托管
function NoStateAction:onPlayerAi(action,uid,info,isFast)
	local seat = self:getLocalSeatId(uid);
	local data = { { key 	= "ai", value = (info.isAi ~= 0) and true or false} };
	GamePlayerManager2.getInstance():updatePlayerInfo(seat,data);
	self:sendBroadCastMsg(action,uid,info,isFast);
end

-- 收到消息，通知View
function NoStateAction:onNotifyView(action,uid,info,isFast)
	self:sendBroadCastMsg(action,uid,info,isFast);
end

function NoStateAction:execDelegate(func, ...)
    if self.m_delegate and self.m_delegate[func] then
        self.m_delegate[func](self.m_delegate, ...);
    end
end

-- 发送广播,当前状态、上一次的状态、本地座位号、用户id、返回信息、是否为快速响应、动作action,uid,info,isFast
function NoStateAction:sendBroadCastMsg(action,uid,info,isFast)
	local seat = self:getLocalSeatId(uid);
	EventDispatcher.getInstance():breadthDispatch(GameMechineConfig.BROADCAST_ACTION,action,seat,uid,info,isFast);
end

-- 获取座位号
function NoStateAction:getLocalSeatId(uid)
	return GamePlayerManager2.getInstance():getLocalSeatByMid(uid);
end

function NoStateAction:showToast(msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end

-- 游戏状态机处理的无状态动作，游戏房间登录成功后才能触发的动作
NoStateAction.noStateActionConfig = {
	[GameMechineConfig.ACTION_VIPKICK]       					  		= "responseVipKick"; 
	[GameMechineConfig.ACTION_UPLEVEL]		 					  		= "responseUpLevel"; 
	[GameMechineConfig.ACTION_NS_ROOMUPCHANGE] 					  		= "onNotifyView";
	[GameMechineConfig.ACTION_UPDATEMUTIPLE]      				  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_ROBOT]      					  		= "onPlayerAi"; 	  
	[GameMechineConfig.ACTION_NS_CANCEL_AI]						  		= "onNotifyView";		 
	[GameMechineConfig.ACTION_ONLINE_RECONNECT_GAME]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_MATCH_SCORE]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_AUTO_READY]						  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_READY_STATUS] 			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_STATUS_ERROR]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_CURSTATUS]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_REQUESTEXITGAME]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_CHANGE_SEATE_NOTIFY]		  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_HIDE_CHANGE_SEATE]		  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_RECEIVE_JIFEM_RECORD]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_JIFEN_STARTGAME]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_JIFEN_GAMEOVER]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_JIFEN_FINISHED]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_DISMISS]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_MASTER]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_FINISHED_CONTINUE_CLICK]	  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_CONTINUE_PLAY]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_JIFEN_SHOW_FINISHED_CONTINUE]  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_OPENGAMEOVER]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLOSEGAMEOVER]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_PLAYAGAIN]						  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_UPDATE_USERINFO] 				  		= "onNotifyView";
	[GameMechineConfig.ACTION_RECEIVE_CHAT]      				  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_RECEIVE_FACE]      				  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_KICKOUT_SUCCESS]      				  	= "onNotifyView"; 
    [GameMechineConfig.ACTION_NS_RECEIVE_PRIVATEROOMINFO]      			= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_SEARCH_PRIVATEROOM]      				= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_OPENCLOCK]      				  		= "onNotifyView"; 	 
	[GameMechineConfig.ACTION_NS_CLOSECLOCK]      				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_LOGIN_VIDEO]      				  		= "onNotifyView";
	-- [GameMechineConfig.ACTION_NS_LOGOUT_VIDEO]      			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_UPDATE_CHAT_VOICE]    			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_CHAT_VOICE]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SHOW_MICROPHONE]    			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_HIDE_MICROPHONE]    			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REQUESTINVITELIST]    			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLEAR_TABLE]					  		= "onNotifyView";	
	[GameMechineConfig.ACTION_NS_SHOWRWNDVIEW]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_HIDRWNDVIEW]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_OFFLINE_RECONNECT_GAME]			  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_CHANGETABLE]      				  		= "onNotifyView"; 
};


return NoStateAction;