require("isolater/common/commonController");
require("hall/groupGame/data/groupGameInterface");

GroupGameController = class(CommonController)

GroupGameController.s_cmds = 
{
	Back = 1,
};

GroupGameController.s_ActivityListTimeOut = 1;
GroupGameController.s_timeOutTime = 6000;

GroupGameController.ctor = function(self, state, viewClass, viewConfig)
	self.m_state = state;
end

GroupGameController.run = function(self)
    CommonController.run(self);
end

GroupGameController.stop = function(self)
	CommonController.stop(self);
	LoadingView.getInstance():hidden();
	NativeEvent.getInstance():HideLoadingDialog();
end

-- 活动需要实时获取数据
GroupGameController.resume = function(self)
	CommonController.resume(self);
end

GroupGameController.pause = function(self)
	CommonController.pause(self);
end

GroupGameController.dtor = function(self)	
	LoadingView.getInstance():hidden();
	self.m_state = nil;
end

GroupGameController.onBack = function(self)
	if NativeEvent.s_platform ~= kPlatformAndroid then 
		self:onGoBackWebView();
	else
		NativeEvent.getInstance():GoBackWebView();
	end
end

GroupGameController.onGoBackWebView = function(self, status, jsonTable)
	StateMachine.getInstance():popState();
end

GroupGameController.onWebviewCall = function(self, status, jsonTable)
	if table.isEmpty(jsonTable) then return; end
	if status and jsonTable then
		-- CMD_GET_USERDATA		= 1001; //获取用户资料 -- java或ios做
		-- CMD_SEND_DOWNLOAD		= 1002; //下载 -- java或ios做
		-- CMD_SEND_QUIT			= 1003; //退出应用
		-- CMD_SEND_GOTO_LOGIN		= 1004; //跳转至登录界面
		-- CMD_SEND_GOTO_PROFILE	= 1005; //跳转至个人资料界面
		-- CMD_SEND_GOTO_HALL		= 1006; //跳转至大厅界面
		-- CMD_SEND_GOTO_GAME		= 1007; //快速进入游戏
		-- CMD_SEND_GOTO_SHOP		= 1008; //跳转至商城界面
		-- CMD_SEND_GOTO_TASK		= 1009; //跳转至任务界面
		-- CMD_SEND_GOTO_RANK		= 1010; //跳转至排行榜界面
		-- CMD_SEND_GOTO_FRIENDS	= 1011; //跳转至好友界面
		-- CMD_SEND_ADD_COINS	= 1012; //加银币返回
		local cmd = number.valueOf(GetStrFromJsonTable(jsonTable, "cmd"));
		Log.v("wanpg","---------活动js回调-------status:", status);
		Log.v("wanpg","---------活动js回调-------cmd：", cmd);
		if cmd == 1003 then

		elseif cmd == 1004 then

		elseif cmd == 1005 then
			self.m_state:pushState(States.UserInfo);
		elseif cmd == 1006 then
			self:onGoBackWebView();
		elseif cmd == 1007 then
			--此处去游戏
			local gameId = number.valueOf(GetStrFromJsonTable(jsonTable, "gameid"));
			local levelId = number.valueOf(GetStrFromJsonTable(jsonTable, "level"));
			local tableId = number.valueOf(GetStrFromJsonTable(jsonTable, "tableid"));
			if gameId > 0 and levelId > 0 and tableId > 0 then

			elseif gameId > 0 and levelId > 0 then

			elseif gameId > 0 then
				self:onToGame(gameId);
			else

			end
		elseif cmd == 1008 then
			self.m_state:pushState(States.Recharge);
		elseif cmd == 1009 then
			self.m_state:pushState(States.Task);
		elseif cmd == 1010 then
			self.m_state:pushState(States.RankList);
		elseif cmd == 1011 then

		elseif cmd == 1012 then
			local money = number.valueOf(GetStrFromJsonTable(jsonTable, "money"));
			Log.v("wanpg","---------活动js回调-------money:", money);
			if money and money>0 then
				kUserInfoData:setMoney(money);
			end
		end
	end
end


GroupGameController.onToGame = function(self, gameId,levelId)
	--0:敬请期待(游戏占位符) 1:无变化 2:可安装 3:可更新
	local state =  HallUpdateConfig.getInstance():getGameStatus(gameId);
	local data = kGameManager:getGameConfigById(gameId);
	data.status = state; -- 加入状态信息
	data.levelId = levelId;
	EventDispatcher.getInstance():dispatch(HallController.s_eventGoToGameDirect,data);
end

GroupGameController.s_nativeEventFuncMap = {
	["GoBackWebViewUrl"] = GroupGameController.onGoBackWebView;
	["OnWebViewCall"] = GroupGameController.onWebviewCall;
}

GroupGameController.s_cmdConfig = 
{
	[GroupGameController.s_cmds.Back] = GroupGameController.onBack,
}