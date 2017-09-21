--[[
	表情、聊天弹框
]]
require("games/common2/module/chat/data/roomChatConfig");
require(RoomChatConfig.s_chatPathPrefix.."data/roomChatTextRecord");
require(RoomChatConfig.s_chatPathPrefix.."data/expressionDataManager2");
require(RoomChatConfig.s_chatPathPrefix.."data/roomChatTextRecord");

local layerBase = require("games/common2/module/layerBase");

local ChatWndLayer = class(layerBase);

ChatWndLayer.Delegate = 
{
};

ChatWndLayer.ctor = function(self)
	self:init();
end

ChatWndLayer.init = function(self)
	if not self.m_views[1] then
		self:addView(1,self.m_viewConfig[1]);
	end
	RoomChatConfig.setChatTextConfig(table.verify(GameProcessManager2.getInstance():getGameConfig()).chatTextConfig);
	RoomChatTextRecord.getInstance():reset();
end

ChatWndLayer.dtor = function(self)
	RoomChatTextRecord.releaseInstance();
	ExpressionDataManager2.releaseInstance();
end


ChatWndLayer.parseViewConfig = function(self)
	local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
ChatWndLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/chatWnd/chatwndview";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/chat/roomchatwnd";
			viewConfig = "roomchatwnd";
		};
		[2] = {};
		[3] = {};
	};
end

return ChatWndLayer;

--[[
	聊天弹框逻辑
	功能说明：
	发送表情、聊天消息、聊天记录、升级为VIP、
	聊天记录：只记录自定义的聊天信息

	状态监听：
	STATUS_GAMEOVER：结算时隐藏聊天弹框

	动作监听：
	ACTION_RECEIVE_CHAT：接收他人发送的聊天消息
	ACTION_RECEIVE_FACE：接收他人发送的表情
	ACTION_NS_CLICKACHAT：显示或隐藏聊天弹框
	ACTION_NS_SEND_CHAT：模拟发送聊天消息，消息内容info：需要发送的聊天消息
		ep:
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_SEND_CHAT,"沙发");

]]