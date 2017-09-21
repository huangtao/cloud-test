local xpcall = xpcall

local function print(str)
    Log.i(str)
end

local function error(str)
    Log.e(str)
end

local function buildEnv()
    local localEnv = setmetatable({}, {__index=_G})
    local setVariable = _G
    local env = setmetatable({}, {__index=localEnv, __newindex=setVariable})
    return env
end

local visited = nil

local ConsoleUtility = {}

function ConsoleUtility.prettyTabToStr(tab, level, path)
    local result = ''
    if level == nil then
        visited = {}
        level = 0
        path = '(self)'
    end

    if visited[tab] then
        return string.format( '%s%s\n', string.rep('\t', level), visited[tab] )
    end
    visited[tab] = path

    result = result .. string.format('%s{\n', string.rep('\t', level))
    local ignore = {}
    for i,v in ipairs(tab)do
        ignore[i] = true
        if type(v) == 'table' then
            local newPath = path .. '.' .. tostring(k)
            if visited[v] then
                local existPath = visited[v]
                local _,count1 = string.gsub(existPath, '%.', function()end)
                local _,count2 = string.gsub(newPath, '%.', function()end)
                if count2 < count1 then
                    visited[v] = newPath
                end
                result = result .. string.format('%s%s\n', string.rep('\t', level+1), visited[v])
            else
                result = result .. string.format('%s\n', string.rep('\t', level+1))
                result = result .. ConsoleUtility.prettyTabToStr(v, level+1, newPath)
            end
        else
            result = result .. string.format('%s%s,\n', string.rep('\t', level+1), tostring(v))
        end
    end
    for k,v in pairs(tab)do
        if not ignore[k] then
            local typeOfKey = type(k)
            local kStr = k
            if typeOfKey == 'string' then
                if not k:match('^[_%a][_%w]*$') then
                    kStr = '[\'' .. k .. '\'] = '
                else
                    kStr = tostring(k) .. ' = '
                end
            else
                kStr = string.format('[%s] = ', tostring(k))
            end

            if type(v) == 'table' then
                local newPath = path .. '.' .. tostring(k)
                if visited[v] then
                    local existPath = visited[v]
                    local _,count1 = string.gsub(existPath, '%.', function()end)
                    local _,count2 = string.gsub(newPath, '%.', function()end)
                    if count2 < count1 then
                        visited[v] = newPath
                    end
                    result = result .. string.format('%s%s%s\n', string.rep('\t', level+1), tostring(kStr), visited[v])
                else
                    result = result .. string.format('%s%s\n', string.rep('\t', level+1), tostring(kStr))
                    result = result .. ConsoleUtility.prettyTabToStr(v, level+1, newPath)
                end
            else
                result = result .. string.format('%s%s%s,\n', string.rep('\t', level+1), tostring(kStr), tostring(v))
            end
        end
    end
    result = result .. string.format('%s}\n', string.rep('\t', level))
    return result
end

local function printVar(value)
    local tstr = type(value)
    local str = ""
    if tstr == 'table' then
        str = ConsoleUtility.prettyTabToStr(value)
    elseif tstr == 'userdata' then
        str = value
    else
        str = tostring(value)
    end
    print(str)
    return str
end

local function compile(str,env)
    if loadstring then
        local func,err = loadstring(str,'=console')
        if not func then
            return func,err
        end
        setfenv(func, env)
        return func,err
    else
        local func,err = load(str,'@console','t',env)
        return func,err
    end
end

function ConsoleUtility.printExpr(value)
    local env = buildEnv()
    if value:match('^[_%a][_%w]*$') then
        local matchvalue = env[value]
        return printVar(matchvalue)

    else
        local str = ""
        xpcall(function()

            local env = buildEnv()
            local iscmd=false
            local func,err = compile('return '..value,env)
            if not func then
                func,err = compile(value,env)
                iscmd=true
            end

            if not func then
                error(err)
                return
            end
            
            local result={func()}
            if not iscmd then 
                if #result==0 then
                    str = printVar(nil) 
                elseif #result==1 then
                    str = printVar(result[1])
                else
                    str = printVar(result)
                end
            end

        end,
        function(err)
            error( err )
        end)
        return str
    end
end

return ConsoleUtility