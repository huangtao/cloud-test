local layerBase = require("games/common2/module/layerBase");

--[[
	房间背景上的电池和时间信息
]]
local SystemInfoLayer = class(layerBase);

function SystemInfoLayer:ctor()
	self:addView(1,self.m_viewConfig[1]);
    self:setFillParent(true,true);
end

function SystemInfoLayer:initViewConfig()
	local gameconfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local _config = gameconfig.timeViewConfig;
	if (not _config) and gameconfig.toolBarConfig and gameconfig.toolBarConfig.time_view then
		_config = gameconfig.toolBarConfig.time_view;
	end
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/systemInfo/systemInfoView",
            viewLayer = "view/kScreen_1280_800/games/common2/system_info";
            config = _config;
		};
		[2] = {};
		[3] = {};
	};
end

return SystemInfoLayer;

--[[
	系统时间显示，默认隐藏
	toolBarConfig.time_view定义了时钟显示的位置，老版本中时钟和菜单是一个模块，680进行了拆分。
	时钟模块默认是隐藏的，为了兼容老版本
	在菜单创建时，会读取toolBarConfig.time_view配置，发送ACTION_NS_INITTIMEVIEW消息，通知时间是否显示，并设置位置。

	700大厅版本可以修改为：
		-- 系统时间位置配置
		DDZConfig.timeViewConfig = {
			["x"] = -10;
			["y"] = 0;
			["align"] = kAlignTopLeft;
			["isShow"] = true;
		};

	
	监听动作：
	ACTION_NS_GET_BATTERYLEVEL：电量变化更新
	ACTION_NS_INITTIMEVIEW：初始化界面的位置和是否显示
]]