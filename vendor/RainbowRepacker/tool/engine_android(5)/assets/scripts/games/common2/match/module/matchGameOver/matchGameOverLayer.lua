require("games/common2/match/module/matchLayerBase");

local MatchGameOverLayer = class(MatchLayerBase);

-- 初始化layer的配置
MatchGameOverLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchGameOver;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchGameOver/matchGameOverView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_null_layout";
				viewConfig = "match_null_layout";
			};
		};
	end 
end

return MatchGameOverLayer;

--[[
	比赛结算，每局打完用于展示输赢分数

	监听动作：
	MatchMechineConfig.ACTION_GAME_OVER				--每局游戏结束
    MatchMechineConfig.ACTION_ROUND_OVER			--轮结束
    MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY		--收到复活赛通知
    MatchMechineConfig.ACTION_GET_STAGE_INFO   		--比赛阶段信息(当前第几轮第几局)
    MatchMechineConfig.ACTION_GET_TABLE_INFO		--排名信息
    MatchMechineConfig.ACTION_REVIVE_SUCCESS		--复活成功
    MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI		--播放淘汰动画
    MatchMechineConfig.ACTION_WAIT_TABLE			--等待配桌

    监听状态：
    MatchMechineConfig.STATUS_NONE 					--非比赛中
	MatchMechineConfig.STATUS_PLAYING				--游戏阶段
    MatchMechineConfig.STATUS_FINISH				--比赛结束

    说明：
    使用比赛结算时，请仔细阅读MatchGameOverView.showMatchGameOver的参数说明
]]