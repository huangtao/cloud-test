--猜拳小游戏
local moraGameLayout = require(ViewPath .. "hall/moraGame/moraGameLayout");
local moraGame_pin = require("qnFiles/qnPlist/hall/moraGame_pin");
require("particle/particleMoney");
local money_pin_map_map = require("qnFiles/qnPlist/hall/money_pin_map");
local listItem = require("hall/moraGame/moraGameRewardDetailItem");
local MoraGameLayout = class(CommonGameLayer, false);

MoraGameLayout.eBetType = {
    UP = 1;
    CENTRE = 2;
    DOWN = 3;
}

MoraGameLayout.eMoraType = {
    STONE = 0;
    SCISSOR = 1;
    CLOTH = 2;
}

MoraGameLayout.defaultMoraMoveTime = 250;
MoraGameLayout.defaultMoraChangeTime = 120;
MoraGameLayout.defaultMoraChangeCount = 10;
MoraGameLayout.defaultMoraScaleTime = 150;

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

MoraGameLayout.s_controls = {
    shield = getIndex();
    regularPickUpBtn = getIndex();
    regularPickDownBtn = getIndex();
    regularBg = getIndex();
    autoIcon = getIndex();
    stoneBtn = getIndex();
    scissorBtn = getIndex();
    clothBtn = getIndex();
    betUpView = getIndex();
    betCentreView = getIndex();
    betDownView = getIndex();
    hisDetailListView = getIndex();
    closeBtn = getIndex();
    pcQuestion = getIndex();
    playerQuestion = getIndex();
    moraMove = getIndex();
    stone = getIndex();
    scissor = getIndex();
    cloth = getIndex();
    pcMoraIcon = getIndex();
    tipsTx = getIndex();
    notRecord = getIndex();
    textView1 = getIndex();
    textView2 = getIndex();
    textView3 = getIndex();
    autoPlayView = getIndex();
    bg = getIndex();
}

MoraGameLayout.ctor = function(self)
    super(self, moraGameLayout);
    self:setFillParent(true, true);
    self.m_ctrl = MoraGameLayout.s_controls;
    MoraGameDataInterface.getInstance():setObserver(self);
    self:__initView();
    self.m_shield:setEventDrag(self, function() end);
end

MoraGameLayout.dtor = function (self)
    MoraGameDataInterface.getInstance():clearObserver(self);
    self:__deleteAnim();
end

MoraGameLayout.__cleanUpAnim = function (self)
    self:__cleanUpPars();
    self:__cleanUpPcMoraScaleAnim();
    self:__cleanUpMoraScaleAnim();
    self:__cleanUpMoraAinm();
    self:__cleanUpTimer();
end

MoraGameLayout.__initView = function (self)
    self.m_shield = self:findViewById(self.m_ctrl.shield);
    self.m_regularPickUpBtn = self:findViewById(self.m_ctrl.regularPickUpBtn);
    self.m_regularPickDownBtn = self:findViewById(self.m_ctrl.regularPickDownBtn);
    self.m_regularBg = self:findViewById(self.m_ctrl.regularBg);
    self.m_autoIcon = self:findViewById(self.m_ctrl.autoIcon);
    self.m_stoneBtn = self:findViewById(self.m_ctrl.stoneBtn);
    self.m_scissorBtn = self:findViewById(self.m_ctrl.scissorBtn);
    self.m_clothBtn = self:findViewById(self.m_ctrl.clothBtn);
    self.m_betUpView = self:findViewById(self.m_ctrl.betUpView);
    self.m_betCentreView = self:findViewById(self.m_ctrl.betCentreView);
    self.m_betDownView = self:findViewById(self.m_ctrl.betDownView);
    self.m_hisDetailListView  = self:findViewById(self.m_ctrl.hisDetailListView);
    self.m_notRecord = self:findViewById(self.m_ctrl.notRecord);
    self.m_pcQuestion = self:findViewById(self.m_ctrl.pcQuestion);
    self.m_playerQuestion = self:findViewById(self.m_ctrl.playerQuestion);
    self.m_moraMove = self:findViewById(self.m_ctrl.moraMove);
    self.m_stone = self:findViewById(self.m_ctrl.stone);
    self.m_scissor = self:findViewById(self.m_ctrl.scissor);
    self.m_cloth = self:findViewById(self.m_ctrl.cloth);
    self.m_pcMoraIcon = self:findViewById(self.m_ctrl.pcMoraIcon);
    self.m_tipsTx = self:findViewById(self.m_ctrl.tipsTx);
    self.m_closeBtn = self:findViewById(self.m_ctrl.closeBtn);
    self.m_bg = self:findViewById(self.m_ctrl.bg);
    self.m_autoPlayView = self:findViewById(self.m_ctrl.autoPlayView);
