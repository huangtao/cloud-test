require("games/common2/match/matchMechine/matchMechineConfig");
--此处的比赛房间只是一个插件，不能单独使用，只有与游戏房间合并后才是完整的比赛房间
--此处比赛房间里不能有与公共房间、游戏房间相同方法名的方法，包括ctor、dtor，否则会覆盖原来的方法

MatchScene = class();

MatchScene.s_cmds = {
	InitMatchRoom 			= ToolKit.getIndex();
	ReleaseMatchRoom 		= ToolKit.getIndex();
	CreateMatchViews 		= ToolKit.getIndex();
	ReleaseMatchViews 		= ToolKit.getIndex();
};
----------------------------------------------------
MatchScene.initMatchRoom = function(self)
	self:creatMatchToolbarLayer();
	self:creatMatchTipsLayer();
	self:createMatchDetailLayer();

	self:createMatchAnimLayer(); -- 动画层
end

MatchScene.releaseMatchRoom = function(self)
	delete(self.m_matchDetailInfoLayer);
	self.m_matchDetailInfoLayer = nil;

	delete(self.m_matchToolBarLayer);
	self.m_matchToolBarLayer = nil;

	delete(self.m_matchTipsLayer);
	self.m_matchTipsLayer = nil;

	delete(self.m_matchLoadingLayer);
	self.m_matchLoadingLayer = nil;

	delete(self.m_matchGameOverLayer);
	self.m_matchGameOverLayer = nil;

	delete(self.m_matchOverLayer);
	self.m_matchOverLayer = nil;

	delete(self.m_matchReviveLayer);
	self.m_matchReviveLayer = nil;

	delete(self.m_matchExitLayer);
	self.m_matchExitLayer = nil;

	delete(self.m_matchAnimLayer);
	self.m_matchAnimLayer = nil;

	delete(self.m_matchWaitTableLayer);
	self.m_matchWaitTableLayer = nil;

	delete(self.m_matchWaitingLayer);
	self.m_matchWaitingLayer = nil;

	delete(self.m_matchFailTipsLayer);
	self.m_matchFailTipsLayer = nil;

	delete(self.m_matchRankAndRewardLayer);
	self.m_matchRankAndRewardLayer = nil;

	delete(self.m_matchRuleLayer);
	self.m_matchRuleLayer = nil;
end

MatchScene.onCreateMatchViews = function(self,info)
	info = table.verify(info);

	local viewName = info.viewName;
	if viewName == MatchMechineConfig.VIEW_EXIT then 
		self:createMatchExitLayer();

	elseif viewName == MatchMechineConfig.VIEW_LOADING then 
		self:createMatchLoadingLayer();

	elseif viewName == MatchMechineConfig.VIEW_GAMEOVER then 
		self:createMatchGameOverLayer();

	elseif viewName == MatchMechineConfig.VIEW_WAIT_TABLE then
		self:createMatchWaitTableLayer();

	elseif viewName == MatchMechineConfig.VIEW_ROUNDOVER then 
		self:createMatchWaitingLayer();

	elseif viewName == MatchMechineConfig.VIEW_REVIVE then 
		self:createMatchReviveLayer();

	elseif viewName == MatchMechineConfig.VIEW_OVER then 
		self:createMatchOverLayer();	

	elseif viewName == MatchMechineConfig.VIEW_FAIL_TIPS then 
		self:createMatchFailTipsLayer();

	elseif viewName == MatchMechineConfig.VIEW_RANK_REWARD then 
		self:createMatchRankAndRewardLayer();

	elseif viewName == MatchMechineConfig.VIEW_RULE then
		self:createMatchRuleLayer();
	end 
end

MatchScene.onReleaseMatchViews = function(self,info)
	info = table.verify(info);

	local viewName = info.viewName;
	if viewName == MatchMechineConfig.VIEW_EXIT then 
		delete(self.m_matchExitLayer);
		self.m_matchExitLayer = nil;

	elseif viewName == MatchMechineConfig.VIEW_LOADING then 
		delete(self.m_matchLoadingLayer);
		self.m_matchLoadingLayer = nil;

	elseif viewName == MatchMechineConfig.VIEW_ROUNDOVER then 
		delete(self.m_matchWaitingLayer);
		self.m_matchWaitingLayer = nil;

	elseif viewName == MatchMechineConfig.VIEW_REVIVE then 
		delete(self.m_matchReviveLayer);
		self.m_matchReviveLayer = nil;

	elseif viewName == MatchMechineConfig.VIEW_OVER then 
		delete(self.m_matchOverLayer);
		self.m_matchOverLayer = nil;	

	end
	
	Clock.instance():schedule_once(function()
		TextureCache.instance():clean_unused();
	end, 1);
