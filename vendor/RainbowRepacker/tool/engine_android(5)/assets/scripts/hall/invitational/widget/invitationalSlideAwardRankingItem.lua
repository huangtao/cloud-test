--邀请赛选择获奖名次item
local InvitationalSlideCommonItem = require("hall/invitational/widget/invitationalSlideCommonItem")

local InvitationalSlideAwardRankingItem = class(InvitationalSlideCommonItem)

InvitationalSlideAwardRankingItem.ctor = function (self, data)
    local typ = data.type
    local value = tonumber(data.value)
    local name = data.name
    local min_players = InvitationalDataInterface.getInstance():getInvitationalCreateData():getMinPlayers()
    if typ and value and name and min_players then
    	if typ == "num" then
    		self:createText(name)
    	elseif typ == "percent" then
    		local count = InvitationalDataInterface.getInstance():getAwardCount(typ, value, min_players)
    		self:createText(string.format("%s(前%s名)", name, count))
    	end
    end
end

return InvitationalSlideAwardRankingItem