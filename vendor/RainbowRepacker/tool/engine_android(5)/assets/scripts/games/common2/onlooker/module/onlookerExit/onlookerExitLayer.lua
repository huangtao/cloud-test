local layerBase = require("games/common2/module/layerBase");

local OnlookerExitLayer = class(layerBase);

OnlookerExitLayer.ctor = function(self)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	if self.m_viewConfig[seat] then
		self:addView(seat,self.m_viewConfig[seat]);
	end
end

OnlookerExitLayer.dtor = function(self)
end

OnlookerExitLayer.parseViewConfig = function(self)
	local config = {};
	if GameInfoIsolater.getInstance():isInMatchRoom() then
		config = table.verify(GameMatchConfig.onlookerExit);
	else 
		local gameConfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
		config = table.verify(gameConfig.onlookerExit);
	end 

	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	local viewConfig = {
        ["onlooker"] = {
            [seat] = {
                path = "games/common2/onlooker/module/onlookerExit/onlookerExitView";
				align = config.align or kAlignTopRight;
				pos = {
					["x"] = config.x or 20;
					["y"] = config.y or 0;
				};
            };
        };
        ["normal"] = {};
    };

    return viewConfig;
end

return OnlookerExitLayer;

--配置说明：
	-- 1) xxxConfig 中 添加配置 onlookerExit
	-- 2) xxxMatchConfig 中 添加配置 onlookerExit

	-- onlookerExit 配置格式如下：
	-- onlookerExit = {
	-- 	align = kAlignTopRight; --对齐方式
	-- 	x = 20; --位置
	-- 	y = 0; 	--位置
	-- 	file = "games/common/match/match_allover/btn_return.png";--退出按钮使用的图片，为string或table，可不配	
	-- };
	-- 可不配，不配默认显示在右上角(20,0)的位置