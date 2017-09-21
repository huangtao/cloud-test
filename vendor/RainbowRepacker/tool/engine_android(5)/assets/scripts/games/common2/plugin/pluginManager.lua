
PluginManager = class();

function PluginManager:ctor()

end

function PluginManager:dtor()

end

function PluginManager.bind(host, plugin)
    local ret = class(host);
    for k, v in pairs(plugin or {}) do
        if PluginManager.checkMergeKey(k) then
            ret[k] = ret[k] or {};
            ret[k] = CombineTables(ret[k], v)
        else
            ret[k] = v;
        end
    end
    return ret;
end

function PluginManager.bindGroup(group)
    local ret = {};
    for host, plugin in pairs(group or {}) do
        ret[host] = PluginManager.bind(host, plugin);
    end
    return ret;
end

function PluginManager.checkMergeKey(key)
    for k,v in ipairs(PluginManager.s_mergeKey) do
        if v==key then
            return true;
        end
    end
    return false;
end

PluginManager.s_mergeKey = {
    "s_cmds","s_cmdConfig","s_controls",--scene
    "s_actionFuncMap","s_stateFuncMap",--controller
    "s_severCmdFunMap",--reader
    "s_clientCmdFunMap",--writer
    "s_socketCmdFuncMap",--processer
}
