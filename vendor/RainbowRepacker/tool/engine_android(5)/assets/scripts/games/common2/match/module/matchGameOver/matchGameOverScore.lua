
local MatchGameOverScore = class(Node);

MatchGameOverScore.ctor = function(self)
	self:setFillParent(true, true);
end

MatchGameOverScore.dtor = function(self)
end
---------------------------------------------------------------
MatchGameOverScore.showScore = function(self,data)
	self:setVisible(true);
	self:removeAllChildren();

    self:_createGameOverAnim(data);
end

MatchGameOverScore.hideScore = function(self)
    self:_clearMatchGameOverScore();
    self:setVisible(false);
end
---------------------------------------------------------------
--参数说明
-- data = {
-- 	[seat] = {					--seat:本地座位号
-- 		["mid"] = mid;			--mid:玩家mid
-- 		["score"] = score;		--score:积分
-- 		["align"] = align;		--align:飘分动画中分数的对齐方式
-- 		["x"] = x;				--x,y:飘分动画中分数的位置
-- 		["y"] = y;
-- 	};
-- 	...
-- };
MatchGameOverScore._createGameOverAnim = function(self,data)
	data = table.verify(data);

	for k,v in pairs(data) do 
        local scoreNode = self:_createSocre(v.score);
        scoreNode:setAlign(v.align);
        scoreNode:setPos(v.x,v.y);
        self:addChild(scoreNode);

        scoreNode:removeProp(1);
		scoreNode:removeProp(2);
		if v.mid ~= UserBaseInfoIsolater.getInstance():getUserId() then
			scoreNode:addPropScaleSolid(1,0.8,0.8,kCenterDrawing);
			scoreNode:addPropTranslate(2,kAnimNormal,300,0,0,0,0,-65);
		else
			scoreNode:addPropTranslate(2,kAnimNormal,300,0,0,0,65,0);
		end
    end 
end

MatchGameOverScore._createSocre = function (self, score)
	score = number.valueOf(score);
	local numStr = score .. "";

	local file = "";
	if score >= 0 then
		file = "games/common/match/match_gameover/win_num/Y_%s.png";
		numStr = "+" .. score;
	else
		file = "games/common/match/match_gameover/lost_num/S_%s.png";
	end
	local node = MoneyTools.getNumberNode(file,numStr,-15);
	return node;
end

MatchGameOverScore._clearMatchGameOverScore = function(self)	
	self:setVisible(false);
	self:removeAllChildren();
end

return MatchGameOverScore;