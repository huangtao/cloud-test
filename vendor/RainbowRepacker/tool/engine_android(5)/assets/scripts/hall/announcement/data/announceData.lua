require("gameData/gameData");
local TimeFormatUtil = require("util/timeFormatUtil");
--弹出公告
local AnnounceData = class(GameData);

AnnounceData.Delegate = {
	refreshAnnouncement = "refreshAnnouncement";	
};

-- 0：只弹一次，1：每天弹一次，2：每次都弹
AnnounceData.ePopType = {
   ONCE = 0;
   EVERYDAY = 1;
   EVERYONCE = 2;
}

--override
AnnounceData.initData = function(self)
	self.m_localVersion = -1;
	self.m_originInfo = {};
    self.m_timestampMap = {};
end

AnnounceData.loadDictData = function(self, dict)
	self.m_localVersion = dict:getInt("version", -1);
	local strData = dict:getString("info");
	self.m_originInfo = json.decode(strData) or {};

    local timestampMap = dict:getString("timestampMap");
    self.m_timestampMap = json.decode(timestampMap) or {};
	
    local tmpData = self:analysisData(self.m_originInfo);
	if not table.isEmpty(tmpData) then
		self.m_originInfo = tmpData;
	end
end

AnnounceData.saveDictData = function(self, dict)
	dict:setInt("version", tonumber(self.m_localVersion) or -1 );

	local strData = json.encode( self.m_originInfo or {} );
	if strData then
		dict:setString("info", strData);
	end

    local timestampMap = json.encode(self.m_timestampMap or {});
    if timestampMap then 
        dict:setString("timestampMap", timestampMap);
    end
end

AnnounceData.getLocalDictName = function(self)
	return "announceData";
end

AnnounceData.getLocalVersion = function(self) 
	return self.m_localVersion or -1;
end

AnnounceData.getDictKeyVersion = function(self)
    return "900"; 
end

AnnounceData.requestData = function(self)
	if not self.m_isTouched then
		local param = {
			["version"] = kClientInfo:getApkVersion();
			["cli_ver"] = self:getLocalVersion();        
			["hall_version"] = kGameManager:getGameVersion(GameType.HALL);  
		};
		Log.i("AnnounceData.requestData","param = ",param);
		OnlineSocketManager.getInstance():sendMsg(PHP_NOTICE, param);
	end
end

--检查是否配置周循环
AnnounceData.__checkIsExistWeeks = function (self, curWeek, data)
    local isEqual = false;
    for k,v in pairs(table.verify(data)) do
        if number.valueOf(v) == number.valueOf(curWeek) then
            isEqual = true;
            break;
        end
    end
    return isEqual;
end

--根据时分秒转换成秒 eg: 15:24:36 -> 15*60*60+24*60+36
AnnounceData.__convertTimestamp = function (self, date)
    if string.isEmpty(date) then
        return 0;
    end
    local tmp = ToolKit.split(date,":");    
    local time = number.valueOf(tmp[1])*60*60 + number.valueOf(tmp[2])*60 + number.valueOf(tmp[3]);
    return time or 0;
end

--检查是否在时间段内
AnnounceData.__checkIsExistPertime = function (self, curTime, data)
    local isEqual = false;
    local date = os.date("%H:%M:%S", curTime);
    local pertime = self:__convertTimestamp(date);
    for k,v in pairs(table.verify(data)) do
       local stime = self:__convertTimestamp(v.stime);
       local etime = self:__convertTimestamp(v.etime);
       if pertime >= stime and pertime <= etime then
           isEqual = true; 
       end
    end
    return isEqual;
end

--检查是否登陆成功
AnnounceData.__checkIsLoginSuccess = function(self, isLogined)
    local isShow = true;
    if isLogined == 1 and not kLoginDataInterface:getIsLoginSuccess() then 
        isShow = false;
        self:setIsShowed(false);
    end
    return isShow;
end

