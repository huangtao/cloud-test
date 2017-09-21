require("common/commonScene");
require("hall/message/data/messageDataInterface");

local MessageListItem = require("hall/message/widget/messageItem");

local MessageScene = class(CommonScene);

-- 一些界面控件的index
MessageScene.s_controls = 
{
    backBtn     = 1;
    text        = 2;
    listArea    = 3;
    listView    = 4;   
};

-- 指令
MessageScene.s_cmds = 
{
    updateGetMsgInfo  = 1,
    updateReadMsg     = 2,
    updateAwardMsg    = 3,
    updateDeleteMsg   = 4,
};

-- 构造器
MessageScene.ctor = function(self, viewConfig, controller)
    self.m_controller = controller;
end

MessageScene.resume = function(self)
    CommonScene.resume(self);
    self:_init();
end

MessageScene.pause = function(self)
    CommonScene.pause(self);
end

MessageScene.dtor = function(self)
    delete(self.m_detailMsg);
    self.m_detailMsg = nil;
    IBaseDialog.hide();
end
-----------------------------------------------------------------------------------------------
MessageScene.updateGetMsgInfoCallback = function(self, data)
    self:_showMsgData(data);
end

MessageScene.updateReadMsgCallback = function(self)
    self:onDetailLayerClose(true);
end

