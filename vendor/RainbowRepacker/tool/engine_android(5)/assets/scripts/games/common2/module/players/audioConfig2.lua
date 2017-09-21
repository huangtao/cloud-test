require("audioConfig");

GameCommonMusic2 = {
    
};

GameCommonMusicFileMap2 = {
   
}

GameCommonEffects2 = {

    AudioMJBUHUA 	= 1004,
    AudioMJCHIPENG 	= 1005,
    AudioMJDIANPAO 	= 1006,
    AudioMJGANG 	= 1007,
    AudioMJGUAFENG 	= 1008,
    AudioMJHU 		= 1009,
    AudioMJRAIN 	= 1010,
    AudioMJTING 	= 1011,
    AudioMJZIMO 	= 1012,
    AudioMJLIUJU    = 1013,
}
---此文件留着用于麻将的动画音效
GameCommonEffectsFileMap2 = {


    [GameCommonEffects2.AudioMJBUHUA] = "games_common/effect/Audio_MJ_BUHUA",
    [GameCommonEffects2.AudioMJCHIPENG] = "games_common/effect/Audio_MJ_CHIPENG",
    [GameCommonEffects2.AudioMJDIANPAO] = "games_common/effect/Audio_MJ_DIANPAO",
    [GameCommonEffects2.AudioMJGANG] = "games_common/effect/Audio_MJ_GANG",
    [GameCommonEffects2.AudioMJGUAFENG] = "games_common/effect/Audio_MJ_GUAFENG",
    [GameCommonEffects2.AudioMJHU] = "games_common/effect/Audio_MJ_HU",
    [GameCommonEffects2.AudioMJRAIN] = "games_common/effect/Audio_MJ_RAIN",
    [GameCommonEffects2.AudioMJTING] = "games_common/effect/Audio_MJ_TING",
    [GameCommonEffects2.AudioMJZIMO] = "games_common/effect/Audio_MJ_ZIMO",
    [GameCommonEffects2.AudioMJLIUJU] = "games_common/effect/Audio_MJ_LIUJU",
}


GameCommonEffects2 = CombineTables(Effects or {}, GameCommonEffects2 or {});
GameCommonEffectsFileMap2 = CombineTables(EffectsFileMap or {}, GameCommonEffectsFileMap2 or {});