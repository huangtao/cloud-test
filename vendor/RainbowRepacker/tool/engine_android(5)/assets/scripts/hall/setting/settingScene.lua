require("hall/setting/data/settingDataInterface");
require("uiex/switchex");
require("hall/suggestion/data/suggestionDataInterface");
require("hall/update/updateHandleMgr");
require("hall/setting/data/settingDataInterface");
require("hall/main/data/hallDataInterface");

local SettingScene = class(CommonScene);
SettingScene.s_updateEvent = EventDispatcher.getInstance():getUserEvent();--监听升级的事件

local h_index = 0;
local getIndex = function(self)
	h_index = h_index + 1;
	return h_index;
end

SettingScene.s_controls = 
{
	backBtn = getIndex(),

	contentView = getIndex();
	contentLayout = getIndex();

	appVersion = getIndex(),
	appVersionBtn = getIndex(),
	updateBtn=getIndex();

	area_voiceSetting = getIndex(),
	slienceOnOffBtn = getIndex(),
	musicSlider = getIndex(),
	effectSlider = getIndex(),
	minMaxVolumeBtn1=getIndex(),
	minMaxVolumeBtn2=getIndex(),
	voiceReadCardSwitchBtn = getIndex(),

	area_commonSetting = getIndex(),
	shakeSwitchBtn = getIndex(),
	disableChatSwitchBtn = getIndex(),
	clearingSwitchBtn = getIndex(),

    feedBackBtn = getIndex(),
	aboutUsBtn = getIndex(),
	gameHelpBtn = getIndex(),

	hallUpdateStatus=getIndex(),

	effectMaxVolume = getIndex(),
	effectMinVolume = getIndex(),
	musicMaxVolume  = getIndex(),
	musicMinVolume  = getIndex(),
	clearingArea = getIndex(),



	voiceSettingLayer = getIndex(),
	commonLayer = getIndex(),
    feedbackStatus = getIndex(),
	expandGiftPacketBtn = getIndex();
	htmlView = getIndex();

	agentBtn = getIndex();
	clearCacheBtn = getIndex();

	voiceReadCardLabel = getIndex();

	area_floatBall = getIndex();
	floatBallSwitchBtn = getIndex();
	area_matchOnlooker = getIndex();
	matchOnlookerSwitchBtn = getIndex();
}

SettingScene.s_cmds = 
{
	GoBackWebViewUrl = getIndex();
	checkIsRefuseBack = getIndex();
}

SettingScene.ctor = function(self,viewConfig, controller)
	self.m_controller = controller;
	self.m_ctrl = SettingScene.s_controls;

	

	self.voiceSettingLayer = self:findViewById(self.m_ctrl.voiceSettingLayer);
	self.commonLayer = self:findViewById(self.m_ctrl.commonLayer);

    self.feedBackBtn = self:findViewById(self.m_ctrl.feedBackBtn);
	self.gameHelpBtn = self:findViewById(self.m_ctrl.gameHelpBtn);

	self:_reviseViews();
	self:_initViews();
end

SettingScene.resume = function(self)
	CommonScene.resume(self);
    SuggestionDataInterface.getInstance():setObserver(self);
	UpdateHandleMgr.getInstance():setObserver(self);
	AgencyDataInterface.getInstance():setObserver(self);

    -- 设置小红点状态	
	local unread = SuggestionDataInterface.getInstance():getUnreadFeedbackNum();
	self:findViewById(self.m_ctrl.feedbackStatus):setVisible(unread > 0);
	self:_loadSetting();

	self:_initAgent();

	self:_checkUpdateStatus();
end

SettingScene.pause = function(self)
	CommonScene.pause(self);
    SuggestionDataInterface.getInstance():clearObserver(self);
	UpdateHandleMgr.getInstance():clearObserver(self);
	AgencyDataInterface.getInstance():clearObserver(self);
end

SettingScene.dtor = function(self)
	delete(self.m_generalizeWebView);
	self.m_generalizeWebView = nil;
end
---------------------------------------------------------------------------------------------------
SettingScene.onCheckUpdateCallBack = function(self,isSuccess,isApkUpdate,isHallUpdate)
	if isSuccess then 
		local isUpdated =  isApkUpdate or isHallUpdate;
		if not isUpdated then
			Toast.getInstance():showText("目前已经是最新版本",50,30,kAlginLeft,"",26,255,255,255);
		end
	end 
end 


