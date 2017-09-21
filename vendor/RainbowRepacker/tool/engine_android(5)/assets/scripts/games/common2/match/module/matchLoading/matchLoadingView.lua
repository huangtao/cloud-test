
require("games/common2/match/module/matchLoading/matchInvitePopDialog");
require("games/common2/match/module/matchLoading/matchRewardView2");
require("games/common2/match//module/matchLoading/matchInviteFriendsView");
require("util/schedule");

local ViewBase = require("games/common2/module/viewBase");

local MatchLoadingView = class(ViewBase,false);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end
--比赛列表点击报名，确认弹框
MatchLoadingView.s_controls =
{
    title           = getIndex();
    infoView        = getIndex();
    timeView        = getIndex();
    countView       = getIndex();
    slotBtn         = getIndex();

    leftBg          = getIndex();
    leftView        = getIndex();
    rightView       = getIndex();
    rightTips       = getIndex();
    p1Img           = getIndex();
    p2Img           = getIndex();
    p3Img           = getIndex();
    rewardBtn       = getIndex();
    rewardBtnName   = getIndex();
    inviteFriendBtn = getIndex();
    exitMatchBtn    = getIndex();

    chatTx          = getIndex();
    chatSendBtn     = getIndex();
    chatHistoryView = getIndex();   

    progressView    = getIndex();
    progress        = getIndex();
    progressText    = getIndex();

    chatShiled      = getIndex();
    miniGameBtn     = getIndex();
    chatTips        = getIndex();
};

MatchLoadingView.ctor = function(self,seat,viewConfig)
    super(self,viewConfig);
    self:setFillParent(true,true);
    self.m_ctrls = MatchLoadingView.s_controls;

    MatchIsolater.getInstance():setObserver(self);
    SlotMachineLayerIsolater.getInstance():setObserver(self);

    EventDispatcher.getInstance():register(Event.Resume,self,self.onResume);

    EventDispatcher.getInstance():register("match_select_chat_item_event",self,self.onMatchChatItemSelected);
    EventDispatcher.getInstance():register("match_cancle_select_chat_item_event",self,self.onMatchChatItemCancleSelected);

    self:_initViews();
end

MatchLoadingView.dtor = function(self)
    MatchIsolater.getInstance():clearObserver(self);
    SlotMachineLayerIsolater.getInstance():clearObserver(self);

    EventDispatcher.getInstance():unregister(Event.Resume,self,self.onResume);

    EventDispatcher.getInstance():unregister("match_select_chat_item_event",self,self.onMatchChatItemSelected);
    EventDispatcher.getInstance():unregister("match_cancle_select_chat_item_event",self,self.onMatchChatItemCancleSelected);

    self:_stopWaitingTimer();
    self:_removeChatTipsTimer();

    self:hideDialogs();
end

MatchLoadingView.onResume = function(self)
    self:_refreshMatchWaitingTime();
end 
------------------------------------------------------------------------------------------------------
MatchLoadingView.onGetSlotMachineGameSwitchCallBack = function(self, isSuccess)
    if not isSuccess then return end
    
    if self.m_matchType then
        self:showSlotMachine(self.m_matchType);
    end 
end
------------------------------------------------------------------------------------------------------
-- MatchIsolater deglete
--获得比赛基础信息，不包括奖励，主要是重连时，获得比赛名称，开始时间，报名费用等
MatchLoadingView.onResponseMatchBasicInfo = function(self, info)
    if not info then return end
    self.m_data = table.verify(self.m_data);
    self.m_data.fee = table.verify(info.fee);
    self.m_data.type = number.valueOf(info.type);
    self.m_data.stime = number.valueOf(info.stime);
    self.m_data.configid = number.valueOf(info.matchconfigid);

    self:_refreshMatchName(info.mname);
    self:_refreshMatchType(info.type or 0);
    self:_refreshEntryFee(); 
    self:_refreshMatchChat(info);
end

MatchLoadingView.onResponseMatchDetail = function(self,info)
    if self.m_data then 
        self.m_data.rewardList = info.award;
    end

    self.m_matchRules = info.desc;
    self:setRewardList(info.award,info.icon,info.awardcount);  
end

MatchLoadingView.onRefreshMatchWatingTime = function(self)
    self:_refreshMatchWaitingTime(); 
