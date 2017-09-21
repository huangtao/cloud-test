require("core/dict");
require("isolater/interface/userBaseInfoIsolater");
local TimeFormatUtil = require("util/timeFormatUtil");

--比赛列表数据源

local MatchListData = class(GameData);

MatchListData.Delegate = {
    onGetMatchList = "onGetMatchList";
    onGetNextLoopMatchInfo = "onGetNextLoopMatchInfo";
    onInvitationalMyApplyLists = "onInvitationalMyApplyLists";
}

MatchListData.ctor = function(self)
    self.m_matchList = {};
    self.m_lastRequestTime = 0;
end

--@brief 请求比赛列表
MatchListData.requestMatchList = function(self)
    self:__filterExpendMatch();

    local ids = {};
    for k, v in pairs(self.m_matchList) do
        local item = {
            type = v.type,
            id = v.id,
            configid = v.configid,
        }
        table.insert(ids, item);
    end

    self.m_lastRequestTime = GameInfoIsolater.getInstance():getRightTimeWithServer();
    SocketIsolater.getInstance():sendMsg(PHP_REQUEST_MATCH_LIST,  {ids = ids} );
end

--@brief 获取比赛列表回调
MatchListData.onGetMatchListCallBack = function(self, isSuccess, data, sendParam)
    if not isSuccess or not data then
        return;
    end

    --新增的比赛列表
    for k, v in pairs( table.verify(data.list) ) do
        local itemData = self:_analyseMatchList(v);
        itemData.gameId = itemData.gameid;  --兼容以前的gameId写法
        itemData.name = itemData.mname;   --兼容以前的name写法

        --防止重复插入
        local isRepeat = false
        for k2,v2 in ipairs(self.m_matchList) do
            if self:__isSameMatch(itemData, v2) then
                self.m_matchList[k2] = itemData --刷新比赛数据
                isRepeat = true
                break
            end
        end
        if not isRepeat then
            table.insert(self.m_matchList, itemData);
        end
    end

    --去除已经过期的比赛
    for k, v in pairs( table.verify(data.delete) ) do
        for kk, vv in pairs(self.m_matchList) do
            if self:__isSameMatch(v, vv) then
                table.remove(self.m_matchList, kk);
            end
        end
    end

    --更新比赛数据
    for k, v in pairs( table.verify(data.update) ) do
        for kk, vv in pairs(self.m_matchList) do
            if self:__isSameMatch(v, vv) then
                vv.id = number.valueOf(v.id);
                vv.applynum = number.valueOf(v.applynum);
                vv.allapplynum = number.valueOf(v.allapplynum);
                vv.matchpartitions = number.valueOf(v.matchpartitions);--分场
                vv.stime = number.valueOf(v.stime);
                vv.etime = number.valueOf(v.etime);
                vv.status = number.valueOf(v.status);
            end
        end
    end

    --根据时间将报名状态从已报名状态置为允许进入状态
    --客户端自己计算已报名的比赛是否已经可以进入
    for k, itemData in pairs(self.m_matchList) do
        if number.valueOf(itemData.status) == GameConstant.HAVE_SIGN_UP then
            local enterTime = itemData.stime - (number.valueOf(itemData.allowwaittime)*60);
            local now = GameInfoIsolater.getInstance():getRightTimeWithServer();
            -- 误差容忍为5秒
            if now >= enterTime - 5 and now < itemData.stime + 5 then
                itemData.status = GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN;
            end
        end
    end

    self:execDelegate(MatchListData.Delegate.onGetMatchList, Copy(self.m_matchList) );
end

--@brief 检查是否需要刷新比赛列表
--@note 从其它界面返回到大厅界面 且和上次请求相隔时间大于5分钟
MatchListData.checkRefreshMatchList = function(self)
    local diff = GameInfoIsolater.getInstance():getRightTimeWithServer() - self.m_lastRequestTime;
    if diff > 60*5 then
        --大于5分钟
        self:requestMatchList();
    end
end

--@brief 过滤掉过期的定时赛
MatchListData.__filterExpendMatch = function(self)
    local isSameDay = TimeFormatUtil.isSameDay(self.m_lastRequestTime, GameInfoIsolater.getInstance():getRightTimeWithServer())
    local expendedMatchs = {};
    for k, v in pairs(self.m_matchList) do
        if v.type == GameConstant.FIXED_TIME_MATCH then
            if not isSameDay then
                table.insert(expendedMatchs, v);
            else
                local diff = v.stime - GameInfoIsolater.getInstance():getRightTimeWithServer();
                --定时赛
                if not self:checkIsLoopMatch(v) and diff <= 0 then
                    --不是循环赛
                    table.insert(expendedMatchs, v);
                end
            end
        end
    end

    for k, v in pairs(expendedMatchs) do
        for kk, vv in pairs(self.m_matchList) do
            if self:__isSameMatch(v, vv) then
                table.remove(self.m_matchList, kk);
                break;
            end
        end
    end
