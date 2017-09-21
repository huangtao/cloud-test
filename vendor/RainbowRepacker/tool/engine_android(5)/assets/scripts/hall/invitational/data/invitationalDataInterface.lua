require("gameData/dataInterfaceBase")
require("hall/invitational/socket/invitationalSocketCmd")
require("hall/invitational/socket/invitationalSocketReader")
require("hall/invitational/socket/invitationalSocketWriter")
require("hall/invitational/data/invitationalConstants")

InvitationalDataInterface = class(DataInterfaceBase)


InvitationalDataInterface.Delegate = {
	onInvitationalSelectConfig = "onInvitationalSelectConfig",
	onInvitationalAwardFormula = "onInvitationalAwardFormula",
	onInvitationalMatchMinPlayers = "onInvitationalMatchMinPlayers",
	onInvitationalRulesContent = "onInvitationalRulesContent",
	onResponseInvitationalDetail = "onResponseInvitationalDetail",
	onInvitationalQcodeUrl = "onInvitationalQcodeUrl",
	onResponseInvitationalCreate = "onResponseInvitationalCreate",
	onInvitationalAwardRank = "onInvitationalAwardRank",
	onResponseMyMatchInvitational = "onResponseMyMatchInvitational",
	onResponseErrorTipsInvitational = "onResponseErrorTipsInvitational",
	onCurRankInvitational = "onCurRankInvitational",
	onReceiveReturnInvitational = "onReceiveReturnInvitational",
	onRefreshMyMatchInvitational = "onRefreshMyMatchInvitational",
	onFeeReturnInvitational = "onFeeReturnInvitational",

}

InvitationalDataInterface.getInstance = function()
	if not InvitationalDataInterface.s_instance then
		InvitationalDataInterface.s_instance = new(InvitationalDataInterface)
	end
	return InvitationalDataInterface.s_instance
end

InvitationalDataInterface.ctor = function(self)
	self:initSocketManager()
	self:createSocketReader()
	self:createSocketWriter()
	self.m_invitationalData = new(require("hall/invitational/data/invitationalData"), self)
	self.m_invitationalCreateData = new(require("hall/invitational/data/invitationalCreateData"))
end

InvitationalDataInterface.dtor = function(self)

end

--获取创建邀请赛操作数据对象
InvitationalDataInterface.getInvitationalCreateData = function(self)
	return self.m_invitationalCreateData
end

--请求创建比赛参数选项配置
InvitationalDataInterface.requestSelectConfig = function(self)
	self.m_invitationalData:requestSelectConfig()
end

--获取创建比赛参数选项配置
InvitationalDataInterface.getSelectConfig = function(self)
	return self.m_invitationalData:getSelectConfig()
end

--获取创建比赛参数选项配置回调
InvitationalDataInterface.onInvitationalSelectConfig = function(self, isSuccess, info, sendParam)
	self:notify(InvitationalDataInterface.Delegate.onInvitationalSelectConfig, info)
end

--请求获取比赛规则内容
InvitationalDataInterface.requestRulesContent = function(self, gameId, minNum)
	self.m_invitationalData:requestRulesContent(gameId, minNum)
end

--获取比赛规则内容回调
InvitationalDataInterface.onInvitationalRulesContent = function(self, isSuccess, info, sendParam)
	self:notify(InvitationalDataInterface.Delegate.onInvitationalRulesContent, info)
end

--请求奖圈对应奖金分配公式
InvitationalDataInterface.requestAwardFormula = function(self)
	self.m_invitationalData:requestAwardFormula()
end

--获取奖圈对应奖金分配公式回调
InvitationalDataInterface.onInvitationalAwardFormula = function(self, isSuccess, info, sendParam)
	self:notify(InvitationalDataInterface.Delegate.onInvitationalAwardFormula, info)
end

--获取奖圈对应奖金分配公式
InvitationalDataInterface.getAwardFormula = function(self)
	return self.m_invitationalData:getAwardFormula()
end

--请求比赛创建界面最低参赛人数选项
InvitationalDataInterface.requestMatchMinPlayers = function(self, gameId)
	self.m_invitationalData:requestMatchMinPlayers(gameId)
