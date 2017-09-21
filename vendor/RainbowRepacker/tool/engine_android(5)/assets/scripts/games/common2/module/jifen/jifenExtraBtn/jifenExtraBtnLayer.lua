
local layerBase = require("games/common2/module/layerBase");

local JiFenExtraBtnLayer = class(layerBase);

JiFenExtraBtnLayer.ctor = function(self)

end

JiFenExtraBtnLayer.dtor = function(self)

end

-- 初始化layer的配置
JiFenExtraBtnLayer.initViewConfig = function(self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local jifenExtraBtnConfig = table.verify(config.jifenExtraBtnConfig);

	local defaultCreateAgain = {
		align = kAlignBottom;
		x = 0;
		y = 190; 
		visible = true;
	};

	local defaultRecord = {
		align = kAlignBottomRight;
		x = 150;
		y = 5;
		visible = true;
	};

	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/jifen/jifenExtraBtn/jifenExtraBtnView";
			pos = {};
			viewLayer = "view/kScreen_1280_800/games/common2/jifen/jifenExtraBtn_layout";
			config = {
				createAgainConfig = jifenExtraBtnConfig.jifenCreateAgain or defaultCreateAgain;
				recordConfig = jifenExtraBtnConfig.jifenRecord or defaultRecord;
			};
		};
		[2] = {};
		[3] = {};
	};
end

return JiFenExtraBtnLayer;