SettingScene.onGetFeedbackListCallback = function(self)
	local unread = SuggestionDataInterface.getInstance():getUnreadFeedbackNum();
	self:findViewById(self.m_ctrl.feedbackStatus):setVisible(unread > 0);
end 

SettingScene.onGetAgencyConfigCallback = function(self,isSuccess,agencyConfig)
	if isSuccess then 
		self:_initAgent();
	end 
end
-----------------------------------------------------------------------------------------------------
SettingScene._loadSetting = function(self)
	self.m_slienceOnOffBtnSwitch:setChecked(kSettingDataInterface:getMute());
	self.m_voiceReadCardSwitch:setChecked(kSettingDataInterface:getReadPoker());	
	self.m_shakeSwitch:setChecked(kSettingDataInterface:getShake());	
	self.m_disableChatSwitch:setChecked(not kSettingDataInterface:getShieldChat());							
	self.m_clearingSwitch:setChecked(kSettingDataInterface:getShieldGameOver());	
	self.m_floatBallSwitch:setChecked(kSettingDataInterface:getFloatBallSwitch());
	self.m_matchOnlookerSwitch:setChecked(kSettingDataInterface:getMatchOnlookerSwitch());

	self:findViewById(self.m_ctrl.musicSlider):setProgress(kSettingDataInterface:getMusicVolume());		
	self:findViewById(self.m_ctrl.effectSlider):setProgress(kSettingDataInterface:getEffectVolume());	

	self:_setSilenceStatus(kSettingDataInterface:getMute());

	local isShowFloatBall = FloatBallDataInterface.getInstance():getPhpSwitchStatus();
	local area_floatBall = self:findViewById(self.m_ctrl.area_floatBall);
	area_floatBall:setVisible(isShowFloatBall);		
	local _,y_1 = area_floatBall:getPos();
	
	local area_matchOnlooker = self:findViewById(self.m_ctrl.area_matchOnlooker);
	local _,y_2 = area_matchOnlooker:getPos();
	local yy = isShowFloatBall and y_2 or y_1;
	area_matchOnlooker:setPos(nil,yy);
end

SettingScene._initAgent = function(self)
	local agentBtn = self:findViewById(self.s_controls.agentBtn);
	local expandGiftPacketBtn = self:findViewById(self.s_controls.expandGiftPacketBtn);

	local isAgentEntranceOpen = AgencyDataInterface.getInstance():isAgentEntranceOpen();
	local isAgentBindingOpen = AgencyDataInterface.getInstance():isAgentBindingOpen();

	agentBtn:setVisible(isAgentEntranceOpen);
	expandGiftPacketBtn:setVisible(isAgentBindingOpen);
end

SettingScene._reviseViews = function(self)
	local layout_w, _ = self:findViewById(self.s_controls.contentLayout):getSize();
	local margin = 10;
	local w = (layout_w-margin*3)/2;
	self:findViewById(self.s_controls.area_voiceSetting):setSize(w, nil);
	self:findViewById(self.s_controls.area_commonSetting):setSize(w, nil);
end

SettingScene._initViews = function(self)	
	local hallVersion=kGameManager:getGameVersion(GameType.HALL);
	local apkVersion = kClientInfo:getApkVersion();
	local appVer = "";
	if apkVersion then
		appVer = apkVersion .. "." .. hallVersion;
	else
		appVer = hallVersion;
	end
	local channelId = kClientInfo:getChannelId();
	if channelId ~= "" then
		appVer = appVer .. "(" .. channelId .. ")";
    end
	self:_updateTexts(self.m_ctrl.appVersion,appVer);
	
	self.m_slienceOnOffBtnSwitch = self:_createSwitch(self.m_ctrl.slienceOnOffBtn,self.onSlienceOnOffBtnSwitch);						

	self.m_voiceReadCardSwitch = self:_createSwitch(self.m_ctrl.voiceReadCardSwitchBtn,self.onVoiceReadCardSwitchChanged);	

	self.m_shakeSwitch = self:_createSwitch(self.m_ctrl.shakeSwitchBtn,self.onShakeSwitchChanged);	

	self.m_disableChatSwitch = self:_createSwitch(self.m_ctrl.disableChatSwitchBtn,self.onDisableChatChanged);				

	self.m_clearingSwitch = self:_createSwitch(self.m_ctrl.clearingSwitchBtn,self.onClearingSwitchChanged);							

	self.m_floatBallSwitch = self:_createSwitch(self.m_ctrl.floatBallSwitchBtn, self.onFloatBallSwitchChanged);

	self.m_matchOnlookerSwitch = self:_createSwitch(self.m_ctrl.matchOnlookerSwitchBtn,self.onMatchOnlookerSwitchChanged);

	self:findViewById(self.m_ctrl.clearingArea):setVisible(false);

	self.m_htmlView = self:findViewById(self.m_ctrl.htmlView);
	self.m_htmlView:setVisible(false);

	self.m_voiceText = self:findViewById(self.m_ctrl.voiceReadCardLabel);
	self.m_voiceText:setText(RegionConfigDataInterface.getInstance():getSettingVoiceText() or "");

	self:_checkUpdateStatus();
