require("isolater/interface/settingIsolater");

local MatchWaitingView = class(ViewBase,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end
MatchWaitingView.s_controls = 
{
 	bg 							= getIndex(),
    roundDSOverArea 			= getIndex(),
    roundDSOverTitle 			= getIndex(),
    roundDSOverTitleBg 			= getIndex(),
    roundDSOverRewardBtn 		= getIndex(),
    roundDSOverGamesBtn			= getIndex(),
    roundDSOverRuleBtn          = getIndex(),
    roundDSOverTableView		= getIndex(),
    roundDSOverTipsView			= getIndex(),
    roundDSOverProgress 		= getIndex(),
    roundDSOverCylinderView 	= getIndex(),
    roundDSOverPlayerView 		= getIndex(),
    roundDSOverPlayerHeadBtn	= getIndex(),
    roundDSOverPlayerVipHeadBg	= getIndex(),
    roundDSOverRankView 		= getIndex(),
    roundDSOverOutView			= getIndex(),
    roundDSOverReturnBtn		= getIndex(),
    roundDSOverArrow            = getIndex(),
    roundDSOverWiner            = getIndex(),
    onlookersTips               = getIndex(),
};

MatchWaitingView.ctor = function(self,seat,viewConfig)
	super(self, viewConfig);
    self:setFillParent(true,true);
    self.m_ctrl = MatchWaitingView.s_controls;

    MatchIsolater.getInstance():setObserver(self);
    SlotMachineLayerIsolater.getInstance():setObserver(self);

	self:_initView();
	
    self:hide();
end

MatchWaitingView.dtor = function(self)
	MatchIsolater.getInstance():clearObserver(self);
    SlotMachineLayerIsolater.getInstance():clearObserver(self);

    ShaderManager.removeShader(self.m_bg);

	GameTimer2.release("delay_show_matchWaitingView");
	GameTimer2.release("delay_hide_matchWaitingView");

	self:_hideDialogs();
    self:_deleteSwfNode();
    self:_deleteTableInfoTimer();
end

MatchWaitingView.onGetSlotMachineGameSwitchCallBack = function(self, isSuccess)
    if not isSuccess then return end
    
    if self.m_matchType then 
        self:_checkBtnsStatus(self.m_matchType);  
    end 
end

MatchWaitingView.onResponseMatchBasicInfo = function(self, info)
    if not info then return end
    
    self:_refreshMatchName(info.mname); 
    self:_checkBtnsStatus(info.type);  
end

MatchWaitingView.onShowRoundDSOver = function(self, data)
    if data then
        self.m_data = data;
        local tmp = table.verify(MatchIsolater.getInstance():getMatchData());

        --摇摇乐奖励按钮
       	self:_checkBtnsStatus(tmp.type);

        local finalRound = false;
        if data.matchStage ~= 1 then
			finalRound = data.roundCount == data.myPos;
		end
		tmp.isFinalRound = finalRound;
		MatchIsolater.getInstance():setMatchData(tmp);

		self:_refreshMatchName();

		-- 头像
		self:_updateHeadImage();
		ImageCache.getInstance():request(UserBaseInfoIsolater.getInstance():getAvatar_b(), self, self.onUpdateHeadImage);

		-- 暂无淘汰人数，隐藏处理
		-- self:_refreshWeedoutInfo(data.weedoutCount);
		self.m_roundDSOverOutView:setVisible(false);
		self.m_roundDSOverRankView:setPos(0, 0);

		self:_refreshStageInfo(data);
    end
end
------------------------------------------------------------------------------------------------
MatchWaitingView._refreshOnlookersData = function(self)
    local info = {
        viewName = MatchMechineConfig.VIEW_RANK_REWARD,
    };
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS,info);
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_REQUEST_RANK_DETAIL);
end

MatchWaitingView._refreshOnlookersTips = function(self,isShow)
    local isOpen = SettingIsolater.getInstance():getMatchOnlookerSwitch();
    if isOpen then
        local curGameId = GameInfoIsolater.getInstance():getCurGameId();       
        local isSupport = GameInfoIsolater.getInstance():isGameSupportOnlookerMatchFeature(curGameId);
        if not isSupport then 
            isShow = false;
        end 
    else 
        isShow = false;
    end 
    self.m_onlookersTips:setVisible(isShow);
