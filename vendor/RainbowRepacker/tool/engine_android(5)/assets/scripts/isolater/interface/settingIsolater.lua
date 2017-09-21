require("gameData/dataInterfaceBase");
require("hall/setting/data/settingDataInterface");

SettingIsolater = class(DataInterfaceBase);

SettingIsolater.Delegate = {
};

SettingIsolater.getInstance = function()
	if not SettingIsolater.s_instance then
		SettingIsolater.s_instance = new(SettingIsolater); 
	end
	return SettingIsolater.s_instance;
end

SettingIsolater.ctor = function(self)
	kSettingDataInterface:setObserver(self);
end

SettingIsolater.dtor = function(self)
	kSettingDataInterface:clearObserver(self);
end
------------- 设置相关 -------------------------------------------------
SettingIsolater.loadSetting = function(self)
	kSettingDataInterface:getSettingInfo();
end

--静音
SettingIsolater.getMute = function(self)
	return kSettingDataInterface:getMute();
end

SettingIsolater.setMute = function(self,isMute)
	kSettingDataInterface:setMute(isMute);
end

--音乐音量
SettingIsolater.getMusicVolume = function(self)
	return kSettingDataInterface:getMusicVolume();
end

SettingIsolater.setMusicVolume = function(self,volume)
	kSettingDataInterface:setMusicVolume(volume);
end

--音效音量
SettingIsolater.getEffectVolume = function(self)
	return kSettingDataInterface:getEffectVolume();
end

SettingIsolater.setEffectVolume = function(self,volume)
	kSettingDataInterface:setEffectVolume(volume);
end

--语音读牌
SettingIsolater.getReadPoker = function(self)
	return kSettingDataInterface:getReadPoker();
end

SettingIsolater.setReadPoker = function(self,isReadPoker)
	kSettingDataInterface:setReadPoker(isReadPoker);
end

--游戏震动
SettingIsolater.getShake = function(self)
	return kSettingDataInterface:getShake();
end

SettingIsolater.setShake = function(self,isShake)
	kSettingDataInterface:setShake(isShake);
end

--屏蔽聊天
SettingIsolater.getShieldChat = function(self)
	return kSettingDataInterface:getShieldChat();
end

SettingIsolater.setShieldChat = function(self,isShieldChat)
	kSettingDataInterface:setShieldChat(isShieldChat);
end

--屏蔽结算界面
SettingIsolater.getShieldGameOver = function(self)
	return kSettingDataInterface:getShieldGameOver();
end

SettingIsolater.setShiledGameOver = function(self,isShielGameOver)
	kSettingDataInterface:setShiledGameOver(isShielGameOver);
end

--比赛围观开关是否打开
--return:true(打开) or false(关闭)
SettingIsolater.getMatchOnlookerSwitch = function(self)
	return kSettingDataInterface:getMatchOnlookerSwitch();
end

------------- 设置相关 -------------------------------------------------