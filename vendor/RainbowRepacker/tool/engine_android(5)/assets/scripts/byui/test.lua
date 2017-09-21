local M = require('byui/basic')
-- local M = require('byui/tableview')
local layout = require('byui/layout')
local units = require('byui/draw_res')
local AutoLayout = require('byui/autolayout')

local function test(root)
    local btn_image = TextureUnit(TextureCache.instance():get('weixin.png'))
    local btn = M.Button{
        text = '你好吗',
        margin = {10,10,10,10},
        radius = 10,
        image = {
            normal = TextureUnit(TextureCache.instance():get('weixin.png')),
            down = Colorf.red,
            disabled = {
                unit = TextureUnit(TextureCache.instance():get('weixin.png')),
                t_border = {0,0,0,0},
            },
        },
        size = Point(200,50),
    }
    btn.pos = Point(100,100)
    local toggle = true
    function btn:on_click(p, time)
        if toggle then
            self.text ='变长长~~~~~~~~~~~~'
            toggle = false
        else
            self.text = '变短'
            toggle = true
            btn.enabled = false
        end
    end
    root:add(btn)

    local radio1 = M.RadioButton{
        size = Point(50,50),
        checked = false,
    }
    -- chkbox.t_border = {20,20,20,20}
    --radio1.v_border = {25,25,25,25}
    --chkbox.size = Point(50,100)
    function radio1:on_change()
        print('on change', self.checked)
    end
    
    root:add(radio1)
    local radio2 = M.RadioButton{
        size = Point(50,50),
        checked = false,
        radius = 0,
    }
    -- chkbox.t_border = {20,20,20,20}
    --radio2.v_border = {25,25,25,25}
    radio2.pos = Point(50,0)
    
    --chkbox.size = Point(50,100)
    function radio2:on_change()
        print('on change', self.checked)
    end
    root:add(radio2)
    local radioGroup = M.RadioGroup{}
    function radioGroup:on_change(id)
        print('radioGroup on change', id)
    end
    function radioGroup:on_child_add(value)
        print('radioGroup on child add', value)
    end
    function radioGroup:on_child_remove(value)
        print('radioGroup on child remove', value)
    end
    radio2.group = radioGroup
    radio1.group = radioGroup
    local btn2 = M.ToggleButton{
        image = {
            checked_enabled = {
                unit = TextureUnit(TextureCache.instance():get('weixin.png')),
                t_border = {0,0,0,0},
            },
            unchecked_enabled = Colorf.red,
            --checked_disabled = TextureUnit(TextureCache.instance():get('btn_green_2.png')),
            --unchecked_disabled = TextureUnit(TextureCache.instance():get('btn_green_2.png')),
        },
        text = '选项1',
        radius = 10,
        size = Point(200,50),
    }
    btn2.pos = Point(300,0)
    function btn2:on_change()
        print('on change', self.checked)
    end
    root:add(btn2)

    local btn = M.Switch{
        on = false,
        on_tint = Colorf.red,
        on_change = function(self, v)
            print('switch', v)
        end,
    }
    btn.pos = Point(100,150)
    root:add(btn)


end

local function test_slider(root)
    local s = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    function s:on_change()
        print('on change', s.value)
    end
    s.pos = Point(100,400)
    root:add(s)
    s.value = 1.0
    s.progress_bar.base_image =TextureUnit(TextureCache.instance():get("sliderBg.png"))
    s.thumb_image = TextureUnit(TextureCache.instance():get("sliderBtn.png"))
    s.maxinum_value = 100
    s.progress_bar.radius = 5
    -- local progressBar = M.ProgressBar{radius = 2,value = 0.5,size = Point(200,20)}
    -- progressBar.base_image = TextureUnit(TextureCache.instance():get("sliderBg.png"))
    -- Clock.instance():schedule(function ( ... )
    --         s.mininum_value = s.mininum_value -1
    -- end,1)
    -- root:add(progressBar)
end

local function test_switch(root)
    local s = M.Switch{
        on = false,
    }
    function s:on_change()
        print('on change', s.on)
    end
    s.pos = Point(100,400)
    root:add(s)
end