end

--@brief 判断是否是同一个比赛
MatchListData.__isSameMatch = function(self, matchItemA, matchItemB)
    if number.valueOf(matchItemA.type) == number.valueOf(matchItemB.type) then

        if number.valueOf(matchItemA.type) == GameConstant.FIXED_TIME_MATCH 
            and number.valueOf(matchItemA.configid) == number.valueOf(matchItemB.configid) then

            --定时赛、循环赛根据configid来进行判断
            return true;

        elseif number.valueOf(matchItemA.type) ~= GameConstant.FIXED_TIME_MATCH 
            and number.valueOf(matchItemA.id) == number.valueOf(matchItemB.id) then

            --定人赛根据比赛id进行判断
            return true;
        else
            return false;
        end
    else
        return false;
    end
end

--@brief 下一场循环赛信息获取回调
MatchListData.checkIsLoopMatch = function(self, data) 
    if table.isEmpty(data) then
        return false;
    end

    if data.looptype and data.looptype > GameMatchHallConstants.eLoopType.NOT and data.looptype < GameMatchHallConstants.eLoopType.CUSTOM then
        return true;
    else
        return false;
    end
end

--@brief 获取下一场循环赛信息
--@param 比赛配置id
MatchListData.getNextLoopMatchInfo = function(self, configid)
    SocketIsolater.getInstance():sendMsg(PHP_GET_NEXT_LOOP_MATCH, { configid = configid } );
end

--@brief 下一场循环赛信息获取回调
MatchListData.onGetNextLoopMatchInfo = function(self, isSuccess, data, sendParam)
    if not isSuccess then
        self:execDelegate(MatchListData.Delegate.onGetNextLoopMatchInfo, false);
    else
        local configid = number.valueOf(data.configid, -1);--比赛配置id
        local matchid  = number.valueOf(data.matchid);--比赛ID
        local stime = number.valueOf(data.stime);--比赛开始时间
        local etime = number.valueOf(data.etime);--比赛结束时间
        local status = number.valueOf(data.status);--比赛报名状态

        local matchItem, index = self:getMatchItemByConfigid(configid);
        if table.isEmpty(matchItem) then
            self:execDelegate(MatchListData.Delegate.onGetNextLoopMatchInfo, false);
            return;
        end

        matchItem.id = matchid;
        matchItem.stime = stime;
        matchItem.etime = etime;
        matchItem.status = status;
        --太坑了 循环赛竟然还能配置一模一样的，此处更新需要将同一个configid的信息都更新下
        self:updateMatchItemInfo(matchItem);
        self:execDelegate(MatchListData.Delegate.onGetNextLoopMatchInfo, true, matchItem);
    end
end

--@brief 获取比赛列表
MatchListData.getMatchList = function(self)
	return table.verify(self.m_matchList);
end

--@brief 更新比赛列表项数据
MatchListData.updateMatchItemInfo = function(self, newItem)
	if table.isEmpty(newItem) then
		return;
	end

    for k, v in pairs(self.m_matchList) do
        if self:__isSameMatch(v, newItem) then
            --self.m_matchList[k] = newItem;
            for k1,v1 in pairs(newItem) do
                self.m_matchList[k][k1] = v1
            end
        end
    end
end

--@brief 根据配置id获取比赛数据
--@param config 配置id(定时赛或循环赛)
MatchListData.getMatchItemByConfigid = function(self, configid)
	if number.valueOf(configid) <= 0 then
		return {}, -1;
	end
	
	for k, v in pairs(self.m_matchList) do
		if v.configid == configid then
			return v, k;
		end
	end

	return {}, -1;
end

--@brief 获取已报名的比赛列表（包括邀请赛）
MatchListData.getEnrollList = function(self)
    local invitationalEnrollList = self:_getInvitationalEnrollList()
    local matchEnrollList = self:_getMatchEnrollList()
    for _,v in pairs(invitationalEnrollList) do
        table.insert(matchEnrollList, v)
    end
    return self:_sortEnrollList(matchEnrollList)
end

