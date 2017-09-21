
local layerBase = require("games/common2/module/layerBase");

--[[
	顶部菜单栏
]]
local BankruptLayer = class(layerBase);

BankruptLayer.ctor = function(self)

end

BankruptLayer.dtor = function(self)

end

BankruptLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
BankruptLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/bankrupt/roomBankruptView";
			pos = {};
		};
		[2] = {};
		[3] = {};
	};
end

return BankruptLayer;

--[[
	破产逻辑：
	功能说明：
	房间内判断破产后，调用
	当破产时发送消息GameMechineConfig.ACTION_NS_CHECK_ROOM_BANKRUPT，如果配置开启了破产支付，就会调用支付。否则会退出房间
]]