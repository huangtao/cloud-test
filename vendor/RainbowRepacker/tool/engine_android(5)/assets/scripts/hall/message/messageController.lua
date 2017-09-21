require("isolater/common/commonController");
local MessageScene = require("hall/message/messageScene");
MessageController = class(CommonController);

MessageController.s_cmds = 
{
    requestGoBack          = 1,
    requestGetMsgInfo      = 2,
    requestCloseMsg        = 3,
    requestReadMsg         = 4,
    requestDeleteMsg       = 5,
    requestUpdateAwards    = 6,
};

MessageController.ctor = function(self, state, viewClass, viewConfig)
    self.m_state = state;   
    MessageDataInterface.getInstance():setObserver(self);
end

MessageController.dtor = function(self) 
    MessageDataInterface.getInstance():clearObserver(self);
end

MessageController.resume = function(self)
    CommonController.resume(self);
end

MessageController.pause = function(self)
    CommonController.pause(self);
end

MessageController.requestGoBackCallback = function(self)
    self.m_state:popState();
end

MessageController.requestCloseMsgCallback = function(self, id)
    MessageDataInterface.getInstance():closeMsg(id);
end

MessageController.requestReadMsgCallback = function(self, id)
    MessageDataInterface.getInstance():readMsg(id);
end

MessageController.requestGetMsgInfoCallback = function(self)
    local msgData = MessageDataInterface.getInstance():getMsgData();
    self:updateView(MessageScene.s_cmds.updateGetMsgInfo, msgData);
end

MessageController.requestDeleteMsgCallback = function(self, id, isDelete)
    MessageDataInterface.getInstance():deleteMsg(id, isDelete);
end

MessageController.requestUpdateAwardsCallback = function(self, id, awards)
    MessageDataInterface.getInstance():updateAwards(id, awards);
end
---------------------------------------------------------------------------------------
-- 委托回调
MessageController.delegateReadMsgCallback = function(self)
    self:updateView(MessageScene.s_cmds.updateReadMsg);
end

MessageController.delegateRefreshMsgCallback = function(self, isSuccess, data)
    if isSuccess then
        self:updateView(MessageScene.s_cmds.updateGetMsgInfo, data);
    end
end

MessageController.delegateAwardMsgCallback = function(self, isSuccess, newData, oldData)
    self:updateView(MessageScene.s_cmds.updateAwardMsg, isSuccess, newData, oldData);
end

MessageController.delegateDeleteMsgCallback = function(self, data)
   self:updateView(MessageScene.s_cmds.updateDeleteMsg, data);
end

MessageController.s_cmdConfig = 
{
    [MessageController.s_cmds.requestGoBack]       = MessageController.requestGoBackCallback,
    [MessageController.s_cmds.requestGetMsgInfo]   = MessageController.requestGetMsgInfoCallback,
    [MessageController.s_cmds.requestCloseMsg]     = MessageController.requestCloseMsgCallback,
    [MessageController.s_cmds.requestReadMsg]      = MessageController.requestReadMsgCallback,
    [MessageController.s_cmds.requestDeleteMsg]    = MessageController.requestDeleteMsgCallback,
    [MessageController.s_cmds.requestUpdateAwards] = MessageController.requestUpdateAwardsCallback,
};