--检查是否满足弹出条件
AnnounceData.__checkIsShow = function (self, data)
    local isShow = true;
    if data.conditions.poptype == AnnounceData.ePopType.EVERYONCE then --每次都弹，不需要检测，直接弹出
        return true;
    end
    for k, v in pairs(self.m_timestampMap) do
        if k == string.valueOf(data.notice_id)  then
           if v.poptype == AnnounceData.ePopType.ONCE then --只弹一次，检测是否弹过
                isShow = false;
                break;
           elseif v.poptype == AnnounceData.ePopType.EVERYDAY then --每天都弹，检测当天是否弹过 
               local curTime = AppData.getInstance():getRightTimeWithServer();
               local isSameDay = TimeFormatUtil.isSameDay(curTime, number.valueOf(v.time));
               if isSameDay  then
                   isShow = false;  
                   break;
               end 
           end
        end
    end
    return isShow;
end

--弹过之后保存当前时间戳
AnnounceData.__saveTimestamp = function (self, data)
    if data.conditions.poptype == AnnounceData.ePopType.EVERYONCE then --每次都弹，不需要保存时间戳
        return;
    end
    local time = AppData.getInstance():getRightTimeWithServer();
    local poptype = data.conditions.poptype;
    local isExist = false;
    for k, v in pairs(self.m_timestampMap) do
        if k == string.valueOf(data.notice_id) then --如果时间戳缓存中已存在，直接更新时间
            v.time = time;
            isExist = true;
        end
    end
    if not isExist then --如果时间戳缓存中不存在，则插入
        self.m_timestampMap[string.valueOf(data.notice_id)] = {time = time, poptype = poptype};
    end
    self:saveData();
end

--设置是否弹过
AnnounceData.setIsShowed = function (self, state)
    self.m_isShowed = state;
end

--检查是否弹过
AnnounceData.isShowed = function (self)
    return self.m_isShowed or (self.m_isShowed == nil);
end

--获取满足条件的公告数据
AnnounceData.__getShowData = function (self)
    local tmpData = {};
    self:setIsShowed(true);
    for k, v in pairs(table.verify(self.m_originInfo)) do
        local curTime = AppData.getInstance():getRightTimeWithServer();
        if curTime >= v.start_time and curTime <= v.end_time or v.end_time == 0 then --年月日时分秒
            if not table.isEmpty(v.conditions) then
                if not self:__checkIsLoginSuccess(v.conditions.isLogined) then --检查登陆是否成功
                    break;
                end
                local curWeek = os.date("%w", curTime);
                if table.isEmpty(v.conditions.week) then --周循环为空
                    if table.isEmpty(v.conditions.pertime) then --时间段为空
                        if self:__checkIsShow(v) then
                            tmpData = v;
                            break; 
                        end
                    else  --时间段不为空，检查是否在时间段内
                        if self:__checkIsExistPertime(curTime, v.conditions.pertime) then 
                            if self:__checkIsShow(v) then
                                tmpData = v;
                                break;
                            end
                        end
                    end
                else --周循环不为空
                    if table.isEmpty(v.conditions.pertime) then --时间段为空
                        if self:__checkIsExistWeeks(curWeek, v.conditions.week) then --检查周期是否满足
                            if self:__checkIsShow(v) then
                                tmpData = v;
                                break
                            end
                        end
                    else
                        if self:__checkIsExistWeeks(curWeek, v.conditions.week) then --检查周期是否满足
                            if self:__checkIsExistPertime(curTime, v.conditions.pertime) then --检查是否在时间段内
                                if self:__checkIsShow(v) then
                                    tmpData = v;
                                    break;
                                end
                            end
                        end
                    end 
                end
            else --没配置时间日期时 直接弹
                tmpData = v;
                break;     
            end
        end
    end
    return tmpData;
end

