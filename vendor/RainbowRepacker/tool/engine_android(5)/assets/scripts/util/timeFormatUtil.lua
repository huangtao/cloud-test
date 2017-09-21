local M = {};

--@brief 获取当天0时0分0秒的时间戳
function M.getDayStartTime(timestamp)
    local timeTable = os.date("*t", timestamp);
    timeTable.hour = 0;
    timeTable.sec = 0;
    timeTable.min = 0; 
    return os.time(timeTable);
end

--@brief 获取二个时间戳相隔多少天
function M.getDayInterval(timestampA, timestampB)
    local timeA = M.getDayStartTime(timestampA);
    local timeB = M.getDayStartTime(timestampB);
    local secondADay = 24 * 3600;
    local day = math.floor((timeB - timeA) / secondADay);
    return day;
end

--@brief 判断timestampB是否在timestampA的2天内
function M.isInTwoDay(timestampA, timestampB)
    local diffDay = M.getDayInterval(timestampA, timestampB);
    if diffDay <= 2 and diffDay >= 1 then
        local str = (diffDay == 1) and "明天" or "后天";
        return true, str;
    else
        return false, "";
    end
end

--@brief 判断timestampA和timestampB是否为同一天
function M.isSameDay(timestampA, timestampB)
    local timeTableA = os.date("*t", timestampA);
    local timeTableB = os.date("*t", timestampB);
    if timeTableA.year == timeTableB.year and 
        timeTableA.month == timeTableB.month and 
        timeTableA.day == timeTableB.day then
        return true;
    end
    return false;
end

--@brief 判断timestampA和timestampB是否为同一月
function M.isSameMonth(timestampA, timestampB)
    local timeTableA = os.date("*t", timestampA);
    local timeTableB = os.date("*t", timestampB);
    if timeTableA.year == timeTableB.year and 
        timeTableA.month == timeTableB.month then
        return true;
    end
    return false;    
end

--@brief 将时间戳转化成 xx年xx月xx日xx时xx分xx秒格式
function M.getTimeYMDHMS(timestamp)
    local format = "%Y年%m月%d日%H时%M分%S秒";
    return os.date(format, number.valueOf(timestamp) );
end

--@brief 将时间戳转换成 xx月xx日xx:xx:xx格式
function M.getTimeMDHMS(timestamp)
    local format = "%m月%d日%H:%M:%S";
    return os.date(format, number.valueOf(timestamp) );
end

--@brief 将时间戳转换成 xx年xx月xx日
function M.getTimeYMD(timestamp)
    local format = "%Y年%m月%d日";
    return os.date(format, number.valueOf(timestamp) );
end

--@brief 将时间戳转换成 xx年xx月
function M.getTimeYM(timestamp)
    local format = "%Y年%m月";
    return os.date(format, number.valueOf(timestamp) );
end

--@brief 将时间戳转换成 xx月xx日
function M.getTimeMD(timestamp)
    local format = "%m月%d日";
    return os.date(format, number.valueOf(timestamp) );   
end

--@brief 拆分时间 00时:00分:00秒
function M.skipTime(timestamp)
    timestamp = number.valueOf(timestamp);
    local timeTable = os.date("*t",timeNum);
    return string.format("%02d:%02d:%02d", timeTable.hour, timeTable.min, timeTable.sec);
end

--@brief 拆分时间 00时:00分
function M.skipTimeHM(timestamp)
    timestamp = number.valueOf(timestamp);
    local timeTable = os.date("*t",timeNum);
    return string.format("%02d:%02d", timeTable.hour, timeTable.min);    
end

--@brief 将时间戳转换成xx-xx-xx
function M.getTimeYMD2(timestamp)
    timestamp = number.valueOf(timestamp);
    local format = "%Y-%m-%d";
    return os.date(format, timestamp);
end

return M;