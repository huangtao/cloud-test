
local layerBase = require("games/common2/module/layerBase");
--[[
	闹钟
]]
local ClockLayer = class(layerBase);



ClockLayer.Delegate = 
{
};

ClockLayer.s_cmds = {
};


ClockLayer.ctor = function(self)
	self:removeStateBroadcast();
end

ClockLayer.dtor = function(self)

end

ClockLayer.onHidClock = function(self)
	for k,v in pairs(self.m_views) do
		v:stop();
	end
end

------------------------- 加好友-------------------------

-- 初始化layer的配置
ClockLayer.initViewConfig = function(self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local clockPos = table.verify(config.clockPos);
	self.m_viewConfig = {};
	local playerNumer = number.valueOf(config.playerNumer,3);
	for i = 1, playerNumer do
		local info = {};
		info.path = self:getViewPath();
		info.viewLayer = self:getViewLayoutPath();
		info.viewConfig = self:getViewLayoutConfig();
		info.config = clockPos[i];
		self.m_viewConfig[i] = info;
	end
end

ClockLayer.getViewPath = function ( self )
	return "games/common2/module/clock/clockView";
end

ClockLayer.getViewLayoutPath = function ( self )
	return "view/kScreen_1280_800/games/common2/clocklayout";
end

ClockLayer.getViewLayoutConfig = function ( self )
	return "clocklayout";
end

ClockLayer.s_cmdConfig = {
};

return ClockLayer;

--[[
	闹钟模块：
	ACTION_NS_OPENCLOCK：显示闹钟
		ep:
		data = {
			leftTime, -- 闹钟计时时间
			isShake, -- 5s后，是否需要震动
			}
		MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_OPENCLOCK, data, uid);
	ACTION_NS_CLOSECLOCK：关闭闹钟 

	配置说明：
	--闹钟位置
	DDZConfig.clockPos = {

		[1] = {
			["x"] = 0;
			["y"] = 295;
			["align"] = kAlignBottom;
		};
		[2] = {
			["x"] = 165;
			["y"] = 210;
			["align"] = kAlignTopRight;
		};
		[3] = {
			["x"] = 165;
			["y"] = 210;
			["align"] = kAlignTopLeft;
		};
	};
]]