end

--获取比赛创建界面最低参赛人数选项
InvitationalDataInterface.getMatchMinPlayers = function(self)
	return self.m_invitationalData:getMatchMinPlayers()
end

--获取比赛创建界面最低参赛人数选项回调
InvitationalDataInterface.onInvitationalMatchMinPlayers = function(self, isSuccess, info, sendParam)
	self:notify(InvitationalDataInterface.Delegate.onInvitationalMatchMinPlayers, info)
end

--请求邀请好友二维码地址
InvitationalDataInterface.requestQcodeUrl = function(self)
	self.m_invitationalData:requestQcodeUrl()
end

--获取邀请好友二维码地址回调
InvitationalDataInterface.onInvitationalQcodeUrl = function(self, isSuccess, info, sendParam)
	self:notify(InvitationalDataInterface.Delegate.onInvitationalQcodeUrl, isSuccess, info)
end

--获取当前邀请好友二维码地址
InvitationalDataInterface.getQcodeUrl = function(self)
	return self.m_invitationalData:getQcodeUrl()
end

--请求获取完整排名
InvitationalDataInterface.requestAwardRank = function(self, matchconfigid, page)
	local data = {ssid = kUserInfoData:getSsid(), matchconfigid = matchconfigid, page = page or 1}
	OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_AWARDRANK, data)
end

--获取完整排名回调
InvitationalDataInterface.onInvitationalAwardRank = function(self, isSuccess, info, sendParam)
	self:notify(InvitationalDataInterface.Delegate.onInvitationalAwardRank, isSuccess, info)
end

--设置当前选择的我创建的邀请赛的数据
InvitationalDataInterface.setCurMyMatchItemData = function(self, data)
	self.m_curMyMatchItemData = data
end

--获取当前选择的我创建的邀请赛的数据
InvitationalDataInterface.getCurMyMatchItemData = function(self)
	return self.m_curMyMatchItemData
end

InvitationalDataInterface.setPasswordAndQrName = function(self, password, qrName)
	self.m_curPasswordAndQrName = {}
	self.m_curPasswordAndQrName.password = password
	self.m_curPasswordAndQrName.qrName = qrName
end

InvitationalDataInterface.getPasswordAndQrName = function(self)
	if self.m_curPasswordAndQrName then
		return self.m_curPasswordAndQrName.password, self.m_curPasswordAndQrName.qrName
	end
	return nil, nil
end

InvitationalDataInterface.clearPasswordAndQrName = function(self)
	self.m_curPasswordAndQrName = nil
end

--邀请赛错误提示
InvitationalDataInterface.onResponseErrorTipsInvitational = function(self, info)
	self:notify(InvitationalDataInterface.Delegate.onResponseErrorTipsInvitational, info)
end

--请求当前排名
InvitationalDataInterface.getCurrentAwardRank = function(self, matchId)
	OnlineSocketManager.getInstance():sendMsg(CUR_RANK_INVITATIONA_REQUEST, {userId= kUserInfoData:getUserId(), matchId = matchId})
end

--获取当前排名回复
InvitationalDataInterface.onCurRankInvitational = function(self, info)
	if info.curPage == 1 then
		self.m_curRank = {}
	end
	local data = self:_analyseCurRank(info.rank)
	for _,v in pairs(data) do
		table.insert(self.m_curRank, v)
	end
	if info.pageCount == info.curPage then --接收完数据
		local function sortfunction(a, b)
			return a.userInfo.rank < b.userInfo.rank
		end
		table.sort(self.m_curRank, sortfunction)
		self:notify(InvitationalDataInterface.Delegate.onCurRankInvitational, self.m_curRank)
	end
end

InvitationalDataInterface._analyseCurRank = function(self, info)
	local data = {}
	for k,v in pairs(info) do
		local userInfo = self:_analyseCurRankItem(v.userInfoStr)
		if userInfo.rank > 0 then
			table.insert(data, {uid=v.uid, userInfo = userInfo})
		end
	end
	return data
