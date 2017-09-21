require("common/commonScene");
require("animation/animManager");
require("ui/toast");
require("uiex/urlImage");
require("ui/adapter");
require("ui/button");

local hall_pin_map = require("qnFiles/qnPlist/hall/hall_pin");
local roomLevels_pin_map = require("qnFiles/qnPlist/hall/roomLevels_pin");

require("common/IBaseDialog");

require("hall/main/widget/hallGameListView");
require("hall/bankrupt/data/bankruptInterface");
require("hall/suggestion/data/suggestionDataInterface");

require("hall/main/data/hallDataInterface")
require("hall/task/taskRewardDialog");

require("uilibs/userMoneyItem");
require("hall/animation/animHallVip");
require("hall/animation/animSnow");
require("hall/community/imSdk/imSdkHelper");

require("hall/backpack/data/backpackDataInterface");
require("hall/floatBall/floatBall");

require("hall/animation/vipAnimManager");

require("hall/gameData/flagCommon/flagCommonDataInterface")
require("hall/animation/getRewardAnimManager");

HallScene = class(CommonScene);

local h_index = 0;
local getIndex = function(self)
    h_index = h_index + 1;
    return h_index;
end

HallScene.s_controls = {
    layerView = getIndex();
    bottomBtnsView = getIndex();


    reLoginBtn = getIndex();
    loadingView = getIndex();
    loadingIcon = getIndex();

    --切服
    changeServerView = getIndex();
    testServer = getIndex();
    prepublishServer = getIndex();
    onlineServer = getIndex();
    hallServer = getIndex();

    bg = getIndex();

	--710新增加
    Button_match = getIndex();
	bottomLeftView = getIndex();
	View_info = getIndex();
	View_head = getIndex();
	Button_head = getIndex();
	Text_name = getIndex();
	Image_vip_flag = getIndex();
    Button_gold = getIndex();
    Button_goldBar = getIndex();
	Text_gold = getIndex();
	Text_goldBar = getIndex();
    Image_tittle = getIndex();
    Image_bottom_bg = getIndex();
}

HallScene.s_cmds = 
{
    loginSuccess = getIndex();
    loginErr = getIndex();
    playLoading = getIndex();
    showGameListView = getIndex();
    showGameRoomLevelView = getIndex();
    onGetCoreInitInfo = getIndex();
    showAnnouncementView = getIndex();
    showNotice = getIndex();
    updateUserInfo = getIndex();
    showBindingGuidelines = getIndex();
    onPushBaseDialog = getIndex();
    onRoomLevelViewBackToHall = getIndex();
    showRegisterAccountDialog = getIndex();
    showAnnouncementStopServer = getIndex();
    refreshUnReadMessageNum = getIndex();
};


HallScene.ctor = function(self, viewConfig, controller)
    self.m_ctrl = HallScene.s_controls;
    self.m_tempdialog = nil;
    self.m_currentMoneyId = UserPropertyIsolater.getInstance():getPropertySilverCoinID();
    self:addObservers();
    self:__init();
end


HallScene.resume = function(self)
    CommonScene.resume(self);
    self.m_bottomBtnsLayer:updateBtnStatus();
    self:resetGameListView();
    self:__playAnimSnow();
    self:showBindingGuidelines();
    self:updateView();
    self.m_isPaused = false;
    FloatBall.checkIsShowFloatBall();
end

HallScene.pause = function(self)
    CommonScene.pause(self);
    self:__stopAnimSnow();
    self.m_isPaused = true;
end

HallScene.dtor = function(self)
    delete(self.m_tempdialog);
    self:removeObservers();
    self:__stopAnimSnow();

    HallDataInterface.getInstance():setMoreGamesToRoomLevelListFlag(false);

    IBaseDialog.hideAll();
end

HallScene.addObservers = function(self)
    kUserInfoData:setObserver(self);
    BackpackDataInterface.getInstance():setObserver(self);
    AgencyDataInterface.getInstance():setObserver(self);
