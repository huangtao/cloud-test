require("gameData/gameData");

--@brief 每日奖励数据源

DayRewardData = class(GameData);

DayRewardData.Delegate = {
	onGetSigninInfosCallBack = "onGetSigninInfosCallBack";
	onGetSigninCalendarCallBack = "onGetSigninCalendarCallBack";
	onSigninCallBack = "onSigninCallBack";
};

DayRewardData.initData = function(self)
	self.m_saveTime = 0; 
	self.m_todaySigninInfos = {};
	self.m_tomorrowSigninConfig = {};
	self.m_continueSigninInfo = {};
	self.m_rewardAdConfig = {};
	self.m_signinCalendarInfo = {};

	self.m_isNeedRefreshCalendarInfo = false;
	self.m_saveTimeCalendarInfo = 0;
	self.m_isSignToday = true;
end

--@请求签到
DayRewardData.requestSignin = function(self,day,isBuSignin)
	if day then 
		local param = {};
		param.day = day;
		param.isBuSignin = isBuSignin;
		Log.v("DayRewardData.requestSignin","param = ",param);

		OnlineSocketManager.getInstance():sendMsg(PHP_SIGININAWARD_SIGININ, param);
        VipAnimManager.getInstance():setPauseAnim(true);
	else 
		local info = {};
		info.errorType = -1;
		self:execDelegate(DayRewardData.Delegate.onSigninCallBack, false,info);
	end 
end

DayRewardData.onSigninCallBack = function(self,isSuccess,info, sendParam)
	Log.v("DayRewardData.onSigninCallBack --> ", "isSuccess = ",isSuccess,"info = ",info );
    VipAnimManager.getInstance():setPauseAnim(false);
	if not isSuccess or table.isEmpty(info) or table.isEmpty(sendParam) then
		self:execDelegate(DayRewardData.Delegate.onSigninCallBack, false ,info);
		return;
	end
	local status = number.valueOf(info.status,2); --签到成功与否的状态  5：今天使用过了，4：补签卡道具过期，3: 补签卡不足，2：签到失败，-1：参数错误，1：要签到的那天已经钱到了，0：签到成功（签到成功才会有下面的返回）
	if status == 0 then 
		self.m_isNeedRefreshCalendarInfo = true;
    
		local data = table.verify(self.m_todaySigninInfos);
		data.isSignToday = self.m_isSignToday or not sendParam.isBuSignin; --今天是否签到，1：签过了，0：未签到
		data.continueDays = number.valueOf(info.continue_days,1); --连续签到天数
		data.canUseCard = number.valueOf(info.canuse_card) == 1;   --是否可以使用补签卡 1：可以， 0：不可以
		self.m_todaySigninInfos = data;

		self.m_isSignToday = data.isSignToday;

		local _,totalMonthDay = self:_getCurMonthInfo();
		self.m_continueSigninInfo = table.verify(self.m_continueSigninInfo);
		self.m_continueSigninInfo.continueDays = data.continueDays;
		self.m_continueSigninInfo.progress = data.continueDays/totalMonthDay; --计算进度的时候默认每个月的总天数就是28天

		local temp = {};
		temp.tmoney = tonumber(info.tmoney) or 0; --玩家现金数目
		temp.tdiamond = tonumber(info.tdiamond) or 0; --玩家钻石总数
		temp.tcrystal = tonumber(info.tcrystal) or 0; --玩家总金条

		kUserInfoData:setMoney(temp.tmoney);
		kUserInfoData:setDiamond(temp.tdiamond);
		kUserInfoData:setCrystal(temp.tcrystal);

		local daily = {};
		for k,v in pairs(table.verify(info.daily)) do
			if type(v) == "table" then
				v.type = number.valueOf(v.type);
				v.award = number.valueOf(v.award);
				v.status = number.valueOf(v.status, 2);--签到成功与否的状态2：签到失败，-1：参数错误，1：要签到的那天已经钱到了，0：签到成功
				v.ratio = number.valueOf(v.ratio);--奖励倍数

				table.insert(daily,v);
			end
		end

		local continue = {};
		for k,v in pairs(table.verify(info.continue)) do
			if type(v) == "table" then
				v.type = number.valueOf(v.type);
				v.award = number.valueOf(v.award);
				v.status = number.valueOf(v.status, 2);--签到成功与否的状态2：签到失败，-1：参数错误，1：要签到的那天已经钱到了，0：签到成功
				v.ratio = number.valueOf(v.ratio);--奖励倍数
				v.continue_days = number.valueOf(v.continue_days,1);

				table.insert(continue,v);
			end
		end

		local data = {};
		data.info = temp;
		data.daily = daily;
		data.continue = continue;

		self:execDelegate(DayRewardData.Delegate.onSigninCallBack,true,info);
	else 
		local info = {};
		info.errorType = status;
		self:execDelegate(DayRewardData.Delegate.onSigninCallBack, false,info);
	end 
end