end

InvitationalDataInterface._analyseCurRankItem = function(self, userInfoStr)
	local userInfo = table.verify(json.decode(userInfoStr))
	local temp = {}
	temp.username = tostring(userInfo.username or "")
	temp.cid = number.valueOf(userInfo.cid)
	temp.score = number.valueOf(userInfo.score)
	temp.rank = number.valueOf(userInfo.rank)
 	return temp
end

--创建邀请赛
InvitationalDataInterface.createMatch = function(self, data)
	data.userinfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(data.gameId)
	data.regionId = kClientInfo:getRegionId()
	Log.v("createMatch=============", data)
	self.m_socket:sendMsg(CREATE_INVITATIONAL_REQUEST, data)
end

--请求退还奖池
InvitationalDataInterface.receiveReturnReward = function(self, matchId, matchConfigId)
	self.m_socket:sendMsg(RECEIVE_RETURN_INVITATIONA_REQUEST, {matchId = matchId, matchConfigId = matchConfigId})
end

--退还奖池回复
InvitationalDataInterface.onReceiveReturnInvitational = function(self, info)
	local data = self:_analyseReceiveReturn(info)
	if data.moneyInfo.money then
		UserPropertyIsolater.getInstance():setMoney(data.moneyInfo.money)
	end
	if data.moneyInfo.silver then
		UserPropertyIsolater.getInstance():setCrystal(data.moneyInfo.silver)
	end
	self:notify(InvitationalDataInterface.Delegate.onReceiveReturnInvitational, data)
end

--退还报名费回复
InvitationalDataInterface.onFeeReturnInvitational = function(self, info)
	local data = self:_analyseReceiveReturn(info) --与退还奖池结构一样
	if data.moneyInfo.money then
		UserPropertyIsolater.getInstance():setMoney(data.moneyInfo.money)
	end
	if data.moneyInfo.silver then
		UserPropertyIsolater.getInstance():setCrystal(data.moneyInfo.silver)
	end
	self:notify(InvitationalDataInterface.Delegate.onFeeReturnInvitational, data)
end

InvitationalDataInterface._analyseReceiveReturn = function(self, info)
	local data = {moneyInfo = {}}
	data.uid = number.valueOf(info.uid)
	local moneyInfo = table.verify(json.decode(info.moneyInfo))
	if not table.isEmpty(moneyInfo) then
		data.moneyInfo.money = number.valueOf(moneyInfo.money)
		data.moneyInfo.silver = number.valueOf(moneyInfo.silver)
	end
	return data
end

--刷新列表回复
InvitationalDataInterface.onRefreshMyMatchInvitational = function(self, matchInfo)
	Log.v("onRefreshMyMatchInvitational",matchInfo)
	local data = self:_analyseRefreshMyMatch(matchInfo)
	if self.m_myMatch then
		for k,v in pairs(self.m_myMatch) do
			if v.matchConfigId == data.matchConfigId then
				--self.m_myMatch[k] = data
				for k2,v2 in pairs(data) do
					self.m_myMatch[k][k2] = v2
				end
				Log.v("onRefreshMyMatchInvitational self.m_myMatch",self.m_myMatch)
				self:notify(InvitationalDataInterface.Delegate.onResponseMyMatchInvitational, self.m_myMatch)
				break
			end
		end
	end
	self:notify(InvitationalDataInterface.Delegate.onRefreshMyMatchInvitational, info)
end


--请求我创建的邀请赛回复
InvitationalDataInterface.onResponseMyMatchInvitational = function(self, info)
	self.m_myMatch = {}
	for i,v in ipairs(info) do
		table.insert(self.m_myMatch, self:_analyseMyMatch(v))
	end
	Log.v("onResponseMyMatchInvitational", info,self.m_myMatch)
	self:notify(InvitationalDataInterface.Delegate.onResponseMyMatchInvitational, self.m_myMatch)
end

