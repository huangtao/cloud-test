--邀请赛选择最低开赛人数item
local InvitationalSlideCommonItem = require("hall/invitational/widget/invitationalSlideCommonItem")

local InvitationalSlideMinPlayersItem = class(InvitationalSlideCommonItem)

InvitationalSlideMinPlayersItem.ctor = function (self, data)
    if type(data) == "string" or type(data) == "number" then
        self:createText(data)
    end
end

return InvitationalSlideMinPlayersItem