end

MoraGameLayout.__init = function (self)
    local str1 = "石头赢剪刀，剪刀赢布，布赢石头";
    local str2 = "赢：给予押注金额同等的奖励\n平：没有奖励，押注金额退还\n输：没有奖励，压注金额不退还";
    local str3 = "连胜：\n二连胜，第二次胜利奖励多10%\n三连胜，第三次胜利奖励多20%\n依次类推";
    self:findViewById(self.m_ctrl.textView1):setText(str1);
    self:findViewById(self.m_ctrl.textView2):setText(str2);
    self:findViewById(self.m_ctrl.textView3):setText(str3);
    self.m_hisDetailListView.m_autoPositionChildren = true;
end

MoraGameLayout.__refreshRegularPickState = function (self, state)
    local x = state and 150 or 0;
    self.m_bg:setPos(x, nil)
    self.m_regularPickUpBtn:setVisible(not state);
    self.m_regularPickDownBtn:setVisible(state);
    self.m_regularBg:setVisible(state);
end

MoraGameLayout.__refreshRecordList = function (self, data)
   self.m_notRecord:setVisible(false);
   if table.isEmpty(data) then
        self.m_notRecord:setVisible(true);
   else
        self.m_hisDetailListView:removeAllChildren();
        for k, v in pairs(data) do
            self.m_hisDetailListView:addChild(new(listItem, v));
        end
        local scroller = self.m_hisDetailListView:getScroller();
        if not scroller then
            return;
        end

        self.m_hisDetailListView:stop();
        self.m_hisDetailListView:gotoBottom();
   end
end

MoraGameLayout.__refreshBetBtnState = function (self, state)
    local tmp = {self.m_betUpView, self.m_betCentreView, self.m_betDownView};
    MoraGameDataInterface.getInstance():setLastBet(state);
    for k, v in pairs(table.verify(tmp)) do
        local bet = v:getChildByName("bet");
        local text = v:getChildByName("text");
        local icon = v:getChildByName("icon");
        local isMoneyEnough  = MoraGameDataInterface.getInstance():isMoneyEnough(k);
        local img;
        if k == state then
            img = isMoneyEnough and moraGame_pin["bottomPourSelected.png"] or moraGame_pin["selectPurpleBtn.png"]
            bet:setFile(img); 
        else
            img = isMoneyEnough and moraGame_pin["bottomPourSelect.png"] or moraGame_pin["selectGrayBtn.png"]
            bet:setFile(img);
        end
        local r, g, b; 
        if isMoneyEnough then
            r, g, b = 255, 235, 12;
        else
            r, g, b = 134, 134, 134;
        end
        text:setText(text:getText(), nil, nil, r, g, b);
        icon:setTransparency(isMoneyEnough and 1 or 0.5);
        bet:setSize(bet.m_res:getWidth(),bet.m_res:getHeight());
    end
end

MoraGameLayout.__refreshBetConfig = function (self, data)
    if table.isEmpty(data) then
        return;
    end
    local tmp = {self.m_betUpView, self.m_betCentreView, self.m_betDownView};
    for k, v in pairs(table.verify(tmp)) do
        local text = v:getChildByName("text");
        local icon = v:getChildByName("icon");
        local betData = data[k];
        local img;
        if betData.moneytype == RechargeDataInterface.getInstance():getPropertySilverCoinID() then
            img = moraGame_pin["sicboSilver.png"];
        elseif betData.moneytype == RechargeDataInterface.getInstance():getPropertyGoldBarID() then
            img = moraGame_pin["sicboGoldBar.png"];
        end
        icon:setFile(img);
        icon:setSize(icon.m_res:getWidth(),icon.m_res:getHeight());
        text:setText(betData.bet);
    end
end

