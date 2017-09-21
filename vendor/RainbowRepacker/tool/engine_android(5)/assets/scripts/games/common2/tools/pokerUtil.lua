
PokerUtil = class();

PokerUtil.getInstance = function()
	if not PokerUtil.s_instance then
		PokerUtil.s_instance = new(PokerUtil);
	end
	return PokerUtil.s_instance;
end

PokerUtil.releaseInstance = function()
	delete(PokerUtil.s_instance);
	PokerUtil.s_instance = nil;
end

PokerUtil.pokerConvert = function(self,byte) --牌型与牌值转换
	local pokerType = bit.brshift(byte, 4);	--牌型
    local pokerValue = bit.band(byte, 0x0F);--牌值
    if pokerValue < 3 then
        pokerValue = pokerValue + 13;
    elseif pokerValue > 13 then
        pokerValue = pokerValue + 15;
    end

    return pokerType, pokerValue;
end