MessageScene.updateAwardMsgCallback = function(self, isSuccess, newData, oldData)
    if not isSuccess then
        Toast.getInstance():showText(newData.errorTips, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
        return;
    end

    self:_getAward(newData, oldData);
end

MessageScene.updateDeleteMsgCallback = function(self, data)
    self:_showMsgData(data);
end

MessageScene.showAnnouncementView = function(self, data)
    if table.isEmpty(data) then
        return;
    end

    local is_html = number.valueOf(data.is_html)

    if is_html == 0 then
        local dialog = new(require("hall/announcement/widget/annoucementPop"));
        IBaseDialog.pushDialog(dialog);
        dialog:setOnCloseCallBack(self,self.annoucementPopCloseCallback);
        local t = {};
        t.firstWord = data.title;
        t.content = data.content;
        dialog:show(t);
    elseif is_html == 1 then

        local dialog = new(require("hall/announcement/widget/annoucementHtmlPop"), data,false);
        IBaseDialog.pushDialog(dialog);
        dialog:setOnCloseCallBack(self, self.annoucementPopCloseCallback)
        dialog:setOnExecuteJsCallBack(self, self.onCloseBtnClick);

    elseif is_html == 2 then
        local dialog = new(require("hall/announcement/widget/annoucementImagePop"), data)
        IBaseDialog.pushDialog(dialog)
        dialog:setOnCloseCallBack(self,self.annoucementPopCloseCallback)
        dialog:setOnExecuteJsCallBack(self, self.onCloseBtnClick);
    end
end

MessageScene.annoucementPopCloseCallback = function(self)
    IBaseDialog.hide();
end

---------------------------------------------------------------------------------------------
MessageScene.onCloseBtnClick = function(self)
    self:requestCtrlCmd(MessageController.s_cmds.requestGoBack);
end

MessageScene.itemClickCallback = function(self, data)
    if data.msgType == MessageConstants.eMsgType.ANNOUNCE then
        self:showAnnouncementView(data);
    else
        if data.is_html == 1 then
            local param = {content = data.html_url, title = data.title, is_html = data.is_html, msgType = data.msgType, id = data.id};
            self:showAnnouncementView(param);
        else
            self:onDetailLayerOpen(data);     
        end
    end
end

MessageScene.onDetailLayerOpen = function(self, data)
    self:pushStateStack(self, self.onDetailLayerClose);

    if not self.m_detailMsg then
        local messageDetailLayer = require("hall/message/widget/messageDetailLayer");
        self.m_detailMsg = new(messageDetailLayer, data);
        self.m_detailMsg:setDelegate(self);
        self:addChild(self.m_detailMsg);
    else
        self.m_detailMsg:show(data);
    end
end

MessageScene.onDetailLayerClose = function(self, popStack)
    if popStack then
        self:popStateStack();
    end

    if self.m_detailMsg then
        self.m_detailMsg:hide();
    end
end

MessageScene.onRequestCloseMsg = function(self, data)
    if table.isEmpty(data) then
        self:onDetailLayerClose(true);
    else
        self:requestCtrlCmd(MessageController.s_cmds.requestCloseMsg, data.id);
    end
end

MessageScene.onRequestReadMsg = function(self, data)
    if table.isEmpty(data) then
        self:onDetailLayerClose(true);
    else
        self:requestCtrlCmd(MessageController.s_cmds.requestReadMsg, data.id);
    end
end

----------------------------------------------------------------------------------------------
MessageScene._init = function(self)
    local sysMsg = MessageDataInterface.getInstance():getMsgData();
    self:_showMsgData(sysMsg);

    self:requestCtrlCmd(MessageController.s_cmds.requestGetMsgInfo);
end

MessageScene._showMsgData = function(self, data)
    local listArea = self:findViewById(MessageScene.s_controls.listArea);
    local text = self:findViewById(MessageScene.s_controls.text);
    local listView = self:findViewById(MessageScene.s_controls.listView);

    text:setVisible(false);
    listArea:setVisible(true);

    self.m_msgData = data;

    if table.isEmpty(self.m_msgData) then
        listView:setVisible(false);
        text:setVisible(true);
        text:setText(MessageConstants.text.NO_MESSAGE);
    else        
        listView:setVisible(true);
        text:setVisible(false);
        listView:setDirection(kVertical);

        if not self.m_messageAdapter then
            self.m_messageAdapter = new(CacheAdapter,MessageListItem,self.m_msgData);
            listView:setAdapter(self.m_messageAdapter); 
            MessageListItem.setItemClickCallback(self, self.itemClickCallback);
        else
            self.m_messageAdapter:changeData(self.m_msgData);
        end
    end
end

MessageScene._getAward = function(self, newData, oldData)
    if table.isEmpty(newData) or table.isEmpty(newData.awards) then
        return; 
    end

    if table.isEmpty(oldData) or table.isEmpty(oldData.awards) then
        return; 
    end
    local data = {};
    local length = #newData.awards;
    for i = 1, length do
        if newData.awards[i] and newData.awards[i].havegot == MessageConstants.eAwardStatus.GOT 
            and oldData.awards[i] and oldData.awards[i].havegot == MessageConstants.eAwardStatus.NOT_GOT then
            
            --领取成功，加银币加钱
            local goodType = tonumber(newData.awards[i].type);
            local goodNum = number.valueOf(newData.awards[i].num);

            if goodType == RechargeDataInterface.getInstance():getPropertySilverCoinID()
                or goodType == RechargeDataInterface.getInstance():getPropertyGoldBarID()
                or goodType == RechargeDataInterface.getInstance():getPropertyDiamondID()  then

                local money = kUserInfoData:getMoneyById(goodType) + goodNum;
                kUserInfoData:setMoneyById(goodType,money);
            end

            --道具会通过推送告诉前端
            local param = {};
            local goodsInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(goodType));
            param.icon = goodsInfo.item_icon;
            param.name = goodsInfo.item_name;
            param.sort = goodsInfo.sort;
            param.num = goodNum;
            table.insert(data,param);
        end
    end
    self:onDetailLayerClose(true);
    if newData.result then 
        if not table.isEmpty(data) then
            GetRewardAnimManager.getInstance():play(data);
        end
        self:requestCtrlCmd(MessageController.s_cmds.requestDeleteMsg, newData.id, true);
    else
        Toast.getInstance():showText(newData.errmsg, 50, 30, kAlignLeft, "", 24, 200, 175, 110);
        self:requestCtrlCmd(MessageController.s_cmds.requestUpdateAwards, newData.id, newData.awards);
    end

    
end


-- 控件的配置信息
MessageScene.s_controlConfig = 
{
    [MessageScene.s_controls.backBtn]   = {"bg","topView","returnBtn"},
    [MessageScene.s_controls.listView]  = {"bg","contentView","listArea","listView"},
    [MessageScene.s_controls.listArea]  = {"bg","contentView","listArea"},
    [MessageScene.s_controls.text]      = {"bg","contentView","text"},
};

MessageScene.s_controlFuncMap = 
{
    [MessageScene.s_controls.backBtn] = MessageScene.onCloseBtnClick,
};

-- 控件指令配置
MessageScene.s_cmdConfig = 
{
    [MessageScene.s_cmds.updateGetMsgInfo]    = MessageScene.updateGetMsgInfoCallback,
    [MessageScene.s_cmds.updateReadMsg]       = MessageScene.updateReadMsgCallback,
    [MessageScene.s_cmds.updateAwardMsg]      = MessageScene.updateAwardMsgCallback,
    [MessageScene.s_cmds.updateDeleteMsg]     = MessageScene.updateDeleteMsgCallback,
};

return MessageScene;