MoraGameLayout.onRequestConfigCallback = function (self, isSuccess, data)
    if isSuccess and not table.isEmpty(data) then
        self:__refreshBetConfig(data);
        self:__refreshBetBtnState(MoraGameDataInterface.getInstance():getLastBet());
    else
        self:showToast("获取猜拳押注配置失败");    
    end
end

MoraGameLayout.onRequestRecordCallback = function (self, isSuccess, data)
    if isSuccess then
        self:__refreshRecordList(data);
    else
        self:showToast("获取猜拳记录失败");
    end
end

MoraGameLayout.show = function(self)
    self:__init();
	self:setVisible(true);
    self.m_autoPlay = false;
    self.m_isPlaying = false;
    self:__setBtnClickStatus(true);
    self:__refreshRegularPickState(false);
    self.m_autoIcon:setFile(moraGame_pin["autoSelect.png"]);
    self:__cleanUpAnim();
    MoraGameDataInterface.getInstance():requestConfig();
    local data = MoraGameDataInterface.getInstance():getConfig();
    self:__refreshBetConfig(data);
    self:__refreshBetBtnState(MoraGameDataInterface.getInstance():getLastBet());
    self.m_moraChangeType = MoraGameLayout.eMoraType.STONE;
    self.m_moraMove:setVisible(false);
    self.m_tipsTx:getParent():setVisible(false);
    MoraGameDataInterface.getInstance():requestRecord();
    IPopDialogManager.getInstance():addPopDialog(self, 99, self.onCloseBtnClick, self);
end

MoraGameLayout.__deleteAnim = function (self)
    self:setVisible(false);
    self:__cleanUpAnim();
    IPopDialogManager.getInstance():removePopDialog(self);
end

MoraGameLayout.hide = function(self)
    self:__deleteAnim();
end

MoraGameLayout.onCloseBtnClick = function (self)
	self:__deleteAnim();
end

MoraGameLayout.onAutoPlayViewClick = function (self, finger_action)
    if finger_action ~= kFingerUp then
        return;
    end
    self.m_autoPlay = not self.m_autoPlay;
    local img = self.m_autoPlay and moraGame_pin["autoSelected.png"] or moraGame_pin["autoSelect.png"];
    self.m_autoIcon:setFile(img);
    if self.m_autoPlay and not self.m_isPlaying then
        UBReport.getInstance():report(UBConfig.kMoraGameAction3);
        self:__playMoraChangeAnim();
    end
end

MoraGameLayout.__showError = function (self)
    if not kLoginDataInterface:getIsLoginSuccess() then
		self:showToast(GameString.get("netWorkTimeout"));
	end
end

MoraGameLayout.__moraMoveAnim = function (self, object)
    local lastBet = MoraGameDataInterface.getInstance():getLastBet();
    if MoraGameDataInterface.getInstance():isMoneyEnough(lastBet,true) and kLoginDataInterface:getIsLoginSuccess() then
        self.m_isPlaying = true;
        self:__setBtnClickStatus(false);
        self.m_moraMove:setVisible(true);
        self.m_closeBtn:setPickable(false);
        local sx, sy = -148 + self.m_moraChangeType*142, 207;
        local ex, ey = self.m_playerQuestion:getPos();
        self.m_moraMove:setPos(sx, sy);
        self.m_moraMove:setFile(moraGame_pin[string.format("mora_%d.png", self.m_moraChangeType)]);
        self.m_moraMove:restoreSize();
        self.m_moraMoveAnim = self.m_moraMove:addPropTranslate(0, kAnimNormal, MoraGameLayout.defaultMoraMoveTime, 0, 0, ex-sx, 0, ey-sy);
        self.m_moraMoveAnim:setEvent(self, function(self)
            self.m_moraMove:removeProp(0);
            self:__cleanUpMoraAinm();
            self:__playMoraChangeAnim();
        end)
    else
        self:__showError();
    end
end

