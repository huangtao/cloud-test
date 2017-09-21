--[[
	比赛动画逻辑处理
]]
local viewBase = require("games/common2/module/viewBase");

local MatchAnimView = class(viewBase, false);

MatchAnimView.ctor = function(self,seat)
	super(self);
	self.m_seat = seat;
    self:setFillParent(true, true);
end

MatchAnimView.dtor = function(self)
end

MatchAnimView.matchStart= function ( self, seat, uid, info, isFast )
	Log.v("MatchAnimView.startGame", "seat uid info isFast", seat, uid, info, isFast);
	if not isFast then
		local AnimMatchStart = require("games/common2/match/animation/animMatchStart");
		local node = AnimMatchStart.play();
		self:addChild(node);
	end
end

MatchAnimView.matchFusai= function ( self, seat, uid, info, isFast )
	if not isFast then
		local AnimMatchFusai = require("games/common2/match/animation/animMatchFusai");
		local node = AnimMatchFusai.play();
		self:addChild(node);
	end
end

MatchAnimView.matchJuesai= function ( self, seat, uid, info, isFast )
	if not isFast then
		local AnimMatchJuesai = require("games/common2/match/animation/animMatchJuesai");
		local node = AnimMatchJuesai.play();
		self:addChild(node);
	end
end

MatchAnimView.matchTaotai= function ( self, seat, uid, info, isFast )
	if not isFast then
		local AnimMatchTaotai = require("games/common2/match/animation/animMatchTaotai");
		local node = AnimMatchTaotai.play();
		self:addChild(node);
	end
end

MatchAnimView.matchStartCountDown= function ( self, seat, uid, info, isFast )
	if not isFast then
		local AnimMatchStartCountdown = require("games/common2/match/animation/animMatchStartCountdown");
		local node = AnimMatchStartCountdown.play();
		self:addChild(node);
	end
end

MatchAnimView.s_actionFuncMap = {
	[MatchMechineConfig.ACTION_ANIM_MATCH_START]			= "matchStart";
	[MatchMechineConfig.ACTION_ANIM_MATCH_FUSAI]			= "matchFusai";
	[MatchMechineConfig.ACTION_ANIM_MATCH_JUESAI]			= "matchJuesai";
	[MatchMechineConfig.ACTION_ANIM_MATCH_TAOTAI]			= "matchTaotai";
	[MatchMechineConfig.ACTION_ANIM_MATCH_START_COUNTDOWN] 	= "matchStartCountDown";
};

MatchAnimView.s_stateFuncMap = {
}
return MatchAnimView;