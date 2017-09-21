require("games/common2/match/module/matchLayerBase");

local MatchRuleLayer = class(MatchLayerBase);

-- 初始化layer的配置
MatchRuleLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchRule;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchRule/matchRuleView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_rule_layout";
			};
		};
	end 
end

return MatchRuleLayer;

--[[
	监听动作：
	MatchMechineConfig.ACTION_SHOW_RULE_VIEW	显示赛制
	MatchMechineConfig.ACTION_HIDE_RULE_VIEW	隐藏赛制
    MatchMechineConfig.ACTION_GET_RULE_INFO		获取赛制信息

]]