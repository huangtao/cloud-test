local ViewBase = Import("games/common2/module/viewBase");
local SilverLogic = Import("games/common2/module/silver/logic/silverLogic");
local SilverData = Import("games/common2/module/silver/data/silverData");
require("games/common2/animation/silverFlyAnim");

local SilverView = class(ViewBase, false);

local _index = 0;
local function getIndex()
	_index = _index + 1;
	return _index;
end

SilverView.s_controls = {
	btnSilver 			= getIndex();
	touchView			= getIndex();
	imgDialogBg 		= getIndex();

	topView 			= getIndex();
	moreSilverIcon 		= getIndex();

	middleView 			= getIndex();
	silverNumText 		= getIndex();
	getRewardText 		= getIndex();

};

SilverView.ctor = function ( self, seat, viewConfig )
	super(self, viewConfig);
	self:setFillParent(true, true);
	self.m_ctrl = SilverView.s_controls;

	self.m_isShow = false;
	self:initConfig();
	self:initViews();
end

SilverView.dtor = function ( self )
	delete(self.m_silverIconLight);
	self.m_silverIconLight = nil;

	SilverData.releaseInstance();
	SilverLogic.releaseInstance();
end

SilverView.initConfig = function ( self )
	-- body
	local gameConfig = GameProcessManager2.getInstance():getGameConfig();
	local silverConfig = table.verify(gameConfig.silverConfig);
	self.m_buttonConfig = table.verify(silverConfig.button);
	self.m_dialogConfig = table.verify(silverConfig.dialog);

	if table.isEmpty(self.m_buttonConfig) then 
		self.m_buttonConfig = {
			x = 50,
			y = 50,
			align = kAlignRight
		};
	end

	if table.isEmpty(self.m_dialogConfig) then 
		self.m_dialogConfig = {
			x = 50,
			y = 50,
			align = kAlignRight
		};
	end
end

SilverView.initViews = function ( self )

	-- silver button
	self.m_btnSilver = self:findViewById(self.m_ctrl.btnSilver);
	self.m_btnSilver:setAlign(self.m_buttonConfig.align);
	self.m_btnSilver:setPos(self.m_buttonConfig.x, self.m_buttonConfig.y);

	-- bg
	self.m_imgDialogBg = self:findViewById(self.m_ctrl.imgDialogBg);
	self.m_imgDialogBg:setAlign(self.m_dialogConfig.align);
	self.m_imgDialogBg:setPos(self.m_dialogConfig.x, self.m_dialogConfig.y);
	self.m_imgDialogBg:setVisible(self.m_isShow);

	-- top view
	self.m_topView 			= self:findViewById(self.m_ctrl.topView);
	self.m_moreSilverIcon 	= self:findViewById(self.m_ctrl.moreSilverIcon);

	-- middle view
	self.m_middleView 		= self:findViewById(self.m_ctrl.middleView);
	self.m_silverNumText 	= self:findViewById(self.m_ctrl.silverNumText);
	self.m_getRewardText 	= self:findViewById(self.m_ctrl.getRewardText);

	self:showSilverView();
end
-- 显示/隐藏银元弹框
SilverView.toggleSilverView = function ( self )
	self.m_isShow = not self.m_isShow;
	self.m_imgDialogBg:setVisible(self.m_isShow);
	DialogLogic.getInstance():popDialog();
	if self.m_isShow then
		DialogLogic.getInstance():pushDialogStack(self, self.hideSilverView);
	end
end
SilverView.hideSilverView = function (self )
	self.m_imgDialogBg:setVisible(false);
	self.m_isShow = false;
end
-- 银元按钮单击事件
SilverView.onBtnSilverClick = function ( self )
	self:toggleSilverView();
end
-- 单击桌面是隐藏银元弹框
SilverView.onDesktopClick = function ( self )
	if self.m_isShow then
		self:toggleSilverView();
	end
end
-- 领取奖励按钮事件
SilverView.onBgClick = function ( self )
	if SilverData.getInstance():isFinishTask() then
        self:playGetSilverAnim();
		self:requestSilverReward();
    end
