
local layerBase = require("games/common2/module/layerBase");

local JiFenChangeTipsLayer = class(layerBase);

JiFenChangeTipsLayer.ctor = function(self)

end

JiFenChangeTipsLayer.dtor = function(self)

end

JiFenChangeTipsLayer.parseViewConfig = function(self)
	local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
JiFenChangeTipsLayer.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/jifen/jifenChangeTips/jifenChangeTipsView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/jifen/jifenChangeTips_layout";
		};
		[2] = {};
		[3] = {};
	};
end

return JiFenChangeTipsLayer;