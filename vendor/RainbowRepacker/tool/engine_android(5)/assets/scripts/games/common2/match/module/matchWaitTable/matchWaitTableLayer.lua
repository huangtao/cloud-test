require("games/common2/match/module/matchLayerBase");

local MatchWaitTableLayer = class(MatchLayerBase);

MatchWaitTableLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchWaitTableLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchWaitTable;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchWaitTable/matchWaitTableView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_wait_table_layout";
				viewConfig = "match_wait_table_layout";
			};
		};
	end 
end

MatchWaitTableLayer.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE] 		= "closeLayer";
    [MatchMechineConfig.STATUS_LOADING] 	= "closeLayer";
    [MatchMechineConfig.STATUS_PLAYING]   	= "closeLayer";
    [MatchMechineConfig.STATUS_WAITING] 	= "showLayer";
    [MatchMechineConfig.STATUS_FINISH]   	= "closeLayer";
}
return MatchWaitTableLayer;

--[[
	配桌等待

	监听动作：
	MatchMechineConfig.ACTION_WAIT_TABLE		--等待配桌
    MatchMechineConfig.ACTION_GAME_OVER			--局结束
    MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY	--复活通知
    MatchMechineConfig.ACTION_ROUND_OVER		--轮结束

    配置：
    --配桌等待显示位置
    config = {
				align = kAlignCenter;
				x = 0;
				y = 0;
			};
]]