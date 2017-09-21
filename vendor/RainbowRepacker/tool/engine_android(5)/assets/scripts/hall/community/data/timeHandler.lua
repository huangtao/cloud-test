require("util/toolKit");
TimeHandler = class();
TimeHandler.Weekday = {
	["Monday"] =  "星期一",
	["Tuesday"] = "星期二",
	["Wednesday"] =  "星期三",
	["Thursday"] = "星期四",
	["Friday"] = "星期五",
	["Saturday"] ="星期六",
	["Sunday"] = "星期天",
}
	
TimeHandler.handler = function(time1,time2)
	time1 = tonumber(time1) or 0;
	time2 = tonumber(time2) or 0;
	local timeStr = "";
	Log.v("-----TimeHandler.handler-----time1- time2",time1-time2);
	if time1 - time2 <= 60*5 then
		timeStr = "";
	else
        local serverTime = AppData.getInstance():getRightTimeWithServer();
		if os.date("%d",serverTime) == os.date("%d",time1) and os.date("%m",serverTime)==os.date("%m",time1) then--今天的消息
			timeStr = os.date("%H:%M",time1); --今天的消息只显示时间
		elseif os.date("%d",serverTime) - os.date("%d",time1) == 1 and os.date("%m",serverTime)==os.date("%m",time1) then --昨天的消息
			timeStr = string.concat("昨天",os.date("%H:%M",time1));
		else
			week = os.date("%A",time1);
			timeStr = string.concat(TimeHandler.Weekday[week]," ",os.date("%H:%M",time1));
		end
	end
	return timeStr;
end

TimeHandler.formatHandler = function (time1, time2)
    time1 = tonumber(time1) or 0;
	time2 = tonumber(time2) or 0;
	local timeStr = "";
	Log.v("-----TimeHandler.formatHandler-----time1- time2",time1-time2);
	if time1 - time2 <= 60*5 then
		timeStr = "";
	else
        local serverTime = AppData.getInstance():getRightTimeWithServer();
		if os.date("%d",serverTime) == os.date("%d",time1) and os.date("%m",serverTime)==os.date("%m",time1) then--今天的消息
			timeStr = os.date("%H:%M",time1); 
		elseif os.date("%d",serverTime) - os.date("%d",time1) == 1 and os.date("%m",serverTime)==os.date("%m",time1) then --昨天的消息
			timeStr = string.concat("昨天"," ", os.date("%H:%M",time1));
        elseif os.date("%d",serverTime) - os.date("%d",time1) == 2 and os.date("%m",serverTime)==os.date("%m",time1) then --前天的消息
			timeStr = string.concat("前天"," ", os.date("%H:%M",time1));
		elseif os.date("%Y",serverTime) == os.date("%Y",time1) then --今年发的消息
			timeStr = os.date("%m月%d日 %H:%M",time1);
        else
            timeStr = os.date("%Y年%m月%d日 %H:%M",time1);  --去年发送的消息
		end
	end
	return timeStr;
end

--用于红包发送记录时间显示格式
-- 【今天 xx：xx】
-- 【昨天 xx：xx】
-- 【x天前】（x<=30）
-- 【超过x天】（x>30)

TimeHandler.getRedEnvelopeRecordTimeString = function(p_time)

	local timeStr = "";

	local serverTime = AppData.getInstance():getRightTimeWithServer();

	local __dayInterval = ToolKit.getDayInterval( p_time, serverTime );

	if __dayInterval == 0 then
		timeStr = os.date("%H:%M",p_time); 
		timeStr = "今天"..timeStr;
	elseif __dayInterval == 1 then
		timeStr = os.date("%H:%M",p_time); 
		timeStr = "昨天"..timeStr;
	elseif __dayInterval > 30 then
		timeStr = "超过30天";
	else
		__dayInterval = math.abs(__dayInterval);
		timeStr = __dayInterval.."天前";
	end

	return timeStr;

end