--获取邀请赛已报名列表
MatchListData.getInvitationalEnrollList = function(self)
    local data = self:_getInvitationalEnrollList()
    return self:_sortEnrollList(data)
end

--获取比赛已报名列表(未排序)
MatchListData._getMatchEnrollList = function(self)
    local data = {}
    local rightTime = GameInfoIsolater.getInstance():getRightTimeWithServer()
    for k,v in pairs(self.m_matchList) do
        if (tonumber(v.status) == GameConstant.HAVE_SIGN_UP or 
            tonumber(v.status) == GameConstant.SIGN_UP_AND_ALLOW_JOIN_IN or 
            tonumber(v.status) == GameConstant.SIGN_UP_BUT_HAVE_START) and
            ((v.stime - rightTime) > 0) then
            table.insert(data,v)
        end
    end
    return Copy(data)
end

--获取邀请赛已报名列表(未排序)
MatchListData._getInvitationalEnrollList = function(self)
    local data = {}
    local rightTime = GameInfoIsolater.getInstance():getRightTimeWithServer()
    if not table.isEmpty(self.m_myApplyLists) then
        for k,v in pairs(self.m_myApplyLists) do
            if (v.stime - rightTime) > 0 then
                table.insert(data,v)
            end 
        end
    end
    return Copy(data)
end

--排序已报名列表
MatchListData._sortEnrollList = function(self, data)
    local function func(a, b)
        return a.stime < b.stime
    end
    table.sort(data, func)
    return data
end

MatchListData.getClosestMatch = function(self)
    local result = nil;
    local resultNormal = nil
    for _, v in ipairs(self.m_matchList or {}) do
        if v.status == GameConstant.NOT_SIGN_UP and v.type == GameConstant.FIXED_TIME_MATCH then
            if not result or result.stime > v.stime then
                result = v;
            end
        elseif v.status == GameConstant.NOT_SIGN_UP and v.type == GameConstant.NORMAL_IMMEDIATE_MATCH then
            if not resultNormal then
                resultNormal = v;
            end
        end
    end

    return Copy(result or resultNormal);
end

--@brief 获取开赛时间距离现在最近的一场定时赛，报名下一场用
MatchListData.getClosestMatchCanSiginup = function (self, data)
    data = table.verify(data);

    local resultPriority = nil;
    local reuslt = nil;
    local free = table.isEmpty(data.fee);
    local gameid = number.valueOf(data.gameid);
    local type = number.valueOf(data.type, -1);
    local isLoopMatch = self:checkIsLoopMatch(data);
    
    Log.d("MatchListData.getClosestMatchCanSiginup", "type", type, "gameid", gameid, "free", free, "isLoopMatch", isLoopMatch);
    for _, v in ipairs(self.m_matchList or {}) do
        -- 过滤不同游戏，不同比赛类型，已报名比赛
        if v.status == GameConstant.NOT_SIGN_UP and v.type == type and v.gameid == gameid then
        	local itemFree = table.isEmpty(v.fee); -- 是否免费
        	local itemCanSignup = self:checkCanSignup(v); -- 是否足够报名费报名 

            -- 定时赛选择同种报名类型（免费比赛选择免费比赛，非免费比赛选择足够报名费报名的比赛）
        	if type == GameConstant.FIXED_TIME_MATCH and
        		((free and free == itemFree) or (not free and itemCanSignup)) then

                -- 循环赛报名同一场
                if isLoopMatch then
                    local configid = number.valueOf(data.configid);
                    if configid == v.configid then
                        resultPriority = v;
                        result = v;
                    end

                -- 非循环赛
                else
                    -- 优先选择同种报名类型（免费，收费），时间最早的比赛
            		if free == itemFree and (not resultPriority or resultPriority.stime > v.stime) then
    	                resultPriority = v;
    	            end

                    -- 后选择不同报名类型（免费，收费），时间最早的比赛
    	            if free ~= itemFree and (not result or result.stime > v.stime) then
    	            	result = v;
    	            end
                end

            -- 定人赛选择同种报名类型，足够报名费报名的比赛
        	elseif type == GameConstant.NORMAL_IMMEDIATE_MATCH and
        		free == itemFree and itemCanSignup then
        		if not result then
	                result = v;
	            end
        	end
        end
    end
    local final = resultPriority or result;
    Log.d("MatchListData.getClosestMatchCanSiginup", "final", final);
    return Copy(final);
end

