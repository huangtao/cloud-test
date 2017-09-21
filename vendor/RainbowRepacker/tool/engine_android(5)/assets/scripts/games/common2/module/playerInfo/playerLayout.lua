
local layerBase = require("games/common2/module/layerBase");
require("games/common2/module/playerInfo/playerInfoLogic");


--[[
	用户详情信息
]]
local PlayerLayout = class(layerBase);

PlayerLayout.ctor = function(self)
	self.m_curSeat = -1;
end

PlayerLayout.dtor = function(self)
	PlayerInfoLogic.releaseInstance();
end

PlayerLayout.onPlayerHeadClick = function(self,seat,uid,info,isFast)
	local info = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
	if info then
		if self.m_curSeat ~= seat then
			self:removeView(self.m_curSeat);
		end
		if not self.m_views[seat] then
			self:addView(seat,self.m_viewConfig[seat]);
		end
		local x, y = InteractionInfo.getInstance():getPlayerInfoPos(seat);
		self.m_views[seat]:show(x,y,info);
		self.m_views[seat]:setPropsData(self:getPropsInfoData());
		self.m_curSeat = seat;
	end
end

--游戏可重载该方法、不同的游戏展示不同的道具
PlayerLayout.getPropsInfoData = function(self)
	local propsData = {
		{
			PropIsolater.getInstance():getPropInfoByType(203),
			PropIsolater.getInstance():getPropInfoByType(202),
			PropIsolater.getInstance():getPropInfoByType(201),
			PropIsolater.getInstance():getPropInfoByType(200)
		}
	};
	-- 可在游戏自己的xxxgameconfig.lua中定义
	return propsData;
end

-- 玩家离开，关闭当前玩家的弹框
PlayerLayout.onLogout = function(self,seat,uid,info,isFast)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if localseat ~= seat and self.m_views[seat] then
		self:removeView(seat);
	end
end

PlayerLayout.onGameOver = function(self,seat,uid,info,isFast)
	self:removeView(seat);
end

-- 废弃的接口
PlayerLayout.onHidCurPlayerInfo = function(self)
	-- if self.m_views[self.m_curSeat] then
	-- 	self.m_views[self.m_curSeat]:hidden();
	-- end
end

------------------------- 加好友-------------------------

-- 初始化layer的配置
PlayerLayout.initViewConfig = function(self) 
	local gameConfig = table.verify(GameProcessManager2.getInstance():getGameConfig());

	local playerNumber = number.valueOf(gameConfig.playerNumer or 3);
	local isNeedDrawTimes = gameConfig.isNeedDrawTimes; --是否需要平局信息
	self.m_viewConfig = {};
	local data = {
			path = "games/common2/module/playerInfo/playerInfoView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/room_player_info_layout";
			viewConfig = "room_player_info_layout";
			config = {
				isNeedDrawTimes = isNeedDrawTimes;
			};
		};
	for i = 1, playerNumber do 
		table.insert(self.m_viewConfig, Copy(data));
	end
end

PlayerLayout.s_stateFuncMap = {
    [GameMechineConfig.STATUS_NONE]          	= "onLogout";  
	[GameMechineConfig.STATUS_LOGOUT]           = "onLogout";  
	[GameMechineConfig.STATUS_GAMEOVER]         = "onGameOver";  
};

PlayerLayout.s_actionFuncMap = {
    [GameMechineConfig.ACTION_NS_HEADCLICK]      	= "onPlayerHeadClick";
};

return PlayerLayout;

--[[
	房间内个人信息模块
	功能说明：
	显示个人信息、发送互动道具、踢人、加好友、举报
	开启了防作弊时，弹框里面的的银币、昵称等信息都隐藏，提示开启了防作弊

	特殊逻辑：
	个人信息的弹框一次只能显示一个，状态发送了变化并且弹框显示时，需要过滤非当前玩家的消息。
	ep：显示了A玩家的个人信息弹框，收到B忘记登出的状态变化时，弹框不应该关闭。

	举报功能调用：
	1、创建举报模块的layer
		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
		local data = {viewName = GameMechineConfig.VIEW_REPORT}
	   	MechineManage.getInstance():receiveAction(action,data);
	2、显示举报模块
		action = GameMechineConfig.ACTION_NS_OPEN_REPORT;
		local data = {uid=self.m_player.m_id,whichItem = _whichItem};
		MechineManage.getInstance():receiveAction(action,data);

	状态监听：
	STATUS_NONE/STATUS_LOGOUT：非登陆状态，删除其他玩家的个人信息界面
	STATUS_GAMEOVER：结算时关闭界面

	动作监听：
	ACTION_NS_HEADCLICK：点击了玩家头像，显示个人信息弹框界面
	ACTION_NS_ADDFRIENDRESULT：收到加好友结果的消息，隐藏弹框
	ACTION_SHOWPROPNIM：互动道具使用成功，隐藏弹框
	ACTION_SHOWPROPNIM：互动道具使用成功，隐藏弹框
	ACTION_NS_CLOSEPLAYERWND：发送消息，直接关闭弹框
]]