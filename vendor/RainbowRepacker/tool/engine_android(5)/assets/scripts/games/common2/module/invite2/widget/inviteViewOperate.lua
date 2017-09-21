local CommonSliderLayer = require("games/common2/module/invite2/widget/commonSliderLayer");
local inviteViewOperateLayout = require(ViewPath .. "games/common2/inviteViewOperateLayout");

-- 邀请弹框
local InviteViewOperate = class(CommonSliderLayer, false);

InviteViewOperate.eTabType = {
    TAB_SHARE_WECHAT = 1,    
    TAB_SHARE_QQ = 2,
    TAB_MESSAGE = 3,
    TAB_ONLINE = 4,
}

InviteViewOperate.Delegate = {
    onInviteViewOperateHideEnd = "onInviteViewOperateHideEnd";
}

InviteViewOperate.s_controls = 
{
    content = ToolKit.getIndex(),
    inviteView = ToolKit.getIndex(),
    shareWechatBtn = ToolKit.getIndex(),
    shareQQBtn = ToolKit.getIndex(),
    messageBtn = ToolKit.getIndex(),
    onlineBtn = ToolKit.getIndex(),
    friendInviteBtn = ToolKit.getIndex(),
    titleView = ToolKit.getIndex(),
    contentView = ToolKit.getIndex(),
    title = ToolKit.getIndex(),
}

InviteViewOperate.ctor = function(self)
    super(self, inviteViewOperateLayout);
    self:initView();
end

InviteViewOperate.dtor = function(self)
end

InviteViewOperate.show = function(self, data)
    CommonSliderLayer.show(self);
    self:initData(data);
    self:showData();
end

InviteViewOperate.hide = function(self)
    self:_hideView();
    CommonSliderLayer.hide(self);
end

InviteViewOperate.hideEnd = function(self)
    CommonSliderLayer.hideEnd(self)
    self:execDelegate(InviteViewOperate.Delegate.onInviteViewOperateHideEnd);
end

InviteViewOperate.updateData = function(self, data)
    self.m_data = data;
    self:updateDataTabView();
end

InviteViewOperate.updateDataTabView = function(self)
    local tabValue = self.m_tabMap[self.m_tabType];
    if tabValue then
        local view = tabValue.view;
        if view then
            view:updateData(self.m_data);
        end
    end
end

InviteViewOperate.initView = function(self)
    local content = self:findViewById(self.s_controls.content);
    content:setEventTouch(self, function() end);
    content:setEventDrag(self, function() end);
    self:setSlideContent(content);

    self.m_inviteView = self:findViewById(self.s_controls.inviteView);

    -- 按钮索引
    local shareWechatBtn = self:findViewById(self.s_controls.shareWechatBtn);
    local shareQQBtn = self:findViewById(self.s_controls.shareQQBtn);
    local messageBtn = self:findViewById(self.s_controls.messageBtn);
    local onlineBtn = self:findViewById(self.s_controls.onlineBtn);
    
    self:_setBtnEnableFunction(shareWechatBtn);
    self:_setBtnEnableFunction(shareQQBtn);
    self:_setBtnEnableFunction(messageBtn);
    self:_setBtnEnableFunction(onlineBtn);

    shareWechatBtn:setOnClick(self, self.onBtnClick, nil, InviteViewOperate.eTabType.TAB_SHARE_WECHAT);
    shareQQBtn:setOnClick(self, self.onBtnClick, nil, InviteViewOperate.eTabType.TAB_SHARE_QQ);
    messageBtn:setOnClick(self, self.onBtnClick, nil, InviteViewOperate.eTabType.TAB_MESSAGE);
    onlineBtn:setOnClick(self, self.onBtnClick, nil, InviteViewOperate.eTabType.TAB_ONLINE);

    local inviteViewWechat = new(require("games/common2/module/invite2/widget/inviteViewWechat"));
    local inviteViewMessage = new(require("games/common2/module/invite2/widget/inviteViewMessage"));
    local inviteViewQQ = new(require("games/common2/module/invite2/widget/inviteViewQQ"));
    local inviteViewOnline = new(require("games/common2/module/invite2/widget/inviteViewOnline"));
    self:addChild(inviteViewWechat);
    self:addChild(inviteViewMessage);
    self:addChild(inviteViewQQ);
    self:addChild(inviteViewOnline);

    self.m_tabMap = {
        [InviteViewOperate.eTabType.TAB_SHARE_WECHAT] = {view = inviteViewWechat, reportId = UBConfig.kRoomInviteFriendWechat}, 
        [InviteViewOperate.eTabType.TAB_SHARE_QQ] = {view = inviteViewQQ, reportId = UBConfig.kRoomInviteFriendQQ};      
        [InviteViewOperate.eTabType.TAB_MESSAGE] = {view = inviteViewMessage, reportId = UBConfig.kRoomInviteFriendMessage},
        [InviteViewOperate.eTabType.TAB_ONLINE] = {view = inviteViewOnline, reportId = UBConfig.kRoomInviteFriendOnline},
    };

    self:initViewSize();