end
------------------------------------------------------------------------------------------------------
MatchLoadingView._initViews = function(self)
    self.m_title = self:findViewById(self.m_ctrls.title);
    self.m_infoView = self:findViewById(self.m_ctrls.infoView);
    self.m_timeView = self:findViewById(self.m_ctrls.timeView);
    self.m_countView = self:findViewById(self.m_ctrls.countView);

    self.m_progressView = self:findViewById(self.m_ctrls.progressView);
    self.m_progress = self:findViewById(self.m_ctrls.progress);
    self.m_progressText = self:findViewById(self.m_ctrls.progressText);

    self.m_leftBg = self:findViewById(self.m_ctrls.leftBg);
    self.m_rightTips = self:findViewById(self.m_ctrls.rightTips);

    self.m_chatShiled = self:findViewById(self.m_ctrls.chatShiled);
    self.m_chatShiled:setSize(System.getScreenScaleWidth(),System.getScreenScaleHeight());
    local x,y = self.m_chatShiled:getAbsolutePos();
    self.m_chatShiled:setPos(-x,-y);

    local leftView = self:findViewById(self.m_ctrls.leftView);
    local rightView = self:findViewById(self.m_ctrls.rightView);
    local parentWidth, _ =  leftView:getParent():getSize();
    local leftRegion, leftTopLeftX, leftTopLeftY, leftBottomRightX, leftBottomRightY = leftView:getFillRegion();
    local rightRegion, rightTopLeftX, rightTopLeftY, rightBottomRightX, rightBottomRightY = rightView:getFillRegion();

    leftView:setFillRegion(leftRegion, leftTopLeftX, leftTopLeftY, parentWidth / 2, leftBottomRightY);
    rightView:setFillRegion(rightRegion, parentWidth / 2, rightTopLeftY, rightBottomRightX, rightBottomRightY);   
    
    self.m_timeStr = "";
    self.m_timeRichText = new(RichText, self.m_timeStr, 1, 1, kAlignLeft, nil, 26);
    self.m_timeRichText:setAlign(kAlignLeft);
    self.m_timeView:addChild(self.m_timeRichText);

    self.m_countStr = "";
    self.m_countRichText = new(RichText, self.m_countStr, 1, 1, kAlignLeft, nil, 26);
    self.m_countRichText:setAlign(kAlignLeft);
    self.m_countView:addChild(self.m_countRichText);

    
    self.m_chatTx = self:findViewById(self.m_ctrls.chatTx);                     -- 聊天内容
    self.m_chatHistoryView = self:findViewById(self.m_ctrls.chatHistoryView);   -- 聊天历史
    self.m_chatSendBtn = self:findViewById(self.m_ctrls.chatSendBtn);           -- 发送
    self.m_inviteFriendBtn = self:findViewById(self.m_ctrls.inviteFriendBtn);   -- 邀请好友
    self.m_exitMatchBtn = self:findViewById(self.m_ctrls.exitMatchBtn);         -- 退赛
    local rewardBtn = self:findViewById(self.s_controls.rewardBtn);
    local w = rewardBtn:getSize();
    local x = rewardBtn:getAbsolutePos();
    self.m_leftCenterX = x + w/2; 

    self:_initChatRegion();
    self:_initChatTips();
end 

MatchLoadingView._initChatRegion = function(self)
    self.m_chatTx:setReturnTypeEx(EditText.s_EX_RETURNTYPE_SEND );
    self.m_chatTx:setFilterSensitiveWordFlag(true);
    self.m_chatTx:setText("");
    self.m_chatTx:setHintText("输入内容...(限制20个字)", 173, 712, 109);
    self.m_chatTx:setMaxLength(20);
    self.m_chatHistoryView:setSize(System.getScreenScaleWidth() - self.m_leftBg.m_width);
    self.m_chatHistoryView.m_autoPositionChildren = true;
end 

MatchLoadingView._initChatTips = function(self)
    self.m_chatTips = self:findViewById(self.m_ctrls.chatTips);
    self:_createChatTipsTimer();
end

MatchLoadingView._createChatTipsTimer = function(self)
    self.m_chatTipsCount = 1;
    Schedule.getInstance():registerListener(self, self._updateChatTips, 15000, kAnimRepeat, nil, "chatTipsTimer");
end

MatchLoadingView._removeChatTipsTimer = function(self)
    Schedule.getInstance():unregisterListener(self, self._updateChatTips, "chatTipsTimer");
end

MatchLoadingView._updateChatTips = function(self)
    local str = (self.m_chatTipsCount % 2 == 0) and GameString.get("kTextChatTipsReport") or GameString.get("kTextChatTipsSilent");
    self.m_chatTips:setText(str);
    self.m_chatTipsCount = self.m_chatTipsCount + 1;
end

MatchLoadingView._getFeeInfo = function ( self )
    local matchInfo = self:_getMatchInfo();
    local feeInfo = "";
    if not matchInfo.fee or #matchInfo.fee ==0 then
        feeInfo = "免费报名";
        return feeInfo, true;
    end

    local size = #table.verify(matchInfo.fee);
    for k,v in pairs(table.verify(matchInfo.fee)) do
        local length = #v;
        for _ , fee in pairs(v) do
            feeInfo = feeInfo .. (fee.desc or "");
            if _ ~= length then
                feeInfo = feeInfo .. ","
            end
        end
        if k ~= size then
            feeInfo = feeInfo .. "或";
        end
    end

    return feeInfo;
end

-- 开始倒计时
MatchLoadingView._startWaitingTimer = function(self)
    self:_stopWaitingTimer();
    local matchInfo = self:_getMatchInfo();
    local stime = number.valueOf(matchInfo.stime);
    local seconds = os.difftime(stime, GameInfoIsolater.getInstance():getRightTimeWithServer());
    if seconds <= 0 then
        self.m_timeRichText:setText(string.format(self.m_timeStr, "00:00:00"), 1);
        self:_resetTimeViewSize();
        return;
    end

    self.m_waitingTimer = Clock.instance():schedule(function(dt)
            self:_onWaitingTimerEvent();
        end,1);
