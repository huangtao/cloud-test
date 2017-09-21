
--[[
	房间右上角菜单
]]
local layerBase = require("games/common2/module/layerBase");

local RoomMenuBarLayer = class(layerBase);

RoomMenuBarLayer.s_cmds = {
	initToolBar = ToolKit.getIndex();
};

RoomMenuBarLayer.ctor = function ( self )
	self:init();
end

RoomMenuBarLayer.dtor = function ( self )
end

RoomMenuBarLayer.init = function ( self )
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();
	if self.m_viewConfig[localseat] then
		self:addView(localseat,self.m_viewConfig[localseat]);
	end
end

RoomMenuBarLayer.initToolBar = function ( self, ... )
end

RoomMenuBarLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

RoomMenuBarLayer.initViewConfig = function ( self )
	-- body
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/roomMenuBar/roomMenuBarView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/menuToolbar/room_menu_toolbar";
			viewConfig = "room_menu_toolbar";
		};
		[2] = {};
		[3] = {};
	};
end

RoomMenuBarLayer.onMenuClick = function ( self, callbackFunc )
	-- body
	Log.d("RoomMenuBarLayer.onMenuClick", callbackFunc);
	if string.isEmpty(callbackFunc) then 
		Log.d("RoomMenuBarLayer.onMenuClick", "Param callbackFunc cannot be empty.");
		return; 
	end
	self:execDelegate(callbackFunc);
end

RoomMenuBarLayer.s_cmdConfig = {
	[RoomMenuBarLayer.s_cmds.initToolBar] = RoomMenuBarLayer.initToolBar;
};


return RoomMenuBarLayer;

--[[
	菜单模块
	默认支持 退出、托管、商城、设置、取款 5个操作。

	特殊功能说明：
	1、配置里面的items.callbackFunc参数，配置按钮回调的方法。在gamescene里面实现items.callbackFunc，就可以自定义处理事件
	2、items.action：定义点击事件触发后，需要发送的动作消息
	3、toolBarConfig.time_view定义了时钟显示的位置，老版本中时钟和菜单是一个模块，680进行了拆分。时钟模块默认是隐藏的，为了兼容老版本
	在菜单创建时，会读取toolBarConfig.time_view配置，发送ACTION_NS_INITTIMEVIEW消息，通知时间是否显示，并设置位置

	配置说明：
	DDZConfig.toolBarConfig = {
	
		["aiCommand"] = DDZSocketCmd.ROOM_SEND_AI, -- 定义托管，发送的命令。各子游戏有可能定义不一致

		["items"] = { -- 没有自定义的菜单时，不需要配置items
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
		};

		["menu_view"] = { --菜单弹框位置（不配则为默认位置）
			["x"] = 10;
			["y"] = 0;
			["align"] = kAlignTopRight;
		};

		["menubtn_view"] = { 菜单按钮位置
			["x"] = 0;
			["y"] = 0;
			["align"] = kAlignTopLeft;
		};
	};
	 
	状态监听：
	STATUS_READY：准备后不可取款
	STATUS_START：游戏开始后，不能退出和重置
	STATUS_GAMEOVER：游戏结束后，取款、退出、重置按钮设置为可点击
	STATUS_LOGIN/STATUS_LOGOUT：登陆和登陆状态时，重置默认按钮可点击状态。自定义按钮，需要发送ACTION_NS_MENUBAR_BTN_ENABLE消息通知更新

	动作监听：
	ACTION_NS_CANCEL_AI：发送消息取消托管
	ACTION_NS_ROBOT：刷新托管状态
	ACTION_NS_MENUBAR_BTN_ENABLE：设置菜单按钮是否可点击
		调用方式：	local info = {
						[1] = {key="menu_setting",enable=false};
						[2] = {key="menu_exit",enable=true};
					};
					MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_MENUBAR_BTN_ENABLE,info);

	特殊功能调用:
	保险箱取款：
		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
	 	local data = {viewName = GameMechineConfig.VIEW_SAFEBOX}
		MechineManage.getInstance():receiveAction(action,data);
		
		local action = GameMechineConfig.ACTION_NS_OPEN_SAFEBOX;
		MechineManage.getInstance():receiveAction(action);

	设置：
		local action = GameMechineConfig.ACTION_NS_CREATVIEW;
	 	local data = {viewName = GameMechineConfig.VIEW_SETTING}
		MechineManage.getInstance():receiveAction(action,data);

		local action = GameMechineConfig.ACTION_NS_OPEN_SETTING;
		MechineManage.getInstance():receiveAction(action);

]]