local function test_layers(root)
    local s = M.Layers{
        drag_direction = kDragToLeft,
        width = 500,
        height = 300,
        drag_length = 200,
    }
    s.pos = Point(100,400)

    --s.size = Point(300,400)
    local count = 0
    s:set_on_change_status_callback(function ( status)
        count = count +1
        print("count:",count)
        print("status:",status)
        print("status2:",s.show_status)
    end)
    local btn1 = M.Button{
       text = '这是前景',
       margin = {10,10,10,10},
       image = {
           normal = Colorf.green,
           down = Colorf.red,
           disabled = Colorf(0.2,0.2,0.2,1),
       },
       border = true,
       size = Point(200,50),
    }
    local btn2 = M.Button{
       text = '这是背景',
       margin = {10,10,10,10},
       image = {
           normal = Colorf(0.5,0.5,0.5,1.0),
           down = Colorf.red,
           disabled = Colorf(0.2,0.2,0.2,1),
       },
       border = true,
       size = Point(200,50),
    }
     function btn2:on_click(  )
        -- body
        s:show_foreground()
    end
    function btn1:on_click(  )
        -- body
        print("点别人去")
    end

    s.foreground_view = btn1
    s.background_view =btn2
    root:add(s)
end


local function test_tableview(root)
    local v;
    v = M.TableView{
        --dimension = kHorizental,
        row_height = 100,
        max_number = 200,
        item_length = function(self,i) 
        -- if i == 1 then
        --         return 400;
        --     end
            return 100;
        end,

        item_count = function(self,i)
            return 200
        end,


        item = function(self, i)
            print("load : " .. i);
            local c = Widget()
            c.width = 100
            c.height = 100
            local l = Label()
            l:set_rich_text(string.format('<font color=#ff0000>lucy %d</font>', i))
            c.background_color = Colorf.white
            c:add(l)

            local w = M.Switch{
                on = false,
                on_change = function(self, v)
                    print('switch', v)
                end,
            }
            w.need_capture = true
            w.pos = Point(100,10)
            c:add(w)

            local btn = M.Button{
                text = 'click me',
                image = {
                    normal = Colorf.green,
                    down = Colorf.red,
                    disabled = Colorf.black,
                },
                margin = {30,10,30,10},
                v_border = {10,10,10,10},

            }
            btn.pos = Point(230,20)
            function btn:on_click(self)
                    print("on_click")
                    v:reload_cell();
                end
            
            c:add(btn)
            c.cache = true
            c.clip = true
            return c
        end,
        create_top_view = function(self)
            local w = Widget()
            local l = Label()
            l:set_rich_text('top label hahaha')
            w:add(l)
            w.size = Point(1, 100)
            return w
        end,
        create_bottom_view = function(self)
            local l = Label()
            l:set_rich_text('bottom label hahaha')
            return l
        end,
        on_refresh = function(self)
            Clock.instance():schedule_once(function()
                self:cancel_refresh()
            end, 1)
        end,
        cell_spacing = 1,
        size = Point(root.width, root.height),
    }
    v.background_color = Colorf(0.6,0.6,0.6,1)
    root:add(v)
end

local function test_scrollview(root)
    local v = M.ScrollView{
        dimension = kVertical,
        -- event_phase = 'bubbling',
    }
    v.size = Point(300,300)
    local content = layout.FloatLayout{
        spacing = Point(10,10)
    }
    v.min_distance = Point(1,1)
    -- v.background_color = Colorf(1.0,1.0,1.0)
    content:add_rules(AutoLayout.rules.fill_parent)
    content.relative = true
    -- 
    root:add(v)
    v.content = content
    for i=1,10 do
        local s = Sprite(units.circle)
        s.size = Point(100,100)
        content:add(s)
    end
    content:add(M.Button{text='Button'})
    local s = M.Switch{}
    s.need_capture = true
    content:add(s)
    Clock.instance():schedule_once(function (  )
        local content = layout.FloatLayout{
        spacing = Point(10,10)
        }
        content.size = Point(500,500)
        content.relative = true
        for i=1,10 do
            local s = Sprite(units.left_triangle)
            s.size = Point(100,100)
            content:add(s)
        end
        v.content = content
    end,20)
end
local function test_loading( root )
    -- body
    local loading = M.Loading{
        style = 'white_large'
    }

    loading.pos = Point(200,150)
    --loading.colorf = Colorf(1.0,0.0,0.0,1.0)
    root.background_color = Colorf(0.8,0.8,0.8,1.0)
    root:add(loading)
    local btn1 = M.Button{
       text = '开始',
       margin = {10,10,10,10},
       image = {
           normal = Colorf.green,
           down = Colorf.red,
           disabled = Colorf(0.2,0.2,0.2,1),
       },
       border = true,
       size = Point(200,50),
    }
    local btn2 = M.Button{
       text = '停止',
       margin = {10,10,10,10},
       image = {
           normal = Colorf(0.5,0.5,0.5,1.0),
           down = Colorf.red,
           disabled = Colorf(0.2,0.2,0.2,1),
       },
       border = true,
       size = Point(200,50),
    }
    btn2.pos = Point(205,0)
    function btn1:on_click(  )
        -- body
        loading:start_animating()
    end
    function btn2:on_click(  )
        -- body
        loading:stop_animating()
    end
    
    local btn3 = M.Button{
       text = '切换风格',
       margin = {10,10,10,10},
       image = {
           normal = Colorf(0.5,0.5,0.5,1.0),
           down = Colorf.red,
           disabled = Colorf(0.2,0.2,0.2,1),
       },
       border = true,
       size = Point(200,50),
    }
    btn3.pos = Point(410,0)
    local count = 0
    function btn3:on_click(  )
        -- body
        count = (count+1)%3 
        if count == 0 then
            loading.style = 'white_large'
        elseif count ==1 then
            loading.style = 'white'
        else
            loading.style = 'gray'
        end
    end
    loading.hides_when_stopped =false
    root:add(btn1)
    root:add(btn2)
    root:add(btn3)