end

SettingScene._checkUpdateStatus = function(self)	
	if System.getPlatform() == kPlatformIOS then
		self:findViewById(self.m_ctrl.updateBtn):setVisible(false);
	else 
		local status = HallUpdateConfig.getInstance():getHallUpdateStatus();
		self:findViewById(self.m_ctrl.hallUpdateStatus):setVisible(status == 3);

		self:findViewById(self.m_ctrl.updateBtn):setVisible(status == 1 or status == 3);
    end      
end

SettingScene._createSwitch = function(self,parentCtr,callbackFunc)
	local switch = new(Switch);							
	switch:setAlign(kAlignCenter);	

	if callbackFunc then 				
		switch:setOnChange(self,callbackFunc);
	end 

	local node = new(Image,"hall/common/bg_blank.png");
	node:setSize(switch:getSize());
	if callbackFunc then 				
		node:setEventTouch({self,switch,callbackFunc},self.onSwitchBgTouch);
	end

	if parentCtr then 	
		local parentNode = self:findViewById(parentCtr);
		if parentNode then 
			parentNode:removeAllChildren(true);	
			parentNode:addChild(node);					
			parentNode:addChild(switch);			
		end 
	end 

	return switch;
end

SettingScene.onSwitchBgTouch = function(arg,finger_action, x, y, drawing_id_first, drawing_id_current)
	if finger_action == kFingerUp then 
		local self = arg[1];
		local switch = arg[2];
		local callbackFunc = arg[3];
		if switch and typeof(switch,Switch) then 
			local isChecked = switch:isChecked();
			switch:setChecked(not isChecked);
			if callbackFunc then 
				callbackFunc(self,not isChecked);
			end 
		end 

	end 
end

SettingScene._updateTexts = function(self,name,text)
	if(SettingScene.s_controlConfig[name] and text and text ~= "") then
		self:findViewById(name):setText(text);
	end
end 

SettingScene._setSilenceStatus = function(self,isMute)	
	local color = (isMute and 128) or 255;
	self:findViewById(self.m_ctrl.musicSlider):setColor(color,color,color);
	self:findViewById(self.m_ctrl.musicSlider):setPickable(not isMute);
	
	self:findViewById(self.m_ctrl.effectSlider):setColor(color,color,color);
	self:findViewById(self.m_ctrl.effectSlider):setPickable(not isMute);

	self:findViewById(self.m_ctrl.voiceReadCardSwitchBtn):setColor(color,color,color);
	self:findViewById(self.m_ctrl.voiceReadCardSwitchBtn):setPickable(not isMute);

	self:findViewById(self.m_ctrl.effectMinVolume):setEnable(not isMute);
	self:findViewById(self.m_ctrl.effectMaxVolume):setEnable(not isMute);
	self:findViewById(self.m_ctrl.musicMinVolume):setEnable(not isMute);
	self:findViewById(self.m_ctrl.musicMaxVolume):setEnable(not isMute);
end

------------------------------------------------------------------------------------------------------
SettingScene.onReturnBtnClick = function(self)
	self:requestCtrlCmd(SettingController.s_cmds.goBack);
end

SettingScene.onFeedBackBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingFeedBack);
	self:requestCtrlCmd(SettingController.s_cmds.OpenFeedback);
end

SettingScene.onAboutUsBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingAboutUs);
	self:requestCtrlCmd(SettingController.s_cmds.OpenService);
end

SettingScene.onGameHelpBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingGameHelp);
	self:requestCtrlCmd(SettingController.s_cmds.OpenSecrecy);
end

SettingScene.onUpdateBtnClick = function(self)	
	UpdateHandleMgr.getInstance():startCheckUpdate(true);
end

