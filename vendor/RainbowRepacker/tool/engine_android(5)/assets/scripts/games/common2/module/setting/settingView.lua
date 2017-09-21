
--[[
	房间设置界面
]]
local ViewBase = require("games/common2/module/viewBase");

local SettingView = class(ViewBase,false);

SettingView.Delegate = {
}

SettingView.s_controls = 
{
	shiled 					= ToolKit.getIndex();
	bg 						= ToolKit.getIndex();
	musicSlider 			= ToolKit.getIndex();
	effectSlider 			= ToolKit.getIndex();

	musicMinBtn 			= ToolKit.getIndex();
	musicMaxBtn 			= ToolKit.getIndex();
	effectMinBtn 			= ToolKit.getIndex();
	effectMaxBtn 			= ToolKit.getIndex();

	settingCheckGroup 		= ToolKit.getIndex();

	muteSwitch 				= ToolKit.getIndex();
	readPokerSwitch 		= ToolKit.getIndex();
	shakeSwitch 			= ToolKit.getIndex();
	chatSwitch 				= ToolKit.getIndex();	

	closeBtn 				= ToolKit.getIndex();
};

SettingView.ctor = function(self,seat,layoutConfig)	
	super(self,layoutConfig);
	self:setFillParent(true,true);
	self.m_seat = seat;
end

SettingView.init = function(self)
	self.m_ctrl = SettingView.s_controls;
    
	self.m_musicSlider = self:findViewById(self.m_ctrl.musicSlider);
	self.m_effectSlider = self:findViewById(self.m_ctrl.effectSlider);
	self:findViewById(self.m_ctrl.bg):setEventTouch(self, self.onTouchBg);
	self:findViewById(self.m_ctrl.bg):setEventDrag(self, self.onTouchBg);
	self:setVisible(false);
	self:checkState();
end

SettingView.dtor = function(self)
	self:saveState();
	if self.m_curShow then
		DialogLogic.getInstance():popDialogStack();
	end
end

SettingView.onMusicSliderChanged = function(self)
	local fVolume = self.m_musicSlider:getProgress();
	kMusicPlayer:setVolume(fVolume);
	self.m_isChange = true;
end

SettingView.onMusicMinBtnClick = function(self)
	self:onChangePlayerVolume(self.m_musicSlider,kMusicPlayer,0);
end

SettingView.onMusicMaxBtnClick = function(self)
	self:onChangePlayerVolume(self.m_musicSlider,kMusicPlayer,1);
end 

SettingView.onEffectSliderChanged = function(self)
	local fVolume = self.m_effectSlider:getProgress();
	kEffectPlayer:setVolume(fVolume);
	self.m_isChange = true;
end

SettingView.onEffectMinBtnClick = function(self)
	self:onChangePlayerVolume(self.m_effectSlider,kEffectPlayer,0);
end

SettingView.onEffectMaxBtnClick = function(self)
	self:onChangePlayerVolume(self.m_effectSlider,kEffectPlayer,1);
end

SettingView.onCloseBtnClick = function(self)
	self:onCloseSeetingView();
end

SettingView.onMuteSwitchChanged = function(self,state)
	self:setSoundMute(state);
	self.m_isChange = true;
end 

SettingView.onReadPokerSwitchChanged = function(self,state)
	self.m_isChange = true;
end

SettingView.onShakeSwitchChanged = function(self,state)
	self.m_isChange = true;
end

SettingView.onChatSwitchChanged = function(self,state)
	self.m_isChange = true;
end

-------------------- private ------------------------------------------
SettingView.hidden = function(self)
	if self.m_curShow then 
		self.m_curShow = false;	
	end 
	self:saveState();
end

SettingView.checkState = function(self)
	local musicVolume = SettingIsolater.getInstance():getMusicVolume();
	local effectVolume = SettingIsolater.getInstance():getEffectVolume();
	self.m_musicSlider:setProgress(musicVolume);
	self.m_effectSlider:setProgress(effectVolume);

	local flag = {};
	flag[1] = SettingIsolater.getInstance():getMute();
	flag[2] = SettingIsolater.getInstance():getReadPoker();
	flag[3] = SettingIsolater.getInstance():getShake();
	flag[4] = SettingIsolater.getInstance():getShieldChat();
	
	local data = {
		self.m_ctrl.muteSwitch;
		self.m_ctrl.readPokerSwitch;
		self.m_ctrl.shakeSwitch;
		self.m_ctrl.chatSwitch;
	};
	for i = 1,4 do 
		local switch = self:findViewById(data[i]);
		if i == 4 then 
			switch:setChecked(not flag[4]);
		else 
			switch:setChecked(flag[i]);
		end 
	end 

	self:setSoundMute(flag[1]);
end