MoraGameLayout.__playMoraChangeAnim = function (self)
    local lastBet = MoraGameDataInterface.getInstance():getLastBet();
    if MoraGameDataInterface.getInstance():isMoneyEnough(lastBet,true) and kLoginDataInterface:getIsLoginSuccess() then
        local configData = MoraGameDataInterface.getInstance():getConfig();
        MoraGameDataInterface.getInstance():requestReward(configData[lastBet].bet, self.m_moraChangeType);
        self.m_isPlaying = true;
        self:__setBtnClickStatus(false);
        self.m_moraMove:setVisible(true);
        self.m_closeBtn:setPickable(false);
        self.m_moraMove:setPos(self.m_playerQuestion:getPos());
        self.m_moraChangeCurCount = 0;
        self.m_moraChangeType = self.m_autoPlay and math.random(0,2) or self.m_moraChangeType;
        self.m_moraChangeLastType = self.m_moraChangeType;
        self.m_pcMoraChangeLastType = math.random(0,2);
        self.m_playerQuestion:setVisible(false);
        self.m_pcQuestion:setVisible(false);
        self.m_pcMoraIcon:setVisible(true);
        self:__startMoraChangeAnim();
    else
        self:__showError();
        if self.m_autoPlay then
            self:onAutoPlayViewClick(kFingerUp);
        end
    end
end

MoraGameLayout.__getMoraChangeImage = function (self)
    local playType,pcType;
    while true do
        playType = math.random(0,2);
        if playType ~= self.m_moraChangeLastType then
            self.m_moraChangeLastType = playType;
            break;
        end
    end
    while true do
        pcType = math.random(0,2);
        if pcType ~= self.m_pcMoraChangeLastType then
            self.m_pcMoraChangeLastType = pcType;
            break;
        end
    end
    local rewardData;
    if self.m_moraChangeCurCount >= MoraGameLayout.defaultMoraChangeCount then
        rewardData = MoraGameDataInterface.getInstance():getRewardData();
        MoraGameDataInterface.getInstance():requestRecord();
        local tips = "";
        if table.isEmpty(rewardData) then
            playType = self.m_moraChangeType;
            tips = "获取猜拳结果失败！"
        else
            playType, pcType = rewardData.gesture, rewardData.computer;
            self.m_moraChangeLastType, self.m_pcMoraChangeLastType = playType, pcType;
            if rewardData.iswin == 1 then
                local name = rewardData.moneytype == 0 and "银币" or"金条";
			    tips = "恭喜你赢得了"..rewardData.rewardMoney..name;
                UBReport.getInstance():report(UBConfig.kMoraGameAction4);
                self:__startPars();
		    elseif rewardData.iswin == 2 then
			    tips = "差一点就赢了，再来一次吧！";
                UBReport.getInstance():report(UBConfig.kMoraGameAction5);
            elseif rewardData.iswin == 3 then
                tips = "没有赢得奖励，下一次运气会更佳。";
                UBReport.getInstance():report(UBConfig.kMoraGameAction6);
		    end 
        end
        self.m_tipsTx:setText(tips, 0);
        self.m_tipsTx:getParent():setVisible(true);
        MoraGameDataInterface.getInstance():setRewardData();
    elseif self.m_moraChangeCurCount == MoraGameLayout.defaultMoraChangeCount-1 then
        rewardData = MoraGameDataInterface.getInstance():getRewardData();
        if not table.isEmpty (rewardData) then
            playType = self:__getMoraIamgeType(rewardData.gesture);
            pcType = self:__getMoraIamgeType(rewardData.computer);
        end
    end
    return playType, pcType;
end

MoraGameLayout.__getMoraIamgeType = function (self, type)
    local tmp;
     while true do
        tmp = math.random(0,2);
        if tmp ~= type then
            break;
        end
    end
    return tmp;
end 

MoraGameLayout.__startPars =function(self)
	self:__cleanUpPars();
	self.m_pars = ParticleSystem.getInstance():create(money_pin_map_map,ParticleMoney,0,0,nil,kParticleTypeBlast,(num or 20),{["h"] = System.getScreenHeight()/2,["w"] = System.getScreenWidth();["rotation"]=4;["scale"]=1;["maxIndex"]=7;});
	self:addChild(self.m_pars);
	self.m_pars:resume();
	kEffectPlayer:play(Effects.AudioDropMoneyShort);
end

MoraGameLayout.__cleanUpPars =function (self)
	kEffectPlayer:stop(Effects.AudioDropMoneyShort);
	delete(self.m_pars);
	self.m_pars = nil;
end