end

local function test_pageview(root)
    local page_view 
    page_view = M.PageView{
        dimension = kHorizental,
        max_number = 25,
        size = Point(root.width, root.height),
        --dimension = kHorizental,
        is_cache = true
    }
    root:add(page_view)
    -- Clock.instance():schedule_once(function ( ... )
        
    page_view.create_cell = function(self, i)
            local c = Widget()
            c.width = 100
            c.height = 100
            local l = Label()
            -- l:set_rich_text(string.format('<font color=#ff0000>lucy %d</font>', i))
            l:set_data{{
                text = "lucy "..i,
                size = i + 20,
                color = Color.red
            }}
            c.background_color = Colorf.white
            c:add(l)

            local w = M.Switch{
                on = false,
                on_change = function(self, v)
                    page_view.page_num = 199
                end,
            }
            w.need_capture = true
            w.pos = Point(100,100)
            c:add(w)

            local btn = M.Button{
                text = 'click me',
                image = {
                    normal = Colorf.green,
                    down = Colorf.red,
                    disabled = Colorf.black,
                },
                margin = {30,10,30,10},
                v_border = {10,10,10,10},
            }
            btn.pos = Point(230,20)
            c:add(btn)
            c.cache = true
            c.clip = true
            return c
        end
        page_view.background_color = Colorf(0.6,0.6,0.6,1)
        page_view:update_data()
    -- end,5)

    local page_control  = M.PageControl{
        dimension = page_view.dimension,
        number_of_pages = page_view.max_number,
        page_view = page_view,
        -- page_indicator_tint_color = Colorf(0.0,0.0,0.0,0.5),
        -- current_page_indicator_tint_color = Colorf(0.0,0.0,0.0,1.0),
    }
    if page_control.dimension == kVertical then
        page_control:add_rules({AutoLayout.height:eq(AutoLayout.parent('height')),AutoLayout.width:eq(34),AutoLayout.left:eq(AutoLayout.parent('width')  - 34),})
    else
        page_control:add_rules({AutoLayout.width:eq(AutoLayout.parent('width')),AutoLayout.height:eq(34),AutoLayout.top:eq(AutoLayout.parent('height')  - 34),})
    end
    page_view:add(page_control)
    page_control.background_color = Colorf(0.0,0.0,0.0,1.0)
    function page_view:on_page_change( value )
        print("page_control.current_page",value)
        page_control.current_page = value
    end
    local label = Label()
    label:set_data{{ text="fps:" .. tostring(math.ceil(Clock.instance().fps))
                    , color=Color(0,0,0)}}
    label.pos = Point(0,root.height - 40)
    root:add(label)
    Clock.instance():schedule(function (  )
        label:set_data{{ text="fps:" .. tostring(math.ceil(Clock.instance().fps))
                        , color=Color(0,0,0)}}
    end)
    Clock.instance():schedule_once(function ( ... )
        print("---------------------------------")
        page_view.is_cache = false
    end,5)
