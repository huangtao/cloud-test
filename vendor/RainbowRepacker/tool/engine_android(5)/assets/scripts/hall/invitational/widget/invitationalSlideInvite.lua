require("common/commonGameLayer")
local invitational_invite_view = require(ViewPath .. "hall/invitational/invitational_invite_view")
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName");

--邀请赛选择分享页
local InvitationalSlideInvite = class(hallLayerBaseWithName, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

InvitationalSlideInvite.s_controls = {
    content = getIndex(),
    contentView = getIndex(),
    inviteView = getIndex(),
    shareWechatBtn = getIndex(),
    shareQQBtn = getIndex(),
    qrBtn = getIndex(),
    tips = getIndex();
    title = getIndex();
    titleView = getIndex(),
}

InvitationalSlideInvite.eTabType = {
    TAB_QR = 1,
    TAB_SHARE_WECHAT = 2,    
    TAB_SHARE_QQ = 3,
}

InvitationalSlideInvite.ctor = function(self, passwordType, qrType, password, qrName)
    super(self, invitational_invite_view, nil, "InvitationalSlideInvite");
    self.m_operating_data = {}
    self.m_passwordType = passwordType
    self.m_qrType = qrType
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self.m_ctrls = InvitationalSlideInvite.s_controls
    PasswordDataInterface.getInstance():setObserver(self)
    QRUtil.getInstance():setObserver(self)
    self:initView()
    self:addToRoot();
    self:setListenBackEvent(true);

    self:initPasswordAndQrName(password, qrName)

    self:runUiAction(UiAnimConfig.ACTION.BEGIN, self:findViewById(self.s_controls.content));
end

InvitationalSlideInvite.dtor = function(self)
    PasswordDataInterface.getInstance():clearObserver(self)
    QRUtil.getInstance():clearObserver(self)
end

InvitationalSlideInvite.initPasswordAndQrName = function(self, password, qrName)
    local isShow = password and qrName
    self:setTipsState(not isShow)
    self.m_shareWechatBtn:setVisible(isShow)
    self.m_shareQQBtn:setVisible(isShow)
    self.m_qrBtn:setVisible(isShow)
    if isShow then
        self:setPassword(password)
        self:setQrFileName(qrName)
    else
        InvitationalDataInterface.getInstance():clearPasswordAndQrName()
        self:getPasswordByInfo()
    end
end

InvitationalSlideInvite.initViewSize = function(self)
    local titleView = self:findViewById(self.s_controls.titleView);
    local contentView = self:findViewById(self.s_controls.contentView);
    local _, heightTitle = titleView:getSize();
    local _, heightContent = contentView:getSize();
    local height = heightTitle + heightContent;
    local heightScreen = System.getScreenScaleHeight();
    titleView:setSize(nil, heightScreen * heightTitle / height);
    contentView:setSize(nil, heightScreen * heightContent / height);
end

--@override 
InvitationalSlideInvite.onUiBeginActionFinish = function(self)
    --self:getPasswordByInfo()
end

InvitationalSlideInvite.initView = function(self)
    self.m_inviteView = self:findViewById(self.s_controls.inviteView);
    self.m_tips = self:findViewById(self.s_controls.tips);
    self.m_content = self:findViewById(self.s_controls.contentView);
    self.m_title = self:findViewById(self.s_controls.title);
    self.m_shareWechatBtn = self:findViewById(self.s_controls.shareWechatBtn);
    self.m_shareQQBtn = self:findViewById(self.s_controls.shareQQBtn);
    self.m_qrBtn = self:findViewById(self.s_controls.qrBtn);

    self:initViewSize();
end

InvitationalSlideInvite.setTipsState = function(self, state)
    self.m_tips:setVisible(state)
    --self.m_content:setVisible(not state)
end

InvitationalSlideInvite.setTitle = function(self, title)
    self.m_title:setText(title)
end

--请求生成口令
InvitationalSlideInvite.getPasswordByInfo = function(self)
    local data = PasswordDataInterface.getInstance():generateData(self.m_passwordType)
    Log.v("InvitationalSlideInvite.getPasswordByInfo", data)
    PasswordDataInterface.getInstance():getPasswordByInfo(data)
end

--生成口令回调
InvitationalSlideInvite.onGetPasswordByInfoCallback = function(self, isSuccess, password)
    Log.v("InvitationalSlideInvite.onGetPasswordByInfoCallback", isSuccess, password)
    if isSuccess and password then
        self:setTipsState(false)
        self.m_shareQQBtn:setVisible(true)
        self:setPassword(password)
        self:createQR()
    else
        self:onCloseClick()
    end
end

--设置密码
InvitationalSlideInvite.setPassword = function(self, password)
    self.m_password = password
end

--获取密码
InvitationalSlideInvite.getPassword = function(self)
    return self.m_password
end

--设置二维码文件名字
InvitationalSlideInvite.setQrFileName = function(self, qrFileName)
    self.m_qrFileName = qrFileName
end

--获取二维码文件名字
InvitationalSlideInvite.getQrFileName = function(self)
    return self.m_qrFileName
end

--创建二维码
InvitationalSlideInvite.createQR = function(self, url)
    Log.v("InvitationalSlideInvite.createQR", url)
    if self.m_isCreatingQR then
        return
    end
    self.m_isCreatingQR = true

    local _, params = PasswordDataInterface.getInstance():shareByQr(self.m_passwordType, self:getPassword());
    if params then
        QRUtil.getInstance():createQR(self.m_qrType, 267, params);
    end
end

--创建二维码回调
InvitationalSlideInvite.onCreateQRCallBack = function(self, isSuccess, qrType, fileName)
    self.m_isCreatingQR = false
    LoadingView.getInstance():hidden()
    Log.v("InvitationalSlideInvite.onCreateQRCallBack@@@@@@@@@@", isSuccess, qrType, fileName)
    if isSuccess and qrType == QRUtil.eQRType.INVITATIONAL_SHARE and fileName then
        Log.v("InvitationalSlideInvite.onCreateQRCallBack!!!!!!!！！", isSuccess, qrType, fileName)
        self:setQrFileName(fileName)
        if self:getPassword() and self:getQrFileName() then
            InvitationalDataInterface.getInstance():setPasswordAndQrName(self:getPassword(), self:getQrFileName())
        end
        self.m_shareWechatBtn:setVisible(true)
        self.m_qrBtn:setVisible(true)
    else
        self:onCloseClick()
    end
end

InvitationalSlideInvite.getOperatingData = function(self)
    return self.m_operating_data
end

InvitationalSlideInvite.onCloseClick = function(self)
    self:close();
end

InvitationalSlideInvite.setTitleView = function(self, id)
    self:setTitle(string.format("邀请【比赛编号：%.4d】", id or 0));
end

--微信分享
InvitationalSlideInvite.onShareWechatInviteBtnClick = function(self)
    Log.v("InvitationalSlideInvite.onShareWechatInviteBtnClick")
    UBReport.getInstance():report(UBConfig.kInvitationalAction17, "Wechat")
    if not self:getQrFileName() then
        Toast.getInstance():showText("正初始化，请稍候重试",50,30,kAlignLeft,"",30,200,175,115)
        return
    end
    PasswordDataInterface.getInstance():shareByWechat(self.m_passwordType, self:getPassword(), self:getQrFileName())
end

--面对面扫码按钮点击
InvitationalSlideInvite.onQrBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kInvitationalAction17, "Qr")
    if not self:getQrFileName() then
        Toast.getInstance():showText("正初始化，请稍候重试",50,30,kAlignLeft,"",30,200,175,115)
        return
    end
    LayerManagerIsolater.getInstance():show("InvitationalSlideInviteQr", self:getQrFileName())