end

HallScene.removeObservers = function(self)
    kUserInfoData:clearObserver(self);
    BackpackDataInterface.getInstance():clearObserver(self);
    AgencyDataInterface.getInstance():clearObserver(self);
end

HallScene.showAnnouncementStopServer = function(self, data)
    self:onPushBaseDialog( new(require("hall/announcement/widget/announcementStopServerPop"), data) );
end

HallScene.__init = function(self)
    self:findViewById(self.m_ctrl.Image_tittle):restoreSize();
    self:__initBg();
    self:__initBroadcastLayer();
    self:__initBottomBtnsLayer();
    self:updateUserInfo();
    self:showServerChange();
end

HallScene.__initBg = function(self)
    HolidaysBgDataInterface.getInstance():showImg(HolidaysBgDataInterface.ImgType.Bg, self:findViewById(self.m_ctrl.bg))
    --得到模糊节点
    local __bg = self:findViewById(self.m_ctrl.bg);
    local __template = self:findViewById(self.m_ctrl.Image_bottom_bg);
    local __width,__height = __template:getSize(); 
    local __width2,__height2 = __bg:getSize(); 

    if self.m_blurNode then
        local blur = require("libEffect/shaders/blur");
        blur.removeEffect(self.m_blurNode);
        __bg:removeChild(self.m_blurNode,true);
        self.m_blurNode = nil;
    end
    if __bg:getWidget() then
        self.m_blurNode = ShaderManager.getPartBlurNode(__bg,10,1,0,__height2 -__height,__width,__height);
    end
end

HallScene.__initBroadcastLayer = function(self)
    self.m_broadcastLayer = new(require("hall/broadcast/broadcastLayer"));
    self.m_broadcastLayer:setDelegate(self);
    self.m_broadcastLayer:setPos(0,0);
    self.m_broadcastLayer:setFillParent(true, true);
    self:findViewById(self.m_ctrl.layerView):addChild(self.m_broadcastLayer);
end

HallScene.__initBottomBtnsLayer = function(self)
    local HallBottomBtns = require("hall/main/widget/hallBottomBtns");
    self.m_bottomBtnsLayer = new(HallBottomBtns);
    self.m_bottomBtnsLayer:setDelegate(self);
    self.m_bottomBtnsLayer:setLevel(2);
    self:findViewById(self.m_ctrl.bottomBtnsView):addChild(self.m_bottomBtnsLayer);
    self.m_bottomBtnsLayer:show(GameType.HALL);
end


HallScene.onGetAgencyConfigCallback = function (self,isSuccess)
    if isSuccess and self.m_bottomBtnsLayer then
       self.m_bottomBtnsLayer:refreshAgentState();
    end
end

HallScene.setBroadcastVisible = function(self,isVisible)
    if self.m_broadcastLayer then
        self.m_broadcastLayer:setVisible(isVisible);
    end
end

HallScene.scanningBtnClick = function (self)
    
end

HallScene.isNetWorkConnect = function(self)
    return self:requestCtrlCmd(HallController.s_cmds.isNetWorkConnect);
end

HallScene.showGameListView = function(self, isOnlyRefresh)
    if isOnlyRefresh and HallDataInterface.getInstance():isGameRoomLevelViewShowing() then
        return;
    end
   
    if self.m_gameRoomLevelView then
        self.m_gameRoomLevelView:hide();
    end

    self:__initBg();

    if not self.m_gameListView then
        self.m_gameListView = new(HallGameListView);
        self:findViewById(self.m_ctrl.layerView):addChild(self.m_gameListView);
        self.m_gameListView:setDelegate(self);
        self.m_gameListView:setFillParent(true, true);
    end

    HallDataInterface.getInstance():setGameRoomLevelViewShowing(false);
    self.m_gameListView:show( kGameManager:getGamePageList() );
    self.m_bottomBtnsLayer:setIsInRoomLevel(false);
    self:__isInlevelRoom(false);
    self.m_bottomBtnsLayer:show(GameType.HALL);