MoraGameLayout.__startMoraChangeAnim = function (self)
    self.m_moraChangeAnim = new(AnimInt, kAnimRepeat, 0, 1, MoraGameLayout.defaultMoraChangeTime, 0); 
    local count = 0;
    self.m_moraChangeAnim:setEvent(self, function (self)
        if self.m_moraChangeCurCount  + 3 >= MoraGameLayout.defaultMoraChangeCount then
            count = count + 1 ;
            if count  <= 2 then
                return;
            end
        end
        count = 0;
        self.m_moraChangeCurCount = self.m_moraChangeCurCount + 1;
        if self.m_moraChangeCurCount <= MoraGameLayout.defaultMoraChangeCount then
            local playType, pcType = self:__getMoraChangeImage();
            self.m_moraMove:setFile(moraGame_pin[string.format("mora_%d.png", playType)]);
            self.m_pcMoraIcon:setFile(moraGame_pin[string.format("mora_%d.png", pcType)]);
            self.m_moraMove:restoreSize();
            self.m_pcMoraIcon:restoreSize();
        else
            self:onMoraChangeCallBack();
        end
    end)
end

MoraGameLayout.__cleanUpMoraAinm = function (self)
    if self.m_moraMoveAnim then
        delete(self.m_moraMoveAnim);
        self.m_moraMoveAnim = nil;
    end
    if self.m_moraChangeAnim then
        delete(self.m_moraChangeAnim);
        self.m_moraChangeAnim = nil;
    end
end

MoraGameLayout.__cleanUpMoraScaleAnim = function (self)
    if self.m_playerQuestionAnim then
        delete(self.m_playerQuestionAnim);
        self.m_playerQuestionAnim = nil;
    end
    if self.m_moraScaleAnim then
        delete(self.m_moraScaleAnim);
        self.m_moraScaleAnim = nil;
    end
end

MoraGameLayout.__cleanUpPcMoraScaleAnim = function (self)
    if self.m_pcMoraScaleAnim then
        delete(self.m_pcMoraScaleAnim);
        self.m_pcMoraScaleAnim = nil;
    end
    if self.m_pcQuestionAnim then
        delete(self.m_pcQuestionAnim);
        self.m_pcQuestionAnim = nil;
    end
end

MoraGameLayout.onMoraChangeCallBack = function (self)
    self:__cleanUpMoraAinm();
    self.m_playerQuestion:setVisible(true);
    self.m_playerQuestion:setFile(moraGame_pin[string.format("mora_%d.png", self.m_moraChangeLastType)]);
    self.m_playerQuestion:restoreSize();

    self.m_pcQuestion:setVisible(true);
    self.m_pcQuestion:setFile(moraGame_pin[string.format("mora_%d.png", self.m_pcMoraChangeLastType)]);
    self.m_pcQuestion:restoreSize();

    self.m_moraScaleAnim = self.m_moraMove:addPropScale(1, kAnimLoop, MoraGameLayout.defaultMoraScaleTime, 45, 1, 1.3, 1, 1.3, kCenterDrawing); 
    self.m_playerQuestionAnim = self.m_playerQuestion:addPropScale(2, kAnimLoop, MoraGameLayout.defaultMoraScaleTime, 0, 1, 1.3, 1, 1.3, kCenterDrawing); 
    self.m_moraScaleAnim:setEvent(self, function ()
        self.m_moraMove:setVisible(false);
        self.m_moraMove:removeProp(1);
        self.m_playerQuestion:removeProp(2);
        self:__cleanUpMoraScaleAnim();
    end)

    self.m_pcMoraScaleAnim = self.m_pcMoraIcon:addPropScale(3, kAnimLoop, MoraGameLayout.defaultMoraScaleTime, 45, 1, 1.3, 1, 1.3, kCenterDrawing); 
    self.m_pcQuestionAnim = self.m_pcQuestion:addPropScale(4, kAnimLoop, MoraGameLayout.defaultMoraScaleTime, 0, 1, 1.3, 1, 1.3, kCenterDrawing); 
    self.m_pcMoraScaleAnim:setEvent(self, function ()
        self.m_pcMoraIcon:setVisible(false);
        self.m_pcMoraIcon:removeProp(3);
        self.m_pcQuestion:removeProp(4);
        self:__cleanUpPcMoraScaleAnim();  
        self:__moraTimerAnim(); 
    end)
end

MoraGameLayout.__cleanUpTimer = function (self)
    if self.m_timer then
        delete(self.m_timer);
        self.m_timer = nil;
    end
