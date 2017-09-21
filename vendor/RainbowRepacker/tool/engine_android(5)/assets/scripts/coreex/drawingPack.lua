local function gc_userdata (ud)
    ud:__gc()
    setudmetatable(ud, {})
end


DrawingPack = class();

DrawingPack.getInstance = function()
    if not DrawingPack.s_instance then
        DrawingPack.s_instance = new(DrawingPack);
    end

    return DrawingPack.s_instance;
end

DrawingPack.recoverDrawingState = function(self, drawing)
    if drawing and typeof(drawing, DrawingBase) then
        self:__hideOrShow(drawing, true);
    end
end

-- @brief 将此drawing(及其下所有子drawing)进行一次截图操作，生成一整张合并后的新图片。图片的属性和drawing的保持一致
-- @param drawing 需要截图的根节点
-- @param isOptimization 隐藏此drawing及其他所有的子drawing(此隐藏操作不会改变visible属性),只是减少openGL底层的绘制操作
--                       但进行此操作后，对drawing及子drawing进行的任何操作都不会生效(除addchild外)，除非调用recoverDrawingState
DrawingPack.packDrawing = function(self, drawing, isOptimization)
    if not ( drawing and typeof(drawing, DrawingBase) ) then
        return;
    end
    
    self:recoverDrawingState(drawing);

    local img = self:__createPackImage(drawing);

    if isOptimization then
        self:__hideOrShow(drawing, false);
    end

    return img;
end

DrawingPack.__createPackImage = function(self,drawing)
    local newW, newH = self:__getPackImageSize(drawing);

    local img = new(Node)

    local fbo = FBO.create(Point(newW,newH))

    fbo:render(drawing:getWidget())

    local tex = fbo.texture

    local texUnit = TextureUnit(tex)

    --TextureCache.instance():dump()

    img:getWidget().unit = texUnit
    img:setSize( drawing:getSize() );
    img:setPos( drawing:getPos() );
    --img:setAlign( drawing:getAlign() );
    img:setFillParent( drawing:getFillParent() );
    img:setFillRegion( drawing:getFillRegion() );




    gc_userdata(fbo)
    gc_userdata(tex)
    gc_userdata(texUnit)

    --[[Clock.instance():schedule_once(function ()
        TextureCache.instance():dump()
end,0.5)]]

    return img;


end

DrawingPack.__getPackImageSize = function(self, drawing)
    local screenW = System.getScreenWidth();
    local screenH = System.getScreenHeight();
    local realW, realH = drawing:getRealSize();
    local newW = math.max(realW, screenW);
    local newH = math.max(realH, screenH);

    return newW, newH;
end

DrawingPack.__hideOrShow = function(self, drawing, show)
    drawing_set_force_hide(drawing.m_drawingID, show and 0 or 1);
    local children = drawing:getChildren();
    if children then 
        for i,child in pairs(children) do
            self:__hideOrShow(child, show);
        end
    end
end
