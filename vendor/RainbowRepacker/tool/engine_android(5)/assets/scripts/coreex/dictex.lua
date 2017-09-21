require("core/dict");

Dict.setDictNamePrefix = function(prefix)
    Dict.s_dictNamePrefix = prefix;
end

Dict.getDictNamePrefix = function()
    return Dict.s_dictNamePrefix or "";
end

Dict.ctor = function(self, dictName)
    self.m_name = Dict.getDictNamePrefix() .. dictName;
end