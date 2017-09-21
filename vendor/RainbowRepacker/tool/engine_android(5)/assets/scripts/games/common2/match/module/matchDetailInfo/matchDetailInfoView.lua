
local ViewBase = require("games/common2/module/viewBase");

local MatchDetailInfoView = class(ViewBase,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

MatchDetailInfoView.s_controls = {
	shield 			= getIndex();
	userName		= getIndex();
	userScore		= getIndex();
	rankView 		= getIndex();
	userRank 		= getIndex();
	stageBtn   		= getIndex();
	stageBtnName 	= getIndex();
	stageInfoView	= getIndex();
	stageInfo 		= getIndex();
	infoBg 			= getIndex();
	stageTitle 		= getIndex();
	userRankIcon 	= getIndex();
};

MatchDetailInfoView.ctor = function(self,seat,viewConfig)
	super(self, viewConfig);
	self.m_ctrls = MatchDetailInfoView.s_controls;
	self:setFillParent(true,true);

	MatchIsolater.getInstance():setObserver(self);

	self:_initView();
end

MatchDetailInfoView.dtor = function(self)
	MatchIsolater.getInstance():clearObserver(self);
end

MatchDetailInfoView.parseConfig = function(self,config)
	config = table.verify(config);
	self.m_isShowWeedoutScore = config.isShowWeedoutScore;
end
--------------------------------------------------------------------
MatchDetailInfoView.onSheildTouch = function(self,finger_action)
	if finger_action == kFingerUp then
		self.m_stageInfoView:setVisible(false);
		self.m_shield:setVisible(false);
	end 
end

MatchDetailInfoView.onStageBtnClick = function(self)
	local isVisible = self.m_stageInfoView:getVisible();

	self.m_stageInfoView:setVisible(not isVisible);
	self.m_shield:setVisible(not isVisible);
end

MatchDetailInfoView.onEmpty = function(self)
end

MatchDetailInfoView.onRankViewTouch = function(self,finger_action,x,y,drawing_id_first,drawing_id_current)
	local rankView = self:findViewById(self.m_ctrls.rankView);
	if finger_action == kFingerDown or finger_action == kFingerMove then 
		rankView:setColor(128,128,128);
	else 
		rankView:setColor(255,255,255);
		if drawing_id_first == drawing_id_current then
			local action = MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS;
			local info = {};
			info.viewName = MatchMechineConfig.VIEW_RANK_REWARD;
			MatchMechine.getInstance():receiveAction(action,info);

			local action = MatchMechineConfig.ACTION_NS_RANK_REWARD_CLICK;
    		MatchMechine.getInstance():receiveAction(action);
		end 
	end 
end
--------------------------------------------------------------------
-- MatchIsolater deglete
MatchDetailInfoView.onResponseMatchBasicInfo = function(self,data)
   self:refreshMatchInfo();
end
--------------------------------------------------------------------
MatchDetailInfoView._initView = function(self)
	self.m_shield = self:findViewById(self.m_ctrls.shield);
	self.m_stageInfoView = self:findViewById(self.m_ctrls.stageInfoView);
	self.m_stageInfoStr = self:findViewById(self.m_ctrls.stageInfo);
	self.m_stageBtn = self:findViewById(self.m_ctrls.stageBtn);
	self.m_stageBtnName = self:findViewById(self.m_ctrls.stageBtnName);

	local infoBg = self:findViewById(self.m_ctrls.infoBg);
	infoBg:setLevel(0);
	self.m_shield:setLevel(1);

	
	self:_resetStageInfoView();
	self:_resetRankView();

	local view = {};
	view.w,view.h = self.m_stageInfoView:getSize();
	local info = {};
	info.w,info.h = self.m_stageInfoStr:getSize();
	local btn = {};
	btn.w,btn.h = self.m_stageBtn:getSize();
	local btnName = {};
	btnName.w,btnName.h = self.m_stageBtnName:getSize();
	
	local data = {};
	data.stageView = view;
	data.stageInfo = info;
	data.stageBtn = btn;
	data.stageBtnName = btnName;
	self.m_defaultSize = data;
	
	self:_refreshUserName();
	self:refreshMatchInfo();

	self:onGetPlayersScore(nil,nil,MatchIsolater.getInstance():getMatchScoreInfo());
end

MatchDetailInfoView._resetStageInfoView = function(self)
	local stageTitle = self:findViewById(self.m_ctrls.stageTitle);
	if stageTitle then 
		stageTitle:setVisible(false);
	end 

	self.m_stageInfoView:setFile("games/common/match/matchDetailInfo/stage_info_bg_1.png");
	local w = self.m_stageInfoView.m_res:getWidth();
   	local h = self.m_stageInfoView.m_res:getHeight();
	self.m_stageInfoView:setSize(w,h);
	self.m_stageInfoStr:setSize(450,180);
	self.m_stageInfoStr:setPos(0,100);
	self.m_stageInfoStr:setAlign(kAlignTop);
end

MatchDetailInfoView._resetRankView = function(self)
	local rankView = self:findViewById(self.m_ctrls.rankView);
	if rankView then 
		local img = UIFactory.createImage("games/common/match/matchDetailInfo/rank_btn.png",nil,nil,58,30,23,23);
		rankView:addChild(img);
		img:setFillParent(true,false);
		img:setLevel(-1);
		img:setAlign(kAlignCenter);
	end 

	local userRankIcon = self:findViewById(self.m_ctrls.userRankIcon);
	if userRankIcon then 
		userRankIcon:setVisible(false);
	end 
end

MatchDetailInfoView._refreshUserName = function(self)
	local userName = self:findViewById(self.m_ctrls.userName);
	local name = UserBaseInfoIsolater.getInstance():getNickname();

	local curState = MatchMechine.getInstance():getStates();
	if curState == MatchMechineConfig.STATUS_ONLOOKER then 
		local userId = GameRoomData.getInstance():getInfoByType("onlookerId");
		local player = GamePlayerManager2.getInstance():getPlayerByMid(userId);
		name = player and player:getNick() or "";
	end

	userName:setText(ToolKit.formatNick(name, 8));
end

MatchDetailInfoView._getWeedOutTips = function(self,weedOutScore)
	weedOutScore = tonumber(weedOutScore);
	if weedOutScore then 
		return string.format("低于%s被淘汰",ToolKit.skipMoneyEx2(weedOutScore));
	else 
		return "";
	end 
end

MatchDetailInfoView._refreshScore = function(self,score,weedOutScore)
	Log.d("MatchDetailInfoView._refreshScore","score = ",score,"weedOutScore = ",weedOutScore);
	score = tonumber(score);
	local scoreTips = score or "";
	local weedOutTips = "";
	if self.m_isShowWeedoutScore and (self.m_curStage and self.m_curStage == 1 )then 
		scoreTips = ToolKit.skipMoneyEx2(score or "");

		weedOutScore = tonumber(weedOutScore);
		if score and weedOutScore then 
			weedOutTips = string.format("(%s)",self:_getWeedOutTips(weedOutScore));
		end 
	end 

	local userScoreTips = string.format("%s%s",scoreTips,weedOutTips);
	Log.d("MatchDetailInfoView._refreshScore","userScoreTips = ",userScoreTips);
	local userScore = self:findViewById(self.m_ctrls.userScore);
	userScore:setText(userScoreTips);
end

MatchDetailInfoView._refreshRank = function(self,rank,totalNum)
	local userRank = self:findViewById(self.m_ctrls.userRank);
	userRank:setText(string.concat(number.valueOf(rank), "/", number.valueOf(totalNum)),10,nil,120,86,36);

	local x = userRank:getPos();
	local w = userRank:getSize();
	local rankView = self:findViewById(self.m_ctrls.rankView);
	rankView:setSize(x+w+25,nil);
end

MatchDetailInfoView._refreshDetailBtnName = function(self)
	local data = self.m_defaultSize;
	local btn = data.stageBtn;
	local btnName = data.stageBtnName;

	local stagePos = self:_getCurStagePos();
	self.m_stageBtnName:setText(stagePos,btnName.w);
	
	local w = self.m_stageBtnName:getSize();
	local btn_w = w > btnName.w and (btn.w + (w - btnName.w)) or btn.w
	self.m_stageBtn:setSize(btn_w,btn.h);
 	
	local x = self.m_stageBtn:getPos();
	local rankView = self:findViewById(self.m_ctrls.rankView);
	rankView:setPos(x + btn_w,nil);
end

MatchDetailInfoView._refreshDetailInfo = function(self)
	local data = {};
	data.matchName = self:_getMatchName();
	data.baseChip = self:_getCurBaseChip();
	data.stageName = self:_getCurStageName();
	data.stageRule = self:_getCurStageRule();
	data.promotionTips = self:_getPromotTips();
	data.ruleDetail = self:_getCurRuleDetail();
	local isFinal = self:_getIsFinalRound();
	data.isShowPromot = not isFinal;
	
	self:_createMatchName();
	self.m_matchNameStr:setText(data.matchName or "");
	
	self:_createStageInfoDetail();
	self.m_stageInfoDetail:refreshData(data);
end

MatchDetailInfoView._getMatchName = function(self)
	local data = MatchIsolater.getInstance():getMatchData();
	local name = data.name or data.mname or "";
	local matchName = string.gsub(name, "#", "");

	return matchName;
end

MatchDetailInfoView._getCurBaseChip = function(self)
	if table.isEmpty(self.m_baseChipInfo) then 
		return;
	end

	return self.m_baseChipInfo.baseScore;
end

MatchDetailInfoView._getCurStageName = function(self)
	local data = MatchIsolater.getInstance():getMatchStageInfo().stageInfo or {};
	if #data <= 1 then --只有一个赛程显示为决赛
		return "决赛";
	end 
	if self.m_curStage == 1 then
		return "初赛";
	end 
	
	local stageName;
	local roundNum = (self.m_stageInfo and self.m_stageInfo.roundNum) or 0;
	roundNum = roundNum or 0;
	for k, v in ipairs(data) do 
		for _, v1 in ipairs(v.rounds) do 
			if number.valueOf(v1) == roundNum then 
				stageName = v.name;
				break;
			end
		end
	end

	return stageName; 
end

--获取晋级和截止比赛人数
MatchDetailInfoView._getMatchPromotAndTillWeedout = function(self)
	local data = table.verify(MatchIsolater.getInstance():getMatchStageInfo());
	if self.m_curStage == 1 then 
		local daliInfo = table.verify(data.daliInfo);
		local promotionNum = number.valueOf(daliInfo.promotionNum,1);
		local TillWeedoutNum = number.valueOf(daliInfo.TillWeedoutNum,1);
		return promotionNum,TillWeedoutNum;
	else 
		local stageInfo = table.verify(data.stageInfo);
		local roundNum = (self.m_stageInfo and self.m_stageInfo.roundNum) or 0;
		roundNum = roundNum or 0;
		local promotionNum = 1;
		for k, v in pairs(stageInfo) do 
			for _, v1 in pairs(v.rounds) do 
				if number.valueOf(v1) == roundNum then 
					promotionNum = v.number;
					break;
				end
			end
		end
		return promotionNum;
	end 
end

MatchDetailInfoView._getCurStageRule = function(self)
	if self.m_curStage == 1 then 
		local name = "打立出局";
		return name;
	else 		
		local info = table.verify(self.m_stageInfo);	
		local stage = info.stage == 2 and "定局移位" or "定局积分";
		return stage;
	end  	
end

MatchDetailInfoView._getCurRuleDetail = function(self)
	if self.m_curStage == 1 then 
		local msg = string.format("当积分低于%s时,将会被淘汰出局。",(self.m_weedOutScore or 0));
		local promotionNum,TillWeedoutNum = self:_getMatchPromotAndTillWeedout();
		msg = string.format("%s剩余%s人时初赛截止,前%s人晋级。",msg,TillWeedoutNum,promotionNum);

		return msg;
	else 	
		if table.isEmpty(self.m_stageInfo) then 
			return "";
		end			

		local info = self.m_stageInfo;	
		local stage = info.stage == 2 and "定局移位" or "定局积分";
		local roundCount = info.roundCount or 1;
		local bureauCount = info.bureauCount or 1;
		local msg = string.format("%s,共%s轮%s局",stage,roundCount,bureauCount);
		if info.roundNum == info.roundCount then 
			msg = string.format("%s,%s局打完后进行积分排名,决出冠军。",msg,bureauCount);
		else 
			local promotionNum = self:_getMatchPromotAndTillWeedout();
			msg = string.format("%s,每轮打完后进行积分排名,前%s名晋级下一阶段。",msg,promotionNum);
		end 
		return msg;
	end  	
end

MatchDetailInfoView._getCurStagePos = function(self)
	if self.m_curStage == 1 then--定时赛的打立阶段
		local promotionNum,TillWeedoutNum = self:_getMatchPromotAndTillWeedout();
		local msg = string.format("%s人截止,前%s人晋级",TillWeedoutNum,promotionNum);
		return msg;
	end 
	if table.isEmpty(self.m_stageInfo) then 
		return "";
	end
	local info = self.m_stageInfo;
	local msg = string.format("第%s轮 第%s/%s局", info.roundNum or 1, info.bureauNum or 1,info.bureauCount or 1);

	return msg;
end

MatchDetailInfoView._getPromotTips = function(self)
	local promotionNum = self:_getMatchPromotAndTillWeedout();
	if self.m_curStage == 1 then
		return string.format("%s人",promotionNum);
	else
		return string.format("前%s名",promotionNum); 
	end 
end

MatchDetailInfoView._getIsFinalRound = function(self)
	if self.m_curStage == 1 then 
		return false;
	else 
		local info = table.verify(self.m_stageInfo);	
		local isFinal = info.roundNum == info.roundCount;
		return isFinal;
	end 
end

MatchDetailInfoView._createMatchName = function(self)
	if not self.m_matchNameStr then 
		self.m_matchNameStr = UIFactory.createText("",30, 10,10, kAlignCenter,255,244,76);
		local stageInfoView = self:findViewById(self.m_ctrls.stageInfoView);
		stageInfoView:addChild(self.m_matchNameStr);
		self.m_matchNameStr:setAlign(kAlignTop);
		self.m_matchNameStr:setPos(0,38);
	end 
end

MatchDetailInfoView._createStageInfoDetail = function(self)
	if not self.m_stageInfoDetail then 
		local MatchStageInfoDetail = require("games/common2/match/module/matchDetailInfo/matchStageInfoDetail");
		self.m_stageInfoDetail = new(MatchStageInfoDetail);
		self.m_stageInfoStr:addChild(self.m_stageInfoDetail);
	end
end
------------------------------------------------------------------------------------------------------
MatchDetailInfoView.onGetPlayersScore = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	for k, v in ipairs(info) do
		local userId = UserBaseInfoIsolater.getInstance():getUserId();
		local curState = MatchMechine.getInstance():getStates();
		if curState == MatchMechineConfig.STATUS_ONLOOKER then 
			userId = GameRoomData.getInstance():getInfoByType("onlookerId");
		end

		if v.mid == userId then 
			self.m_curScore = v.score;
			self:_refreshScore(self.m_curScore,self.m_weedOutScore);
		end
	end
end

MatchDetailInfoView.onGetTableRankInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	local rank;
	local totalNum;

	if info.myRankPos then -- 定局积分
		rank = info.myRankPos;
		totalNum = info.tablePersonCount;
	elseif info.curPos then -- 打立出局
		rank = info.curPos;
		totalNum = info.totalNum;
	end

	self:_refreshRank(rank,totalNum);
end

MatchDetailInfoView.onGetRankDetailInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	local myRankDetail = table.verify(info.myRankDetail);
	if myRankDetail.rank and info.totalNum and info.totalNum > 0 then
		self:_refreshRank(myRankDetail.rank,info.totalNum);
	end 
end


MatchDetailInfoView.refreshMatchBaseChip = function(self,seat,uid,info,isFast)
	info = table.verify(info);

	local data = {};
	data.baseScore = info.baseScore;--当前底注
	data.weedOutScore = info.weedOutScore;--淘汰分数

	self.m_weedOutScore = info.weedOutScore;
	self:_refreshScore(self.m_curScore,self.m_weedOutScore);

	if info.isShow == 0 then 
		self.m_baseChipInfo = data;	
	end 
	self:refreshMatchInfo();	
end

MatchDetailInfoView.refreshMatchStageInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);

	local data = {};
    data.stage = info.stage; -- 阶段 1:打立出局 2:定局移位 3:定局积分
    data.roundNum = info.roundNum;-- 当前轮数
    data.roundCount = info.roundCount;-- 总轮数
    data.bureauNum = info.bureauNum;-- 当前局数
    data.bureauCount = info.bureauCount;-- 总局数

    self.m_curStage = info.stage or 1;
    self.m_stageInfo = data;

    self:refreshMatchInfo();