--校验我创建的邀请赛item
InvitationalDataInterface._analyseMyMatch = function(self, itemStr)
	local data = table.verify(json.decode(itemStr))
	if table.isEmpty(data) then
		return {}
	end
    local tmp = {
        matchConfigId = tostring(data[1] or 0),
		areaId = number.valueOf(data[2]),
		createId = number.valueOf(data[3]),
		startTime = number.valueOf(data[4]),
		matchId = number.valueOf(data[5]),
		awardType = number.valueOf(data[6]),
		awardCount = number.valueOf(data[7]),
		feeType = number.valueOf(data[8]),
		fee = number.valueOf(data[9]),
		totalEntryFee = number.valueOf(data[10]),
		matchUserCount = number.valueOf(data[11]),--报名人数
		matchName = tostring(data[12] or ""),
		status = number.valueOf(data[13]),
		returnFlag = number.valueOf(data[14]),
		matchentrycode = tostring(data[15] or ""),
		matchJoinCount = number.valueOf(data[16]),--参赛人数
    };
    return tmp;
end

--校验我创建的邀请赛item
InvitationalDataInterface._analyseRefreshMyMatch = function(self, itemStr)
	local data = table.verify(json.decode(itemStr))
	if table.isEmpty(data) then
		return {}
	end
    local tmp = {
        areaId = number.valueOf(data.AreaId),
        createId = number.valueOf(data.CreateId),
        fee = number.valueOf(data.entry_fee),
        feeType = number.valueOf(data.Eentry_fee_type),
        matchConfigId = tostring(data.MatchConfigId or 0), --这个用number会丢失精确度
        matchId = number.valueOf(data.MatchId),
        matchName = tostring(data.MatchName or ""),
        startTime = number.valueOf(data.StartTime),
        awardCount = number.valueOf(data.award_count),
        awardType = number.valueOf(data.award_type),
        matchUserCount = number.valueOf(data.match_user_count),
        status = number.valueOf(data.statue),
        totalEntryFee = number.valueOf(data.total_entry_fee),
        returnFlag = number.valueOf(data.return_flag),
    };
    return tmp;
end

--根据获取名次类型、获取名次值、最低开赛人数获取奖圈人数
InvitationalDataInterface.getAwardCount = function(self, award_ranking_type, award_ranking_value, min_players)
	local award_count = 0
	if not award_ranking_type or not award_ranking_value or not min_players then
		return award_count
	end
	if award_ranking_type == "num" then
		award_count = award_ranking_value
	elseif award_ranking_type == "percent" then
		award_count = math.floor(min_players * award_ranking_value + 0.5)
	end
	return award_count
end

--获取邀请赛详细信息
InvitationalDataInterface.enterMatch = function(self, data)
	data.uid = UserBaseInfoIsolater.getInstance():getUserId()
	data.userinfo = CommonPlayerInfoHandler2.getInstance():getUserLoginJsonInfo(data.gameId)
	self.m_socket:sendMsg(ENTER_INVITATIONA_REQUEST, data)
end

--报名邀请赛
InvitationalDataInterface.enrollMatch = function(self, info)
    local data = {};
    data.uid = UserBaseInfoIsolater.getInstance():getUserId();
    data.roomId = info.roomId
    data.key = "55ff85e777d50680fb52935076d7e55b"
    local userLoginInfo = CommonPlayerInfoHandler2.getInstance():getUserLoginInfo(info.gameId);
    userLoginInfo.feeType = (info.fee and info.fee[1] and info.fee[1][1]) and number.valueOf(info.fee[1][1].type) or 0
    data.userInfo = CommonPlayerInfoHandler2.getInstance():encodeUserLoginJsonInfo(userLoginInfo)
    data.flag = 0;
    data.type = info.type
    data.matchentrycode = info.matchentrycode
    data.regionId = kClientInfo:getRegionId()
    SocketIsolater.getInstance():sendMsg(ENROll_INVITATIONA_REQUEST, data)
    Log.d("InvitationalDataInterface.enrollMatch","报名",data, info);
end


--获取我创建的申请赛
InvitationalDataInterface.getMyMatch = function(self)
	self.m_socket:sendMsg(MY_MATCH_INVITATIONA_REQUEST, {})
