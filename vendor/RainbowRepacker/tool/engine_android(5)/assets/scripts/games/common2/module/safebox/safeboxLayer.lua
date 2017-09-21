
local layerBase = require("games/common2/module/layerBase");

--[[
	房间内保险箱取钱
]]
local SafeBoxLayer = class(layerBase);

SafeBoxLayer.ctor = function(self)
	self:removeStateBroadcast();
end

SafeBoxLayer.dtor = function(self)	
end

SafeBoxLayer.parseViewConfig = function(self)
	local viewConfig = {
		["onlooker"] = {};
	};

	return viewConfig;
end

-- 初始化layer的配置
SafeBoxLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/safebox/safeboxView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/room_safeBox";
			viewConfig = "room_safeBox";
		};
		[2] = {};
		[3] = {};
	};
end

SafeBoxLayer.closeSafeBox = function(self, seat, uid, info, isFast)
	self:removeView(seat);
end

SafeBoxLayer.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_CLOSE_SAFEBOX]			= "closeSafeBox";
}

SafeBoxLayer.s_stateFuncMap = {
	[GameMechineConfig.STATUS_GAMEOVER]					= "closeSafeBox";
};

return SafeBoxLayer;


--[[
	保险箱取款，准备前可以取款，只取不存。公共房间的菜单取款功能会默认显示，如不想要这个功能，需要在配置中隐藏,isHid设置为true
	toolBarConfig.items[n] = {
		{
			key = "menu_exit",									-- 菜单名称
			icon = "",											-- 菜单ICON图标的路径
			callbackFunc = "onToolbarExitClick", 				-- 事件回调的方法，在对于游戏的scene中处理
			isDefault = true,									-- 是否系统默认菜单
			sort = 1,											-- 菜单排序
			action = "",										-- 定义按钮点击，需要出发的动作消息
			isHid = true,										-- 按钮是否需要隐藏
			path = "games/common/menuToolbar/menu/%s.png",		-- 菜单按钮的路径。命名规则key.png 和key_grey.png可点击和不可点击2中状态
		},
	}
	调用方式：
		1、创建保险箱
		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
	 	local data = {viewName = GameMechineConfig.VIEW_SAFEBOX}
		MechineManage.getInstance():receiveAction(action,data);
		2、打开保险箱
		local action = GameMechineConfig.ACTION_NS_OPEN_SAFEBOX;
		MechineManage.getInstance():receiveAction(action);
	
	状态监听：
	STATUS_GAMEOVER：结算时，关闭保险箱

	动作监听：
	ACTION_NS_CLOSE_SAFEBOX：关闭保险箱
	ACTION_NS_OPEN_SAFEBOX：打开保险箱
	ACTION_NS_SAFEBOXRESULT：保险箱取款结果
]]