require("games/common2/match/module/matchLayerBase");

local MatchWaitingLayer = class(MatchLayerBase);

MatchWaitingLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchWaitingLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchWaiting;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchWaiting/matchWaitingView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_waiting_layout_2";
				viewConfig = "match_waiting_layout_2";
			};
		};
	end 
end

return MatchWaitingLayer;

--[[
	赛间等待

	监听动作：
	MatchMechineConfig.ACTION_ROUND_OVER --轮结束
	MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY -- 收到复活通知

	监听状态：
	MatchMechineConfig.STATUS_NONE 					--非比赛中
	MatchMechineConfig.STATUS_LOADING				--报名成功到比赛开始的等待阶段
	MatchMechineConfig.STATUS_PLAYING				--游戏阶段
	MatchMechineConfig.STATUS_WAITING				--赛间等待
    MatchMechineConfig.STATUS_FINISH				--比赛结束
]]