end

MatchLoadingView._onWaitingTimerEvent = function(self)
    local matchInfo = self:_getMatchInfo();
    local stime = number.valueOf(matchInfo.stime);
    local seconds = os.difftime(stime, GameInfoIsolater.getInstance():getRightTimeWithServer());
    local h = math.floor(seconds / 3600);
    local m = math.floor((seconds % 3600) / 60);
    local s = math.floor((seconds % 3600) % 60);

    h = h < 0 and 0 or h;
    m = m < 0 and 0 or m;
    s = s < 0 and 0 or s;

    if h == 0 and m == 0 and s == 2 then 
        local action = MatchMechineConfig.ACTION_ANIM_MATCH_START_COUNTDOWN;
        MatchMechine.getInstance():receiveAction(action);
    end 

    local str = string.format("%.2d:%.2d", m, s);
    self.m_timeRichText:setText(string.format(self.m_timeStr, str), 1);
    self:_resetTimeViewSize();

    if seconds <= 0 then
        self:_stopWaitingTimer();
        return;
    end

    seconds = seconds - 1;
    if number.valueOf(h) == 0 and number.valueOf(m) == 0 and number.valueOf(s) == 0 then
        self:_stopWaitingTimer();
    end
end

MatchLoadingView._stopWaitingTimer = function(self)
    if self.m_waitingTimer then 
        self.m_waitingTimer:cancel();
    end 
    self.m_waitingTimer = nil;
end
------------------------------------------------------------------------------------------------------
MatchLoadingView.showSlotMachine = function(self, matchType)
    local miniGameBtn = self:findViewById(self.m_ctrls.miniGameBtn);
    if SlotMachineLayerIsolater.getInstance():isOpenGameSwitch() then
        miniGameBtn:setVisible(true);
    else
        miniGameBtn:setVisible(false);
    end
end

MatchLoadingView.onSlotBtnClick = function(self)
    local matchInfo = self:_getMatchInfo();
    UBReport.getInstance():report(UBConfig.kMatchLoadingSlot, string.format("id_%s", (matchInfo and matchInfo.id) and matchInfo.id or ""));

    if not self.m_slotMachineLayer then
        self.m_slotMachineLayer = SlotMachineLayerIsolater.getInstance():getSlotMachineLayer();
        self.m_slotMachineLayer:setDelegate(self);
        self:addChild(self.m_slotMachineLayer);
        self.m_slotMachineLayer:setAlign(kAlignCenter);
    end

    SlotMachineLayerIsolater.getInstance():showSlotMachineLayer(self.m_slotMachineLayer);
    self:pushIntoSceneStateStack(self, self.onCloseSlotMachineLayer);
end

MatchLoadingView.onCloseSlotMachineLayer = function(self, isManualClose)
    if isManualClose then
        self:popFromSceneStateStack();
    end

    if self.m_slotMachineLayer then
        SlotMachineLayerIsolater.getInstance():hideSlotMachineLayer(self.m_slotMachineLayer);
    end
end

MatchLoadingView._onShowMoraGameLayer = function (self)
    if not self.m_moraGameLayout then
        self.m_moraGameLayout = new(require("hall/moraGame/moraGameLayout"))
        self:addChild(self.m_moraGameLayout);
        self.m_moraGameLayout:setAlign(kAlignCenter);
    end
    self.m_moraGameLayout:show();
end

MatchLoadingView.onMiniGameBtnClick = function(self)
    if MoraGameDataInterface.getInstance():isOpen() then
        UBReport.getInstance():report(UBConfig.kMoraGameAction1);
        self:_onShowMoraGameLayer();
    else
        Toast.getInstance():showText("敬请期待…",50,30,kAlignLeft,"",24,200,175,110)
    end
end

--------------------------------------------------------------------------------
MatchLoadingView.onExitMatchBtnClick = function(self)
    local matchInfo = self:_getMatchInfo();

    UBReport.getInstance():report(UBConfig.kMatchExit, string.format("id_%s", (matchInfo and matchInfo.id) and matchInfo.id or ""));
	-- 人满不允许退赛
    local matchType = number.valueOf(matchInfo.type);
	if matchType ~= GameConstant.FIXED_TIME_MATCH then
		if self.m_pepole == self.m_pepoleCount and self.m_pepole ~= 0 then
			Toast.getInstance():showText(kTextAtFullStrength,50,30,kAlignLeft,"",24,200,175,110);
--			return;
		end
	end

    self:removeInvitePopDialog();
 
    local action = MatchMechineConfig.ACTION_REQUEST_EXIT;
    MatchMechine.getInstance():receiveAction(action,nil,nil,"MatchLoadingView.onExitMatchBtnClick");
