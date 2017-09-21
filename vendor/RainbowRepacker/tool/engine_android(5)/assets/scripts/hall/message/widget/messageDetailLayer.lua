local messageDetailLayout = require("view/kScreen_1280_800/hall/notice/messageDetailLayout");

local MessageDetailLayer = class(CommonGameLayer, false);

MessageDetailLayer.Delegate = 
{
    onRequestCloseMsg = "onRequestCloseMsg";
    onRequestReadMsg = "onRequestReadMsg";
};

MessageDetailLayer.s_controls = 
{
    btnClose            = 1,
    viewTextMessage     = 2,
    viewAwardMessage    = 3,
    txtMessageText      = 4,
    txtAwardTextTop     = 5,
    txtAwardTextBottom  = 6,
    listViewAward       = 7,
    btnConfirm          = 8,
    btnGet              = 9,
    txtTitle            = 10,
    qrCodeMsgView = 11,
    qrCodeText = 12,
    qrCodeImage = 13,
};

MessageDetailLayer.s_cmds = 
{
};

MessageDetailLayer.ctor = function(self, data)
    super(self, messageDetailLayout);

    self.m_viewTextMessage      = self:findViewById(MessageDetailLayer.s_controls.viewTextMessage);
    self.m_viewAwardMessage     = self:findViewById(MessageDetailLayer.s_controls.viewAwardMessage);
    self.m_txtTitle             = self:findViewById(MessageDetailLayer.s_controls.txtTitle);
    self.m_txtMessageText       = self:findViewById(MessageDetailLayer.s_controls.txtMessageText);
    self.m_btnConfirm           = self:findViewById(MessageDetailLayer.s_controls.btnConfirm);
    self.m_txtAwardTextTop      = self:findViewById(MessageDetailLayer.s_controls.txtAwardTextTop);
    self.m_txtAwardTextBottom   = self:findViewById(MessageDetailLayer.s_controls.txtAwardTextBottom);
    self.m_listViewAward        = self:findViewById(MessageDetailLayer.s_controls.listViewAward);
    self.m_btnGet               = self:findViewById(MessageDetailLayer.s_controls.btnGet);
    self.m_qrCodeMsgView        = self:findViewById(MessageDetailLayer.s_controls.qrCodeMsgView);
    self.m_qrCodeText           = self:findViewById(MessageDetailLayer.s_controls.qrCodeText);
    self.m_qrCodeImage          = self:findViewById(MessageDetailLayer.s_controls.qrCodeImage);


    self.m_listViewAwardOriginalWidth,_ = self.m_listViewAward:getSize();
    self:setFillParent(true, true);
    self:setEventDrag(self, self.onEmptyFunc);
    self:setEventTouch(self, self.onEmptyFunc);
    self:hide();
    
    self:show(data);
end

MessageDetailLayer.dtor = function(self)
    ImageCache.getInstance():cleanRef(self);
end

MessageDetailLayer.show = function(self, data)
    self.m_data = data;

    if self.m_data then
        self:_initUI();
    end

    self:setVisible(true);
end

MessageDetailLayer.hide = function(self)
    self:setVisible(false);
end

MessageDetailLayer.onCloseBtnClick = function(self)
    self:execDelegate(MessageDetailLayer.Delegate.onRequestCloseMsg, self.m_data);
end

MessageDetailLayer.onConfirmBtnClick = function(self)
    self:execDelegate(MessageDetailLayer.Delegate.onRequestReadMsg, self.m_data);
end

MessageDetailLayer.onGetBtnClick = function(self)
    self:execDelegate(MessageDetailLayer.Delegate.onRequestReadMsg, self.m_data);
end

MessageDetailLayer.onEmptyFunc = function(self)
end

MessageDetailLayer.s_controlConfig =
{   
    [MessageDetailLayer.s_controls.btnClose]            = {"contentView", "closeBtn"};
    [MessageDetailLayer.s_controls.viewTextMessage]     = {"contentView", "centerView", "textMsgView"};
    [MessageDetailLayer.s_controls.viewAwardMessage]    = {"contentView", "centerView", "awardMsgView"};
    [MessageDetailLayer.s_controls.txtMessageText]      = {"contentView", "centerView", "textMsgView","contentText"};
    [MessageDetailLayer.s_controls.txtAwardTextTop]     = {"contentView", "centerView", "awardMsgView","awardTextTop"};
    [MessageDetailLayer.s_controls.txtAwardTextBottom]  = {"contentView", "centerView", "awardMsgView","awardTextBottom"};
    [MessageDetailLayer.s_controls.listViewAward]       = {"contentView", "centerView", "awardMsgView","awardListView"};
    [MessageDetailLayer.s_controls.btnConfirm]          = {"contentView", "bottomView", "confirmBtn"};
    [MessageDetailLayer.s_controls.btnGet]              = {"contentView", "bottomView", "getBtn"};
    [MessageDetailLayer.s_controls.txtTitle]            = {"contentView", "titleBg", "title"};
    [MessageDetailLayer.s_controls.qrCodeMsgView]       = {"contentView", "centerView", "qrCodeMsgView"};
    [MessageDetailLayer.s_controls.qrCodeText]          = {"contentView", "centerView", "qrCodeMsgView","qrCodeTextTop"};
    [MessageDetailLayer.s_controls.qrCodeImage]         = {"contentView", "centerView", "qrCodeMsgView","qrCodeImage"};
};

