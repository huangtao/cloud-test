local imageMask = require("libEffect/shaders/imageMask")

Mask = class(Node);

Mask.ctor = function (self, imageFile, imageMask)
	if not (imageFile and imageMask) then return end;
    self:loadRes(imageFile,imageMask);
    self:renderMask();
end

Mask.dtor = function (self)
    if self.m_prifileImage then
        delete(self.m_prifileImage);
    end
	self.m_prifileImage = nil;
    if self.m_maskImage then
        delete(self.m_maskImage);
    end
	self.m_maskImage = nil;
end

Mask.setSize = function (self, w, h)  
      self.m_width = w or 0;
      self.m_height = h or 0;
          
      self.m_prifileImage:setSize(self.m_width, self.m_height);
      self.m_maskImage:setSize(self.m_width, self.m_height);
end

Mask.getSize = function (self)
     return self:getRealSize();
end

Mask.setGray = function (self, gray)   
    local val = gray and 0.0 or 1.0;
    self:getWidget().shader = require("shaders.grayScale");
    self:getWidget():set_uniform("intensity",Shader.uniform_value_float(val));
end

-----------------------private function---------------------------------
Mask.loadRes = function (self, imageFile, imageMask)

    self.m_prifileImage = new(Image, imageFile, nil, 1);
    self.m_prifileImage:getWidget().cache = true
    self.m_maskImage = new(Image, imageMask, nil, 1);
    self:setSize( self.m_maskImage:getSize() ); --让将源图片设置到遮罩一样的大小
end

Mask.renderMask= function (self)
    if self.m_prifileImage and self.m_maskImage then
        imageMask.applyToDrawing(self.m_prifileImage,{file = self.m_maskImage.m_res})
        self:addChild(self.m_prifileImage);
	end
end

Mask.getRealSize =function(self)
    return self.m_width*System.getLayoutScale(), 
        self.m_height*System.getLayoutScale();
end

Mask.setFile = function(self, ...)
    if self.m_prifileImage then
        self.m_prifileImage:setFile(...)
    end
end