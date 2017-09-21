local exitFreeGameView = require(HallViewPath.."main/exitFreeGameView");

local ExitFreeGameDialog = class(IBaseDialog, false);

local _index = 0;
function getIndex()
    _index = _index + 1;
    return _index;
end
ExitFreeGameDialog.s_controls = {
    maskView            = getIndex();
    bg                  = getIndex();
    btnContinue         = getIndex();
    btnExit             = getIndex();
    btnClose            = getIndex();
    nextDayNode         = getIndex();
    todayNode           = getIndex();
    todayNodeTitle      = getIndex();
}

ExitFreeGameDialog.ctor = function ( self, token, level, exitObj, onExitFunc, onContinueFunc, onCloseFunc )
    super(self, exitFreeGameView, token, level);
    self.m_ctrls = ExitFreeGameDialog.s_controls;
    self.m_obj = exitObj;
    self.m_exitFunc = onExitFunc;
    self.m_continueFunc = onContinueFunc;
    self.m_closeFunc = onCloseFunc;

    TaskRewardDataInterface.getInstance():setObserver(self);

    self:_initViews();
    self:_refreshTips();
    if System.getPlatform() ~= kPlatformIOS then 
        self:_refreshTomorrowTips();
    else 
        self:_refreshSignInInfo();
    end
end

ExitFreeGameDialog.dtor = function ( self )
    TaskRewardDataInterface.getInstance():clearObserver(self);
end

ExitFreeGameDialog.resume = function ( self )

end

ExitFreeGameDialog.pause = function ( self )

end

ExitFreeGameDialog._initViews = function ( self )
    self.m_todayNode = self:findViewById(self.m_ctrls.todayNode);    
    self.m_todayNodeTitle = self:findViewById(self.m_ctrls.todayNodeTitle);
    self.m_nextDayNode = self:findViewById(self.m_ctrls.nextDayNode);
    self.m_bg = self:findViewById(self.m_ctrls.bg);

    self.m_bg:setEventDrag(self, self._onEmptyFunc);
end

ExitFreeGameDialog._refreshTips = function ( self )
    self:_initNodes();
    local rewardCount = self:_getDayTaskReward();
    self:updateTodayTips(rewardCount > 0);
    if rewardCount > 0 then 
        self:_showDayTaskTips(rewardCount);
    else 
        local todayWin = self:_getTodayGold();
        if todayWin > 0 then 
            self:_showWinTips(todayWin);
        elseif todayWin == 0 then 
            self:_showDrawTips(todayWin);
        else 
            self:_showLostTips(todayWin);
        end
    end
end

ExitFreeGameDialog.updateTodayTips = function ( self, flag )
    -- body
    if System.getPlatform() ~= kPlatformIOS then
        if flag then 
            self.m_todayNodeTitle:setText("今日还可领取银币：");
        else 
            self.m_todayNodeTitle:setText("本次登录战况：");
        end
    end    
end

ExitFreeGameDialog._initNodes = function ( self )
    -- body
    delete(self.m_dayTaskTips);
    self.m_dayTaskTips = nil;
    delete(self.m_lostTipsNode);
    self.m_lostTipsNode = nil;
    delete(self.m_winTipsNode);
    self.m_winTipsNode = nil;
    delete(self.m_drawTipsNode);
    self.m_drawTipsNode = nil;
end
-- 显示每日任务可领取银币数
ExitFreeGameDialog._showDayTaskTips = function ( self, reward )
    -- body
    self.m_dayTaskTips = new(Node);
    local txtTaskTips = new(Text, "每日任务", 50, 50, kAlignLeft, nil, 28, 143, 92, 31);
    local imgIcon = new(Image, "isolater/gold.png");
    local txtReward = new(Text, string.concat(ToolKit.skipMoneyEx2(reward), "银币"), 50, 50, kAlignLeft, nil, 28, 255, 138, 0);
    local btnDoTask = new(Button, "isolater/btns/btn_green_164x89_l25_r25_t25_b25.png", nil, nil, nil, 25, 25, 25, 25);
    btnDoTask:setSize(158, 80);
    local txtDoTask = new(Text, "前往领取", 50, 50, kAlignCenter, nil, 24, 255, 255, 255);
    txtDoTask:setAlign(kAlignCenter);
    btnDoTask:addChild(txtDoTask);
    btnDoTask:setOnClick(self, self._onBtnDoTaskClick);

    txtTaskTips:setPos(50, nil);
    local w, h = txtTaskTips:getSize();
    local x, y = txtTaskTips:getPos();
    imgIcon:setPos(x + w + 20, y);
    
    w, h = imgIcon:getSize();
    x, y = imgIcon:getPos();
    txtReward:setPos(x + w, y);

    w, h = txtReward:getSize();
    x, y = txtReward:getPos();
    btnDoTask:setPos(x + w + 50, y - 10);

    self.m_dayTaskTips:addChild(txtTaskTips);
    self.m_dayTaskTips:addChild(imgIcon);
    self.m_dayTaskTips:addChild(txtReward);
    self.m_dayTaskTips:addChild(btnDoTask);

    self.m_dayTaskTips:setAlign(kAlignLeft);
    self.m_todayNode:addChild(self.m_dayTaskTips);
