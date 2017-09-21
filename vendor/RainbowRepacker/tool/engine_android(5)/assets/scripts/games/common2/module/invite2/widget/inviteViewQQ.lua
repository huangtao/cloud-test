local CommonSliderLayer = require("games/common2/module/invite2/widget/commonSliderLayer");
local inviteViewQQLayout = require(ViewPath .. "games/common2/inviteViewQQLayout");

-- QQ邀请弹框
local InviteViewQQ = class(CommonSliderLayer, false);

InviteViewQQ.Delegate = {

}

InviteViewQQ.s_controls = 
{
    content = ToolKit.getIndex(),
	shareQQInviteBtn = ToolKit.getIndex();
    titleView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
}

InviteViewQQ.ctor = function(self)
    super(self, inviteViewQQLayout);
    self:initView()
end

InviteViewQQ.dtor = function(self)
end

InviteViewQQ.show = function(self, data)
    CommonSliderLayer.show(self);
    self:initData(data);
    self:showData();
end

InviteViewQQ.hideEnd = function(self)
    CommonSliderLayer.hideEnd(self)
end

InviteViewQQ.updateData = function(self, data)
    self:initData(data);
    self:showData();
end

InviteViewQQ.initView = function(self)
    local content = self:findViewById(self.s_controls.content);
    content:setEventTouch(self, function() end);
    content:setEventDrag(self, function() end);
    self:setSlideContent(content);
    self:initViewSize();
end

InviteViewQQ.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

InviteViewQQ.initData = function(self, data)
    self.m_data = data;
end

InviteViewQQ.showData = function(self)
	if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end
    
    self:findViewById(self.s_controls.shareQQInviteBtn):setVisible(true);
end

InviteViewQQ.onShareQQInviteBtnClick = function(self)
    if table.isEmpty(self.m_data) or string.isEmpty(self.m_data.password) then
        return;
    end

    PasswordIsolater.getInstance():shareByQQ(self.m_data.type, self.m_data.password);
end

InviteViewQQ.s_controlConfig =
{ 
    [InviteViewQQ.s_controls.content] = {"content"};
	[InviteViewQQ.s_controls.shareQQInviteBtn] = {"content", "shareQQView", "contentView", "inviteBtn"};
    [InviteViewQQ.s_controls.titleView] = {"content", "shareQQView", "titleView"};
    [InviteViewQQ.s_controls.contentView] = {"content", "shareQQView", "contentView"};
}

InviteViewQQ.s_controlFuncMap =
{
	[InviteViewQQ.s_controls.shareQQInviteBtn] = InviteViewQQ.onShareQQInviteBtnClick;
}
return InviteViewQQ;