-- 更新区域的问题                                   **修改刷新规则，监听如果有size则脏区域为size 否则为全屏 （动画超出边界的类型应该不需要设置size）
-- particleSystem位置不对 & 第一帧和刷新的位置不对   **改 particleSystem 本身的顶点位置 + imgsize
-- particleSystem forevertype 渲染不出              **paticleSystem self.m_isPaused 错误 
-- vertexBuilder提取                                **g.dirty = true
-- optimize：                                       **resTable保留不要每次重建
                                                    --顶点索引更新不刷新绘制
                                                    --替换table.insert
                                                    --for循环函数local在外面

--local inspect = require("inspect")

local drawingTable = {}
local packs = struct.pack
local unpacks = struct.unpack 
local len = string.len
local sizes = struct.size

drawing_create_image2 = drawing_create_image;
anim_set_event2 = anim_set_event;
drawing_set_touchable2 = drawing_set_touchable;
drawing_set_dragable2 = drawing_set_dragable;

res_create_double_array2 = res_create_double_array;
res_create_int_array2 = res_create_int_array;
res_create_ushort_array2 = res_create_ushort_array;
res_set_double_array2 = res_set_double_array;
res_set_int_array2 = res_set_int_array;
res_set_ushort_array2 = res_set_ushort_array;

kRenderPoints = gl.GL_POINTS
kRenderLines = gl.GL_LINES
kRenderLineLoop = gl.GL_LINE_LOOP
kRenderLineStrip = gl.GL_LINE_STRIP
kRenderTriangles = gl.GL_TRIANGLES
kRenderTriangleStrip = gl.GL_TRIANGLE_STRIP
kRenderTriangleFan = gl.GL_TRIANGLE_FAN

kResTypeFloatArray = 61
kResTypeIntArray = 63
kResTypeUshortArray = 65

local function getResData(buffer,dataType,resTable)
    
    local dataTypeChar = nil;

    if dataType == kResTypeFloatArray then
        dataTypeChar = "f"
    elseif dataType == kResTypeIntArray then
        dataTypeChar = "In"
    elseif dataType == kResTypeUshortArray then
        dataTypeChar = "H"
    end

    local length = len(buffer)
    local size = sizes(dataTypeChar)

    
    
    local pos = 1    
    
    local loop = length/size

    for i = 1, loop do
       local f = nil
       f, pos = unpacks(dataTypeChar, buffer, pos)
       resTable[i] = f
    end
    
    return resTable
end


local function initWidget(drawingId,renderType)   
    local drawing = {}

    drawingTable[drawingId] = drawing
    drawingTable[drawingId].resIdTable = {}

    drawing.drawingId = drawingId
    
    local pos = drawing_get_position(drawing.drawingId)

    local size = drawing_get_size(drawing.drawingId)

    drawing.updateScreen = 0

    if size[1] == 0 or size[2] == 0 then
        size[1] = System:getScreenWidth()
        size[2] = System:getScreenHeight()
        drawing.updateScreen = 1
    end

    drawing.widget = LuaWidget()

    drawing.widget.pos = Point(unpack(pos))

    drawing.widget.size = Point(unpack(size))

    drawing.widget.relative = true

    local oriWidget = Widget.get_by_id(drawing.drawingId)

    if oriWidget.parent then
        oriWidget.parent:add(drawing.widget,oriWidget)

        for i = 1, #oriWidget.children do
            drawing.widget:add(oriWidget.children[i])
        end  
    end

    oriWidget:cleanup()

    drawing.widget:setId(drawing.drawingId) 

    
    drawing.vertex   = {}
    drawing.index    = {}
    drawing.texcoord = {}
    drawing.color = {}

    drawing.textureUnit = TextureUnit.default_unit()

    drawing.widget.on_cleanup = function (self)
        drawingTable[drawing.widget:getId()] = nil
    end

    drawing.widget.on_color_changed = function (self)  
       drawing.g.dirty = true 
    end

    drawing.on_size_changed = function (self)
        if self.size.x ~=0 and self.m_size.y ~=0 then
            drawing.updateScreen = 0
        end
    end
    
    drawing.g = LuaVertexBuilder(VBO.default_format_id(),renderType or kRenderTriangleStrip,function ()
        local vertex = {}
        local index = drawing.index

        if #drawing.color == 0 then
            for i = 1 ,#drawing.vertex/2 do
                drawing.color[(i - 1) * 4 +1] = 1 
                drawing.color[(i - 1) * 4 +2] = 1 
                drawing.color[(i - 1) * 4 +3] = 1 
                drawing.color[(i - 1) * 4 +4] = 1 
            end
        elseif #drawing.color/4 < #drawing.vertex/2 then
            for i = #drawing.color/4 + 1 ,#drawing.vertex/2 do
                drawing.color[(i - 1) * 4 +1] = 1 
                drawing.color[(i - 1) * 4 +2] = 1 
                drawing.color[(i - 1) * 4 +3] = 1 
                drawing.color[(i - 1) * 4 +4] = 1 
            end
        end
        
        for i = 1 ,#drawing.vertex/2 do
            vertex[i] = packs("ffffffffffffff",drawing.vertex[(i - 1) * 2 + 1],
                                               drawing.vertex[(i - 1) * 2 + 2], 
                                               0,
                                                   drawing.texcoord[(i - 1) * 2 + 1],
                                                   drawing.texcoord[(i - 1) * 2 + 2],
                                                   1,
                                                       drawing.color[(i - 1) * 4 +1] * drawing.widget.display_color.r,
                                                       drawing.color[(i - 1) * 4 +2] * drawing.widget.display_color.g,
                                                       drawing.color[(i - 1) * 4 +3] * drawing.widget.display_color.b,
                                                       drawing.color[(i - 1) * 4 +4] * drawing.widget.display_color.a,
                                                           0,0,0,0)
        end  
        return vertex,index
    end)  
        

    drawing.widget.lua_do_draw = function (self,canvas)
        canvas:add(BindTexture(drawing.textureUnit.texture,0))
        canvas:add(drawing.g)
    end
    