end
local function test_menu( root )
    -- body
    -- local container = Widget()
    -- local str = {"拷贝"}--,"Define","Share...","Tab"}
    -- local items = {}
    -- local width = 0
    -- local height = 0
    -- for i,v in ipairs(str) do
    --     local btn = M.MenuItem{
    --         title  = v,
    --         action = function (  )
    --             print("on_click:",v)
    --         end
    --         -- margin = {15,10,15,10},
    --         -- radius = 5,
    --         -- image = {
    --         --     normal = {
    --         --         unit = units.circle,
    --         --         color = Colorf(0.0,0.0,0.0,1.0)
    --         --     },
    --         --     down = {
    --         --         unit = units.circle,
    --         --         color = Colorf(0.5,0.5,0.5,1.0)
    --         --     },
    --         -- },
    --     }
    --     --btn.v_border = {0,10,0,10}
    --     btn.label:update(false)

    --     table.insert(items,btn)
    --     if items[i-1] then
    --         local size = items[i-1].label.size + Point(items[i-1].margin[1] + items[i-1].margin[3], items[i-1].margin[2] + items[i-1].margin[4])

    --         -- items[i].x = items[i-1].width + 20
    --         print("width",items[i-1].size.x,"height",height)
    --         items[i].pos = Point(items[i-1].x + size.x + 2  ,0 )
    --         -- print(v)
    --         height = size.y
    --         width = size.x + items[i].x
    --     end

    --     container:add(items[i])
    -- end
    -- print(width,height)
    -- local triangle = BorderSprite()
    -- triangle.unit = units.bottom_triangle
    -- triangle.size = triangle.unit.size
    -- triangle.colorf = Colorf(0.0,0.0,0.0,1.0)
    -- print(triangle.size)
    -- container:add(triangle)
    -- root:add(container)
    -- if items[1] then
    --     items[1].v_border = {10,10,0,10}
    --     items[#items].v_border = {10,10,10,10}
    --     triangle.pos = Point(width/2,height)
    -- end
    -- root:add(btn)
    local btn3 
    btn3= M.Button{
       text = '弹出菜单',
       margin = {10,10,10,10},
       image = {
           normal = Colorf(0.5,0.5,0.5,1.0),
           down = Colorf.red,
           disabled = Colorf(0.2,0.2,0.2,1),
       },
       border = true,
       size = Point(200,50),
       on_click = function (  )
           -- body
            local str = {"Copy","Define","Share...","Tab"}
            local items = {}
            for i,v in ipairs(str) do
                local item = M.MenuItem{
                    title  = v,
                    action = function (  )
                        print("on_click:",v)
                    end
                }
                table.insert(items,item)
            end
            local menu_controller = M.share_menu_controller()
            menu_controller.arrow_direction = kMenuControllerArrowUp
            btn3:to_world(Point(0,0))
            local point = Window.instance().drawing_root:from_world(btn3:to_world(Point(0,0)))
            menu_controller:set_target_rect(Rect(point.x,point.y,btn3.size.x,btn3.size.y))
            menu_controller:set_menu_items(items)
            menu_controller:set_menu_visible(true)
       end
    }
    --btn3.pos = Point(410,930)
    root:add(btn3)

    root.background_color = Colorf(0.5,0.5,1.0,1.0)
end

local function test_text_input(root)
    local lbl = M.TextInput{}
    lbl.pos = Point(10,100)
    lbl:set_rich_text('老师的减肥了<font color=#ff0000>洛杉矶的风景</font>老 师的减肥了\n老师江 东父 老拉开时间到了放假s')
    root:add(lbl)
    
    Clock.instance():schedule(function()
        -- lbl:insert('*')
    end, 1)
end

local function editbox( root )
    local start = os.clock()
    print("editbox begin",start)
    local edit = M.EditBox{background_style = KTextBorderStyleRoundedRect
                            ,icon_style = KTextIconMagnifier,
                            text = "<font color=#000000>hello world</font>",
                            hint_text = "<font color=#777777>Text</font>",
                            margin= {10,10,10,10},keyboard_secure = false}
    edit.pos = Point(100,100)
    -- edit.max_length = 5
    edit.size = Point(200,55)
    edit.name = "edit"
    -- edit.inspection_insert = function ( str )
    --     if not tonumber(str) or tonumber(str) > 7 then
    --         return ""
    --     end
    -- end
    edit.on_keyboard_hide = function ( ... )
        print_string("edit.on_keyboard_hide")
    end
    edit.on_keyboard_show = function ( ... )
        print_string("edit.on_keyboard_show")
    end
    -- edit.keyboard_type = Application.KeyboardTypeNumberPad
    -- edit.keyboard_secure = true
    root:add(edit)
    print("editbox end",os.clock() - start)

    local edit2 = M.EditBox{background_style = KTextBorderStyleBezel,icon_style = KTextIconMagnifier,keyboard_secure = true}
    -- edit2.max_length = 5
    edit2.pos = Point(100,200)
    
    edit2.size = Point(200,50)
    edit2.hint_text = "<font color=#777777>Text</font>"
    edit2.name = "edit2"
    edit2.text = "<font color=#aaaaaa>hello world</font>"
    -- edit2.keyboard_type = Application.KeyboardTypeWebSearch
    root:add(edit2)
print("editbox end",os.clock() - start)
    
    edit2.on_keyboard_hide = function ( ... )
        print_string("edit.on_keyboard_hide")
    end
    edit2.on_keyboard_show = function ( ... )
        print_string("edit.on_keyboard_show")
    end
    local edit3 = M.EditBox{background_style = KTextBorderStyleLine,icon_style = KTextIconDelete
    ,text = {{
    text  = "Text",
    color = Color(255,0.0,0.0)
    }}}
    edit3.pos = Point(100,300)
    
    edit3.size = Point(200,50)
    edit3.hint_text = "<font color=#aaaaaa>Text</font>"
    -- edit3.text = 
    -- edit3.keyboard_type = Application.KeyboardTypeASCIICapable
    root:add(edit3)
    -- Clock.instance():schedule_once(function (  )
    --     edit3.icon_style = KTextIconNone
    --     Clock.instance():schedule_once(function (  )
    --         edit3.icon_style = KTextIconDelete

    --     end,5)
    -- end,5)
    print("editbox end",os.clock() - start)
    local edit4 = M.EditBox{background_style = KTextBorderStyleNone,icon_style = KTextIconDelete}
    edit4.pos = Point(100,400)
    
    edit4.size = Point(200,50)
    edit4.name = "edit4"
    edit4.hint_text = {{
    text  = "Text",
    color = Color(255,0.0,0.0)

}}
    -- edit4.keyboard_type = Application.KeyboardTypeDecimalPad
    root:add(edit4)

    local  button = M.Button{
        margin = {20,20,20,20},
        text = "sssss",
    }
    root:add(button)

    local sss = BorderSprite()
    -- sss.background_color = Colorf(0.0,0.0,0.0)
    sss.pos = Point(500,0)
    sss.unit = units.small_magnifier
    sss.size = sss.unit.size
    root:add(sss)
    print("editbox end",os.clock() - start)

    Clock.instance():schedule_once(function ( ... )
        edit4:cleanup()
    end,2)

end
local function test_multiline_editbox( root )
    local mul_editbox = M.MultilineEditBox{expect_height = 95}--,margin = {0,0,0,0}}
    -- mul_editbox.background_color = Colorf(1.0,0.0,1.0,1.0)
    mul_editbox.size = Point(200,100)
    mul_editbox.pos = Point(100,100)
    mul_editbox.max_height = 300
    mul_editbox.hint_text = "<font color=#aaaaaa>Text</font>"
    print("-----",mul_editbox._label_container.pos)
    root:add(mul_editbox)

    local lbl_insert = Label()
    lbl_insert:set_simple_text('insert')
    lbl_insert.pos = Point(0,0)
    root:add(lbl_insert)

    local lbl_del  = Label()
    lbl_del:set_simple_text('del')
    lbl_del.pos = Point(0,100)
    root:add(lbl_del)

    M.init_simple_event(lbl_insert,function ( ... )
        print("insert")
        mul_editbox:registered_keyboard()
        M.share_keyboard_controller():insert('hello')
    end)

    M.init_simple_event(lbl_del,function ( ... )
        print("delete")
        M.share_keyboard_controller():delete()
    end)

    mul_editbox.on_keyboard_hide = function ( ... )
        lbl_insert:set_simple_text('insert_222')
    end

    