end

MatchWaitingView._refreshMatchName = function(self,name)
	local info = table.verify(MatchIsolater.getInstance():getMatchData());
	name = name or info.name;
    local str = string.gsub(name or "","#","") or "赛间等待";

    self.m_roundDSOverTitle:setText(str,1);

    local textWidth, _ = self.m_roundDSOverTitle:getSize();
	local titleBgWidth = textWidth + 100;
	titleBgWidth = titleBgWidth > 400 and titleBgWidth or 400;
	self.m_roundDSOverTitleBg:setSize(titleBgWidth, nil);
end

MatchWaitingView._refreshWaitTableInfo = function(self,nextPart,notFinishTable)
    self:_deleteTableInfoTimer();
    self.m_roundDSOverTableView:removeAllChildren(true);
    local isReady = nextPart and notFinishTable <= 2;
    local strTable = isReady and string.format("#cFFFFFF仅剩#c00FF96%s#cFFFFFF桌仍在比赛，下一阶段比赛马上开始", notFinishTable) or 
        string.format("#cFFFFFF当前还有#c00FF96%s#cFFFFFF桌正在比赛，请稍候", notFinishTable);
    local richTextTable = new(RichText, strTable, 34, 34, kAlignLeft, nil, 34);
    richTextTable:setAlign(kAlignLeft);
    local wRichText = richTextTable:getSize();
    self.m_roundDSOverTableView:setSize(wRichText);
    self.m_roundDSOverTableView:addChild(richTextTable);

    local text = new(Text, "...", 1, 34, kAlignLeft, nil, 34, 255, 255, 255);
    text:setAlign(kAlignLeft);
    local wText = text:getSize();
    text:setPos(wRichText)
    self.m_roundDSOverTableView:setSize(wRichText + wText);
    self.m_roundDSOverTableView:addChild(text);
    text:setText("");

    
    local count = 0;
    self.m_timerTableInfo = Clock.instance():schedule(function (dt)
        count = count + 1;
        count = count > 3 and 0 or count;
        local str = "";
        for i = 1, count do
            str = str..".";
        end
        text:setText(str)
    end, 1)
end

MatchWaitingView._deleteTableInfoTimer = function(self)
    if self.m_timerTableInfo then 
        self.m_timerTableInfo:cancel();
    end 
end

MatchWaitingView._refreshWaitTips = function(self,winPlayer)
	self.m_roundDSOverTipsView:removeAllChildren(true);

    local notFinishTable = number.valueOf(self.m_data.notFinishTable,1);
    notFinishTable = notFinishTable <= 0 and 1 or notFinishTable;

    local rank = number.valueOf(self.m_data.rank,1);
    local playerNumer = PlayerSeat.getInstance():getCurGamePlayerMaxCount();

    Log.d("MatchWaitingView._refreshWaitTips", "rank", rank, "playerNumer", playerNumer, "notFinishTable", notFinishTable, "winPlayer", winPlayer)
    local nextPart = (rank + playerNumer * notFinishTable) <= winPlayer;
    local str = nextPart and "games/common/match/match_allover/tips_next_part.png" or "games/common/match/match_allover/tips_waiting.png";
    local img = new(Image, str);
    img:setAlign(kAlignCenter);
    self.m_roundDSOverTipsView:addChild(img);

    self:_refreshWaitTableInfo(nextPart, notFinishTable);
end

MatchWaitingView._updateHeadImage = function(self, file)
    local sex = UserBaseInfoIsolater.getInstance():getSex();
    local headImg = string.isEmpty(file) and UserBaseInfoIsolater.getInstance():getHallHeadBySex(sex) or file;

    if self.m_headImage then
        self.m_roundDSOVerPlayerHeadBtn:removeChild(self.m_headImage);
        delete(self.m_headImage);
    end

    self.m_headImage = new(Mask, headImg, "isolater/hall/head_mask.png");
    self.m_roundDSOVerPlayerHeadBtn:addChild(self.m_headImage);
    self.m_headImage:setAlign(kAlignCenter);