end

--根据奖圈人数拿奖金分配配置
InvitationalDataInterface.getAwardConfigByCount = function(self, count)
	local awardFormula = self:getAwardFormula()
	if table.isEmpty(awardFormula) then
		return {}
	end
	for k,v in pairs(awardFormula) do
		if v.p_range_start <= count and v.p_range_end >= count then
			return v.award_ratio
		end
	end
	return {}
end

--获取每个人的奖金
InvitationalDataInterface.getSingleAwardData = function(self, config, award, award_count)
	local t = {}
	if table.isEmpty(config) or not award or not award_count then
		return t
	end
	local count = 0
	for i = 2, #config do
		local nums = math.min(config[i].rank_end, award_count) - config[i].rank_start + 1
		local item = math.floor((award * (config[i].value / 100)) / nums)
		count = count + nums * item
		table.insert(t, item) 
	end
	table.insert(t, 1, award - count)
	return t
end

--邀请赛详细信息回复
InvitationalDataInterface.onResponseInvitationalDetail = function(self, info)
	Log.v("onResponseInvitationalDetail======", info)
	self.m_detail = info
	self:notify(InvitationalDataInterface.Delegate.onResponseInvitationalDetail, self:_analyseDetail())
end

InvitationalDataInterface._analyseDetail = function(self)
	local data = table.verify(json.decode(self.m_detail.config))
	if table.isEmpty(data) then
		return {}
	end
    local tmp = {
        requestnum = number.valueOf(data.LeastNumberOfStart),--最低开赛人数
        type = number.valueOf(self.m_detail.matchtype),--比赛类型（0-快速赛，1-vip专属赛，2-限时赛，3-定时赛）
        mname = tostring(data.MatchName or ""),--比赛名称
        name = tostring(data.MatchName or ""),--比赛名称
        id = number.valueOf(data.RoomId),--比赛ID
        gameid = number.valueOf(data.GameId),--游戏ID
        gameId = number.valueOf(data.GameId),--游戏ID
        allowwaittime = "",--允许提前进入时间
        micon = "",--比赛icon
        applynum = number.valueOf(self.m_detail.signupcount),--报名人数
        allapplynum = number.valueOf(self.m_detail.signupcount),--报名总人数 带上了机器人人数
        fee = self:_analyseDataFee(data.EntyFee_List),--报名费，为空则免费报名
        status = number.valueOf(self.m_detail.status),--是否报名 1为报名 0为未报名
        champion = "",--冠军奖励信息
        stime = number.valueOf(data.StartTime),--开始时间 
        etime = 0,--结束时间
        iconweight = 0,--比赛icon权重，从小到大优先级
        isfhmatch = 0,--是否复活赛

        configid = data.ConfigId;--比赛配置ID
        looptype = GameMatchHallConstants.eLoopType.NOT;--比赛循环周期 1:单场 2:多场
        loopinterval = 0;--比赛循环间隔(单位为分钟)
        loopendtime = "";--比赛循环截至时间(一天多场)
        rewardUrl = "",--比赛奖励图
        rewardDescribe = "",--比赛奖励描述
        matchtags = {},--比赛标签(用于筛选)

        invitetype = number.valueOf(data.invitetype, 0),-- 邀请赛类型 0：邀请赛 1：集团赛
        matchentrycode = tostring(data.PassWord or ""),--比赛验证码
        matchentryinfo = "",--比赛验证码获取方式
        firstbegintime = 0,--首次开赛时间，用于循环赛显示
        advicon = "", --比赛运营icon
        adIcon = "",--720+ 广告图
        listSort = 0,--720+ 列表排序ID。从1开始，0或空最后
        threshold = 0,--报名门槛 0为不设置
        thresholdType = 0,--报名门槛类型 0：金币（银币） 1：金条
        estimateduration = number.valueOf(self.m_detail.mtime), --预计比赛时间
        roomId = data.RoomId,
        awardsList = self:_analyseDataAwards(data.Awards_List, data.AwardsRangeList),
        rulesContent = data.RulesContent,
        createId = number.valueOf(data.CreateId),
        matchpartitions = number.valueOf(data.matchpartitions),
    };
    Log.v("InvitationalDataInterface._analyseDetail",data,tmp)
    return tmp;
