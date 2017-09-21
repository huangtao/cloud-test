--[[
	游戏用的计时器类，包含倒计时和超时计算
	来自于二七十的EqsTimer
	ver：20140418 先实现计时功能，特殊功能开发中再完善
	ver：20141028 优化超时部分的性能
]]
GameTimer2 = class();

GameTimer2.TYPE_COUNTING = 1;--倒计时中
GameTimer2.TYPE_COUNT_OVER = 2;--倒计时结束

GameTimer2.timeClockMap = {};
GameTimer2.timeOutMap = {};

GameTimer2.DEFAULT_TIMEOUT = 6 * 1000;
GameTimer2.TIME_OUT_CLOCK_SPACE = 500;

GameTimer2.seq2 = 0;

--开始倒计时,此处时间用秒
GameTimer2.startCounDown = function(id, cbObj, cbFunc, startTime, endTime)
	if not id then
		return ;
	end
	GameTimer2.release(id);
	local clock = new(GameTimerClock2, id, GameTimerClock2.TYPE_COUNT_DOWN, cbObj, cbFunc);
	table.insert(GameTimer2.timeClockMap, clock);
	clock:start(startTime, endTime);
end

GameTimer2.getSeq = function()
	GameTimer2.seq2 = GameTimer2.seq2 + 1;
    return GameTimer2.seq2;
end

--开始超时计算,此处时间用毫秒
GameTimer2.startTimeOut = function(id, cbObj, cbFunc, timeOutTime)
	if not id then
		return ;
	end
	GameTimer2.release(id);

	local info = debug.getinfo(2,"Sl");--调用该方法的信息
    local short_src = info.short_src;--哪个文件
    local currentline = info.currentline;--哪行调用的
    local src = string.format("%s:%s",short_src,currentline);
    local seq = GameTimer2.getSeq();

    local info = debug.getinfo(cbFunc,"Sl");--回调信息
    local short_src = info.short_src;--哪个文件
    local linedefined = info.linedefined;--即将调用的方法的位置
    local src = string.format(" 将调用函数 ==> %s:%s",short_src,linedefined);

	local tmpData = {};
    tmpData.passedTime = 0;
	tmpData.timeOutTime = tonumber(timeOutTime) or GameTimer2.DEFAULT_TIMEOUT;
	tmpData.callBackObj = cbObj;
	tmpData.callBackFunc = cbFunc;
	tmpData.id = id;
	tmpData.src = src;
	tmpData.seq = seq;
	-- table.insert(GameTimer2.timeOutMap, tmpData);
	GameTimer2.timeOutMap[id] = tmpData;

	GameTimer2.checkTimeOutClock();
end

GameTimer2.checkTimeOutClock = function()
	if not GameTimer2.s_timeOutClockAnim then
		Log.d("TESTTEST","GameTimer2.checkTimeOutClock","===========>",os.date());
		GameTimer2.s_timeOutClockAnim = AnimFactory.createAnimInt(kAnimRepeat,0,1,GameTimer2.TIME_OUT_CLOCK_SPACE,-1);
		GameTimer2.s_timeOutClockAnim:setDebugName("AnimInt|GameTimer2|TimeOutClock");
		GameTimer2.s_timeOutClockAnim:setEvent(GameTimer2,GameTimer2.onCheckTimeOutClockCallBack);
	end
end

GameTimer2.clearTimeOutClock = function()
	Log.d("TESTTEST","GameTimer2.clearTimeOutClock","===========>",os.date());
	delete(GameTimer2.s_timeOutClockAnim);
	GameTimer2.s_timeOutClockAnim = nil;
end

GameTimer2.onCheckTimeOutClockCallBack = function()
	--此处检查超时
	--Log.d("GameTimer2.onCheckTimeOutClockCallBack --- 检测超时")
	if table.isEmpty(GameTimer2.timeOutMap) then
		GameTimer2.clearTimeOutClock();
	else
		local timeOutKeyMap = {};
		for k,v in pairs(GameTimer2.timeOutMap) do
			if v then
                v.passedTime = number.valueOf(v.passedTime) + GameTimer2.TIME_OUT_CLOCK_SPACE;
				local timeOutTime = tonumber(v.timeOutTime) or GameTimer2.DEFAULT_TIMEOUT;
				if timeOutTime <= 0 then
                    timeOutTime = GameTimer2.DEFAULT_TIMEOUT;
				end
                if v.passedTime > timeOutTime then
					--此时超时了
					table.insert(timeOutKeyMap, k);
				end
			end
		end

		for i, key in pairs(timeOutKeyMap) do
			local data = GameTimer2.timeOutMap[key];
			if not table.isEmpty(data) then
				if data.callBackObj and data.callBackFunc then	
					Log.d("TESTTEST","GameTimer2.onCheckTimeOutClockCallBack","===========>",os.date(),"seq = ",data.seq," src = ",data.src);

					local info = debug.getinfo(data.callBackFunc,"Sl");
				    local short_src = info.short_src;
				    local linedefined = info.linedefined;
				    local src = string.format("调用函数 ==> %s:%s",short_src,linedefined);

					data.callBackFunc(data.callBackObj, data.id);
				end
			end
			GameTimer2.timeOutMap[key] = nil;
		end
	end