--@brief 根据标签id获取比赛列表
MatchListData.getMatchListWithTagId = function(self, tagId)
	local data = {};
	if self.m_matchList then
		for k,v in pairs(self.m_matchList) do
			if self:_isTagMatch(tagId, v) then
				table.insert(data,v);
			end
		end
	end
	Log.v("-----MatchListData.getMatchListWithTagId ---",data);
	return Copy(data);
end

--@brief 判断matchData是否属于这个tagId
MatchListData._isTagMatch = function(self, tagId, matchData)
    tagId = number.valueOf(tagId);
	if not table.isEmpty(matchData) and tagId and tagId > 0 then
		for k, v in pairs(table.verify(matchData.matchtags)) do
			if v == tagId then
				return true;
			end
		end
	end
	return tagId == 0;
end

--@brief 判断能否报名
MatchListData.checkCanSignup = function(self, data)
    if table.isEmpty(data) or table.isEmpty(data.fee) then
        return true;
    end

    local dataFee = data.fee;
    
    local canSign = false;
    for k,v in ipairs(dataFee or {}) do
        if self:checkFee(v) then
            canSign = true;
            break;
        end
    end
    return canSign;
end

--@brief 检查是否满足报名条件
MatchListData.checkFee = function(self, fee)
    local enable = true;
    for _ , v in ipairs(fee or {}) do
        if not self:checkFeeItem(v) then
            enable = false;
            break;
        end
    end

    return enable;
end

--@brief 判断是否满足报名条件
MatchListData.checkFeeItem = function(self, feeItem)
    if not feeItem then return false end;
    local costType = number.valueOf(feeItem.type,-1);
    local costNum = number.valueOf(feeItem.num);
    if costType == 0 then
        --银币报名
        if costNum <= UserPropertyIsolater.getInstance():getMoney() then
            return true;
        end
    elseif costType == 1 then
        if costNum <= UserPropertyIsolater.getInstance():getCrystal() then
            return true;
        end
    elseif costType == 2 then
        --钻石报名
        if costNum <= UserPropertyIsolater.getInstance():getDiamond() then
            return true;
        end
    else
        --道具报名
        local localPropNum = PropIsolater.getInstance():getPropNumByPropType(costType);
        if localPropNum >= costNum and localPropNum ~= 0 then
            return true;
        end
    end
    return false;
end

--检查是否能够报名 结果返回布尔值，结果为false时同时返回错误类型
--typ:道具类型
--num:道具数量
--checkRuin:是否检查破产
MatchListData.checkEnroll = function(self, typ, num, checkRuin)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local barID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    local diamondID = RechargeDataInterface.getInstance():getPropertyDiamondID()
    if num == 0 then
        return true
    end
    local userInfoInstance = UserPropertyIsolater.getInstance()
    if typ == coinID or typ == barID then
        local cash = (typ == coinID) and userInfoInstance:getMoney() or userInfoInstance:getCrystal()
        local total = (typ == coinID) and userInfoInstance:getTotalMoney() or userInfoInstance:getTotalCrystal()
        local safeBox = (typ == coinID) and userInfoInstance:getSafeBoxCurMoney() or userInfoInstance:getSafeBoxCurCrystal()
        if not checkRuin then
            if cash >= num then
                return true
            else
                if total >= num then
                    return false, GameMatchHallConstants.enrollErrorType.CASH_OUT
                else
                    return false, GameMatchHallConstants.enrollErrorType.TOTAL_OUT
                end
            end 
        end
        local bankruptMoney = BankruptDataInterface.getInstance():getBankruptLowestMoney()
        if (typ == barID and cash >= num) or (typ == coinID and cash >= (num + bankruptMoney)) then --可以报名
            return true
        end
        if (typ == barID and total >= num) or (typ == coinID and total >= (num + bankruptMoney)) then  --资产够
            if typ == coinID and cash < (num + bankruptMoney) and cash >= num then --资产够,现金够但现金触发破产
                return false, GameMatchHallConstants.enrollErrorType.CASH_RUIN
            else --资产够但现金不够
                return false, GameMatchHallConstants.enrollErrorType.CASH_OUT
            end
        elseif typ == coinID and total < (num + bankruptMoney) and total >= num then --资产触发破产
            return false, GameMatchHallConstants.enrollErrorType.TOTAL_RUIN
        else --资产不够
            return false, GameMatchHallConstants.enrollErrorType.TOTAL_OUT
        end
    end
    if typ == diamondID then
        if userInfoInstance:getDiamond() >= num then
            return true
        else
            return false,GameMatchHallConstants.enrollErrorType.DIAMOND_OUT
        end
    end
    local propNum = PropIsolater.getInstance():getPropNumByPropType(typ)
    if propNum >= num then
        return true
    else
        return false,GameMatchHallConstants.enrollErrorType.PROP_OUT
    end