end

MatchDetailInfoView.refreshMatchStage = function(self,seat,uid,info,isFast)
	info = table.verify(info);

	self.m_curStage = info.stage or 1;

	self:refreshMatchInfo();
end

MatchDetailInfoView.refreshMatchInfo = function(self,seat,uid,info,isFast)	
	self.m_curStage = self.m_curStage or 1;

	self:_refreshDetailInfo();
    self:_refreshDetailBtnName();
end

MatchDetailInfoView.onStartMatch = function(self,seat,uid,info,isFast)
	if self.m_curStage and self.m_curStage ~= 1 then
		self.m_curScore = nil;
		self.m_weedOutScore = nil;
	end

	self:refreshMatchInfo();
end

------------------------------------------------------------------------------------------------------
MatchDetailInfoView.s_controlConfig = {
	[MatchDetailInfoView.s_controls.shield]			= {"shield"};
	[MatchDetailInfoView.s_controls.userName]		= {"info_bg", "userName"};
	[MatchDetailInfoView.s_controls.userScore]		= {"info_bg", "scoreView","userScore"};
	[MatchDetailInfoView.s_controls.rankView]		= {"info_bg", "rankView"};
	[MatchDetailInfoView.s_controls.userRank]		= {"info_bg", "rankView","rank_info"};
	[MatchDetailInfoView.s_controls.stageBtn]		= {"info_bg", "stageBtn"};
	[MatchDetailInfoView.s_controls.stageBtnName]	= {"info_bg", "stageBtn","name"};
	[MatchDetailInfoView.s_controls.stageInfoView]	= {"info_bg", "stageInfoView"};
	[MatchDetailInfoView.s_controls.stageInfo]		= {"info_bg", "stageInfoView","stageInfo"};
	[MatchDetailInfoView.s_controls.infoBg] 		= {"info_bg"};
	[MatchDetailInfoView.s_controls.stageTitle]		= {"info_bg", "stageInfoView","title"};
	[MatchDetailInfoView.s_controls.userRankIcon]	= {"info_bg", "rankView","rank_icon"};
	
};

