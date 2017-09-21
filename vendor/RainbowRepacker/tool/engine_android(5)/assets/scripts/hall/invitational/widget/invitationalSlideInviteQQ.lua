require("common/commonGameLayer")
local invitational_invite_qq = require(ViewPath .. "hall/invitational/invitational_invite_qq")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--邀请赛选择QQ分享页
local InvitationalSlideInviteQQ = class(hallLayerBaseWithName, false)

InvitationalSlideInviteQQ.ctor = function(self, passwordType, password)
    super(self, invitational_invite_qq, nil, "InvitationalSlideInviteQQ")
    self:declareLayoutVar(ViewPath.."hall/invitational/invitational_invite_qq".."_layout_var")
    self.m_operating_data = {}
    self.m_passwordType = passwordType
    self:setPassword(password)
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self:setLevel(52);
    self:setListenBackEvent(true);
    self:initViewSize();
    
    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.content));
end

InvitationalSlideInviteQQ.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

--设置密码
InvitationalSlideInviteQQ.setPassword = function(self, password)
    self.m_password = password
end

--获取密码
InvitationalSlideInviteQQ.getPassword = function(self)
    return self.m_password
end

--QQ分享
InvitationalSlideInviteQQ.onShareQQInviteBtnClick = function(self)
    if not self:getPassword() or not self.m_passwordType then
        return
    end
    PasswordDataInterface.getInstance():shareByQQ(self.m_passwordType, self:getPassword())
end

return InvitationalSlideInviteQQ