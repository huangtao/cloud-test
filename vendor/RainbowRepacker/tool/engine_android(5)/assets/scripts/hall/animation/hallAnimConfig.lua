HallAnimIds = 
{
	MoneyDropPar 			= "MoneyDropPar";
};

HallAnimDefs = 
{
	[HallAnimIds.MoneyDropPar] = {"hall/animation/animDropMoneyPar","AnimDropMoneyPar"};
};

AnimIds = CombineTables(AnimIds or {}, HallAnimIds or {});
AnimDefs = CombineTables(AnimDefs or {}, HallAnimDefs or {});

AnimManager.getInstance():setAnimDefs(AnimDefs);