end

HallScene.resetGameListView = function(self)
    if self.m_gameListView then
        self.m_gameListView:reset();
    end
end

HallScene.showGameRoomLevelView = function(self, gameId, levelList, whichTab, autoEnterLevelInfo)
    if self.m_gameListView then
        self.m_gameListView:hide();
    end
    self:__initBg();

    if not self.m_gameRoomLevelView then
        local HallGameRoomLevelView = require("hall/main/widget/hallGameRoomLevelView");
        self.m_gameRoomLevelView = new(HallGameRoomLevelView, self:findViewById(self.m_ctrl.bg));
        self.m_gameRoomLevelView:setDelegate(self);
        self:findViewById(self.m_ctrl.layerView):addChild(self.m_gameRoomLevelView);
        self.m_gameRoomLevelView:setFillParent(true, true);
    end

    HallDataInterface.getInstance():setGameRoomLevelViewShowing(true);
    kGameManager:setCurGameId(gameId);
    kGameManager:setCurGameLevelTab(whichTab or 1);
    kGameManager:setCurRoomLevelId(0);
    
    self.m_gameRoomLevelView:show(gameId, levelList, whichTab, autoEnterLevelInfo);
    self.m_bottomBtnsLayer:setIsInRoomLevel(true);
    self:__isInlevelRoom(true);
end

--进去选场见面需要隐藏一些东西
HallScene.__isInlevelRoom = function(self,p_bool)
    self:findViewById(self.m_ctrl.Image_tittle):setVisible(not p_bool);
    self:findViewById(self.m_ctrl.Button_match):setVisible(not p_bool);
end

HallScene.onRoomLevelViewBackToHall = function(self)
    if HallDataInterface.getInstance():getMoreGamesToRoomLevelListFlag() then
        HallDataInterface.getInstance():setGameRoomLevelViewShowing(false);
        HallDataInterface.getInstance():setMoreGamesToRoomLevelListFlag(false);
        self:onPushToOtherState(States.MoreGames,nil,true);
        return;
    end

    self:showGameListView();
end

HallScene.onGetCoreInitInfo = function(self)
	self:__playAnimSnow();
    self:showServerChange();

    if not self.m_isPaused then
        FloatBall.checkIsShowFloatBall();
    end
end

HallScene.showAnnouncementView = function(self, data)
    if table.isEmpty(data) or string.isEmpty(data.content) then
        --self:onAnnoucementPopClose();
        return;
    end

    local is_html = number.valueOf(data.is_html)
    if is_html == 0 then
        local dialog = new(require("hall/announcement/widget/annoucementPop"));
        self:onPushBaseDialog(dialog);
        dialog:setOnCloseCallBack(self,self.onAnnoucementPopClose);
        local t = {};
        t.firstWord = data.title;
        t.content = data.content;
        dialog:show(t);
    elseif is_html == 1 then

        if self.m_tempdialog then
            delete(self.m_tempdialog);
            self.m_tempdialog = nil
        end

        local dialog = new(require("hall/announcement/widget/annoucementHtmlPop"), data,true);

        local __func = function()
            self.m_tempdialog = nil;
            self:onPushBaseDialog(dialog);
            dialog:setOnCloseCallBack(self, self.onAnnoucementPopClose)
        end
        dialog:setWebOkFunc(__func);
        self.m_tempdialog = dialog;
    elseif is_html == 2 then
        local dialog = new(require("hall/announcement/widget/annoucementImagePop"), data)
        self:onPushBaseDialog(dialog);
        dialog:setOnCloseCallBack(self, self.onAnnoucementPopClose)
    end
end

HallScene.onAnnoucementPopClose = function(self)
    AnnounceDataInterface.getInstance():clear();
    IBaseDialog.hide();