end

MoraGameLayout.__moraTimerAnim = function (self)
    self:__cleanUpPars();
    self.m_closeBtn:setPickable(true);
    self.m_timer = AnimFactory.createAnimInt(kAnimNormal, 0, 1 ,1000, 0);
    self.m_timer:setEvent(self, function(self)
        self:__cleanUpTimer();
        self:onTimerFinishCallback();
    end);
end

MoraGameLayout.onTimerFinishCallback = function (self)
    self:__cleanUpAnim();
    self.m_tipsTx:getParent():setVisible(false);
    self.m_pcQuestion:setFile(moraGame_pin["questionIcon.png"]);
    self.m_pcQuestion:restoreSize();
    self.m_playerQuestion:setFile(moraGame_pin["questionIcon.png"]);
    self.m_playerQuestion:restoreSize();
    self.m_isPlaying = false;
    self:__setBtnClickStatus(true);
    self:__refreshBetBtnState(MoraGameDataInterface.getInstance():getLastBet());
    if self.m_autoPlay then
        self:__playMoraChangeAnim();
    end
end

MoraGameLayout.__setBtnClickStatus = function (self, isClick)
    self.m_clothBtn:setPickable(isClick);
    self.m_scissorBtn:setPickable(isClick);
    self.m_stoneBtn:setPickable(isClick);
    if not self.m_autoPlay then
        self.m_autoPlayView:setPickable(isClick);
    end
end

MoraGameLayout.onStoneBtnClick = function (self)
    if self.m_isPlaying then
       return; 
    end
    UBReport.getInstance():report(UBConfig.kMoraGameAction10);
    self.m_moraChangeType = MoraGameLayout.eMoraType.STONE;
    self:__moraMoveAnim(self.m_stone);
end

MoraGameLayout.onScissorBtnClick = function (self)
    if self.m_isPlaying then
       return; 
    end
    UBReport.getInstance():report(UBConfig.kMoraGameAction11);
    self.m_moraChangeType = MoraGameLayout.eMoraType.SCISSOR;
    self:__moraMoveAnim(self.m_scissor);
end

MoraGameLayout.onClothBtnClick = function (self)
    if self.m_isPlaying then
        return;
    end
    UBReport.getInstance():report(UBConfig.kMoraGameAction12);
    self.m_moraChangeType = MoraGameLayout.eMoraType.CLOTH;
    self:__moraMoveAnim(self.m_cloth);
end

MoraGameLayout.onBetUpViewClick = function (self, finger_action)
    if finger_action ~= kFingerUp then
        return;
    end
    
    if not MoraGameDataInterface.getInstance():isMoneyEnough(MoraGameLayout.eBetType.UP,true) then
        return;
    end
    UBReport.getInstance():report(UBConfig.kMoraGameAction7);
    self:__refreshBetBtnState(MoraGameLayout.eBetType.UP);
end

MoraGameLayout.onBetCentreViewClick = function (self, finger_action)
    if finger_action ~= kFingerUp then
        return;
    end

    if not MoraGameDataInterface.getInstance():isMoneyEnough(MoraGameLayout.eBetType.CENTRE,true) then
        return;
    end
    UBReport.getInstance():report(UBConfig.kMoraGameAction8);
    self:__refreshBetBtnState(MoraGameLayout.eBetType.CENTRE);
end

MoraGameLayout.onBetDownViewClick = function (self, finger_action)
    if finger_action ~= kFingerUp then
        return;
    end

    if not MoraGameDataInterface.getInstance():isMoneyEnough(MoraGameLayout.eBetType.DOWN,true) then
        return;
    end
    UBReport.getInstance():report(UBConfig.kMoraGameAction9);
    self:__refreshBetBtnState(MoraGameLayout.eBetType.DOWN);
end

MoraGameLayout.onRegularPickUpBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kMoraGameAction2);
    self:__refreshRegularPickState(true);
end

MoraGameLayout.onRegularPickDownBtnClick = function (self)
     self:__refreshRegularPickState(false);
end

MoraGameLayout.onShieldClick = function (self, finger_action)
    if finger_action == kFingerUp then
        if self.m_regularPickDownBtn:getVisible() then
            self:__refreshRegularPickState(false);
        end
    end