end 
--------------------------------------------------------
--比赛详情
MatchScene.createMatchDetailLayer = function(self)
	if not self.m_matchDetailInfoLayer then 
		local MatchDetailInfoLayer = require("games/common2/match/module/matchDetailInfo/matchDetailInfoLayer");
		self.m_matchDetailInfoLayer = new(MatchDetailInfoLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchDetailInfoLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
		self.m_matchDetailInfoLayer:setLevel(level);
	end 
end

--工具栏
MatchScene.creatMatchToolbarLayer = function(self)
	if not self.m_matchToolBarLayer then
		local MatchToolbarLayer = require("games/common2/match/module/matchToolbar/matchToolbarLayer");
		self.m_matchToolBarLayer = new(MatchToolbarLayer);
		self.m_commonViewMap[2]:addChild(self.m_matchToolBarLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level10");
		self.m_matchToolBarLayer:setLevel(level);
	end
end

--提示
MatchScene.creatMatchTipsLayer = function(self)
	if not self.m_matchTipsLayer then
		local MatchTipsLayer = require("games/common2/match/module/matchTips/matchTipsLayer");
		self.m_matchTipsLayer = new(MatchTipsLayer);
		self.m_commonViewMap[2]:addChild(self.m_matchTipsLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level2");
		self.m_matchTipsLayer:setLevel(level);
	end
end

--赛前等待，报名界面
MatchScene.createMatchLoadingLayer = function(self)
	if not self.m_matchLoadingLayer then 
		local MatchLoadingLayer = require("games/common2/match/module/matchLoading/matchLoadingLayer");
		self.m_matchLoadingLayer = new(MatchLoadingLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchLoadingLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level7");
		self.m_matchLoadingLayer:setLevel(level);
	end 
end

--配桌等待
MatchScene.createMatchWaitTableLayer = function(self)
	if not self.m_matchWaitTableLayer then 
		local MatchWaitTableLayer = require("games/common2/match/module/matchWaitTable/matchWaitTableLayer");
		self.m_matchWaitTableLayer = new(MatchWaitTableLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchWaitTableLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level1");
		self.m_matchWaitTableLayer:setLevel(level);
	end 
end

--赛间等待，晋级界面
MatchScene.createMatchWaitingLayer = function(self)
	if not self.m_matchWaitingLayer then 
		local MatchWaitingLayer = require("games/common2/match/module/matchWaiting/matchWaitingLayer");
		self.m_matchWaitingLayer = new(MatchWaitingLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchWaitingLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level7");
		self.m_matchWaitingLayer:setLevel(level);
	end 
end

--比赛简易结算框
MatchScene.createMatchGameOverLayer = function(self)
	if not self.m_matchGameOverLayer then 
		local MatchGameOverLayer = require("games/common2/match/module/matchGameOver/matchGameOverLayer");
		self.m_matchGameOverLayer = new(MatchGameOverLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchGameOverLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level1");
		self.m_matchGameOverLayer:setLevel(level);
	end 
end

--比赛奖励
MatchScene.createMatchOverLayer = function(self)
	if not self.m_matchOverLayer then 
		local MatchOverLayer = require("games/common2/match/module/matchFinish/matchOverLayer");
		self.m_matchOverLayer = new(MatchOverLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchOverLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level6");
		self.m_matchOverLayer:setLevel(level);
	end 
end

--复活弹框
MatchScene.createMatchReviveLayer = function(self)
	if not self.m_matchReviveLayer then 
		local MatchReviveLayer = require("games/common2/match/module/matchRevive/matchReviveLayer");
		self.m_matchReviveLayer = new(MatchReviveLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchReviveLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_matchReviveLayer:setLevel(level);
	end 
end

--退出提示
MatchScene.createMatchExitLayer = function(self)
	if not self.m_matchExitLayer then 
		local MatchExitLayer = require("games/common2/match/module/matchExit/matchExitLayer");
		self.m_matchExitLayer = new(MatchExitLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchExitLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_matchExitLayer:setLevel(level);
	end
end

-- 比赛动画
MatchScene.createMatchAnimLayer = function ( self )
	if not self.m_matchAnimLayer then
		local MatchAnimLayer = require("games/common2/match/module/matchAnim/matchAnimLayer");
		self.m_matchAnimLayer = new(MatchAnimLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchAnimLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_matchAnimLayer:setLevel(level);
	end
end

MatchScene.createMatchFailTipsLayer = function(self)
	if not self.m_matchFailTipsLayer then
		local MatchFailTipsLayer = require("games/common2/match/module/matchFailTips/matchFailTipsLayer");
		self.m_matchFailTipsLayer = new(MatchFailTipsLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchFailTipsLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_matchFailTipsLayer:setLevel(level);
	end
end

--比赛排行榜和奖励详情
MatchScene.createMatchRankAndRewardLayer = function(self)
	if not self.m_matchRankAndRewardLayer then 
		local MatchRankAndRewardLayer = require("games/common2/match/module/matchRankAndReward/matchRankAndRewardLayer");
		self.m_matchRankAndRewardLayer = new(MatchRankAndRewardLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchRankAndRewardLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_matchRankAndRewardLayer:setLevel(level);
	end 
end

--赛制弹框
MatchScene.createMatchRuleLayer = function(self)
	if not self.m_matchRuleLayer then 
		local MatchRuleLayer = require("games/common2/match/module/matchRule/matchRuleLayer");
		self.m_matchRuleLayer = new(MatchRuleLayer);
		self.m_commonViewMap[4]:addChild(self.m_matchRuleLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_matchRuleLayer:setLevel(level);
	end 
end


MatchScene.onRefreshOtherLayerLevel = function(self,layerName)
	local layers = {};

	if layerName == "layer2" then
		layers = {
			{self.m_matchTipsLayer,"level2"},{self.m_matchToolBarLayer,"level10"},
		};
	elseif layerName == "layer4" then
		layers = {
			{self.m_matchGameOverLayer,"level1"},{self.m_matchWaitTableLayer,"level1"},
			{self.m_matchDetailInfoLayer,"level2"},{self.m_matchOverLayer,"level6"},
			{self.m_matchLoadingLayer,"level7"},{self.m_matchWaitingLayer,"level7"},
			{self.m_matchExitLayer,"level7"},{self.m_matchRankAndRewardLayer,"level8"},
			{self.m_matchReviveLayer,"level8"},{self.m_matchFailTipsLayer,"level8"},{self.m_matchAnimLayer,"level8"},
		};
	end

	for k,v in pairs(layers) do
		if v[1] and v[2] and v[1].setLevel then
			local level = RoomLevelConfig.getInstance():getLevel(layerName,v[2]);
			if level > 0 then
				v[1]:setLevel(level);
			end
		end
	end
end


----------------------------------------------------------------
--比赛房间不需要的组件
MatchScene.creatBankrupt = function(self)
end
MatchScene.creatRecharge = function(self)
end
MatchScene.creatReadyLayer = function(self)
end
MatchScene.creatChatLayer = function(self)
end
MatchScene.creatToolBarLayer = function(self)
end
MatchScene.creatTaskLayer = function(self)
end
MatchScene.creatGameOverLayer = function(self)
end
MatchScene.creatChatRealTimeLayer = function(self)
end
MatchScene.createRoomInfo = function(self)
end
MatchScene.creatExtraBtnLayer = function(self)
end
MatchScene.creatRecruitLayer = function(self)
end
MatchScene.crateInviteLayer = function(self)
end
----------------------------------------------------------------
MatchScene.initRoomBg = function(self,bgFile)
	bgFile = GameMatchConfig.match_backgroundFile or bgFile;
	if not string.isEmpty(bgFile) and bgFile ~= "games/common/room_bg.png" then
		self.m_commonBgImage:setFile(bgFile);
	end
end

CommonGameScene2.checkIsSupportOnlooker = function(self)
	local curGameId = GameInfoIsolater.getInstance():getCurGameId();       
    local isSupport = GameInfoIsolater.getInstance():isGameSupportOnlookerMatchFeature(curGameId);
    local isOpen = SettingIsolater.getInstance():getMatchOnlookerSwitch();
    isSupport = isOpen and isSupport;

	return isSupport;
end
---------------------------------------------------------------------
MatchScene.s_cmdConfig = 
{
	[MatchScene.s_cmds.InitMatchRoom] = MatchScene.initMatchRoom;
	[MatchScene.s_cmds.ReleaseMatchRoom] = MatchScene.releaseMatchRoom;	
	[MatchScene.s_cmds.CreateMatchViews] = MatchScene.onCreateMatchViews;
	[MatchScene.s_cmds.ReleaseMatchViews]	= MatchScene.onReleaseMatchViews;
};
-----------------------------------------------------------------------