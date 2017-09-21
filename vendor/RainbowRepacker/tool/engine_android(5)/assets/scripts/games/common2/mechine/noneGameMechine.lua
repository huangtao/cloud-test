require("games/common2/mechine/mechineBase");
require("games/common2/mechine/mechineLog");

-- 非游戏状态机
local NoneGameMechine = class(MechineBase);

function NoneGameMechine:ctor()
	self:initMetatable();
end

function NoneGameMechine:checkAction(action)
	return self.actionConfig[action];
end

function NoneGameMechine:checkStateValid(uid, action, info, isFast, tag)
	local func = self.actionConfig[action];
	local result = false;
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

------------------------------------------------------------------------------------------------
function NoneGameMechine:initMetatable()
	local curObj = self;
	while curObj and curObj.actionConfig do
        if curObj.super then
		    setmetatable(curObj.actionConfig, { __index = curObj.super.actionConfig;});
		end
        curObj = curObj.super;
    end
end

function NoneGameMechine:sthrowErro(msg)
	if _DEBUG then
		debug.traceback();
		error(msg);
	end
end

-- 发送广播,当前状态、上一次的状态、本地座位号、用户id、返回信息、是否为快速响应、动作action,uid,info,isFast
function NoneGameMechine:sendBroadCastMsg(action,uid,info,isFast)
	local seat = self:getLocalSeatId(uid);
	EventDispatcher.getInstance():breadthDispatch(GameMechineConfig.BROADCAST_ACTION,action,seat,uid,info,isFast);
	return true;
end

-- 获取座位号
function NoneGameMechine:getLocalSeatId(uid)
	return GamePlayerManager2.getInstance():getLocalSeatByMid(uid);
end

function NoneGameMechine:showToast(msg)
    if not string.isEmpty(msg) then
        Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);
    end
end
------------------------------------------------------------------------------------------------
-- 收到消息，通知View
function NoneGameMechine:onNotifyView(action,uid,info,isFast)
	return self:sendBroadCastMsg(action,uid,info,isFast);
end

function NoneGameMechine:responseKick(action,uid,info)
	GameInfoIsolater.getInstance():setKickUserStatus(9001);
end

-- 宝箱任务
function NoneGameMechine:responseGetRoomTask(action,uid,info)
	if info.result then
		RoomTaskLogic.getInstance():responseRoomBaxTaskInfo(info);
		self:sendBroadCastMsg(action,uid,info);	
	end
	return true;
end

-- 任务奖励
function NoneGameMechine:respnseTaskReward(action,uid,info)
	if info.result then
		RoomTaskLogic.getInstance():onGetRoomBoxReward(info);
		self:sendBroadCastMsg(action,uid,info);
	else
		self:showToast(info.errorTips or "任务奖励领取失败");
	end
	return true;
end

function NoneGameMechine:broadcastRoomBoxInfo(action,uid,info)
	RoomTaskLogic.getInstance():broadcastRoomBoxInfo(info);
	return self:sendBroadCastMsg(action,uid,info);
end

