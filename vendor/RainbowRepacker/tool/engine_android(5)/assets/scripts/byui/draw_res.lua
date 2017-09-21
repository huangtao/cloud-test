require('byui/utils')

local nvg = Nanovg(bit.bor(Nanovg.NVG_ANTIALIAS, Nanovg.NVG_DEBUG, Nanovg.NVG_STENCIL_STROKES))
local function nvg_node(size, draw)
    --local fbo = Widget()
    --fbo.background_color = Colorf.white
    --fbo.cache = true
    local w = LuaWidget()
    w.size = size
    local inst = LuaInstruction(function(self, canvas)
        nvg:begin_frame(canvas)
        draw(w, nvg)
        nvg:end_frame()
    end, true)

    w.lua_do_draw = function(self, canvas)
        canvas:add(inst)
    end
    --fbo:add(w)

    return w
end

local units = nil
return (function()
    if units == nil then
        units = {}
        local size = Point(512,512)
        local circle_r = 30
        local shadow_r = circle_r + 5
        local shadow_offset = Point(4,2)
        local editbox_size = Point(50, 20)
        local editbox_border = 1
        
        -- magnifier
        local magnifier_size = Point(100, 100)     
        
        -- delete icon 1
        local del_icon_1_size = Point(20, 20)    
        
        local circle_pos = Point(0,0)
        local shadow_pos = Point(circle_r * 2 + 2, 0)
        local editbox_pos = Point(shadow_pos.x + shadow_r * 2 + 2,0) 
        local editbox_pos2 = Point(editbox_pos.x ,editbox_size.y +2)
        local editbox_pos3 = Point(editbox_pos2.x ,2*(editbox_size.y +2))  
        local editbox_pos4 = Point(editbox_pos2.x ,3*(editbox_size.y +2)) 
        local magnifier_pos = Point(editbox_pos4.x + editbox_size.x + 2, 0)
        local del_icon_1_pos = Point(magnifier_pos.x + magnifier_size.x, 0)

        -- loading
        local loading_size = {Point(37,37),Point(22,22),Point(22,22)}
        local loading_pos = {Point(del_icon_1_pos.x+del_icon_1_size.x,0),Point(del_icon_1_pos.x+del_icon_1_size.x+38,0),Point(del_icon_1_pos.x+del_icon_1_size.x+61,0)}
        local count = 12

        

        local triangle_height = 20
        local triangle_pos = {Point(loading_pos[3].x+loading_size[3].x,0),Point(triangle_height + loading_pos[3].x+loading_size[3].x,0),
                                Point(triangle_height*2+loading_pos[3].x+loading_size[3].x,0),Point(triangle_height*2+loading_pos[3].x+loading_size[3].x,triangle_height)}
        local triangle_size = {Point(triangle_height,triangle_height*2),Point(triangle_height,triangle_height*2),
                                Point(triangle_height*2,triangle_height),Point(triangle_height*2,triangle_height)}
        
        -- samll magnifier
        local small_magnifier_size = Point(16, 16)
        local small_magnifier_pos  = Point(triangle_pos[3].x+triangle_size[3].x,0)
        -- radiobutton
        local radiobutton_r = 50
        local radiobutton_pos = Point(0,magnifier_size.y)
        local radiobutton_check_pos = Point(radiobutton_pos.x+radiobutton_r*2,magnifier_size.y)

        local arrow_size = Point(20,30)
        local arrow_pos = Point(radiobutton_check_pos.x + radiobutton_r*2,radiobutton_check_pos.y)
        local w = nvg_node(size, function(self, nvg)
            nvg:reset()
            nvg:translate(circle_pos)
            nvg:begin_path()
            nvg:circle(Point(circle_r, circle_r), circle_r);
            nvg:fill_color(Colorf.white)
            nvg:fill()
            --nvg:stroke_color(Colorf(0.8,0.8,0.8,1))
            --nvg:stroke()

            --nvg:reset()
            --nvg:translate(stroke_pos)
            --nvg:begin_path()
            --nvg:circle(Point(circle_r, circle_r), circle_r);
            --nvg:stroke_color(Colorf.black)
            --nvg:stroke()
            --nvg:fill_color(Colorf.white)
            --nvg:fill()

            -- shadow
            nvg:reset()
            nvg:translate(shadow_pos)
            local bg = nvg:radial_gradient(Point(shadow_r, shadow_r), 0, shadow_r, Colorf(1,1,1,0.7), Colorf(1,1,1,0))
            nvg:begin_path()
            nvg:path_winding(Nanovg.NVG_HOLE)
            nvg:circle(Point(shadow_r, shadow_r), shadow_r)
            nvg:circle(Point(circle_r, circle_r), circle_r)
            nvg:fill_paint(bg)
            nvg:fill()

            -- textedit box
            nvg:reset()
            nvg:translate(editbox_pos)
            nvg:begin_path()            
            nvg:rect(Rect(0, 0, editbox_size.x , editbox_size.y ))
            nvg:stroke_width(editbox_border+1)
            nvg:close_path()
            nvg:stroke_color(Colorf(0.5, 0.5, 0.5, 1))
            nvg:stroke()

            nvg:begin_path() 
            nvg:rect(Rect(editbox_border+1, editbox_border+1, editbox_size.x - editbox_border -1, editbox_size.y - editbox_border-1 ))
            nvg:stroke_width(editbox_border+2)
            nvg:close_path()
            nvg:stroke_color(Colorf(0.68, 0.68, 0.68, 1))
            nvg:stroke()


            -- textedit box2
            nvg:reset()
            nvg:translate(editbox_pos2)
            nvg:begin_path()            
            nvg:rect(Rect(editbox_border, editbox_border, editbox_size.x - 2*editbox_border , editbox_size.y - 2*editbox_border))
            nvg:stroke_width(editbox_border)
            nvg:close_path()
            nvg:stroke_color(Colorf(0.0, 0.0, 0.0, 1))
            nvg:stroke()

            -- textedit box3
            nvg:reset()
            nvg:translate(editbox_pos3)
            nvg:begin_path()            
            nvg:rounded_rect(Rect(editbox_border, editbox_border, editbox_size.x - 2*editbox_border , editbox_size.y - 2*editbox_border),editbox_border*6)
            nvg:close_path()
            nvg:fill_color(Colorf(0.65, 0.65, 0.65, 1))
            nvg:fill()
            nvg:begin_path()            
            nvg:rounded_rect(Rect(editbox_border+2, editbox_border+2, editbox_size.x - 6*editbox_border , editbox_size.y - 5*editbox_border),editbox_border*6)
            nvg:close_path()
            nvg:fill_color(Colorf(1.0, 1.0, 1.0, 1))
            nvg:fill()

            -- textedit box4
            nvg:reset()
            nvg:translate(editbox_pos4)
            nvg:begin_path()            
            nvg:rect(Rect(0, 0, editbox_size.x , editbox_size.y ))
            nvg:close_path()
            nvg:fill_color(Colorf(1.0, 1.0, 1.0, 1))
            nvg:fill()


            -- magnifier
            do
                local d = magnifier_size.x
                local r = d / 2 - 2
                local color = Colorf(0.8, 0.8, 0.8, 1.0)
                local sw = 0.5
                                
                nvg:reset()
                nvg:translate(magnifier_pos)
                nvg:begin_path()
                nvg:circle(Point(r + 1, r + 1), r)
                nvg:stroke_color(color)
                nvg:stroke_width(1)
                nvg:stroke()
                
                --nvg:begin_path()
                --nvg:move_to(Point(r + 1 + r / math.sqrt(2), r + 1 + r / math.sqrt(2)))
                --nvg:line_to(magnifier_size)
                --nvg:stroke_color(color)
                --nvg:stroke_width(sw)
                --nvg:stroke()                
            end
            
            -- delete icon 1
            do
                -- parameters
                local inR_ratio = 0.6
                local sw = 2
            
                local center = Point(del_icon_1_size.x / 2, del_icon_1_size.y / 2)  
                local r = del_icon_1_size.x / 2 - 1
                local inR = r * inR_ratio
                local ix = inR / math.sqrt(2)
                local color = Colorf(0.8, 0.8, 0.8, 0.8)
                local sx = sw / math.sqrt(2) / 2
                
                nvg:reset()
                nvg:translate(del_icon_1_pos)
                nvg:begin_path()
                nvg:circle(center, r)

                nvg:move_to(Point(center.x - ix - sx, center.y - ix + sx))                
                nvg:line_to(Point(center.x - ix + sx, center.y - ix - sx))
                nvg:line_to(Point(center.x, center.y - sx))
                
                nvg:line_to(Point(center.x + ix - sx, center.y - ix - sx))
                nvg:line_to(Point(center.x + ix + sx, center.y - ix + sx))
                nvg:line_to(Point(center.x + sx, center.y))
                
                nvg:line_to(Point(center.x + ix + sx, center.y + ix - sx))
                nvg:line_to(Point(center.x + ix - sx, center.y + ix + sx))
                nvg:line_to(Point(center.x, center.y + sx))
                
                nvg:line_to(Point(center.x - ix + sx, center.y + ix + sx))
                nvg:line_to(Point(center.x - ix - sx, center.y + ix - sx))
                nvg:line_to(Point(center.x - sx, center.y))
                
                nvg:line_to(Point(center.x - ix - sx, center.y - ix + sx))
                nvg:path_winding(Nanovg.NVG_HOLE)
                
                nvg:fill_color(color)
                nvg:fill()
            end

            -- loading White Large
            do 
                for i=0,count do
                    nvg:reset()
                    local a0 = i / count * math.pi * 2.0    
                    local c = i  / count + 0.04
                    nvg:translate(loading_pos[1])
                    nvg:translate(Point(loading_size[1].x/2, loading_size[1].y/2))
                    nvg:rotate(a0)
                    nvg:translate(Point(-loading_size[1].x/2, -loading_size[1].y/2))
                    nvg:begin_path()
                    nvg:rounded_rect(Rect(0,loading_size[1].y*7/16,loading_size[1].x/4,loading_size[1].y/8), loading_size[1].x/16)
                    nvg:fill_color(Colorf(1.0,1.0,1.0,c))
                    nvg:fill()
                end
            end

            -- loading White 
            do 
                for i=0,count do
                    nvg:reset()
                    local a0 = i / count * math.pi * 2.0    
                    local c = (i + 1 ) / (count +1)
                    nvg:translate(loading_pos[2])
                    nvg:translate(Point(loading_size[2].x/2, loading_size[2].y/2))
                    nvg:rotate(a0)
                    nvg:translate(Point(-loading_size[2].x/2, -loading_size[2].y/2))
                    nvg:begin_path()
                    nvg:rounded_rect(Rect(0,loading_size[2].y*7/16,loading_size[2].x/4,loading_size[2].y/8), loading_size[2].x/16)
                    nvg:fill_color(Colorf(1.0,1.0,1.0,c))
                    nvg:fill()
                end
            end

            -- loading Gray 
            do 
                for i=0,count do
                    nvg:reset()
                    local a0 = i / count * math.pi * 2.0    
                    local c = (i + 1 ) / (count +1)
                    nvg:translate(loading_pos[3])
                    nvg:translate(Point(loading_size[3].x/2, loading_size[3].y/2))
                    nvg:rotate(a0)
                    nvg:translate(Point(-loading_size[3].x/2, -loading_size[3].y/2))
                    nvg:begin_path()
                    nvg:rounded_rect(Rect(0,loading_size[3].y*7/16,loading_size[3].x/4,loading_size[3].y/8), loading_size[3].x/16)
                    nvg:fill_color(Colorf(0.5,0.5,0.5,c))
                    nvg:fill()
                end
            end

            -- radiobutton normal
            do 
                nvg:reset()
                nvg:translate(radiobutton_pos)
                local bg2 =nvg:linear_gradient(Point(radiobutton_r,0), Point(radiobutton_r,radiobutton_r*4/3),  Colorf(1,1,1,1.0), Colorf(0.6,0.6,0.6,0.7))
                nvg:begin_path()
                nvg:circle(Point(radiobutton_r,radiobutton_r), radiobutton_r -2)
                nvg:fill_paint(bg2)
                nvg:fill()

                local bg = nvg:box_gradient(Rect(1,1,2*radiobutton_r, 2*radiobutton_r),3,3, Colorf(0,0,0,32/255), Colorf(1,1,1,92/255))

                nvg:begin_path()
                nvg:stroke_width(2.5)
                nvg:circle(Point(radiobutton_r,radiobutton_r), radiobutton_r -2)
                nvg:stroke_color(Colorf(0,0,0,92/255))
                nvg:stroke()
            end

            -- radiobutton check
            do 
                nvg:reset()
                nvg:translate(radiobutton_check_pos)
                local bg =nvg:linear_gradient(Point(0,0), Point(radiobutton_r*2,radiobutton_r*4/3), Colorf(0.6,0.6,0.6,0.7),  Colorf(1,1,1,1.0))
                nvg:begin_path()
                nvg:circle(Point(radiobutton_r,radiobutton_r), radiobutton_r -2)
                nvg:fill_paint(bg)
                nvg:fill()

                nvg:begin_path()
                nvg:stroke_width(2.5)
                nvg:circle(Point(radiobutton_r,radiobutton_r), radiobutton_r - 2)
                nvg:stroke_color(Colorf(0,0,0,128/255))
                nvg:stroke()

                local bg2 =nvg:linear_gradient(Point(0,0), Point(radiobutton_r*2,radiobutton_r*2),  Colorf(0,0,0,1.0), Colorf(0.6,0.6,0.6,0.7))
                nvg:begin_path()
                nvg:circle(Point(radiobutton_r,radiobutton_r), radiobutton_r*0.3)
                nvg:fill_paint(bg2)
                nvg:fill()
            end

            -- do triangle 
            do
                -- draw left triangle
                nvg:reset()
                nvg:translate(triangle_pos[1])

                nvg:begin_path()
                nvg:move_to(Point(triangle_height,0))
                nvg:line_to(Point(0,triangle_height))
                nvg:line_to(Point(triangle_height,triangle_height*2))
                -- nvg:line_to(Point(0,0))
                nvg:close_path()
                nvg:fill_color(Colorf.white)
                nvg:fill()

                -- draw right triangle
                nvg:reset()
                nvg:translate(triangle_pos[2])

                nvg:begin_path()
                nvg:move_to(Point(0,0))
                nvg:line_to(Point(0,triangle_height*2))
                nvg:line_to(Point(triangle_height,triangle_height))
                nvg:line_to(Point(0,0))
                nvg:close_path()
                nvg:fill_color(Colorf.white)
                nvg:fill()

                -- draw top triangle
                nvg:reset()
                nvg:translate(triangle_pos[3])

                nvg:begin_path()
                nvg:move_to(Point(0,triangle_height))
                nvg:line_to(Point(triangle_height*2,triangle_height))
                nvg:line_to(Point(triangle_height,0))
                nvg:line_to(Point(0,triangle_height))
                nvg:close_path()
                nvg:fill_color(Colorf.white)
                nvg:fill()

                -- draw top triangle
                nvg:reset()
                nvg:translate(triangle_pos[4])

                nvg:begin_path()
                nvg:move_to(Point(0,0))
                nvg:line_to(Point(triangle_height*2,0))
                nvg:line_to(Point(triangle_height,triangle_height))
                nvg:line_to(Point(0,0))
                nvg:close_path()
                nvg:fill_color(Colorf.white)
                nvg:fill()


            end
            -- small_magnifier
            do
                local d = small_magnifier_size.x * (0.75)
                local r = d / 2
                local color = Colorf(0.0, 0.0, 0.0, 1.0)
                local sw = 0.5
                                
                nvg:reset()
                nvg:translate(small_magnifier_pos)
                nvg:begin_path()
                nvg:circle(Point(r + 1, r + 1), r)
                nvg:stroke_color(color)
                nvg:stroke_width(sw)
                nvg:stroke()
                
                nvg:begin_path()
                nvg:move_to(Point(r + 1 + r / math.sqrt(2), r + 1 + r / math.sqrt(2)))
                nvg:line_to(small_magnifier_size)
                nvg:stroke_color(color)
                nvg:stroke_width(sw)
                nvg:stroke()                
            end

            do
                local color = Colorf(0.0, 0.0, 0.0, 1.0)
                local sw = 0.5

                nvg:reset()
                nvg:translate(arrow_pos)
                nvg:begin_path()
                nvg:move_to(Point(arrow_size.x/2,arrow_size.y))
                nvg:line_to(Point(0,arrow_size.y - arrow_size.x/2))
                nvg:stroke_color(color)
                nvg:stroke_width(sw)
                nvg:stroke()

                nvg:begin_path()
                nvg:move_to(Point(arrow_size.x/2,arrow_size.y))
                nvg:line_to(Point(arrow_size.x,arrow_size.y -arrow_size.x/2))
                nvg:stroke_color(color)
                nvg:stroke_width(sw)
                nvg:stroke()

                nvg:begin_path()
                nvg:move_to(Point(arrow_size.x/2,0))
                nvg:line_to(Point(arrow_size.x/2,arrow_size.y))
                nvg:stroke_color(color)
                nvg:stroke_width(sw)
                nvg:stroke()
            end
        end)
        
        local fbo = FBO.create(size)
        --fbo.clear_color = Colorf(1,1,1,1)
        fbo.need_stencil = true
        fbo:render(w)
        -- fbo:save('output.png')
        local t = fbo.texture
        t.pre_alpha = true
        units.circle = TextureUnit(t)
        units.circle.rect = Rect(circle_pos.x, circle_pos.y, circle_r * 2, circle_r * 2)
        units.shadow = TextureUnit(fbo.texture)
        units.shadow.rect = Rect(shadow_pos.x, shadow_pos.y, shadow_r * 2, shadow_r * 2)
        units.editbox = TextureUnit(fbo.texture)
        units.editbox.rect = Rect(editbox_pos.x, editbox_pos.y, editbox_size.x, editbox_size.y)
        units.magnifier = TextureUnit(fbo.texture)
        units.magnifier.rect = Rect(magnifier_pos.x + 1, magnifier_pos.y + 1, magnifier_size.x - 2, magnifier_size.y - 2)
        units.del_icon_1 = TextureUnit(fbo.texture)
        units.del_icon_1.rect = Rect(del_icon_1_pos.x, del_icon_1_pos.y, del_icon_1_size.x, del_icon_1_size.y)
        units.loading_white_large = TextureUnit(fbo.texture)
        units.loading_white_large.rect = Rect(loading_pos[1].x, loading_pos[1].y, loading_size[1].x , loading_size[1].y)
        units.loading_white = TextureUnit(fbo.texture)
        units.loading_white.rect = Rect(loading_pos[2].x, loading_pos[2].y, loading_size[2].x , loading_size[2].y)
        units.loading_gray = TextureUnit(fbo.texture)
        units.loading_gray.rect = Rect(loading_pos[3].x, loading_pos[3].y, loading_size[3].x , loading_size[3].y)
        units.radiobutton_uncheck = TextureUnit(fbo.texture)
        units.radiobutton_uncheck.rect = Rect(radiobutton_pos.x,radiobutton_pos.y,radiobutton_r * 2,radiobutton_r * 2)
        units.radiobutton_check = TextureUnit(fbo.texture)
        units.radiobutton_check.rect = Rect(radiobutton_check_pos.x,radiobutton_check_pos.y,radiobutton_r * 2,radiobutton_r * 2)


        units.left_triangle = TextureUnit(fbo.texture)
        units.left_triangle.rect = Rect(triangle_pos[1].x,triangle_pos[1].y,triangle_size[1].x,triangle_size[1].y)
        units.right_triangle = TextureUnit(fbo.texture)
        units.right_triangle.rect = Rect(triangle_pos[2].x,triangle_pos[2].y,triangle_size[2].x,triangle_size[2].y)
        units.top_triangle = TextureUnit(fbo.texture)
        units.top_triangle.rect = Rect(triangle_pos[3].x,triangle_pos[3].y,triangle_size[3].x,triangle_size[3].y)
        units.bottom_triangle = TextureUnit(fbo.texture)
        units.bottom_triangle.rect = Rect(triangle_pos[4].x,triangle_pos[4].y,triangle_size[4].x,triangle_size[4].y)
       

        units.editbox_style_bezel = TextureUnit(fbo.texture)
        units.editbox_style_bezel.rect = Rect(editbox_pos.x, editbox_pos.y, editbox_size.x, editbox_size.y)
        units.editbox_style_line = TextureUnit(fbo.texture)
        units.editbox_style_line.rect = Rect(editbox_pos2.x, editbox_pos2.y, editbox_size.x, editbox_size.y)
        units.editbox_style_rounded_rect = TextureUnit(fbo.texture)
        units.editbox_style_rounded_rect.rect = Rect(editbox_pos3.x, editbox_pos3.y, editbox_size.x, editbox_size.y)
        units.editbox_style_none = TextureUnit(fbo.texture)
        units.editbox_style_none.rect = Rect(editbox_pos4.x, editbox_pos4.y, editbox_size.x, editbox_size.y)

        units.small_magnifier = TextureUnit(fbo.texture)
        units.small_magnifier.rect = Rect(small_magnifier_pos.x,small_magnifier_pos.y,small_magnifier_size.x,small_magnifier_size.y)

        units.arrow = TextureUnit(fbo.texture)
        units.arrow.rect = Rect(arrow_pos.x,arrow_pos.y,arrow_size.x,arrow_size.y)
    end
    return units
end)()
