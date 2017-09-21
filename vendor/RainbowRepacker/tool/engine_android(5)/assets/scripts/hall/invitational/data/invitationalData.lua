--邀请赛数据源
local InvitationalData = class(GameData)

InvitationalData.Delegate = {
    onInvitationalSelectConfig = "onInvitationalSelectConfig",
    onInvitationalRulesContent = "onInvitationalRulesContent",
    onInvitationalAwardFormula = "onInvitationalAwardFormula",
    onInvitationalMatchMinPlayers = "onInvitationalMatchMinPlayers",
    onInvitationalQcodeUrl = "onInvitationalQcodeUrl",
    onInvitationalAwardRank = "onInvitationalAwardRank",
}

InvitationalData.ctor = function(self)

end

InvitationalData.initData = function(self)
end

InvitationalData.loadDictData = function(self, dict)
    self.m_localFormulaVersion = dict:getInt("formulaVersion", -1)
    local strFormula = dict:getString("formulaData")
    local tmpFormula = table.verify(json.decode(strFormula))
    if not table.isEmpty(tmpFormula) then
        self.m_AwardFormula = tmpFormula
    end
end

InvitationalData.saveDictData = function(self, dict)
    dict:setInt("formulaVersion", self:getLocalFormulaVersion())
    dict:setString("formulaData", json.encode(table.verify(self.m_AwardFormula)) or "")
end

InvitationalData.getLocalDictName = function(self)
    return "invitationalConfig"
end

InvitationalData.getLocalFormulaVersion = function(self)
    return self.m_localFormulaVersion or -1
end

--请求奖圈对应奖金分配公式
InvitationalData.requestAwardFormula = function(self)
    local data = {ssid = kUserInfoData:getSsid(), ["cli_ver"] = self:getLocalFormulaVersion()}
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_AWARD_FORMULA, data)
end

--获取奖圈对应奖金分配公式回调
InvitationalData.onInvitationalAwardFormula = function(self, isSuccess, info, sendParam)
    if isSuccess and not table.isEmpty(info) then
        self.m_AwardFormula = self:_analyseAwardFormula(info.data)
        self.m_localVersion = number.valueOf(info.svr_ver, -1)
        self:saveData()
    end
    self:execDelegate(InvitationalData.Delegate.onInvitationalAwardFormula, isSuccess, table.verify(self.m_AwardFormula), sendParam)
end

--获取奖圈对应奖金分配公式
InvitationalData.getAwardFormula = function(self)
    return self.m_AwardFormula
end

--检验奖圈对应奖金分配公式
InvitationalData._analyseAwardFormula = function(self, data)
    local t = {}
    for i,v in ipairs(table.verify(data)) do
        t[i] = {}
        t[i].p_range_start = number.valueOf(v.p_range_start)
        t[i].p_range_end = number.valueOf(v.p_range_end)
        t[i].award_ratio = {}
        for i2,v2 in ipairs(table.verify(v.award_ratio)) do
            t[i].award_ratio[i2] = {
                value = number.valueOf(v2.value),
                rank_start = number.valueOf(v2.rank_start),
                rank_end = number.valueOf(v2.rank_end),
            }
        end
    end
    return t
end

--请求创建比赛参数选项配置
InvitationalData.requestSelectConfig = function(self)
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_SELECT_CONFIG, {ssid = kUserInfoData:getSsid()})
end

--请求创建比赛参数选项配置回调
InvitationalData.onInvitationalSelectConfig = function(self, isSuccess, info, sendParam)
    if isSuccess and not table.isEmpty(info) then
        self.m_SelectConfig = self:_analyseSelectConfig(info)
    end
    self:execDelegate(InvitationalData.Delegate.onInvitationalSelectConfig, isSuccess, table.verify(self.m_SelectConfig), sendParam)
end

--获取创建比赛参数选项配置
InvitationalData.getSelectConfig = function(self)
    return self.m_SelectConfig
end

--检验创建比赛参数选项配置
InvitationalData._analyseSelectConfig = function(self, data)
    local t = {games={},award_ranking={},default={},enter_fee={type1={},type0={}},award_config={type1={},type0={}}}
    data = table.verify(data)

    --游戏选项
    for i,v in ipairs(table.verify(data.games)) do
        t.games[i] = {id=number.valueOf(v.id), name=tostring(v.name or "")}
    end

    --获奖名次选项
    for i,v in ipairs(table.verify(data.award_ranking)) do
        t.award_ranking[i] = {value=number.valueOf(v.value), type=tostring(v.type or ""), name=tostring(v.name or "")}
    end

    --默认配置
    local default_data = table.verify(data.default)
    local default_award_ranking = table.verify(default_data.award_ranking)
    local default_enter_fee = table.verify(default_data.enter_fee)
    local default_game = table.verify(default_data.game)
    local default_award_config = table.verify(default_data.award_config)
    t.default = {
        award_ranking = {
            value=number.valueOf(default_award_ranking.value), 
            type=tostring(default_award_ranking.type or ""),
            name=tostring(default_award_ranking.name or ""),
        },
        enter_fee = {
            value=number.valueOf(default_enter_fee.value), 
            type=number.valueOf(default_enter_fee.type),
        },
        start_time = number.valueOf(default_data.start_time),
        inmatch_num = number.valueOf(default_data.inmatch_num),
        game = {
            id=number.valueOf(default_game.id), 
            name=tostring(default_game.name or ""),
        },
        award_config = {
            value=number.valueOf(default_award_config.value), 
            type=number.valueOf(default_award_config.type),
        },
    }
    
    --报名费用选项
    local enter_fee = table.verify(data.enter_fee)
    for k,_ in pairs(t.enter_fee) do
        for k2,v2 in pairs(table.verify(enter_fee[k])) do
            t.enter_fee[k][k2] = number.valueOf(v2)
        end
    end

    --奖品设置选项
    local award_config = table.verify(data.award_config)
    for k,_ in pairs(t.award_config) do
        for k2,v2 in pairs(table.verify(award_config[k])) do
            t.award_config[k][k2] = number.valueOf(v2)
        end
    end

    return t
