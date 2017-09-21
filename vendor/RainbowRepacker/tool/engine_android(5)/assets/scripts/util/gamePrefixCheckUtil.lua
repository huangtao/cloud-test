
GamePrefixCheckUtil = class();

GamePrefixCheckUtil.getInstance = function(self)
    if not GamePrefixCheckUtil.s_instance then
        GamePrefixCheckUtil.s_instance = new(GamePrefixCheckUtil);
    end

    return GamePrefixCheckUtil.s_instance;
end

GamePrefixCheckUtil.addPrefix = function(self, prefix)
    if not _DEBUG then
        return;
    end

    prefix = tostring(prefix);
    if string.isEmpty(prefix) then
        error("GamePrefixCheckUtil MUST have prefix");
    end

    local t = {};
    t.__newindex = function(table, key, value)
        local len = string.len(prefix);
        local str_prefix = string.sub(tostring(key), 1, len);
        if string.upper(str_prefix) ~= string.upper(prefix) then
            self:__log(prefix, key);
        end

        rawset(table, key, value);
    end

    setmetatable(_G, t);
end

GamePrefixCheckUtil.clearPrefix = function(self)
    if not _DEBUG then
        return;
    end

    setmetatable(_G, nil);
end

GamePrefixCheckUtil.__log = function(self, prefix, msg)
    Log.iWF("GamePrefixCheckUtil", "prefix = ", prefix, "  value =", msg);
end