end
local function test_searchview( root )
    -- body
    -- local background_view = BorderSprite()
    -- background_view.unit = units.circle
    -- local tsize = units.circle.size
    -- background_view.t_border = {tsize.x/2,tsize.y/2,tsize.x/2,tsize.y/2}
    -- background_view.v_border = {17,17,17,17}
    -- background_view.colorf = Colorf(1.0,1.0,1.0,1.0)
    -- local edit = M.EditBox{background_style = KTextBorderStyleNone,
    --                         text = "<font color=#000000>hello world</font>",
    --                         hint_text = "<font color=#777777>Text</font>",
    --                         radius = 0}
    -- print(edit.line_height)
    -- -- edit.pos = Point(100,100)
    
    -- edit.size = Point(200,edit.line_height)
    -- edit.x = edit.line_height
    -- edit.y = 2
    -- background_view.size = Point(200 + 2*edit.line_height ,edit.line_height+4)
    -- background_view.pos = Point(100,100)
    -- background_view:add(edit)
    
    -- local left_icon = BorderSprite()
    -- left_icon.unit = units.small_magnifier
    -- tsize = units.small_magnifier.size
    -- left_icon.t_border = {tsize.x/2,tsize.y/2,tsize.x/2,tsize.y/2}
    -- left_icon.v_border = {tsize.x/2,tsize.y/2,tsize.x/2,tsize.y/2}
    -- left_icon.size = tsize
    -- left_icon.y =  (background_view.height - left_icon.height)/2 
    -- left_icon.x =  (background_view.height - left_icon.width)/2 
    -- background_view:add(left_icon)


    -- local right_icon = BorderSprite()
    -- right_icon.unit = units.del_icon_1
    -- tsize = units.del_icon_1.size
    -- right_icon.t_border = {tsize.x/2,tsize.y/2,tsize.x/2,tsize.y/2}
    -- right_icon.v_border = {tsize.x/2,tsize.y/2,tsize.x/2,tsize.y/2}
    -- right_icon.size = tsize
    -- right_icon.y =  (background_view.height - right_icon.height)/2 
    -- right_icon.x =  background_view.width -background_view.height+ (background_view.height - right_icon.width)/2 

    -- background_view:add(right_icon)
    -- root:add(background_view)
    -- local searchview = M.SearchView{text = "<font color=#000000></font>",
    --                         hint_text = "<font color=#777777>搜索</font>",radius = 5}
    -- searchview.size = Point(300,40)
    -- searchview.right_icon_units= nil
    -- root:add(searchview)
    local lbl = Label()
    lbl:set_data{{text = "取消",size = 32,color = Color(37,196,0)}}
    root:add(lbl)
    lbl:update(false)
    print("lbl",lbl.size)