end
--------------------------------------------------------------------------------
-- 聊天信息
MatchLoadingView.onChatTxChange = function(self,p_string,flag)
    local txt = string.trim(self.m_chatTx:getText());
    if string.len(txt) > 0 then
        self.m_chatTx:setText(string.subUtfStr(txt, 1, 20));
        if flag == EditText.s_EX_CLOSE_DONE then
            self:onChatSendBtnClick();
        end
    end
end

-- 发送聊天内容
MatchLoadingView.onChatSendBtnClick = function(self)
    local matchInfo = self:_getMatchInfo();
    UBReport.getInstance():report(UBConfig.kMatchChatSend, string.format("id_%s", (matchInfo and matchInfo.id) and matchInfo.id or ""));
    local msg = self.m_chatTx:getText();
    if string.trim(msg) == "" then
        Toast.getInstance():showText("请输入聊天内容",50,30,kAlignLeft,"",24,200,175,110);
        return;
    end

    local scroller = self.m_chatTx:getScroller();
	if scroller then
		scroller:setOffset(0);
	end

	self.m_chatTx:setText("");
    self.m_chatTx:setHintText("输入内容...(限制20个字)", 173, 712, 109);

    self:_sendChatMsg(msg);
end

MatchLoadingView._sendChatMsg = function(self,msg)
    local flag = 2;
    local info = {};
    local userName = UserBaseInfoIsolater.getInstance():getNickname();
    local sex = UserBaseInfoIsolater.getInstance():getSex();
    local mid = UserBaseInfoIsolater.getInstance():getUserId();
    local cid = UserBaseInfoIsolater.getInstance():getUserCid();
    info.msgInfo = string.format("{\"userName\":\"%s\", \"sex\":\"%s\",\"mid\":\"%s\",\"cid\":\"%s\", \"msgInfo\":\"%s\", \"time\":\"%s\",\"sendFlag\":\"%s\"}",
        userName,sex,mid,cid, msg, os.date("%Y-%m-%d %H:%M:%S"), flag);

    SocketIsolater.getInstance():sendMsg(MatchSocketCmd.CLIENT_CMD_SEND_CHAT_MSG, info);
end 

MatchLoadingView._appendChatContent = function(self,info)
    if info.sendFlag == -1 or
        info.sendFlag == 1 then 
        self:_addSysChat(info);
    else 
        self:_addUserChat(info);
    end 
end

MatchLoadingView._addSysChat = function(self,info)
    info.userName = "系统";

    local MatchSysChatItem = require("games/common2/match/module/matchLoading/matchSysChatItem");
    local viewWidth = self.m_chatHistoryView:getSize();
    local chatItem = new(MatchSysChatItem,info,viewWidth);

    self.m_chatHistoryView:addChild(chatItem);

    local scroller = self.m_chatHistoryView:getScroller();
    if not scroller then
        return;
    end

    self.m_chatHistoryView:stop();
    self.m_chatHistoryView:gotoBottom();
end

MatchLoadingView._addUserChat = function(self,info)
    local MatchUserChatItem = require("games/common2/match/module/matchLoading/matchUserChatItem");
    local viewWidth = self.m_chatHistoryView:getSize();
    local chatItem = new(MatchUserChatItem,info,viewWidth);
    self.m_chatHistoryView:addChild(chatItem);

    local scroller = self.m_chatHistoryView:getScroller();
    if not scroller then
        return;
    end

    self.m_chatHistoryView:stop();
    self.m_chatHistoryView:gotoBottom();
end

MatchLoadingView._createAddAndReport = function(self)
    if not self.m_addAndReport then 
        local MatchAddAndReport = require("games/common2/match/module/matchLoading/matchAddAndReport");
        self.m_addAndReport = new(MatchAddAndReport);
        self:addChild(self.m_addAndReport);
    end 
end
-----------------------------------------------------------------------------
MatchLoadingView.onMatchChatItemSelected = function(self,data)
    self.m_chatShiled:setVisible(true);

    data = table.verify(data);

    local myCid = UserBaseInfoIsolater.getInstance():getUserCid();
    if table.isEmpty(data) or tonumber(myCid) ~= tonumber(data.cid) then 
        self:_createAddAndReport();
        self.m_addAndReport:refreshData(data);
        self.m_addAndReport:show();
    else 
        if self.m_addAndReport then 
            self.m_addAndReport:hide();
        end 
    end 
end

MatchLoadingView.onMatchChatItemCancleSelected = function(self)
    self.m_chatShiled:setVisible(false);

    if self.m_addAndReport then 
        self.m_addAndReport:hide();
    end
end

MatchLoadingView.onChatShiledTouch = function(self)
    EventDispatcher.getInstance():dispatch("match_cancle_select_chat_item_event");

    self:onMatchChatItemCancleSelected();
