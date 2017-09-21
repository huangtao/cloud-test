
local required_path_map = {};
Import = function(path)
    required_path_map[path] = true;
    return require(path);
end

ClearGameRequiredPath = function()
    local pkg = package.loaded;
    for path, _ in pairs(required_path_map) do
        pkg[path] = nil;
    end
    required_path_map = {};
end

Singleton = function(class, globalName, initFuncName)
    class.getInstance = function()
        if not class.s_instance then
            local instance = new(class);
            if initFuncName and instance[initFuncName] then
                instance[initFuncName](instance);
            end
            class.s_instance = instance;
        end
        return class.s_instance;
    end

    class.releaseInstance = function()
        delete(class.s_instance);
        class.s_instance = nil;
        if globalName then
            _G[globalName] = nil
        end
    end

    class.cleanup = function()
        class.releaseInstance();
        if globalName then
            _G[globalName] = class.getInstance();
        end
    end
    
    class.cleanup();
end

GetIdFactory = function(origin)
    local id = origin or 0;
    return function() 
        id = id + 1; 
        return id;
    end
end

GetNumFromJsonTable = function(tb, key, default)
    local ret = default;
    if tb[key] ~= nil then
        if tb[key]:get_value() ~= nil then
            ret = tonumber(tb[key]:get_value());
            if ret == nil then
                ret = default;
            end
        end
    end
    return ret;
end

GetStrFromJsonTable = function(tb, key, default)
    local ret = default;
    if tb[key] ~= nil then
        if tb[key]:get_value() ~= nil then
            ret = tb[key]:get_value();
            if string.len(ret)  == 0 then
                ret = default;
            end
        end
    end
    return ret;
end

GetBlooeanFromJsonTable = function(tb, key, default)
    local ret = default;
    if tb and tb[key] ~= nil then
        if tb[key]:get_value() ~= nil then
            ret = tb[key]:get_value();
        end
    end
    return ret;
end

GetTableFromJsonTable = function(tb, key, default)
    local ret = default;
    if tb and tb[key] ~= nil then
        if tb[key]:get_value() ~= nil then
            ret = tb[key]:get_value();
            if type(ret) ~= "table" then
                ret = default;
            end
        end
    end
    return ret;
end

Joins = function(t, mtkey)
    local str = "K";
    if t == nil or type(t) == "boolean"  or type(t) == "byte" then
        return str;
    elseif type(t) == "number" or type(t) == "string" then
        str = string.format("%sT%s%s", str.."", mtkey, string.gsub(t, "[^a-zA-Z0-9]",""));
    elseif type(t) == "table" then
        for k,v in orderedPairs(t) do
            str = string.format("%s%s=%s", str, tostring(k), Joins(v, mtkey));
        end
    end
    return str;
end