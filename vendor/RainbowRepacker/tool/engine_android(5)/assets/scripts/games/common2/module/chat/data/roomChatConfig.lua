RoomChatConfig = {};

RoomChatConfig.s_chatPathPrefix = "games/common2/module/chatWnd/";

RoomChatConfig.defaultChatLayerConfig = {
	["chatFace"] = {
		["file"] = "games/common/btn_face.png";
		["x"] = 0;
		["y"] = 0;
		["align"] = kAlignRight;
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

RoomChatConfig.defaultChatTextConfig = {
	["text"]={
		[1]="快点吧,我等的花儿都谢了!";
		[2]="哎呀！这底牌要是被我拿到就逆天了！";
		[3]="吐了个槽的,整个一个杯具啊.";
		[4]="不怕神一样的对手,就怕猪一样的队友!";
		[5]="和你合作，真是太愉快了！";
		[6]="不好意思，刚才卡了！";
		[7]="天啊，跪求悔牌啊！";
		[8]="唉....一手烂牌臭到底.";
		[9]="出啊，好牌都留着下蛋呀！";
		[10]="妹子，交个朋友吧";
	};
	["effectMap"] = {};
	["effectStr"] = "AudioChatString";
	["selfName"] = nil;
};

----------------------------------------------------------------------------------------------
--进入游戏前一定要调用，重置配置
RoomChatConfig.initData = function()
	RoomChatConfig.m_configMap = {};
	RoomChatConfig.m_callFuncMap = {};
	RoomChatConfig.m_infoData = {};
end 

--退出游戏前一定要调用，重置配置
RoomChatConfig.clear = function()
	RoomChatConfig.initData();
end 

----------------------------------------------------------------------------------------------
--用于配置聊天和表情这两个按钮的位置、图片以及是否显示
RoomChatConfig.setChatLayerConfig = function(chatLayerConfig)
	RoomChatConfig._setConfigMap("chatLayerConfig",chatLayerConfig);
end
RoomChatConfig.getChatLayerConfig = function()
	local chatLayerConfig = RoomChatConfig._getConfigMap("chatLayerConfig") or RoomChatConfig.defaultChatLayerConfig;
	return table.verify(chatLayerConfig);
end

--获取聊天弹框
RoomChatConfig.setChatPopupWndGetFunc = function(obj,func)
	RoomChatConfig._setCallFunc("chatPopupWndGainer",obj,func);
end

RoomChatConfig.getChatPopupWnd = function()
	local config = RoomChatConfig._getCallFunc("chatPopupWndGainer");
	if config.func then 
		return config.func(config.obj,seat);
	else 
		local chatwnd = require(RoomChatConfig.s_chatPathPrefix.."widget/chatExpressionWnd2");
		local config = RoomChatConfig.getChatTextConfig();
		local popupWnd = new(chatwnd,config);
		return popupWnd;
	end 
end

--配置聊天语及音效
RoomChatConfig.setChatTextConfig = function(chatTextConfig)
	RoomChatConfig._setConfigMap("chatTextConfig",chatTextConfig);
end
RoomChatConfig.getChatTextConfig = function()
	local chatTextConfig = RoomChatConfig._getConfigMap("chatTextConfig") or RoomChatConfig.defaultChatTextConfig;
	return table.verify(chatTextConfig);
end

--配置表情资源（配置格式参考games_new/common/module/chat/anim/face_config）
RoomChatConfig.setChatFaceConfig = function(chatFaceConfig)
	ExpressionDataManager.getInstance():setExpConfig(chatFaceConfig);
end
RoomChatConfig.getChatFaceConfig = function()
	return ExpressionDataManager.getInstance():getExpConfig();
end

--设置获取动画播放的位置的方法
RoomChatConfig.setChatAnimPosGetFunc = function(obj,func)
	RoomChatConfig._setCallFunc("chatAnimPosGainer",obj,func);
end
--返回参数依次为：align,x,y
RoomChatConfig.getChatAnimPos = function(seat)
	local config = RoomChatConfig._getCallFunc("chatAnimPosGainer");
	if config.func then 
		return config.func(config.obj,seat);
	else 
		return kAlignCenter,0,0;
	end 
end

--设置获取动画播放的位置的方法
RoomChatConfig.setChatMsgAnimPosGetFunc = function(obj,func)
	RoomChatConfig._setCallFunc("chatMsgAnimPosGainer",obj,func);
end

--返回参数依次为：align,x,y
RoomChatConfig.getChatMsgAnimPosGetFunc = function(seat)
	local config = RoomChatConfig._getCallFunc("chatMsgAnimPosGainer");
	if config.func then 
		return config.func(config.obj,seat);
	else 
		return kAlignCenter,0,0;
	end 
end

--设置表情动画
RoomChatConfig.setChatFaceAnimFunc = function(obj,func)
	RoomChatConfig._setCallFunc("chatFaceAnim",obj,func);
end

RoomChatConfig.playChatFaceAnim = function(seat,faceType,faceIndex)
	local config = RoomChatConfig._getCallFunc("chatFaceAnim");
	if config.func then 
		return config.func(config.obj,seat,faceType,faceIndex);
	else 
		require(RoomChatConfig.s_chatPathPrefix.."anim/expressionAnim2");	
		local align,x,y = RoomChatConfig.getChatAnimPos(seat);
		local playerNum = PlayerSeat.getInstance():getCurGamePlayerMaxCount();
		local action = GameMechineConfig.ACTION_NS_CHATFASEANIM;
		local info = {};
		info.seat = seat;
		info.faceType = faceType;
		info.faceIndex = faceIndex;
		info.x = x;
		info.y = y;
		info.align = align;
		info.playerNum = playerNum;
    	MechineManage.getInstance():receiveAction(action,info);
	end 
end

--设置聊天语动画
RoomChatConfig.setChatTextAnimFunc = function(obj,func)
	RoomChatConfig._setCallFunc("chatTextAnim",obj,func);
end

RoomChatConfig.playChatTextAnim = function(seat,chatText)
	local config = RoomChatConfig._getCallFunc("chatTextAnim");
	if config.func then 
		return config.func(config.obj,seat,chatText);
	else 		
		-- require(RoomChatConfig.s_chatPathPrefix.."anim/messageTextAnim2");	
		local align,x,y = RoomChatConfig.getChatMsgAnimPosGetFunc(seat);
		local chatTextConfig = RoomChatConfig.getChatTextConfig();
		local playerinfo = GamePlayerManager2.getInstance():getPlayerBySeat(seat);
		local action = GameMechineConfig.ACTION_NS_CHATMSGANIM;
		local info = {};
		info.chatText = chatText;
		info.x = x;
		info.y = y;
		info.align = align;
		info.sex = playerinfo:getSex();
		info.chatTextConfig = chatTextConfig;
		info.seat = seat;
    	MechineManage.getInstance():receiveAction(action,info);
	end 
end
----------------------------------------------------------------------------------------------
--将表情转换为socket可用的value
RoomChatConfig.setConvertToFaceValueFunc = function(obj,func)
	RoomChatConfig._setCallFunc("convertToFaceValue",obj,func);
end
RoomChatConfig.convertToFaceValue = function(faceType,faceIndex)
	local config = RoomChatConfig._getCallFunc("convertToFaceValue");
	if config.func then 
		return config.func(config.obj,faceType,faceIndex);
	else 
		local faceValue = 0;
		if faceType == 1 then
			faceValue = faceIndex + 2^16;
		elseif faceType == 2 then
			faceValue = faceIndex + 2^8;
		elseif faceType == 3 then
			faceValue = faceIndex;
		end
		return faceValue;
	end 
end

--将socket读出的value转换为本地可用的faceType和faceValue
RoomChatConfig.setConvertFromFaceValueFunc = function(obj,func)
	RoomChatConfig._setCallFunc("convertFromFaceValue",obj,func);
end

RoomChatConfig.convertFromFaceValue = function(faceValue)
	local config = RoomChatConfig._getCallFunc("convertFromFaceValue");
	if config.func then 
		return config.func(config.obj,faceValue);
	else 
		if not number.isNum(faceValue) then 
			return; 
		end
		local faceType = nil;
		local faceIndex = nil;
		if faceValue > 2^16 then
			faceType = 1;
			faceIndex = faceValue - (2^16);
		elseif faceValue > 2^8 and faceValue < 2^16 then
			faceType = 2;
			faceIndex = faceValue - (2^8);
		elseif faceValue < 2^8  then
			faceType = 3;
			faceIndex = faceValue;
		end
		return faceType,faceIndex;
	end 
end
----------------------------------------------------------------------------------------------
--存储数据
RoomChatConfig._setInfoData = function(name,value)
	if not(name and value) then 
		return;
	end 

	RoomChatConfig.m_infoData = table.verify(RoomChatConfig.m_infoData);
	RoomChatConfig.m_infoData[name] = value;
end 
RoomChatConfig._getInfoData = function(name)
	if not name then 
		return;
	end

	RoomChatConfig.m_infoData = table.verify(RoomChatConfig.m_infoData);
	return RoomChatConfig.m_infoData[name];
end 

--存储回调函数
--从中获取的为table
RoomChatConfig._setCallFunc = function(name,obj,func,...)
	if not(name and func) then 
		return;
	end 

	local config = {};
	config.obj = obj;
	config.func = func;
	config.arg = {...};

	RoomChatConfig.m_callFuncMap = table.verify(RoomChatConfig.m_callFuncMap);
	RoomChatConfig.m_callFuncMap[name] = config;
end 
RoomChatConfig._getCallFunc = function(name)
	if not name then 
		return {};
	end

	RoomChatConfig.m_callFuncMap = table.verify(RoomChatConfig.m_callFuncMap);
	return table.verify(RoomChatConfig.m_callFuncMap[name]);
end 

--存储配置表
--从该处获得的数据，如果存在的话一定为table
RoomChatConfig._setConfigMap = function(name,config)
	if not(name and config) then 
		return;
	end 

	RoomChatConfig.m_configMap = table.verify(RoomChatConfig.m_configMap);
	if type(config) == "table" then 
		RoomChatConfig.m_configMap[name] = config;
	end
end 
RoomChatConfig._getConfigMap = function(name)
	if not name then 
		return;
	end 
	RoomChatConfig.m_configMap = table.verify(RoomChatConfig.m_configMap);
	return RoomChatConfig.m_configMap[name];
end