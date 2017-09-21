local hall_pin_map = require("qnFiles/qnPlist/hall/hall_pin");
--------------------------- 箭头View --------------------------------------------------
local ArrowView = class(Node);

ArrowView.s_defaultNormalArrow = "hall_arrow_%s_normal.png";
ArrowView.s_defaultShineArrow = "hall_arrow_%s_shine.png";

ArrowView.ctor = function(self, direct, normalArrowPath, shineArrowPath)
    directStr = direct;
    normalArrowPath = normalArrowPath or ArrowView.s_defaultNormalArrow;
    shineArrowPath = shineArrowPath or ArrowView.s_defaultShineArrow;

    self.m_imageBg = UIFactory.createImage(hall_pin_map[string.format(normalArrowPath, directStr)]);
    self.m_imageShine = UIFactory.createImage(hall_pin_map[string.format(shineArrowPath, directStr)]);
    self:setSize(self.m_imageBg:getSize());
    self:addChild(self.m_imageBg);
    self:addChild(self.m_imageShine);
    self:setName(direct.."_arrow");
end

ArrowView.setVisible = function(self, bool)
    Node.setVisible(self, bool);

    if bool then
        self:startShine1();
    else
        self:stopShineing();
    end
end

ArrowView.startShine1 = function(self)
    self.ainmTrans1 = self.m_imageShine:addPropTransparency(1, kAnimLoop, 1000, 0, 0, 1);
    self.m_imageShine:setDebugNameByPropAndAnim(1,"ArrowView self.m_imageShine");
    if self.ainmTrans1 then
        self.ainmTrans1:setDebugName("PropTransparency|ArrowView.startShineing1|kAnimRepeat");
    end
end

ArrowView.startShine2 = function(self)
    self:stopShineing();
    self.ainmTrans2 = self.m_imageShine:addPropTransparency(1, kAnimNormal, 1000, 0, 1, 0);
    self.m_imageShine:setDebugNameByPropAndAnim(1,"ArrowView self.m_imageShine");
    if self.ainmTrans2 then
        self.ainmTrans2:setDebugName("PropTransparency|ArrowView.startShineing2|kAnimRepeat");
        self.ainmTrans2:setEvent(self, self.startShine1);
    end
end

ArrowView.stopShineing = function(self, index)
    if not self.m_imageShine:checkAddProp(1) then 
        self.m_imageShine:removeProp(1);
    end 
end

ArrowView.dtor = function(self)
    self:stopShineing();
end

return ArrowView;