end


function drawing_set_node_renderable(iDrawingId,renderType,__)
    if drawingTable[iDrawingId] == nil then
        initWidget(iDrawingId,renderType)  --switch renderType
    end
end

function drawing_set_node_texture(iDrawingId,iResIdBitmap, iResDoubleArrayIdTextureCoord )
    if drawingTable[iDrawingId] == nil then
        initWidget(iDrawingId,kRenderTriangles)         
    end

    drawingTable[iDrawingId].textureUnit = TextureUnit.get_by_id(iResIdBitmap)
    table.insert(drawingTable[iDrawingId].resIdTable,iResDoubleArrayIdTextureCoord) 
   
    res_listen_buffer(iResDoubleArrayIdTextureCoord, kResTypeFloatArray, function(buf)
        getResData(buf,kResTypeFloatArray,drawingTable[iDrawingId].texcoord)
       
        drawingTable[iDrawingId].g.dirty = true

        if drawingTable[iDrawingId].updateScreen == 0 then
            drawingTable[iDrawingId].widget:invalidate()
        else 
            Window.instance().drawing_root:invalidate()
        end
    end)
end

function drawing_set_node_vertex(iDrawingId,iResDoubleArrayIdVertex,iResUShortIdIndices )
    if drawingTable[iDrawingId] == nil then  
        initWidget(iDrawingId,kRenderTriangles)
    end
  
    table.insert(drawingTable[iDrawingId].resIdTable,iResDoubleArrayIdVertex) 

    res_listen_buffer(iResDoubleArrayIdVertex, kResTypeFloatArray, function(buf)
        getResData(buf,kResTypeFloatArray,drawingTable[iDrawingId].vertex)

        drawingTable[iDrawingId].g.dirty = true

        if drawingTable[iDrawingId].updateScreen == 0 then
            drawingTable[iDrawingId].widget:invalidate()
        else 
           Window.instance().drawing_root:invalidate()
        end
    end)

    table.insert(drawingTable[iDrawingId].resIdTable,iResUShortIdIndices) 

    res_listen_buffer(iResUShortIdIndices, kResTypeUshortArray, function(buf)
        getResData(buf,kResTypeUshortArray,drawingTable[iDrawingId].index)

        drawingTable[iDrawingId].g.dirty = true

        --if drawingTable[iDrawingId].updateScreen == 0 then
        --    drawingTable[iDrawingId].widget:invalidate()
        --else 
        --    Window.instance().drawing_root:invalidate()
        --end
    end)
end

function drawing_set_node_colors(iDrawingId,iResDoubleArrayIdColors )
	local drawing = drawingTable[iDrawingId]
    
    if drawing.widget == nil then
        initWidget(iDrawingId,kRenderTriangles)
    end

    table.insert(drawingTable[iDrawingId].resIdTable,iResDoubleArrayIdColors) 

    res_listen_buffer(iResDoubleArrayIdColors, kResTypeFloatArray, function(buf)
        getResData(buf,kResTypeFloatArray,drawingTable[iDrawingId].color)

        drawingTable[iDrawingId].g.dirty = true

        if drawingTable[iDrawingId].updateScreen == 0 then
            drawingTable[iDrawingId].widget:invalidate()
        else 
            Window.instance().drawing_root:invalidate()
        end
    end)
end