local layerBase = require("games/common2/module/layerBase");

--[[
	弹幕
]]
local OnlookerMyBarrageLayer = class(layerBase);

OnlookerMyBarrageLayer.ctor = function(self)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	if self.m_viewConfig[seat] then
		self:addView(seat,self.m_viewConfig[seat]);
	end
end

OnlookerMyBarrageLayer.dtor = function(self)
end

OnlookerMyBarrageLayer.parseViewConfig = function(self)
	local config = table.verify(GameProcessManager2.getInstance():getGameConfig());
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	local viewConfig = {
        ["onlooker"] = {
            [seat] = {
                path = "games/common2/onlooker/module/onlookerMyBarrage/onlookerMyBarrageView";
				viewLayer = "view/kScreen_1280_800/games/common2/onlooker/onlooker_my_barrage_layout";
            };
        };
        ["normal"] = {};
    };

    return viewConfig;
end

return OnlookerMyBarrageLayer;
