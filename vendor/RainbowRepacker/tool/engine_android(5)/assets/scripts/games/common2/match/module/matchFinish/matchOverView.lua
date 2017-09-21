require("isolater/interface/settingIsolater");
require("games/common2/match/module/matchFinish/matchOverRewardItem");
require("isolater/interface/regionConfigIsolater");
local ViewBase = require("games/common2/module/viewBase");
local MatchOverView = class(ViewBase, false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end
MatchOverView.s_controls = 
{
    bg 							= getIndex(),
	matchOverArea 				= getIndex(),
	waitView					= getIndex(),
	rewardView 					= getIndex(),
	matchOverWinContent 		= getIndex(),
	matchRewards 				= getIndex(),
	matchOverTitleView 			= getIndex(),
	btnsView 					= getIndex(),
	matchOverBackBtn 			= getIndex(),
	matchOverBaoMingBtn 		= getIndex(),
	matchOverLineImg 			= getIndex(),
	matchOverShareBtn 			= getIndex(),

    matchOverTxtMyRank 			= getIndex(),

    matchOverImgQRCode 			= getIndex(),
    matchOverImgStamp 			= getIndex(),
    matchOverTvLose 			= getIndex(),
    matchOverShareTipsView		= getIndex(),
    matchOverWinTipsView		= getIndex(),
    matchOverTipsBg 			= getIndex(),

    title 						= getIndex(),
    rankBg						= getIndex(),
    time						= getIndex(),
    onlookersBtn 				= getIndex(),
};

MatchOverView.ctor = function(self,seat,viewConfig)
	super(self, viewConfig);
    self:setFillParent(true,true);
    self.m_ctrl = MatchOverView.s_controls;
	self:_initView();

	self.shareData ={};

    MatchIsolater.getInstance():setObserver(self);

    self:setVisible(false);
end

MatchOverView.dtor = function(self)
	ShaderManager.removeShader(self.m_bg);

	self:_stopLineAnim();
	self:_stopPropTipsTimer();

    MatchIsolater.getInstance():clearObserver(self);
    
	self:closeDialogs();

	if tonumber(self.m_showRewardTime) then 
		local curTime = os.time();
		local lastTime = tonumber(self.m_showRewardTime);
		local time = curTime - lastTime;

		local str = "";
		if time <= 5 then 
			str = "0_5s"
		elseif time > 5 and time <= 10 then 
			str = "5_10s";
		elseif time > 10 and time <= 60 then 
			local tmp1 = time%10;
			local tmp2 = time - tmp1;
			if tmp1 == 0 then 
				str = string.format("%s_%ss",(tmp2-10),tmp2);
			else 
				str = string.format("%s_%ss",tmp2,(tmp2+10));
			end 
		elseif time > 60 then 
			str = "60s+";
		end 

		local action = self.shareData.isReward and UBConfig.kMatchShowTimeReward or UBConfig.kMatchShowTimeUnReward;
		ReportIsolater.getInstance():reportWithVal(action,str);
	end 
	self.m_showRewardTime = nil;
end
-------------------------------------------------------------------------------------------------------------
-- 创建相应奖励的图标及文字
-- return 奖励总数, 图标
MatchOverView._createPrizeImages = function ( self, data )	
	local rewardCount = 0; 
    local showList = {}; -- 虚拟物品table
    local showGoodsList = {}; -- 实物table
    local hasProp = false;

    -- 处理道具信息
    for _, v in ipairs(data.turn_prop or {}) do 
    	if v then 
			local pt = v.new_type;
			local pn = v.new_value;

	        local propImg = self:_createRewardItemView(pt, pn);
        	if pt >= 10000 then 
        		table.insert(showGoodsList, {type = pt, img = propImg});
        	else
				PropIsolater.getInstance():updatePropNum(pt, PropIsolater.getInstance():getPropNumByPropType(pt) + pn);
	            table.insert(showList, {type = pt, img = propImg});
	        end
	        rewardCount = rewardCount + 1;
	        hasProp = true;
	    end
    end
    -- 实物奖励放在最前面
    for _, v in ipairs(showGoodsList or {}) do 
    	if v then 
	    	table.insert(showList, 1, v);
	    end
    end
    -- 旧接口的奖励，分别是银币、钻石、大师分
	for _,v in pairs(data.turn_money or {}) do

        if v.new_type == UserPropertyIsolater.getInstance():getPropertySilverCoinID() 
            or v.new_type == UserPropertyIsolater.getInstance():getPropertyGoldBarID()
            or v.new_type == UserPropertyIsolater.getInstance():getPropertyDiamondID() then

            local totalMoney = UserPropertyIsolater.getInstance():getMoneyById(v.new_type) + number.valueOf(v.new_value);
            UserPropertyIsolater.getInstance():setMoneyById(v.new_type , totalMoney);
            local coinImg = self:_createRewardItemView(v.new_type, v.new_value);
            table.insert(showList, {type = v.new_type, img = coinImg});

		elseif v.new_type == 100 then -- 大师分
		 	MatchIsolater.getInstance():setMyMasterPoint(MatchIsolater.getInstance():getMyMasterPoint() + number.valueOf(v.new_value));
			local masterImg = self:_createRewardItemView(v.new_type, v.new_value);
            table.insert(showList, {type = v.new_type, img = masterImg});
        end

	    rewardCount = rewardCount + 1;
	end

	return rewardCount, showList,hasProp;
end

MatchOverView._generateAwardList = function(self, data)
    local awards = {}; 

    -- 处理道具信息
    for _, v in ipairs(data.turn_prop or {}) do 
        if v then 
            local type = PropIsolater.getInstance():getPropType(number.valueOf(v.new_type));
            local value = number.valueOf(v.new_value);
            if type > 0 and value > 0 then
            	local desc = self:_getRewardDesc(type, value);
                if type >= 10000 then 
                    --实物奖励 放前面
                    table.insert(awards, 1, {type = type, desc = desc});
                else
                    table.insert(awards, {type = type, desc = desc});
                end
            end
        end
    end

    for _, v in pairs(data.turn_money or {}) do
        if v then
        	local desc = self:_getRewardDesc(v.new_type, v.new_value);
            table.insert(awards, {type = v.new_type, desc = desc});
        end
    end

    return awards;
end

-- 控制奖励显示位置坐标
MatchOverView._arragePrizeImagesPosition = function ( self, rewardCount, showList )
	local count = 0;
	local imgWidth = 140;
	local nextPos = { x = 0, y = 0 };
	for k, v in ipairs(showList) do
		count = count + 1;
				local x = nextPos.x;
				local y = nextPos.y;
				v.img:setPos(x, y);
		nextPos = {x = x + imgWidth, y = y};
			end

	self.m_matchOverWinContent:setSize(count * imgWidth, nil);
    end

MatchOverView._createRewardItemView = function ( self, type, num)
    local desc = self:_getRewardDesc(type, num);
	local item = new(MatchOverRewardItem, type, num, desc);
	item:setAlign(kAlignLeft);
	self.m_matchRewards:addChild(item);

	return item;
end

MatchOverView._getRewardInfo = function(self, cleanup)
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

MatchOverView._getRewardDesc = function(self, type, num)
    local text = "";
    local rewardInfo = self:_getRewardInfo();

    if not table.isEmpty(rewardInfo) then
        local data = table.verify(MatchIsolater.getInstance():getMatchData());
        if number.valueOf(data.id) == number.valueOf(rewardInfo.matchid,-1) then
            local map = table.verify(rewardInfo.awardsmap);
            local key = string.format("%s_%s", type or 0, num or 0);
            text = map[key] or "礼品"
        end
    end
    text = text:removeAll("#");
    return text;
end

MatchOverView._generateAwardWiner = function(self)
	local winerData = nil;
	local rewardInfo = self:_getRewardInfo();
	if not table.isEmpty(rewardInfo) then
        local data = table.verify(MatchIsolater.getInstance():getMatchData());
        if number.valueOf(data.id) == number.valueOf(rewardInfo.matchid,-1) then
	        winerData = {
				award = rewardInfo.award,
				icon = rewardInfo.icon
			}
		end
    end
	return winerData;
end

-------------------------------------------------------------------------------------------------
MatchOverView._initView = function(self)
	--此处设置大小和位置
	self.m_bg = self:findViewById(self.m_ctrl.bg);
	self.m_waitView = self:findViewById(self.m_ctrl.waitView);
	self.m_rewardView = self:findViewById(self.m_ctrl.rewardView);
	self.m_btnsView = self:findViewById(self.m_ctrl.btnsView);
	self.m_backBtn = self:findViewById(self.m_ctrl.matchOverBackBtn);
	self.m_matchOverLineImg 			= self:findViewById(self.m_ctrl.matchOverLineImg);
	self.m_matchOverShareTipsView		= self:findViewById(self.m_ctrl.matchOverShareTipsView);
	self.m_matchOverShareBtn 			= self:findViewById(self.m_ctrl.matchOverShareBtn)

	self.m_matchOverWinContent 			= self:findViewById(self.m_ctrl.matchOverWinContent);
	self.m_matchRewards 				= self:findViewById(self.m_ctrl.matchRewards);  
    self.m_matchOverTxtMyRank 			= self:findViewById(self.m_ctrl.matchOverTxtMyRank);
    self.m_matchOverImgQRCode 			= self:findViewById(self.m_ctrl.matchOverImgQRCode);
    self.m_matchOverImgStamp 			= self:findViewById(self.m_ctrl.matchOverImgStamp);
    self.m_matchOverTvLose 				= self:findViewById(self.m_ctrl.matchOverTvLose);
    self.m_matchOverTitleView 			= self:findViewById(self.m_ctrl.matchOverTitleView);
    self.m_matchOverWinTipsView			= self:findViewById(self.m_ctrl.matchOverWinTipsView);
    self.m_matchOverTipsBg				= self:findViewById(self.m_ctrl.matchOverTipsBg);

    self.m_title 						= self:findViewById(self.m_ctrl.title);

    self.m_bg:setEventDrag(self, self.onEmptyfunc);
    self.m_matchOverLineImg:setTransparency(0);

	self.m_matchOverImgStamp:setFile("games/common/match/match_certificate/stamp.png");
	self.m_matchOverImgQRCode:setFile("games/common/match/qrcode.png");
	 
	local tipsGameName = self.m_matchOverShareTipsView:getChildByName("tipsGameName");
	tipsGameName:setFile("games/common/match/match_certificate/game_name.png");
	local tips = self.m_matchOverShareTipsView:getChildByName("tips");
	local widthTipsGameName, _ = tipsGameName:getSize();
	local widthTips, _ = tips:getSize();
	self.m_matchOverShareTipsView:setSize(widthTipsGameName + widthTips, nil);

	local wintips = self.m_matchOverWinTipsView:getChildByName("text");
	wintips:setText("请在物品箱中\n查看您的奖励");

	local _,y_0 = self.m_matchOverTipsBg:getPos();
	local _,h = self.m_matchOverTipsBg:getSize();
	local x,y = self.m_matchOverTipsBg:getAbsolutePos();
	local height = System.getScreenScaleHeight();
	local h_n = height - y;
	self.m_matchOverTipsBg:setSize(nil,h_n);
	self.m_matchOverTipsBg:setPos(nil,y_0-(h_n-h));

	local curGameId = GameInfoIsolater.getInstance():getCurGameId();       
    local isSupport = GameInfoIsolater.getInstance():isGameSupportOnlookerMatchFeature(curGameId);
    local isOpen = SettingIsolater.getInstance():getMatchOnlookerSwitch();
    isSupport = isOpen and isSupport;
    local onlookersBtn = self:findViewById(self.m_ctrl.onlookersBtn);
    onlookersBtn:setVisible(isSupport);
end

MatchOverView._startLineAnim = function(self)
	self:_stopLineAnim();

	self.m_matchOverLineImgIndex = 0;        
    self.m_matchOverLineImg:setVisible(true);

    self.m_lineAnim = AnimFactory.createAnimInt(kAnimRepeat, 0, 1, 50, -1);
    self.m_lineAnim:setDebugName("lineAnim|TimeOutCount|MatchOverView");
    self.m_lineAnim:setEvent(self, self._onLineAnim);
end

MatchOverView._onLineAnim = function(self)
	self.m_matchOverLineImgIndex = number.valueOf(self.m_matchOverLineImgIndex);
    self.m_matchOverLineImg:setTransparency(self.m_matchOverLineImgIndex);

    if self.m_matchOverLineImgIndex >= 1 then
        self:_stopLineAnim();
        return;
    end
    self.m_matchOverLineImgIndex = self.m_matchOverLineImgIndex + 0.01;
end

MatchOverView._stopLineAnim = function(self)
    delete(self.m_lineAnim);
	self.m_lineAnim = nil;
	self.m_matchOverLineImgIndex = nil;
end
-------------------------------------------------------------------------------------------------
MatchOverView.onEmptyfunc = function(self)
end

MatchOverView.onBackBtnClick = function(self)
	Log.a(GameMatchConfig.matchLogFileName,"MatchOverView.onBackBtnClick");

 	local action = MatchMechineConfig.ACTION_EXIT_SUCCESS;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchOverView.onBackBtnClick");
end

MatchOverView.onBaoMingBtnClick = function(self)
	local data = table.verify(MatchIsolater.getInstance():getMatchData());
	if table.isEmpty(data) then		
		self:onBackBtnClick();
	else
		self:requestMatchList();
		local action = self.shareData.isReward and UBConfig.kMatchSignupNextReward or UBConfig.kMatchSignupNextUnReward;
		UBReport.getInstance():report(action, string.format("id_%s", data.id or ""));
	end
end

MatchOverView.onShareClick = function (self)
	local data = table.verify(MatchIsolater.getInstance():getMatchData());
	if not table.isEmpty(data) then 
		local action = self.shareData.isReward and UBConfig.kMatchShareReward or UBConfig.kMatchShareUnReward;
		UBReport.getInstance():report(action, string.format("id_%s", data.id or ""));
    end
	self:_showShareDialog();
end

MatchOverView.onReturnHallBtnClick = function(self)
	local data = table.verify(MatchIsolater.getInstance():getMatchData());
	if not table.isEmpty(data) then 
		local action = self.shareData.isReward and UBConfig.kMatchReturnHallReward or UBConfig.kMatchOnlookerUnReward;
		UBReport.getInstance():report(action, string.format("id_%s", data.id or ""));
    end
	self:onBackBtnClick();
end

MatchOverView.onOnlookersBtnClick = function(self)
	local data = table.verify(MatchIsolater.getInstance():getMatchData());
	if not table.isEmpty(data) then 
		local action = self.shareData.isReward and UBConfig.kMatchOnlookerReward or UBConfig.kMatchOnllokerUnReward;
		UBReport.getInstance():report(action, string.format("id_%s", data.id or ""));
    end
    
	local action = MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS;
	local info = {};
	info.viewName = MatchMechineConfig.VIEW_RANK_REWARD;
	MatchMechine.getInstance():receiveAction(action,info);

	local action = MatchMechineConfig.ACTION_NS_RANK_REWARD_CLICK;
	MatchMechine.getInstance():receiveAction(action);
end
----------------------------------------------------------------------------------------------------------
MatchOverView._showButtons = function (self, flag)
	self.m_backBtn:setVisible(flag);
	self.m_btnsView:setVisible(flag);
	self.m_matchOverTipsBg:setVisible(not flag);
	if self.m_hasProp then
		self.m_matchOverWinTipsView:setVisible(flag);
	end
end

MatchOverView._showShareDialog = function(self)
    local defualtShareConfig = RegionConfigIsolater.getInstance():getDefaultShareConfig();
    if not defualtShareConfig["weixinGroup"] and not defualtShareConfig["weixinFriend"] then
        Toast.getInstance():showText(kBackpackShareTips,50,30,kAlignLeft,"",24,200,175,110)
        return true;
    end
	local sharePopDialog = require("games/common2/module/logic/sharePopDialog2");
	self.m_shareManagerDialog = new(sharePopDialog,self.shareData);
	local abs_x, abs_y = self.m_matchOverShareBtn:getAbsolutePos();
	local x = self.m_matchOverShareBtn:getPos();
	local y = System.getScreenScaleHeight() - abs_y - 100;
	self.m_shareManagerDialog:setContentPos(x,y+105,kAlignBottom);

	self.m_shareManagerDialog:setShowButtonsEvent(self, self._showButtons);
	IBaseDialog.pushDialog(self.m_shareManagerDialog);
end

MatchOverView.onGetWeiChatCallback = function(self, isSuccess, param, shareChannel)
    Log.v("TaskRewardDialog.getWeiChatCallback", " isSuccess = ", isSuccess, " param = ", param);
    self:_showButtons(true);
end
----------------------------------------------------------------------------------------------------------
--[Comment]
-- 请求比赛列表
MatchOverView.requestMatchList = function ( self )
	MatchIsolater.getInstance():requestMatchList();
end

--比赛列表请求完成
MatchOverView.onGetMatchList = function(self)
    local data = table.verify(MatchIsolater.getInstance():getMatchData());
    local nextMatch = MatchIsolater.getInstance():getClosestMatchCanSiginup(data);
    if not nextMatch then
        Toast.getInstance():showText(kTextNoTypeMatch,50,30,kAlignLeft,"",24,200,175,110);
        self:onBackBtnClick();
        return;
    end

    Log.a("TOHALL","MatchOverView.onGetMatchList","==> hall");
    MatchIsolater.getInstance():setSignMatchId(nextMatch.id);
	GameInfoIsolater.getInstance():setGameToWhereState(States.GameMatchHall);

	MechineManage.getInstance():receiveAction(GameMechineConfig.ACTION_NS_FORCE_EXIT,nil,nil,nil,"MatchOverView.onGetMatchList");
end

-------------------------------------------------------------------------------------------------------------
MatchOverView._resetMatchRewardLayer = function(self)			
	-- self:_startNoOptTimer();

	self.m_matchOverTitleView:removeAllChildren(true);
	self.m_matchOverWinContent:setVisible(false);
	self.m_matchOverWinTipsView:setVisible(false);
    self.m_matchOverTvLose:setVisible(false);

    self.m_matchOverTipsBg:setVisible(false);
	self.m_btnsView:setVisible(true);
	self.m_backBtn:setVisible(true);
	self.m_title:setVisible(true);

	self.m_matchOverLineImg:setVisible(false);	
	self.m_matchOverImgStamp:setVisible(false);

	self.m_matchRewards:removeAllChildren();

	self:_stopPropTipsTimer();
end

MatchOverView._refreshOnlookersData = function(self)
    local info = {
        viewName = MatchMechineConfig.VIEW_RANK_REWARD,
    };
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_CREATE_MATCH_VIEWS,info);
    MatchMechine.getInstance():receiveAction(MatchMechineConfig.ACTION_REQUEST_RANK_DETAIL);