end

HallScene.showBindingGuidelines = function(self)
    if BindingGuidelinesDataInterface.getInstance():check() and not kBankruptDataInterface:isMineBankrupt() then
        self:onPushBaseDialog(new(require("hall/login/widget/registerBindingGuide"),LoginConstants.eBindingGuideType.MORE_COIN_OR_GOLD));
        BindingGuidelinesDataInterface.getInstance():updateDisplayTime();
    end
end


HallScene.onPushBaseDialog = function(self, dialog)
    if not self.m_isPaused then
        IBaseDialog.pushDialog(dialog);
    else
        delete(dialog);
        dialog = nil;
    end
end

-----------------------------登录相关---------------------------
HallScene.playLoading = function(self)
    self:__setLoginViewStatus(self.m_ctrl.loadingView);
end

HallScene.loginSuccess = function(self)
    self:__setLoginViewStatus(self.m_ctrl.View_info);
    self:updateUserInfo();
    self.m_bottomBtnsLayer:updateBtnStatus();

    self:updateView();

    if not AnnounceDataInterface.getInstance():isShowed() then
        AnnounceDataInterface.getInstance():getAnnounceShowData();
    end
end

HallScene.updateView = function(self)
    if self.m_gameListView then
        self.m_gameListView:updateTopView();
    end
end

HallScene.loginErr = function(self, msg)
    self:__setLoginViewStatus(self.m_ctrl.reLoginBtn);
    
    if not string.isEmpty(msg) then
        self:showNotice(msg);
    end
end

HallScene.__setLoginViewStatus = function(self, showingView)
    local ctrls = {self.m_ctrl.View_info, self.m_ctrl.loadingView, self.m_ctrl.reLoginBtn};
    for k, v in ipairs(ctrls) do
        self:findViewById(v):setVisible( v == showingView );
    end
  
    local loadingIcon = self:findViewById(self.m_ctrl.loadingIcon);
    if showingView == self.m_ctrl.loadingView then
        if loadingIcon:checkAddProp(0) then
            loadingIcon:addPropRotate(0,kAnimRepeat,1440,0,0,360,kCenterDrawing);
        end
    else
        if not loadingIcon:checkAddProp(0) then
            loadingIcon:removeProp(0);
        end        
    end
end

HallScene.onReloginBtnClick = function(self)
    self:requestCtrlCmd(HallController.s_cmds.onReLogin);
end

HallScene.onHeadBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallHead);
    self:onPushToOtherState(States.UserInfo,true);
end

-- 顶部条按钮回调
HallScene.onMatchBtnClick = function(self)
    self:onPushToOtherState(States.GameMatchHall);
end

HallScene.onCommunityBtnClick = function(self)
    self:onPushToOtherState(States.Community);
end

------------------------------------call back--------------------
HallScene.refreshUserProperty = function(self,propertyType,curNum,lastNum)
    self:__onUpdateMoney();
end

HallScene.refreshUserIdentity = function(self,curIdentity,lastIdentity)
    self:__onUpdateVipHead();
end
------------------------------------delegate--------------------
HallScene.onPushToOtherState = function(self, state, isPopState, ...)
    self:requestCtrlCmd(HallController.s_cmds.onPushToOtherState, state, isPopState, ...);
end

HallScene.onAddToScene = function(self,p_wndName,...)
    self:requestCtrlCmd(HallController.s_cmds.onAddToScene, p_wndName, ...);
end

HallScene.onToDayTask = function(self, isClick)
    self:requestCtrlCmd(HallController.s_cmds.onToDayTask, isClick);
end

------------------------------
HallScene.updateUserInfo = function(self)
    self:__onUpdateVipHead();
    self:__onUpdateUserHead();
    self:__onUpdateMoney();

    ImageCache.getInstance():request(kUserInfoData:getAvatar_b(), self, self.__onHeadDownloaded);

    local nickName = kUserInfoData:getNickname();
    self:findViewById(self.m_ctrl.Text_name):setText(ToolKit.subString(nickName, 12),1 );

    self:__onUpdateVipPos();
