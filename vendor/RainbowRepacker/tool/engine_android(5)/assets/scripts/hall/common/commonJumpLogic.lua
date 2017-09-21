require("common/commonLogic");
require("hall/common/commonJumpCmds");
require("hall/gameData/share/shareDataInterface");
require("gameData/weixinShareUtil");

CommonJumpLogic = class(CommonLogic);

CommonJumpLogic.s_commonJumpEvent = EventDispatcher.getInstance():getUserEvent();

CommonJumpLogic.getInstance = function()
	if not CommonJumpLogic.s_instance then
		CommonJumpLogic.s_instance = new(CommonJumpLogic);
	end
	return CommonJumpLogic.s_instance;
end

CommonJumpLogic.releaseInstance = function()
	delete(CommonJumpLogic.s_instance);
	CommonJumpLogic.s_instance = nil;
end

CommonJumpLogic.ctor = function(self)
	self.m_jumpData = {};	
end

--@brief 执行js调用
--@param data:必须包含cmd命令
--@return 此调用是否需要在大厅才能执行
CommonJumpLogic.executeJsCall = function(self, data)
	Log.v("CommonJumpLogic.executeJsCall", "data = ", data);
	if table.isEmpty(data) then
		return;
	end

	local cmd = number.valueOf(data.cmd);
	local config = CommonJumpCmds.s_jumpCmdConfig[cmd];
	if table.isEmpty(config) then
		return;
	end

	local func = config.func;
	if func and type(func) == "function" then
		self:resetJumpData();

		local funcTab = config.onPreExecuteFunc;
		if funcTab and type(funcTab) == "function" then
			funcTab(self, data);
		end

		local onlyExecuteInHall = func(self, data, unpack( table.verify(config.extParams) ) );
		local hasExecuted = false;
		if onlyExecuteInHall then
			hasExecuted = EventDispatcher.getInstance():dispatch(CommonJumpLogic.s_commonJumpEvent);
		end

		if hasExecuted then
			return false;
		else
			return onlyExecuteInHall;
		end
	end
end

--设置跳转参数
--[[ self.m_jumpData {
		cmd = xxx; -- 对应 CommonJumpCmds
		stateId = xxx; --跳转状态id
		params = {};   --参数列表               
	}
--]]


--设置跳转参数
CommonJumpLogic.setJumpData = function(self, cmd, stateId, params)
	if not cmd and not stateId then
		return;
	end

	self.m_jumpData = {
		cmd = cmd;
		stateId = stateId;
		params = table.verify(params);
	}
end

--重置跳转参数
CommonJumpLogic.resetJumpData = function(self)
	self.m_jumpData = {};
end

--判断是否已经含有跳转命令
CommonJumpLogic.hasJumpCommond = function(self)
	if table.isEmpty(self.m_jumpData) then
		return false;
	else
		return true;
	end
end

--获取跳转参数
CommonJumpLogic.getJumpParams = function(self)
	return self.m_jumpData.cmd, self.m_jumpData.stateId, table.verify(self.m_jumpData.params);
end

--跳转到其他状态
CommonJumpLogic.__onExecuteJumpState = function(self, data, state, style, isPopupState)
	if not kLoginDataInterface:getIsLoginSuccess() then
		Toast.getInstance():showText("请先登录游戏",50,30,kAlginLeft,"",26,250,210,70);
		return;
	end
	
	if state then
		StateMachine.getInstance():pushState(state, style, isPopupState)
	end
end


--返回大厅
CommonJumpLogic.__onBackToHall = function(self, data)
	return true;
end

--调用下载
CommonJumpLogic.__onToDownLoad = function(self, data)
	self.m_jumpData = {
		cmd = CommonJumpCmds.SEND_DOWNLOAD;
	}

	return true;
end

