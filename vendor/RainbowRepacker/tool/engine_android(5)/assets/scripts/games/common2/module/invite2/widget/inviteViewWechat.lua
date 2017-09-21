local CommonSliderLayer = require("games/common2/module/invite2/widget/commonSliderLayer");
local inviteViewWechatLayout = require(ViewPath .. "games/common2/inviteViewWechatLayout");

-- 微信邀请弹框
local InviteViewWechat = class(CommonSliderLayer, false);

InviteViewWechat.Delegate = {

}

InviteViewWechat.s_controls = 
{
    content = ToolKit.getIndex(),
	shareWechatInviteBtn = ToolKit.getIndex(),
    titleView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
}

InviteViewWechat.ctor = function(self)
    super(self, inviteViewWechatLayout);
    self:initView()
end

InviteViewWechat.dtor = function(self)

end

InviteViewWechat.show = function(self, data)
    CommonSliderLayer.show(self);
    self:initData(data);
    self:showData();
end

InviteViewWechat.hideEnd = function(self)
    CommonSliderLayer.hideEnd(self)
end

InviteViewWechat.updateData = function(self, data)
    self:initData(data);
    local isShareWechatSwitchOpen = GameInfoIsolater.getInstance():isShareWechatSwitchOpen();
    if not isShareWechatSwitchOpen then
        self:_showViewWechat();
    end
end

InviteViewWechat.initView = function(self)
    local content = self:findViewById(self.s_controls.content);
    content:setEventTouch(self, function() end);
    content:setEventDrag(self, function() end);
    self:setSlideContent(content);
    self:initViewSize();
end

InviteViewWechat.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

InviteViewWechat.initData = function(self, data)
    self.m_data = data;
end

InviteViewWechat.showData = function(self)
    local isShareWechatSwitchOpen = GameInfoIsolater.getInstance():isShareWechatSwitchOpen();
    if isShareWechatSwitchOpen then
        self:setVisible(false);
        self:hide();
        self:_sendToWeChat();
    else
    	self:_showViewWechat();
    end
end

InviteViewWechat.onShareWechatInviteBtnClick = function(self)
    if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end

    PasswordIsolater.getInstance():shareByWechat(self.m_data.type, self.m_data.password, false);
end


InviteViewWechat._sendToWeChat = function(self)
    if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end
    PasswordIsolater.getInstance():shareByWechat(self.m_data.type, self.m_data.password, true);
end

InviteViewWechat._showViewWechat = function(self)
	if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end

    self:findViewById(self.s_controls.shareWechatInviteBtn):setVisible(true);
end

InviteViewWechat.s_controlConfig =
{   
    [InviteViewWechat.s_controls.content] = {"content"};
    [InviteViewWechat.s_controls.shareWechatInviteBtn] = {"content", "shareWechatView", "contentView", "inviteBtn"};
    [InviteViewWechat.s_controls.titleView] = {"content", "shareWechatView", "titleView"};
    [InviteViewWechat.s_controls.contentView] = {"content", "shareWechatView", "contentView"};
};


InviteViewWechat.s_controlFuncMap =
{
    [InviteViewWechat.s_controls.shareWechatInviteBtn] = InviteViewWechat.onShareWechatInviteBtnClick;
};

return InviteViewWechat;