end

--QQ分享按钮点击
InvitationalSlideInvite.onShareQQBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kInvitationalAction17, "QQ")
    if not self:getPassword() then
        Toast.getInstance():showText("正初始化，请稍候重试",50,30,kAlignLeft,"",30,200,175,115)
        return
    end

    LayerManagerIsolater.getInstance():show("InvitationalSlideInviteQQ", self.m_passwordType, self:getPassword())
end

InvitationalSlideInvite.s_controlConfig = {
    [InvitationalSlideInvite.s_controls.content] = {"content"};
    [InvitationalSlideInvite.s_controls.tips] = {"content", "contentView", "inviteView", "tips"};
    [InvitationalSlideInvite.s_controls.title] = {"content", "titleView", "title"};
    [InvitationalSlideInvite.s_controls.contentView] = {"content", "contentView"};
    [InvitationalSlideInvite.s_controls.inviteView] = {"content", "contentView", "inviteView"};
    [InvitationalSlideInvite.s_controls.shareWechatBtn] = {"content", "contentView", "inviteView", "shareWechatBtn"};
    [InvitationalSlideInvite.s_controls.shareQQBtn] = {"content", "contentView", "inviteView", "shareQQBtn"};
    [InvitationalSlideInvite.s_controls.qrBtn] = {"content", "contentView", "inviteView", "qrBtn"};
    [InvitationalSlideInvite.s_controls.titleView] = {"content", "titleView"};
}

InvitationalSlideInvite.s_controlFuncMap = {
    [InvitationalSlideInvite.s_controls.shareWechatBtn] = InvitationalSlideInvite.onShareWechatInviteBtnClick;
    [InvitationalSlideInvite.s_controls.shareQQBtn] = InvitationalSlideInvite.onShareQQBtnClick;
    [InvitationalSlideInvite.s_controls.qrBtn] = InvitationalSlideInvite.onQrBtnClick;
}

return InvitationalSlideInvite