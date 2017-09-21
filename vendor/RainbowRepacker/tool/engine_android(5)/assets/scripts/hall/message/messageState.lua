require("common/commonScene");
require("hall/message/messageController");
local noticeLayout = require(ViewPath .. "hall/notice/noticeLayout");

-- 注释
-- 此文件为公告栏state
-- 作者：JasonWang

MessageState = class(CommonState);

MessageState.ctor = function(self)
    self.m_controller = nil;
end

MessageState.getController = function(self)
    return self.m_controller;
end

MessageState.load = function(self)
    CommonState.load(self);
    local MessageScene = require("hall/message/messageScene");
    self.m_controller = new(MessageController, self, MessageScene, noticeLayout);
    RadioButton.setDefaultImages();
    return true;
end

MessageState.unload = function(self)
    CommonState.unload(self);
    delete(self.m_controller);
    self.m_controller = nil;
end

MessageState.gobackLastState = function(self)
    if LoadingView.getInstance():isShowing() then
        LoadingView.getInstance():hidden();
        return;
    end

    if IBaseDialog.isDialogShowing() then
        IBaseDialog.onBackHidden();
        return;
    end
        
    StateMachine.getInstance():popState();
end

MessageState.dtor = function(self)
    
end