MatchDetailInfoView.s_controlFuncMap =
{    
	[MatchDetailInfoView.s_controls.shield]			= MatchDetailInfoView.onSheildTouch;
    [MatchDetailInfoView.s_controls.stageBtn] 		= MatchDetailInfoView.onStageBtnClick; 
    [MatchDetailInfoView.s_controls.infoBg] 		= MatchDetailInfoView.onEmpty;
    [MatchDetailInfoView.s_controls.rankView] 		= MatchDetailInfoView.onRankViewTouch;
};

MatchDetailInfoView.s_actionFuncMap = {
	[MatchMechineConfig.ACTION_START]				= "onStartMatch";
	[MatchMechineConfig.ACTION_GET_PLAYER_SCORE]	= "onGetPlayersScore",
	[MatchMechineConfig.ACTION_GET_TABLE_INFO]		= "onGetTableRankInfo",
    [MatchMechineConfig.ACTION_GET_STAGE_INFO]      = "refreshMatchStageInfo";
    [MatchMechineConfig.ACTION_GET_BASECHIP_INFO]	= "refreshMatchBaseChip";
    [MatchMechineConfig.ACTION_GET_STAGE_POS]	 	= "refreshMatchStage",

    [MatchMechineConfig.ACTION_GET_RANK_DETAIL]		= "onGetRankDetailInfo",
    [GameMechineConfig.ACTION_ONLOOKER_LOGIN]	 	= "_refreshUserName",
};

return MatchDetailInfoView;