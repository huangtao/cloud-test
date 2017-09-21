local layerBase = require("games/common2/module/layerBase");

--[[
	聊天和围观人列表
]]
local OnlookerChatAndUserLayer = class(layerBase);

OnlookerChatAndUserLayer.ctor = function(self)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	if self.m_viewConfig[seat] then
		self:addView(seat,self.m_viewConfig[seat]);
	end
end

OnlookerChatAndUserLayer.dtor = function(self)
end

OnlookerChatAndUserLayer.parseViewConfig = function(self)
	local seat = PlayerSeat.getInstance():getOnlookerSeat();
	local viewConfig = {
        ["onlooker"] = {
            [seat] = {
                path = "games/common2/onlooker/module/onlookerChatAndUser/onlookerChatAndUserView";
				viewLayer = "view/kScreen_1280_800/games/common2/onlooker/onlooker_chat_user_layout";
            };
        };
        ["normal"] = {};
    };

    return viewConfig;
end

return OnlookerChatAndUserLayer;