end

InviteViewOperate.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

InviteViewOperate.initData = function(self, data)
    self.m_data = data;
    self.m_tabType = 0;
end

InviteViewOperate.showData = function(self)
	self:_showDataTableId();
end

InviteViewOperate.onBtnClick = function(self, finger_action, x, y, drawing_id_first, drawing_id_current, tab)
    if tab then
        self:_reportTabClick(tab);
        self:_changeTab(tab);
    end
end

InviteViewOperate._reportTabClick = function(self, tab)
    local config = self.m_tabMap[number.valueOf(tab)];
    if not table.isEmpty(config) and config.reportId then
        ReportIsolater.getInstance():report(config.reportId, true, true);
    end
end

InviteViewOperate._changeTab = function(self, tabType)
    if table.isEmpty(self.m_data) then
        return;
    end

    self.m_tabType = tabType;
    self:_showView();
end

InviteViewOperate._showDataTableId = function(self)
    local tableStr = string.format("邀请【房号：%.4d】", self.m_data.tableId);
    local title = self:findViewById(self.s_controls.title);
    title:setText(tableStr);
end

InviteViewOperate._setBtnEnableFunction = function(self, btn)
    if btn then
        btn.showEnableWithDisableImage = function(selfBtn, enable)
            local img = selfBtn:getChildByName("img");
            local text = selfBtn:getChildByName("text");

            if img then
                local file = enable and "games/common/friend/invite_item_unselected.png" or "games/common/friend/invite_item_selected.png"
                img:setFile(file);
            end
        end

        btn.m_showEnbaleFunc = btn.showEnableWithDisableImage;
    end
end

InviteViewOperate._showView = function(self)
    local tabValue = self.m_tabMap[self.m_tabType];
    if tabValue then
        local view = tabValue.view;
        if view then
            view:show(self.m_data);
        end
    end
end

InviteViewOperate._hideView = function(self)
    local tabValue = self.m_tabMap[self.m_tabType];
    if tabValue then
        local view = tabValue.view;
        if view and view:getVisible() then
            view:hide();
        end
    end
end

InviteViewOperate.s_controlConfig =
{ 
    [InviteViewOperate.s_controls.content] = {"content"};
    [InviteViewOperate.s_controls.inviteView] = {"content", "inviteView"};
    [InviteViewOperate.s_controls.shareWechatBtn] = {"content", "inviteView", "contentView", "view", "shareWechatBtn"};
    [InviteViewOperate.s_controls.shareQQBtn] = {"content", "inviteView", "contentView", "view", "shareQQBtn"};
    [InviteViewOperate.s_controls.messageBtn] = {"content", "inviteView", "contentView", "view", "messageBtn"};
    [InviteViewOperate.s_controls.onlineBtn] = {"content", "inviteView", "contentView", "view", "onlineBtn"};
    [InviteViewOperate.s_controls.titleView] = {"content", "inviteView", "titleView"};
    [InviteViewOperate.s_controls.contentView] = {"content", "inviteView", "contentView"};
    [InviteViewOperate.s_controls.title] = {"content", "inviteView", "titleView", "title"};
}

InviteViewOperate.s_controlFuncMap =
{
	
}
return InviteViewOperate;