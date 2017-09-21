--邀请赛选择报名费用item
local InvitationalSlideCommonItem = require("hall/invitational/widget/invitationalSlideCommonItem")

local InvitationalSlideFeeItem = class(InvitationalSlideCommonItem)

InvitationalSlideFeeItem.ctor = function (self, data)
    if type(data) == "string" or type(data) == "number" then
        self:createText(data)
    end
end

return InvitationalSlideFeeItem