--检测时间是否已经过了一天，过了24点即为过了一天
DayRewardData._isToday = function(self, timeLast)
	-- body
	local dateNowMap = string.split(os.date("%Y/%m/%d", os.time()), "/");
	local dateLastMap = string.split(os.date("%Y/%m/%d", timeLast), "/");

	if dateNowMap[1] ~= dateLastMap[1] then
		--年数不相等直接返回
		return false;
	end

	if dateNowMap[2] ~= dateLastMap[2] then
		--月数不相等返回
		return false
	end

	if dateNowMap[3] ~= dateLastMap[3] then
		return false;
	end

	return true;
end

---------------------------------------------------------------------------------------------------------
DayRewardData.getSigninInfos = function(self)
	if self:_isNeedRefresh() then
		OnlineSocketManager.getInstance():sendMsg(PHP_SIGNINAWARD_SIGNININFO);
	end
end

DayRewardData._isNeedRefresh = function(self)
	if self.m_firstEnter then
		self.m_firstEnter = false;
		return true;
	elseif self:_isToday(self.m_saveTime) then 
		return false;
	else 
		if not self.m_refreshTime then
			self.m_refreshTime = os.time();
			return true;
		else
			local lastRefreshTime = self.m_refreshTime;
			local interval = os.time() - lastRefreshTime;

			if (interval >= 60) then 
				self.m_refreshTime = os.time();
				return true;
			else
				return false;
			end 
		end
	end	  
end 

DayRewardData.onGetSigninInfosCallBack = function(self,isSuccess,info)
	if not isSuccess or table.isEmpty(info) then 
		self:execDelegate(DayRewardData.Delegate.onGetSigninInfosCallBack,false);
		return;
	end 

	self.m_saveTime = os.time();

	local data = {};
	data.isSignToday =  number.valueOf(info.issignin_today) == 1; --今天是否签到，1：签过了，0：未签到
	data.continueDays = number.valueOf(info.continue_days); --连续签到天数
	data.canUseCard = number.valueOf(info.canuse_card) == 1;   --是否可以使用补签卡 1：可以， 0：不可以
	data.config = self:_formatDaySinginInfo(info.today_infos);
	self.m_todaySigninInfos = data;

	self.m_isSignToday = data.isSignToday;

	self.m_tomorrowSigninConfig = self:_formatDaySinginInfo(info.tomorrowInfos); --获取明天的奖励

	local _,totalMonthDay = self:_getCurMonthInfo();
	local temp = {};
	temp.config = self:_handleContinueConfig(info.continue_infos);--连续签到的奖励配置
	temp.record = table.verify(info.continue_get);---已获得的奖励记录
	temp.progress = data.continueDays/totalMonthDay;
	temp.continueDays = data.continueDays;
	temp.totalMonthDay = totalMonthDay;
	self.m_continueSigninInfo = temp;
			
	self.m_rewardAdConfig = {}; --广告
	for k,v in pairs(table.verify(info.sigin_ads)) do
		if type(v) == "table" then
			local item = {};
			item.jump_code = tostring(v.jump_code) or "[]";--跳转地址
			item.sec = tostring(v.sec) or 0; --间隔跳转时间(单位秒)
			item.icon = tostring(v.icon) or ""; --图片地址
			item.rank = tonumber(v.rank) or 0; --权重，根据权重计算显示顺序

			table.insert(self.m_rewardAdConfig, item);
		end
	end

	local autoopen = number.valueOf(info.autoopen, 1); --是否自动打开弹框 1:自动打开  0:不打开 

	self:execDelegate(DayRewardData.Delegate.onGetSigninInfosCallBack,true,self.m_todaySigninInfos,
		self.m_tomorrowSigninConfig,self.m_continueSigninInfo,self.m_rewardAdConfig, autoopen);
end

DayRewardData.getTodaySigninInfos = function(self)
	return self.m_todaySigninInfos;
end

DayRewardData.getTomorrowSigninConfig = function(self)
	return self.m_tomorrowSigninConfig;
end

DayRewardData.getContinueInfos = function(self)
	return self.m_continueSigninInfo;
end

--@请求每日奖励TAB点击广告跳转信息
DayRewardData.getRewardAdConfig = function(self)
	return self.m_rewardAdConfig;
end

DayRewardData._handleContinueConfig = function(self,data)
	data = table.verify(data);

	local config = {};
	for k,v in pairs(data) do --天数:{奖金类型,奖金数量}。
		if type(v) == "table" and v.day then 
			v.type = number.valueOf(v.type); --0为银币2为钻石
			v.num = number.valueOf(v.num);
			v.icon = v.icon or "";
			v.day = number.valueOf(v.day);--0:连续签到一个月 
			config[tostring(v.day)] = v;
		end 
	end 

	return config;
end 

DayRewardData._formatDaySinginInfo = function(self,data)
	data = table.verify(data);

	data.type = number.valueOf(data.type); --0为银币2为钻石
	data.num = number.valueOf(data.num);
	data.icon = data.icon or "";

	return data;
