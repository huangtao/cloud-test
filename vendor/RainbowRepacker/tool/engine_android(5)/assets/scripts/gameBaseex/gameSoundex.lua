require("core/sound");

local GameSoundSrc = GameSound.play;
GameSound.play = function(self, index, loop)
    self.m_curSoundIndex = index;
    GameSoundSrc(self, index, loop);
end

GameSound.getCurSoundIndex = function(self)
    return self.m_curSoundIndex or -1;
end