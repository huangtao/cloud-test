
GetRewardAnimManager = class();
GetRewardAnimManager.getInstance = function()
    if not GetRewardAnimManager.instance then
        GetRewardAnimManager.instance = new(GetRewardAnimManager);
    end
    return GetRewardAnimManager.instance;
end

GetRewardAnimManager.play = function (self, data)
    if not self.m_playing and not table.isEmpty(data) then
        self.m_playing = true;
        local getRewardAnim = new(require("hall/animation/getRewardAnim"), data);
        getRewardAnim:play();
    end
end

GetRewardAnimManager.stop = function (self)
    self.m_playing = false;
end




