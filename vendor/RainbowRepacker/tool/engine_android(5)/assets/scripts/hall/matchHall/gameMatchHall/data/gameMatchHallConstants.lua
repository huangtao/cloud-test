GameMatchHallConstants = {};

 -- 1:不循环 2:周循环 3:月循环 4:自定义
GameMatchHallConstants.eLoopType = {
    NOT     = 1;  
    WEEK    = 2;     
    MONTH   = 3;   
    CUSTOM  = 4;
}

GameMatchHallConstants.eIconFiles = {
    [-1] = "hall/matchHall/fee/default.png",
    [0] = "hall/matchHall/fee/coin.png",
    [1] = "hall/matchHall/fee/crystal.png",
    [2] = "hall/matchHall/fee/diamond.png",
}

-- 战绩累计奖励类型
GameMatchHallConstants.eRewardType = {
    TAGS = 1,
    REWARD = 2,
}

--报名校验的返回类型表
GameMatchHallConstants.enrollErrorType = {
    CASH_OUT = 1, --资产足够但银币或金条现金不够
    TOTAL_OUT = 2, --银币或金条资产不足
    DIAMOND_OUT = 3, --钻石不足
    PROP_OUT = 4, --道具不足
    CASH_RUIN = 5, --银币资产满足,现金满足但现金触发破产
    TOTAL_RUIN = 6, --银币资产满足，现金不满足，资产触发破产
}

-- 分享入口类型
GameMatchHallConstants.eShareEntryType = {
    BEFORE_MATCH = 1, --赛前等待
    MATCH_OVER = 2, --比赛结束
}