require("games/common2/match/module/matchLayerBase");

local MatchOverLayer = class(MatchLayerBase);

MatchOverLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchOverLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchFinish;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchFinish/matchOverView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_over_layout";
				viewConfig = "match_over_layout";
			};
		};
	end 
end

MatchOverLayer.init = function(self)
	self:closeLayer();
end

MatchOverLayer.showMatchOver = function(self,seat,uid,info,isFast)
	if isFast then 
		self:showLayer();
	else 
		self:_startDelayTimer(1000,self,self.showLayer);
	end 
end

MatchOverLayer.closeMatchOver = function(self,seat,uid,info,isFast)
	local action = MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS;
    local info = {};
    info.viewName = MatchMechineConfig.VIEW_OVER;
    MatchMechine.getInstance():receiveAction(action,info);
end

MatchOverLayer.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE] 		= "closeMatchOver";
    [MatchMechineConfig.STATUS_LOADING] 	= "closeMatchOver";
    [MatchMechineConfig.STATUS_PLAYING]   	= "closeMatchOver";
    [MatchMechineConfig.STATUS_WAITING] 	= "closeMatchOver";
    [MatchMechineConfig.STATUS_FINISH]   	= "showMatchOver";
};

return MatchOverLayer;

--[[
	比赛结束,奖状

	监听动作：
	MatchMechineConfig.ACTION_FINISH							--比赛结束
	MatchMechineConfig.ACTION_FINISH_REWARD						--比赛颁奖
	GameMechineConfig.ACTION_NS_WEIXIN_SHARE_CALLBACK			--微信分享回调
	GameMechineConfig.ACTION_NS_DOWNLOAD_SHARE_IMAGE_CALLBACK   --下载分享图片回调

	监听状态：
	MatchMechineConfig.STATUS_NONE 		--非比赛中
	MatchMechineConfig.STATUS_LOADING   --报名成功到比赛开始的等待阶段
]]