end
-------------------------------------------------------------------------------------------------------------
MatchOverView.showMatchFinish = function(self)
	-- self:_startNoOptTimer();
	self:_refreshOnlookersData();

	self.m_waitView:setVisible(true);
	self.m_rewardView:setVisible(false);
	self.m_btnsView:setVisible(true);
	self.m_backBtn:setVisible(true);
	self.m_title:setVisible(false);

	self:initBaoMingBtnVisible();
	self:initShareBtnPos();

	self:setVisible(true);
end

MatchOverView.initBaoMingBtnVisible = function(self)
	local data = table.verify(MatchIsolater.getInstance():getMatchData())
	if data.id then
        local state = not MatchIsolater.getInstance():checkInvitationalById(data.id)
		self:findViewById(self.m_ctrl.matchOverBaoMingBtn):setVisible(state)
	end
end

MatchOverView.initShareBtnPos = function(self)
    local onlookersBtn = self:findViewById(self.m_ctrl.onlookersBtn);
    local isShowOnlookerBtn = onlookersBtn:getVisible();

    local matchOverBaoMingBtn = self:findViewById(self.m_ctrl.matchOverBaoMingBtn);
    local isShowBaoMingBtn = matchOverBaoMingBtn:getVisible();

    local x = 0;
    if isShowOnlookerBtn and (not isShowBaoMingBtn) then 
    	x = 215;
    elseif (not isShowOnlookerBtn) and isShowBaoMingBtn then 
    	x = -215;
    end

    local matchOverShareBtn = self:findViewById(self.m_ctrl.matchOverShareBtn); 
    matchOverShareBtn:setPos(x,nil);
