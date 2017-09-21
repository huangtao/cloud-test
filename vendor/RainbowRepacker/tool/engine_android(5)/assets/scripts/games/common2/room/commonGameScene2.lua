


CommonGameScene2 = class(CommonScene);

-- 一些界面控件的index
CommonGameScene2.s_controls = 
{
	commonView_01 			= ToolKit.getIndex();
	commonView_02 			= ToolKit.getIndex();
	commonView_03 			= ToolKit.getIndex();
	commonView_04 			= ToolKit.getIndex();
	bgImage 				= ToolKit.getIndex();
	gameLogoView 			= ToolKit.getIndex();
	gameLogoDivider 		= ToolKit.getIndex();
	gameLogoImage 			= ToolKit.getIndex();
	commonRoomId 			= ToolKit.getIndex();
	antiCheatingImg 		= ToolKit.getIndex();

	--房间装饰图的配置
	decorate_01 			= ToolKit.getIndex();
	decorate_02 			= ToolKit.getIndex();
	decorate_03 			= ToolKit.getIndex();
	decorate_04 			= ToolKit.getIndex();
	reconnect 				= ToolKit.getIndex();

};
-- 指令
CommonGameScene2.s_cmds = 
{
	receiveStateFun				= ToolKit.getIndex();
	receiveActionFun			= ToolKit.getIndex();
	ceatView					= ToolKit.getIndex();
	updatePrivateRoom			= ToolKit.getIndex();
	gameLevelUpdate				= ToolKit.getIndex();
};

-- 构造器
CommonGameScene2.ctor = function(self, viewConfig, controller, childGameConfig)

	-- 新老房间存在相同的commonRoomTimer文件，进入房间前重新require，并且清空监听
	require("games/common2/tools/commonRoomTimer");
	CommonRoomTimer.getInstance():clean();

	self:resetPublicData();
	--先进行common的初始化
	self.m_isHandleCommonInit = false;
	self:initBaseView(childGameConfig);
end

CommonGameScene2.resetPublicData = function(self)
	require("games/common2/module/players/playerSeat");
	require("games/common2/module/players/gamePlayerManager2");
	require("games/common2/data/gameProcessManager2");
end

--@override
CommonGameScene2.resume = function(self)
	CommonScene.resume(self);
	self:commonInit();
end

--@override
--@brief 延迟加载layer，让大厅跳转房间更加流畅
CommonGameScene2.__onDelayResumeScene = function(self)
	CommonScene.__onDelayResumeScene(self);
	
	if not self.m_hasEnter then
		self.m_hasEnter = true;
		self:addLayer();
		MsgProcessTools.getInstance():startProcess();
		self:requestCtrlCmd(CommonGameController2.s_cmds.requestEnterRoom);
	end
end

--@override
CommonGameScene2.pause = function(self)
	CommonScene.pause(self);
end

--@override
CommonGameScene2.stop = function(self)
	CommonScene.stop(self);
end

--@override
CommonGameScene2.run = function(self)
	CommonScene.run(self);
end

-- 析构器
CommonGameScene2.dtor = function(self)
	CommonScene.dtor(self);
	for k,v in pairs(self.m_commonViewMap) do
		v:removeAllChildren(true);
	end
	self.m_commonViewMap = {};

	GameProcessManager2.releaseInstance();
	GamePlayerManager2.releaseInstance();
	PlayerSeat.releaseInstance();
	DialogLogic.releaseInstance();
	CommonRoomTimer2.releaseInstance();
	AnimManager.getInstance():releaseAll();
end

CommonGameScene2.initBaseView = function(self, childGameConfig)
	self.m_commonViewMap = {};
	--初始化view层次
	self.m_commonViewMap[1] = self:findViewById(CommonGameScene2.s_controls.commonView_01); --背景层
	self.m_commonViewMap[2] = self:findViewById(CommonGameScene2.s_controls.commonView_02); --游戏私有层，专属子类
	self.m_commonViewMap[3] = self:findViewById(CommonGameScene2.s_controls.commonView_03); -- 游戏公共层，动画神马的可以在此层做处理，子类可以直接访问
	self.m_commonViewMap[4] = self:findViewById(CommonGameScene2.s_controls.commonView_04); --弹框层

	-- 初始化桌面单击事件、双击事件
	self.m_commonViewMap[2]:setEventTouch(self, self.onDesktopClick);
	self.m_commonViewMap[2]:setEventDoubleClick(self, self.onDesktopDoubleClick);
	self.m_reconnectBtn = self:findViewById(CommonGameScene2.s_controls.reconnect);
	self.m_reconnectBtn:setEventTouch(self, self.onReconnectTouch);
	self.m_reconnectBtn:setFile("isolater/btns/btn_green_164x89_l25_r25_t25_b25.png");
end

CommonGameScene2.onDesktopClick = function ( self, finger_action, x, y, drawing_id_first, drawing_id_current )
	-- body
	self:requestCtrlCmd(CommonGameController2.s_cmds.clickDesktop);
