require("games/common2/match/module/matchLayerBase");

--[[
	动画层
]]

local MatchAnimLayer = class(MatchLayerBase);

MatchAnimLayer.ctor = function(self)
	
end

MatchAnimLayer.dtor = function(self)
end

-- 初始化layer的配置
MatchAnimLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchAnimLayer;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchAnim/matchAnimView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_anim_layout";
				viewConfig = "match_anim_layout";
			};
		};
	end 
end

return MatchAnimLayer;


--[[
	比赛场动画模块

	监听动作：
	MatchMechineConfig.ACTION_ANIM_MATCH_STAR	-- 开始比赛动画
	MatchMechineConfig.ACTION_ANIM_MATCH_FUSAI 	-- 复赛动画
	MatchMechineConfig.ACTION_ANIM_MATCH_JUESAI -- 决赛动画
	MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI	-- 淘汰动画
]]