end

MatchWaitingView._refreshRankInfo = function(self,rank,allPlayer)
	self.m_roundDSOverRankView:removeAllChildren(true);

	-- 排名
	local strRank = string.format("#c7A4D39当前排名：#cD24000%s/%s", rank, allPlayer);
	local richTextRank = new(RichText, strRank, w, h, kAlignCenter, nil, 24);
	richTextRank:setAlign(kAlignCenter);	
	self.m_roundDSOverRankView:addChild(richTextRank);
end

MatchWaitingView._refreshWeedoutInfo = function(self,weedoutCount)
	self.m_roundDSOverOutView:removeAllChildren(true);

	-- 淘汰人数
	local strOut = string.format("#c7A4D39共#cD24000%s#c7A4D39人被我淘汰", weedoutCount);
	local richTextOut = new(RichText, strOut, w, h, kAlignCenter, nil, 24);
	richTextOut:setAlign(kAlignCenter);
	self.m_roundDSOverOutView:addChild(richTextOut);
end

MatchWaitingView._refreshStageInfo = function(self,data)
	local w, h = self.m_roundDSOverCylinderView:getSize();
	local roundsList = data.progressList;
	local list = MatchIsolater.getInstance():getMatchStageInfo().stageInfo or {};
	Log.d("MatchWaitingView._refreshStageInfo  stageInfo", list);
	local listSize = #list;
	local dis = w / listSize;
    local headViewWidth, _ = self.m_roundDSOVerPlayerView:getSize();
    local allPlayer = 0;
    local winPlayer = 0;
	for k, v in ipairs(list) do
		local all, win = self:getStageInfoFromData(v.rounds, roundsList, number.valueOf(data.totalParticipants));


		local item = self.m_roundDSOverCylinderView:getChildByName(string.format("item%s", k));
		local itemWidth, _ = item:getSize();
		item:setPos((k-1)*dis - itemWidth/2, nil);

		local progress = item:getChildByName("progress");
		progress:setVisible(true);

		local msgBg = item:getChildByName("msgBg");
		local msgText = msgBg:getChildByName("msgText");

		local msgStr = k == 1 and "夺冠!" or string.format("%s人晋级", win);
		msgText:setText(msgStr)

		-- 开赛人数
        if k == listSize then
            local finalItem = self.m_roundDSOverCylinderView:getChildByName(string.format("item%s", k+1));
            local finalItemWidth, _ = finalItem:getSize();
		    finalItem:setPos(k*dis - finalItemWidth/2, nil);

            local finalProgress = finalItem:getChildByName("progress");
            finalProgress:setVisible(true)
		    local finalMsgBg = finalItem:getChildByName("msgBg");
		    local finalMsgText = finalMsgBg:getChildByName("msgText");
            finalMsgText:setText(string.format("%s人开赛", number.valueOf(data.totalParticipants)));
            finalItem:setVisible(true);
        end

        if data.matchStage == 1 then 
            progress:setVisible(false);
            winPlayer = win;
        else
            -- 计算头像位置，进度
            for k1, v1 in ipairs(v.rounds) do 
                local value = number.valueOf(v1);
                if value >= data.myPos then 
                    local playerViewX = k * dis - dis / 2 - headViewWidth / 2;
                    self.m_roundDSOVerPlayerView:setPos(playerViewX, nil);
                    self.m_roundDSOVerPlayerView:setVisible(true);

                    progress:setVisible(false);

                    self:_refreshProgress();

                    allPlayer = all;
                    winPlayer = win;

                    break;
                end
            end
        end

		item:setVisible(true);
	end

	-- 设置头像位置（data.myPos只有在matchStage不为1时有意义）
	if data.matchStage == 1 then 
		local headX = listSize * dis - dis / 2 - headViewWidth / 2;
		self.m_roundDSOVerPlayerView:setPos(headX, nil);
		self.m_roundDSOVerPlayerView:setVisible(true);

		self:_refreshProgress();

		local daliInfo = MatchIsolater.getInstance():getMatchStageInfo().daliInfo or {};
		allPlayer = number.valueOf(daliInfo.TillWeedoutNum);
    end

    self:_refreshRankInfo(data.rank, allPlayer);

    self:_refreshWaitTips(winPlayer);