end

CommonGameScene2.onDesktopDoubleClick = function ( self, finger_action, x, y, drawing_id_first, drawing_id_current )
	-- body
	self:requestCtrlCmd(CommonGameController2.s_cmds.doubleClickDesktop);
end

--父类用的初始化
CommonGameScene2.commonInit = function(self)

	if self.m_isHandleCommonInit then 
		return;
	end

	self:getScreenScale();
	self:getCommonBaseView();	
	self:initCommonConfig();
	self:initAntiCheatingInfo();
   
	local viewCommonConfig = self:getCommonConfig();

	if table.isEmpty(viewCommonConfig) then
		Log.e("m_viewCommonConfig-child game must has this config in child's folder");
	else
		self:initGamePlayerManager(viewCommonConfig.playerNumer);

		self:initRoomBg(viewCommonConfig.backgroundFile);		
		self:initRoomDecorate(viewCommonConfig.decorateConfig);
		self:initAudioConfig(viewCommonConfig.soundConfig);
		self:initAnimConfig(viewCommonConfig.animDefs);
		self:initLogoArea(viewCommonConfig.logoConfig);       
	end

	-- 子游戏的debug开关打开时，在房间内会显示当前子游戏的版本号
	local gameId = GameInfoIsolater.getInstance():getCurGameId() or "";
	local packageName = GameInfoIsolater.getInstance():getGamePackageName(gameId) or "";
	if _G[packageName .. "_debug_for_update"] then
		local gameVersion = "版本号：" .. GameInfoIsolater.getInstance():getGameVersion(gameId) or 0;
		local gameVersionTx = UIFactory.createText(gameVersion, 32, 100, 32, kAlignCenter, 0, 0, 0);
		self:addChild(gameVersionTx);
		gameVersionTx:setAlign(kAlignCenter);
	end

	self.m_isHandleCommonInit = true;
end

CommonGameScene2.getScreenScale = function(self)
	self.m_scaleWidth =  System.getScreenScaleWidth();
	self.m_scaleHeight = System.getScreenScaleHeight();
end

CommonGameScene2.getCommonBaseView = function(self)
	--初始化背景图片
	self.m_commonBgImage = self:findViewById(CommonGameScene2.s_controls.bgImage);
	self.m_commonGameLogoDivider = self:findViewById(CommonGameScene2.s_controls.gameLogoDivider);
	self.m_commonGameLogoImage = self:findViewById(CommonGameScene2.s_controls.gameLogoImage);
	self.m_commonGameLogoView = self:findViewById(CommonGameScene2.s_controls.gameLogoView);
	self.m_commonRoomIdText = self:findViewById(CommonGameScene2.s_controls.commonRoomId);
	self:findViewById(CommonGameScene2.s_controls.reconnect):setVisible(_DEBUG);

	self.m_decorateView = {};
	self.m_decorateView[1] = self:findViewById(CommonGameScene2.s_controls.decorate_01);
	self.m_decorateView[2] = self:findViewById(CommonGameScene2.s_controls.decorate_02);
	self.m_decorateView[3] = self:findViewById(CommonGameScene2.s_controls.decorate_03);
	self.m_decorateView[4] = self:findViewById(CommonGameScene2.s_controls.decorate_04);

	self.m_antiCheatingImg = self:findViewById(CommonGameScene2.s_controls.antiCheatingImg);
end

-- 初始化游戏log
CommonGameScene2.initLogoArea = function(self, logoConfig)
    --初始化游戏图标
    logoConfig = table.verify(logoConfig);
	local logoFile = logoConfig.file;
	local x = logoConfig.x;
	local y = logoConfig.y;
	local align = logoConfig.align;
	local isNeedDivider = logoConfig.needDivider;
	local isNeedCombine = logoConfig.needCombine;
    
	if string.isEmpty(logoFile) then
		self.m_commonGameLogoView:setVisible(false);
	else
		self.m_commonGameLogoImage:setFile(logoFile)
		local w, h = self.m_commonGameLogoImage.m_res.m_width, self.m_commonGameLogoImage.m_res.m_height;
		self.m_commonGameLogoImage:setSize(w, h);
		self.m_commonGameLogoImage:setAlign(kAlignLeft);

		local logoView_w = w;
        if isNeedCombine and not self.m_companyLogo then
        	self.m_companyLogo = UIFactory.createImage("games/common/company_logo.png");
        	self.m_commonGameLogoView:addChild(self.m_companyLogo);
        	self.m_companyLogo:setAlign(kAlignLeft);
        	local company_w, company_h = self.m_companyLogo:getSize();
        	local space = 5;
        	logoView_w = logoView_w + company_w + space;

        	self.m_commonGameLogoImage:setPos(company_w + space, nil);
        end

        self.m_commonGameLogoView:setVisible(true);
        self.m_commonGameLogoView:setSize(logoView_w, nil);
		self.m_commonGameLogoView:setAlign(align);
		self.m_commonGameLogoView:setPos(x,y);

        self.m_commonGameLogoDivider:setVisible(isNeedDivider);
	end
	local level = RoomLevelConfig.getInstance():getLevel("layer2","level1");
	self.m_commonGameLogoView:setLevel(level);
