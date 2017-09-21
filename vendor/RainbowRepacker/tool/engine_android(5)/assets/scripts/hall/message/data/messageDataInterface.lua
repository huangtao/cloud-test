require("gameData/dataInterfaceBase");
require("hall/announcement/data/announceDataInterface");

MessageDataInterface = class(DataInterfaceBase);

MessageDataInterface.Delegate = {
    refreshMsg          = "delegateRefreshMsgCallback";
    readMsg             = "delegateReadMsgCallback"; 
    awardMsg            = "delegateAwardMsgCallback";
    deleteMsg           = "delegateDeleteMsgCallback";
};

MessageDataInterface.getInstance = function()
    if not MessageDataInterface.s_instance then
        MessageDataInterface.s_instance = new(MessageDataInterface);
    end

    return MessageDataInterface.s_instance;
end

MessageDataInterface.cleanup = function()
    local lastObserverMap = MessageDataInterface.getInstance():getObserverMap();
    delete(MessageDataInterface.s_instance);
    MessageDataInterface.s_instance = nil;

    MessageDataInterface.getInstance():setObserverMap(lastObserverMap);
end

MessageDataInterface.ctor = function(self)
    self.m_msgData = new(require("hall/message/data/messageData"),self);
    AnnounceDataInterface.getInstance():setObserver(self);
end 

MessageDataInterface.dtor = function(self)
    delete(self.m_msgData);
    self.m_msgData = nil;
    AnnounceDataInterface.getInstance():clearObserver(self);
end

MessageDataInterface.requestMessageList = function(self)
    self.m_msgData:requestData();
end

--获取消息的未读条数
MessageDataInterface.getUnReadNum = function(self)
    return self.m_msgData:getUnReadCount();
end

MessageDataInterface.hasNewMessage = function(self)
    return self.m_msgData:hasNewMessage();
end

MessageDataInterface.getMsgData = function(self)
    return Copy(self.m_msgData:getMsgData());
end

MessageDataInterface.closeMsg = function(self, id)
    local data = self.m_msgData:getMsgDataById(id);
    if data and data.opened < MessageConstants.eMsgStatus.OPENED then
        if data.msgType == MessageConstants.eMsgType.TEXT or data.msgType == MessageConstants.eMsgType.QRCODE then
            self.m_msgData:readMessage(id, false);
        else
            self.m_msgData:openMessage(id);
        end
    end
    self:notify(MessageDataInterface.Delegate.readMsg);
end

MessageDataInterface.readMsg = function(self, id)
    local data = self.m_msgData:getMsgDataById(id);
    if data and data.opened < MessageConstants.eMsgStatus.READED then
        if data.msgType == MessageConstants.eMsgType.AWARD then   
            VipAnimManager.getInstance():setPauseAnim(true);
            OnlineSocketManager.getInstance():sendMsg(PHP_USER_GETAWARDS, {mid = kUserInfoData:getUserId(), msgid = tonumber(id)});
            LoadingView.getInstance():showText(MessageConstants.text.LOADING_TIPS);
        else
            self.m_msgData:readMessage(id, false);
            self:notify(MessageDataInterface.Delegate.readMsg);
        end
    else
        self.m_msgData:openMessage(id);
        self:notify(MessageDataInterface.Delegate.readMsg);
    end
end

MessageDataInterface.deleteMsg = function(self, id, isDelete)
    self.m_msgData:readMessage(id, isDelete);
    self:notify(MessageDataInterface.Delegate.deleteMsg, self:getMsgData());
end

MessageDataInterface.updateAwards = function(self, id, newAwards)
    self.m_msgData:updateAwards(id, newAwards);
    self:notify(MessageDataInterface.Delegate.refreshMsg, true, self:getMsgData());
end
 
--添加消息
MessageDataInterface.addMsgData = function(self, data)
    self.m_msgData:addMsgData(data);
end

MessageDataInterface.awardMsg = function(self, isSuccess, data)
    LoadingView.getInstance():hidden();
    VipAnimManager.getInstance():setPauseAnim(false);
    if not isSuccess then
        local errInfo = data;
        self:notify(MessageDataInterface.Delegate.awardMsg, false, errInfo);
        return;
    end
    
    local newData = self:_analysisData(data);
    local oldData = self.m_msgData:getMsgById(newData.id);
    self:notify(MessageDataInterface.Delegate.awardMsg, true, newData, oldData);
end

MessageDataInterface.addAnnounceData = function(self, data)
    if not table.isEmpty(data) then
        self.m_msgData:addAnnounceData(data);
    else
        self.m_msgData:deleteAnnounceData();
    end
    
    self:refreshMsgCallback(true, self:getMsgData());
end

MessageDataInterface._analysisData = function(self, data)
    local tempData = {
        id = tostring(data.id) or "0",
        awards = self.m_msgData:_analysisDataAwards(data.awards),
        result = data.result,
    };
    if not tempData.result then
        tempData.errmsg = data.errmsg or "error";
    end

    return tempData;
end

-------------------------------------------------------------------------------------
--通知有消息更新
MessageDataInterface.refreshMsgCallback = function(self, isSuccess, data, ...)
    self:notify(MessageDataInterface.Delegate.refreshMsg, isSuccess, Copy(data), ...);
end

MessageDataInterface.refreshAnnouncement = function(self, data)
    self:addAnnounceData(data);
end

MessageDataInterface.s_socketCmdFuncMap = {
    [PHP_USER_GETAWARDS]                = MessageDataInterface.awardMsg;
};