Music = {
    HALL_BLANK_MUSIC =  "hall_blank_music";
};

MusicFileMap = {
   [Music.HALL_BLANK_MUSIC] = "hall/music/blank_music";
}

Effects = {
    AudioButtonClick 	= 10001, -- common/
    AudioGetGlod 		= 10002,
    AudioGoldDrop       = 10003,

    AudioYouLose 		= 1001,
    AudioYouWin 		= 1002,
    AudioHighestScore 	= 1003,
    AudioLevelUp        = 1004,

    Audio_getReward     = 1005,

}

EffectsFileMap = {
    [Effects.AudioButtonClick] 	= "hall/effect/Audio_Button_Click",
    [Effects.AudioGetGlod] 		= "hall/effect/Audio_Get_Glod",

    [Effects.AudioYouLose] = "hall/effect/Audio_You_Lose",
    [Effects.AudioYouWin] = "hall/effect/Audio_You_Win",
    
    [Effects.AudioHighestScore] = "hall/effect/Audio_Highest_Score",
    [Effects.AudioLevelUp] = "hall/effect/Audio_LevelUp",
    [Effects.AudioGoldDrop] = "hall/effect/Audio_GoldDrop",
    [Effects.Audio_getReward] = "hall/effect/Audio_getReward",
}

EffectsCommon = Effects;
EffectsCommonFileMap = EffectsFileMap;


require("common/soundModule");
kSoundModule:preloadEffectAndMusic(Effects, EffectsFileMap, Music, MusicFileMap);