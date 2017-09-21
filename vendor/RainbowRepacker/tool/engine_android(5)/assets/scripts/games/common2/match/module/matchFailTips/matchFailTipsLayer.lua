require("games/common2/match/module/matchLayerBase");

local MatchFailTipsLayer = class(MatchLayerBase);

MatchFailTipsLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchFailTipsLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchFailTips;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchFailTips/matchFailTipsView";
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_fail_layout";
			};
		};
	end 
end

return MatchFailTipsLayer;