--跳转到游戏
CommonJumpLogic.__onJumpToGame = function(self, data)
	local gameId = number.valueOf(data.gameid);
	local levelId = number.valueOf(data.level);
	if gameId <= 0 then
		return;
	end

	--将参数补全 防止需要安装或更新
	local gameConfig = kGameManager:getGameConfigById(gameId);
	gameConfig.status = HallUpdateConfig.getInstance():getGameStatus(gameId);
	gameConfig.levelId = levelId;

	self.m_jumpData = {
		cmd = CommonJumpCmds.GOTO_GAME;
		params = gameConfig;
	}

	return true;
end

--跳转到任务
CommonJumpLogic.__onJumpToTask = function(self, data)
	self.m_jumpData = { cmd = CommonJumpCmds.GOTO_TASK };
	return true;
end

--更新银币
CommonJumpLogic.__onUpdateUserMoney = function(self, data)
	local money = tonumber(data.money);
	if money and money >= 0 then
		kUserInfoData:setMoney(money);
	end
end

--更新用户钻石
CommonJumpLogic.__onUpdateUserDiamond = function(self, data)
	local diamond = tonumber(data.diamond);
	if diamond and diamond >= 0 then
		kUserInfoData:setDiamond(diamond);	
	end
end

--更新用户金条
CommonJumpLogic.__onUpdateUserCrystal = function(self, data)
	local crystal = tonumber(data.crystal);
	if crystal and crystal >= 0 then
		kUserInfoData:setCrystal(crystal);	
	end
end

--跳转到私人房
CommonJumpLogic.__onJumpToPrivateRoom = function(self, data)
	self.m_jumpData = {
		cmd = CommonJumpCmds.GOTO_PRIVATE_ROOM;
	}
	require("hall/privateRoom/data/privateRoomDataInterface");
	PrivateRoomDataInterface.getInstance():setJumpInfo(data);
	return true;
end

--跳转到广播界面
CommonJumpLogic.__onJumpToBroadcast = function(self)
	self.m_jumpData = { cmd = CommonJumpCmds.GOTO_BROADCAST };

	return true;
end

--微信分享/微信邀请
CommonJumpLogic.__onWeiXinShare = function(self, data, isSendToFriendsCircle)
	local info = table.verify(data.info);
	local weiChatInfo = ShareDataInterface.getInstance():getWeiXinChatInfo();
	local url = isSendToFriendsCircle and weiChatInfo.space_url or weiChatInfo.friend_url;
	url = info.share_url or url;
	local title = info.title or weiChatInfo.title;
	local desc = info.desc or weiChatInfo.desc;
	local share_icon = info.share_icon or weiChatInfo.share_icon;
	WeixinShareUtil.getInstance():weixinSendWebPage(url, title, desc, share_icon, isSendToFriendsCircle);
end

--跳转到比赛界面
CommonJumpLogic.__onJumpToMatchRoom = function(self, data)
	self.m_jumpData = {
		cmd = CommonJumpCmds.GOTO_MATCH_ROOM;
	}

	require("isolater/interface/matchIsolater");
	MatchIsolater.getInstance():setMatchJumpInfo(data);
	return true;
end

--跳转到房间列表界面
CommonJumpLogic.__onJumpToRoomList = function(self, data)
	local gameid = number.valueOf(data.gameid);
	if gameid <= 0 then
		return;
	end

	--将参数补全 防止需要安装或更新
	local gameConfig = kGameManager:getGameConfigById(gameid);
	gameConfig.status = HallUpdateConfig.getInstance():getGameStatus(gameid);

	self.m_jumpData = {
		cmd = CommonJumpCmds.GOTO_GAME_ROOM_LIST;
		params = gameConfig;
	}
	
	return true;
end

--跳转到团队赛
CommonJumpLogic.__onToGroupRoom = function(self)
	self.m_jumpData = {
		stateId = States.GroupGame;
	}
	return true;
end

--empty function 
CommonJumpLogic.__emptyFunc = function(self)
end

CommonJumpLogic.__onExecuteRechargeJumpTab = function(self, data)
	local tab = number.valueOf(data.tab);
	require("hall/recharge/data/rechargeDataInterface");
	RechargeDataInterface.getInstance():setToRechargeModeByJumpTab(tab);
end

