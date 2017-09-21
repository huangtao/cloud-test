require("games/common2/match/module/matchLayerBase");

local MatchDetailInfoLayer = class(MatchLayerBase);

-- 初始化layer的配置
MatchDetailInfoLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchDetailInfo;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchDetailInfo/matchDetailInfoView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_detail_layout";
			};
		};
	end 
end

return MatchDetailInfoLayer;

--[[
	比赛场底部详情模块
	展示了玩家名字、积分、排名、比赛详情

	监听动作：
	MatchMechineConfig.ACTION_START				--比赛开始
	MatchMechineConfig.ACTION_GET_PLAYER_SCOR	--收到玩家积分
	MatchMechineConfig.ACTION_GET_TABLE_INFO	--比赛排名信息
    MatchMechineConfig.ACTION_GET_STAGE_INFO    --比赛阶段信息(当前第几轮第几局)
    MatchMechineConfig.ACTION_GET_BASECHIP_INFO --比赛底注信息
    MatchMechineConfig.ACTION_GET_STAGE_POS		--比赛阶段信息(当前第几阶段)

    配置：
	--配置底注提示显示位置
	config = {
				isShowWeedoutScore = false; --是否显示淘汰分数，710以上版本默认不显示(不配置时也为不显示)，需要显示的游戏请自行配置
			};
]]