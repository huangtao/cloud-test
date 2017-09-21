local match_gameover_detail = require(ViewPath .. "/games/common2/match/match_gameover_detail");


local MatchGameOverDetail = class(CommonGameLayer, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end
MatchGameOverDetail.s_controls = {
	infoView 	= getIndex(),	
	score 		= getIndex(),
	icon 		= getIndex(),
	detailView 	= getIndex(),
	detailBtn 	= getIndex(),
};


--比赛结算框
MatchGameOverDetail.ctor = function(self,data)
	super(self,match_gameover_detail);
	self:setSize(self.m_root:getSize());
	self.m_ctrls = MatchGameOverDetail.s_controls;
	self:_initView();
	self:showDetailView(data);
end

MatchGameOverDetail.dtor = function(self)
end
---------------------------------------------------------------------
MatchGameOverDetail.showDetailView = function(self,data)
	if table.isEmpty(data) then
		return;
	end
	
	self:_refreshInfo(data);

	if data.mid == UserBaseInfoIsolater.getInstance():getUserId() then
		self:_showDetailInfo();
	end 

	self:setVisible(true);
end

MatchGameOverDetail.closeDetailView = function(self)
	self:_hideDetailInfo();
end
---------------------------------------------------------------------
MatchGameOverDetail._initView = function(self)
	self.m_infoView = self:findViewById(self.m_ctrls.infoView);
	self.m_score = self:findViewById(self.m_ctrls.score);
	self.m_icon = self:findViewById(self.m_ctrls.icon);
	self.m_detailView = self:findViewById(self.m_ctrls.detailView);
	self.m_detailBtn = self:findViewById(self.m_ctrls.detailBtn);
	
	local data = {};
	_,data.infoViewHeight = self.m_infoView:getSize();
	_,data.detailViewHeight = self.m_detailView:getSize();
	self.m_defaultSize = data;

	self:_hideDetailInfo();
end

--参数说明
-- data = {
-- 	["mid"] = mid;					--mid:玩家mid
-- 	["score"] = score; 				--玩家输赢积分
-- 	["detailInfo"] = { 				--输赢的详细信息
-- 		[1] = {
-- 			["name"] = name; 		--展示内容1：如炸弹,春天,胡牌,自摸等
-- 			["content"] = content;	--展示内容2：如6倍,x3,2番等
-- 		};
-- 		...
-- 	};
-- 	["btn_pos"] = { --比赛详情按钮相对与详情框的位置
-- 		["align"] = align;		
-- 		["x"] = x;				
-- 		["y"] = y;		
-- 	};	
-- };
MatchGameOverDetail._refreshInfo = function(self,data)	
	data = table.verify(data);
	local score = number.valueOf(data.score);
	local detailInfo = table.verify(data.detailInfo);

	if score > 0 then 
		self.m_score:setText(string.concat("+", score));		
		self.m_score:setColor(255, 255, 0);

		self.m_icon:setFile("games/common/match/match_gameover/icon_win.png");	
	else 
		self.m_score:setText(score);		
		self.m_score:setColor(167, 145, 241);

		self.m_icon:setFile("games/common/match/match_gameover/icon_lose.png");
	end

	-- add detail
	self.m_detailView:removeAllChildren(); -- remove all node before
	local y = 0;
	for k, v in ipairs(detailInfo) do
		if type(v) == "table" then 
			local tv = new(Text, string.concat(v.name or "", "　　", v.content or ""), nil, 40, kAlignTop, nil, 28, 255,255,255);
			tv:setAlign(kAlignTop);
			local y = (k-1)*40;
			tv:setPos(0, y);
			self.m_detailView:addChild(tv);

			h = k*40;
		end 	 
	end

	local detailViewHeight = number.valueOf(self.m_defaultSize.detailViewHeight);
	local infoViewHeight = number.valueOf(self.m_defaultSize.infoViewHeight);

	local diff = h - detailViewHeight;
	local height = diff > 0 and infoViewHeight + diff or infoViewHeight;
	self.m_root:setSize(nil,height);
	self:setSize(nil,height);

	local pos = table.verify(data.btn_pos);
	if pos.align then 
		self.m_detailBtn:setAlign(pos.align);
	end 
	if pos.x or pos.y then 
		self.m_detailBtn:setPos(pos.x or 0,pos.y or 0);
	end 
end

MatchGameOverDetail._hideDetailInfo = function(self)
	self.m_infoView:setVisible(false);
end

MatchGameOverDetail._showDetailInfo = function(self)
	self.m_infoView:setVisible(true);
end
---------------------------------------------------------------------
MatchGameOverDetail.onDetailBtnClick = function(self)
	local isVisible = self.m_infoView:getVisible();
	if isVisible then 
		self:_hideDetailInfo();
	else 
		self:_showDetailInfo();
	end 
end
----------------------------------------------------------------------
MatchGameOverDetail.s_controlConfig = {
	[MatchGameOverDetail.s_controls.infoView]		= {"infoBg"};
	[MatchGameOverDetail.s_controls.score]			= {"infoBg", "topView","title"};
	[MatchGameOverDetail.s_controls.icon]			= {"infoBg","topView","icon"};
	[MatchGameOverDetail.s_controls.detailView]		= {"infoBg", "detailView"};
	[MatchGameOverDetail.s_controls.detailBtn]		= {"detailBtn"};
}

MatchGameOverDetail.s_controlFuncMap = {
	[MatchGameOverDetail.s_controls.detailBtn] 		= MatchGameOverDetail.onDetailBtnClick;
};

return MatchGameOverDetail;