end

--@brief 排序报名方式， 将可报名的翻盖第一位
MatchListData.sortFee = function(self, data)
    if table.isEmpty(data) then
        return {}
    end
    local function func(a, b)
        local isFitA = self:checkEnroll(tonumber(a[1].type), tonumber(a[1].num), true)
        local isFitB = self:checkEnroll(tonumber(b[1].type), tonumber(b[1].num), true)
        if isFitA and isFitB then
            return a[1].index < b[1].index
        elseif isFitA and not isFitB then
            return true
        elseif not isFitA and isFitB then
            return false
        else
            return a[1].index < b[1].index
        end
    end
    table.sort(data, func)
    return data
end

MatchListData._analyseMatchList = function(self, data)
    local tmp = {
        requestnum = number.valueOf(data.requestnum),--最低开赛人数
        type = number.valueOf(data.type),--比赛类型（0-快速赛，1-vip专属赛，2-限时赛，3-定时赛）
        mname = tostring(data.mname) or "",--比赛名称
        id = number.valueOf(data.id),--比赛ID
        gameid = number.valueOf(data.gameid),--游戏ID
        allowwaittime = tostring(data.allowwaittime) or "",--允许提前进入时间
        micon = tostring(data.micon) or "",--比赛icon
        applynum = number.valueOf(data.applynum),--报名人数
        allapplynum = number.valueOf(data.allapplynum),--报名总人数 带上了机器人人数
        matchpartitions = number.valueOf(data.matchpartitions),--分场
        fee = self:_analyseDataFee(data.fee),--报名费，为空则免费报名
        status = number.valueOf(data.status),--是否报名 1为报名 0为未报名
        champion = tostring(data.champion) or "",--冠军奖励信息
        stime = number.valueOf(data.stime),--开始时间 
        etime = number.valueOf(data.etime),--结束时间
        iconweight = number.valueOf(data.iconweight),--比赛icon权重，从小到大优先级
        isfhmatch = number.valueOf(data.isfhmatch),--是否复活赛

        configid = number.valueOf(data.configid, 0);--比赛配置ID
        looptype = number.valueOf(data.looptype, GameMatchHallConstants.eLoopType.NOT);--比赛循环周期 1:单场 2:多场
        loopinterval = number.valueOf(data.loopinterval or 0);--比赛循环间隔(单位为分钟)
        loopendtime = string.valueOf(data.loopendtime or "");--比赛循环截至时间(一天多场)
        rewardUrl = tostring(data.rewardUrl or "") or "",--比赛奖励图
        rewardDescribe = tostring(data.rewardDescribe or "") or "",--比赛奖励描述
        matchtags = self:_analyseDataTags(data.matchtags),--比赛标签(用于筛选)

        invitetype = number.valueOf(data.invitetype, -1),-- 邀请赛类型 0：邀请赛 1：集团赛
        matchentrycode = tostring(data.matchentrycode or "") or "",--比赛验证码
        matchentryinfo = tostring(data.matchentryinfo or "") or "",--比赛验证码获取方式
        firstbegintime = number.valueOf(data.firstbegintime),--首次开赛时间，用于循环赛显示
        advicon = tostring(data.advicon or "") or "", --比赛运营icon
        adIcon = data.adIcon and tostring(data.adIcon) or "",--720+ 广告图
        listSort = number.valueOf(data.listSort),--720+ 列表排序ID。从1开始，0或空最后
        threshold = number.valueOf(data.threshold),--报名门槛 0为不设置
        thresholdType = number.valueOf(data.thresholdType),--报名门槛类型 0：金币（银币） 1：金条
    };
    return tmp;
end

MatchListData._analyseDataFee = function(self, data)
    local tmp = {};
    for k, v in ipairs(table.verify(data)) do
        local item = self:_analyseDataFeeItem(k, v);
        if not table.isEmpty(item) then
            table.insert(tmp, item);
        end
    end
    return tmp;
end

MatchListData._analyseDataFeeItem = function(self, index, data)
    local tmp = {};
    for k, v in pairs(table.verify(data)) do
        local dataItem = table.verify(v);
        local item = {
            type = tostring(dataItem.type) or "",
            num = tostring(dataItem.num) or "",
            desc = tostring(dataItem.desc) or "",
            index = index,--记录原始顺序
        }
        if number.valueOf(item.num) ~= 0 then
            table.insert(tmp, item);
        end
    end
    return tmp;
