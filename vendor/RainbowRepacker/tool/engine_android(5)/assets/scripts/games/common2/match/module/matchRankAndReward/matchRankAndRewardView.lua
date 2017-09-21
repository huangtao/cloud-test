local ViewBase = require("games/common2/module/viewBase");

local MatchRankAndRewardView = class(ViewBase,false);

local l_index = 0;
local getIndex = function ( ... )
	l_index = l_index + 1;
	return l_index;
end

MatchRankAndRewardView.s_controls =
{
	shield 				= getIndex();
	bg 					= getIndex();
	rewardSelTabView	= getIndex();
	rankSelTabView 		= getIndex();
	rank_btn 			= getIndex();
	reward_btn 			= getIndex();
	rank_view			= getIndex();
	rank_listView 		= getIndex();
	myRank_view 		= getIndex();
	myRank 				= getIndex();
	myNick 				= getIndex();
	myScore 			= getIndex();
	rank_emptyTips 		= getIndex();
	reward_view			= getIndex();
	reward_listView 	= getIndex();
};

MatchRankAndRewardView.ctor = function (self, seat, layoutConfig)
	super(self, layoutConfig);
	self:setFillParent(true,true);
	self.m_ctrl = MatchRankAndRewardView.s_controls;

	self:_init();
end

MatchRankAndRewardView.dtor = function (self)
	self.m_curShowViewType = nil;
	self.m_curMatchRewardData = nil;
	if self:getVisible() then
		DialogLogic.getInstance():popDialogStack();
	end
end

MatchRankAndRewardView._init = function (self)
    self:_showRankContent(false,false);

	self:_showViews("rank");	
	self:setVisible(false);
end

MatchRankAndRewardView.parseConfig = function(self, config)
    config = table.verify(config);   
end
-------------------------------------------------------------------------
MatchRankAndRewardView._showRankView = function(self)
	self:_refreshRankData();

	local isRankDetailEmpty = not self.m_rankAdapter;
    self:_showRankContent(not isRankDetailEmpty,self.m_isShowMyRankDetail);

	self:_showViews("rank");
end

MatchRankAndRewardView._showRankContent = function(self,isShowRankList,isShowMyRankDetail)
	local rank_listView = self:findViewById(self.m_ctrl.rank_listView);
	local myRank_view = self:findViewById(self.m_ctrl.myRank_view);
	local rank_emptyTips = self:findViewById(self.m_ctrl.rank_emptyTips);

	rank_listView:setVisible(isShowRankList);
	myRank_view:setVisible(isShowMyRankDetail);
    rank_emptyTips:setVisible(not isShowRankList);

    if not isShowRankList then 
	    local emptyTips = "暂无排名信息，请稍后";
	    local curState = MatchMechine.getInstance():getStates();
	    if curState == MatchMechineConfig.STATUS_FINISH then 
	    	emptyTips = "当前比赛已全部结束";
	    end 
	    rank_emptyTips:setText(emptyTips);
	end
end

MatchRankAndRewardView._refreshRankView = function(self)
	if self.m_curShowViewType == "rank" then 
		self:_refreshRankData();
	end
end

MatchRankAndRewardView._refreshRankData = function(self)
	if self.m_rankAdapter and (not self.m_isNeedRefreshRank) then 
		return; 
	end 
	self.m_isNeedRefreshRank = nil;

	local userId = UserBaseInfoIsolater.getInstance():getUserId();
	local curState = MatchMechine.getInstance():getStates();
	if curState == MatchMechineConfig.STATUS_ONLOOKER then 
		userId = GameRoomData.getInstance():getInfoByType("onlookerId");
	end 

	local djInfo = table.verify(MatchIsolater.getInstance():getMatchData());
    local data = {};
    data.matchId = number.valueOf(djInfo.id);
    data.userId = userId;
	SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_RANK_DETAIL_REQUEST,data);
end

MatchRankAndRewardView._clearRankData = function(self)
	if not self.m_rankAdapter then 
		return;
	end 
	local rank_listView = self:findViewById(self.m_ctrl.rank_listView);
	rank_listView:removeAllChildren(true);
	self.m_rankAdapter = nil;
	self.m_isShowMyRankDetail = nil;

    self:_showRankContent(false,false);