end

HallScene.__onHeadDownloaded = function(self,url,fileName)
    self:__onUpdateUserHead(fileName);
end

HallScene.__onUpdateMoney = function(self)

    local function __refreshMoneyById(p_text,p_id)
        local __moneyNum = kUserInfoData:getMoneyById(p_id);
        local __decimals = (__moneyNum >= 1000000) and  0 or 2;   --超过百万不显示小数部分
        __moneyStr = ToolKit.skipMoneyEx5(__moneyNum,__decimals);
        p_text:setText(__moneyStr);
    end

    local goldText = self:findViewById(self.m_ctrl.Text_gold);
    local goldBarText = self:findViewById(self.m_ctrl.Text_goldBar);

    __refreshMoneyById(goldText, UserPropertyIsolater.getInstance():getPropertySilverCoinID() );
    __refreshMoneyById(goldBarText, UserPropertyIsolater.getInstance():getPropertyGoldBarID() );
end

HallScene.__onUpdateVipHead = function(self)
    local isVip = kUserInfoData:getIsVip();
    self:findViewById(self.m_ctrl.Image_vip_flag):setVisible(isVip);
end

HallScene.__onUpdateVipPos = function(self)
    local __x,__ = self:findViewById(self.m_ctrl.Text_name):getPos();
    local __w,__ = self:findViewById(self.m_ctrl.Text_name):getSize();
    local __xVip,__ = self:findViewById(self.m_ctrl.Image_vip_flag):getPos();
    local offsetX = 5;
    if __x + __w + offsetX>  __xVip then
        self:findViewById(self.m_ctrl.Image_vip_flag):setPos(__x + __w + offsetX);
    end
end

HallScene.__onUpdateUserHead = function(self, file)
    local sex = kUserInfoData:getSex();
    local headImg = string.isEmpty(file) and kUserInfoData:getHallHeadBySex(sex) or file;

    local headBtn = self:findViewById(self.m_ctrl.Button_head);
    headBtn:setFile(headImg);
end

HallScene.__playAnimSnow = function(self)
	
    self:__stopAnimSnow();
	
	if not (HallDataInterface:getInstance():isSnow()) then  --是否播放下雪动画由服务器控制
		return;
	end
	
    local sw = System.getScreenScaleWidth();
    local sh = System.getScreenScaleHeight();
    self.m_animSnow = new(AnimSnow);
    self.m_snowView = self.m_animSnow:play(10, sw, sh, 40);
    self:addChild(self.m_snowView);
end

HallScene.__stopAnimSnow = function(self)
    delete(self.m_animSnow);
    self.m_animSnow = nil;

    if self.m_snowView then
        local parent = self.m_snowView:getParent();
        if parent then
            parent:removeChild(self.m_snowView);
        end
        delete(self.m_snowView);
        self.m_snowView = nil;
    end
end

HallScene.showNotice = function(self, msg)
    Toast.getInstance():showTextView(msg, width or 640, height or 60,kAlignCenter,"",30,200,175,115);
end

HallScene.showMoneyViewById = function(self, p_moneyId)
    self.m_currentMoneyId = p_moneyId;
end


--返回当前moneyID
HallScene.getSafeBoxByMoneyId = function(self)
    self:onPushToOtherState(States.SafeBox,true, self.m_currentMoneyId);
end

HallScene.refreshUnReadMessageNum = function(self)
    if self.m_bottomBtnsLayer then
        self.m_bottomBtnsLayer:refreshFriendRedStatus();
    end
end


---------切服-------------
HallScene.showServerChange = function(self)
    self:findViewById(self.m_ctrl.changeServerView):setVisible(_DEBUG);
    self:__refreshServerBtnsStatus();
