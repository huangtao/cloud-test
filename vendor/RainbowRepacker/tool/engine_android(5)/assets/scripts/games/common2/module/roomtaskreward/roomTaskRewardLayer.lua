
local layerBase = require("games/common2/module/layerBase");

--[[
	房间保险任务奖励
]]

local RoomTaskReward = class(layerBase);

RoomTaskReward.s_cmds = {
};

RoomTaskReward.ctor = function(self)
	self:removeStateBroadcast();
end

RoomTaskReward.dtor = function(self)
end

RoomTaskReward.parseViewConfig = function(self)
	local viewConfig = {
		["onlooker"] = {};
	};

	return viewConfig;
end

-- 初始化layer的配置
RoomTaskReward.initViewConfig = function(self)
	self.m_viewConfig = {
		[1] = {
			path = "games/common2/module/roomtaskreward/roomTaskRewardView";
		};
		[2] = {
		};
		[3] = {
		};
	};
end

return RoomTaskReward;

--[[
	完成牌任务，领奖奖励
	创建方式
	local action = GameMechineConfig.ACTION_NS_CREATVIEW;
    local data = {viewName = GameMechineConfig.VIEW_BOXVIEW}
    MechineManage.getInstance():receiveAction(action,data);

    监听动作：
    ACTION_NS_SHOWBOXVIEW：显示宝箱界面
    ACTION_NS_OPEN_BOX：打开宝箱，领奖奖励	
]]