end

InvitationalDataInterface._analyseDataFee = function(self, data)
    local tmp = {};
    local list = table.verify(json.decode(data))
    Log.v("InvitationalDataInterface._analyseDataFee", list)
    for k, v in pairs(list) do
        local item = self:_analyseDataFeeItem(k, v);
        if item[1].num ~=0 then
        	table.insert(tmp, item);
        end
    end
    return tmp;
end

InvitationalDataInterface._analyseDataFeeItem = function(self, index, data)
    local tmp = {};
    for k, v in pairs(table.verify(data)) do
        local dataItem = table.verify(v);
        local item = {
            type = tonumber(dataItem.type) or 0,
            num = tonumber(dataItem.value) or 0,
            desc = "",
            index = index,
        }
        table.insert(tmp, item);
    end
    return tmp;
end


InvitationalDataInterface._analyseDataAwards = function(self, awardsData, awardsRangeData)
    local tmpList = {}
    local tmpRangeList = {}
    local awardsList = table.verify(json.decode(awardsData))
    local awardsRangeList = table.verify(json.decode(awardsRangeData))
    for k,v in pairs(awardsRangeList) do
    	tmpRangeList[tonumber(k)] = {["begin"] = number.valueOf(v["start"]), ["end"] = number.valueOf(v["end"])}
    end
    for k, v in pairs(awardsList) do
    	tmpList[tonumber(k)] = {rank=self:_analyseDataAwardsRank(k, tmpRangeList), desc=self:_analyseDataAwardsItem(v), sort = tonumber(k)}
    end
    return tmpList;
end

InvitationalDataInterface._analyseDataAwardsRank = function(self, key, awardsRangeList)
	Log.v("_analyseDataAwardsRank",key,awardsRangeList)
    local item = awardsRangeList[tonumber(key)]
    if table.isEmpty(item) then
    	return string.format("第%s名", key or "")
    end
    if item["begin"] == item["end"] then
    	return string.format("第%s名", item["begin"] or "")
    else
    	return string.format("第%s-%s名", item["begin"] or "", item["end"] or "")
    end
end

InvitationalDataInterface._analyseDataAwardsItem = function(self, data)
    local desc = ""
    for k, v in pairs(table.verify(data)) do
        local dataItem = table.verify(v)
        desc = string.format("%s%s", dataItem.value, self:getMoneyNameByType(tonumber(dataItem.type)))
    end
    return desc
end

--检验是否需要密码
InvitationalDataInterface.isNeedPassword = function(self, itemData)
    local isNeedPassword = false
    if not table.isEmpty(itemData) and number.valueOf(itemData.invitetype) == InvitationalConstants.eMatchInviteType.INVITATIONAL and 
    	not string.isEmpty(itemData.matchentrycode) then
        isNeedPassword = true
    end
    return isNeedPassword
end

--邀请赛创建回复
InvitationalDataInterface.onResponseInvitationalCreate = function(self, data)
	local info = self:_analyseCreate(data)
	if info.moneyInfo then
		if info.moneyInfo.money then
			UserPropertyIsolater.getInstance():setMoney(info.moneyInfo.money)
		end
		if info.moneyInfo.silver then
			UserPropertyIsolater.getInstance():setCrystal(info.moneyInfo.silver)
		end
	end
	Log.v("onResponseInvitationalCreate======", data,info)
	self:notify(InvitationalDataInterface.Delegate.onResponseInvitationalCreate, info)
end


InvitationalDataInterface._analyseCreate = function(self, data)
	local temp = {moneyInfo={}}
	temp.roomId = number.valueOf(data.roomId)
	local mInfo = table.verify(json.decode(data.moneyInfo))
	if not table.isEmpty(mInfo) then
		temp.moneyInfo.money = number.valueOf(mInfo.money)
		temp.moneyInfo.silver = number.valueOf(mInfo.silver)
	end
    return temp
