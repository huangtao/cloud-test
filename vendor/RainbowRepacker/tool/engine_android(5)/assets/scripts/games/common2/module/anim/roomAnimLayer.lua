
local layerBase = require("games/common2/module/layerBase");

--[[
	动画层
]]

local RoomAnimLayer = class(layerBase);

RoomAnimLayer.s_cmds = {
};

RoomAnimLayer.ctor = function(self)
	self:removeStateBroadcast();
end

RoomAnimLayer.dtor = function(self)
end

-- 初始化layer的配置
RoomAnimLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/anim/roomAnimView";
		};
		[2] = {
			-- path = "games/common2/module/anim/roomAnimView";
		};
		[3] = {
			-- path = "games/common2/module/anim/roomAnimView";
		};
	};
end

RoomAnimLayer.s_cmdConfig = 
{
};

return RoomAnimLayer;

--[[
公共房间动画图层
	功能：踢人、互动道具、加好友相关动画、升场、聊天、表情
	说明：
		动画模块，负责播放动画。有新动画播放时，发送消息通知模块，并添加接收逻辑，播放动画
	动画尽量定义为layer类型的local类，避免直接继承animBase，定义成全局类。
]]