end

-- 初始化游戏配置信息
CommonGameScene2.initCommonConfig = function(self)
	--初始化配置
	local commonGameData = GameInfoIsolater.getInstance();
	local curPkgName = commonGameData:getGamePackageName(commonGameData:getCurGameId());
	local viewCommonConfig = -1;
	if not string.isEmpty(curPkgName) then
		viewCommonConfig = ToolKit.safeRequire(string.format("games/%s/%sConfig", curPkgName, curPkgName));
	end
	if not string.isEmpty(viewCommonConfig) and type(viewCommonConfig) == "table" then 
		GameProcessManager2.getInstance():setGameConfig(viewCommonConfig);
	end 
end

--初始化背景
CommonGameScene2.initRoomBg = function(self,bgFile)
	local str = string.trim(bgFile);
	if string.isEmpty(str) then
		bgFile = "games/common/room/room_bg.jpg";
	end
	self.m_commonBgImage:setFile(bgFile);	
end

CommonGameScene2.initRoomDecorate = function(self,decorateConfig)
	decorateConfig = table.verify(decorateConfig);
	local count = #self.m_decorateView;
	for i = 1, count do
		local decorateView = self.m_decorateView[i];
		local decorateFile = decorateConfig[i];
		if string.isEmpty(decorateFile) then
			decorateView:setVisible(false);
		else
			decorateView:setVisible(true);
			decorateView:setFile(decorateFile);
			local w, h = decorateView.m_res.m_width, decorateView.m_res.m_height;
			decorateView:setSize(w, h);
		end
	end
end

CommonGameScene2.initAntiCheatingInfo = function(self)
	local commonGameData = GameInfoIsolater.getInstance();
	local gameId = commonGameData:getCurGameId();
	local levelId = commonGameData:getCurRoomLevelId();
	if self.m_antiCheatingImg then
		if GameInfoIsolater.getInstance():isRoomAntiCheating(gameId, levelId) then
			self.m_antiCheatingImg:setVisible(true);
			self.m_antiCheatingImg:setPos(0, 80);
		else
			self.m_antiCheatingImg:setVisible(false);
		end
	end
end

CommonGameScene2.initAudioConfig = function(self,audioConfig)
	kSoundModule:preload(audioConfig);
end

CommonGameScene2.initAnimConfig = function(self,animDefs)
	if not table.isEmpty(animDefs) then
        AnimDefs = CombineTables(AnimDefs or {}, animDefs or {});
        AnimManager.getInstance():setAnimDefs(AnimDefs);
    end
end

--protect
--获取通用配置
CommonGameScene2.getCommonConfig = function(self)
	return table.verify(GameProcessManager2.getInstance():getGameConfig());
end

-- 设置玩家人数
CommonGameScene2.initGamePlayerManager = function(self,playerNumer)
	PlayerSeat.getInstance():setCurGamePlayerMaxCount(number.valueOf(playerNumer,1));
end

------------------------------------------------game layer init start------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-- 添加功能层到scene
CommonGameScene2.addLayer = function(self)
	-- ======================================= view 1
	self:creatGameLayer();
	self:creatBankrupt();
	self:creatRecharge();
	self:creatReadyLayer();
	self:creatHeadLayer(); -- view1
	self:creatFriendLayer();
	self:creatAnimLayer();
	self:creatClockLayer(); -- view2
	self:creatChatRealTimeLayer();
	self:creatTaskLayer();
	self:creatSystemInfoLayer();
	self:createSilverLayer();
	self:creatToolBarLayer();
	self:creatPlayerLayer();
	-- ======================================= view 1
	self:createRoomInfo();
	self:createHeadToolbarLayer();
	-- ======================================= view 4
	self:creatExtraBtnLayer();	--view4
	-- self:creatBroadcastLayer();	-- view4
	self:creatRecruitLayer();
	self:creatChatLayer();
	self:crateInviteLayer();
	self:creatChatWndLayer();
	self:createReadyDegradeLayer();
	self:createPrivateJiFenLayers();
	self:createOnlookerSpinnerLayer();
end

CommonGameScene2.onCeatView = function(self,seat,uid,info,isFast)
	if info and info.viewName then
		if info.viewName == GameMechineConfig.VIEW_GAMEOVERWND then
			if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
				return;
			end 
			self:creatGameOverLayer();
		elseif info.viewName == GameMechineConfig.VIEW_BROADCAST then
			self:creatBroadcastLayer();
		elseif info.viewName == GameMechineConfig.VIEW_SAFEBOX then
			self:createSafebox();
		elseif info.viewName == GameMechineConfig.VIEW_SETTING then
			self:createSettingLayer();
		elseif info.viewName == GameMechineConfig.VIEW_REPORT then
			self:createReportLayer();
		elseif info.viewName == GameMechineConfig.VIEW_CHAT then
			self:creatChatWndLayer();
		elseif info.viewName == GameMechineConfig.VIEW_BOXVIEW then
			self:creatBoxTaskLayer();
		end
	end