end
local function test1(root)
    -- print("----")
    root.background_color = Colorf(1.0,1.0,1.0,1.0)
    test_slider(root)
    -- test_listview(root)
    --test(root)
    --test_layers(root)
    -- test_text_input(root)
    -- editbox(root)
    -- test_searchview(root)
    -- test_listview(root)
    -- test_multiline_editbox(root)
    Clock.instance():schedule(function (  )
        -- body
        root:invalidate()
    end)
    -- local scroll = M.ScrollView{dimension = kVertical}
    -- scroll.background_color = Colorf(1.0,1.0,0.0,1.0)
    -- scroll.pos = Point(100,100)
    -- local xxx = Widget()
    -- xxx.size = Point(200,1)
    -- -- xxx.relative = true 
    -- scroll.content = xxx
    -- scroll.size = Point(200,300)
    
    
    -- local lbl = Label()
    -- lbl:set_rich_text('fdsfsdfdsfdsfdsfsdfsf')
    -- xxx:add(lbl)
    -- root:add(scroll)
    -- local shadow_margin = 3
    -- thumb_vsize = Point(50,600)
    -- local thumb = RoundedView()
    --     thumb.size = thumb_vsize
    --     thumb.radius = (thumb_vsize.x - shadow_margin*2) / 2
    --     --self.thumb.y = -1
    --     thumb.colorf =  Colorf.white

    --     -- shadow
    --     thumb.need_shadow = true
    --     --self.thumb.need_box = false

    --     thumb.shadow_radius = thumb_vsize.x / 2
    --     thumb.shadow_margin = shadow_margin
    --     thumb.shadow_offset = Point(1,1)
    --     root:add(thumb)
end

function border( root )
    local unit = TextureUnit(TextureCache.instance():get('border.png'))
    local s = BorderSprite()
    s.unit = unit
    s.size = unit.size * 2
    local t_border = {0,0,0,0}
    local v_border = {0,0,0,0}
    s.t_border = t_border
    s.v_border = v_border
    local t_left = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    t_left.mininum_value = 0
    t_left.maxinum_value = unit.size.x

    t_left.pos = Point(300,60)
    function t_left:on_change(value)
        t_border[1] = value
        s.t_border = t_border
    end
    local t_top = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    t_top.mininum_value = 0
    t_top.maxinum_value = unit.size.y
    t_top.pos = Point(300,130)
    function t_top:on_change(value)
        t_border[2] = value
        s.t_border = t_border
    end
    local t_right = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    t_right.pos = Point(300,200)
    t_right.mininum_value = 0
    t_right.maxinum_value = unit.size.x
    function t_right:on_change(value)
        t_border[3] = value
        s.t_border = t_border
    end
    local t_bottom = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    t_bottom.pos = Point(300,270)
    t_bottom.mininum_value = 0
    t_bottom.maxinum_value = unit.size.y
    function t_bottom:on_change(value)
        t_border[4] = value
        s.t_border = t_border
    end
    local v_left = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    v_left.mininum_value = 0
    v_left.maxinum_value = unit.size.x*2

    v_left.pos = Point(800,60)
    function v_left:on_change(value)
        v_border[1] = value
        s.v_border = v_border
    end
    local v_top = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    v_top.mininum_value = 0
    v_top.maxinum_value = unit.size.y*2

    v_top.pos = Point(800,130)
    function v_top:on_change(value)
        v_border[2] = value
        s.v_border = v_border
    end
    local v_right = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    v_right.mininum_value = 0
    v_right.maxinum_value = unit.size.x*2

    v_right.pos = Point(800,200)
    function v_right:on_change(value)
        v_border[3] = value
        s.v_border = v_border
    end
    local v_bottom = M.Slider{
        size = Point(500,30),
        thumb_size = Point(60,60)
    }
    function v_bottom:on_change(value)
        v_border[4] = value
        s.v_border = v_border
    end
    v_bottom.mininum_value = 0
    v_bottom.maxinum_value = unit.size.y*2

    v_bottom.pos = Point(800,270)
    root:add(s)
    root:add(t_left)
    root:add(t_top)
    root:add(t_right)
    root:add(t_bottom)
    root:add(v_left)
    root:add(v_top)
    root:add(v_right)
    root:add(v_bottom)

