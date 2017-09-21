local invitational_create_option_item = require(ViewPath .. "/hall/invitational/invitational_create_option_item")

-- 创建邀请赛选项item
local InvitationalCreateOptionItem = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalCreateOptionItem.s_controls = 
{
    str = getIndex(),
    btn = getIndex(),
    val = getIndex(),   
}

InvitationalCreateOptionItem.Delegate = {
    onCreateOptionItemClick = "onCreateOptionItemClick",
}

InvitationalCreateOptionItem.ctor = function(self, data)
    super(self, invitational_create_option_item)
    self:setSize(self.m_root:getSize())
    self:_initView()
end

InvitationalCreateOptionItem._initView = function(self)
    self.m_str = self:findViewById(self.s_controls.str)
    self.m_btn = self:findViewById(self.s_controls.btn)
    self.m_val = self:findViewById(self.s_controls.val)
end

InvitationalCreateOptionItem.onBtnClick = function(self)
    self:execDelegate(InvitationalCreateOptionItem.Delegate.onCreateOptionItemClick)
end

InvitationalCreateOptionItem.s_controlConfig =
{   
    [InvitationalCreateOptionItem.s_controls.str] = {"str"},
    [InvitationalCreateOptionItem.s_controls.btn] = {"btn"},
    [InvitationalCreateOptionItem.s_controls.val] = {"btn", "val"},
}

InvitationalCreateOptionItem.s_controlFuncMap =
{
    [InvitationalCreateOptionItem.s_controls.btn] = InvitationalCreateOptionItem.onBtnClick,
}

return InvitationalCreateOptionItem