AnnounceData.onGetAnnounceData = function(self,isSuccess,info)
	Log.i("AnnounceData.onGetAnnounceData","isSuccess = ",isSuccess,"info = ",info);

	if isSuccess and not table.isEmpty(info) then
        AppData.getInstance():setServerTime(number.valueOf(info.srvtime,os.time()));
		self:updateDataByCompareVersion(info.svr_ver, info.isrefresh, info.data);
	    self:getAnnounceShowData();
    end 
end

AnnounceData.getAnnounceShowData = function (self)
    local data = self:__getShowData();
	if not table.isEmpty(data) then --获得当前数据不为空时，弹出公告
       local conditions = table.verify(data.conditions);
       self:execDelegate(AnnounceData.Delegate.refreshAnnouncement, data);
       if not table.isEmpty(conditions) then --数据不为空时，根据类型把时间戳存到缓存中，
            self:__saveTimestamp(data);       
       end
    end
end

AnnounceData.updateMemData = function(self, serverVersion, data)
	if type(data) ~= "table" then
		return;
	end	
	self.m_localVersion = serverVersion;
    local tmpData = self:analysisData(data);
	self.m_originInfo = self:sort(tmpData);
end

AnnounceData.sort = function (self, data)
    if type(data) ~= "table" then
        return;
    end
    table.sort(data, function(a, b)
        return number.valueOf(a.weight,0) > number.valueOf(b.weight,1);
    end)
    return data;
end

AnnounceData.analysisData = function(self, data)
	if type(data) ~= "table" then
		return {};
	end	
	local announceData = self:analysisAnnounceData(data);
	return announceData;	
end

AnnounceData.analysisTemporaryData = function(self, data)
	if table.isEmpty(data) then
		return {};
	end

	local item = {
		notice_id = number.valueOf(data.notice_id) or "0",
		start_time = number.valueOf(data.start_time);
        end_time = number.valueOf(data.end_time);
		app_id = tostring(data.app_id) or "0",
		is_html = tostring(data.is_html) or "0",
		title = tostring(data.title) or "error",
		content = tostring(data.content) or "error",
		weight = tostring(data.weight) or "0",
        conditions = self:analysisConditions(data.conditions);
	};

	return item;
end

AnnounceData.analysisAnnounceData = function(self, data)
	if table.isEmpty(data) then
		return {};
	end
	local tempData = {};
	for k,v in pairs(data) do
		local item = {
			notice_id = number.valueOf(v.notice_id) or "0",
			start_time = number.valueOf(v.start_time),
            end_time = number.valueOf(v.end_time),
			app_id = tostring(v.app_id) or "0",
			is_html = tostring(v.is_html) or "0",
			title = tostring(v.title) or "error",
			content = tostring(v.content) or "error",
			weight = tostring(v.weight) or "0",
            conditions = self:analysisConditions(v.conditions);
		};
		table.insert(tempData, item);
	end

	return tempData;
end

AnnounceData.analysisConditions = function (self, data)
    if table.isEmpty(data) then
        return {};
    end

    local item = {
        poptype = number.valueOf(data.poptype),--0：只弹一次，1：每天弹一次，2：每次都弹
        isLogined = number.valueOf(data.isLogined, 1), --0：登陆前 1:登陆后
        week = table.verify(data.week);
        pertime = table.verify(data.pertime);
    };

    return item;
end

--public
AnnounceData.insertTemporaryData = function(self, data)
	self.m_temporaryData = self:analysisTemporaryData(data);
	if not table.isEmpty(self.m_temporaryData) then
		self:execDelegate(AnnounceData.Delegate.refreshAnnouncement, self.m_temporaryData);
	end
end

AnnounceData.getAnnounce = function(self)
	self:requestData();
end

AnnounceData.isEmpty = function(self)
	if table.isEmpty(self.m_originInfo) and table.isEmpty(self.m_temporaryData) then
		return true;
	else
		return false;
	end
end

AnnounceData.clear = function(self)
	self.m_temporaryData = {};
end

AnnounceData.s_socketCmdFuncMap = {
	[PHP_NOTICE] 		        = AnnounceData.onGetAnnounceData;
};

return AnnounceData;