end
-- 去每日任务
ExitFreeGameDialog._onBtnDoTaskClick = function ( self )
    -- body
	self:hide();
    IBaseDialog.remove("TaskRewardDialog");
    IBaseDialog.pushDialog(new(TaskRewardDialog, TaskRewardDialog.TAB_TASK));
end
-- 获取今日盈余
ExitFreeGameDialog._getTodayGold = function ( self ) 
    -- body
    local totalMoneyDic = new(Dict,"TOTALMONEY");
    totalMoneyDic:load();
    totalMoney=totalMoneyDic:getDouble("totalMoney",0);
    local todayGold = (kUserInfoData:getTotalMoney() - totalMoney) or 0;
    return todayGold;
end
-- 获取每日任务可获得的总奖励
ExitFreeGameDialog._getDayTaskReward = function ( self )
    -- body
    local rewardCount = 0;
    local dayTaskList = TaskRewardDataInterface.getInstance():getDayTaskList();
    if #table.verify(dayTaskList) <= 0 then 
        return 0;
    end
    for k, v in ipairs(table.verify(dayTaskList)) do 
        if v.reward_type == 0 and (v.status == 0 or v.status == 1) then 
            rewardCount = rewardCount + v.reward;
        end
    end
    return rewardCount;
end
-- 显示今日赢钱提示
ExitFreeGameDialog._showWinTips = function ( self, todayWin )
    -- body
    self.m_winTipsNode = new(Node);
    local imgLaugh = new(Image, "hall/exitGameDialog/face_laugh.png");
    local txtWinTips = new(Text, "赢了", 25, 50, kAlignLeft, nil, 28, 143, 92, 31);
    local imgIcon = new(Image, "isolater/gold.png");
    local txtCoin = new(Text, string.concat(ToolKit.skipMoneyEx2(todayWin), "银币"), 50, 50, kAlignLeft, nil, 28, 255, 138, 0);
    local txtTips = new(Text, "何不趁胜追击", 50, 50, kAlignLeft, nil, 28, 143, 92, 31);

    imgLaugh:setPos(50, y);
    local w, h = imgLaugh:getSize();
    local x, y = imgLaugh:getPos();
    txtWinTips:setPos(x + w + 10, y);
    
    w, h = txtWinTips:getSize();
    x, y = txtWinTips:getPos();
    imgIcon:setPos(x + w + 10, y);

    w, h = imgIcon:getSize();
    x, y = imgIcon:getPos();
    txtCoin:setPos(x + w, y);

    w, h = txtCoin:getSize();
    x, y = txtCoin:getPos();
    txtTips:setPos(x + w + 20, y);


    self.m_winTipsNode:addChild(imgLaugh);
    self.m_winTipsNode:addChild(txtWinTips);
    self.m_winTipsNode:addChild(imgIcon);
    self.m_winTipsNode:addChild(txtCoin);
    self.m_winTipsNode:addChild(txtTips);

    self.m_winTipsNode:setAlign(kAlignLeft);
    self.m_todayNode:addChild(self.m_winTipsNode);
