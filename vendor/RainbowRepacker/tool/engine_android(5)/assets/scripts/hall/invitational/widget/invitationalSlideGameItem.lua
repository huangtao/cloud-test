--邀请赛选择游戏item
local InvitationalSlideCommonItem = require("hall/invitational/widget/invitationalSlideCommonItem")

local InvitationalSlideGameItem = class(InvitationalSlideCommonItem)

InvitationalSlideGameItem.ctor = function (self, data)
    if type(data.name) == "string" or type(data.name) == "number" then
        self:createText(data.name)
    end
end

return InvitationalSlideGameItem