end

CommonGameScene2.creatGameLayer = function(self)
	-- 子游戏层
end

CommonGameScene2.creatGameOverLayer = function(self)
end

CommonGameScene2.createReadyDegradeLayer = function(self)
	if not self.m_readyDegradeLayer then 		
		local ReadyDegradeLayer = require("games/common2/module/readyDegrade/readyDegradeLayer");
		self.m_readyDegradeLayer = new(ReadyDegradeLayer);
		self.m_commonViewMap[4]:addChild(self.m_readyDegradeLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
		self.m_readyDegradeLayer:setLevel(level);
	end 
end

CommonGameScene2.creatBankrupt = function(self)
	if not self.m_bankrupt then
		local bankruptLayer = require("games/common2/module/bankrupt/bankruptLayer");
		self.m_bankrupt = new(bankruptLayer);
		self.m_commonViewMap[4]:addChild(self.m_bankrupt);
	end
end

CommonGameScene2.creatRecharge = function(self)
	if not self.m_recharge then
		local rechargeLayer = require("games/common2/module/recharge/rechargeLayer");
		self.m_recharge = new(rechargeLayer);
		self.m_recharge:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_recharge);
	end
end

CommonGameScene2.creatReadyLayer = function(self)
	if not self.m_readyLayer then
		local readyLayer = require("games/common2/module/ready/readyLayer");
		self.m_readyLayer = new(readyLayer);
		self.m_readyLayer:setDelegate(self);
		self.m_commonViewMap[3]:addChild(self.m_readyLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer3","level1");
		self.m_readyLayer:setLevel(level);		
	end
end

CommonGameScene2.creatHeadLayer = function(self)
	if not self.m_headLayer then
		local headLayer = require("games/common2/module/head/headLayer");
		self.m_headLayer = new(headLayer);
		self.m_headLayer:setDelegate(self);
		self.m_commonViewMap[2]:addChild(self.m_headLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level9");
		self.m_headLayer:setLevel(level);		
	end
end

CommonGameScene2.creatChatLayer = function(self)
	if not self.m_chatLayer then
		local chatLayer = require("games/common2/module/chat/chatLayer");
		self.m_chatLayer = new(chatLayer);
		self.m_chatLayer:setDelegate(self);
		self.m_commonViewMap[2]:addChild(self.m_chatLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level9");
		self.m_chatLayer:setLevel(level);
	end
end

CommonGameScene2.creatChatWndLayer = function(self)
	if not self.m_chatWndLayer then
		local chatwndlayer = require("games/common2/module/chatWnd/chatwndlayer");
		self.m_chatWndLayer = new(chatwndlayer);
		self.m_chatWndLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_chatWndLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
		self.m_chatWndLayer:setLevel(level);
	end
end

CommonGameScene2.creatPlayerLayer = function(self)
	if not self.m_playerLayer then
		local playerLayout = require("games/common2/module/playerInfo/playerLayout");
		self.m_playerLayer = new(playerLayout);
		self.m_playerLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_playerLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
		self.m_playerLayer:setLevel(level);
	end
end

CommonGameScene2.creatSystemInfoLayer = function(self)
	if not self.m_systemInfoLayer then
		local systemInfoLayer = require("games/common2/module/systemInfo/systemInfoLayer");
		self.m_systemInfoLayer = new(systemInfoLayer);
		self.m_systemInfoLayer:setDelegate(self);
		self.m_commonViewMap[1]:addChild(self.m_systemInfoLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer1","level3");
		self.m_systemInfoLayer:setLevel(level);
	end 
end 

CommonGameScene2.creatToolBarLayer = function(self)
	if not self.m_roomMenuBarLayer then
		local menuBarLayer = require("games/common2/module/roomMenuBar/roomMenuBarLayer");
		self.m_roomMenuBarLayer = new(menuBarLayer);
		self.m_roomMenuBarLayer:setDelegate(self);
		self.m_commonViewMap[3]:addChild(self.m_roomMenuBarLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer3","level4");
		self.m_roomMenuBarLayer:setLevel(level);
	end
end

CommonGameScene2.creatFriendLayer = function(self)
	if not self.m_friendLayer then
		local roomFriendLayer = require("games/common2/module/friend/roomFriendLayer");
		self.m_friendLayer = new(roomFriendLayer);
		self.m_friendLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_friendLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_friendLayer:setLevel(level);		
	end
end

CommonGameScene2.creatAnimLayer = function(self)
	if not self.m_animLayer then
		local animLayer = require("games/common2/module/anim/roomAnimLayer");
		self.m_animLayer = new(animLayer);
		self.m_animLayer:setDelegate(self);
		self.m_commonViewMap[3]:addChild(self.m_animLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer3","level3");
		self.m_animLayer:setLevel(level);		
	end
end

CommonGameScene2.creatTaskLayer = function(self)
	if not self.m_taskLayer then
		local taskLayer = require("games/common2/module/roomTask/roomTaskLayer");
		self.m_taskLayer = new(taskLayer);
		self.m_taskLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_taskLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level2");
		self.m_taskLayer:setLevel(level);
		self.m_taskLayer:setFillParent(true,true);	
	end
end

CommonGameScene2.creatBoxTaskLayer = function(self)
	if not self.m_taskBoxLayer then
		local roomTaskRewardLayer = require("games/common2/module/roomtaskreward/roomTaskRewardLayer");
		self.m_taskBoxLayer = new(roomTaskRewardLayer);
		self.m_taskBoxLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_taskBoxLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level5");
		self.m_taskBoxLayer:setLevel(level);
		self.m_taskBoxLayer:setFillParent(true,true);	
	end
end

CommonGameScene2.creatClockLayer = function(self)
	if not self.m_clockLayer then
		local clockLayer = require("games/common2/module/clock/clockLayer");
		self.m_clockLayer = new(clockLayer);
		self.m_clockLayer:setDelegate(self);
		self.m_commonViewMap[2]:addChild(self.m_clockLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level4");
		self.m_clockLayer:setLevel(level);		
	end
end

-- 实时对讲
CommonGameScene2.creatChatRealTimeLayer = function(self)
	local gameId = GameInfoIsolater.getInstance():getCurGameId();
	local roomInfo = table.verify(PrivateRoomIsolater.getInstance():getCurPrivateRoomInfo());
	local talbeType = table.verify(roomInfo).tableType;
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() and talbeType and
		PrivateRoomIsolater.getInstance():isOpenVideo(gameId, talbeType) then
		if not self.m_chatRealTimeLayer then
			local chatRealTimeLayer = require("games/common2/module/chatRealTime/chatRealTimeLayer");
			self.m_chatRealTimeLayer = new(chatRealTimeLayer);
			self.m_chatRealTimeLayer:setDelegate(self);
			self.m_commonViewMap[2]:addChild(self.m_chatRealTimeLayer);
			local level = RoomLevelConfig.getInstance():getLevel("layer2","level11");
			self.m_chatRealTimeLayer:setLevel(level);
		end
	end
end

-- 招募玩家
CommonGameScene2.creatRecruitLayer = function(self)
	if PrivateRoomIsolater.getInstance():isInPrivateRoom()
		and (not PrivateRoomIsolater.getInstance():isInJiFenRoom()) then
		if not self.m_recruitLayer then
			local recruitlayer = require("games/common2/module/recruit/recruitLayer");
			self.m_recruitLayer = new(recruitlayer);
			self.m_recruitLayer:setDelegate(self);
			self.m_commonViewMap[4]:addChild(self.m_recruitLayer);
			local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
			self.m_recruitLayer:setLevel(level);
		end
	end
end

-- 邀请好友
CommonGameScene2.crateInviteLayer = function(self)
	local tableId = kGameManager:getCurShortTableId();
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() and tableId and tableId > 0 then
		if not self.m_inviteLayer then
			local inviteLayer = require("games/common2/module/invite2/inviteLayer2");
			self.m_inviteLayer = new(inviteLayer);
			self.m_inviteLayer:setDelegate(self);
			self.m_commonViewMap[4]:addChild(self.m_inviteLayer);		
			local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
			self.m_inviteLayer:setLevel(level);
		end
	end
end

-- 扩展按钮
CommonGameScene2.creatExtraBtnLayer = function(self)
	if not self.m_extraBtnLayer then
		local extralayer = require("games/common2/module/extraBtn/extraBtnLayer");
		self.m_extraBtnLayer = new(extralayer);
		self.m_extraBtnLayer:setDelegate(self);
		self.m_commonViewMap[2]:addChild(self.m_extraBtnLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level5");
		self.m_extraBtnLayer:setLevel(level);
	end
end

-- 广播
CommonGameScene2.creatBroadcastLayer = function(self)
	if not self.m_broadcastLayer then
		local broadcastLayer = require("games/common2/module/broadcast/roomBroadcastLayer");
		self.m_broadcastLayer = new(broadcastLayer);
		self.m_broadcastLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_broadcastLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level8");
		self.m_broadcastLayer:setLevel(level);
	end
end

-- 房间信息
CommonGameScene2.createRoomInfo = function(self)
	if PrivateRoomIsolater.getInstance():isInPrivateRoom() then
		if not self.m_roomInfoLayer then
			local roomInfoLayer = require("games/common2/module/roomInfo/roomInfoLayer");
			self.m_roomInfoLayer = new(roomInfoLayer);
			self.m_roomInfoLayer:setDelegate(self);
			self.m_commonViewMap[2]:addChild(self.m_roomInfoLayer);
			local level = RoomLevelConfig.getInstance():getLevel("layer2","level10");
			self.m_roomInfoLayer:setLevel(level);		
		end
	end
end

-- 保险箱
CommonGameScene2.createSafebox = function(self)
	if not self.m_safebox then
		local safeboxLayer = require("games/common2/module/safebox/safeboxLayer");
		self.m_safebox = new(safeboxLayer);
		self.m_safebox:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_safebox);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
		self.m_safebox:setLevel(level);		
	end
end

-- 设置
CommonGameScene2.createSettingLayer = function(self)
	if not self.m_settingLayer then
		local settingLayer = require("games/common2/module/setting/settingLayer");
		self.m_settingLayer = new(settingLayer);
		self.m_settingLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_settingLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level2");
		self.m_settingLayer:setLevel(level);		
	end
end

-- 举报
CommonGameScene2.createReportLayer = function(self)
	if not self.m_reportLayer then
		local report = require("games/common2/module/reportwnd/reportLayer");
		self.m_reportLayer = new(report);
		self.m_reportLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_reportLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level3");
		self.m_reportLayer:setLevel(level);		
	end
end

-- 头像背景
CommonGameScene2.createHeadToolbarLayer = function ( self )
	if not self.m_headToolbarLayer then
		local toolbarlayer = require("games/common2/module/headToolbar/headToolbarLayer");
		self.m_headToolbarLayer = new(toolbarlayer);
		self.m_headToolbarLayer:setDelegate(self);
		self.m_commonViewMap[1]:addChild(self.m_headToolbarLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer1","level1");
		self.m_headToolbarLayer:setLevel(level);
	end
end

CommonGameScene2.createSilverLayer = function ( self )
	if not self.m_silverLayer then 
		local SilverLayer = require("games/common2/module/silver/silverLayer");
		self.m_silverLayer = new(SilverLayer);
		self.m_silverLayer:setDelegate(self);
		self.m_commonViewMap[3]:addChild(self.m_silverLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer3","level4");
		self.m_silverLayer:setLevel(level);	
	end
end

CommonGameScene2.createPrivateJiFenLayers = function(self)
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 
		self:createJiFenExtraBtnLayer();
		self:createJiFenHeadLayer();
		self:createJiFenChangeTipsLayer();
		self:createJiFenRecordLayer();
		self:createJifenFinishLayer();
	end 
end

CommonGameScene2.createJiFenExtraBtnLayer = function(self)
	if not self.m_jifenExtraBtnLayer then 
		local JiFenExtraBtnLayer = require("games/common2/module/jifen/jifenExtraBtn/jifenExtraBtnLayer");
		self.m_jifenExtraBtnLayer = new(JiFenExtraBtnLayer);
		self.m_jifenExtraBtnLayer:setDelegate(self);
		self.m_commonViewMap[2]:addChild(self.m_jifenExtraBtnLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level8");
		self.m_jifenExtraBtnLayer:setLevel(level);	
	end 
end

CommonGameScene2.createJiFenHeadLayer = function(self)
	if not self.m_jifenHeadLayer then 
		local JiFenHeadLayer = require("games/common2/module/jifen/jifenHead/jifenHeadLayer");
		self.m_jifenHeadLayer = new(JiFenHeadLayer);
		self.m_jifenHeadLayer:setDelegate(self);
		self.m_commonViewMap[2]:addChild(self.m_jifenHeadLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer2","level9");
		self.m_jifenHeadLayer:setLevel(level);	
	end 
end

CommonGameScene2.createJiFenChangeTipsLayer = function(self)
	if not self.m_jifenChangeTipsLayer then 
		local JiFenChangeTipsLayer = require("games/common2/module/jifen/jifenChangeTips/jifenChangeTipsLayer");
		self.m_jifenChangeTipsLayer = new(JiFenChangeTipsLayer);
		self.m_jifenChangeTipsLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_jifenChangeTipsLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level3");
		self.m_jifenChangeTipsLayer:setLevel(level);	
	end 
end

CommonGameScene2.createJiFenRecordLayer = function(self)
	if not self.m_jifenRecordLayer then 
		local JiFenRecordLayer = require("games/common2/module/jifen/jifenRecord/jifenRecordLayer");
		self.m_jifenRecordLayer = new(JiFenRecordLayer);
		self.m_jifenRecordLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_jifenRecordLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level4");
		self.m_jifenRecordLayer:setLevel(level);	
	end 
end

CommonGameScene2.createJifenFinishLayer = function(self)
	if not self.m_jifenFinishLayer then 
		local JiFenFinishLayer = require("games/common2/module/jifen/jifenFinish/jiFenFinishLayer");
		self.m_jifenFinishLayer = new(JiFenFinishLayer);
		self.m_jifenFinishLayer:setDelegate(self);
		self.m_commonViewMap[4]:addChild(self.m_jifenFinishLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer4","level4");
		self.m_jifenFinishLayer:setLevel(level);	
	end 
end

CommonGameScene2.checkIsSupportOnlooker = function(self)
	return false;
end

CommonGameScene2.createOnlookerSpinnerLayer = function(self)
	if not self:checkIsSupportOnlooker() then 
		return;
	end 

	if not self.m_onlookerSpinnerLayer then 
		local OnlookerSpinnerLayer = require("games/common2/onlooker/module/onlookerSpinner/onlookerSpinnerLayer");
		self.m_onlookerSpinnerLayer = new(OnlookerSpinnerLayer);
		self.m_onlookerSpinnerLayer:setDelegate(self);
		self.m_commonViewMap[3]:addChild(self.m_onlookerSpinnerLayer);
		local level = RoomLevelConfig.getInstance():getLevel("layer3","level4");
		self.m_onlookerSpinnerLayer:setLevel(level);	
	end
end
------------------------------------------------game layer init end----------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------

-- ------------- toolbar ------------------------
-- CommonGameScene2.onToolbarShopClick = function(self)
-- 	self:requestRecharge();
-- end

--private
--请求充值
CommonGameScene2.requestRecharge = function(self,param,isOnlySupportSMS,goodInfo)
	local _param = {
      		scene = PayIsolater.eGoodsListId.RoomPay,
      		gameid = GameInfoIsolater.getInstance():getCurGameId(),
      		level = GameInfoIsolater.getInstance():getCurRoomLevelId()
      	};
    param = param or _param;
  	self:pushOtherState(States.ShortCutRecharge, nil, true, PayIsolater.eGoodsListId.RoomPay, param, goodInfo, isOnlySupportSMS);
end

CommonGameScene2.onToolbarExitClick = function(self)
	if PrivateRoomIsolater.getInstance():isInJiFenRoom() then 		 
		self:requestCtrlCmd(CommonGameController2.s_cmds.requestExitJiFenRoom);
	else 
		self:requestCtrlCmd(CommonGameController2.s_cmds.requestExitRoom);
	end 
end

CommonGameScene2.onToolbarSettingClick = function(self)
end

CommonGameScene2.onToolbarRobotClick = function(self)
end

CommonGameScene2.onToolbarRechargelick = function(self)
end

CommonGameScene2.onToolbarQuKuanClick = function(self)
end

CommonGameScene2.pushOtherState = function(self,...)
	self:requestCtrlCmd(CommonGameController2.s_cmds.pushOtherState,...);
end
------------- toolbar ------------------------
-----------------------------------layer delegate callBack end---------------------------------------------------------------------------------------


----------------------- common map -----------------------------------------------------

----------------------control func-------------------------------

-- 点击桌面背景
CommonGameScene2.onCommonBgTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerDown then 

	elseif finger_action == kFingerMove then 

	else
		--此处关闭弹框
		if self.m_recruitBtn then
			self.m_recruitBtn:hideDetail();
		end

		EventDispatcher.getInstance():dispatch(kClosePopupWindows);
	end
end

CommonGameScene2.onReceiveStateFun = function(self,state,...)
	if CommonGameScene2.stateConfig[state] then
		CommonGameScene2.stateConfig[state](self,...);
	end
end

CommonGameScene2.onRefreshPrivateRoom = function (self)
	self:creatChatRealTimeLayer();
	self:creatRecruitLayer();
	self:createPrivateJiFenLayers();
	self:crateInviteLayer();
end

CommonGameScene2.onReconnectTouch = function(self, finger_action, x, y, drawing_id_first, drawing_id_current, event_time)
	if finger_action == kFingerDown then 
		self.m_startx, self.m_starty = self.m_reconnectBtn:getAbsolutePos();
		self.m_reconnectBtnMove = false;
	elseif finger_action == kFingerMove then
		if math.abs(x - self.m_startx) > 100 or math.abs(y - self.m_starty) > 100 then
			local w,h = self.m_reconnectBtn:getSize();
			self.m_reconnectBtn:setPos(x - w/2,y - h/2);
			self.m_reconnectBtnMove = true;
		end
	elseif finger_action == kFingerUp then
		if not self.m_reconnectBtnMove then
			self:onTestReconnect();
		end
		self.m_reconnectBtnMove = false;
    end
end

CommonGameScene2.onTestReconnect = function(self)
	if not self.m_moreInfoTest then
		local roommoreinfotest = require("games/common2/room/roommoreinfotest");
		self.m_moreInfoTest = new(roommoreinfotest);
		self:addChild(self.m_moreInfoTest);
		self.m_moreInfoTest:setFillParent(true,true);
	end
	local btnX, btnY = self.m_reconnectBtn:getAbsolutePos();
	local btnW, btnH = self.m_reconnectBtn:getSize();
	self.m_moreInfoTest:refreshPos(btnX - btnW / 2 + 10, btnY + btnH - 10);
	self.m_moreInfoTest:showView();
end

-- 游戏图层的层级发生变化，需要刷新
CommonGameScene2.onGameLevelUpdate = function(self,layerName)
	local layers = {};
	if layerName == "layer1" then
		layers = {
			{self.m_headToolbarLayer,"level1"}, {self.m_systemInfoLayer,"level3"},
		};

	elseif layerName == "layer2" then
		layers = {
			{self.m_commonGameLogoView,"level1"}, {self.m_taskLayer,"level2"}, {self.m_clockLayer,"level4"},
			{self.m_extraBtnLayer,"level5"}, {self.m_jifenExtraBtnLayer,"level5"},
			{self.m_chatLayer,"level9"}, {self.m_headLayer,"level9"},{self.m_jifenHeadLayer,"level9"},
			{self.m_roomInfoLayer,"level10"}, {self.m_chatRealTimeLayer,"level11"},
		};

	elseif layerName == "layer3" then
		layers = {
			{self.m_readyLayer,"level1"}, {self.m_roomMenuBarLayer,"level4"}, {self.m_animLayer,"level3"}, 
			{self.m_onlookerSpinnerLayer,"level4"},
		};

	elseif layerName == "layer4" then
		layers = {
			{self.m_chatWndLayer,"level2"},{self.m_playerLayer,"level2"},{self.m_recruitLayer,"level2"},
			{self.m_inviteLayer,"level2"},{self.m_safebox,"level2"},{self.m_settingLayer,"level2"},{self.m_readyDegradeLayer,"level2"},			
			{self.m_reportLayer,"level3"},{self.m_jifenChangeTipsLayer,"level3"},
			{self.m_jifenRecordLayer,"level4"},{self.m_jifenFinishLayer,"level4"},{self.m_broadcastLayer,"level8"},{self.m_friendLayer,"level8"},		
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
	self:onRefreshOtherLayerLevel(layerName);
end

-- 用于之类重写
CommonGameScene2.onRefreshOtherLayerLevel = function(self,layerName)

end

-- 控件的配置信息
CommonGameScene2.s_controlConfig = 
{
	-- [CommonGameScene2.s_controls.backBtn] = {"head_area","btn_back"},
	[CommonGameScene2.s_controls.commonView_01] 				= {"commonView1"},
	[CommonGameScene2.s_controls.commonView_02] 				= {"commonView2"},
	[CommonGameScene2.s_controls.commonView_03] 				= {"commonView3"},
	[CommonGameScene2.s_controls.commonView_04] 				= {"commonView4"},


	[CommonGameScene2.s_controls.bgImage] 					= {"commonView1", "bg"},
	[CommonGameScene2.s_controls.gameLogoView] 				= {"commonView1", "gameLogoView"},
	[CommonGameScene2.s_controls.gameLogoImage] 			= {"commonView1", "gameLogoView", "gameLogo"},
	[CommonGameScene2.s_controls.gameLogoDivider] 			= {"commonView1", "gameLogoView", "gameLogoDivider"},

	[CommonGameScene2.s_controls.commonRoomId] 				= {"commonView1", "privateRoomId"};
	[CommonGameScene2.s_controls.decorate_01] 				= {"commonView1", "decorate_1"};
	[CommonGameScene2.s_controls.decorate_02] 				= {"commonView1", "decorate_2"};
	[CommonGameScene2.s_controls.decorate_03] 				= {"commonView1", "decorate_3"};
	[CommonGameScene2.s_controls.decorate_04] 				= {"commonView1", "decorate_4"};
	[CommonGameScene2.s_controls.antiCheatingImg] 			= {"commonView1", "antiCheatingImg"}; 
	[CommonGameScene2.s_controls.reconnect] 				= {"reconnect"}; 
};

-- 控件的方法配置
CommonGameScene2.s_controlFuncMap = 
{
	[CommonGameScene2.s_controls.bgImage] 					= CommonGameScene2.onCommonBgTouch,
	[CommonGameScene2.s_controls.reconnect] 				= CommonGameScene2.onTestReconnect,

};

-- 指令的方法配置
CommonGameScene2.s_cmdConfig = 
{
	[CommonGameScene2.s_cmds.receiveStateFun] 				= CommonGameScene2.onReceiveStateFun,
	[CommonGameScene2.s_cmds.receiveActionFun] 				= CommonGameScene2.onReceiveActionFun,
	[CommonGameScene2.s_cmds.ceatView] 						= CommonGameScene2.onCeatView,
	[CommonGameScene2.s_cmds.updatePrivateRoom]				= CommonGameScene2.onRefreshPrivateRoom,
	[CommonGameScene2.s_cmds.gameLevelUpdate]				= CommonGameScene2.onGameLevelUpdate,
}; 

CommonGameScene2.stateConfig = {
};

--游戏层可用的控件配置表
--此类只在集成了  CommonGameScene2 的类才会有
--事件需要自己集成
CommonGameScene2.s_gameControlConfig = 
{

};
