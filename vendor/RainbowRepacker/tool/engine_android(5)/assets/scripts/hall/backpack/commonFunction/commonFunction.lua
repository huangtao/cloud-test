--模块里面存在的一些可以复用的方法
local commonFunction = {};

commonFunction.getTimeString = function(p_second)
	local __timeString = "";
	p_second = tonumber(p_second) or -1;
	if p_second < 0 then
		return __timeString;
	end

    local day = math.floor(p_second / (60 * 60 * 24))
    local hour = math.floor((p_second % (60 * 60 * 24)) / (60 * 60))
    __timeString = string.format("%s天%s小时",day,hour);

    if day == 0 and hour ~= 0 then
        __timeString = string.format("%s小时",hour);
    end

    if day ~= 0 and hour == 0 then
        __timeString = string.format("%s天",day);
    end
    
    return __timeString;
end

commonFunction.createClientPhoneWidget = function()
	
    local _cilentPhone = BackpackDataInterface.getInstance():getHotline();
    if _cilentPhone == nil or _cilentPhone == "" then
        return nil;
    end
    local _tips = string.format("#ca26c40#u%s","".._cilentPhone);
    local richText = new(RichText, _tips, 230, 30, kAlignCenter, nil, 24,nil,nil,nil,true);
    richText:setAlign(kAlignBottomRight);
    return richText;
end
return commonFunction;