SettingView.setSoundMute = function(self,flag)
 	local color = flag and 128 or 255;
 	local pickable = not flag;
 	local musicVolume = 0;
 	local effectVolume = 0;
 	if not flag then
		musicVolume = self.m_musicSlider:getProgress();
		effectVolume = self.m_effectSlider:getProgress();
	end
	kMusicPlayer:setVolume(musicVolume);
	kEffectPlayer:setVolume(effectVolume); 

 	self.m_musicSlider:setColor(color,color,color);
 	self.m_effectSlider:setColor(color,color,color);
 	self.m_musicSlider:setPickable(pickable);
 	self.m_effectSlider:setPickable(pickable);

 	self:findViewById(self.m_ctrl.musicMinBtn):setEnable(pickable);
	self:findViewById(self.m_ctrl.musicMaxBtn):setEnable(pickable);
	self:findViewById(self.m_ctrl.effectMinBtn):setEnable(pickable);
	self:findViewById(self.m_ctrl.effectMaxBtn):setEnable(pickable);
end

SettingView.saveState = function(self)
	if not self.m_isChange then
		return;
	end
	self.m_isChange = false;

	local data = {
		self.m_ctrl.muteSwitch;
		self.m_ctrl.readPokerSwitch;
		self.m_ctrl.shakeSwitch;
		self.m_ctrl.chatSwitch;
	};
	local flag = {};
	for i = 1,4 do 
		local switch = self:findViewById(data[i]);
		flag[i] = switch:isChecked();
	end 

	SettingIsolater.getInstance():setMute(flag[1]);
	SettingIsolater.getInstance():setReadPoker(flag[2]);
	SettingIsolater.getInstance():setShake(flag[3]);
	SettingIsolater.getInstance():setShieldChat(not flag[4]);

	local musicVolume = self.m_musicSlider:getProgress();
	local effectVolume = self.m_effectSlider:getProgress();
	SettingIsolater.getInstance():setMusicVolume(musicVolume);
	SettingIsolater.getInstance():setEffectVolume(effectVolume);
end

SettingView.onChangePlayerVolume = function(self,slider,player,volume)
	player:setVolume(volume);
	slider:setProgress(volume);
	self.m_isChange = true;
end 

SettingView.onCloseSeetingView = function (self)
	self:hidden();
	DialogLogic.getInstance():popDialog();
	local action = GameMechineConfig.ACTION_NS_CLOSE_SETTING;
	MechineManage.getInstance():receiveAction(action);
end

SettingView.onShowSettingView = function(self)
	self:checkState();
	self.m_curShow = true;
	self:setVisible(true);
	DialogLogic.getInstance():pushDialogStack(self,self.onCloseSeetingView);
end

SettingView.onTouchBg = function(self)
end

SettingView.s_controlConfig = 
{
	[SettingView.s_controls.shiled]  				= {"shiled"};
	[SettingView.s_controls.bg]  					= {"bg"};
	[SettingView.s_controls.musicSlider]  			= {"bg","musicView","musicSlider"};
	[SettingView.s_controls.effectSlider] 			= {"bg","effectView","effectSlider"};

	[SettingView.s_controls.musicMinBtn]  			= {"bg","musicView","musicMinBtn"};
	[SettingView.s_controls.musicMaxBtn]  			= {"bg","musicView","musicMaxBtn"};
	[SettingView.s_controls.effectMinBtn] 			= {"bg","effectView","effectMinBtn"};
	[SettingView.s_controls.effectMaxBtn] 			= {"bg","effectView","effectMaxBtn"};
	
	[SettingView.s_controls.muteSwitch] 		= {"bg","roomSetCheck","muteCk","switch"};
	[SettingView.s_controls.readPokerSwitch] 	= {"bg","roomSetCheck","readPokerCk","switch"};
	[SettingView.s_controls.shakeSwitch] 		= {"bg","roomSetCheck","shakeCk","switch"};
	[SettingView.s_controls.chatSwitch]   		= {"bg","roomSetCheck","shieldChatCk","switch"};

	[SettingView.s_controls.closeBtn]				= {"bg","closeBtn"};
};


SettingView.s_controlFuncMap = 
{
	[SettingView.s_controls.shiled] 		 			= SettingView.onCloseSeetingView;
	[SettingView.s_controls.musicSlider] 		 		= SettingView.onMusicSliderChanged;
	[SettingView.s_controls.effectSlider] 	 	 		= SettingView.onEffectSliderChanged;

	[SettingView.s_controls.musicMinBtn] 		 		= SettingView.onMusicMinBtnClick;
	[SettingView.s_controls.musicMaxBtn] 		 		= SettingView.onMusicMaxBtnClick;
	[SettingView.s_controls.effectMinBtn] 		 		= SettingView.onEffectMinBtnClick;
	[SettingView.s_controls.effectMaxBtn] 		 		= SettingView.onEffectMaxBtnClick;

	[SettingView.s_controls.closeBtn]					= SettingView.onCloseBtnClick;

	[SettingView.s_controls.muteSwitch] 				= SettingView.onMuteSwitchChanged;
	[SettingView.s_controls.readPokerSwitch] 			= SettingView.onReadPokerSwitchChanged;
	[SettingView.s_controls.shakeSwitch] 				= SettingView.onShakeSwitchChanged;
	[SettingView.s_controls.chatSwitch]    			= SettingView.onChatSwitchChanged;
};


SettingView.s_actionFuncMap = {
	[GameMechineConfig.ACTION_NS_OPEN_SETTING]			= "onShowSettingView";
}

return SettingView;