end
-- 显示银元View
SilverView.showSilverView = function ( self )
	if GameInfoIsolater.getInstance():isInSilverroom() then
		self:setVisible(true);
	else
		self:setVisible(false);
	end
end
-- 登录房间成功后，拉取银元牌局任务信息
SilverView.onRoomLoginSuccess = function ( self, seat, uid, info, isFast, tag )
	if GameInfoIsolater.getInstance():isInSilverroom() then
		self:showSilverView();
		self:requestSilverData();
	else 
		self:showSilverView();
	end
end
-- 请求银元牌局任务信息
SilverView.requestSilverData = function ( self )
	SilverLogic.getInstance():requestSilverData();
end
-- 请求银元牌局任务信息回调
SilverView.onGetSilverData = function ( self, seat, uid, data, isFast, tag )
	if not data then
		return;
	end
	
	SilverData.getInstance():setInning(number.valueOf(data.inning)); --完成牌局数
	if not data.isPush then 
		-- 不是中场推送的时候，更新任务其他信息
		SilverData.getInstance():setDone(number.valueOf(data.done));     --任务牌局
		SilverData.getInstance():setPrize(number.valueOf(data.prize));   --奖励数
	end

	self:refreshSilverButton();
	self:refreshSilverView();
end
-- 请求领取银元牌局任务奖励
SilverView.requestSilverReward = function ( self )
	SilverLogic.getInstance():requestSilverReward();
end
-- 请求领取奖励回调
SilverView.onGetSilverReward = function ( self, seat, uid, data, isFast, tag )
    LoadingView.getInstance():hidden();
    local isSuccess = data.isSuccess;
    local msg = isSuccess and string.concat("成功领取", self.m_prize, "银元!") or "领取银元失败";
    Toast.getInstance():showText(msg,50,30,kAlignLeft,"",24,200,175,110);

    if isSuccess then
        SilverData.getInstance():setInning(0);
        self:refreshSilverButton();
        self:refreshSilverView();
    end
end
-- 刷新任务按钮，可领奖时显示按钮发光动画
SilverView.refreshSilverButton = function ( self )
	local isFinishTask = SilverData.getInstance():isFinishTask();
	if isFinishTask then 
		-- 显示按钮发光动画
		self.m_btnSilver:setFile("games/common/roomTask/silverroom/silverRewardIcon.png");
		self:playSilverLightingAnim();
	else 
		-- 显示按钮普通状态
		self.m_btnSilver:setFile("games/common/roomTask/silverroom/silverNotRewardIcon.png");
		self:stopSilverLightingAnim();
	end
end
-- 播放银元按钮发光动画
SilverView.playSilverLightingAnim = function ( self )
	local isFinishTask = SilverData.getInstance():isFinishTask();

    if not isFinishTask then
        return;
    end

	self:stopSilverLightingAnim();

	if not self.m_silverIconLight then 
	    local file = "games/common/roomTask/silverroom/silverSelected.png";
	    self.m_silverIconLight = UIFactory.createImage(file);
	    local x,y 		= self.m_btnSilver:getPos();
	    local btnW,btnH 	= self.m_btnSilver:getSize();
	    local lightW,lightH 	= self.m_silverIconLight:getSize(); 
	    self.m_silverIconLight:setPos(x - 10, y);
	    self.m_silverIconLight:setAlign(self.m_buttonConfig.align);
	    self.m_silverIconLight:setLevel(-1);
	    self:addChild(self.m_silverIconLight);
	end

	self.m_silverIconLight:setVisible(true);
	self.m_silverIconLightAnim = self.m_silverIconLight:addPropRotate(1001,kAnimRepeat,2500,0,0,360,kCenterDrawing);
    self.m_silverIconLightAnim:setDebugName("SilverView.playSilverLightingAnim|PropRotate");
end
-- 停止动画
SilverView.stopSilverLightingAnim = function ( self )
	if not self.m_silverIconLight then 
		return;
	end

	self.m_silverIconLight:setVisible(false);

	if not self.m_silverIconLight:checkAddProp(1001) then 
		self.m_silverIconLight:removeProp(1001);
	end