end


function simple_list_view( root )
    -- Clock.instance().maxfps =1 
    local xx_data = {{height = 200,color = Colorf(0.2,0.5,0.3)},
                {height = 300,color = Colorf(0.8,0.5,0.3)},
                {height = 50,color = Colorf(0.2,0.5,0.9)},
                {height = 100,color = Colorf(0.2,0.7,0.3)},
                {color = Colorf(0.2,0.3,0.3)},
                {height = 30,color = Colorf(1.0,0.5,0.3)},

                -- {height = 300,color = Colorf(math.random(),math.random(),math.random())}
            }

    local simple_list = M.ListView{
        -- cell_spacing = 30,
        size = Point(500,600),

        create_cell = function ( data )
            local w = Widget()
            w:add_rules({AutoLayout.width:eq(AutoLayout.parent('width'))})
            -- w.width = 500
            w.height = data.height or 100
            w.background_color = data.color or Colorf.white
            -- w:add(M.Button{text='Button'})
            return w
        end,
        distance_to_refresh = 50,
        -- dimension = kHorizental,
        -- update_cell = function (item, data )
        --     item.height = data.height or 100
        --     item.background_color = data.background_color or Colorf.white
        -- end,
    }
    local loading = M.Loading{
        style = 'white_large'
    }
    loading:add_rules(AutoLayout.rules.align(ALIGN.CENTER))
    simple_list.top_view:add(loading)
    simple_list.min_distance = Point(1,1)
    simple_list.on_refresh = function (flag )

        if flag then
            print("下拉刷新")
            -- simple_list.top_view.background_color = Colorf(1.0,1.0,0.5)
            loading:start_animating()
            Clock.instance():schedule_once(function ( ... )
                -- Clock.instance().maxfps = 1
                -- simple_list:insert({height = 300,color = Colorf(math.random(),math.random(),math.random())},1)
                -- simple_list:insert({height = 300,color = Colorf(math.random(),math.random(),math.random())},1)
                -- simple_list:insert({height = 300,color = Colorf(math.random(),math.random(),math.random())},1)
                -- simple_list:insert({height = 300,color = Colorf(math.random(),math.random(),math.random())},1)
                simple_list:insert({height = 300,color = Colorf(math.random(),math.random(),math.random())},1)
                simple_list:refresh_end(0.0)
                loading:stop_animating()
                -- Clock.instance():schedule_once(function ( ... )
                --     simple_list:scroll_to_bottom(1.0,function ( ... )
                --         print("-------------")
                --     end)
                -- end,2)
            end,5)

        else
            print("上拉刷新")
            simple_list.bottom_view.background_color = Colorf(0.5,1.0,0.5)

            Clock.instance():schedule_once(function ( ... )
                -- 
                -- print("insert refresh before ")
                print("simple_list.kinetic['y'].min before",simple_list.kinetic['y'].min)
                simple_list:insert({height = 300,color = Colorf(math.random(),math.random(),math.random())})
                
                Clock.instance():schedule_once(function ( ... )
                    -- body
                    print("insert refresh after ")
                print("simple_list.kinetic['y'].min",simple_list.kinetic['y'].min)
                
                    Clock.instance():schedule_once(function ( ... )
                    -- body
                    print("simple_list.kinetic['y'].min  2",simple_list.kinetic['y'].min)
                
                    
                    end)
                end)
                
                simple_list:refresh_end()
                print("simple_list.kinetic['y'].min after",simple_list.kinetic['y'].min)
            end,5)
        end
        
    end
    simple_list.background_color = Colorf(0.86,0.86,0.86)
    root:add(simple_list)
    Clock.instance():schedule_once(function (  )
        print("------------------------------------")
        simple_list.data = xx_data
        -- Clock.instance():schedule_once(function (  )
        --     -- body
        --     print('我要更新了')
        --     simple_list:update(3,{height = 600,color = Colorf(0.5,0.0,0.0)})
        --     Clock.instance():schedule_once(function (  )
        --         -- body
        --         print('我要追加了')
        --         simple_list:insert({height = 300,color = Colorf(1.0,0.0,0.0)})
        --          Clock.instance():schedule_once(function (  )
        --             -- body
        --             print('我要删除了')
        --             simple_list:delete(4)

        --             Clock.instance():schedule_once(function (  )
        --             -- body
        --             print('我要插入了')
        --             simple_list:insert({height = 300,color = Colorf(1.0,1.0,0.0)},3)
        --         end,2)
        --         end,2)
        --     end,10)

        -- end,5)
    end,2)
    Clock.instance():schedule(function ( ... )
        -- simple_list:cleanup()
        return true

    end,5)

