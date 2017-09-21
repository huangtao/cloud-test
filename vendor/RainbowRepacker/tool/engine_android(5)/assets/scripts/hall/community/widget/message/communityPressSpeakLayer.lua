require("common/commonGameLayer");
local communityPressSpeakLayer = require(ViewPath.."hall/community/message/communityPressSpeakLayer");
local CommunityMessageLayer = require("hall/community/widget/message/communityMessageLayer");

-- 实时对讲麦克风
local CommunityPressSpeakLayer = class(CommonGameLayer, false);

CommunityPressSpeakLayer.DEFAULT_TIME_LIMIT = 45; -- 默认最长录制45s


local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

CommunityPressSpeakLayer.s_controls = 
{
    microphoneImg = getIndex(),
    microphoneView = getIndex(),
    loadingView = getIndex(),
    loadingImg = getIndex(),
    hintTextView = getIndex(),
};

CommunityPressSpeakLayer.s_cmds = 
{
};

CommunityPressSpeakLayer.Delegate = {
    onMicrophoneTimeOverCallback = "onMicrophoneTimeOverCallback";
};

CommunityPressSpeakLayer.ctor = function(self)
    super(self, communityPressSpeakLayer);
    self:setFillParent(true, true);
    self:setVisible(false);
    self.m_count = CommunityPressSpeakLayer.DEFAULT_TIME_LIMIT;
    self.m_needHint = false;
    self:_initView();
    self.m_hintTextView:setScrollBarWidth(0);
end

CommunityPressSpeakLayer.dtor = function(self)
    self:cleanUpTimer();
end

---------------------------------------------------------------------------------------
CommunityPressSpeakLayer.show = function(self)
    --self:_addPropLoading();
	self:setVisible(true);
    self.m_microphoneView:setVisible(false);
    self.m_loadingView:setVisible(true);
end

CommunityPressSpeakLayer.hide = function(self)
	self:setVisible(false);

	-- 定时
    self.m_needHint = false;
    self:cleanUpTimer();
	self:_removePropMicrophone();
    self:_removePropLoading();
end

CommunityPressSpeakLayer.setIsVisible = function (self,visible)
    self:setVisible(visible);
end

CommunityPressSpeakLayer.microphoneStart = function(self, duration)
    if not self:getVisible() then
        return;
    end
    self.m_hintTextView:setText("手指上滑取消发送");
    self.m_duration = tonumber(duration) or CommunityPressSpeakLayer.DEFAULT_TIME_LIMIT;
    -- 定时
    self.m_needHint = true;
    self.m_count = CommunityPressSpeakLayer.DEFAULT_TIME_LIMIT;
    self:_addPropMicrophone();
    --self:_removePropLoading();

    self.m_microphoneView:setVisible(true);
    --self.m_loadingView:setVisible(false);
    self:createMicrophoneTimer();
end

CommunityPressSpeakLayer.countDownTimer = function (self)
     if self.m_needHint then
        self.m_count = self.m_count - 1;
        if self.m_count < 9 and self.m_count >= 0 then --8秒后提示
            self.m_hintTextView:setText("最后说"..self.m_count.."秒");
        end
    end
end

CommunityPressSpeakLayer.cleanUpTimer = function (self)
    if self.m_timer then
        delete(self.m_timer);
    end
	self.m_timer = nil;
end

CommunityPressSpeakLayer.createMicrophoneTimer = function (self)
    self:cleanUpTimer();
    self.m_timer = AnimFactory.createAnimInt(kAnimRepeat,0,1,1000);
    self.m_timer:setDebugName("CommunityPressSpeakLayer|createMicrophoneTimer");
	self.m_timer:setEvent(self,self.countDownTimer);
end

CommunityPressSpeakLayer.onTimer = function(self)
	EventDispatcher.getInstance():dispatch(CommunityMessageLayer.s_event_changeToPressSpeakLayer);
end

---------------------------------------------------------------------------------------
CommunityPressSpeakLayer._initView = function(self)
	self.m_microphoneImg = self:findViewById(self.s_controls.microphoneImg);
    self.m_microphoneView = self:findViewById(self.s_controls.microphoneView);
    self.m_loadingImg = self:findViewById(self.s_controls.loadingImg);
    self.m_loadingView = self:findViewById(self.s_controls.loadingView);
    self.m_hintTextView = self:findViewById(self.s_controls.hintTextView);
    self.m_loadingImg:setVisible(false);
end

CommunityPressSpeakLayer._addPropMicrophone = function(self)
	self:_removePropMicrophone();

    local w, h = self.m_microphoneImg:getSize();
    local scale = System.getLayoutScale();
    w = w * scale;
    h = h * scale;
	local _, _, _, animH = self.m_microphoneImg:addPropClip(1, kAnimNormal, self.m_duration*1000, 0, 
    	0, 0, 0, 0, w, w, h, 0);
	animH:setDebugName("animH|kAnimNormal|CommunityPressSpeakLayer.m_microphoneImg:addPropClip");
    animH:setEvent(self, self.onTimer);
end

CommunityPressSpeakLayer._removePropMicrophone = function(self)
	if not self.m_microphoneImg:checkAddProp(1) then
		self.m_microphoneImg:removeProp(1);
	end
end

CommunityPressSpeakLayer._addPropLoading = function(self)
    self:_removePropLoading();

    local animLoading = self.m_loadingImg:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
    animLoading:setDebugName("animLoading|kAnimRepeat|CommunityPressSpeakLayer.m_loadingImg:addPropRotate");
end

CommunityPressSpeakLayer._removePropLoading = function(self)
    if not self.m_loadingImg:checkAddProp(1) then
        self.m_loadingImg:removeProp(1);
    end
end

CommunityPressSpeakLayer.s_controlConfig = 
{
    [CommunityPressSpeakLayer.s_controls.microphoneImg]     = {"bg", "microphoneView", "microphone"};
    [CommunityPressSpeakLayer.s_controls.microphoneView]    = {"bg", "microphoneView"};
    [CommunityPressSpeakLayer.s_controls.loadingView]       = {"bg", "loadingView"};
    [CommunityPressSpeakLayer.s_controls.loadingImg]        = {"bg", "loadingView", "loadingImg"};
    [CommunityPressSpeakLayer.s_controls.hintTextView]      = {"bg", "hintTextView"};
    
};

CommunityPressSpeakLayer.s_controlFuncMap = 
{
};

CommunityPressSpeakLayer.s_cmdConfig = 
{
};

return CommunityPressSpeakLayer;