end

MatchWaitingView._refreshProgress = function(self)
	local headViewWidth, _ = self.m_roundDSOVerPlayerView:getSize();
	local progressX, _ = self.m_roundDSOverProgress:getAbsolutePos();
	local headViewX, _ = self.m_roundDSOVerPlayerView:getAbsolutePos();
	local delta = headViewX - progressX + headViewWidth / 2;
	local progressW, progressH = self.m_roundDSOverProgress:getSize();
	self.m_roundDSOverProgress:setClip(0, 0, delta, progressH);
end

------------------------------------------------------------------------------
-- 获取某阶段比赛人数和晋级人数
MatchWaitingView.getStageInfoFromData = function(self, stageRounds, roundsList, sum)
	if not table.isEmpty(stageRounds) or not table.isEmpty(roundsList) then
		local stageRoundsNum = #stageRounds; -- 每阶段包含的轮数列表数量
		local roundsListNum = #roundsList; -- 总轮数

		local roundWinIndex = number.valueOf(stageRounds[stageRoundsNum]); -- 本阶段最后一轮index
		local roundAllIndex = number.valueOf(stageRounds[1]); -- 本阶段第一轮index

		local roundWinIndexReal = roundsListNum - roundWinIndex; -- 本阶段最后一轮index（倒序）
		local roundAllIndexReal = roundsListNum - roundAllIndex + 1; -- 上阶段最后一轮index（倒序）
		local roundWinNum = roundsList[roundWinIndexReal].number; -- 本阶段最后一轮晋级人数

		--  上阶段最后一轮晋级人数，index溢出则为sum(打立阶段比赛人数)
		local roundAllNum = roundAllIndexReal <= roundsListNum and roundsList[roundAllIndexReal].number or sum;
		return roundAllNum, roundWinNum;
	end
	return 0, 0;
end

MatchWaitingView.onUpdateHeadImage = function ( self, url, imagePath )
	self:_updateHeadImage(imagePath);
end
-------------------------------------------------------------------------------------------------------
MatchWaitingView._initView = function(self)
	--此处设置大小和位置
	self.m_bg = self:findViewById(self.m_ctrl.bg);
    self.m_bg:setEventDrag(self, self.onEmptyfunc);

    self.m_roundDSOverTitle = self:findViewById(self.m_ctrl.roundDSOverTitle);
    self.m_roundDSOverTitleBg = self:findViewById(self.m_ctrl.roundDSOverTitleBg);
    self.m_roundDSOverTableView = self:findViewById(self.m_ctrl.roundDSOverTableView);
    self.m_roundDSOverTipsView = self:findViewById(self.m_ctrl.roundDSOverTipsView);    
    self.m_roundDSOverProgress = self:findViewById(self.m_ctrl.roundDSOverProgress);
    self.m_roundDSOverCylinderView = self:findViewById(self.m_ctrl.roundDSOverCylinderView);
    self.m_roundDSOVerPlayerView = self:findViewById(self.m_ctrl.roundDSOverPlayerView);
    self.m_roundDSOVerPlayerHeadBtn = self:findViewById(self.m_ctrl.roundDSOverPlayerHeadBtn);
    self.m_roundDSOverPlayerVipHeadBg = self:findViewById(self.m_ctrl.roundDSOverPlayerVipHeadBg);
    self.m_roundDSOverRankView = self:findViewById(self.m_ctrl.roundDSOverRankView);
    self.m_roundDSOverOutView = self:findViewById(self.m_ctrl.roundDSOverOutView);
    self.m_onlookersTips = self:findViewById(self.m_ctrl.onlookersTips);
 
    self:_createSwfNode();
    self:_createArrowAnimation();
end
-------------------------------------------------------------------------------------------------------

