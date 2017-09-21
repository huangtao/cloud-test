require("gameBase/gameMusic");
require("gameBase/gameEffect");
require("util/log");
require("util/StringLib");


SoundModule = class();
SoundModule.getInstance = function()
	if not SoundModule.s_instance then
		SoundModule.s_instance = new(SoundModule);
	end

	return SoundModule.s_instance;
end

SoundModule.ctor = function(self)
	kMusicPlayer  = GameMusic.getInstance();
	kEffectPlayer = GameEffect.getInstance();
	self:init();
end

SoundModule.init = function(self)
	self.m_prefix = "";
	self.m_extName = "";
	if System.getPlatform() == kPlatformAndroid then
		self.m_prefix = "ogg/";
		self.m_extName = ".ogg";
	else
		self.m_prefix = "mp3/";
		self.m_extName = ".mp3";
	end
end

SoundModule.preload = function(self,filePath) --XXX
	if not string.checkEmpty(filePath)  then 
		return;
	end 
	local config = require(filePath);
	if table.isEmpty(config) then
		return;
	end

	self:preloadEffectAndMusic(config.effects, config.effectsFileMap, config.music, config.musicFileMap);
end

SoundModule.preloadEffectAndMusic = function(self, effects, effectsFileMap, music, musicFileMap)
	kEffectPlayer:setPathPrefixAndExtName(self.m_prefix,self.m_extName);
	kEffectPlayer:setSoundFileMap(effectsFileMap or {});

	kMusicPlayer:setPathPrefixAndExtName(self.m_prefix,self.m_extName);
	kMusicPlayer:setSoundFileMap(musicFileMap or {});	
	for k,v in pairs(music or {}) do
		kMusicPlayer:preload(v or 1);
	end
end

SoundModule.unload = function(self) --XXX
	kMusicPlayer:stop(true);
	kEffectPlayer:unloadAll();
end

SoundModule.dtor = function(self)
	self:unload();
end

kSoundModule = SoundModule.getInstance();