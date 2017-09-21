require("common/commonGameLayer");

local MatchStageInfoDetail = class(CommonGameLayer,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end
MatchStageInfoDetail.s_controls = {
	stageName 		= getIndex();
	baseChip        = getIndex();
	matchRule 		= getIndex();
	matchPromot 	= getIndex();
	ruleDetail 		= getIndex();
	matchPromotView = getIndex();
};

MatchStageInfoDetail.ctor = function(self,data)
	local layout = require("view/kScreen_1280_800/games/common2/match/match_stage_info_detail");
	super(self,layout);
	self:setFillParent(true,true);

	self.m_ctrls = MatchStageInfoDetail.s_controls;

	self:_initView(data);
end

MatchStageInfoDetail.refreshData = function(self,data)
	self:_initView(data);
end

MatchStageInfoDetail._initView = function(self,data)
	data = table.verify(data);

	local stageNameStr = self:findViewById(self.m_ctrls.stageName);
	stageNameStr:setText(data.stageName or "");

	local baseChipStr = self:findViewById(self.m_ctrls.baseChip);
	baseChipStr:setText(data.baseChip or "");

	local matchRuleStr = self:findViewById(self.m_ctrls.matchRule);
	matchRuleStr:setText(data.stageRule or "");

	local matchPromotStr = self:findViewById(self.m_ctrls.matchPromot);
	matchPromotStr:setText(data.promotionTips or "");

	local w = self:getSize();
	local ruleDetailStr = self:findViewById(self.m_ctrls.ruleDetail);
	ruleDetailStr:setText(data.ruleDetail or "",w);


	local matchPromotView = self:findViewById(self.m_ctrls.matchPromotView);
	matchPromotView:setVisible(data.isShowPromot);
end

MatchStageInfoDetail.s_controlConfig = {
	[MatchStageInfoDetail.s_controls.stageName]			= {"stageNameView","stageName"};
	[MatchStageInfoDetail.s_controls.baseChip]			= {"baseChipView","baseChip"};
	[MatchStageInfoDetail.s_controls.matchRule]			= {"matchRuleView","matchRule"};
	[MatchStageInfoDetail.s_controls.matchPromot]		= {"matchPromotView","matchPromot"};
	[MatchStageInfoDetail.s_controls.ruleDetail]		= {"matchRuleDetail"};
	[MatchStageInfoDetail.s_controls.matchPromotView]	= {"matchPromotView"};
};

return MatchStageInfoDetail;