MatchWaitingView._createSwfNode = function(self)
    local winer = self:findViewById(self.m_ctrl.roundDSOverWiner);
    local swf_info = require("qnFiles/qnSwfRes/sfw/match_waiting_winer_swf_info");
    local swf_pin = require("qnFiles/qnSwfRes/sfw/match_waiting_winer_swf_pin");
    self.m_swfNode = new(SwfPlayer,swf_info,swf_pin);
    self.m_swfNode:setAlign(kAlignCenter);
    winer:addChild(self.m_swfNode);
    self.m_swfNode:play(1,true,-1);
end

MatchWaitingView._deleteSwfNode = function(self)
    if self.m_swfNode then
        delete(self.m_swfNode);
        self.m_swfNode = nil;
    end
end
-------------------------------------------------------------------------------------------------------
MatchWaitingView._createArrowAnimation = function(self)
    local arrow = self:findViewById(self.s_controls.roundDSOverArrow);

    local anim = require("animation");
    local keyframes = anim.keyframes{
        {0.0, {relative_y=3}, anim.ease},
        {0.25, {relative_y=-6}, anim.ease},
        {0.5, {relative_y=-6}, anim.ease},
        {0.75, {relative_y=6}, anim.ease},
        {1.0, {relative_y=6}, nil},
    }

    local animator = anim.Animator(keyframes, anim.updator(arrow:getWidget()), kAnimRepeat);
    animator:start();
end

-------------------------------------------------------------------------------------------------------
-- 比赛奖励
MatchWaitingView._openRewardView = function(self)
    local info = {
        viewName = MatchMechineConfig.VIEW_RANK_REWARD,
    };
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS,info);
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_NS_RANK_REWARD_CLICK);
end

MatchWaitingView._closeRewardView = function(self)
    
end

-- 赛制
MatchWaitingView._openRuleView = function(self)
    local info = {
        viewName = MatchMechineConfig.VIEW_RULE,
    };
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS, info);
    local ruleBtn = self:findViewById(self.s_controls.roundDSOverRuleBtn);
    local x, y = ruleBtn:getAbsolutePos();
    local w, _ = ruleBtn:getSize();
    local data = {
        pos = self.m_data.myPos,
        x = x + w/2,
        y = y,
    }
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_SHOW_RULE_VIEW, data);
end

MatchWaitingView._closeRuleView = function(self)
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_HIDE_RULE_VIEW);
end

---------------------------------摇摇乐-------------------------------------------
MatchWaitingView._checkBtnsStatus = function(self, matchType)
    self.m_matchType = matchType;
    local gamesBtn = self:findViewById(self.s_controls.roundDSOverGamesBtn);
    local ruleBtn = self:findViewById(self.s_controls.roundDSOverRuleBtn);
    if SlotMachineLayerIsolater.getInstance():isOpenGameSwitch() then
    	gamesBtn:setVisible(true);
        ruleBtn:setAlign(kAlignCenter);
    else
    	gamesBtn:setVisible(false);
    	ruleBtn:setAlign(kAlignRight);
    end
end

MatchWaitingView._onShowSlotMachineLayer = function(self)
    if not self.m_slotMachineLayer then
        self.m_slotMachineLayer = SlotMachineLayerIsolater.getInstance():getSlotMachineLayer();
        self.m_slotMachineLayer:setDelegate(self);
        self:addChild(self.m_slotMachineLayer);
        self.m_slotMachineLayer:setAlign(kAlignCenter);
    end

    SlotMachineLayerIsolater.getInstance():showSlotMachineLayer(self.m_slotMachineLayer);
    self:pushIntoSceneStateStack(self, self.onCloseSlotMachineLayer);
end

MatchWaitingView.onCloseSlotMachineLayer = function(self, isManualClose)
    if isManualClose then
        self:popFromSceneStateStack();
    end

    if self.m_slotMachineLayer then
        SlotMachineLayerIsolater.getInstance():hideSlotMachineLayer(self.m_slotMachineLayer);
    end