end
-----------------------------------------------------------------------------
-- 奖励信息
MatchLoadingView.setRewardList = function(self, dataList, iconList,awardcount)
    if not dataList or #dataList <= 0 then
        return;
    end
    
    self:initRewardView(dataList,awardcount);

    local prizes = {
        [1] = self:findViewById(self.m_ctrls.p1Img),
        [2] = self:findViewById(self.m_ctrls.p2Img),
        [3] = self:findViewById(self.m_ctrls.p3Img)
    };

    for i = 3, 1, -1 do
        if prizes[i] then
            prizes[i]:setVisible(dataList[i] and true or false);
            if dataList[i] then
                local str = string.replaceAll(dataList[i].desc or "", "#", " ");
                local r = string.split(str, " ");
                local rewardTxt = prizes[i]:getChildByName("rewardTxt");
                
                local startPos = 1;
                rewardTxt:setScrollBarWidth(0);
                if rewardTxt then            
                    local s = "";
                    for i = startPos, #r do
                        s = string.concat(s, r[i]);
                        if i < #r then
                            s = string.concat(s, "\n");
                        end
                    end
                    rewardTxt:setText(s);
                end

                if not table.isEmpty(iconList) and iconList[string.valueOf(i)] then
                    local url = iconList[string.valueOf(i)];
                    if not string.isEmpty(url) then
                        local icon = prizes[i]:getChildByName("icon");
                        ImageCache.getInstance():request(url, self, self._onImageDownload, icon);
                    end
                end

                table.remove(dataList, i);
            end
        end
    end
end

MatchLoadingView._onImageDownload = function(self, url, file, iconImg)
    if iconImg and not string.isEmpty(file) then
        iconImg:setFile(file);
    end
end

MatchLoadingView.initRewardView = function(self, rewardlist, awardcount)
    if table.isEmpty(rewardlist) then
        return;
    end
    awardcount = number.valueOf(awardcount);

    self.m_rewardlist = Copy(rewardlist);

    local rewardBtn = self:findViewById(self.s_controls.rewardBtn);
    local rewardBtnName = self:findViewById(self.s_controls.rewardBtnName);
    rewardBtnName:setText(string.format("前%s名有奖", awardcount));

    rewardBtn:setVisible(awardcount > 3);
end


-- 比赛奖励排名
MatchLoadingView.onRewardBtnClick = function(self)
    if table.isEmpty(self.m_rewardlist) then
        return;
    end 

    self.m_rewardView = new(MatchRewardView2, self.m_rewardlist);
    self.m_rewardView:setDelegate(self);
    local rewardBtn = self:findViewById(self.s_controls.rewardBtn);
    local x, y = rewardBtn:getAbsolutePos();
    local w, _ = rewardBtn:getSize();
    self.m_rewardView:setContentPos(x + w / 2, y);
    self.m_rewardView:showDialog();

    self:_showRewardBtnDownImage(true);
end

MatchLoadingView.closeRewardView = function(self)
    if self.m_rewardView and self.m_rewardView:isShowing() then
        self.m_rewardView:hideDialog();
    end

    self.m_rewardView = nil;
end


MatchLoadingView.onCloseRewardViewCallback = function(self)
    self:_showRewardBtnDownImage(false);
end


MatchLoadingView._showRewardBtnDownImage = function(self, isShowing)
    local file = isShowing and "games/common/match/match_wating/icon_down.png" or 
        "games/common/match/match_wating/icon_more.png";

    local rewardBtn = self:findViewById(self.s_controls.rewardBtn);
    if rewardBtn then
        local icon = rewardBtn:getChildByName("icon");
        if icon then
            icon:setFile(file);
        end
    end
end
----------------------------------邀请-------------------------------------------
MatchLoadingView.onInviteFriendBtnClick = function(self)
    self:createInvitePopDialog();
end

--[Comment]
-- @description  邀请好友
-- @author   C.MJ
-- @date        : 2014-12-12
MatchLoadingView.inviteFriendInGame = function(self)
    local matchInfo = self:_getMatchInfo();
    UBReport.getInstance():report(UBConfig.kMatchInvite, string.format("id_%s", (matchInfo and matchInfo.id) and matchInfo.id or ""));
    
    local x, y = self.m_inviteFriendBtn:getAbsolutePos();
    local w, _ = self.m_inviteFriendBtn:getSize();
    self.m_invitePop =  new(MatchInviteFriendsView);
    self.m_invitePop:setCallBack(self,self.onSelectInviteFriends)
    self.m_invitePop:setLevel(198);
    self.m_invitePop:setContentSize(w - 8, nil);
    self.m_invitePop:setContentPos(x + w/2, y);
    self.m_invitePop:showDialog();

    MatchIsolater.getInstance():requestFriendInviteList();
end

--[Comment]
-- @description : 获取到好友并更新好友列表
-- @author      : C.MJ
-- @date        : 2014-12-12
MatchLoadingView.onGetFriendInviteList = function(self, listData)
    if self.m_invitePop and self.m_invitePop:isShowing() then
        self.m_invitePop:setData(listData);
    end
end

