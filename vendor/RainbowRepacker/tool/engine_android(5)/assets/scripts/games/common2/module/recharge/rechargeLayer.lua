
local layerBase = require("games/common2/module/layerBase");

--[[
	顶部菜单栏
]]
local RechargeLayer = class(layerBase);

RechargeLayer.ctor = function(self)
end

RechargeLayer.dtor = function(self)
	
end

RechargeLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
RechargeLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/recharge/roomRecharge";
			pos = {};
		};
		[2] = {};
		[3] = {};
	};
end

return RechargeLayer;

--[[
	支付调用模块
	监听动作：
	ACTION_RECHARGE：调用支付逻辑，发送的消息里面带上支付的参数
]]