end 

MatchOverView.showMatchReward = function(self,seat,uid,data,isFast)
	data = table.verify(data);
	self.m_showRewardTime = os.time();

	self.m_waitView:setVisible(false);
	self.m_rewardView:setVisible(true);

	self:_resetMatchRewardLayer();
	
	local nickSub = UserBaseInfoIsolater.getInstance():getNickname();
	nickSub = string.subUtfStrByCn(nickSub,1,6,"");
	
	local djData = table.verify(MatchIsolater.getInstance():getMatchData());
	local djName =  djData.name or "此次比赛";
    djName = string.gsub(djName,"#","");
    djName = string.subUtfStrByCn(djName,1,14,"");

    local totalPersonNum = number.valueOf(data.totalPersonNum);
    local myRankPos = number.valueOf(data.myRankPos);
    local weedout = totalPersonNum - myRankPos;
    weedout = weedout >= 0 and weedout or 0;
    self.shareData.matchusers = totalPersonNum;--比赛总人数

    self.shareData.matchconfigid = data.matchConfigId or -1;

    local titleFile = data.isReward and "games/common/match/match_certificate/title_reward.png" or "games/common/match/match_certificate/title_no_reward.png";
    local y = data.isReward and 0 or 40;
    self.m_title:setFile(titleFile);
    local w = self.m_title.m_res:getWidth();
   	local h = self.m_title.m_res:getHeight();
    self.m_title:setSize(w,h);
    self.m_title:setPos(0,y);

    local y = data.isReward and 3 or 50;
    local rankBg = self:findViewById(self.m_ctrl.rankBg);
    rankBg:setPos(nil,y);
    self.m_matchOverTitleView:setSize(nil, data.isReward and 58 or 105);

    local time = self:findViewById(self.m_ctrl.time);
    local str = os.date("%Y.%m.%d   %H:%M");
    time:setText(str);

    local file = data.isReward and "games/common/match/match_certificate/btn_share.png" or "games/common/match/match_certificate/btn_share_2.png";
    local matchOverShareBtn = self:findViewById(self.m_ctrl.matchOverShareBtn);
    matchOverShareBtn:setFile(file);


    if not data.isReward then
	    --没奖
        self.shareData.isReward = false; -- 没获得奖励
    	self.shareData.Rank = 0;
    	self.shareData.awardsWiner = self:_generateAwardWiner();


    	local tips =  string.format("#c2D6FF6 %s #c93551A在#cF64B00 %s #c93551A中%s", nickSub, djName, weedout > 0 and "" or "荣获");
    	local tipsSub = weedout > 0 and string.format("#c93551A击败#cF64B00 %s #c93551A名对手荣",weedout) or "";
    	local matchOverTitle = new(RichText, tips, nil, 30, kAlignCenter, nil, 30);
		matchOverTitle:setAlign(kAlignCenter);
		self.m_matchOverTitleView:addChild(matchOverTitle);

		if not string.isEmpty(tipsSub) then
			local matchOverTitleSub = new(RichText, tipsSub, nil, 30, kAlignCenter, nil, 30);
			matchOverTitleSub:setAlign(kAlignCenter);
			self.m_matchOverTitleView:addChild(matchOverTitleSub);

			local _, h = self.m_matchOverTitleView:getSize();
			matchOverTitle:setPos(nil, -h/4);
			matchOverTitleSub:setPos(nil, h/4);
		end

		self.m_matchOverTvLose:setVisible(true);

	else
		self.shareData.isReward = true; -- 获得奖励，更新状态
		self.m_matchOverWinContent:setVisible(true);
		self.m_matchOverImgStamp:setVisible(true);
		local tips = string.format("#c93551A恭喜#c2D6FF6 %s #c93551A在#cF64B00 %s #c93551A中%s", nickSub, djName, weedout > 0 and "" or "荣获");
		local tipsSub = weedout > 0 and string.format("#c93551A击败#cF64B00 %s #c93551A名对手荣获",weedout) or "";
    	local matchOverTitle = new(RichText, tips, nil, 30, kAlignCenter, nil, 30);
		matchOverTitle:setAlign(kAlignCenter);
		self.m_matchOverTitleView:addChild(matchOverTitle);

		if not string.isEmpty(tipsSub) then
			local matchOverTitleSub = new(RichText, tipsSub, nil, 30, kAlignCenter, nil, 30);
			matchOverTitleSub:setAlign(kAlignCenter);
			self.m_matchOverTitleView:addChild(matchOverTitleSub);

			local _, h = self.m_matchOverTitleView:getSize();
			matchOverTitle:setPos(nil, -h/4);
			matchOverTitleSub:setPos(nil, h/4);
		end

		if data.rewardInfo then 
			local rewardCount, showList,hasProp = self:_createPrizeImages(data.rewardInfo);
            self.shareData.awardsList = self:_generateAwardList(data.rewardInfo);
			self:_arragePrizeImagesPosition(rewardCount, showList);
			self.m_hasProp = hasProp;
			self.m_matchOverWinTipsView:setVisible(hasProp);
			if self.m_hasProp then 
				self.m_propTipsTimer =  Clock.instance():schedule_once(function(dt)
		            self.m_hasProp = false;
		            self.m_matchOverWinTipsView:setVisible(self.m_hasProp);
		            self:_stopPropTipsTimer();
		        end,5);
			end 
		end
        self:_startLineAnim();
	end
	if data.myRankPos == 1 then 
		self.m_matchOverTxtMyRank:setText("冠军");
	elseif data.myRankPos == 2 then 
		self.m_matchOverTxtMyRank:setText("亚军");
	elseif data.myRankPos == 3 then 
		self.m_matchOverTxtMyRank:setText("季军");
	else
		self.m_matchOverTxtMyRank:setText(string.format("第%d名", data.myRankPos or 0));
	end
	self.shareData.Rank = data.myRankPos or 0;

	self:setVisible(true);

    self.shareData.djName = djName;