--[Comment]
--选择好友
MatchLoadingView.onSelectInviteFriends = function(self, list)
    if table.isEmpty(list) then
        return ;
    end
    local matchInfo = self:_getMatchInfo();
    if table.isEmpty(matchInfo) then 
        return;
    end 
    ---发送邀请
    local param = {};
    local cidList = {};

    for k,v in pairs(list) do
        cidList[k] = {cid = v};
    end
    param.mid = UserBaseInfoIsolater.getInstance():getUserId();
    param.cid = UserBaseInfoIsolater.getInstance():getUserCid();
    param.sendtime = matchInfo.stime;
    param.invite_id     = matchInfo.id;
    param.match_name    = self.m_matchTitle;
    param.match_id = matchInfo.id;
    param.nick = UserBaseInfoIsolater.getInstance():getNickname();
    param.match_coin    = 0;
    param.match_ccsq    = 0;
    param.type = ImSdkConstants.fromInvite.MATCH;
    for k, v in pairs(table.verify(matchInfo.fee[1])) do
        if number.valueOf(v.type,-1) == 0 then
            param.match_coin   = number.valueOf(v.num,0);
        end
    end
    param.match_entyfee = self:_getFeeInfo();
    -- 邀请好友
    MatchIsolater.getInstance():requestInviteFriends(cidList,param);
end

MatchLoadingView.createInvitePopDialog = function(self)
    self.m_invitePopDialog = new(MatchInvitePopDialog);
    self.m_invitePopDialog:setDelegate(self);

    local x, y = self.m_inviteFriendBtn:getAbsolutePos();
    local w, _ = self.m_inviteFriendBtn:getSize();
    self.m_invitePopDialog:setContentPos(x + w / 2, y);

    self.m_invitePopDialog:showDialog();
end

MatchLoadingView.removeInvitePopDialog = function(self)    
    if self.m_invitePopDialog and self.m_invitePopDialog:isShowing() then
        self.m_invitePopDialog:hideDialog();
    end

    self.m_invitePopDialog = nil;

    if self.m_invitePop and self.m_invitePop:isShowing() then
        self.m_invitePop:hideDialog();
    end
    self.m_invitePop = nil;
end

-- MatchInvitePopDialog 回调 邀请游戏好友
MatchLoadingView.onInviteGameBtnClick = function(self)
    self:inviteFriendInGame();
end

-- MatchInvitePopDialog 回调 分享微信好友
MatchLoadingView.onInviteWeChatBtnClick = function(self)
    local data = table.verify(MatchIsolater.getInstance():getMatchData());
    local invitetype = number.valueOf(data.invitetype);
    local id = invitetype < 0 and data.configid or data.id;
    local idStr = tostring(id);
    local password = PasswordIsolater.getInstance():getPasswordByCode(PasswordIsolater.TYPE_MATCH, idStr);
    PasswordIsolater.getInstance():shareByWechat(PasswordIsolater.TYPE_MATCH, password, GameMatchHallConstants.eShareEntryType.BEFORE_MATCH, self.m_rewardlist);
end

MatchLoadingView._resetCountViewSize = function(self)
    local w, _ = self.m_countRichText:getSize();
    self.m_countView:setSize(w, nil);

    self:_resetInfoViewSize();
end

MatchLoadingView._resetTimeViewSize = function(self)
    local w, _ = self.m_timeRichText:getSize();
    self.m_timeView:setSize(w, nil);

    self:_resetInfoViewSize();
end

MatchLoadingView._resetInfoViewSize = function(self)
    local w = 0;

    if self.m_countView:getVisible() then
        local width, _ = self.m_countView:getSize();
        w = w + width;
    end

    if self.m_timeView:getVisible() then
        local width, _ = self.m_timeView:getSize();
        w = w + width;
    end

    self.m_infoView:setSize(w + 25, nil);
end

---------------------------------------------------------------------------------------------
MatchLoadingView._updateMatchBaseInfo = function(self,data)
    data = table.verify(data);
    self.m_data = self:_parseMatchData(data);
    self.m_matchRules = nil;

    self:_refreshMatchName(data.name);
    self:_refreshMatchChat(data);
    MatchIsolater.getInstance():requestMatchDetail(data.id); --请求比赛奖励

    self:_refreshMatchType(data.type or 0);    
    self:_refreshEntryFee();         
    self:_refreshPlayerCount(data.num or data.applynum or self.m_pepole, data.totalNum or data.requestnum or self.m_pepoleCount, 
        data.matchpartitions or self.m_matchpartitions);
end

MatchLoadingView._parseMatchData = function(self, data)
    data.id = number.valueOf(data.id);
    data.fee = data.fee or {};
    data.type = number.valueOf(data.type, -1);
    data.stime = number.valueOf(data.stime);

    return data;
end

MatchLoadingView._getMatchInfo = function(self)
    return table.verify(self.m_data);
end

--比赛名称
MatchLoadingView._refreshMatchName = function(self,name)
    local str = string.gsub(name or "", "#", "");
    self.m_title:setText(string.subUtfStrByCn(str, 1, 20, ""),1);

    self.m_matchTitle = str;
end

