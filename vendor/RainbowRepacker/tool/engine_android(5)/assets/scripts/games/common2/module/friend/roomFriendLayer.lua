
local layerBase = require("games/common2/module/layerBase");

--[[
	房间内社交模块
]]

local RoomFriendLayer = class(layerBase);

RoomFriendLayer.s_cmds = {
};

RoomFriendLayer.ctor = function(self)
	self:removeStateBroadcast();
end

RoomFriendLayer.dtor = function(self)
end

-- 初始化layer的配置
RoomFriendLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/friend/roomFriendView";
			config = { --用来配置roomFriendView中使用的好友申请的弹框
				path = "games/common2/module/friend/widget/roomFriendApplyWnd";
				viewLayer = "view/kScreen_1280_800/games/common2/roomFriendApplyPop2";
				viewConfig = "roomFriendApplyPop2";
				config = {
					time = 5; --倒计时
				};
			};
		};
		[2] = {
		};
		[3] = {
		};
	};
end

return RoomFriendLayer;

--[[
	社交模块
	
	消息：
	ACTION_NS_FRIENDAPPLY：收到有人加自己为好友时，发送这个消息。弹框提示

	支持自定义的配置：
	RoomFriendConfig.setFriendInviteWndGetFunc：可配置邀请好友弹框界面
	RoomFriendConfig.setFriendApplyAnimFunc：设置加好友动画
	RoomFriendConfig.setFriendApplyWndGetFunc：获取加好友弹框
]]