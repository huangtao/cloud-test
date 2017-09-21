require("games/common2/match/module/matchLayerBase");

local MatchLoadingLayer = class(MatchLayerBase);

MatchLoadingLayer.parseViewConfig = function(self)
    local viewConfig = {
        ["onlooker"] = {};
    };

    return viewConfig;
end

-- 初始化layer的配置
MatchLoadingLayer.initViewConfig = function(self)
	self.m_viewConfig = GameMatchConfig.matchLoading;
	if not self.m_viewConfig then 
		self.m_viewConfig = {
			[1] = {
				path = "games/common2/match/module/matchLoading/matchLoadingView";
				pos = {};
				viewLayer = "view/kScreen_1280_800/games/common2/match/match_loading_layout";
				viewConfig = "match_loading_layout";
			};
		};
	end 
end

MatchLoadingLayer.showLoadingLayer = function(self,seat,uid,info,isFast)
	if isFast then 
		self:closeLayer();
	else 
		self:showLayer();
	end 
end

MatchLoadingLayer.init = function(self)
	self:closeLayer();
end

MatchLoadingLayer.closeLoadingLayer = function(self,seat,uid,info,isFast)
	self:closeLayer();
	
	local action = MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS;
    local info = {};
    info.viewName = MatchMechineConfig.VIEW_LOADING;
    MatchMechine.getInstance():receiveAction(action,info);
end

MatchLoadingLayer.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE] 		= "closeLoadingLayer";
    [MatchMechineConfig.STATUS_LOADING] 	= "showLoadingLayer";
    [MatchMechineConfig.STATUS_PLAYING]   	= "closeLoadingLayer";
    [MatchMechineConfig.STATUS_WAITING] 	= "closeLoadingLayer";
    [MatchMechineConfig.STATUS_FINISH]   	= "closeLoadingLayer";
};

return MatchLoadingLayer;

--[[
	赛前等待

	监听动作：
    MatchMechineConfig.ACTION_SIGNUP_SUCCES      	--报名成功
    MatchMechineConfig.ACTION_GET_PLAYER_COUN    	--收到比赛报名人数
    MatchMechineConfig.ACTION_GET_CHAT_MSG       	--收到聊天信息
    MatchMechineConfig.ACTION_STAR               	--比赛开始

    监听状态：
    MatchMechineConfig.STATUS_NONE 					--非比赛中
	MatchMechineConfig.STATUS_PLAYING				--游戏阶段
	MatchMechineConfig.STATUS_WAITING				--赛间等待
    MatchMechineConfig.STATUS_FINISH				--比赛结束
]]