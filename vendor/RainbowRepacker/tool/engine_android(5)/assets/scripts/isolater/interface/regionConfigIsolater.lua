require("hall/gameData/regionConfigDataInterface");

RegionConfigIsolater = class(DataInterfaceBase);

RegionConfigIsolater.getInstance = function()
    if not RegionConfigIsolater.s_instance then
        RegionConfigIsolater.s_instance = new(RegionConfigIsolater);
    end

    return RegionConfigIsolater.s_instance;
end

--[[
    @brief 分享按钮配置
    @return t = {
        ["weixinGroup"] = true;
        ["weixinFriend"] = true;
    }
]]
RegionConfigIsolater.getDefaultShareConfig = function(self)
    return RegionConfigDataInterface.getInstance():getDefaultShareConfig();
end

--[[
    @brief 默认城市
    @return RegionText_default_city = "大连"
--]]
RegionConfigIsolater.getRegionDefaultCity = function(self)
    return RegionConfigDataInterface.getInstance():getRegionDefaultCity();
end

--[[
    @brief 游戏名称
    @return RegionText_productName = "大连棋牌"
--]]
RegionConfigIsolater.getRegionProductName = function(self)
    return RegionConfigDataInterface.getInstance():getRegionProductName();
end