--跳转到注册界面
CommonJumpLogic.__onJumpToRegisterAccount = function(self)
	self.m_jumpData = { cmd = CommonJumpCmds.GOTO_REGISTER_ACCOUNT };
	return true;
end

CommonJumpCmds.s_jumpCmdConfig = {
	[CommonJumpCmds.GET_USER_DATA] 			= { func = CommonJumpLogic.__emptyFunc };
	[CommonJumpCmds.SEND_DOWNLOAD] 			= { func = CommonJumpLogic.__onToDownLoad };
	[CommonJumpCmds.QUIT_GAME]     			= { func = CommonJumpLogic.__emptyFunc };
	[CommonJumpCmds.GOTO_LOGIN]    			= { func = CommonJumpLogic.__onBackToHall };
	[CommonJumpCmds.GOTO_USERINFO] 			= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.UserInfo, nil, true} };
	[CommonJumpCmds.GOTO_HALL]     			= { func = CommonJumpLogic.__onBackToHall };
	[CommonJumpCmds.GOTO_GAME]     			= { func = CommonJumpLogic.__onJumpToGame };
	[CommonJumpCmds.GOTO_SHOP]     			= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.Recharge}, onPreExecuteFunc = CommonJumpLogic.__onExecuteRechargeJumpTab};
	[CommonJumpCmds.GOTO_TASK]     			= { func = CommonJumpLogic.__onJumpToTask };
	[CommonJumpCmds.GOTO_RANK]     			= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.RankList} };
	[CommonJumpCmds.GOTO_FRIENDS]  			= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.Community} };
	[CommonJumpCmds.UPDATE_MONEY]  			= { func = CommonJumpLogic.__onUpdateUserMoney };
	[CommonJumpCmds.INPUT_CDKEY]  			= { func = CommonJumpLogic.__emptyFunc };
	[CommonJumpCmds.GOTO_ACTIVITY_ONLY_LUA] = { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.Activity} };
	[CommonJumpCmds.GOTO_ACTIVITY] 		    = { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.Activity} };
	[CommonJumpCmds.GOTO_DIAMOND_SHOP] 		= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.DiamondShop} };
	[CommonJumpCmds.GOTO_PRIVATE_ROOM] 		= { func = CommonJumpLogic.__onJumpToPrivateRoom };
	[CommonJumpCmds.GOTO_BROADCAST] 		= { func = CommonJumpLogic.__onJumpToBroadcast };
	[CommonJumpCmds.GOTO_SEND_MESSAGE] 		= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.Message} };
	[CommonJumpCmds.GOTO_WEIXIN_SHARE] 		= { func = CommonJumpLogic.__onWeiXinShare, extParams = {true} };
	[CommonJumpCmds.GOTO_WEIXIN_INVITE] 	= { func = CommonJumpLogic.__onWeiXinShare, extParams = {false} };
	[CommonJumpCmds.GOTO_MATCH_ROOM] 		= { func = CommonJumpLogic.__onJumpToMatchRoom };
	[CommonJumpCmds.GOTO_GAME_ROOM_LIST] 	= { func = CommonJumpLogic.__onJumpToRoomList };
	[CommonJumpCmds.GOTO_GROUP_ROOM] 		= { func = CommonJumpLogic.__onExecuteJumpState, extParams = {States.GroupGame} };
	[CommonJumpCmds.UPDATE_DIAMOND]  		= { func = CommonJumpLogic.__onUpdateUserDiamond };
	[CommonJumpCmds.START_RECHARGE] 		= { func = CommonJumpLogic.__emptyFunc };
	[CommonJumpCmds.ANGECY_RECHARGE] 		= { func = CommonJumpLogic.__emptyFunc };
	[CommonJumpCmds.ANGECY_H5_BACK]   		= { func = CommonJumpLogic.__emptyFunc };
    [CommonJumpCmds.UPDATE_CRYSTAL]         = { func = CommonJumpLogic.__onUpdateUserCrystal };
    [CommonJumpCmds.GOTO_REGISTER_ACCOUNT]  = { func = CommonJumpLogic.__onJumpToRegisterAccount };
}
