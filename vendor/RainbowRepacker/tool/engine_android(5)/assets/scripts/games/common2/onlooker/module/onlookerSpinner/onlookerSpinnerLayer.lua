local layerBase = require("games/common2/module/layerBase");

--[[
	弹幕
]]
local OnlookerSpinnerLayer = class(layerBase);

OnlookerSpinnerLayer.ctor = function(self)
end

OnlookerSpinnerLayer.dtor = function(self)
end

OnlookerSpinnerLayer.parseViewConfig = function(self)
	local gameConfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local config = table.verify(gameConfig.onlooerSpinner);
    local viewConfig = {
        ["normal"] = {
            [1] = {
                path = "games/common2/onlooker/module/onlookerSpinner/onlookerSpinnerView";
				viewLayer = "view/kScreen_1280_800/games/common2/onlooker/onlooker_spinner_layout";
				config = {
					align = config.align or kAlignTopLeft;
					x = config.x or 0;
					y = config.y or 0;
				};
            };
        };
        ["onlooker"] = {};
    };

    return viewConfig;
end

return OnlookerSpinnerLayer;

--配置说明：
	-- xxxConfig中添加 onlooerSpinner，配置格式如下：
	-- xxxConfig.onlooerSpinner = {
	-- 	align = kAlignTopLeft;	--显示的对齐方式
	-- 	x = 130;	--位置
	-- 	y = 0;		-- 位置
	-- };
	-- 可不配，不配默认显示在左上角(0,0)的位置