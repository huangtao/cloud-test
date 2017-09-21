require("games/common2/match/matchMechine/matchMechineConfig");

local MatchNoStateAction = class();

MatchNoStateAction.ctor = function(self,uid)
	self.m_uid = uid or UserBaseInfoIsolater.getInstance():getUserId();
end

MatchNoStateAction.dtor = function(self)
end

MatchNoStateAction.isNoStateAction = function(self,action)
	return MatchNoStateAction.noStateActionConfig[action];
end

MatchNoStateAction.updateNoStateInfo = function(self,action,info,isFast,tag)
	if MatchNoStateAction.noStateActionConfig[action] then
		MatchNoStateAction.noStateActionConfig[action](self,action,info,isFast,tag);
	end
end

MatchNoStateAction.sendBroadCastMsg = function(self,action,info,isFast,tag)
	local localseat = PlayerSeat.getInstance():getMyLocalSeat();

	EventDispatcher.getInstance():breadthDispatch(MatchMechineConfig.NOTIFY_ACTION,
			action,localseat,self.m_uid,info,isFast);
end

MatchNoStateAction.onNotifyView = function(self,action,info,isFast,tag)
	self:sendBroadCastMsg(action,info,isFast,tag);
end

MatchNoStateAction.noStateActionConfig = {
	[MatchMechineConfig.ACTION_GET_CHAT_MSG] 			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_RANK_DETAIL]			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_SHOW_RULE_VIEW]			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_HIDE_RULE_VIEW]			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_RULE_INFO]			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_ENTER_NOTIFY] 		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS] 		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_BASECHIP_INFO] 		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_PLAYER_COUNT] 		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_NS_FORCE_EXIT] 			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_TABLE_INFO]			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_STAGE_INFO]			= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_STAGE_POS]	 		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_GET_PLAYER_SCORE]		= MatchNoStateAction.onNotifyView,

	[MatchMechineConfig.ACTION_ANIM_MATCH_START]		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_ANIM_MATCH_FUSAI]		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_ANIM_MATCH_JUESAI]		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI]		= MatchNoStateAction.onNotifyView,

	[MatchMechineConfig.ACTION_EXIT_FAIL]				= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_ANIM_MATCH_START_COUNTDOWN] = MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_NS_SHOW_FAIL_TIPS]		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_NS_RANK_REWARD_CLICK]	= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS]		= MatchNoStateAction.onNotifyView,
	[MatchMechineConfig.ACTION_REQUEST_RANK_DETAIL]		= MatchNoStateAction.onNotifyView,
};

return MatchNoStateAction;