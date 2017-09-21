
local layerBase = require("games/common2/module/layerBase");

--[[
	广播模块
]]
local RoomBroadcastLayer = class(layerBase);

RoomBroadcastLayer.ctor = function(self)
	self:removeStateBroadcast();
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

RoomBroadcastLayer.dtor = function(self)
	
end

-- 初始化layer的配置
RoomBroadcastLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/broadcast/roomBroadcastView";
			pos = {};
		};
		[2] = {};
		[3] = {};
	};
end

RoomBroadcastLayer.onReciveRadioMsg = function(self,seat,uid,info,isFast)
	if not self.m_views[1] then
		self:addView(1,self.m_viewConfig[1]);
	end
	self.m_views[1]:playRadioOnScreen(info);
end

RoomBroadcastLayer.s_actionFuncMap = {
    [GameMechineConfig.ACTION_NS_RECEIVE_RADIOMSG]      	= "onReciveRadioMsg";
};

return RoomBroadcastLayer;

--[[
	播放广播、跑马灯消息：

	CommonGameController2中注册了RadioIsolater.getInstance():setObserver(self);监听，有广播消息时
	CommonGameController2.onReciveRadioMsg中接收后发送GameMechineConfig.ACTION_NS_RECEIVE_RADIOMSG消息，
	通知广播层处理。
]]