end

--释放，如果id为nil，释放所有的
GameTimer2.release = function(id)
	if id then
		local info = debug.getinfo(2,"Sl");
	    local short_src = info.short_src;
	    local currentline = info.currentline;
	    local src = string.format("%s:%s",short_src,currentline);

		Log.d("wanpg------GameTimer2释放id：",id);
		for k,v in pairs(GameTimer2.timeClockMap) do
			if v and v:getId() == id then
				delete(v);
				v = nil;
                GameTimer2.timeClockMap[k] = nil;
			end
		end

		for k,v in pairs(GameTimer2.timeOutMap) do
			if v and v.id == id then
				delete(v);
				v = nil;
                GameTimer2.timeOutMap[k] = nil;
			end
		end
	else
		local info = debug.getinfo(2,"Sl");
	    local short_src = info.short_src;
	    local currentline = info.currentline;
	    local src = string.format("%s:%s",short_src,currentline);

		Log.d("TESTTEST","GameTimer2.release all","===========>",os.date());
		Log.d("wanpg------GameTimer2释放所有");
		for k,v in pairs(GameTimer2.timeClockMap) do
			if v then
				delete(v);
				v = nil;
			end
		end

		for k,v in pairs(GameTimer2.timeOutMap) do
			if v then
				delete(v);
				v = nil;
			end
		end
		GameTimer2.timeClockMap = {};
		GameTimer2.timeOutMap = {};
	end
end



------------------- clock类 私有类 外界不要直接调用 ---------------------------------
GameTimerClock2 = class();

GameTimerClock2.TYPE_COUNT_DOWN = 1;
GameTimerClock2.TYPE_TIME_OUT = 2;

GameTimerClock2.msTimer = 1000;

GameTimerClock2.ctor = function(self, id, timeType, cbObj, cbFunc)
	self.m_id = id;
	self.m_timeType = number.valueOf(timeType);
	self.m_cbObj = cbObj;
	self.m_cbFunc = cbFunc;
end

GameTimerClock2.start = function(self, ...)
	self:stop();
	if self.m_timeType == GameTimerClock2.TYPE_COUNT_DOWN then
		self:initCountDown(...);
	elseif self.m_timeType == GameTimerClock2.TYPE_TIME_OUT then
		self:initTimeOut(...);
	end
end

---以下为私有方法
GameTimerClock2.initTimeOut = function(self, ...)
	self.m_timeOutTime = number.valueOf(arg[1], 10 * 1000);
	self:stop();
	self.m_timeCount = AnimFactory.createAnimInt(kAnimNormal,0,1,self.m_timeOutTime,-1);
	self.m_timeCount:setDebugName("AnimInt|GameTimer2|initTimeOut");
	self.m_timeCount:setEvent(self,self.onTimeOut);
end

GameTimerClock2.initCountDown = function(self, ...)
	self.m_startTime = number.valueOf(arg[1]);
	self.m_endTime = number.valueOf(arg[2]);
	if self.m_startTime == self.m_endTime then
		self:callBack(self.m_endTime, GameTimer2.TYPE_COUNT_OVER);
		return ;
	else
		self:callBack(self.m_startTime, GameTimer2.TYPE_COUNTING);
	end
	self:stop();
	self.m_timeCount = AnimFactory.createAnimInt(kAnimRepeat,0,1,GameTimerClock2.msTimer,-1);
	self.m_timeCount:setDebugName("AnimInt|GameTimer2|initCountDown");
	self.m_timeCount:setEvent(self,self.onTimeCountDown);
end

GameTimerClock2.getId = function(self)
	return self.m_id;
end

GameTimerClock2.onTimeOut = function(self)
	self:callBack();
	self:stop();
end

GameTimerClock2.onTimeCountDown = function(self)
	self.m_startTime = self.m_startTime - 1;
	local dType = GameTimer2.TYPE_COUNTING;
	if self.m_startTime <= self.m_endTime then
		self.m_startTime = self.m_endTime;
		dType = GameTimer2.TYPE_COUNT_OVER;
	end
	self:callBack(self.m_startTime, dType);
	if dType == GameTimer2.TYPE_COUNT_OVER then
		self:stop();
	end
end

GameTimerClock2.callBack = function(self, time, intType)
	if self.m_cbFunc then
		if self.m_cbObj then
			self.m_cbFunc(self.m_cbObj, self.m_id, time, intType);
		else
			self.m_cbFunc(self.m_id, time, intType);
		end
	end
end

GameTimerClock2.stop = function(self)
	if self.m_timeCount then
		delete(self.m_timeCount);
	end
	self.m_timeCount = nil;
end

GameTimerClock2.dtor = function(self)
	self:stop();
	self.m_startTime = nil;
	self.m_endTime = nil;
	self.m_timeOutTime = nil;
end