--报名费
MatchLoadingView._refreshEntryFee = function(self)   
    self.m_rightTips:setScrollBarWidth(0);

    local feeInfo, isFree = self:_getFeeInfo();
    local strEnd = isFree and "%s" or "报名费：%s\n(退赛返还全部报名费)";
    self.m_rightTips:setText(string.format(strEnd, feeInfo));
end

--比赛类型
MatchLoadingView._refreshMatchType = function (self,matchType)
    if matchType == -1 then
        return;
    end

    self.m_matchType = matchType;   
    
    if matchType == GameConstant.FIXED_TIME_MATCH then
        self.m_timeStr = "#cFFFFFF距离比赛开始：#c00FF96%s";
        self.m_countStr = "#cFFFFFF当前人数：#c00FF96%s";
        self.m_timeView:setVisible(true);
        self.m_countView:setVisible(true);
        self.m_progressView:setVisible(false);

        self:_refreshMatchWaitingTime();
    else
        self.m_countStr = "#cFFFFFF满#c00FF96%s#cFFFFFF人开赛";
        self.m_timeView:setVisible(false);
        self.m_countView:setVisible(false);
        self.m_progressView:setVisible(true);
    end

    self:showSlotMachine(matchType);   
end

--当比赛人数改变（报名 或 退赛）时 更新进度
--people 报名人数 ； peopleCount 开赛总人数
MatchLoadingView._refreshPlayerCount = function(self,people,peopleCount,matchpartitions)
    people = number.valueOf(people,1);
    peopleCount = number.valueOf(peopleCount,1);
    matchpartitions = number.valueOf(matchpartitions,1)
    
    self.m_pepole = people >= 1 and people or 1;
    self.m_pepoleCount = peopleCount >= 1 and peopleCount or 1;
    self.m_matchpartitions = matchpartitions >= 1 and matchpartitions or 1;

    if self.m_countView:getVisible() then 
        local str = self.m_countStr;
        if self.m_matchpartitions > 1 then
            str = string.format("%s#cFFFFFF(分#c00FF96%s#cFFFFFF场开赛)", self.m_countStr, self.m_matchpartitions);
        end

        self.m_countRichText:setText(string.format(str, self.m_pepole.."/"..self.m_pepoleCount));
        self:_resetCountViewSize();
    end 

    if self.m_progressView:getVisible() then
        self.m_progressText:setText(self.m_pepole.."/"..self.m_pepoleCount);

        local rate = self.m_pepole / self.m_pepoleCount;
        local w = self.m_progress.m_res:getWidth();
        self.m_progress:setSize(w * rate, nil);
    end
end

MatchLoadingView._refreshMatchWaitingTime = function(self)
    if self.m_matchType == GameConstant.FIXED_TIME_MATCH then 
        self:_startWaitingTimer();
    end 
end

MatchLoadingView._refreshMatchChat = function(self, matchData)
    self.m_chatHistoryView:stop();
    self.m_chatHistoryView:gotoTop();
    self.m_chatHistoryView:removeAllChildren();
    if self.m_matchTitle then 
        local data = {};
        data.sendFlag = 1;
        data.msgInfo = "欢迎您进入" .. self.m_matchTitle;
        self:_appendChatContent(data);
    end
    if not table.isEmpty(matchData) and matchData.id and MatchIsolater.getInstance():checkInvitationalById(matchData.id) then
        local data = {};
        data.sendFlag = 1;
        data.msgInfo = string.format("比赛编号 %s", matchData.id)
        self:_appendChatContent(data);
    end
    if self.m_matchRules then 
        local data = {};
        data.sendFlag = 1;
        data.msgInfo = self.m_matchRules;
        self:_appendChatContent(data);
    end 
end
-----------------------------------------------------------------------------------------
MatchLoadingView.updateMatchInfo = function(self,seat,uid,info,isFast)
    if isFast then 
        return;
    end 
    
    local data = MatchIsolater.getInstance():getMatchData();
    if data then 
        self:_updateMatchBaseInfo(Copy(data));

        if not data.fee then 
            MatchIsolater.getInstance():requestMatchBasicInfo(data.id);
        end 

        local temp = {};
        temp.mid = UserBaseInfoIsolater.getInstance():getUserId();
        temp.matchRoomId = data.id;
        SocketIsolater.getInstance():sendMsg(MatchSocketCmd.MATCH_DINGJU_MATCH_UPDATEPEOPLE_REQUEST, temp);
    end 
end

MatchLoadingView.updatePlayerCount = function(self,seat,uid,info,isFast)
    info = table.verify(info);
    self:_refreshPlayerCount(info.num, info.totalNum, info.matchpartitions);
end

MatchLoadingView.updateChatMsg = function(self,seat,uid,info,isFast)
    info = table.verify(info);
    self:_appendChatContent(info);
end

MatchLoadingView.hideDialogs = function(self)
    self:closeRewardView();
    self:removeInvitePopDialog();
    self:onCloseSlotMachineLayer();
    if self.m_moraGameLayout then
        self.m_moraGameLayout:hide();
    end

    if self.m_chatTx then
        self.m_chatTx:hideEditTextView();
    end
end

