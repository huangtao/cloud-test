require("games/common2/match/module/matchLayerBase");

local MatchReviveLayer = class(MatchLayerBase);

MatchReviveLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchReviveLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchRevive;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchRevive/matchReviveView2";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_revive_layout_2";
				viewConfig = "match_revive_layout_2";
			};
		};
	end 
end

return MatchReviveLayer;

--[[
	复活提示

	监听动作：
    MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY      	--收到复活赛通知
]]