end

HallScene.onChangeToTestServer = function(self)
    self:onChangeServerBtnClick(1);
end

HallScene.onChangeToPrepublishServer = function(self)
    self:onChangeServerBtnClick(2);
end

HallScene.onChangeToOnlineServer = function(self)
    self:onChangeServerBtnClick(3);
end

HallScene.onChangeToHallServer = function(self)
    self:onChangeServerBtnClick(4);
end

HallScene.__refreshServerBtnsStatus = function(self)
    local btns = {self.m_ctrl.testServer, self.m_ctrl.prepublishServer, self.m_ctrl.onlineServer, self.m_ctrl.hallServer};
    for k,v in ipairs(btns) do
        if k == NETWORK_TYPE then
            self:findViewById(v):setColor(128,128,128);
        else
            self:findViewById(v):setColor(255,255,255);
        end
    end
end

HallScene.onChangeServerBtnClick = function(self, netWorkType)
    Log.v("HallScene.onChangeServerBtnClick");

    ServerConfig.getInstance():clearServerConfig();

    OnlineSocketManager.getInstance():closeSocketSync();
    NETWORK_TYPE = netWorkType or 1;
    set_network_type(NETWORK_TYPE);
    ImSdkHelper.releaseInstance();

    mainHandle_restartVM();
end

HallScene.onSafeBoxBtnClick = function (self)
    --友盟统计
    UBReport.getInstance():report(UBConfig.kHallBottomSafeBox, "child");
    StateMachine.getInstance():pushState(States.SafeBox,nil,true);
end

HallScene.onButton_goldBtnClick = function (self)
    --友盟统计
    UBReport.getInstance():report(UBConfig.kHallBottomMall, "child");
    RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabMoneyId() );
    StateMachine.getInstance():pushState(States.Recharge);
end

HallScene.onButton_goldBarBtnClick = function (self)
    --友盟统计
    UBReport.getInstance():report(UBConfig.kHallBottomMall, "child");
    RechargeDataInterface.getInstance():setToRechargeMode( RechargeDataInterface.getInstance():getTabCrystalId() );
    StateMachine.getInstance():pushState(States.Recharge);
end

HallScene.onButton_matchBtnClick = function(self)
    UBReport.getInstance():report(UBConfig.kHallTopTabMatch);
    self:onMatchBtnClick();
end

HallScene.onAgentBtnClick = function (self)
    UBReport.getInstance():report(UBConfig.kHallAgentEntry);
    self:requestCtrlCmd(HallController.s_cmds.onToAgent);
end

HallScene.showRegisterAccountDialog = function (self)
    UBReport.getInstance():report(UBConfig.kHallUserInfoRegistAccount)
    local RegisterAccountDialog = require("hall/login/widget/registerAccountDialog");
	RegisterAccountDialog.show();
end

