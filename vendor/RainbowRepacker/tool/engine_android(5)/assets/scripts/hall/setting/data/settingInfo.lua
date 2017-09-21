require("core/object");
require("core/dict");
require("gameData/gameData");

local SettingInfo = class(GameData);

SettingKeys = {
	kSetting = "setting";
	kMute = "mute";   --静音
	kMusicVolume = "musicVolume";  --音乐音量
	kEffectVolume = "effectVolume";  --音效音量
	kReadPoker = "readPoker";  --语音读牌
	kShake = "shake";        --游戏震动
	kShieldChat = "shieldChat";	 --屏蔽聊天
	kShielGameOver = "shielGameOver"; --屏蔽结算界面
	kFloatBall = "floatBall"; --浮动球开关
	kMatchOnlooker = "matchOnlooker";--比赛围观开关
};

SettingInfo.initData = function(self)
	self.m_settingInfo = {};
end

SettingInfo.getLocalDictName = function(self)
	return SettingKeys.kSetting;
end

SettingInfo.loadDictData = function(self, dict)
	local data = {};
	data.mute = dict:getBoolean(SettingKeys.kMute,false);
	data.musicVolume = dict:getDouble(SettingKeys.kMusicVolume,0.8);
	data.effectVolume = dict:getDouble(SettingKeys.kEffectVolume,0.8);
	data.readPoker = dict:getBoolean(SettingKeys.kReadPoker,true);
	data.shake = dict:getBoolean(SettingKeys.kShake,true);
	data.shieldChat = dict:getBoolean(SettingKeys.kShieldChat,false);
	data.shielGameOver = dict:getBoolean(SettingKeys.kShielGameOver,false);
	data.floatBallSwitch = dict:getBoolean(SettingKeys.kFloatBall, true);
	data.matchOnlookerSwitch = dict:getBoolean(SettingKeys.kMatchOnlooker,true);

	self.m_settingInfo = data;
end

SettingInfo.saveDictData = function(self,dict)
	local data = self.m_settingInfo;
	dict:setBoolean(SettingKeys.kMute,data.mute);
	dict:setDouble(SettingKeys.kMusicVolume,data.musicVolume);
	dict:setDouble(SettingKeys.kEffectVolume,data.effectVolume);
	dict:setBoolean(SettingKeys.kReadPoker,data.readPoker);
	dict:setBoolean(SettingKeys.kShake,data.shake);
	dict:setBoolean(SettingKeys.kShieldChat,data.shieldChat);
	dict:setBoolean(SettingKeys.kShielGameOver,data.shielGameOver);
	dict:setBoolean(SettingKeys.kFloatBall, data.floatBallSwitch);
	dict:setBoolean(SettingKeys.kMatchOnlooker, data.matchOnlookerSwitch);
end

SettingInfo.getSettingInfo = function(self)
	return self.m_settingInfo;
end

SettingInfo.updateMemData = function(self,data)
	if table.isTable(data) then 
		data.mute = (data.mute == nil) and false or data.mute;
		data.musicVolume = data.musicVolume or 0.8;
		data.effectVolume = data.effectVolume or 0.8;
		data.readPoker = (data.readPoker == nil) and true or data.readPoker;
		data.shake = (data.shake == nil) and true or data.shake;
		data.shieldChat = (data.shieldChat == nil) and false or data.shieldChat;
		data.shielGameOver = (data.shielGameOver == nil) and false or data.shielGameOver;
		data.floatBallSwitch = (data.floatBallSwitch == nil) and false or data.floatBallSwitch;
		data.matchOnlookerSwitch = (data.matchOnlookerSwitch == nil) and true or data.matchOnlookerSwitch;

		self.m_settingInfo = data;
	end 
end

return SettingInfo;