
local microphoneLayout = require("view/kScreen_1280_800/games/common2/microphoneLayout");

-- 实时对讲麦克风
local MicrophoneView = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

MicrophoneView.s_controls = 
{
    microphone = getIndex(),
};

MicrophoneView.s_cmds = 
{
};

MicrophoneView.Delegate = {
};

MicrophoneView.ctor = function(self)
    super(self, microphoneLayout);
    self:setFillParent(true, true);
    self:setVisible(false);

    self:_initView();
end

MicrophoneView.dtor = function(self)
end

---------------------------------------------------------------------------------------
MicrophoneView.show = function(self)
    self:startMicrophone();
    self:setVisible(true);
end

MicrophoneView.hide = function(self)
    self:setVisible(false);
    self:endMicrophone();
end

---------------------------------------------------------------------------------------
MicrophoneView.startMicrophone = function(self)
    self:_addPropMicrophone();
    self:_addVoice();
end

MicrophoneView.endMicrophone = function(self)
    self:_removeVoice();
    self:_removePropMicrophone();
end

MicrophoneView._addPropMicrophone = function(self)
    local w, h = self.m_microphone:getSize();
    local scale = System.getLayoutScale();
    w = w * scale;
    h = h * scale;
    local _, _, _, animH = self.m_microphone:addPropClip(1, kAnimNormal, 3000, 0, 
        0, 0, h, 0, w, w, h, h);
    animH:setDebugName("animH|kAnimNormal|MicrophoneView.m_microphone:addPropClip");
end

MicrophoneView._removePropMicrophone = function(self)
    if not self.m_microphone:checkAddProp(1) then
        self.m_microphone:removeProp(1);
    end
end

MicrophoneView._addVoice = function(self)
    if not self.m_voiceView then
        local chatRealTimeMsg = require("games/common2/module/chatRealTime/chatRealTimeMsg");
        self.m_voiceView = new(chatRealTimeMsg);
        self.m_root:addChild(self.m_voiceView);
    end
    local w, h = self.m_root:getSize();
    self.m_voiceView:setAlign(kAlignBottom);
    self.m_voiceView:setPos(nil, h);
    self.m_voiceView:show();
end

MicrophoneView._removeVoice = function(self)
    if self.m_voiceView then
        self.m_voiceView:hide();
    end
end

MicrophoneView._initView = function(self)
    self.m_microphone = self:findViewById(self.s_controls.microphone);
end

MicrophoneView.s_controlConfig = 
{
    [MicrophoneView.s_controls.microphone] = {"microphone"};
};

MicrophoneView.s_controlFuncMap = 
{
};

MicrophoneView.s_cmdConfig = 
{
};

return MicrophoneView;