-----音乐
SettingScene.onMusicSliderClick = function(self)
	local volume = self:findViewById(self.m_ctrl.musicSlider):getProgress();
	self:_setMusicVolume(volume);
end

SettingScene.onMusicMinVolume = function ( self )
	UBReport.getInstance():report(UBConfig.kHallSettingMusicSlider);
	self:_setMusicVolume(0);
end

SettingScene.onMusicMaxVolume = function ( self )
	UBReport.getInstance():report(UBConfig.kHallSettingMusicSlider);
	self:_setMusicVolume(1);
end

SettingScene._setMusicVolume = function(self,volume)
	self:findViewById(self.m_ctrl.musicSlider):setProgress(volume);
	kSettingDataInterface:setMusicVolume(volume);
end

-----音效
SettingScene.onEffectSilderClick = function(self)
	local volume = self:findViewById(self.m_ctrl.effectSlider):getProgress();
	self:_setEffectVolume(volume);
end

SettingScene.onEffectMinVolume = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingEffectSilder);
	self:_setEffectVolume(0);
end

SettingScene.onEffectMaxVolume = function ( self )
	UBReport.getInstance():report(UBConfig.kHallSettingEffectSilder);
	self:_setEffectVolume(1);
end

SettingScene._setEffectVolume = function(self,volume)
	self:findViewById(self.m_ctrl.effectSlider):setProgress(volume);
	kSettingDataInterface:setEffectVolume(volume);
end

SettingScene.onSlienceOnOffBtnSwitch = function(self,state)
	UBReport.getInstance():report(UBConfig.kHallSettingSlienceOnOff);
	self:_setSilenceStatus(state);
	kSettingDataInterface:setMute(state);
end

SettingScene.onVoiceReadCardSwitchChanged = function(self,state)
	UBReport.getInstance():report(UBConfig.kHallSettingVoiceReadCard);
	kSettingDataInterface:setReadPoker(state);
end

SettingScene.onFloatBallSwitchChanged = function(self, state)
	kSettingDataInterface:setFloatBallSwitch(state);
end

SettingScene.onMatchOnlookerSwitchChanged = function(self,state)
	kSettingDataInterface:setMatchOnlookerSwitch(state);
end

SettingScene.onShakeSwitchChanged = function(self,state)
	UBReport.getInstance():report(UBConfig.kHallSettingShakeSwitch);
	kSettingDataInterface:setShake(state);
end

SettingScene.onDisableChatChanged = function(self,state)
	UBReport.getInstance():report(UBConfig.kHallSettingDisableChat);
	kSettingDataInterface:setShieldChat(not state);
end

SettingScene.onClearingSwitchChanged = function(self,state)
	kSettingDataInterface:setShiledGameOver(state);
end

SettingScene.onExpandGiftPacketBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingExpandGift);
	self.m_generalizeWebView = new( require("hall/widget/webView") );
	local w, h = self.m_htmlView:getSize();
	local x, y = self.m_htmlView:getAbsolutePos();
	x = x * System.getLayoutScale();
	y = y * System.getLayoutScale();
	w = w * System.getLayoutScale();
	h = h * System.getLayoutScale();

	local backBtn = self:findViewById(self.m_ctrl.backBtn);
	local bx, by = backBtn:getAbsolutePos();
	local bw, bh = backBtn:getSize();
	bx = bx * System.getLayoutScale();
	by = by * System.getLayoutScale();
	bw = bw * System.getLayoutScale();
	bh = bh * System.getLayoutScale();

	Log.v("SettingScene", "onGeneralizeBtnClick -> ", x, y, w, h, bx, by, bw, bh);

	self.m_generalizeWebView:create(self:getUrl(), x, y, w, h, bx, by, bw, bh);
	self.m_htmlView:addChild(self.m_generalizeWebView);

	self:findViewById(self.m_ctrl.contentView):setVisible(false);
	self.m_htmlView:setVisible(true);

	HallDataInterface.getInstance():setWebViewShowing(true);
end

SettingScene.getUrl = function(self)
	local ssid = kUserInfoData:getSsid();
	local str = "action=activity_agent.index";
	local php_url = ServerConfig.getInstance():getHostUrl();
	local url = php_url .. "?" .. str .. "&ssid=" ..ssid .. "&app=" .. kClientInfo:getAppId();

	return url;
end

