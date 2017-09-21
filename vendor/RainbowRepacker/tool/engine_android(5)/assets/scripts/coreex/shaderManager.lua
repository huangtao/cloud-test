--region ShaderManager.lua
--Author : KimWang （用单例有什么意义。。。。。。）
--Date   : 2015/6/26
--这个类使用管理各种Shader
ShaderManager = {};

--Shader类型
ShaderManager.SHADER_BLUR  = "blur";    --模糊
ShaderManager.SHADER_FLASH = "flash";   --扫光
ShaderManager.SHADER_FROST = "frost";   --冰冻
ShaderManager.SHADER_MIRROR = "mirror"  --镜像

--扫光
ShaderManager.FLASH_DIRECTION_TO_RIGHTTOP = 0;      --光线由左下向右上方向移动
ShaderManager.FLASH_DIRECTION_TO_LEFTDOWN = 1;      --光线由右上向左下方向移动

--镜像
ShaderManager.MIRROR_HORIZONTAL_VERTICAL    = 0;--水平并垂直反转 
ShaderManager.MIRROR_HORIZONTAL             = 1;--水平翻转
ShaderManager.MIRROR_VERTICAL               = 2--垂直翻转


--为了兼容不要这样调用
--直接用ShaderManger.addShader();
ShaderManager.getInstance = function()
    return ShaderManager;
end


--[Commont]
--drawing:需要操作对象该对象必须是DrawingImage的子类
--shader:shader的名字
--param:对应shader的参数
--说明:shader不能进行叠加，如果多次调用addShader，最近addShader会覆盖上次的addShader
ShaderManager.addShader = function(drawing,shader,param)
    if drawing ~= nil and typeof(drawing, DrawingBase) then
        if shader ~= nil and ShaderManager.__shaderFuncMap[shader] ~= nil then
            ShaderManager.__removeShaderAnim(drawing);
            ShaderManager.__shaderFuncMap[shader](drawing,param);
        end
    end
end

--移除shader
ShaderManager.removeShader = function(drawing)
    if drawing ~= nil then
        ShaderManager.__removeShaderAnim(drawing);  --如果有动画，即先移除动画
        local commons = require("libEffect/shaders/common");
        commons.removeEffect(drawing);
    end
end

--模糊
ShaderManager.addBlur = function(drawing, param)
    if drawing ~= nil and typeof(drawing, DrawingBase) then
        ShaderManager.__removeShaderAnim(drawing);
        param = param or {};
        local intensity = param.intensity;
        local blurShader = require("libEffect/shaders/blur");
        blurShader.applyToDrawing(drawing, {intensity = intensity});
    end
end

--用来做本分模糊
ShaderManager.getPartBlurNode = function(img,intens,ratio,rectX,rectY,rectW,rectH)

    local function gc_userdata (ud)
        ud:__gc()
        setudmetatable(ud, {})
    end

   local texUnit = img:getWidget().unit:copy()
    
    local sizeX,sizeY = img:getSize()
     
    texUnit.rect = Rect(rectX/sizeX*texUnit.size.x, rectY/sizeY*texUnit.size.y,rectW/sizeX*texUnit.size.x,rectH/sizeY*texUnit.size.y)

    local n = new(Node)
    local s = n:getWidget()

    s.unit = texUnit

    gc_userdata(texUnit)
  
    n:setSize(rectW,rectH)
    n:setPos(rectX,rectY)

    img:addChild(n);
    local blur = require("libEffect.shaders.blur")
    blur.applyToDrawing(n,{intensity = intens,ratio = ratio})
    return n
end

ShaderManager.removeBlur = function(drawing)
    if drawing ~= nil then
        ShaderManager.__removeShaderAnim(drawing);  --如果有动画，即先移除动画
        local blur = require("libEffect/shaders/blur");
        blur.removeBlurEffect(drawing);
    end
end