end
-- 显示今日输钱提示
ExitFreeGameDialog._showLostTips = function ( self, todayWin )
    -- body
    self.m_lostTipsNode = new(Node);
    local imgCry = new(Image, "hall/exitGameDialog/face_cry.png");
    local txtLostTips = new(Text, "输了", 25, 50, kAlignLeft, nil, 28, 143, 92, 31);
    local imgIcon = new(Image, "isolater/gold.png");
    local txtCoin = new(Text, string.concat(ToolKit.skipMoneyEx2(-todayWin), "银币"), 50, 50, kAlignLeft, nil, 28, 255, 138, 0);
    local imgAngry = new(Image, "hall/exitGameDialog/face_angry.png");
    local txtTips = new(Text, "是我就再战300回合", 50, 50, kAlignLeft, nil, 28, 143, 92, 31);

    imgCry:setPos(50, nil);
    local w, h = imgCry:getSize();
    local x, y = imgCry:getPos();
    txtLostTips:setPos(x + w + 10, y);

    w, h = txtLostTips:getSize();
    x, y = txtLostTips:getPos();
    imgIcon:setPos(x + w + 10, y);
    
    w, h = imgIcon:getSize();
    x, y = imgIcon:getPos();
    txtCoin:setPos(x + w, y);

    w, h = txtCoin:getSize();
    x, y = txtCoin:getPos();
    imgAngry:setPos(x + w + 20, y);

    w, h = imgAngry:getSize();
    x, y = imgAngry:getPos();
    txtTips:setPos(x + w + 10, y);

    self.m_lostTipsNode:addChild(txtLostTips);
    self.m_lostTipsNode:addChild(imgIcon);
    self.m_lostTipsNode:addChild(txtCoin);
    self.m_lostTipsNode:addChild(imgCry);
    self.m_lostTipsNode:addChild(txtTips);
    self.m_lostTipsNode:addChild(imgAngry);

    self.m_lostTipsNode:setAlign(kAlignLeft);
    self.m_todayNode:addChild(self.m_lostTipsNode);
end
-- 显示平局
ExitFreeGameDialog._showDrawTips = function ( self, todayWin )
    -- body
    self.m_drawTipsNode = new(Node);
    local txtLostTips = new(Text, "输赢", 25, 50, kAlignLeft, nil, 28, 143, 92, 31);
    local imgIcon = new(Image, "isolater/gold.png");
    local txtCoin = new(Text, string.concat(ToolKit.skipMoneyEx2(todayWin), "银币"), 50, 50, kAlignLeft, nil, 28, 255, 138, 0);
    local txtTips = new(Text, "赢钱再走喽！", 50, 50, kAlignLeft, nil, 28, 143, 92, 31);

    txtLostTips:setPos(50, y);
    local w, h = txtLostTips:getSize();
    local x, y = txtLostTips:getPos();
    imgIcon:setPos(x + w + 10, y);
    
    w, h = imgIcon:getSize();
    x, y = imgIcon:getPos();
    txtCoin:setPos(x + w, y);

    w, h = txtCoin:getSize();
    x, y = txtCoin:getPos();
    txtTips:setPos(x + w + 20, y);

    self.m_drawTipsNode:addChild(txtLostTips);
    self.m_drawTipsNode:addChild(imgIcon);
    self.m_drawTipsNode:addChild(txtCoin);
    self.m_drawTipsNode:addChild(txtTips);

    self.m_drawTipsNode:setAlign(kAlignLeft);
    self.m_todayNode:addChild(self.m_drawTipsNode);
end

ExitFreeGameDialog._refreshTomorrowTips = function ( self )
    -- body
    local tomorrowTipsNode = new(Node);
    tomorrowTipsNode:setAlign(kAlignLeft);

    local txtTips = UIFactory.createTextView("每天都有10元、2元话费赛等你来哦！\n10分钟一场，根本停不下来！", 28, 540, 80, kAlignTopLeft, 143, 92, 31, nil);
    txtTips:setAlign(kAlignLeft);
    txtTips:setPos(60, 25);
    tomorrowTipsNode:addChild(txtTips);

    local w, h = txtTips:getSize();
    local w1, h1 = self.m_nextDayNode:getSize();
    tomorrowTipsNode:setSize(w, nil);
    tomorrowTipsNode:setPos((w1 - w) / 2, 0);
    self.m_nextDayNode:addChild(tomorrowTipsNode);
end

