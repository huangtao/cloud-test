
local layerBase = require("games/common2/module/layerBase");

--[[
	玩家头像功能层
]]

local HeadLayer = class(layerBase);

HeadLayer.Delegate = 
{
};

HeadLayer.s_cmds = {
};

HeadLayer.ctor = function(self)
	self:init();
end

HeadLayer.dtor = function(self)
end

HeadLayer.init = function (self)
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
		return;
	end
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
		local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
		local playerNumer = number.valueOf(config.playerNumer,3);
		for seat = 1, playerNumer do
			if not self.m_views[seat] then
				self:addView(seat,self.m_viewConfig[seat]);
			end
		end
	end
end

HeadLayer.resetHeadPosition = function (self,seat,uid,info,isFast)
	local config = self.m_viewConfig[seat];
	if self.m_views[seat] and config.pos then
		self.m_views[seat]:setPos(config.pos.x,config.pos.y);
		self.m_views[seat]:setAlign(config.align);
	end
end

-- 初始化layer的配置
HeadLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/head/headViewBase";
		};
		[2] = {
			path = "games/common2/module/head/headViewBase";			
		};
		[3] = {
			path = "games/common2/module/head/headViewBase";
		};
	};
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	for k, v in ipairs(self.m_viewConfig) do 
		self.m_viewConfig[k].config = config;
	end
end

HeadLayer.onLogout = function(self,seat,uid,info,isFast)
	if self.m_views[seat] and seat ~= PlayerSeat.getInstance():getMyLocalSeat() then
		if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
			if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
				Log.d("HeadLayer.onLogout seat = ",seat)
				self:removeView(seat);
			else 
				self.m_views[seat]:clear();
			end
			
		else
			self:removeView(seat);
		end
		InteractionInfo.getInstance():reset(seat);
	end
end

HeadLayer.s_stateFuncMap = {
    [GameMechineConfig.STATUS_LOGIN]          	= "init";  
    [GameMechineConfig.STATUS_NONE]          	= "onLogout";  
	[GameMechineConfig.STATUS_LOGOUT]           = "onLogout";  
	[GameMechineConfig.STATUS_GAMEOVER]         = "resetHeadPosition";  
};

HeadLayer.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_REFRESH_PRIVATE_ROOM]	= "init";
}

HeadLayer.s_cmdConfig = 
{
};

return HeadLayer;

--[[
	公共头像模块说明

	头像模块使用说明：
	1、公共头像模块，提供了一个基础的头像功能，可以显示头像信息、VIP状态、邀请按钮、银币信息、昵称信息、
	破产状态(破产时，头像上显示破产的动画)、防作弊逻辑、比赛分数计算
	2、子游戏可自定义头像，通过继承的方式，把功能头像的功能添加到子游戏中。
	3、互动道具、聊天等动画的位置都是根据头像位置来计算的，通过InteractionInfo来设置对于位置的头像相关信息，来获取坐标信息。
	头像位置发生变化时，需要通知InteractionInfo来刷新坐标信息。
	4、破产时，头像上会播放破产动画，在准备后会停止动画。
	5、开启防作弊时，昵称和头像都不显示真实的信息。
	6、若子游戏的头像完全是自己定义的，需要处理破产动画、防作弊、比赛积分刷新、银币刷新、昵称刷新等逻辑。如果是继承的方式就不需要子游戏单独处理。

	监听的状态：
	STATUS_LOGIN：私人房创建时，重新调用头像初始化的逻辑
	STATUS_LOGOUT：如果是其它玩家，删除头像
	STATUS_GAMEOVER：重置头像位置

	STATUS_JOIN/STATUS_LOGIN/STATUS_GAMEOVER：刷新头像相关的个人信息
	STATUS_READY/STATUS_PLAYING：停止头像上的破产动画
	
	监听的动作：
	ACTION_NS_REFRESH_PRIVATE_ROOM：私人房时，重新调用头像初始化的逻辑
	ACTION_NS_UPDATE_USERINFO：个人信息或身份信息发生变化时，刷新头像
	ACTION_NS_ROBOT：托管状态变化时，通知头像刷新
	ACTION_NS_MATCH_SCORE：比赛时，分数变化，通知头像刷新分数
	ACTION_NS_REFRESH_USERPROPERTY：刷新用户的资产信息

	headview中提供setNickNameMaxLen：设置默认的昵称最大长度
]]
