
local layerBase = require("games/common2/module/layerBase");

local JiFenFinishLayer = class(layerBase);

JiFenFinishLayer.ctor = function(self)

end

JiFenFinishLayer.dtor = function(self)

end

-- 初始化layer的配置
JiFenFinishLayer.initViewConfig = function(self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local jifenViewConfig = table.verify(config.jifenViewConfig);
	local jifenShowFinishView = jifenViewConfig.jifenShowFinishView == nil and true or jifenViewConfig.jifenShowFinishView;
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/jifen/jifenFinish/jiFenFinishView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/jifen/jifenFinishView_layout";
			config = {
				showFinishView = jifenShowFinishView,
			}
		};
		[2] = {};
		[3] = {};
	};
end

return JiFenFinishLayer;