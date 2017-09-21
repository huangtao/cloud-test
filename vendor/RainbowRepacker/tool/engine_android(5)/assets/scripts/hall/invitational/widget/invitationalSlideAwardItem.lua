--邀请赛选择奖品item
local InvitationalSlideCommonItem = require("hall/invitational/widget/invitationalSlideCommonItem")

local InvitationalSlideAwardItem = class(InvitationalSlideCommonItem)

InvitationalSlideAwardItem.ctor = function (self, data)
    if type(data) == "string" or type(data) == "number" then
        self:createText(data)
    end
end

return InvitationalSlideAwardItem