require("games/common2/match/module/matchLayerBase");

local MatchTipsLayer = class(MatchLayerBase);

-- 初始化layer的配置
MatchTipsLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchTips;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchTips/matchTipsView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_tips_layout";
				viewConfig = "match_tips_layout";
				config = {
					align = kAlignTop;
					x = 0;
					y = 80;
					isShow = true;
					-- color = {254, 207, 141};
				};
			};
		};
	end 
end

MatchTipsLayer.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE] 		= "closeLayer";
    [MatchMechineConfig.STATUS_LOADING] 	= "closeLayer";
    [MatchMechineConfig.STATUS_PLAYING]   	= "showLayer";
    [MatchMechineConfig.STATUS_WAITING] 	= "closeLayer";
    [MatchMechineConfig.STATUS_FINISH]   	= "closeLayer";
};

return MatchTipsLayer;

--[[
	比赛底注提示

	监听动作：
	MatchMechineConfig.ACTION_START  				--比赛开始
	MatchMechineConfig.ACTION_GET_BASECHIP_INFO 	--底注信息

	配置：
	--配置底注提示显示位置
	config = {
					align = kAlignTop; --对齐
					x = 0;
					y = 80;
					isShow = true; --是否显示，710以上版本默认显示，不需要显示该提示的游戏自行配置不显示
					color = {r,g,b};--文本自定义显示颜色
				};
]]