MatchLoadingView.hidLoadingView = function(self)
    self:hideDialogs();
end

MatchLoadingView.s_controlConfig =
{
    [MatchLoadingView.s_controls.title]            = {"maskView","title","titleText"};
    [MatchLoadingView.s_controls.infoView]         = {"maskView", "title", "infoView"};
    [MatchLoadingView.s_controls.timeView]         = {"maskView", "title", "infoView", "timeView"};
    [MatchLoadingView.s_controls.countView]        = {"maskView", "title", "infoView", "countView"};
    [MatchLoadingView.s_controls.slotBtn]          = {"slotBtn"};
    [MatchLoadingView.s_controls.exitMatchBtn]     = {"exitMatchBg", "exitMatchBtn"};

    [MatchLoadingView.s_controls.leftBg]           = {"bg","leftView","left"};  
    [MatchLoadingView.s_controls.leftView]         = {"bg","leftView"};
    [MatchLoadingView.s_controls.rightView]        = {"bg","rightView"};
    [MatchLoadingView.s_controls.rightTips]        = {"bg", "leftView", "left", "rightTips"};
    [MatchLoadingView.s_controls.p1Img]            = {"bg", "leftView", "left", "rewardView", "p1Img"};
    [MatchLoadingView.s_controls.p2Img]            = {"bg", "leftView", "left", "rewardView", "p2Img"};
    [MatchLoadingView.s_controls.p3Img]            = {"bg", "leftView", "left", "rewardView", "p3Img"};
    [MatchLoadingView.s_controls.rewardBtn]        = {"bg", "leftView", "left", "rewardBtn"};
    [MatchLoadingView.s_controls.rewardBtnName]    = {"bg", "leftView", "left", "rewardBtn","text"};
    [MatchLoadingView.s_controls.inviteFriendBtn]  = {"bg", "leftView", "btnView", "inviteFriendBtn"};
    [MatchLoadingView.s_controls.miniGameBtn]     = {"bg", "leftView", "btnView", "miniGameBtn"};

    [MatchLoadingView.s_controls.chatTx]           = {"bg", "rightView", "right", "chatBoxView", "chatBg", "chatTx"};
    [MatchLoadingView.s_controls.chatSendBtn]      = {"bg", "rightView", "right", "chatBoxView", "chatSendBtn"};
    [MatchLoadingView.s_controls.chatHistoryView]  = {"bg", "rightView", "right", "chatHistoryView"};  

    [MatchLoadingView.s_controls.progressView]     = {"maskView", "title", "infoView", "progressView"};
    [MatchLoadingView.s_controls.progress]         = {"maskView", "title", "infoView", "progressView", "progressBg", "progress"};
    [MatchLoadingView.s_controls.progressText]     = {"maskView", "title", "infoView", "progressView", "text"};

    [MatchLoadingView.s_controls.chatShiled]       = {"bg", "rightView", "right", "chatShiled"}; 
    [MatchLoadingView.s_controls.chatTips]         = {"bg", "rightView", "right", "topTipsView", "TextView"}; 
};
 

MatchLoadingView.s_controlFuncMap =
{
    [MatchLoadingView.s_controls.chatSendBtn]        = MatchLoadingView.onChatSendBtnClick;
    [MatchLoadingView.s_controls.chatTx]             = MatchLoadingView.onChatTxChange;

    [MatchLoadingView.s_controls.inviteFriendBtn]    = MatchLoadingView.onInviteFriendBtnClick;
    [MatchLoadingView.s_controls.exitMatchBtn]       = MatchLoadingView.onExitMatchBtnClick;
    [MatchLoadingView.s_controls.miniGameBtn]        = MatchLoadingView.onMiniGameBtnClick;
    
    [MatchLoadingView.s_controls.slotBtn]            = MatchLoadingView.onSlotBtnClick;
    [MatchLoadingView.s_controls.rewardBtn]          = MatchLoadingView.onRewardBtnClick;

    [MatchLoadingView.s_controls.chatShiled]         = MatchLoadingView.onChatShiledTouch;
    [MatchLoadingView.s_controls.chatHistoryView]    = MatchLoadingView.onChatShiledTouch;
};

MatchLoadingView.s_actionFuncMap = {
    [MatchMechineConfig.ACTION_SIGNUP_SUCCESS]       = "updateMatchInfo";
    [MatchMechineConfig.ACTION_GET_PLAYER_COUNT]     = "updatePlayerCount";
    [MatchMechineConfig.ACTION_GET_CHAT_MSG]         = "updateChatMsg";
    [MatchMechineConfig.ACTION_START]                = "hideDialogs";
};

MatchLoadingView.s_stateFuncMap = {
    [MatchMechineConfig.STATUS_NONE]                = "hidLoadingView";
    [MatchMechineConfig.STATUS_PLAYING]             = "hidLoadingView";
    [MatchMechineConfig.STATUS_WAITING]             = "hidLoadingView";
    [MatchMechineConfig.STATUS_FINISH]              = "hidLoadingView";
};

return MatchLoadingView;