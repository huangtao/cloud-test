require("hall/matchHall/gameMatchHall/data/matchHallDataInterface")
require("hall/floatBall/data/floatBallDataInterface");

local BallStripe = require("hall/floatBall/floatBallStripe");
local BallDisk = require("hall/floatBall/floatBallDisk");


FloatBall = class(Node);

FloatBall.s_HSpace = 30;
FloatBall.s_VSpace = 30;

FloatBall.eViewStatus = {
    SILENCE = 1; --静止
    MOVING  = 2; --移动
    STRIPE  = 3; --条形状态
    DISK    = 4; --圆盘状态
}

FloatBall.eAlphaType = {
    [FloatBall.eViewStatus.SILENCE] = 0.5;
    [FloatBall.eViewStatus.MOVING]  =  1;
    [FloatBall.eViewStatus.STRIPE]  = 1;
    [FloatBall.eViewStatus.DISK]    = 1;
}


FloatBall.ctor = function(self)
    self.m_orgX, self.m_orgY = 0, 0;
    self.m_lastX, self.m_lastY = 0, 0;
    self.m_maxMoveX, self.m_maxMoveY = 0, 0;

    FloatBallDataInterface.getInstance():setObserver(self);
    HallDataInterface.getInstance():setObserver(self);
    kGameManager:setObserver(self);
    self:_init();
end

FloatBall.dtor = function(self)
    FloatBallDataInterface.getInstance():clearObserver(self);
    HallDataInterface.getInstance():clearObserver(self);
    kGameManager:removeObserver(self);
end

FloatBall.checkIsShowFloatBall = function()
    if not FloatBallDataInterface.getInstance():isSwitchOpen() then
        if FloatBall.s_instance then
            FloatBall.s_instance:setVisible(false);
        end
        return;
    end

    if not FloatBall.s_instance then
        FloatBall.s_instance = new(FloatBall);
        local __levelConfig = require("isolater/widget/globalLayerLevelConfig");
        local __level = __levelConfig.floatBall or 10000;
        FloatBall.s_instance:setLevel(__level);
        FloatBall.s_instance:setFillParent(true, true);
        FloatBall.s_instance:addToRoot();
    end
    FloatBall.s_instance:setVisible(true);

    return FloatBall.s_instance;
end

------------------------------------球相关----------------------------

FloatBall._init = function(self)
    self.m_ball = UIFactory.createImage("hall/floatBall/ball_normal.png");
    self:addChild(self.m_ball);
    self.m_ball:setPos(FloatBall.s_HSpace, System.getScreenScaleHeight()/4);
    self.m_ball:setEventTouch(self, self.onBallTouch);
    self.m_ball:setEventDrag(self, function()
        end);

    self.m_redBubble = UIFactory.createImage("hall/common/new_msg_icon.png");
    self.m_ball:addChild(self.m_redBubble);
    self.m_redBubble:setAlign(kAlignTopRight);
    self.m_redBubble:setPos(5, 5);
    self.m_redBubble:setVisible( FloatBallDataInterface.getInstance():getRedBubbleStatus() );

    self:_setViewStatus(FloatBall.eViewStatus.SILENCE);
end

FloatBall.onBallTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
    if finger_action == kFingerDown then
        self.m_orgX, self.m_orgY = x, y;
        self.m_lastX, self.m_lastY = x, y;
        self.m_maxMoveX, self.m_maxMoveY = 0, 0;
   
    elseif finger_action == kFingerMove then
        self:_setViewStatus(FloatBall.eViewStatus.MOVING);
        self:_moveBall(x-self.m_lastX, y-self.m_lastY);
        self.m_lastX, self.m_lastY = x, y;
        self.m_maxMoveX = math.max( math.abs(x-self.m_orgX), self.m_maxMoveX );
        self.m_maxMoveY = math.max( math.abs(y-self.m_orgY), self.m_maxMoveY );

    else
        self.m_maxMoveX = math.max( math.abs(x-self.m_orgX), self.m_maxMoveX );
        self.m_maxMoveY = math.max( math.abs(y-self.m_orgY), self.m_maxMoveY );

        if self.m_maxMoveX < 10 and self.m_maxMoveY < 10 then
            self:_showDisk();
            local name = FloatBallDataInterface:getInstance():getSceneName();
            UBReport.getInstance():report(UBConfig.kFloatBallClick, string.format("scene:%s",name));
        else
            self:_reviseBallPos();
        end
    end
