require("util/schedule");

--比赛列表、已报名列表item基类
local GameMatchHallItemBase = class(CommonGameLayer);

GameMatchHallItemBase.ctor = function(self)
    self.m_tryCount = 0;
    MatchHallDataInterface.getInstance():setObserver(self);
end

GameMatchHallItemBase.dtor = function(self)
   self:_stopUpdateRemainTimeTimer();
   self:__stopUpdateLoopMatchTimer();

   MatchHallDataInterface.getInstance():clearObserver(self);
end

--设置数据
GameMatchHallItemBase._setData = function(self, data)
    self.m_data = data;
end

--开始定时赛计时器
GameMatchHallItemBase._startUpdateRemainTimeTimer = function(self)
    self:_stopUpdateRemainTimeTimer();
    if self.m_data.type == GameConstant.FIXED_TIME_MATCH then --定时赛
        self:__updateRemainTime();
        Schedule.getInstance():registerListener(self, self.__updateRemainTime, 1000, kAnimRepeat, nil, "updateRemainTime");
    end
end

--更新剩余时间
GameMatchHallItemBase.__updateRemainTime = function(self)
    local diff = self.m_data.stime - GameInfoIsolater.getInstance():getRightTimeWithServer();
    if diff <= 0 then --时间走完
        if MatchHallDataInterface.getInstance():checkIsLoopMatch(self.m_data) then --循环赛
            self:_stopUpdateRemainTimeTimer();
            self:__startUpdateLoopMatchTimer();
        else
            MatchHallDataInterface.getInstance():requestMatchList();
        end
    end

    self:_onTimer(diff);
end

--停止定时赛计时器
GameMatchHallItemBase._stopUpdateRemainTimeTimer = function(self)
    Schedule.getInstance():unregisterListener(self, self.__updateRemainTime, "updateRemainTime");
end

--开始循环赛计时器
GameMatchHallItemBase.__startUpdateLoopMatchTimer = function(self)
    self:__stopUpdateLoopMatchTimer();
    self:getNextLoopMatchInfo();
    Schedule.getInstance():registerListener(self, self.getNextLoopMatchInfo, 20*1000, kAnimRepeat, nil, "getNextLoopMatchInfo");
end

--获取下一场循环赛信息
GameMatchHallItemBase.getNextLoopMatchInfo = function(self)
    self.m_isGetNextLoop = true
    MatchHallDataInterface.getInstance():getNextLoopMatchInfo(self.m_data.configid);
end

--停止循环赛计时器
GameMatchHallItemBase.__stopUpdateLoopMatchTimer = function(self)
    self.m_tryCount = 0
    Schedule.getInstance():unregisterListener(self, self.getNextLoopMatchInfo, "getNextLoopMatchInfo");
end

--下一场循环赛信息获取回调
GameMatchHallItemBase.onGetNextLoopMatchInfo = function(self, isSuccess, data)
    if not self.m_isGetNextLoop then
        return
    end
    self.m_isGetNextLoop = false
    self.m_tryCount = self.m_tryCount + 1
    if isSuccess and not table.isEmpty(data) then
        if number.valueOf(data.configid) > 0 and data.configid == self.m_data.configid then
            self:__stopUpdateLoopMatchTimer();
            self.m_data = data;
            self:_resetView();
            self:_showData();
            return
        end
    end
    if self.m_tryCount > 3 then
        self:__stopUpdateLoopMatchTimer();
        MatchHallDataInterface.getInstance():requestMatchList();
    end
end

--virtual
GameMatchHallItemBase._showData = function(self)
    if table.isEmpty(self.m_data) then
        return;
    end

    self:_showDataCommon();

    if self.m_data.type == GameConstant.NORMAL_IMMEDIATE_MATCH then --一般快速赛
        self:_showDataImmediate();
    elseif self.m_data.type == GameConstant.FIXED_TIME_MATCH then --定时赛
        self:_showDataTime();
    end
end

--virtual
GameMatchHallItemBase._resetView = function(self)
end

--virtual
GameMatchHallItemBase._showDataCommon = function(self)
end

--virtual
GameMatchHallItemBase._showDataImmediate = function(self)
end

--virtual
GameMatchHallItemBase._showDataTime = function(self)
end

--virtual
GameMatchHallItemBase._onTimer = function(self, diff)
end

--获取图片资源，待扩展
GameMatchHallItemBase._getIconFileByType = function(self, type)
    local file = GameMatchHallConstants.eIconFiles[type];
    if not file then
        return GameMatchHallConstants.eIconFiles[-1], true
    end
    return file;
end

GameMatchHallItemBase._resetImageSize = function(self, img)
    if img and img.m_res then
        local width = img.m_res:getWidth();
        local height = img.m_res:getHeight();
        img:setSize(width, height);
    end
end

return GameMatchHallItemBase;