end

MatchRankAndRewardView._getRewardInfo = function(self)
    local info = {};
    local dict = new(Dict,"matchRewardTmp");
    if dict then
        dict:load();
        local rewardstr = dict:getString("rewardStr");
        if rewardstr then
            info = table.verify(json.decode(rewardstr));
        end

        delete(dict);
    end
    return info;
end

MatchRankAndRewardView._getRewardDesMaxWitdh = function(self,rewardList)
	rewardList = table.verify(rewardList);
	local strMaxDesc = "";
	for k,v in pairs(rewardList) do 
		if string.len(strMaxDesc) < string.len(v.desc) then
            strMaxDesc = v.desc;
        end
	end 
	local textReward = new(Text, strMaxDesc, 1, 1, kAlignLeft, nil,26);
	local maxWidth = textReward:getSize();        
	delete(textReward);

    return maxWidth;
end

MatchRankAndRewardView._showRewardView = function(self)
	if not self.m_rewardAdapter then
		local rewardInfo = self:_getRewardInfo();
		local rewardList = table.verify(rewardInfo.award);

		if not table.isEmpty(rewardList) then
			local maxWidth = self:_getRewardDesMaxWitdh(rewardList);
			
        	local isNeedRoll = maxWidth > 464;
        	if isNeedRoll then 
	        	for k,v in pairs(rewardList) do 
					local sort = number.valueOf(v.sort,4);
					if sort >= 1 and sort <= 3 then 
						v.isNeedRoll = true;
					end 
				end
			end 

			local MatchRewardListItem = require("games/common2/match/module/matchRankAndReward/matchRewardListItem");
	    	self.m_rewardAdapter = new(CacheAdapter, MatchRewardListItem, rewardList);

	    	local reward_listView = self:findViewById(self.m_ctrl.reward_listView);
	        reward_listView:setAdapter(self.m_rewardAdapter);
		end	
	end 

	self:_showViews("reward");
end

MatchRankAndRewardView._showViews = function(self,viewType)
	self.m_curShowViewType = viewType;

	local rank_view = self:findViewById(self.m_ctrl.rank_view);
	local reward_view = self:findViewById(self.m_ctrl.reward_view);
	local rankSelTabView = self:findViewById(self.m_ctrl.rankSelTabView);
	local rewardSelTabView = self:findViewById(self.m_ctrl.rewardSelTabView);

	local isShowRankView = viewType == "rank";
	rank_view:setVisible(isShowRankView);
	reward_view:setVisible(not isShowRankView);
	rankSelTabView:setVisible(isShowRankView);
	rewardSelTabView:setVisible(not isShowRankView);
end

MatchRankAndRewardView._close = function(self)
	if self:getVisible() then 
		self:setVisible(false);
		DialogLogic.getInstance():popDialog();
	end 
end

MatchRankAndRewardView._playTranslate = function(self,isIn,callObj,callFunc)
	local bg = self:findViewById(self.m_ctrl.bg);
	local w = bg:getSize();
	bg:removeProp(0);

	local startX = isIn and w or 0;
	local endX = isIn and 0 or w;
	local translateAnim = bg:addPropTranslate(0,kAnimNormal,150,0,startX,endX,0,0);
	if translateAnim then
		translateAnim:setEvent(nil,function()
			bg:removeProp(0);
			if callFunc then 
				callFunc(callObj);
			end 
		end);
	end 
end
-------------------------------------------------------------------------
MatchRankAndRewardView.onShieldClick = function (self, finger_action)
	if finger_action == kFingerUp then
		self:_playTranslate(false,self,self._close);
	end
end

MatchRankAndRewardView.onEmptyFunc = function (self)
end

MatchRankAndRewardView.onRankBtnClick = function (self)
	self:_showRankView();
end

MatchRankAndRewardView.onRewardBtnClick = function (self)
	self:_showRewardView();
