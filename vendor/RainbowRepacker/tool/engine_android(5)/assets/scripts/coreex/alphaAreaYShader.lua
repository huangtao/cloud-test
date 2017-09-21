local fs = [=[
        #ifdef GL_ES
            precision highp float;
        #endif
        uniform sampler2D texture;

        uniform float start_y;
        uniform float end_y;
        
        varying vec3 varyTexCoord;
        varying vec4 varyColor;
        varying vec4 varyColorOffset;

        void main()
        {   
            vec2 uv = varyTexCoord.xy;
            vec4 color = texture2D(texture, varyTexCoord.xy);         
            gl_FragColor = color * varyColor + varyColorOffset;         
            if(uv.y <= start_y || uv.y >= end_y) 
                gl_FragColor = vec4(0.0,0.0,0.0,0.0);
            else
                gl_FragColor.a = smoothstep(start_y,end_y,uv.y);
                gl_FragColor.rgb *= gl_FragColor.a;
        }
    ]=];

local shader = -1;

local function get_alphaArea_shader()
    if shader == -1 then
        local vs, _, uniforms = unpack(ShaderRegistry.instance().default_desc)
        table.insert(uniforms, {'start_y', gl.GL_FLOAT, 1, Shader.uniform_value_float(0)})
        table.insert(uniforms, {'end_y', gl.GL_FLOAT, 1, Shader.uniform_value_float(1)})
        shader = ShaderRegistry.instance():register_shader_desc{
            vs, fs, uniforms
        }
    end
    return shader
end

return	get_alphaArea_shader()