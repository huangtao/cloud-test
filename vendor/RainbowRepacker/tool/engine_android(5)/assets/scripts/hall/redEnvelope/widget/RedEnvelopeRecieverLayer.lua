require("hall/redEnvelope/data/redEnvelopeDataInterface");
local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local RedEnvelopeRecieverLayer = class(hallLayerBaseWithName,false);
RedEnvelopeRecieverLayer.s_layerName = "redenvelope_reciever";
RedEnvelopeRecieverLayer.s_HSpace = 0;
RedEnvelopeRecieverLayer.s_VSpace = 0;

RedEnvelopeRecieverLayer.ctor = function(self,p_data)   
    
    self.m_data = p_data or {};

    RedEnvelopDataInterface.getInstance():setObserver(self);

    local __configTab = require(ViewPath.."hall/redEnvelope/reciever_red_envelope");

    super(self,__configTab,nil,RedEnvelopeRecieverLayer.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/reciever_red_envelope".."_layout_var");

    self:setTouchTransfer(true);
    self:setDragTransfer(true);

    self:setFillParent(true, true);

    self:getHandle();

    self:init();

    local __isActivityShowing = RedEnvelopDataInterface.getInstance():isActivityShowing();
    if __isActivityShowing then
        self:setVisible(false);
    end
end

RedEnvelopeRecieverLayer.dtor = function(self)  
    RedEnvelopDataInterface.getInstance():clearObserver(self);
    self:removeProp(6);
end

--得到相关句柄
RedEnvelopeRecieverLayer.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
end 

RedEnvelopeRecieverLayer.init = function(self)
    self.mm_Swf_reciever:setEventDrag(self.mm_Swf_reciever,function() end);
    --晃动两下      
    local x,y = RedEnvelopDataInterface.getInstance():getRecieverPos();  
    self.mm_Swf_reciever:setPos(x,y);  
    local __angle = 10;
    local __time = 80;                                                                
    self.m_swf_pro1 = self.mm_Swf_reciever:addPropRotate(1, kAnimNormal, __time, 0, 360-__angle, 360 + __angle, kCenterDrawing);
    self.m_swf_pro1:setDebugName("RedEnvelopeRecieverLayer.init1");
    self.m_swf_pro2= self.mm_Swf_reciever:addPropRotate(2, kAnimNormal, __time*1.5, __time, 360 + __angle,360-(__angle*2), kCenterDrawing);
    self.m_swf_pro2:setDebugName("RedEnvelopeRecieverLayer.init2");
    self.m_swf_pro3 = self.mm_Swf_reciever:addPropRotate(3, kAnimNormal, __time*1.5, __time*2.5, 360-__angle, 360 + (__angle*2), kCenterDrawing);
    self.m_swf_pro3:setDebugName("RedEnvelopeRecieverLayer.init3");
    self.m_swf_pro4 = self.mm_Swf_reciever:addPropRotate(4, kAnimNormal, __time, __time*4, 360 + __angle, 360-__angle, kCenterDrawing);
    self.m_swf_pro4:setDebugName("RedEnvelopeRecieverLayer.init4");
    local __unitTime = __time * 5;
    self.m_swf_pro5 = self.mm_Swf_reciever:addPropRotate(5, kAnimNormal, __time, __unitTime, 360-__angle, 360 + __angle, kCenterDrawing);
    self.m_swf_pro5:setDebugName("RedEnvelopeRecieverLayer.m_swf_pro5");
    self.m_swf_pro6= self.mm_Swf_reciever:addPropRotate(6, kAnimNormal, __time*1.5,__unitTime +__time, 360 + __angle,360-(__angle*2), kCenterDrawing);
    self.m_swf_pro6:setDebugName("RedEnvelopeRecieverLayer.m_swf_pro6");
    self.m_swf_pro7 = self.mm_Swf_reciever:addPropRotate(7, kAnimNormal, __time*1.5,__unitTime + __time*2.5, 360-__angle, 360 + (__angle*2), kCenterDrawing);
    self.m_swf_pro7:setDebugName("RedEnvelopeRecieverLayer.m_swf_pro7");
    self.m_swf_pro8 = self.mm_Swf_reciever:addPropRotate(8, kAnimNormal, __time,__unitTime + __time*4, 360 + __angle, 360-__angle, kCenterDrawing);
    self.m_swf_pro8:setDebugName("RedEnvelopeRecieverLayer.m_swf_pro8");
    
    --self.m_swf_pro:setEvent();
end

--------------------------------private-------------------------------------
RedEnvelopeRecieverLayer._moveBall = function(self, diffX, diffY)
    local curPosX, curPosY = self.mm_Swf_reciever:getPos();
    local endPosX, endPosY = curPosX+diffX, curPosY+diffY;

    local left, right, top, bottom = self:_getMargin();

    endPosX = math.max(left, endPosX);
    endPosX = math.min(right, endPosX);

    endPosY = math.max(top, endPosY);
    endPosY = math.min(bottom, endPosY);

    self.mm_Swf_reciever:setPos(endPosX, endPosY);
    RedEnvelopDataInterface.getInstance():setRecieverPos(endPosX, endPosY);
end

RedEnvelopeRecieverLayer._getMargin = function(self)
    local screenW, screenH = System.getScreenScaleWidth(), System.getScreenScaleHeight();
    local ballW, ballH = self.mm_Swf_reciever:getSize();

    local left = RedEnvelopeRecieverLayer.s_HSpace;
    local right = screenW-RedEnvelopeRecieverLayer.s_HSpace-ballW;
    local top = RedEnvelopeRecieverLayer.s_VSpace;
    local bottom = screenH-RedEnvelopeRecieverLayer.s_VSpace-ballH;

    return left, right, top, bottom;
end

--------------------------------点击回掉函数--------------------------------

RedEnvelopeRecieverLayer.onBindReciever = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)

     if finger_action == kFingerDown then
        self.m_orgX, self.m_orgY = x, y;
        self.m_lastX, self.m_lastY = x, y;
        self.m_maxMoveX, self.m_maxMoveY = 0, 0;
   
    elseif finger_action == kFingerMove then
        self:_moveBall(x-self.m_lastX, y-self.m_lastY);
        self.m_lastX, self.m_lastY = x, y;
        self.m_maxMoveX = math.max( math.abs(x-self.m_orgX), self.m_maxMoveX );
        self.m_maxMoveY = math.max( math.abs(y-self.m_orgY), self.m_maxMoveY );

    else
        self.m_maxMoveX = math.max( math.abs(x-self.m_orgX), self.m_maxMoveX );
        self.m_maxMoveY = math.max( math.abs(y-self.m_orgY), self.m_maxMoveY );

        if self.m_maxMoveX < 10 and self.m_maxMoveY < 10 then
            self:close();
            --抢红包
            RedEnvelopDataInterface.getInstance():requestGetRedEnvelop(self.m_data.id);
        else
           
        end
    end

end

return RedEnvelopeRecieverLayer;