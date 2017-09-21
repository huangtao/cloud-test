require("games/common2/match/module/matchLayerBase");

local MatchExitLayer = class(MatchLayerBase);

MatchExitLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchExitLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchExit;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchExit/matchExitView";
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_exit_layout";
				viewConfig = "match_exit_layout";
			};
		};
	end 
end

return MatchExitLayer;

--[[
	比赛场退赛提示

	监听动作：
	MatchMechineConfig.ACTION_REQUEST_EXIT		--请求退赛
	MatchMechineConfig.ACTION_START				--比赛开始
	MatchMechineConfig.ACTION_FINISH			--比赛结束
]]