MessageDetailLayer.s_controlFuncMap =
{
    [MessageDetailLayer.s_controls.btnClose]    = MessageDetailLayer.onCloseBtnClick;
    [MessageDetailLayer.s_controls.btnConfirm]  = MessageDetailLayer.onConfirmBtnClick;
    [MessageDetailLayer.s_controls.btnGet]      = MessageDetailLayer.onGetBtnClick;

};

MessageDetailLayer.s_cmdConfig =
{

};

---------------------------------private functions-----------------------------------------
MessageDetailLayer._initUI = function(self)
    local title = self.m_data.title or "";
    self.m_txtTitle:setText(string.subUtfStrByCn(title, 1, 10, ""));

    if self.m_data.msgType == MessageConstants.eMsgType.TEXT then
        self:_initUITextMsg();
    elseif self.m_data.msgType == MessageConstants.eMsgType.AWARD then
        self:_initUIAwardMsg();
    elseif self.m_data.msgType ==  MessageConstants.eMsgType.QRCODE then
        self:_initQrCodeMsg();
    end
end

MessageDetailLayer._initUITextMsg = function(self)
    local content = self.m_data.body or "";
    
    self.m_txtMessageText:gotoTop();
    local str = tostring(MessageConstants.text.TEXT_DOUBLE_SPACE)..tostring(content)

    --全角符号会导致iOS内容显示不全
    str = string.gsub(str, "（", "(")
    str = string.gsub(str, "）", ")")
    str = string.gsub(str, "：", ":")
    self.m_txtMessageText:setText(str);
    
    self.m_viewAwardMessage:setVisible(false);
    self.m_viewTextMessage:setVisible(true);
    self.m_qrCodeMsgView:setVisible(false);
    self.m_btnConfirm:setVisible(true);
    self.m_btnGet:setVisible(false);
end

MessageDetailLayer._initUIAwardMsg = function(self)
    local content = self.m_data.body or "";
    self.m_txtAwardTextTop:setText(content);
    self.m_txtAwardTextBottom:setText(MessageConstants.text.AWARD_TIPS);
    
    self.m_listViewAward:setDirection(kHorizontal) 
    if not self.m_awardAdapter then
        local messageItemInfo = require("hall/message/widget/messageItemInfo");
        self.m_awardAdapter = new(CacheAdapter, messageItemInfo, self.m_data.awards);
        self.m_listViewAward:setAdapter(self.m_awardAdapter); 
    else
        self.m_awardAdapter:changeData(self.m_data.awards);
    end
    local width = self.m_awardAdapter:getView(1):getSize();
    if #self.m_data.awards < 4 then
        self.m_listViewAward:setSize(width*(#self.m_data.awards), nil);
    else
        self.m_listViewAward:setSize(self.m_listViewAwardOriginalWidth, nil);
    end

    self.m_viewAwardMessage:setVisible(true);
    self.m_viewTextMessage:setVisible(false);
    self.m_qrCodeMsgView:setVisible(false);
    self.m_btnConfirm:setVisible(false);
    self.m_btnGet:setVisible(true);
end

MessageDetailLayer._onImageDownload = function (self,url,imagePath) 
    if not string.isEmpty(imagePath) then
        self.m_qrCodeImage:setFile(imagePath);
    end
end


MessageDetailLayer._initQrCodeMsg = function(self)
    local content = self.m_data.body or "";
    
    self.m_qrCodeText:gotoTop();
    self.m_qrCodeText:setText(content);
    local url ;
    url = string.trim(self.m_data.extend.qrcode or "");
    if url and url~="" then
		ImageCache.getInstance():request(url,self,self._onImageDownload);
	end
   
    self.m_viewAwardMessage:setVisible(false);
    self.m_viewTextMessage:setVisible(false);
    self.m_qrCodeMsgView:setVisible(true);
    self.m_btnConfirm:setVisible(true);
    self.m_btnGet:setVisible(false);
end

return MessageDetailLayer;