end

FloatBall._showBall = function(self)
    self.m_ball:setVisible(true);
end

FloatBall._hideBall = function(self)
    self.m_ball:setVisible(false);
end

FloatBall._moveBall = function(self, diffX, diffY)
    local curPosX, curPosY = self.m_ball:getPos();
    local endPosX, endPosY = curPosX+diffX, curPosY+diffY;

    local left, right, top, bottom = self:_getMargin();

    endPosX = math.max(left, endPosX);
    endPosX = math.min(right, endPosX);

    endPosY = math.max(top, endPosY);
    endPosY = math.min(bottom, endPosY);

    self.m_ball:setPos(endPosX, endPosY);
end

FloatBall._reviseBallPos = function(self)
    local curPosX = self.m_ball:getPos();
    local left, right, top, bottom = self:_getMargin();
    local endPosX = (curPosX > System.getScreenScaleWidth()/2) and right or left;

    self:_startMovingBall(curPosX, endPosX);
end

FloatBall._startMovingBall = function(self, curPosX, endPosX)
    self.m_ball:removeProp(0);
    local movingAnim = self.m_ball:addPropTranslate(0,kAnimNormal,300,-1,0,endPosX-curPosX,nil,nil);
    if movingAnim then
        movingAnim:setEvent(self, function()
            self.m_ball:setPos(endPosX, nil);
            self.m_ball:removeProp(0);
            self:_setViewStatus(FloatBall.eViewStatus.SILENCE);
        end);
    end
end

FloatBall._startBallTransparency = function(self)
    local aplha = FloatBall.eAlphaType[FloatBall.eViewStatus.SILENCE];
    local transpanrencyAnim = self.m_ball:addPropTransparency(1, kAnimNormal, 4000, -1, 1, aplha);
    self.m_ball:removeProp(1);
    if transpanrencyAnim then
        transpanrencyAnim:setEvent(self, function()
            self.m_ball:setTransparency(aplha);
            self.m_ball:removeProp(1);
        end);
    end
end

FloatBall._removeBallTransparencyProp = function(self)
    self.m_ball:removeProp(1);
end

FloatBall._getMargin = function(self)
    local screenW, screenH = System.getScreenScaleWidth(), System.getScreenScaleHeight();
    local ballW, ballH = self.m_ball:getSize();

    local left = FloatBall.s_HSpace;
    local right = screenW-FloatBall.s_HSpace-ballW;
    local top = FloatBall.s_VSpace;
    local bottom = screenH-FloatBall.s_VSpace-ballH;

    return left, right, top, bottom;
end

FloatBall._setViewStatus = function(self, status)
    if status == self.m_curStatus then
        return;
    end

    self.m_curStatus = status;
    self:_updateViewByStatus(status);
end

FloatBall._updateViewByStatus = function(self, status)
    local aplha = FloatBall.eAlphaType[status];

    self.m_ball:setFile("hall/floatBall/ball_normal.png");
    self.m_ball:setEventTouch(self, self.onBallTouch);

    if status == FloatBall.eViewStatus.SILENCE then
        self.m_redBubble:setVisible( FloatBallDataInterface.getInstance():getRedBubbleStatus() );
        
        if not self:_checkHasNewMessage() then
            if self:__isShieldFloatBall() or HallDataInterface.getInstance():isWebViewShowing() then
                self:_hideBall();
            else
                self:_showBall();
                self:_startBallTransparency();
            end
            self:_hideStripe();
        end

    elseif status == FloatBall.eViewStatus.MOVING then
        self:_showBall();
        self.m_ball:setTransparency(aplha);
        self:_hideStripe();
        self.m_redBubble:setVisible(false);

    elseif status == FloatBall.eViewStatus.STRIPE then
        self:_showBall();
        self:_removeBallTransparencyProp();
        self.m_ball:setTransparency(aplha);
        self.m_ball:setFile("hall/floatBall/enterMatch.png");
        self.m_ball:setEventTouch(self, self.onFloatBallStripeTouched);

    elseif status == FloatBall.eViewStatus.DISK then
        self:_hideBall();
    end
end

