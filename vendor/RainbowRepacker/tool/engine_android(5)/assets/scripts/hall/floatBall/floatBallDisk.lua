local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local FloatBallDiskItem = require("hall/floatBall/floatBallDiskItem");
local FloatBallDisk = class(hallLayerBaseWithName,false);

FloatBallDisk.Delegate = {
    onFloatBallDiskHide = "onFloatBallDiskHide";
}

FloatBallDisk.ePosition = {
    Left = 1;
    Right = 2;
}
FloatBallDisk.s_layerName = "floatBallDisk";
FloatBallDisk.ctor = function(self,p_direction)
    local __layout = require(ViewPath .. "hall/floatBall/floatBallDisk");
    super(self, __layout,nil,FloatBallDisk.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/floatBall/floatBallDisk".."_layout_var");

    self.m_position = p_direction or FloatBallDisk.ePosition.Right;
    self.m_w_offset = 16;
    self:setFillParent(true, true);
  
    self:__getHandle();
    self:_init();

    self:setListenBackEvent(true);
end

FloatBallDisk.dtor = function(self)
    self:execDelegate(FloatBallDisk.Delegate.onFloatBallDiskHide);
end

FloatBallDisk.__getHandle = function(self)
    self.m_root:setEventTouch(self,self.__close);
    self:getComponent();
    self.mm_View_disk:setEventTouch(nil,function() end);
    if self.m_position == FloatBallDisk.ePosition.Left then
        self.mm_View_disk:setAlign(kAlignLeft)
        self.mm_Image_bg:addPropRotateSolid(1, 180, kCenterDrawing)
        self.mm_Image_nothing:setPos(-50,nil);
    end
    self.mm_Image_nothing:setVisible(false);
end

FloatBallDisk._init = function(self)
    
    self.m_config = FloatBallDataInterface.getInstance():getFloatBallConfig();

    if table.isEmpty(self.m_config) then
        self.mm_Image_nothing:setVisible(true);
        return false;
    end

    local __tmpClass = require("hall/floatBall/floatBallListWidget");
    local __w,__h = self.mm_View_disk:getSize();
    local floatWidget = new(__tmpClass,{w = __w - self.m_w_offset,h= __h});
    floatWidget:setPos(self.m_w_offset,0);
    if self.m_position == FloatBallDisk.ePosition.Left  then
        floatWidget:setPos(0,0);
    end
    floatWidget:setLevel(2);
    self.mm_View_disk:addChild(floatWidget);

    local __sortNum = 1;
    for k, v in ipairs(self.m_config) do
        v.sortNum = __sortNum;
       local item = new(FloatBallDiskItem, v,floatWidget);
       item:setDelegate(self);
       floatWidget:addItem(item);
       __sortNum = __sortNum + 1 ; 
   end
end

FloatBallDisk.__close = function(self)
    self:close();
end
FloatBallDisk.onFloatBallDiskItemClick = function(self, jumpcode)
    if not table.isEmpty(jumpcode) then
        self:__close();
        local onlyExecuteInHall = CommonJumpLogic.getInstance():executeJsCall(jumpcode);
        if onlyExecuteInHall then
            StateMachine.getInstance():changeState(States.Hall);
        end
    end
end

FloatBallDisk.execDelegate = function ( self,func,... )
    if self.m_delegate and self.m_delegate[func] then
        return self.m_delegate[func](self.m_delegate,...);
    end
end

return FloatBallDisk;