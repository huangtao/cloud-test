require("gameData/gameData");

local CityData = class(GameData);
CityData.getCityData = function(self)
    local data = require("hall/userInfo/data/cityDefaultData");
    return data;
end

return CityData;