print_string("performace | start to set force_redraw")
sys_set_int('force_redraw', 1);
EventDispatcher.getInstance():register(Event.Resume, nil, function()
    print_string("performace | receive resumeEvent")
    forceRenderAnim = new(AnimInt , kAnimNormal, 0, 1 ,500, -1);
    forceRenderAnim:setEvent(nil, function()
        print_string("performace | set force_redraw by resume")
        sys_set_int('force_redraw', 1);
        forceRenderAnim = nil;
    end);
end)

local inspect = require('inspect')
local function decode_json(args)
    local ret_args = nil
    xpcall(function()
        ret_args = cjson.decode(args)
    end, function() print_string(debug.traceback()) end)
    return ret_args
end

local function get_root_node()
    if g_at_root_node then
        return g_at_root_node                    -- lua 3.0
    else
        return Window.instance().drawing_root    -- lua 3.1
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function dump_widget_info_lua30(w, v, dump_children, xpath, index)
    print_string('w:getVisible() : ' .. tostring(w:getVisible()))
    if (not w:getVisible()) then return end

    v.name = tostring(w:getName() or "")
    v.type = w:getDebugName() or ""
    --v.tag = w.tag      -- lua 3.0 no tag

    local drawing_widget = Widget.get_by_id(w.m_drawingID)
    local p = drawing_widget:to_world(Point(0.0, 0.0))

    v.position = {
        x = p.x ,
        y = p.y ,
        z = 0.0 ,
    }

    local width , height = w:getSize()
    v.size = {
        width = width ,
        height = height ,
    }
    v.clickable = drawing_widget.clickable
    v.xpath = xpath
    v.index = index

    local text
    if drawing_widget.getResText then
        text = drawing_widget:getResText()
    end
    if text then v.text = text end

    if v.type == 'CheckBox' or v.type == 'RadioButton' then
        v.selected = (w.m_checked and true or false)
    end

    print_string('Elements : dump_children ' .. tostring(dump_children))
    print_string('Elements : w.name ' .. tostring(v.name))
    print_string('Elements : w.type ' .. tostring(v.type))
    print_string('Elements : w.children ' .. tostring(#w:getChildren()))
    print_string('Elements : text ' .. tostring(text))
    print_string('Elements : xpath ' .. tostring(v.xpath))
    if dump_children then
        local c_name_index = {}

        local w_children = w:getChildren()
        print_string('w:getChildren() : ' .. tostring(w:getChildren()))

        v.children = {}
        for i , c in pairs(w_children) do
            print_string('i : ' .. tostring(i))
            v.children[i] = {}

            if xpath then
                local n_name = c:getName()
                if not n_name or n_name == "" then
                    n_name = 'element'
                else
                    n_name = tostring(n_name)
                end

                if not c_name_index[n_name] then c_name_index[n_name] = 0 end
                c_name_index[n_name] = c_name_index[n_name] + 1

                local c_xpath = xpath .. '/' .. n_name

                dump_widget_info_lua30(c, v.children[i], dump_children, c_xpath, c_name_index[n_name])
            else
                dump_widget_info_lua30(c, v.children[i], dump_children)
            end
        end
    end

    return v
end

local function dump_widget_info_lua31(w, v, dump_children, xpath, index)
    if (not w.visible) then return end

    v.name = w.name or ""
    v.type = string.match('.+<(.*)>.+', w.___type) or ""
    v.tag = w.tag

    local p = w:to_world(Point(0.0, 0.0))

    v.position = {
        x = p.x ,
        y = p.y ,
        z = 0.0 ,
    }

    v.size = {
        width = w.size.x ,
        height = w.size.y ,
    }
    --v.visible = w.visible
    v.clickable = w.clickable
    v.xpath = xpath
    v.index = index

    if w.___type == 'class<Label>' then
        local data = w:get_data()
        v.text = ""
        for index , seg in pairs(data) do
            v.text = v.text .. (seg['text'] or "")
        end
    end

    if w.___type == 'class<Checkbox>' or w.___type == 'class<RadioButton>' then
        v.selected = (w._checked and true or false)
    end

    print_string('Elements : dump_children ' .. tostring(dump_children))
    print_string('Elements : w.name ' .. tostring(w.name))
    print_string('Elements : w.children ' .. tostring(#w.children))
    if dump_children and #w.children > 0 then
        local c_name_index = {}

        v.children = {}
        for i , c in ipairs(w.children) do
            v.children[i] = {}

            if xpath then
                local n_name = c.name
                if not n_name or n_name == "" then
                    n_name = 'element'
                else
                    n_name = tostring(n_name)
                end

                if not c_name_index[n_name] then c_name_index[n_name] = 0 end
                c_name_index[n_name] = c_name_index[n_name] + 1

                local c_xpath = xpath .. '/' .. n_name

                dump_widget_info_lua31(c, v.children[i], dump_children, c_xpath, c_name_index[n_name])
            else
                dump_widget_info_lua31(c, v.children[i], dump_children)
            end
        end
    end

    return v
end

local function dump_widget_info(w, v, dump_children, xpath, index)
    if g_at_root_node then
        return dump_widget_info_lua30(w, v, dump_children, xpath, index)
    else
        return dump_widget_info_lua31(w, v, dump_children, xpath, index)
    end
end

local function string_trim(s)
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

local function string_split(str, pat)
    assert(type(str) == 'string', debug.traceback())
    local t = {}
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s , e , cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            t[#t+1] = cap
        end
        last_end = e+1
        s , e , cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end)
        t[#t+1] = cap
    end
    return t
end

local function insertToTable(nodes, node, selection)
    table.insert(nodes, node)
end

local function get_attr_name_value(expr)
    local operations = { '>=' , '<=' , '!=' , '>' , '<' , '=' }
    for _ , op in ipairs(operations) do
        local pattern = string.format('(.+)%s(.+)', op)
        local attr_name , attr_value = expr:match(pattern)
        if attr_name ~= nil and attr_value ~= nil then
            return string_trim(attr_name) , string_trim(attr_value) , op
        end
    end
end

local function eval_predicate(node, expression)
    assert(type(expression) == 'string', debug.traceback())
    local expression_parts = string_split(expression, ' and ')

    for _ , expr in ipairs(expression_parts) do
        if expr == '*' then
        else
            local attr_name , attr_value , op = get_attr_name_value(expr)
            if attr_name ~= nil then
                if op == '>=' then
                    if node[attr_name] < tonumber(attr_value) then
                        return false
                    end
                elseif op == '<=' then
                    if node[attr_name] > tonumber(attr_value) then
                        return false
                    end
                elseif op == '!=' then
                    if tostring(node[attr_name]) == attr_value then
                        return false
                    end
                elseif op == '>' then
                    if node[attr_name] <= tonumber(attr_value) then
                        return false
                    end
                elseif op == '<' then
                    if node[attr_name] >= tonumber(attr_value) then
                        return false
                    end
                else
                    if tostring(node[attr_name]) ~= attr_value then
                        return false
                    end
                end
            else
            end
        end
    end

    return true
end

local function match(node, tag_name, expression)
    local node_name = (g_at_root_node and node:getName() or node.name)
    if not node_name or node_name == "" then
        node_name = 'element'
    else
        node_name = tostring(node_name)
    end

    if tag_name ~= node_name and tag_name ~= '*' then
        return false
    end

    if expression == nil then
        return true
    end

    return eval_predicate(node, expression)
end

local function parseNodes(xmlNode, segments, idx, nodes, selection)
    if idx > #segments then return {} end

    local segment = segments[idx]
    if segment.tag == '..' then --or segment.tag == "parent::node()" then
        return { idx+1 } -- return next idx to continue from at parent
    end

    local positions = {}
    local parent_positions = {}

    if segment.tag == "." then --or segment.tag == "self::node()"
        local pos_t = parseNodes(xmlNode, segments, idx+1, nodes, selection)
        for i=1 , #pos_t do
            local pos = pos_t[i]
            positions[#positions+1] = pos
        end
        pos_t = nil
    end

    if segment.tag == " " then --or segment.tag == "descendant-or-self::node()"
        local pos_t = parseNodes(xmlNode, segments, idx+1, nodes, selection)
        for i=1 , #pos_t do
            parent_positions[#parent_positions+1] = pos_t[i]
        end
        pos_t = nil

        if g_at_root_node then
            for _ , node in pairs(xmlNode:getChildren()) do
                local pos_t = parseNodes(node, segments, idx, nodes, selection)
                for i=1 , #pos_t do
                    positions[#positions+1] = pos_t[i]
                end
                pos_t = nil
            end
        else
            for _ , node in ipairs(xmlNode.children) do
                local pos_t = parseNodes(node, segments, idx, nodes, selection)
                for i=1 , #pos_t do
                    positions[#positions+1] = pos_t[i]
                end
                pos_t = nil
            end
        end
    end

    local function node_children_lua30()
        for _ , node in pairs(xmlNode:getChildren()) do
            local found = match(node, segment.tag, segment.expression)
            if found then
                segment.cur_index = segment.cur_index+1

                local insert = true
                if segment.index then
                    --print("index: " .. segment.index .. ", cur_index: " .. segment.cur_index)
                    if segment.cur_index == segment.index then
                        insert = true
                    else
                        insert = false
                    end
                end

                if insert then
                    if #segments == idx then
                        insertToTable(nodes, node, selection)
                    else
                        local pos_t = parseNodes(node, segments, idx+1, nodes, selection)
                        for i=1 , #pos_t do
                            local pos = pos_t[i]
                            positions[#positions+1] = pos
                        end
                        pos_t = nil
                    end
                end
            end
        end
    end

    local function node_children_lua31()
        for _ , node in ipairs(xmlNode.children) do
            local found = match(node, segment.tag, segment.expression)
            if found then
                segment.cur_index = segment.cur_index+1

                local insert = true
                if segment.index then
                    --print("index: " .. segment.index .. ", cur_index: " .. segment.cur_index)
                    if segment.cur_index == segment.index then
                        insert = true
                    else
                        insert = false
                    end
                end

                if insert then
                    if #segments == idx then
                        insertToTable(nodes, node, selection)
                    else
                        local pos_t = parseNodes(node, segments, idx+1, nodes, selection)
                        for i=1 , #pos_t do
                            local pos = pos_t[i]
                            positions[#positions+1] = pos
                        end
                        pos_t = nil
                    end
                end
            end
        end
    end

    if g_at_root_node then
        node_children_lua30()
    else
        node_children_lua31()
    end

    for i=1 , #positions do
        local cur_pos = positions[i]

        if cur_pos > #segments then
            insertToTable(nodes, xmlNode, selection)

        elseif segments[cur_pos] == '..' then
            parent_positions[#parent_positions+1] = cur_pos+1

        else
            local pos_t = parseNodes(xmlNode, segments, cur_pos, nodes, selection)
            for i=1 , #pos_t do
                parent_positions[#parent_positions+1] = pos_t[i]
            end
            pos_t = nil
        end
    end

    return parent_positions
end

local function select_nodes(widget, query, nodes)
    -- invalid queries
    if query:find("///") ~= nil or query:find("//%.%.") ~= nil then return end

    local query = string_trim(query)
    if string.len(query) == 0 then return end

    query = string.gsub(query, "//", "/ /")
    local segments = string_split(query, '/')

    local last_tag = segments[#segments]
    local selection = nil

    if last_tag:find("@") == 1 or last_tag:find("text()") == 1 then
        selection = last_tag
        segments[#segments] = nil
    end

    local query_segments = {}
    for _ , segment in ipairs(segments) do
        local pred_start = segment:find("[[]") or 0
        local pred_end = segment:find("[]]")

        local tag = segment:sub(1, pred_start-1)

        local expression = nil
        local index = nil

        if pred_start > 0 and pred_end then
            expression = segment:sub(pred_start+1, pred_end-1)

            if pred_end < #segment then
                local idx_start = segment:find("[[]", pred_end+1)
                local idx_end = segment:find("[]]", pred_end+1)
                if idx_start and idx_end then
                    index = segment:sub(idx_start+1, idx_end-1)
                end
            elseif tonumber(expression) then
                index = expression
                expression = nil
            end
        end

        query_segments[#query_segments+1] = {
            ['tag'] = tag ,
            ['expression'] = expression ,
            ['index'] = tonumber(index) ,
            ['cur_index'] = 0 ,
        }
    end

    parseNodes(widget, query_segments, 1, nodes, selection)
end

local function get_nodes_by_xpath(xpath)
    if xpath == nil then return end

    local queries = {}
    if xpath:find('|') ~= nil then
        queries = string_split(xpath, '|')
    else
        queries = { xpath }
    end

    local nodes = {}
    for _ , q in ipairs(queries) do
        local root = get_root_node()
        local c = q:sub(1, 1)
        if c == '/' then
        end

        select_nodes(root, q, nodes)
    end

    return nodes
end

function getNodesByXPath(args)
    dict_set_string('Elements', 'getNodesByXPath', "")
    print_string('getNodesByXPath args : ' .. tostring(args))

    local args = decode_json(args)
    if args == nil then return end

    local nodes = get_nodes_by_xpath(args.xpath)

    local v = {}
    for i , node in ipairs(nodes or {}) do
        v[i] = {}
        dump_widget_info(node, v[i], false)
    end

    print_string('getNodesByXPath result : ' .. #v)
    local result = cjson.encode(v)
    print_string('getNodesByXPath result : ' .. result)
    dict_set_string('Elements', 'getNodesByXPath', result)
    return result
end

function getHierarchy_lua30(args)
    local v = {
        frame_size = {
            width = Window.instance().size.x ,
            height = Window.instance().size.y ,
        } ,
    }
    local info = dump_widget_info(g_at_root_node, v, true, '/', 1)
    local success, result = pcall(cjson.encode, info)
    if not success then
        print_string('encode failed', result, inspect(info))
    else
        print_string('Elements : ' .. tostring(result))
        dict_set_string('Elements', 'getHierarchy', result)
    end
end

function getHierarchy_lua31(args)
    local drawing_id = args.drawing_id or Window.instance().drawing_root:getId()
    print_string('drawing_id : ' .. tostring(drawing_id))

    local widget = Widget:get_by_id(args.drawing_id)
    if widget == nil then return cjson.encode({}) end
    print_string('widget:getId() : ' .. tostring(widget:getId()))

    local v = {
        frame_size = {
            width = Window.instance().size.x ,
            height = Window.instance().size.y ,
        } ,
    }
    local result = cjson.encode(dump_widget_info(widget, v, true, '/', 1))
    print_string('Elements : ' .. tostring(result))

    dict_set_string('Elements', 'getHierarchy', result)
end

function getHierarchy(args)
    dict_set_string('Elements', 'getHierarchy', "")

    local args = decode_json(args)
    if args == nil then return end

    print_string('g_at_root_node : ' .. tostring(g_at_root_node))
    if g_at_root_node then
        getHierarchy_lua30(args)
    else
        getHierarchy_lua31(args)
    end
end

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function get_element_by_name(w, name, elements)
    w = w or get_root_node()

    if name == nil then return end
    if not w:getVisible() then return end

    -- 
    if g_at_root_node then
        for _ , c in pairs(w:getChildren()) do
            if c:getVisible() and tostring(c:getName()) == name then
                table.insert(elements, c)
            end

            get_element_by_name(c, name, elements)
        end
    else
        for _ , c in ipairs(w.children) do
            if c:getVisible() and c.name == name then
                table.insert(elements, c)
            end

            get_element_by_name(c, name, elements)
        end
    end
end

local function get_element_by_text(w, text, elements)
    if text == nil then return end

    w = w or get_root_node()
    if not w:getVisible() then return end

    -- 
    if g_at_root_node then
        for _ , c in pairs(w:getChildren()) do
            local drawing_widget = Widget.get_by_id(c.m_drawingID)
            local text = drawing_widget:getResText()
            if text and v['text'] == text then
                table.insert(elements, c)
            end

            get_element_by_text(c, text, elements)
        end
    else
        for _ , c in ipairs(w.children) do
            if c.___type == 'class<Label>' then
                local data = c:get_data()
                for index , v in pairs(data) do
                    if v['text'] == text then
                        table.insert(elements, c)
                    end
                end
            end

            get_element_by_text(c, text, elements)
        end
    end
end

function getElements(args)
    dict_set_string('Elements', 'getElements', "")
    local args = decode_json(args)
    if args == nil then return end

    -----------------------------------------------------------------------------------------------
    -- get parent elements by args.parent_name from root node
    local root_parents = {}
    get_element_by_name(nil, args.parent_name, root_parents)

    print('root node : ' .. tostring(get_root_node()))
    print('root_parents : ' .. tostring(root_parents))
    print('root_parents : ' .. tostring(#root_parents))
    if #root_parents == 0 then root_parents[#root_parents+1] = get_root_node() end

    print_string('Elements : root_parents : ' .. tostring(#root_parents))
    print_string('Elements : root_parents.name : ' .. tostring(root_parents[1].name))

    -----------------------------------------------------------------------------------------------
    -- get elements by args.name from parent elements
    local c_name_elements = {}
    if args.name then
        for _ , root in ipairs(root_parents) do
            get_element_by_name(root, args.name, c_name_elements)
        end
    end

    -----------------------------------------------------------------------------------------------
    -- get elements by args.text from parent elements
    local c_text_elements = {}
    if args.text then
        for _ , root in ipairs(root_parents) do
            get_element_by_text(root, args.text, c_text_elements)
        end
    end

    -- operation : 1 and / 2 or / 3 absolute
    local operation = tostring(args.operation)

    local result = {}
    local index = 1
    if operation == "1" then
        local function has_element(w)
            for _ , text_element in ipairs(c_text_elements) do
                if w == text_element then return true end
            end

            return false
        end

        for _ , name_element in ipairs(c_name_elements) do
            if has_element(name_element) then
                if result[index] == nil then result[index] = {} end
                dump_widget_info(name_element, result[index], false)
                index = index + 1
            end
        end
    elseif operation == "2" then
        for _ , name_element in ipairs(c_name_elements) do
            if result[index] == nil then result[index] = {} end
            dump_widget_info(name_element, result[index], false)
            index = index + 1
        end
        for _ , text_element in ipairs(c_text_elements) do
            if result[index] == nil then result[index] = {} end
            dump_widget_info(text_element, result[index], false)
            index = index + 1
        end
    else
        if args.name then
            result.name_element = {}
            for _ , name_element in ipairs(c_name_elements) do
                if result.name_element[index] == nil then result.name_element[index] = {} end
                dump_widget_info(name_element, result.name_element[index], false)
                index = index + 1
            end
        end

        if args.text then
            result.text_element = {}
            index = 1
            for _ , text_element in ipairs(c_text_elements) do
                if result.text_element[index] == nil then result.text_element[index] = {} end
                dump_widget_info(text_element, result.text_element[index], false)
                index = index + 1
            end
        end
    end

    local result = cjson.encode(result)
    print_string('Elements : ' .. tostring(result))

    dict_set_string('Elements', 'getElements', result)

    return result
end

function setElementText(args)
    local args = decode_json(args)
    if args == nil then return dict_set_string('Elements', 'setElementText', 'false') end

    local nodes = {}
    if args.xpath then
        nodes = get_nodes_by_xpath(args.xpath)
    else
        get_element_by_name(nil, args.name, nodes)
    end

    local result = 'false'

    if g_at_root_node then
        for i , node in ipairs(nodes or {}) do
            -- local drawing_widget = Widget.get_by_id(node.m_drawingID)
            -- local text = drawing_widget:getResText()
            -- if text then
            if node.setText then
                node:setText(args.text or "")

                result = 'true'
            end
        end
    else
        for i , node in ipairs(nodes or {}) do
            if node.___type == 'class<Label>' then
                local data = node:get_data()
                data[1]['text'] = args.text or ""
                node:set_data(data)

                result = 'true'
            end
        end
    end

    dict_set_string('Elements', 'setElementText', result)
end

local function get_child_text_element_lua30(node, elements)
    -- local drawing_widget = Widget.get_by_id(node.m_drawingID)
    -- local text = drawing_widget:getResText()
    -- if text then
    if node.setText then
        table.insert(elements, node)
    end

    for _ , c in pairs(node:getChildren()) do
        get_child_text_element_lua30(c, elements)
    end
end

local function get_child_text_element_lua31(node, elements)
    if node.___type == 'class<Label>' then
        table.insert(elements, node)
    end

    for _ , c in ipairs(node.children) do
        get_child_text_element_lua31(c, elements)
    end
end

local function get_child_text_element(node, elements)
    if g_at_root_node then
        get_child_text_element_lua30(node, elements)
    else
        get_child_text_element_lua31(node, elements)
    end
end

function getTextElementByNodeName(args)
    dict_set_string('Elements', 'getTextElementByNodeName', "")

    local args = decode_json(args)
    if args == nil then return end

    local nodes = get_nodes_by_xpath(args.xpath)

    local elements = {}
    for _ , node in ipairs(nodes) do
        get_child_text_element(node, elements)
    end

    local v = {}
    for index , text_element in ipairs(elements) do
        v[index] = {}
        dump_widget_info(text_element, v[index], false)
    end

    local result = cjson.encode(v)
    dict_set_string('Elements', 'getTextElementByNodeName', result)
end

function element_test(w)
    print_string('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ : ' .. tostring(get_root_node()))
    -- 
    local t = cjson.encode({
        --drawing_id = w:getId() ,
    })
    print_string('t : ' .. tostring(t))

    getHierarchy(t)

    -- 
    local v = getElements(cjson.encode({
        name = 'static_text_time' ,
        operation = 2 ,
    }))
    print_string('Elements : ' .. tostring(v))

    -- 
    local t = ' aa   <=      33     '
    local key , value , op = get_attr_name_value(t)
    print_string('key : [' .. tostring(string_trim(key)) .. ']')
    print_string('value : [' .. tostring(string_trim(value)) .. ']')

    local v = getNodesByXPath(cjson.encode({
        xpath = '//*/*/hall/Image_top_bg|//element/element/hall/bottomBtnsView/element/hall_bottom_btns/static_text_time' ,
        --xpath = '//aa/sprite_2' ,
    }))
    print_string('getNodesByXPath : ' .. tostring(v))
    print_string('Elements : element_test')

    setElementText(cjson.encode({
        xpath = '//element/element/hall/bottomBtnsView/element/hall_bottom_btns/static_text_time' ,
        text = '1024' ,
    }))
end

--element_test()
