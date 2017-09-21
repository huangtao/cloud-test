
--邀请好友模块
local layerBase = require("games/common2/module/layerBase");
local InviteLayer2 = class(layerBase, false);

InviteLayer2.ctor = function(self)
	super(self, nil);
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

InviteLayer2.Delegate = {
}; 

InviteLayer2.parseViewConfig = function(self)
	local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
InviteLayer2.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/invite2/inviteView2";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/inviteView2";
			viewConfig = "inviteView2";
		};
		[2] = {};
		[3] = {};
	};
end

InviteLayer2.dtor = function(self)
	
end

InviteLayer2.onCloseInviteView = function(self,seat,uid,info,isFast)
	self:removeView(seat);
end

InviteLayer2.s_stateFuncMap = {
    [GameMechineConfig.STATUS_START]             = "onCloseInviteView";
    [GameMechineConfig.STATUS_GAMEOVER]          = "onCloseInviteView";
};


InviteLayer2.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_CLOSEINVITE]             = "onCloseInviteView";
};

return InviteLayer2;

--[[
	邀请好友模块
	支持 微信/QQ好友、 面对面扫码、短信、在线好友的邀请

	监听状态:
	STATUS_START/STATUS_GAMEOVER：游戏开始和结算状态时，会关闭邀请的弹框
	STATUS_LOGIN：登陆状态，会校验是否弹框。私人房登陆成功后,会自动弹出弹框
	STATUS_LOGOUT/STATUS_READY：登出/准备状态，清除社交消息的监听

	监听动作：
	ACTION_NS_CLOSEINVITE：关闭邀请弹框
	ACTION_NS_REQUESTINVITELIST：显示邀请弹框
	ACTION_NS_RECEIVE_PRIVATEROOMINFO: 接收私人房信息
	ACTION_NS_GET_PASSWORD_BY_INFO：获取口令码
	ACTION_NS_HIDEINVITE：隐藏邀请框
	ACTION_NS_INITINVITE：初始化邀请框，生成口令数据
]]