SettingScene.onGoBackWebViewUrl = function (self)
	delete(self.m_generalizeWebView);
	self.m_generalizeWebView = nil;

	self:findViewById(self.m_ctrl.contentView):setVisible(true);
	self:findViewById(self.m_ctrl.backBtn):setVisible(true);
	self.m_htmlView:setVisible(false);
	HallDataInterface.getInstance():setWebViewShowing(false);
end

SettingScene.checkIsRefuseBack = function(self)
	if self.m_generalizeWebView then 
		self:onGoBackWebViewUrl();
		return true;
	else 
		return false;
	end 
end

SettingScene.onAgentBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingAgentBtn); 
	self:requestOpenH5Agency();
end

SettingScene.requestOpenH5Agency = function(self)
	self:requestCtrlCmd(SettingController.s_cmds.OpenH5Agency);
end

SettingScene.onClearCacheBtnClick = function(self)
	UBReport.getInstance():report(UBConfig.kHallSettingClearCache);
	self:_showDeleteCacheTips();
end

SettingScene._showDeleteCacheTips = function(self)
	MessageBox.show(
		GameString.get("messageBoxTitle"),
		"建议在无法使用游戏的情况下使用\r\n是否继续清除缓存？",
		GameString.get("messageBoxOkBtnName"),
		GameString.get("messageBoxCancleBtnName"),
		false,
		self,
		self._deleteCache
	);
end

-- @description : 清除缓存
SettingScene._deleteCache = function(self)
	kLoginDataInterface:setLastLoginInfo({});
	Toast.getInstance():showText(GameString.get("cleanCache"),50,30,kAlginLeft,"",26,255,255,255);
end

SettingScene.s_controlConfig = 
{
	[SettingScene.s_controls.contentView] = {"contenView"};
	
	[SettingScene.s_controls.backBtn] = {"contenView", "top" , "backBtn"},

	[SettingScene.s_controls.contentLayout] = {"contenView", "content","layout"},
	-- 游戏版本
	[SettingScene.s_controls.appVersion] = {"contenView", "content", "layout", "area_commonSetting", "area_appInfo" , "appVersion"},
	[SettingScene.s_controls.appVersionBtn] = {"contenView", "content", "layout", "area_commonSetting", "area_appInfo" , "appVersionBtn"},
	[SettingScene.s_controls.updateBtn] = {"contenView", "content", "layout", "area_commonSetting", "area_appInfo" , "updateBtn"},
	[SettingScene.s_controls.hallUpdateStatus] = {"contenView", "content", "layout", "area_commonSetting", "area_appInfo" , "updateBtn","hallUpdateStatus"},

	[SettingScene.s_controls.area_voiceSetting] = {"contenView", "content","layout","area_voiceSetting"};
	-- 静音
	[SettingScene.s_controls.slienceOnOffBtn] = {"contenView", "content","layout","area_voiceSetting","area_mute","slienceOnOffBtn"},
	-- 音乐
	[SettingScene.s_controls.musicSlider] = {"contenView", "content","layout" , "area_voiceSetting" ,"area_music","area_slider","musicSlider"},
	-- 音效
	[SettingScene.s_controls.effectSlider] = {"contenView", "content","layout" , "area_voiceSetting" , "area_effect","area_slider", "effectSlider"},
	-- 语音读牌
	[SettingScene.s_controls.voiceReadCardSwitchBtn] = {"contenView", "content","layout" , "area_voiceSetting","area_reader","voiceReadCardSwitchBtn"},
	-- 音效最大最小按钮
	[SettingScene.s_controls.effectMinVolume] = {"contenView", "content","layout","area_voiceSetting","area_effect","area_slider","btnMinEffect"};
	[SettingScene.s_controls.effectMaxVolume] = {"contenView", "content","layout","area_voiceSetting","area_effect","area_slider","btnMaxEffect"};
	-- 音乐最大最小按钮
	[SettingScene.s_controls.musicMinVolume] = {"contenView", "content","layout","area_voiceSetting","area_music","area_slider","btnMinEffect"};
	[SettingScene.s_controls.musicMaxVolume] = {"contenView", "content","layout","area_voiceSetting","area_music","area_slider","btnMaxEffect"};

	[SettingScene.s_controls.area_commonSetting] = {"contenView", "content","layout" , "area_commonSetting"};
	-- 震动
	[SettingScene.s_controls.shakeSwitchBtn] = {"contenView", "content","layout" , "area_voiceSetting" , "area_shake", "shakeSwitchBtn"},
	-- 禁用聊天选项
	[SettingScene.s_controls.disableChatSwitchBtn] = {"contenView", "content","layout" , "area_voiceSetting" , "area_disable", "disableChatSwitchBtn"},
	-- 结算界面
	[SettingScene.s_controls.clearingSwitchBtn] = {"contenView", "content","layout" , "area_commonSetting" ,"area_clearing", "clearingSwitchBtn"},

	[SettingScene.s_controls.clearingArea] = {"contenView", "content","layout" , "area_commonSetting" ,"area_clearing"},
	[SettingScene.s_controls.expandGiftPacketBtn] = {"contenView", "content","layout" , "area_commonSetting" ,"expandGiftPacket"},

    [SettingScene.s_controls.feedBackBtn] = {"contenView", "content","layout" , "area_commonSetting", "feedBackBtn"};
	[SettingScene.s_controls.feedbackStatus] = {"contenView", "content","layout" , "area_commonSetting", "feedBackBtn", "feedbackStatus"};

	[SettingScene.s_controls.aboutUsBtn] = {"contenView", "top", "aboutUsBtn"};
	[SettingScene.s_controls.gameHelpBtn] = {"contenView", "content","layout" , "area_commonSetting" , "gameHelpBtn"};
	

	[SettingScene.s_controls.voiceSettingLayer] = {"contenView", "content","layout" , "area_voiceSetting"};
	[SettingScene.s_controls.commonLayer] = {"contenView", "content","layout" , "area_commonSetting"};
	[SettingScene.s_controls.htmlView] = {"htmlView"};

	[SettingScene.s_controls.agentBtn] = {"contenView", "content","layout" , "area_commonSetting" ,"agentBtn"};
	[SettingScene.s_controls.clearCacheBtn] = {"contenView", "content","layout" , "area_commonSetting", "clear_cache"};
	
	[SettingScene.s_controls.voiceReadCardLabel] = {"contenView", "content","layout" , "area_voiceSetting" ,"area_reader", "voiceReadCardLabel"};
	
	[SettingScene.s_controls.area_floatBall] = {"contenView", "content","layout" , "area_commonSetting" ,"area_floatBall"};
	[SettingScene.s_controls.floatBallSwitchBtn] = {"contenView", "content","layout" , "area_commonSetting" ,"area_floatBall", "floatBallSwitchBtn"};
	
	[SettingScene.s_controls.area_matchOnlooker] = {"contenView", "content","layout" , "area_commonSetting" ,"area_match_onlooker"};
	[SettingScene.s_controls.matchOnlookerSwitchBtn] = {"contenView", "content","layout" , "area_commonSetting" ,"area_match_onlooker", "switch"};
};

