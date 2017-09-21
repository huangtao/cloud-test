--邀请赛选择item
local InvitationalSlideCommonItem = class(Node)

InvitationalSlideCommonItem.ctor = function (self, data)
    self:setFillParent(true, false)
    self:setSize(410, 90)
end

InvitationalSlideCommonItem.createText = function(self, str, isSelect)
    local fontSize, r, g, b = 30, 139, 106, 64
    if isSelect then
        fontSize, r, g, b = 40, 226, 86, 0
    end
    if self.m_text then
        str = str or self.m_text:getText()
        self:removeChild(self.m_text, true)
    end
    self.m_text = new(Text, str, nil, nil, nil, nil, fontSize, r, g, b)
    self.m_text:setAlign(kAlignCenter)
    self:addChild(self.m_text)
end

InvitationalSlideCommonItem.dtor = function (self)
    delete(self.m_text)
    self.m_text = nil
end

return InvitationalSlideCommonItem