end
---------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--获取补签信息
DayRewardData.getSigninCalendarInfo = function(self)
	if self.m_isNeedRefreshCalendarInfo then 
		self.m_isNeedRefreshCalendarInfo = false;
		OnlineSocketManager.getInstance():sendMsg(PHP_SIGNINAWARD_GETSIGNINCALENDAR);
		return nil;
	elseif not table.isEmpty(self.m_signinCalendarInfo) then
		
		if not self:_isToday(self.m_saveTimeCalendarInfo) then
			OnlineSocketManager.getInstance():sendMsg(PHP_SIGNINAWARD_GETSIGNINCALENDAR);
		end

		return self.m_signinCalendarInfo, self.m_continueSigninInfo;
	else
        OnlineSocketManager.getInstance():sendMsg(PHP_SIGNINAWARD_GETSIGNINCALENDAR);
        return nil;
    end
end 

DayRewardData.onGetSigninCalendarCallBack = function(self,isSuccess, info)
	if not isSuccess or table.isEmpty(info) or (not info.daily) then
		self:execDelegate(DayRewardData.Delegate.onGetSigninCalendarCallBack,false);
		return;
	end

	self.m_saveTimeCalendarInfo = os.time();
	self.m_signinCalendarInfo = self:_handleSigninCalendarInfo(info.daily);
	self.m_continueSigninInfo = table.verify(self.m_continueSigninInfo);
	self.m_continueSigninInfo.record = table.verify(info.continue);
    if isSuccess then
	    self:saveData();
    end
    self:execDelegate(DayRewardData.Delegate.onGetSigninCalendarCallBack,true,self.m_signinCalendarInfo,self.m_continueSigninInfo);
end 


DayRewardData._handleSigninCalendarInfo = function(self,data)
	data = table.verify(data);

	local today,monthDay,monthStartWeek = self:_getCurMonthInfo();
	
	local dailyData = {};
	for i = 1,monthStartWeek - 1 do
		local tmp = {}
		tmp.day = 0;
		tmp.state = 0;
		table.insert(dailyData,tmp);
	end

	for i = 1,monthDay do
		local tmp = {}
		if data[tostring(i)] then
			tmp.day = i;
			tmp.state = data[tostring(i)];
		else
			if i < tonumber(today.day) then
				tmp.day = i;
				tmp.state = 2;
			else
				tmp.day = i;
				tmp.state = 0;
			end
		end
		table.insert(dailyData,tmp);
	end

	if #dailyData%7 ~= 0 then 
		local needNum = 7 - #dailyData%7;
		for i = 1,needNum do 
			local tmp = {}
			tmp.day = 0;
			tmp.state = 0;
			table.insert(dailyData,tmp);
		end 
	end 

	return dailyData;
end

DayRewardData._getCurMonthInfo = function(self)
	--获取年月日
	local today = os.date("*t", kAppData:getRightTimeWithServer() );
	--获取本月的总天数
	local totalMonthDay = self:_getMonthDay(number.valueOf(today.year),number.valueOf(today.month));
	--获取本月1号是星期几
	local monthStartWeek = os.date("*t",os.time{year=today.year,month=today.month,day=1}).wday;

	return today,totalMonthDay,monthStartWeek;
end

---获取一个月有多少天
DayRewardData._getMonthDay = function(self,year,month)
	local monthDay = {31,28,31,30,31,30,31,31,30,31,30,31};
	if ((year%4==0 and year%100 ~= 0) or year%400==0) then
		monthDay[2] = 29;
	else
		monthDay[2] = 28;
	end
	return monthDay[month];
end
---------------------------------------------------------------------------------------------------------

DayRewardData.loadDictData = function(self, dict)
	local strCalendarData = dict:getString("signinCalendarInfo");
	local calendarData = json.decode(strCalendarData);
	if table.isTable(calendarData) then
		self.m_signinCalendarInfo = calendarData;
	end
    local strContinueData = dict:getString("continueSigninInfo");
	local continueData = json.decode(strContinueData);
	if table.isTable(continueData) then
		self.m_continueSigninInfo = continueData;
	end
     self.m_saveTimeCalendarInfo = dict:getInt("calendarTime", 0);
end

DayRewardData.saveDictData = function(self, dict)
	dict:setString("signinCalendarInfo", json.encode(self.m_signinCalendarInfo) or "");
    dict:setString("continueSigninInfo", json.encode(self.m_continueSigninInfo) or "");
    dict:setInt("calendarTime", self.m_saveTimeCalendarInfo or 0);  
end

DayRewardData.getLocalDictName = function(self)
	self.m_userCid = self.m_userCid or kUserInfoData:getUserCid();
	return "DayRewardData" .. self.m_userCid;
end


DayRewardData.s_socketCmdFuncMap = {
	[PHP_SIGNINAWARD_SIGNININFO]		 = DayRewardData.onGetSigninInfosCallBack;
	[PHP_SIGNINAWARD_GETSIGNINCALENDAR]  = DayRewardData.onGetSigninCalendarCallBack;
	[PHP_SIGININAWARD_SIGININ]			 = DayRewardData.onSigninCallBack;
};