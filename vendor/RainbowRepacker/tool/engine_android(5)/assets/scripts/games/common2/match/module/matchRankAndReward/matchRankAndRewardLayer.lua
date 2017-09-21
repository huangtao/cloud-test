require("games/common2/match/module/matchLayerBase");

local MatchRankAndRewardLayer = class(MatchLayerBase);

-- 初始化layer的配置
MatchRankAndRewardLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchRankAndReward;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchRankAndReward/matchRankAndRewardView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_rank_reward_layout";
			};
		};
	end 
end

return MatchRankAndRewardLayer;