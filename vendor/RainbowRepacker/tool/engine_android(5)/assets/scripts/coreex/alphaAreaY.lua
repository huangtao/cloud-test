local ShaderInfo = require("libEffect.shaders.internal.shaderInfo")
local Common = require("libEffect.shaders.common")
local shader = require("coreex.alphaAreaYShader")

local effectName = 'alphaAreaY'

local alphaAreaY = {};


alphaAreaY.applyToDrawing = function(drawing, startY, endY)
    if drawing:getWidget() == nil then
         return drawing
    end
    
    if not typeof(drawing, DrawingImage) then 
        error("The type of `drawing' should be DrawingImage.")
    end

    if not (startY and endY) then
        error("the startY and endY should not nil");
    end

    Common.removeEffect(drawing)

    drawing:getWidget().shader = shader
    drawing:getWidget():set_uniform("start_y",Shader.uniform_value_float(startY))
    drawing:getWidget():set_uniform("end_y",Shader.uniform_value_float(endY))
end


return alphaAreaY;


