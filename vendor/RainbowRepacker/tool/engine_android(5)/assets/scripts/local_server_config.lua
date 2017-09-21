--[[
    本地服务器连接配置
]]

require("isolater/interface/gameConstantIsolater");
local local_server_config = {
    switch = false; --开关 如果为true，则连接本地服务器，并直接跳到指定房间内
    ip = "127.0.0.1"; --ip
    port = "8000";    --port
    gameid = 3301;    --gameid  本地需要包含此游戏
    money = 1000000;  --用户金币数  必须大于破产线(20000)
}

local M = {}

--@brief 是否开启
M.isSwitchOpen = function()
    return local_server_config.switch and _DEBUG;
end

--@brief 开始连接本地服务器
--@param mid 用户id
M.connect_local_server = function(mid)
    OnlineSocketManager.getInstance():openSocket();
    kUserInfoData:setUserId(mid);
    kUserInfoData:setMoney(local_server_config.money);
    ServerConfig.getInstance():setUniqueConnectIpPort(local_server_config.ip, local_server_config.port);
    kGameManager:startGame(local_server_config.gameid);
    OnlineSocketManager.getInstance():sendMsg(0x1001, {mid = mid});
end

return M;