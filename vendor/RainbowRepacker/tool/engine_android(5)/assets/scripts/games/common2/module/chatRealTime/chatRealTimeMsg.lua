
local chatRealTimeMsgLayout2 = require("view/kScreen_1280_800/games/common2/chatRealTimeMsgLayout2");
local animChatVoice_pin_map = require("qnFiles/qnPlist/games/animChatVoice_pin");

-- 实时对讲语音动画
local ChatRealTimeMsg = class(CommonGameLayer, false);

ChatRealTimeMsg.s_controls = 
{
    voiceView   = ToolKit.getIndex();
};

ChatRealTimeMsg.s_cmds = 
{
};

ChatRealTimeMsg.Delegate = {
    
};

ChatRealTimeMsg.ctor = function(self)
    super(self, chatRealTimeMsgLayout2);
    self:setFillParent(false, false);
    self:setSize(self.m_root:getSize());
    self:setVisible(false);

    self:_initView();
end

ChatRealTimeMsg.dtor = function(self)
end

---------------------------------------------------------------------------------------
ChatRealTimeMsg.show = function(self)
    self:setVisible(true);
end

ChatRealTimeMsg.hide = function(self)
    self:setVisible(false);
end

ChatRealTimeMsg.setAlign = function(self, align)
    CommonGameLayer.setAlign(self, align);

    if align == kAlignTopLeft or align == kAlignLeft or align == kAlignBottomLeft then
        self:_addProp(90);
    elseif align == kAlignTopRight or align == kAlignRight or align == kAlignBottomRight then
        self:_addProp(-90);
    end
end
---------------------------------------------------------------------------------------

ChatRealTimeMsg._initView = function(self)
end

ChatRealTimeMsg._addProp = function(self, angle)
    self:_removeProp();
    self.m_root:addPropRotateSolid(1, angle, kCenterDrawing);
end

ChatRealTimeMsg._removeProp = function(self)
    if not self.m_root:checkAddProp(1) then
        self.m_root:removeProp(1);
    end
end

ChatRealTimeMsg.s_controlConfig = 
{
    [ChatRealTimeMsg.s_controls.voiceView] = {"voiceView"};
};

ChatRealTimeMsg.s_controlFuncMap = 
{
};

ChatRealTimeMsg.s_cmdConfig = 
{
};

return ChatRealTimeMsg;