HallScene.s_controlConfig = {
    [HallScene.s_controls.layerView] = {"layerView"};
    [HallScene.s_controls.bottomBtnsView] = {"bottomBtnsView"},  


    [HallScene.s_controls.reLoginBtn] = {"bottomBtnsView","bottomLeftView", "reLoginBtn"};
    [HallScene.s_controls.loadingView] = {"bottomBtnsView","bottomLeftView", "loadingView"};
    [HallScene.s_controls.loadingIcon] = {"bottomBtnsView","bottomLeftView", "loadingView", "loadingIcon"};

    [HallScene.s_controls.changeServerView] = {"changeServerView"};
    [HallScene.s_controls.testServer] = {"changeServerView", "test"};
    [HallScene.s_controls.prepublishServer] = {"changeServerView", "prepublish"};
    [HallScene.s_controls.onlineServer] = {"changeServerView", "online"};
    [HallScene.s_controls.hallServer] = {"changeServerView", "hall"};
    [HallScene.s_controls.bg] = {"bg"};
	--710 新增
    [HallScene.s_controls.bottomLeftView] = {"bottomBtnsView","bottomLeftView"};
    [HallScene.s_controls.View_info] = {"bottomBtnsView","bottomLeftView","View_info"};
    [HallScene.s_controls.View_head] = {"bottomBtnsView","bottomLeftView","View_head"};
    [HallScene.s_controls.Button_head] = {"bottomBtnsView","bottomLeftView","View_head","Button_head"};
    [HallScene.s_controls.Text_name] = {"bottomBtnsView","bottomLeftView","View_info","Text_name"};
    [HallScene.s_controls.Image_vip_flag] = {"bottomBtnsView","bottomLeftView","View_info","Image_vip_flag"};
    [HallScene.s_controls.Button_gold] = {"bottomBtnsView","bottomLeftView","View_info","Button_gold"};
    [HallScene.s_controls.Button_goldBar] = {"bottomBtnsView","bottomLeftView","View_info","Button_goldBar"};
    [HallScene.s_controls.Text_gold] = {"bottomBtnsView","bottomLeftView","View_info","Button_gold","Text_gold"};
    [HallScene.s_controls.Text_goldBar] = {"bottomBtnsView","bottomLeftView","View_info","Button_goldBar","Text_goldBar"};
    [HallScene.s_controls.Button_match] = {"Button_match"};
    [HallScene.s_controls.Image_tittle] = {"Image_tittle"};
    [HallScene.s_controls.Image_bottom_bg] = {"Image_bottom_bg"};
    
    
}

HallScene.s_controlFuncMap = {
    [HallScene.s_controls.reLoginBtn] = HallScene.onReloginBtnClick;
    [HallScene.s_controls.Button_head]    = HallScene.onHeadBtnClick;

    [HallScene.s_controls.testServer] = HallScene.onChangeToTestServer;
    [HallScene.s_controls.prepublishServer] = HallScene.onChangeToPrepublishServer;
    [HallScene.s_controls.onlineServer] = HallScene.onChangeToOnlineServer;
    [HallScene.s_controls.hallServer] = HallScene.onChangeToHallServer;
    [HallScene.s_controls.Button_gold] = HallScene.onButton_goldBtnClick;
    [HallScene.s_controls.Button_goldBar] = HallScene.onButton_goldBarBtnClick;
    [HallScene.s_controls.Button_match] = HallScene.onButton_matchBtnClick;
}


HallScene.s_cmdConfig =
{
    [HallScene.s_cmds.loginSuccess] = HallScene.loginSuccess;
    [HallScene.s_cmds.loginErr] = HallScene.loginErr;
    [HallScene.s_cmds.playLoading] = HallScene.playLoading;
    [HallScene.s_cmds.showGameListView] = HallScene.showGameListView;
    [HallScene.s_cmds.showGameRoomLevelView] = HallScene.showGameRoomLevelView;
    [HallScene.s_cmds.onGetCoreInitInfo] = HallScene.onGetCoreInitInfo;
    [HallScene.s_cmds.showAnnouncementView] = HallScene.showAnnouncementView;
    [HallScene.s_cmds.showNotice] = HallScene.showNotice;
    [HallScene.s_cmds.updateUserInfo] = HallScene.updateUserInfo;
    [HallScene.s_cmds.showBindingGuidelines] = HallScene.showBindingGuidelines;
    [HallScene.s_cmds.onPushBaseDialog] = HallScene.onPushBaseDialog;
    [HallScene.s_cmds.onRoomLevelViewBackToHall] = HallScene.onRoomLevelViewBackToHall;
    [HallScene.s_cmds.showRegisterAccountDialog] = HallScene.showRegisterAccountDialog;
    [HallScene.s_cmds.showAnnouncementStopServer] = HallScene.showAnnouncementStopServer;
    [HallScene.s_cmds.refreshUnReadMessageNum] = HallScene.refreshUnReadMessageNum;
}