end

function layout_demo( root )
    -- body
     -- local l = M.GridLayout{
    --     cols = 4,
    --     rows = 6,
    --     dimension = kHorizental,
    -- }

    local l = layout.FloatLayout{
       spacing = Point(0,5),
    }
    l.background_color = Colorf(0.5,0.5,0.5,1.0)
    l.size = Point(300,300)
    for i=1,2 do
        local s = Sprite()
        s.unit = TextureUnit.default_unit()
        s.size = Point(10,10)
        l:add(s)
        M.init_simple_event(s,function ( ... )
            local s = Sprite()
            s.unit = TextureUnit.default_unit()
            s:add_rules({AutoLayout.width:eq(AutoLayout.parent('width')),
                          AutoLayout.height:eq(100)  })
            l:add(s,l.children[1])
            Clock.instance():schedule_once(function ( ... )
                print("l.children[1]",l.children[2].pos)
                Clock.instance():schedule_once(function ( ... )
                    print("l.children[1]",l.children[2].pos)
                end)
            end)
        end)
    end
    -- Clock.instance():schedule(function ( ... )
    --     local s = Sprite()
    --     s.unit = TextureUnit.default_unit()
    --     s.size = Point(100,100)
    --     l:add(s)
        
    -- end,1)

    
    root:add(l)

    -- for k,v in pairs(ALIGN) do
    --     local align = {["k"] = k,["v"]=v}
    --     Clock.instance():schedule_once(function ( ... )
    --         l.align = align.v
    --     end,align.v*2)
    -- end
end
function test_propagate(root)
    local layer = Widget()
    layer:add_rules(AutoLayout.rules.fill_parent)
    layer.touch_enabled = false
    local btn
    btn = M.Button{text='button'}
    btn:add_rules(AutoLayout.rules.align(ALIGN.TOPLEFT))
    layer:add(btn)

    btn = M.Button{text='button'}
    btn:add_rules(AutoLayout.rules.align(ALIGN.TOPRIGHT))
    layer:add(btn)

    btn = M.Button{text='button'}
    btn:add_rules(AutoLayout.rules.align(ALIGN.BOTTOMLEFT))
    layer:add(btn)

    btn = M.Button{text='button'}
    btn:add_rules(AutoLayout.rules.align(ALIGN.BOTTOMRIGHT))
    layer:add(btn)

    btn = M.Button{text='button'}
    btn:add_rules(AutoLayout.rules.align(ALIGN.CENTER))
    Window.instance().drawing_root:add(btn)
    Window.instance().drawing_root:add(layer)
end
function test_bubbling(root)
    local p = Widget()
    p.size_hint = Point(200,200)
    p:add_listener(function(self, touch, canceled)
        print('click on self', touch.target == self)
        print('parent event', touch.action, canceled)
    end)
    local s = Sprite(TextureUnit.default_unit())
    s.size_hint = Point(100,100)
    s:add_listener(function(self, touch, canceled)
        touch:lock(self)
    end)
    p:add(s)
    Window.instance().drawing_root:add(p)
end

function scrollView2( root )
    local scroll1 = M.ScrollView{dimension = kVertical,}
    scroll1.size = Point(300,300)
    local scroll2 = M.ScrollView{dimension = kHorizental,}
    scroll2.size = Point(300,200)
    -- scroll2.min_distance = Point(10,10)
    local w = Widget()
    w.size =Point(300,500)
    w.background_color = Colorf.green
    w:add(scroll2)

    scroll1.content = w

    local w2 = Widget()
    w2.size = Point(600,200)
    w2.background_color = Colorf.red
    scroll2.content = w2
    root:add(scroll1)
end
return simple_list_view