SettingScene.s_controlFuncMap = 
{
	[SettingScene.s_controls.backBtn] = SettingScene.onReturnBtnClick ;
	[SettingScene.s_controls.updateBtn] = SettingScene.onUpdateBtnClick ;

	[SettingScene.s_controls.musicSlider] = SettingScene.onMusicSliderClick;
	[SettingScene.s_controls.effectSlider] =  SettingScene.onEffectSilderClick;
	[SettingScene.s_controls.effectMinVolume] = SettingScene.onEffectMinVolume;
	[SettingScene.s_controls.effectMaxVolume] = SettingScene.onEffectMaxVolume;
	[SettingScene.s_controls.musicMinVolume]  = SettingScene.onMusicMinVolume;
	[SettingScene.s_controls.musicMaxVolume]  = SettingScene.onMusicMaxVolume;
    [SettingScene.s_controls.feedBackBtn] = SettingScene.onFeedBackBtnClick;
	[SettingScene.s_controls.aboutUsBtn] = SettingScene.onAboutUsBtnClick;
	[SettingScene.s_controls.gameHelpBtn] = SettingScene.onGameHelpBtnClick;
	[SettingScene.s_controls.expandGiftPacketBtn] = SettingScene.onExpandGiftPacketBtnClick;
	[SettingScene.s_controls.agentBtn] = SettingScene.onAgentBtnClick;
	[SettingScene.s_controls.clearCacheBtn] 	= SettingScene.onClearCacheBtnClick;
}

SettingScene.s_cmdConfig = 
{
	[SettingScene.s_cmds.GoBackWebViewUrl] = SettingScene.onGoBackWebViewUrl;
	[SettingScene.s_cmds.checkIsRefuseBack] = SettingScene.checkIsRefuseBack;
}

return SettingScene;