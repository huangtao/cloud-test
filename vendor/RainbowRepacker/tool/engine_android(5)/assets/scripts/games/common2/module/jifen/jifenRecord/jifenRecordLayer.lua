
local layerBase = require("games/common2/module/layerBase");

local JiFenRecordLayer = class(layerBase);

JiFenRecordLayer.ctor = function(self)

end

JiFenRecordLayer.dtor = function(self)

end

-- 初始化layer的配置
JiFenRecordLayer.initViewConfig = function(self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local jifenViewConfig = table.verify(config.jifenViewConfig);
	local jifenShowRecordView = jifenViewConfig.jifenShowRecordView == nil and true or jifenViewConfig.jifenShowRecordView;
	local jifenShowOverView = jifenViewConfig.jifenShowOverView == nil and true or jifenViewConfig.jifenShowOverView;

	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/jifen/jifenRecord/jifenRecordView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/jifen/jifenRecordView_layout";
			config = {
				showRecordView = jifenShowRecordView,
				showOverView = jifenShowOverView,
			}
		};
		[2] = {};
		[3] = {};
	};
end

return JiFenRecordLayer;