HallFeatureManager = class();


local HALL_FEATURE_NAMES = {
    MATCH = "match", --比赛
    PRIVATE_ROOM_SCORE = "private_room_score", --积分房
    PRIVATE_ROOM_SILVER_COIN = "private_room_silver_coin",--银币房
    PRIVATE_ROOM_GOLD_BAR = "private_room_gold_bar", --金条房
    ONLOOKER_MATCH = "onlooker_match",--比赛围观
}

local HALL_FEATURE_VERSION = {
    [HALL_FEATURE_NAMES.MATCH] = { featureVer = 1, supportDefault = true};              
    [HALL_FEATURE_NAMES.PRIVATE_ROOM_SCORE] = { featureVer = 1, supportDefault = true };
    [HALL_FEATURE_NAMES.PRIVATE_ROOM_SILVER_COIN] = { featureVer = 1, supportDefault = true };
    [HALL_FEATURE_NAMES.PRIVATE_ROOM_GOLD_BAR] =  { featureVer = 1, supportDefault = true };
    [HALL_FEATURE_NAMES.ONLOOKER_MATCH] =  { featureVer = 1, supportDefault = false };
}

HallFeatureManager.getInstance = function()
    if not HallFeatureManager.s_instance then
        HallFeatureManager.s_instance = new (HallFeatureManager);
    end

    return HallFeatureManager.s_instance;
end

HallFeatureManager.ctor = function(self)
    self.m_gameSupportFeatureMap = {};
end

--@brief 是否支持比赛模块
HallFeatureManager.isGameSupportMatchFeature = function(self, gameId)
    return self:__isSupport(gameId, HALL_FEATURE_NAMES.MATCH);
end

--@brief 是否支持积分房模块
HallFeatureManager.isGameSupportPrivateRoomScoreFeature = function(self, gameId)
    return self:__isSupport(gameId, HALL_FEATURE_NAMES.PRIVATE_ROOM_SCORE);
end

--@brief 是否支持私人房银币场
HallFeatureManager.isGameSupportPrivateRoomSilverCoinFeature = function(self, gameId)
    return self:__isSupport(gameId, HALL_FEATURE_NAMES.PRIVATE_ROOM_SILVER_COIN);
end

--@brief 是否支持私人房金条场
HallFeatureManager.isGameSupportPrivateRoomGoldBarFeature = function(self, gameId)
    return self:__isSupport(gameId, HALL_FEATURE_NAMES.PRIVATE_ROOM_GOLD_BAR);
end

--@brief 是否支持围观
HallFeatureManager.isGameSupportOnlookerMatchFeature = function(self, gameId)
    return self:__isSupport(gameId, HALL_FEATURE_NAMES.ONLOOKER_MATCH);
end

HallFeatureManager.__isSupport = function(self, gameId, moudleName)
    if not gameId then
        return false;
    end

    local featureConfig = HALL_FEATURE_VERSION[moudleName];
    local supportDefault = featureConfig.supportDefault;
    local featureVer = featureConfig.featureVer;

    --如果gameSupportFeatureConfig为空，则默认为都支持
    if not self.m_gameSupportFeatureMap[gameId] then 
        return supportDefault;
    end

    local gameFeatureVersion = number.valueOf(self.m_gameSupportFeatureMap[gameId][moudleName], 0);

    return (featureVer == gameFeatureVersion) and true or false;
end

--[[
    格式和 HALL_FEATURE_VERSION_ENUMS一致
    gameSupportFeatureConfig = {
        ["match"] = 1,
        ...
    }
    如果gameSupportFeatureConfig为nil值，则默认为都支持
    如果gameSupportFeatureConfig为table的话，则游戏应该将所有模块都配置好 否则会认为是不支持该模块
]]
HallFeatureManager.setGameSupportFeatureConfig = function(self, gameId, gameSupportFeatureConfig)
    self.m_gameSupportFeatureMap[gameId] = gameSupportFeatureConfig;
end
