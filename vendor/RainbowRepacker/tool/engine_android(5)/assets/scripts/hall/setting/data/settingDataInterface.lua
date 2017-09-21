require("gameData/dataInterfaceBase");


SettingDataInterface = class(DataInterfaceBase);

SettingDataInterface.getInstance = function()
	if not SettingDataInterface.s_instance then
		SettingDataInterface.s_instance = new(SettingDataInterface);
	end
	return SettingDataInterface.s_instance;
end

SettingDataInterface.ctor = function(self)
	self.m_setting = new(require("hall/setting/data/settingInfo"),self);
	self.m_settingInfo = self.m_setting:getSettingInfo();
	self.m_settingInfo = table.verify(self.m_settingInfo);
	self:_setSoundVolume();
end

SettingDataInterface.getSettingInfo = function(self)
	return self.m_settingInfo;
end

--静音
SettingDataInterface.getMute = function(self)
	return self.m_settingInfo.mute;
end

SettingDataInterface.setMute = function(self,isMute)
	self.m_settingInfo.mute = isMute;
	self.m_setting:updateData(true,self.m_settingInfo);
	self:_setSoundVolume();
end

--音乐音量
SettingDataInterface.getMusicVolume = function(self)
	return self.m_settingInfo.musicVolume or 0.8;
end

SettingDataInterface.setMusicVolume = function(self,volume)
	self.m_settingInfo.musicVolume = volume;
	self.m_setting:updateData(true,self.m_settingInfo);
	self:_setSoundVolume();
end

--音效音量
SettingDataInterface.getEffectVolume = function(self)
	return self.m_settingInfo.effectVolume or 0.8;
end

SettingDataInterface.setEffectVolume = function(self,volume)
	self.m_settingInfo.effectVolume = volume;
	self.m_setting:updateData(true,self.m_settingInfo);
	self:_setSoundVolume();
end

--语音读牌
SettingDataInterface.getReadPoker = function(self)
	return self.m_settingInfo.readPoker;
end

SettingDataInterface.setReadPoker = function(self,isReadPoker)
	self.m_settingInfo.readPoker = isReadPoker;
	self.m_setting:updateData(true,self.m_settingInfo);
end

--浮动球开关
SettingDataInterface.setFloatBallSwitch = function(self, floatBallSwitch)
	self.m_settingInfo.floatBallSwitch = floatBallSwitch;
	self.m_setting:updateData(true, self.m_settingInfo);

    FloatBall.checkIsShowFloatBall();
end

SettingDataInterface.getFloatBallSwitch = function(self)
	return self.m_settingInfo.floatBallSwitch;
end

--比赛围观开关
SettingDataInterface.setMatchOnlookerSwitch = function(self,matchOnlookerSwitch)
	self.m_settingInfo.matchOnlookerSwitch = matchOnlookerSwitch;
	self.m_setting:updateData(true, self.m_settingInfo);
end

SettingDataInterface.getMatchOnlookerSwitch = function(self)
	return self.m_settingInfo.matchOnlookerSwitch;
end

--游戏震动
SettingDataInterface.getShake = function(self)
	return self.m_settingInfo.shake;
end

SettingDataInterface.setShake = function(self,isShake)
	self.m_settingInfo.shake = isShake;
	self.m_setting:updateData(true,self.m_settingInfo);
end

--屏蔽聊天
SettingDataInterface.getShieldChat = function(self)
	return self.m_settingInfo.shieldChat or false;
end

SettingDataInterface.setShieldChat = function(self,isShieldChat)
	self.m_settingInfo.shieldChat = isShieldChat;
	self.m_setting:updateData(true,self.m_settingInfo);
end

--屏蔽结算界面
SettingDataInterface.getShieldGameOver = function(self)
	return self.m_settingInfo.shielGameOver;
end

SettingDataInterface.setShiledGameOver = function(self,isShielGameOver)
	self.m_settingInfo.shielGameOver = isShielGameOver;
	self.m_setting:updateData(true,self.m_settingInfo);
end

SettingDataInterface._setSoundVolume = function(self)
	local musicVolume,effectVolume;
	if self.m_settingInfo.mute then 
		musicVolume = 0;
		effectVolume = 0;
	else
		musicVolume = self.m_settingInfo.musicVolume or 0.8;
		effectVolume = self.m_settingInfo.effectVolume or 0.8;
	end

	kMusicPlayer:setVolume(musicVolume);
	kEffectPlayer:setVolume(effectVolume);

end

kSettingDataInterface = SettingDataInterface.getInstance();