end
-------------------------------------------------------------------------------------------------------
MatchWaitingView._hideDialogs = function(self)
    self:_closeRewardView();
    self:_closeRuleView();
    self:onCloseSlotMachineLayer();
    if  self.m_moraGameLayout then
        self.m_moraGameLayout:hide();
    end
end
-------------------------------------------------------------------------------------------------------
MatchWaitingView.onEmptyfunc = function(self)
end

MatchWaitingView.onRoundDSOverReturnBtnClick = function(self)
	local action = MatchMechineConfig.ACTION_REQUEST_EXIT;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchWaitingView.onRoundDSOverReturnBtnClick");
end

MatchWaitingView.onRoundDSOverRewardBtnClick = function(self)
    self:_refreshOnlookersTips(false);
    self:_openRewardView();
end

MatchWaitingView._onShowMoraGameLayer = function (self)
    if not self.m_moraGameLayout then
        self.m_moraGameLayout = new(require("hall/moraGame/moraGameLayout"))
        self:addChild(self.m_moraGameLayout);
        self.m_moraGameLayout:setAlign(kAlignCenter);
    end
    self.m_moraGameLayout:show();
end

MatchWaitingView.onRoundDSOverGamesBtnClick = function(self)
    if MoraGameDataInterface.getInstance():isOpen() then
       UBReport.getInstance():report(UBConfig.kMoraGameAction1);
	   self:_onShowMoraGameLayer();
	else
        Toast.getInstance():showText("敬请期待…",50,30,kAlignLeft,"",24,200,175,110)
    end
end

MatchWaitingView.onRoundDSOverRuleBtnClick = function(self)
    self:_openRuleView();
end

-------------------------------------------------------------------------------------------------------
MatchWaitingView.showRoundOverInfo = function(self,seat,uid,info,isFast)
    self.m_hasShowOnlookersTips = nil;

	self:onShowRoundDSOver(info);

    local curState = MatchMechine.getInstance():getStates();
    if curState == MatchMechineConfig.STATUS_ONLOOKER then 
        local roundDSOverReturnBtn = self:findViewById(self.m_ctrl.roundDSOverReturnBtn);
        roundDSOverReturnBtn:setVisible(false);
    else 
        self:_refreshOnlookersData();
    end
    
	GameTimer2.startTimeOut("delay_show_matchWaitingView", self, self.show, 1000);
end

MatchWaitingView.hideRoundOver = function(self)
	GameTimer2.release("delay_show_matchWaitingView");

	self:_hideDialogs();
	self:hide();

    local action = MatchMechineConfig.ACTION_RELEASE_MATCH_VIEWS;
    local info = {};
    info.viewName = MatchMechineConfig.VIEW_ROUNDOVER;
    MatchMechine.getInstance():receiveAction(action,info); 
end

MatchWaitingView.delayHideRoundOver = function(self)
	GameTimer2.release("delay_show_matchWaitingView");
	GameTimer2.startTimeOut("delay_hide_matchWaitingView", self, self.hideRoundOver, 1000);
end

MatchWaitingView.onGetRankDetailInfo = function(self,seat,uid,info,isFast)
    local curState = MatchMechine.getInstance():getStates();
    if curState == MatchMechineConfig.STATUS_ONLOOKER then 
        return;
    end

    if self.m_hasShowOnlookersTips or table.isEmpty(info) then 
        return;
    end 

    local canOnlookerCount = number.valueOf(info.canOnlookerCount);
    if canOnlookerCount > 0 then
        self.m_hasShowOnlookersTips = true;
        self:_refreshOnlookersTips(true);
    end     
