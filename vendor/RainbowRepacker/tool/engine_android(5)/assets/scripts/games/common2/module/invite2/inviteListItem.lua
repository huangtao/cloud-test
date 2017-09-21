local inviteListItem2 = require(ViewPath .. "games/common2/inviteListItem2");

-- 好友列表项
local InviteListItem = class(Node);

InviteListItem.s_callback = {};

InviteListItem.ctor = function(self, data)
    CheckBox.setDefaultImages({"isolater/check_un2.png","isolater/check_sel2.png"});
    local view = SceneLoader.load(inviteListItem2);
    local w, h = view:getSize();
    self:addChild(view);
    view:setFillParent(true, true);
    self:setFillParent(true,false);
    self:setSize(w, h);

    self.m_view = view;
    self.m_data = data;

    self:initView();
end

InviteListItem.dtor = function(self)
    self.m_view = nil;
    self.m_data = nil;
end
---------------------------------------------------------------------------------------

InviteListItem.initView = function(self)
    local nameText = self.m_view:getChildByName("name");
    local numberText = self.m_view:getChildByName("number");
    local invited = self.m_view:getChildByName("invited");

    local number = tostring(self.m_data.number or "") or "";
    local name = tostring(self.m_data.name or "") or "";
    local isInvited = self.m_data.isInvited;
    
    local subName = string.subUtfStrByCn(name, 1, 5, "");
    if string.len(subName) < string.len(name) then
        subName = string.subUtfStrByCn(name, 1, 5, "...")
    end
    nameText:setText(subName);
    numberText:setText(number(1, 11));

    -- checkBox
    self.m_checkBox = self.m_view:getChildByName("checkBox");
    self.m_checkBox:setEnable(false);
    self.m_checkBox:setChecked(isInvited);
    invited:setVisible(isInvited);
    self.m_checkBox:setVisible(not isInvited);
end

InviteListItem.setChecked = function(self, checked)
    if not self.m_data.isInvited then
        self.m_checkBox:setChecked(checked);
    end
end

InviteListItem.getChecked = function(self)
    return self.m_checkBox:isChecked();
end

return InviteListItem;