end

MoraGameLayout.showToast = function (self, text)
    Toast.setDefaultDisplayTime(200);
    Toast.getInstance():showText(text, 50, 30, kAliginCenter, "", 30, 250, 210, 70);
    Toast.setDefaultDisplayTime();
end

MoraGameLayout.s_controlConfig = {
    [MoraGameLayout.s_controls.shield] = {"shield"};
    [MoraGameLayout.s_controls.bg] = {"view","bg"};
    [MoraGameLayout.s_controls.regularPickUpBtn] = {"view","bg","regularPickUpBtn"};
    [MoraGameLayout.s_controls.regularPickDownBtn] = {"view","bg","regularPickDownBtn"};
    [MoraGameLayout.s_controls.regularBg] = {"view","regularBg"};
    [MoraGameLayout.s_controls.autoIcon] = {"view","bg","autoIcon"};
    [MoraGameLayout.s_controls.stoneBtn] = {"view","bg","stoneBtn"};
    [MoraGameLayout.s_controls.scissorBtn] = {"view","bg","scissorBtn"};
    [MoraGameLayout.s_controls.clothBtn] = {"view","bg","clothBtn"};
    [MoraGameLayout.s_controls.betUpView] = {"view","bg","betUpView"};
    [MoraGameLayout.s_controls.betCentreView] = {"view","bg","betCentreView"};
    [MoraGameLayout.s_controls.betDownView] = {"view","bg","betDownView"};
    [MoraGameLayout.s_controls.hisDetailListView] = {"view","bg","rightDetailView","hisDetailListView"};
    [MoraGameLayout.s_controls.closeBtn] = {"view","bg","closeBtn"};
    [MoraGameLayout.s_controls.moraMove] = {"view","bg","moraMove"};
    [MoraGameLayout.s_controls.stone] = {"view","bg","stoneBtn","stone"};
    [MoraGameLayout.s_controls.scissor] = {"view","bg","scissorBtn","scissor"};
    [MoraGameLayout.s_controls.cloth] = {"view","bg","clothBtn","cloth"};
    [MoraGameLayout.s_controls.pcQuestion] = {"view","bg","pcQuestion"};
    [MoraGameLayout.s_controls.playerQuestion] = {"view","bg","playerQuestion"};
    [MoraGameLayout.s_controls.pcMoraIcon] = {"view","bg","pcMoraIcon"};
    [MoraGameLayout.s_controls.tipsTx] = {"view","bg","tipsBg","tipsTx"};
    [MoraGameLayout.s_controls.notRecord] = {"view","bg","rightDetailView","notRecord"};
    [MoraGameLayout.s_controls.textView1] = {"view","regularBg","textView1"};
    [MoraGameLayout.s_controls.textView2] = {"view","regularBg","textView2"};
    [MoraGameLayout.s_controls.textView3] = {"view","regularBg","textView3"};
    [MoraGameLayout.s_controls.autoPlayView] = {"view","bg","autoPlayView"};
    
}

MoraGameLayout.s_controlFuncMap = {
    [MoraGameLayout.s_controls.closeBtn] = MoraGameLayout.onCloseBtnClick;
    [MoraGameLayout.s_controls.regularPickUpBtn] = MoraGameLayout.onRegularPickUpBtnClick;
    [MoraGameLayout.s_controls.regularPickDownBtn] = MoraGameLayout.onRegularPickDownBtnClick;
    [MoraGameLayout.s_controls.stoneBtn] = MoraGameLayout.onStoneBtnClick;
    [MoraGameLayout.s_controls.scissorBtn] = MoraGameLayout.onScissorBtnClick;
    [MoraGameLayout.s_controls.clothBtn] = MoraGameLayout.onClothBtnClick;
    [MoraGameLayout.s_controls.autoPlayView] = MoraGameLayout.onAutoPlayViewClick;
    [MoraGameLayout.s_controls.betUpView] = MoraGameLayout.onBetUpViewClick;
    [MoraGameLayout.s_controls.betCentreView] = MoraGameLayout.onBetCentreViewClick;
    [MoraGameLayout.s_controls.betDownView] = MoraGameLayout.onBetDownViewClick;
    [MoraGameLayout.s_controls.shield] = MoraGameLayout.onShieldClick;
}

return MoraGameLayout;