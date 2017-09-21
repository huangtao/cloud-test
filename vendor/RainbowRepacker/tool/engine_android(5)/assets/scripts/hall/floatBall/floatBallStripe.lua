local FloatBallStripe = class(CommonGameLayer,false);
local stencilMask = require("libEffect/shaders/stencilMask");

FloatBallStripe.Delegate = {
    onFloatBallStripHide = "onFloatBallStripHide";
}

FloatBallStripe.eDirection = {
    TOLEFT = 0;
    TORIGHT = 1;
}

FloatBallStripe.ctor = function(self)
    super(self);
    self.m_leftTime = 0;
    self:_addStripe();
end

FloatBallStripe.dtor = function(self)
    self:_stopRemainTimer();
    stencilMask.removeStencilEffect(self, true)
end

FloatBallStripe._addStripe = function(self)
    self.m_stripe = new(Image, "hall/floatBall/popStripe.png", nil, nil, 100, 100, 0, 0);
    self:setSize( self.m_stripe:getSize() );
    self.m_ballStripeMask = new(Image, "hall/floatBall/popStripe_mask.png", nil, nil, 100, 100, 0, 0);
    stencilMask.applyToDrawing(self, self.m_stripe, self.m_ballStripeMask, 0.1);

    self.m_stripeWidth, self.m_stripeHight = self.m_stripe:getSize();

    self:setPos(57,1);
end

FloatBallStripe._refreshMatchContent = function(self)
    if table.isEmpty(self.m_data) then
        return;
    end

    self:_createRichText();
    self:_showRichText();
    self:_reviseSizeByContent();
    self:_startRemainTimer();
end

FloatBallStripe._createRichText = function(self)
    if self.m_richTextTable then
        self:removeChild(self.m_richTextTable);
        delete(self.m_richTextTable);
        self.m_richTextTable = nil;
    end

    self.m_richTextTable = new(RichText, "", 240, 80, kAlignLeft, nil, 24);
    self.m_richTextTable:setAlign(kAlignLeft);
    self:addChild(self.m_richTextTable);
    self.m_richTextTable:setPos(40,-3);
    self.m_richTextTable:setVisible(true);
end

FloatBallStripe._showRichText = function(self)
    local matchName = self.m_data.matchName or "";
    local strTable = string.format("#cffe400您报名的#c44ffcc%s#l#cffe400距离开赛仅剩#c44ffcc%s", matchName, self:_formatLeftTime() );
    self.m_richTextTable:setText(strTable, 240, 80, kAlignLeft, nil, 24);
end

FloatBallStripe._startRemainTimer = function(self)
    self:_stopRemainTimer();
    self:_onRemainTimer();
    self.m_remainTimer = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 1000, -1);
    self.m_remainTimer:setDebugName("FloatBallStripe|m_remainTimer");
    self.m_remainTimer:setEvent(self, self._onRemainTimer);
end

FloatBallStripe._onRemainTimer = function(self)
    self.m_leftTime = self.m_leftTime - 1;
    if self.m_leftTime <= 0 then
        self:_stopRemainTimer();
    end

    self:_showRichText();
end

FloatBallStripe._stopRemainTimer = function(self)
    delete(self.m_remainTimer);
    self.m_remainTimer = nil;
end

FloatBallStripe._formatLeftTime = function(self)
    local time = self.m_leftTime;
    if time <= 0 then
        return "00:00";
    end

    local hour = math.floor(time/3600);
    local minute = math.floor(time%3600/60);
    local second = math.floor(time%3600%60);

    if hour > 0 then
        return string.format("%02d:%02d:%02d", hour, minute, second);
    else
        return string.format("%02d:%02d", minute, second);
    end
end

FloatBallStripe._reviseSizeByContent = function(self)
    local w = self.m_richTextTable:getSize();
    local x = self.m_richTextTable:getPos();
    local newWidth = (2*x + w) > self.m_stripeWidth and (2*x + w) or self.m_stripeWidth;
    self:setSize(newWidth, nil);
    self.m_stripe:setSize(newWidth, nil);
    self.m_ballStripeMask:setSize(newWidth, nil);
end

FloatBallStripe._hideMatchContent = function(self)
    if self.m_richTextTable then
        self.m_richTextTable:setVisible(false)
    end
end


FloatBallStripe._adapterPos = function(self)
    local maskImg = "";
    if self.m_direction == FloatBallStripe.eDirection.TOLEFT then
        self:setAlign(kAlignRight);
        self.m_stripe:setMirror(false, false);
        maskImg = "hall/floatBall/popStripe_mask.png";
    else
        self:setAlign(kAlignLeft);
        self.m_stripe:setMirror(true, false);
        maskImg = "hall/floatBall/popStripe_mask_right.png";
    end

    self.m_ballStripeMask:setFile(maskImg);
end

FloatBallStripe.show = function(self, direction, data)
    self:setVisible(true);

    self.m_direction = direction;
    self.m_data = data;

    self.m_leftTime = number.valueOf(data.startTime) - kAppData:getRightTimeWithServer();

    self:_adapterPos();
    self:_hideMatchContent();
    self:_startTranslateToShow();
end

FloatBallStripe.hide = function(self)
    self:setVisible(false);
end

FloatBallStripe._startTranslateToShow = function(self)
    local s, e = self:_getTransDistance();
    self.m_stripe:removeProp(0);
    local anim = self.m_stripe:addPropTranslate(0,kAnimNormal,500,-1,s,e,nil,nil);
    if anim then
        anim:setEvent(self, function()
            self.m_stripe:removeProp(0);
            self:_startContentTransparencyToShow();
            end);
    end
end

FloatBallStripe._startContentTransparencyToShow = function(self)
    self:_refreshMatchContent();
    self.m_richTextTable:removeProp(1);
    local anim = self.m_richTextTable:addPropTransparency(1, kAnimNormal, 500, -1, 0, 1);
    if anim then
        anim:setEvent(self, function(self)
            self.m_richTextTable:removeProp(1);
            self:_startContentTransparencyToHide();
            end);
    end
end

FloatBallStripe._startContentTransparencyToHide = function(self)
    self.m_richTextTable:removeProp(2);
    local anim = self.m_richTextTable:addPropTransparency(2, kAnimNormal, 500, 20000, 1, 0);
    if anim then
        anim:setEvent(self, function(self)
            self.m_richTextTable:removeProp(2);
            self.m_richTextTable:setTransparency(0);
            self.m_richTextTable:setVisible(false);
            self:_startTranslateToHide();
            end);
    end
end

FloatBallStripe._startTranslateToHide = function(self)
    local s, e = self:_getTransDistance();
    self.m_stripe:removeProp(2);
    local anim = self.m_stripe:addPropTranslate(2,kAnimNormal,500,-1,e,s,nil,nil);
    if anim then
        anim:setEvent(self, function(self)
            self.m_stripe:removeProp(2);
            self:hide();
            self:execDelegate(FloatBallStripe.Delegate.onFloatBallStripHide);
            end);   
    end
end

FloatBallStripe._getTransDistance = function(self)
    local s, e = 0, 0;
    local w, h = self:getSize();
    if self.m_direction == FloatBallStripe.eDirection.TOLEFT then
        s, e = w, 0;
    else
        s, e = -w, 0;
    end

    return s, e;
end

return FloatBallStripe;