end
-- 刷新弹框界面
SilverView.refreshSilverView = function ( self )
	local isFinishTask = SilverData.getInstance():isFinishTask();
	local prize = SilverData.getInstance():getPrize();
	local leftInning = SilverData.getInstance():getLeftInning();
	
	local str = string.concat("×", prize);
	self.m_silverNumText:setText(str);
    self.m_getRewardText:setText(isFinishTask and "点击领取" or "即可领取");
    self.m_middleView:setPos(nil, isFinishTask and 200 or 180);
    self.m_moreSilverIcon:setVisible(isFinishTask);
    if not isFinishTask then
        local tips = string.concat("#cD5EFFF在本场再打#c8AFF95", leftInning, "#cD5EFFF局");
        local w, h = self.m_topView:getSize();
        if self.m_richText then
            delete(self.m_richText);
            self.m_richText = nil;
        end
        self.m_richText = new(RichText, tips, w, h, kAlignCenter, nil, 28);
	    self.m_richText:setAlign(kAlignCenter);
	    self.m_topView:addChild(self.m_richText);     
    end
    if self.m_richText then
        self.m_richText:setVisible(not isFinishTask);
    end
end
-- 播放银元飘至头像动画
SilverView.playGetSilverAnim = function ( self )
	local mid = UserBaseInfoIsolater.getInstance():getUserId();
	local seat = GamePlayerManager2.getInstance():getLocalSeatByMid(mid);
	local startX,startY = self.m_moreSilverIcon:getAbsolutePos();
	local w,h = InteractionInfo.getInstance():getHeadSize(seat);
	local endX, endY = InteractionInfo.getInstance():getHeadAbsolutePos(seat);
	endX = endX + w/4;
	endY = endY + h/4;
	SilverFlyAnim.play(self, seat, startX + 50, endX, startY + 50, endY, self.firstFunc, self, self.lastFunc, self);
end

SilverView.firstFunc = function (self)
    if not self.m_swfplayer then
    	local gameSilverStar_info = require("games/common2/animation/gameSilverStar_swf_info");
    	local gameSilverStar_pin = require("games/common2/animation/gameSilverStar_swf_pin");
        self.m_swfplayer = new(SwfPlayer, gameSilverStar_info,gameSilverStar_pin);
        self.m_swfplayer:setAlign(kAlignCenter);
        self:addChild(self.m_swfplayer);
    end
    self.m_swfplayer:play(1,false,-1,0);
end

SilverView.lastFunc = function (self)
    SilverFlyAnim.release();
    self.m_swfplayer:stop();
    delete(self.m_swfplayer);
    self.m_swfplayer = nil;
end

SilverView.s_controlConfig = {
	[SilverView.s_controls.touchView]					= {"touchView"};
	[SilverView.s_controls.btnSilver]					= {"btnSilver"};
	[SilverView.s_controls.imgDialogBg]					= {"bg"};
	[SilverView.s_controls.topView]             		= {"bg", "topView"};
    [SilverView.s_controls.moreSilverIcon]      		= {"bg", "topView", "moreSilverIcon"};
    [SilverView.s_controls.middleView]          		= {"bg", "middleView"};
    [SilverView.s_controls.silverNumText]       		= {"bg", "middleView", "silverNumText"};
    [SilverView.s_controls.getRewardText]       		= {"bg", "middleView", "getRewardText"};
};

SilverView.s_controlFuncMap = {
	[SilverView.s_controls.btnSilver]			= SilverView.onBtnSilverClick;
	[SilverView.s_controls.imgDialogBg] 		= SilverView.onBgClick;
};

SilverView.s_stateFuncMap = {
	[GameMechineConfig.STATUS_LOGIN]			= "onRoomLoginSuccess";
};

SilverView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_GET_SILVER_DATA] 		= "onGetSilverData";
	[GameMechineConfig.ACTION_NS_GET_SILVER_REWARD]		= "onGetSilverReward";
	[MechineConfig.ACTION_NS_CLICK_DESKTOP]				= "onDesktopClick";
};

return SilverView;