end
-------------------------------------------------------------------------------------------------------
MatchWaitingView.s_controlConfig = 
{
	[MatchWaitingView.s_controls.bg] 						= {"bg"};
    [MatchWaitingView.s_controls.roundDSOverArea]          	= {"roundDSOverArea"};
    [MatchWaitingView.s_controls.roundDSOverTitle]			= {"roundDSOverArea", "titleImg", "titleTxt"};
    [MatchWaitingView.s_controls.roundDSOverTitleBg]		= {"roundDSOverArea", "titleImg"};
    [MatchWaitingView.s_controls.roundDSOverRewardBtn]		= {"roundDSOverArea", "btnView", "rewardBtn"};
    [MatchWaitingView.s_controls.roundDSOverGamesBtn]		= {"roundDSOverArea", "btnView", "gamesBtn"};
    [MatchWaitingView.s_controls.roundDSOverRuleBtn]        = {"roundDSOverArea", "btnView", "ruleBtn"};
    [MatchWaitingView.s_controls.roundDSOverTableView]		= {"roundDSOverArea", "tableView"};
    [MatchWaitingView.s_controls.roundDSOverTipsView]		= {"roundDSOverArea", "tipsView"};
    [MatchWaitingView.s_controls.roundDSOverProgress]		= {"roundDSOverArea", "progressView", "progressBg", "progress"};
    [MatchWaitingView.s_controls.roundDSOverCylinderView]	= {"roundDSOverArea", "progressView", "cylinderView"};
    [MatchWaitingView.s_controls.roundDSOverPlayerView]		= {"roundDSOverArea", "progressView", "cylinderView", "playerView"};
    [MatchWaitingView.s_controls.roundDSOverPlayerHeadBtn]	= {"roundDSOverArea", "progressView", "cylinderView", "playerView", "headBtn"};
    [MatchWaitingView.s_controls.roundDSOverPlayerVipHeadBg]= {"roundDSOverArea", "progressView", "cylinderView", "playerView", "headBtn", "vipHeadBg"};
    [MatchWaitingView.s_controls.roundDSOverRankView]		= {"roundDSOverArea", "progressView", "cylinderView", "playerView", "playerStateBg", "rankView"};
    [MatchWaitingView.s_controls.roundDSOverOutView]		= {"roundDSOverArea", "progressView", "cylinderView", "playerView", "playerStateBg", "outView"};
    [MatchWaitingView.s_controls.roundDSOverReturnBtn] 		= {"roundDSOverArea","returnBtn"};
    [MatchWaitingView.s_controls.roundDSOverArrow]          = {"roundDSOverArea", "progressView", "cylinderView", "playerView", "playerStateBg", "point"};
    [MatchWaitingView.s_controls.roundDSOverWiner]          = {"roundDSOverArea", "progressView", "cylinderView", "item1", "winer"};
    [MatchWaitingView.s_controls.onlookersTips]             = {"roundDSOverArea", "btnView", "rewardBtn","onlookerTips"};
};

MatchWaitingView.s_controlFuncMap = 
{
	[MatchWaitingView.s_controls.bg] 						= MatchWaitingView.onEmptyfunc;
	[MatchWaitingView.s_controls.roundDSOverArea] 			= MatchWaitingView.onEmptyfunc;
	[MatchWaitingView.s_controls.roundDSOverReturnBtn] 		= MatchWaitingView.onRoundDSOverReturnBtnClick;
	[MatchWaitingView.s_controls.roundDSOverRewardBtn] 		= MatchWaitingView.onRoundDSOverRewardBtnClick;
	[MatchWaitingView.s_controls.roundDSOverGamesBtn] 		= MatchWaitingView.onRoundDSOverGamesBtnClick;
    [MatchWaitingView.s_controls.roundDSOverRuleBtn]        = MatchWaitingView.onRoundDSOverRuleBtnClick;
};

MatchWaitingView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_ROUND_OVER]                  = "showRoundOverInfo";
    [MatchMechineConfig.ACTION_GET_REVIVE_NOTIFY]           = "hideRoundOver";
    [MatchMechineConfig.ACTION_GET_RANK_DETAIL]             = "onGetRankDetailInfo";
};

MatchWaitingView.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE]                        = "hideRoundOver";
    [MatchMechineConfig.STATUS_LOADING]                     = "hideRoundOver"; 
    [MatchMechineConfig.STATUS_PLAYING]                     = "hideRoundOver";
    [MatchMechineConfig.STATUS_WAITING]                     = "hideRoundOver";
    [MatchMechineConfig.STATUS_FINISH]                      = "delayHideRoundOver";
};

return MatchWaitingView;