end

--根据货币类型获取货币名字
InvitationalDataInterface.getMoneyNameByType = function(self, typ)
    local coinID = RechargeDataInterface.getInstance():getPropertySilverCoinID()
    local goldBarID = RechargeDataInterface.getInstance():getPropertyGoldBarID()
    if typ == coinID then
        return "银币"
    elseif typ == goldBarID then
        return "金条"
    end
    return ""
end

--根据奖励获取比赛名字
InvitationalDataInterface.getMatchNameByAward = function(self, award_type, award)
	local nickName = kUserInfoData:getNickname()
	if ToolKit.utf8_len(nickName) > 8 then
		nickName = ToolKit.formatNick(nickName, 6)
	end
	local moneyName = self:getMoneyNameByType(award_type)
	local len = string.len(tostring(award))
	local d = (len >=9) and 100000000 or 10000
	d = (len < 5) and 1 or d
	local unit = (len >=9) and "亿" or "万"
	unit = (len < 5) and "" or unit
	return string.format("%s的%s%s%s赛", nickName, math.floor(award / d), unit, moneyName)
end

--获取开赛时间
InvitationalDataInterface.getStartTime = function(self)
	local after = 10
	local t = os.date("*t", GameInfoIsolater.getInstance():getRightTimeWithServer() + after * 60)
	local plus = (t.min % 5 == 0) and after or (after + (5 -  t.min % 5)) --默认10分钟以后5分的整数
	t = os.date("*t", GameInfoIsolater.getInstance():getRightTimeWithServer() + plus * 60)
	t.sec = 0
	return os.time(t)
end

--获取选中的索引
InvitationalDataInterface.getSelectIndex = function(self, val, data)
	if table.isEmpty(data) then
		return nil
	end
	for k,v in pairs(data) do
		if v == val then
			return k
		end
	end
	return nil
end

--获取选中获奖名次的索引
InvitationalDataInterface.getSelectRankingIndex = function(self, typ, val, data)
	if table.isEmpty(data) then
		return nil
	end
	for k,v in pairs(data) do
		if v["type"] == typ and v["value"] == val then
			return k
		end
	end
	return nil
end

--获取选中游戏的索引
InvitationalDataInterface.getSelectGameIndex = function(self, val, data)
	if table.isEmpty(data) then
		return nil
	end
	for k,v in pairs(data) do
		if v["id"] == val then
			return k
		end
	end
	return nil
end

InvitationalDataInterface.initSocketManager = function(self)
	self.m_socket = OnlineSocketManager.getInstance();
end 

InvitationalDataInterface.createSocketReader = function(self)
	self.m_socketReader = new(InvitationalSocketReader)
	self.m_socket:addSocketReader(self.m_socketReader)
end

InvitationalDataInterface.createSocketWriter = function(self)
	self.m_socketWriter = new(InvitationalSocketWriter)
	self.m_socket:addSocketWriter(self.m_socketWriter)
end

InvitationalDataInterface.s_socketCmdFuncMap = {
	[INVITATIONA_DETAIL_REPONSE]			= InvitationalDataInterface.onResponseInvitationalDetail,
	[INVITATIONA_CREATE_REPONSE]			= InvitationalDataInterface.onResponseInvitationalCreate,
	[INVITATIONA_MY_MATCH_REPONSE]			= InvitationalDataInterface.onResponseMyMatchInvitational,
	[INVITATIONA_ERROR_TIPS_REPONSE]		= InvitationalDataInterface.onResponseErrorTipsInvitational,
	[INVITATIONA_CUR_RANK_REPONSE] 			= InvitationalDataInterface.onCurRankInvitational,
	[INVITATIONA_RECEIVE_RETURN_REPONSE]	= InvitationalDataInterface.onReceiveReturnInvitational,
	[INVITATIONA_REFRESH_MY_MATCH_REPONSE]	= InvitationalDataInterface.onRefreshMyMatchInvitational,
	[INVITATIONA_FEE_RETURN_REPONSE]		= InvitationalDataInterface.onFeeReturnInvitational,
}