end
-------------------------------------------------------------------------
MatchRankAndRewardView.onShowRankAndRewardView = function(self)
	self.m_isNeedRefreshRank = true;

	local curState = MatchMechine.getInstance():getStates();
    if curState == MatchMechineConfig.STATUS_FINISH then 
    	self:_clearRankData();
    end 
	self:setVisible(true);
	self:_playTranslate(true,self,self._refreshRankView);

	DialogLogic.getInstance():pushDialogStack(self,function(self)
		self:setVisible(false);
	end);
end

MatchRankAndRewardView.onRankrefresh = function(self)
	self.m_isNeedRefreshRank = true;

	if self:getVisible() and self.m_curShowViewType == "rank" then 
		self:_refreshRankData();
	end 
end

MatchRankAndRewardView.onGetRankDetailInfo = function(self,seat,uid,info,isFast)
	info = table.verify(info);
	self.m_isShowMyRankDetail = nil;

	local rankDetail = table.verify(info.rankDetail);
	local myRankDetail = table.verify(info.myRankDetail);
	
	local isRankDetailEmpty = table.isEmpty(rankDetail);

	if isRankDetailEmpty then 
		self.m_isShowMyRankDetail = false;
	else 
		local isEmpty = table.isEmpty(myRankDetail);
   		self.m_isShowMyRankDetail = not isEmpty;
	end 
    self:_showRankContent(not isRankDetailEmpty,self.m_isShowMyRankDetail);
    
	if isRankDetailEmpty then 
		return;
	end 

 	local rank_listView = self:findViewById(self.m_ctrl.rank_listView);
   	local tLX,tLY,bRX = 20,20,20;
   	local bRY = self.m_isShowMyRankDetail and 74 or 10;
   	rank_listView:setFillRegion(true,tLX,tLY,bRX,bRY);

	table.sort(rankDetail,function(a,b)
		if a and b and a.rank and b.rank then 
			return a.rank < b.rank;
		end 
	end);
	
	local MatchRankListItem = require("games/common2/match/module/matchRankAndReward/matchRankListItem");
	if not self.m_rankAdapter then
        self.m_rankAdapter = new(CacheAdapter, MatchRankListItem, rankDetail);
        rank_listView:setAdapter(self.m_rankAdapter);
        rank_listView:setOnItemClick(self,self._onRankListItemClick);
    else
        self.m_rankAdapter:changeData(rankDetail);
    end

    if not isEmpty then 
	    local myRank = self:findViewById(self.m_ctrl.myRank);
	    local myNick = self:findViewById(self.m_ctrl.myNick);
	    local myScore = self:findViewById(self.m_ctrl.myScore);
	   	myRank:setText(myRankDetail.rank or "");
	   	myNick:setText(string.subUtfStrByCn(myRankDetail.name or "",1,6));
	   	myScore:setText(myRankDetail.score or "");  
	end 	
end

MatchRankAndRewardView._onRankListItemClick = function(self,adapter, item, index, x, y)	
	if item:checkIsOnlookerBtnClick(x,y) then
		local data = table.verify(item:getData());

		local reportAction;
		local viewName,viewParam;
		local gameId = GameInfoIsolater.getInstance():getCurGameId();
		local curState = MatchMechine.getInstance():getStates();
	    if curState == MatchMechineConfig.STATUS_FINISH then 
	    	reportAction = UBConfig.kMatchFinishOnlooker;
	    	if table.isEmpty(self.m_curMatchRewardData) then 
	        	gameId = GameInfoIsolater.getInstance():getHallGameType();
	        else 
	        	viewName = MatchMechineConfig.VIEW_OVER;
	        	viewParam = {
	        		MatchIsolater.getInstance():getMatchData();
	        		Copy(self.m_curMatchRewardData);
	        	};
	        end
	    else
	    	reportAction = UBConfig.kMatchWaitingOnlooker;
	    	viewName = MatchMechineConfig.VIEW_ROUNDOVER;
	    	viewParam = {
        		MatchIsolater.getInstance():getMatchData();
        	};
	    end 
		
		local info = {};
		info.userId = data.userId;
		info.gameId = gameId;
		info.viewName = viewName;
		info.viewParam = viewParam;
		local action = GameMechineConfig.ACTION_REQUEST_ENTER_ONLOOKER;
		MechineManage.getInstance():receiveAction(action,info);

		if reportAction then
			local data = table.verify(MatchIsolater.getInstance():getMatchData()); 
			UBReport.getInstance():report(reportAction, string.format("id_%s", data.id or ""));
		end 
	end 