end

--请求获取比赛规则内容
InvitationalData.requestRulesContent = function(self, gameId, minNum)
    local data = {ssid = kUserInfoData:getSsid(), game_id = gameId, players_min_num =minNum}
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_RULES_CONTENT, data)
end

--获取比赛规则内容回调
InvitationalData.onInvitationalRulesContent = function(self, isSuccess, info, sendParam)
    self:execDelegate(InvitationalData.Delegate.onInvitationalRulesContent, isSuccess, self:_analyseRulesContent(table.verify(info)), sendParam)
end

--检验比赛规则内容
InvitationalData._analyseRulesContent = function(self, data)
    return {
        rules = tostring(data.rules or ""),
        prepare = tostring(data.prepare or ""),
        finals = tostring(data.finals or ""),
    }
end

--请求比赛创建界面最低参赛人数选项
InvitationalData.requestMatchMinPlayers = function(self, gameId)
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_MATCH_MIN_PLAYERS, {ssid = kUserInfoData:getSsid(), game_id = gameId})
end

--请求比赛创建界面最低参赛人数选项回调
InvitationalData.onInvitationalMatchMinPlayers = function(self, isSuccess, info, sendParam)
    if isSuccess then
        self.m_MinPlayers = self:_analyseMatchMinPlayers(info)
    end
    self:execDelegate(InvitationalData.Delegate.onInvitationalMatchMinPlayers, isSuccess, table.verify(self.m_MinPlayers), sendParam)
end

--检验比赛创建界面最低参赛人数选项
InvitationalData._analyseMatchMinPlayers = function(self, data)
    local t = {}
    for i,v in ipairs(table.verify(data)) do
        t[i] = number.valueOf(v)
    end
    return t
end

--获取请求比赛创建界面最低参赛人数选项
InvitationalData.getMatchMinPlayers = function(self)
    return self.m_MinPlayers
end

--请求邀请好友二维码地址
InvitationalData.requestQcodeUrl = function(self)
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_QCODEURL, {ssid = kUserInfoData:getSsid()})
end

--获取邀请好友二维码地址回调
InvitationalData.onInvitationalQcodeUrl = function(self, isSuccess, info, sendParam)
    if isSuccess and not table.isEmpty(info) then
        self.m_currentQcodeUrl = self:_analyseQcodeUrl(info)
    end
    self:execDelegate(InvitationalData.Delegate.onInvitationalQcodeUrl, isSuccess, self.m_currentQcodeUrl, sendParam)
end

--获取当前邀请好友二维码地址
InvitationalData.getQcodeUrl = function(self)
    return self.m_currentQcodeUrl
end

--检验邀请好友二维码地址
InvitationalData._analyseQcodeUrl = function(self, data)
    return tostring(data.info or "")
end

--请求获取完整排名
InvitationalData.requestAwardRank = function(self, matchconfigid, page)
    local data = {ssid = kUserInfoData:getSsid(), matchconfigid = matchconfigid, page = page or 1}
    OnlineSocketManager.getInstance():sendMsg(PHP_INVITATIONAL_AWARDRANK, data)
end

--获取完整排名回调
InvitationalData.onInvitationalAwardRank = function(self, isSuccess, info, sendParam)
    if isSuccess and not table.isEmpty(info) then
        local matchconfigid = tostring(info.matchconfigid)
        local matchname = tostring(info.matchname) --比赛名字
        local tpage = number.valueOf(info.tpage) --总页数
        local page = number.valueOf(info.page) --当前页数
        if page == 1 then
            self.m_awardRank = {}
        end
        for k,v in pairs(table.verify(info.lists)) do
            table.insert(self.m_awardRank, self:_analyseAwardRank(v))
        end
        if page < tpage then
            self:requestAwardRank(matchconfigid, page + 1)
            return
        end
        local function sortfunction(a, b)
            return a.rank_id < b.rank_id
        end
        table.sort(self.m_awardRank, sortfunction)
        self:execDelegate(InvitationalData.Delegate.onInvitationalAwardRank, isSuccess, self.m_awardRank, sendParam)
    end
    self:execDelegate(InvitationalData.Delegate.onInvitationalAwardRank, isSuccess, {}, sendParam)
end

--检验完整排名
InvitationalData._analyseAwardRank = function(self, item)
    local award = {}
    for k,v in pairs(table.verify(item.award)) do
        table.insert(award, {type=number.valueOf(v.type),value=number.valueOf(v.value)})
    end
    local temp = {
        rank_id = number.valueOf(item.rank_id),
        nick = tostring(item.nick),
        cid = number.valueOf(item.cid),
        award = award,
    }
    return temp
end

InvitationalData.s_socketCmdFuncMap = {
    [PHP_INVITATIONAL_SELECT_CONFIG]        = InvitationalData.onInvitationalSelectConfig,
    [PHP_INVITATIONAL_RULES_CONTENT]        = InvitationalData.onInvitationalRulesContent,
    [PHP_INVITATIONAL_AWARD_FORMULA]        = InvitationalData.onInvitationalAwardFormula,
    [PHP_INVITATIONAL_MATCH_MIN_PLAYERS]    = InvitationalData.onInvitationalMatchMinPlayers,
    [PHP_INVITATIONAL_QCODEURL]             = InvitationalData.onInvitationalQcodeUrl,
    [PHP_INVITATIONAL_AWARDRANK]            = InvitationalData.onInvitationalAwardRank,
}

return InvitationalData