end

MatchListData._analyseDataTags = function(self, data)
    local tmp = {};
    
    if type(data) == "string" and not string.isEmpty(data) then
        local info = string.split(data, ',');
        for k, v in pairs(table.verify(info)) do
            table.insert(tmp, number.valueOf(v));
        end
    end
    return tmp;
end

--获取我报名的列表回调
MatchListData.onInvitationalMyApplyLists = function(self, isSuccess, info, sendParam)
    self.m_myApplyLists = {}
    if isSuccess then
        for k, v in pairs(table.verify(info)) do
            table.insert(self.m_myApplyLists, self:_analyseMyApplyLists(v))
        end
    end
    self:execDelegate(MatchListData.Delegate.onInvitationalMyApplyLists, isSuccess, Copy(self.m_myApplyLists))
end

MatchListData._analyseMyApplyLists = function(self, data)
    local tmp = {
        mname = tostring(data.mname) or "",--比赛名称
        name = tostring(data.mname) or "",--比赛名称
        stime = number.valueOf(data.stime),--开始时间
        gameid = number.valueOf(data.gameid),--游戏ID
        gameId = number.valueOf(data.gameid),--游戏ID
        allowwaittime = tostring(data.allowwaittime) or "",--允许提前进入时间
        configid = number.valueOf(data.configid, 0);--比赛配置ID
        micon = tostring(data.micon) or "",--比赛icon
        status = number.valueOf(data.status),--是否报名 1为报名 0为未报名
        champion = tostring(data.champion) or "",--冠军奖励信息
        requestnum = number.valueOf(data.requestnum),--最低开赛人数
        type = number.valueOf(data.type),--比赛类型（0-快速赛，1-vip专属赛，2-限时赛，3-定时赛）
        etime = number.valueOf(data.etime),--结束时间
        id = number.valueOf(data.id),--比赛ID
        rewardUrl = tostring(data.rewardUrl or "") or "",--比赛奖励图
        fee = self:_analyseDataFee(data.fee),--报名费，为空则免费报名
        adIcon = data.adIcon and tostring(data.adIcon) or "",--720+ 广告图
        iconweight = number.valueOf(data.iconweight),--比赛icon权重，从小到大优先级
        matchtags = self:_analyseDataTags(data.matchtags),--比赛标签(用于筛选)
        listSort = number.valueOf(data.listSort),--720+ 列表排序ID。从1开始，0或空最后
        rewardDescribe = tostring(data.rewardDescribe or "") or "",--比赛奖励描述
        applynum = number.valueOf(data.applynum),--报名人数
        allapplynum = number.valueOf(data.allapplynum),--报名总人数 带上了机器人人数
        matchpartitions = number.valueOf(data.matchpartitions),--分场
        invitetype = number.valueOf(data.invitetype, -1), -- 邀请赛类型 0：邀请赛 1：集团赛
        matchentrycode = tostring(data.matchentrycode or "") or "",--比赛验证码
        matchentryinfo = tostring(data.matchentryinfo or "") or "",--比赛验证码获取方式
        firstbegintime = number.valueOf(data.firstbegintime),--首次开赛时间，用于循环赛显示
        isfhmatch = number.valueOf(data.isfhmatch),--是否复活赛
        looptype = number.valueOf(data.looptype, GameMatchHallConstants.eLoopType.NOT);--比赛循环周期 1:单场 2:多场
        loopinterval = number.valueOf(data.loopinterval or 0);--比赛循环间隔(单位为分钟)
        loopendtime = string.valueOf(data.loopendtime or "");--比赛循环截至时间(一天多场)
        advicon = tostring(data.advicon or "") or "", --比赛运营icon
        threshold = number.valueOf(data.threshold),--报名门槛 0为不设置
        thresholdType = number.valueOf(data.thresholdType),--报名门槛类型 0：金币（银币） 1：金条
        matchtype = number.valueOf(data.matchtype, -1),
        createId = number.valueOf(data.createid, -1),
    } 
    return tmp
end


MatchListData.s_socketCmdFuncMap = {
    [PHP_REQUEST_MATCH_LIST]                        = MatchListData.onGetMatchListCallBack;                -- php获取比赛列表
    [PHP_GET_NEXT_LOOP_MATCH]                       = MatchListData.onGetNextLoopMatchInfo;
    [PHP_INVITATIONAL_MY_APPLY_LISTS]               = MatchListData.onInvitationalMyApplyLists,
}

return MatchListData;