-- 非游戏状态机处理的动作，游戏房间没有登录成功也可以触发及处理下列动作
NoneGameMechine.actionConfig = {
	[GameMechineConfig.ACTION_KICK]               				  		= "responseKick"; 
	[GameMechineConfig.ACTION_GETROOMTASK]       				  		= "responseGetRoomTask"; 
	[GameMechineConfig.ACTION_GETTASKREWARD]      				  		= "respnseTaskReward"; 
	[GameMechineConfig.ACTION_BROAD_BOXTASK]      				  		= "broadcastRoomBoxInfo";
	[GameMechineConfig.ACTION_GETTASK]       					  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_COMPLETASK]       				  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_REFRESH_BOX_TASK_INFO]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_OPEN_BOX]						  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_GET_SILVER_DATA]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_GET_SILVER_REWARD]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SEND_CHAT]						  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLICKACHAT]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_HID_CHATWND]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_RECHARGE]      					  		= "onNotifyView"; 	 
	[GameMechineConfig.ACTION_SHOWKICKANIM]      				  		= "onNotifyView"; 	  
	[GameMechineConfig.ACTION_SHOWPROPNIM]      				  		= "onNotifyView"; 	 
	[GameMechineConfig.ACTION_NS_ADDFRIENDRESULT]      			  		= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_ADDFRIEND_CALLBACK]      			  	= "onNotifyView"; 
	[GameMechineConfig.ACTION_NS_REFRESH_FRIENDS_LIST]      			= "onNotifyView";	 
	[GameMechineConfig.ACTION_NS_CLOSEINVITE]    				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_HIDEINVITE]							= "onNotifyView";
	[GameMechineConfig.ACTION_NS_INITINVITE]							= "onNotifyView";
	[GameMechineConfig.ACTION_NS_ENVELOPANIM]    				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_ENVELOP_AGREE_ANIM]    		  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_ENVELOP_REFUSE_ANIM]    		  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_FRIENDAPPLY]    				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_EXTRAHELP]    					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_EXTRASWITCH]    				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_EXTRASHARE]    				  		= "onNotifyView";
	[GameMechineConfig.ACTION_REQUEST_EXIT]						  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_FORCE_EXIT]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_REQUEST_LOGIN_FALSE_ROOM]					= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLOSEPLAYERWND]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_HEADCLICK]						  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CREATVIEW]						  		= "onNotifyView";	
	[GameMechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT] 			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLICK_DESKTOP]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_DOUBLE_CLICK_DESKTOP]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CHATFASEANIM]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CHATMSGANIM]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_USERPROPERTY]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_USERGAMERECORD]		  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_WIFI]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_RECEIVE_RADIOMSG]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_RECEIVE_SENDRAIAOCALLBACK]		  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_ROOMLEVELUP_ANIM]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_WEIXIN_SHARE_CALLBACK]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_DOWNLOAD_SHARE_IMAGE_CALLBACK]   		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SAVEIMAGE_TO_PHOTOALBUM__CALLBACK] 	= "onNotifyView";
	[GameMechineConfig.ACTION_NS_OPEN_SHARE_CALLBACK]			  		= "onNotifyView";		
	[GameMechineConfig.ACTION_NS_GET_BATTERYLEVEL]				  		= "onNotifyView";	
	[GameMechineConfig.ACTION_NS_OPEN_SAFEBOX]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLOSE_SAFEBOX]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_OPEN_SETTING]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLOSE_SETTING]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_OPEN_REPORT]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLOSE_REPORT]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CREATE_QR_CALLBACK]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_TABLEINFO]				  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SHOWBOXVIEW]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SAFEBOXRESULT]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_INITTIMEVIEW]					  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_MENUBAR_BTN_ENABLE]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CHANGEDEGRADE_ANIM]			  		= "onNotifyView";	
	[GameMechineConfig.ACTION_NS_JIFEN_RECORD_CLICK]			  		= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM]      			= "onNotifyView"; 	
	[GameMechineConfig.ACTION_NS_RELOGIN_FOR_RECONNECT]					= "onNotifyView";
	[GameMechineConfig.ACTION_NS_RECRUIT_VISIBLE]						= "onNotifyView";
	[GameMechineConfig.ACTION_NS_REFRESH_HEADPOS]						= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SHOW_MICROPHONE_OPEN_TIPS]				= "onNotifyView";
	[GameMechineConfig.ACTION_NS_SHOW_MICROPHONE_CLOSE_TIPS]			= "onNotifyView";
	[GameMechineConfig.ACTION_NS_GET_PASSWORD_BY_INFO]					= "onNotifyView";
	[GameMechineConfig.ACTION_NS_CLOSE_RECRUITEWND]						= "onNotifyView";

	[GameMechineConfig.ACTION_REQUEST_ENTER_ONLOOKER]					= "onNotifyView";
	[GameMechineConfig.ACTION_ONLOOKER_LOGIN]							= "onNotifyView";
	[GameMechineConfig.ACTION_ONLOOKER_LOGOUT]							= "onNotifyView";
	[GameMechineConfig.ACTION_NS_LOGOUT_VIDEO]      			  		= "onNotifyView";
};


return NoneGameMechine;