end

MatchRankAndRewardView.onRefreshRankData = function(self)
	self.m_isNeedRefreshRank = true;

    self:_refreshRankData();
end

MatchRankAndRewardView.onHideRankAndRewardView = function(self)
	self:_close();
end

MatchRankAndRewardView.onRefreshMatchReward = function(self,seat,uid,info,isFast)
	self.m_curMatchRewardData = info;
end

MatchRankAndRewardView.s_controlConfig =
{
	[MatchRankAndRewardView.s_controls.shield]				= {"shiled"};
	[MatchRankAndRewardView.s_controls.bg] 					= {"bg"};
	[MatchRankAndRewardView.s_controls.rewardSelTabView]	= {"bg","tabView","rewardSelTabView"};
	[MatchRankAndRewardView.s_controls.rankSelTabView]		= {"bg","tabView","rankSelTabView"};
	[MatchRankAndRewardView.s_controls.rank_btn]			= {"bg","tabView","rewardSelTabView","tab_rank"};
	[MatchRankAndRewardView.s_controls.reward_btn]			= {"bg","tabView","rankSelTabView","tab_reward"};

	[MatchRankAndRewardView.s_controls.rank_view]			= {"bg","rank_view"};
	[MatchRankAndRewardView.s_controls.rank_listView]		= {"bg","rank_view","rank_listView"};
	[MatchRankAndRewardView.s_controls.myRank_view]			= {"bg","rank_view","myRank_view"};
	[MatchRankAndRewardView.s_controls.myRank]				= {"bg","rank_view","myRank_view","my_rank"};
	[MatchRankAndRewardView.s_controls.myNick]				= {"bg","rank_view","myRank_view","my_nick"};
	[MatchRankAndRewardView.s_controls.myScore]				= {"bg","rank_view","myRank_view","my_score"};
	[MatchRankAndRewardView.s_controls.rank_emptyTips]		= {"bg","rank_view","rank_emptyTips"};

	[MatchRankAndRewardView.s_controls.reward_view]			= {"bg","reward_view"};
	[MatchRankAndRewardView.s_controls.reward_listView]		= {"bg","reward_view","reward_listView"};	
};

MatchRankAndRewardView.s_controlFuncMap =
{
	[MatchRankAndRewardView.s_controls.shield]				= MatchRankAndRewardView.onShieldClick;
	[MatchRankAndRewardView.s_controls.bg]					= MatchRankAndRewardView.onEmptyFunc;
	[MatchRankAndRewardView.s_controls.rank_btn]			= MatchRankAndRewardView.onRankBtnClick;
	[MatchRankAndRewardView.s_controls.reward_btn]			= MatchRankAndRewardView.onRewardBtnClick;
};

MatchRankAndRewardView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_NS_RANK_REWARD_CLICK]		= "onShowRankAndRewardView";
    [MatchMechineConfig.ACTION_GET_TABLE_INFO] 				= "onRankrefresh";
    [MatchMechineConfig.ACTION_GET_RANK_DETAIL]				= "onGetRankDetailInfo";
    [MatchMechineConfig.ACTION_REQUEST_RANK_DETAIL]			= "onRefreshRankData",
    [MatchMechineConfig.ACTION_FINISH_REWARD]				= "onRefreshMatchReward";
};

MatchRankAndRewardView.s_stateFuncMap = {
	[MatchMechineConfig.STATUS_PLAYING]                     = "onHideRankAndRewardView";
	[MatchMechineConfig.STATUS_WAITING]                     = "onHideRankAndRewardView";
    [MatchMechineConfig.STATUS_FINISH]              		= "onHideRankAndRewardView";
};

return MatchRankAndRewardView;
