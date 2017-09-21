

RankListConstants = {};

--@排行榜类型枚举
RankListConstants.eRankType = {
	Money = "JB";
	Exp   = "JY";
	Rich  = "FH";
	Vip   = "VIP";
	Master = "MASTER";
	RedEnvelope = "HB";
};

--@获取昨日/今日数据标识
RankListConstants.eFlag = {
	Today = 1;
	LastDay = -1;
}