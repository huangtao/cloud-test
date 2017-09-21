
--[[
	表情、聊天
]]
local layerBase = require("games/common2/module/layerBase");

local ChatLayer = class(layerBase);

ChatLayer.Delegate = 
{
};

ChatLayer.ctor = function(self)
	self:init();
end

ChatLayer.init = function(self)
	RoomChatConfig.setChatLayerConfig(table.verify(GameProcessManager2.getInstance():getGameConfig()).chatLayerConfig);
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
	RoomChatConfig.setChatAnimPosGetFunc(self,self.getChatFaceAnimPos);
	RoomChatConfig.setChatMsgAnimPosGetFunc(self,self.getChatMsgAnimPos);
end

ChatLayer.dtor = function(self)
	RoomChatConfig.clear();
end

ChatLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
ChatLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/chat/roomChatLayer";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/chat/roomChatLayer_new";
			viewConfig = "roomChatLayer_new";
		};
		[2] = {};
		[3] = {};
	};
end

ChatLayer.getChatFaceAnimPos = function(self,seat)
	return InteractionInfo.getInstance():getChatFaceAnimPos(seat);
end

ChatLayer.getChatMsgAnimPos = function(self,seat)
	return InteractionInfo.getInstance():getChatMsgAnimPos(seat);
end

return ChatLayer;

--[[
	聊天按钮显示逻辑，默认隐藏。
	STATUS_JOIN：登录状态，判断是否开启了防作弊，否则就会显示聊天按钮
	ACTION_NS_ROOMUPCHANGE：根据当前level和防作弊标志，刷新按钮是否显示


	RoomChatConfig.lua聊天配置文件
	可配置聊天弹框、动画定制、位置大小调整等


	配置说明：
	-- 聊天默认语句，RoomChatConfig.setChatTextConfig(设置聊天信息)
	DDZConfig.chatTextConfig = {
		["text"]={
			[1]="快点吧,我等的花儿都谢了!";
			[2]="哎呀！这底牌要是被我拿到就逆天了！";
			[3]="吐了个槽的,整个一个杯具啊.";
			[4]="不怕神一样的对手,就怕猪一样的队友!";
			[5]="和你合作，真是太愉快了！";
			-- [6]="不好意思，刚才卡了！";
			[6]="天啊，跪求悔牌啊！";
			[7]="唉....一手烂牌臭到底.";
			[8]="出啊，好牌都留着下蛋呀！";
			[9]="妹子，交个朋友吧";
		};
		["effectMap"] = DDZEffectKeys;
		["effectStr"] = "AudioChatString";
		["selfName"] = nil;
	};

	-- 聊天按钮位置，RoomChatConfig.setChatLayerConfig(xx)设置位置
	DDZConfig.chatLayerConfig = {
		["chatFace"] = {
			["file"] = "games/ddz/room/chat_btn.png";
			["x"] = 30;
			["y"] = 6;
			["align"] = kAlignBottomRight;
			["visible"] = true;
		};

		["chatText"] = {
			["file"] = "games/common/btn_chat.png";
			["x"] = -50;
			["y"] = 150;
			["align"] = kAlignRight;
			["visible"] = false;
		};
	};

]]