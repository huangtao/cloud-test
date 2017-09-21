local messageItem = require(ViewPath .. "hall/notice/messageItem");

local MessageItem = class(CommonGameLayer, false);

MessageItem.s_controls = 
{
    btnItem         = 1,
    txtTitle        = 2,
    txtTime         = 3,
    txtContent      = 4,
    imgEnvelope     = 5,
    imgAttachment   = 6,
};

MessageItem.s_cmds = 
{

};

MessageItem.ctor = function(self, data)
    super(self, messageItem);
    self.m_data = data;
   
    local w, h = self.m_root:getSize();
    self:setSize(w, h);
    self:setFillParent(true, false);

    if self.m_data then
        self:_initUI();
    end
end

MessageItem.dtor = function(self)
end

MessageItem.onItemClick = function(self)
    if MessageItem.s_callbackObj and MessageItem.s_callbackFun and self.m_data then
        MessageItem.s_callbackFun(MessageItem.s_callbackObj, self.m_data);
    end
    
    if self.m_data.msgType == MessageConstants.eMsgType.TEXT or self.m_data.msgType == MessageConstants.eMsgType.QRCODE and 
        self.m_data.opened < MessageConstants.eMsgStatus.OPENED then
        self.m_envelope:setVisible(true);
    end
end

MessageItem.setItemClickCallback = function(obj, fun)
    MessageItem.s_callbackObj = obj;
    MessageItem.s_callbackFun = fun;
end

MessageItem._initUI = function(self)
    self.m_title        = self:findViewById(MessageItem.s_controls.txtTitle);
    self.m_time         = self:findViewById(MessageItem.s_controls.txtTime);
    self.m_content      = self:findViewById(MessageItem.s_controls.txtContent);
    self.m_envelope     = self:findViewById(MessageItem.s_controls.imgEnvelope);
    self.m_attachment   = self:findViewById(MessageItem.s_controls.imgAttachment);

    

    if self.m_data.msgType == MessageConstants.eMsgType.ANNOUNCE then
        self.m_time:setText(os.date("%Y/%m/%d", number.valueOf(self.m_data.start_time)));
        self.m_title:setText(string.subUtfStrByCn(self.m_data.title, 1, 20, ""));
        -- 富文本公告不显示内容
        local is_html = number.valueOf(self.m_data.is_html)
        if is_html ~= 0 then
            self.m_content:setText("");
        else
            self.m_content:setText(string.subUtfStrByCn(self.m_data.content, 1, 25, "..."));
        end
    else
        self.m_time:setText(os.date("%Y/%m/%d", self.m_data.time));
        self.m_content:setText(string.subUtfStrByCn(self.m_data.body, 1, 25, "..."));
        self.m_title:setText(string.subUtfStrByCn(self.m_data.title, 1, 20, ""));
    end

    self:_checkShowIcon();
end

MessageItem._checkShowIcon = function(self)
    if self.m_data.msgType == MessageConstants.eMsgType.AWARD then
        self.m_attachment:setVisible(true);
        self.m_envelope:setVisible(false);
    else
        self.m_attachment:setVisible(false);
    
        if self.m_data.opened >= MessageConstants.eMsgStatus.OPENED then
            self.m_envelope:setVisible(true);
        else
            self.m_envelope:setVisible(false);
        end
    end
end


MessageItem.s_controlConfig =
{   
    [MessageItem.s_controls.btnItem] = {"itemBtn"};
    [MessageItem.s_controls.txtTitle] = {"itemBtn", "itemView", "title_label"};
    [MessageItem.s_controls.txtTime] = {"itemBtn", "itemView", "date_label"};
    [MessageItem.s_controls.txtContent] = {"itemBtn", "itemView", "content"};
    [MessageItem.s_controls.imgAttachment] = {"itemBtn", "itemView", "attachment"};
    [MessageItem.s_controls.imgEnvelope] = {"itemBtn", "itemView", "envelope"};
};

MessageItem.s_controlFuncMap =
{
    [MessageItem.s_controls.btnItem] = MessageItem.onItemClick;
};

MessageItem.s_cmdConfig =
{
};

return MessageItem;