-- 明日签到预告
ExitFreeGameDialog._refreshSignInInfo = function ( self )
    local tomorrowInfos = TaskRewardDataInterface.getInstance():getTomorrowSigninConfig();
    if not tomorrowInfos then
        return;
    else
        local tomorrowRewardNode = new(Node);
        tomorrowRewardNode:setAlign(kAlignLeft);
        local text1 = new(Text, "签到可获得", 50, 50, kAlignLeft, nil, 28, 143, 92, 31);
        text1:setAlign(kAlignLeft);

        local img = new(Image, "isolater/gold.png");
        img:setAlign(kAlignLeft);
        img:setSize(80, 55);
        local text2 = nil;
    	if tomorrowInfos.num and tomorrowInfos.type then
            local rewardType = tomorrowInfos.type;
            local rewardNum = tomorrowInfos.num;

            if rewardType == 0 then
    			--奖励为银币
                img:setFile("isolater/gold.png");
                text2 = new(Text, string.concat(tomorrowInfos.num, "银币"), 50, 50, kAlignLeft, nil, 28, 143, 92, 31);
    		elseif rewardType == 2 then
    			--奖励为砖石
                img:setFile("isolater/small_diamond.png");
                text2 = new(Text, string.concat(tomorrowInfos.num, "钻石"), 50, 50, kAlignLeft, nil, 28, 143, 92, 31);
    		else
                local rewardTypeName = "道具奖励";
                local itemName = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeId(rewardType)).item_name or rewardTypeName;
                local function onImageDownload(obj, url, fileName)
                    img:setFile(fileName);
                end
                ImageCache.getInstance():request(tomorrowInfos.icon, self, onImageDownload);
                text2 = new(Text, string.concat(tomorrowInfos.num, itemName), 50, 50, kAlignLeft, nil, 28, 143, 92, 31);
    		end
    	else
            delete(img);
            img = nil;
            text2 = new(Text, "更多奖励哦！" , 50, 50, kAlignLeft, nil, 28, 143, 92, 31);
    	end
    	text2:setAlign(kAlignLeft);
    	tomorrowRewardNode:addChild(text1);
    	tomorrowRewardNode:addChild(text2);

    	text1:setPos(0, nil);
    	local x, y = text1:getPos();
    	local w, h = text1:getSize();
    	local nodeWidth = 0;
    	nodeWidth = nodeWidth + w;
        if img then
    		tomorrowRewardNode:addChild(img);
    		img:setPos(x + w, y);
    		x, y = img:getPos();
    		w, h = img:getSize();
    		nodeWidth = nodeWidth + w;
    		text2:setPos(x + w - 5, y);
    		w, h = text2:getSize();
    		nodeWidth = nodeWidth + w;
        else
    		text2:setPos(x + w, y);
    		w, h = text2:getSize();
    		nodeWidth = nodeWidth + w;
        end
    	tomorrowRewardNode:setSize(nodeWidth, nil);
        local w1, h1 = self.m_nextDayNode:getSize();
        tomorrowRewardNode:setPos((w1 - nodeWidth) / 2, 0);
        self.m_nextDayNode:addChild(tomorrowRewardNode);
    end
end

ExitFreeGameDialog._onBtnContinueClick = function ( self )
    UBReport.getInstance():report(UBConfig.HideExitGameDialog);
    if self.m_obj and self.m_exitFunc then
        self.m_continueFunc(self.m_obj);
    end
    ExitFreeGameDialog.hide();
end

ExitFreeGameDialog._onBtnExitClick = function ( self )
    UBReport.getInstance():report(UBConfig.ConfirmExitGame)
    if self.m_obj and self.m_exitFunc then
        self.m_exitFunc(self.m_obj);
    end
end

ExitFreeGameDialog._onBtnCloseClick = function ( self )
    if self.m_obj and self.m_closeFunc then
        self.m_closeFunc(self.m_obj);
    end
    ExitFreeGameDialog.hide();
end

ExitFreeGameDialog._onMaskViewClick = function ( self )
    ExitFreeGameDialog.hide();
end

ExitFreeGameDialog._onEmptyFunc = function ( self )

end

ExitFreeGameDialog.s_controlConfig = {
    [ExitFreeGameDialog.s_controls.maskView]                = {"shiled"};
    [ExitFreeGameDialog.s_controls.bg]                      = {"bg"};
    [ExitFreeGameDialog.s_controls.btnContinue]             = {"bg", "continueBtn"};
    [ExitFreeGameDialog.s_controls.btnExit]                 = {"bg", "exitBtn"};
    [ExitFreeGameDialog.s_controls.btnClose]                = {"bg", "closeBtn"};
    [ExitFreeGameDialog.s_controls.nextDayNode]             = {"bg", "nextDayNode"};
    [ExitFreeGameDialog.s_controls.todayNode]               = {"bg", "todayNode"};
    [ExitFreeGameDialog.s_controls.todayNodeTitle]          = {"bg", "todayNode", "Text1"};
}

ExitFreeGameDialog.s_controlFuncMap = {
    [ExitFreeGameDialog.s_controls.maskView]                = ExitFreeGameDialog._onMaskViewClick;
    [ExitFreeGameDialog.s_controls.bg]                      = ExitFreeGameDialog._onEmptyFunc;
    [ExitFreeGameDialog.s_controls.btnContinue]             = ExitFreeGameDialog._onBtnContinueClick;
    [ExitFreeGameDialog.s_controls.btnExit]                 = ExitFreeGameDialog._onBtnExitClick;
    [ExitFreeGameDialog.s_controls.btnClose]                = ExitFreeGameDialog._onBtnCloseClick;
}

return ExitFreeGameDialog;
