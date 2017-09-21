require("common/commonGameLayer")
local invitational_invite_qr = require(ViewPath .. "hall/invitational/invitational_invite_qr")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--邀请赛选择二维码分享页
local InvitationalSlideInviteQr = class(hallLayerBaseWithName, false)

InvitationalSlideInviteQr.s_controls = {
    content = 1,
    qrImage = 2,
    titleView = 3,
    contentView = 4,
}

InvitationalSlideInviteQr.ctor = function(self, qrFileName)
    super(self, invitational_invite_qr, nil, "InvitationalSlideInviteQr")
    self.m_operating_data = {}
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_qrImage = self:findViewById(self.s_controls.qrImage)
    self:setQrImage(qrFileName)
    self:setLevel(52);
    self:setListenBackEvent(true);
    self:initViewSize();

    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.content));
end

InvitationalSlideInviteQr.setQrImage = function(self, file)
    if file then
        self.m_qrImage:setFile(file)
    end
end

InvitationalSlideInviteQr.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

InvitationalSlideInviteQr.s_controlConfig = {
    [InvitationalSlideInviteQr.s_controls.content] = {"content"};
    [InvitationalSlideInviteQr.s_controls.qrImage] = {"content", "contentView", "qrView", "qrImage"};
    [InvitationalSlideInviteQr.s_controls.titleView] = {"content", "titleView"};
    [InvitationalSlideInviteQr.s_controls.contentView] = {"content", "contentView"};
}

return InvitationalSlideInviteQr