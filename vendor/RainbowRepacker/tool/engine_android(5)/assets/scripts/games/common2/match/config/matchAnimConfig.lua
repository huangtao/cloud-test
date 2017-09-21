MatchAnimIds = 
{
};

MatchAnimDefs = 
{
};

AnimIds = CombineTables(AnimIds or {}, MatchAnimIds or {});
AnimDefs = CombineTables(AnimDefs or {}, MatchAnimDefs or {});

AnimManager.getInstance():setAnimDefs(AnimDefs);