--扫光
ShaderManager.addFlash = function(drawing, param)
    if drawing ~= nil and typeof(drawing, DrawingBase) then
        ShaderManager.__removeShaderAnim(drawing);
        param = param or {};
        
        local flashShader = require("libEffect/shaders/flash");
        flashShader.applyToDrawing(drawing, param);
        
        --如果count不等于0，则表示有动画，count大于0，则表示动画播放count次，如果count < 0，则表示动画无限播放
        if param.animType ~= nil then
            local count = param.count or 1;
            local curCount = 0;
            
            local period = param.duration or 1000;
            local step = math.floor(period * 1.0 / 1000 * 128);
            local min,max = flashShader.getPositionRange(); --获取范围
            local stepValue = (max - min) * 1.0 / step;
            
            local direction = param.direction or ShaderManager.FLASH_DIRECTION_TO_RIGHTTOP;
            stepValue = ShaderManager.__getSymbolByDirection(direction) * math.abs(stepValue);

            local animType = param.animType or kAnimRepeat;
            
            local anim = new(AnimInt,kAnimRepeat,0,1,(period / step),0);
            ShaderManager.__addShaderAnim(drawing, anim);
            anim:setEvent(nil, function ()
                local position = flashShader.getPosition(drawing) + stepValue;
                if position > max or position < min then
                    curCount = curCount + 1;
                    if animType ~= kAnimLoop then
                        position = (position > max) and min or max;
                    else
                        position = (position > max) and max or min;
                        direction = ShaderManager.__changeDirection(direction);
                        stepValue = ShaderManager.__getSymbolByDirection(direction) * math.abs(stepValue);
                    end
                end

                flashShader.setPosition(drawing,position);
                
                if animType == kAnimNormal and curCount >= 1 then
                    ShaderManager.__removeShaderAnim(drawing);
                else 
                    if count > 0 and curCount >= count then
                        ShaderManager.__removeShaderAnim(drawing);
                    end
                end
            end)
        end
    end
end


--冰冻
ShaderManager.addFrost = function(drawing, param)
    if drawing ~= nil and typeof(drawing, DrawingBase) then
        ShaderManager.__removeShaderAnim(drawing);
        param = param or {};
        local offset = param.offset;
        local frostShader = require("libEffect/shaders/frost");
        frostShader.applyToDrawing(drawing, offset);
    end
end


--镜像
ShaderManager.addMirror = function(drawing, param)
    if drawing ~= nil and typeof(drawing, DrawingBase) then
        ShaderManager.__removeShaderAnim(drawing);
        param = param or {};
        local mirrorType = param.mirrorType or ShaderManager.MIRROR_HORIZONTAL_VERTICAL;
        if mirrorType == ShaderManager.MIRROR_HORIZONTAL_VERTICAL then
            drawing:setMirror(true, true);
        elseif mirrorType == ShaderManager.MIRROR_HORIZONTAL then
            drawing:setMirror(true, false);
        else
            drawing:setMirror(false, true);
        end
    end
end



ShaderManager.__changeDirection = function(direction)
    local ret = ShaderManager.FLASH_DIRECTION_TO_RIGHTTOP;
    if direction == ShaderManager.FLASH_DIRECTION_TO_RIGHTTOP then
        ret = ShaderManager.FLASH_DIRECTION_TO_LEFTDOWN;
    end
    return ret;
end


ShaderManager.__getSymbolByDirection = function(direction)
 local ret = -1;
    if direction == ShaderManager.FLASH_DIRECTION_TO_RIGHTTOP then
        ret = 1;
    end
    return ret;
end

--动态将drawing中dtor修改为先释放anim再调用原来的dtor
ShaderManager.__addShaderAnimDtor = function(drawing)
    if drawing ~= nil and drawing.__shaderAnimDtor == nil then
        drawing.__shaderAnimDtor = drawing.dtor;
        drawing.dtor = function(drawing)
            ShaderManager.__removeShaderAnim(drawing);
            drawing.__shaderAnimDtor(drawing); 
        end
    end
end

ShaderManager.__addShaderAnim = function(drawing, anim)
    if drawing ~= nil and anim ~= nil then
        ShaderManager.__addShaderAnimDtor(drawing);
        ShaderManager.__removeShaderAnim(drawing);
        drawing.__shaderAnim = anim;
    end
end

ShaderManager.__removeShaderAnim = function(drawing)
    if drawing ~= nil and drawing.__shaderAnim ~= nil then
        delete(drawing.__shaderAnim);
        drawing.__shaderAnim = nil;
    end
end

ShaderManager.__shaderFuncMap = {
    [ShaderManager.SHADER_BLUR]                    = ShaderManager.addBlur,
    [ShaderManager.SHADER_FLASH]                   = ShaderManager.addFlash,
    [ShaderManager.SHADER_FROST]                   = ShaderManager.addFrost,
    [ShaderManager.SHADER_MIRROR]                  = ShaderManager.addMirror,
}
--endregion