end

MatchOverView._stopPropTipsTimer = function(self)
	if self.m_propTipsTimer then 
    	self.m_propTipsTimer:cancel();
    end 
    self.m_propTipsTimer = nil;
end

MatchOverView.closeDialogs = function(self)
	delete(self.m_shareManagerDialog);
	self.m_shareManagerDialog = nil;
end

MatchOverView.s_controlConfig = 
{
	[MatchOverView.s_controls.bg] 							= {"bg"};
	[MatchOverView.s_controls.matchOverArea] 				= {"matchOverArea"};
	[MatchOverView.s_controls.waitView] 					= {"matchOverArea","content","waitView"};
	[MatchOverView.s_controls.rewardView]					= {"matchOverArea","content","rewardView"};
	[MatchOverView.s_controls.matchOverWinContent] 			= {"matchOverArea", "content","rewardView" ,"winContent" };
	[MatchOverView.s_controls.matchRewards] 				= {"matchOverArea", "content","rewardView" ,"winContent" ,"rewards"};
    [MatchOverView.s_controls.matchOverWinTipsView]			= {"matchOverArea", "content","rewardView","winContent","wintipsBg"};

	[MatchOverView.s_controls.matchOverImgStamp] 			= {"matchOverArea", "content","rewardView" ,"imgStamp"};
	[MatchOverView.s_controls.matchOverTvLose] 				= {"matchOverArea", "content","rewardView", "tvLose"};
    [MatchOverView.s_controls.matchOverTxtMyRank]			= {"matchOverArea", "content","rewardView" ,"rankBg", "txtMyRank"};
    [MatchOverView.s_controls.matchOverTitleView] 			= {"matchOverArea", "content","rewardView", "titleView"};
    
    [MatchOverView.s_controls.btnsView] 					= {"matchOverArea","btnsView"};
	[MatchOverView.s_controls.matchOverBackBtn] 			= {"back"};
	[MatchOverView.s_controls.matchOverBaoMingBtn] 			= {"matchOverArea","btnsView","baoming"};    
    [MatchOverView.s_controls.matchOverShareBtn] 			= {"matchOverArea","btnsView","matchOverShareBtn"};

	[MatchOverView.s_controls.matchOverTipsBg]				= {"matchOverArea","tipsBg"};
	[MatchOverView.s_controls.matchOverShareTipsView]		= {"matchOverArea", "tipsBg","tipsView"};
	[MatchOverView.s_controls.matchOverImgQRCode] 			= {"matchOverArea", "tipsBg","imgQRCode"};

    [MatchOverView.s_controls.matchOverLineImg] 			= {"lineImg"};

    [MatchOverView.s_controls.title]						= {"matchOverArea","content","title"};
    [MatchOverView.s_controls.rankBg]						= {"matchOverArea", "content","rewardView" ,"rankBg"};
    [MatchOverView.s_controls.time]							= {"matchOverArea", "content","rewardView" ,"timeView","time"};
    [MatchOverView.s_controls.onlookersBtn] 				= {"matchOverArea","btnsView","onlookersBtn"};    
};

MatchOverView.s_controlFuncMap = 
{
	[MatchOverView.s_controls.bg] 						= MatchOverView.onEmptyfunc;
	[MatchOverView.s_controls.matchOverBackBtn] 		= MatchOverView.onReturnHallBtnClick;
	[MatchOverView.s_controls.matchOverBaoMingBtn] 		= MatchOverView.onBaoMingBtnClick;
    [MatchOverView.s_controls.matchOverShareBtn] 		= MatchOverView.onShareClick;
    [MatchOverView.s_controls.onlookersBtn]				= MatchOverView.onOnlookersBtnClick;
};

MatchOverView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_FINISH]								= "showMatchFinish";
    [MatchMechineConfig.ACTION_FINISH_REWARD]						= "showMatchReward";
    [GameMechineConfig.ACTION_NS_WEIXIN_SHARE_CALLBACK]				= "onGetWeiChatCallback";
    [GameMechineConfig.ACTION_NS_DOWNLOAD_SHARE_IMAGE_CALLBACK] 	= "onDownloadShareImageCallBack";
};

MatchOverView.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE] 								= "closeDialogs";
    [MatchMechineConfig.STATUS_LOADING] 							= "closeDialogs"; 
};

return MatchOverView;