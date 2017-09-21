local layerBase = require("games/common2/module/layerBase");

--[[
    房间任务模块、普通、特殊、宝箱任务等
]]

local RoomTaskLayer = class(layerBase);

RoomTaskLayer.ctor = function(self)
end

RoomTaskLayer.dtor = function(self)
    
end

RoomTaskLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
RoomTaskLayer.initViewConfig = function(self)
    local gameconfig = table.verify(GameProcessManager2.getInstance():getGameConfig());
    local missionConfig = table.verify(gameconfig.missionConfig);
    self.m_viewConfig = {
        [1] = {
            path = "games/common2/module/roomTask/gameMissionView2";
            pos = {
                ["x"] = System.getScreenScaleWidth()/2-473/2;
                ["y"] = 220;
            };
            viewLayer = "view/kScreen_1280_800/games/common2/roomMissionScene2";
            viewConfig = "roomMissionScene2";
            config = missionConfig;
        };
    };
end


RoomTaskLayer.show = function(self)
    local seat = PlayerSeat.getInstance():getMyLocalSeat();
    self:addView(seat,self.m_viewConfig[seat])
end

return RoomTaskLayer;

--[[
    牌局任务默认隐藏，
    显示在桌面，牌局任务的进度 ep：连赢3局获得奖励。1/3
    每局结束后会请求刷新进度，完成任务后，打开领奖界面：
        1、创建宝箱界面
        local action = GameMechineConfig.ACTION_NS_CREATVIEW;
        local data = {viewName = GameMechineConfig.VIEW_BOXVIEW}
        MechineManage.getInstance():receiveAction(action,data);
        2、打开宝箱界面
        action = GameMechineConfig.ACTION_NS_SHOWBOXVIEW;
        MechineManage.getInstance():receiveAction(action,info);

    监听动作：
    ACTION_GETTASK/ACTION_COMPLETASK：刷新任务信息
    ACTION_REFRESH_BOX_TASK_INFO：刷新任务进度，完成任务时会触发宝箱弹框

]]