FloatBall._checkPosition = function(self)
    local x, y = self.m_ball:getPos();
    local w, h = self.m_ball:getSize();
    x = x+w/2;
    y = y+h/2;
    local screenW, screenH = System.getScreenScaleWidth(), System.getScreenScaleHeight();
    local isNearLeft = (x < screenW/2) and true or false;
    local isNearTop = (y < screenH/2) and true or false;
    return isNearLeft, isNearTop;
end

FloatBall.onMonitorStateChangedCallBack = function(self)
    if self:__isShieldFloatBall() then
        local screenW, screenH = System.getScreenScaleWidth(), System.getScreenScaleHeight();
        self.m_ball:setPos(FloatBall.s_HSpace, screenH/4);
    end
    self:_updateViewByStatus( self.m_curStatus );
end

FloatBall.onWebViewShowingStatusChanged = function(self)
    if HallDataInterface.getInstance():isWebViewShowing() then
        self.m_ball:setVisible(false);
    else
        self.m_ball:setVisible(true);
    end
end

FloatBall.onGetFloatBallConfigCallBack = function(self)
    self.m_redBubble:setVisible( FloatBallDataInterface.getInstance():getRedBubbleStatus() );
end
---------------------------------------转盘---------------------------------------

FloatBall.__isShieldFloatBall = function(self)
    return kGameManager:isInRoom() or kGameManager:isInModule();
end

FloatBall._showDisk = function(self)
    if self:__isShieldFloatBall() then
        return;
    end

    local diskPosition = self:_getDiskPosition();
    local __diskLayer = LayerManagerIsolater.getInstance():show("floatBallDisk",diskPosition);
    __diskLayer:setDelegate(self);
    self:addChild(__diskLayer);
    self:_setViewStatus(FloatBall.eViewStatus.DISK);

    FloatBallDataInterface.getInstance():setRedBubbleStatus(false);
    self.m_redBubble:setVisible(false);
end

FloatBall._getDiskPosition = function(self)
    local isNearLeft, isNearTop = self:_checkPosition();
    local diskPosition;
    if isNearLeft then
        diskPosition = BallDisk.ePosition.Left;
    else
        diskPosition = BallDisk.ePosition.Right;
    end

    return diskPosition;
end

FloatBall.onFloatBallDiskHide = function(self)
    self:_setViewStatus(FloatBall.eViewStatus.SILENCE);
end

------------------------------------------------消息条--------------------------------
-- call back
FloatBall.onGetHintMessageCallBack = function(self)
    if self.m_curStatus ~= FloatBall.eViewStatus.SILENCE then
        return;
    end

    local msgItem = FloatBallDataInterface.getInstance():popMessageItem();
    if table.isEmpty(msgItem) then
        return;
    else
        self:_showStripe(msgItem);
    end
end

FloatBall._checkHasNewMessage = function(self)
    local hasMessage = FloatBallDataInterface.getInstance():hasMessageItem();
    if hasMessage then
        self:onGetHintMessageCallBack();
        return true;
    else
        return false;
    end
end

FloatBall._showStripe = function(self, data)
    self:_setViewStatus(FloatBall.eViewStatus.STRIPE);

    self.m_msgData = data;
    if not self.m_ballStripe then
        self.m_ballStripe = new(BallStripe);
        self.m_ballStripe:setEventTouch(self, self.onFloatBallStripeTouched);
        self.m_ballStripe:setDelegate(self);
        self.m_ball:addChild(self.m_ballStripe);
    end

    local isNearLeft = self:_checkPosition();
    local direction = isNearLeft and BallStripe.eDirection.TORIGHT or BallStripe.eDirection.TOLEFT;
    self.m_ballStripe:show(direction, data);
end

FloatBall.onFloatBallStripeTouched = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
    if finger_action == kFingerUp then

        self:_setViewStatus(FloatBall.eViewStatus.SILENCE);

        local data = self.m_msgData;
        self.m_msgData = nil;
        if table.isEmpty(data) or self:__isShieldFloatBall() then
            return;
        end

        if not data.matchId then 
            return;
        end

        MatchIsolater.getInstance():setSignMatchId(data.matchId);
        EventDispatcher.getInstance():dispatch(HallController.s_matchListDispatch);
    end
end

FloatBall.onFloatBallStripHide = function(self)
    self:_setViewStatus(FloatBall.eViewStatus.SILENCE);
end

FloatBall._hideStripe = function(self)
    if self.m_ballStripe then
        self.m_ballStripe:hide();
    end
end
