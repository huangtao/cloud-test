require("gameData/gameData");
require("core/dict");
require("common/base64");

--比赛奖励和规则信息
local MatchDetailData = class(GameData);

MatchDetailData.Delegate = {
    onResponseMatchDetail = "onResponseMatchDetail";  
};

MatchDetailData.ctor = function(self)   
end

MatchDetailData.dtor = function(self)
end

MatchDetailData.initData = function(self)
    self.m_data = {};
end

MatchDetailData.cleanUnuseData = function(self, matchList)
    if table.isEmpty(matchList) then
        return;
    end

    for matchid, info in pairs(self.m_data) do
        local found = false;
        for k, v in pairs(matchList) do
            if v.id == matchid then
                found = true;
                break;
            end
        end

        if not found then
            self.m_data[matchid] = nil;
        end
    end
end

MatchDetailData.cleanMatchDetailByMatchId = function(self, matchId)
    if matchId then
        local id = number.valueOf(matchId);
        self.m_data[id] = nil;
    end 
end

MatchDetailData.updateMemData = function(self, data, matchId)
    local matchData = self:_analyseData(data, matchId); 
    self.m_data[matchId] = matchData;
end

--@brief 请求比赛详情
MatchDetailData.requestMatchDetail = function(self, matchId, groupId)
    local localData = self.m_data[matchId];
    if table.isEmpty(localData) then
        local matchstatus = groupId and 1 or 0;
        SocketIsolater.getInstance():sendMsg(PHP_REQUEST_MATCH_DETAIL, {matchid = matchId, matchstatus = matchstatus, groupId = groupId})
    else
       self:notifyResponseMatchDetail(localData,matchId);
    end
end

--@brief 比赛详情回调
MatchDetailData.onResponseMatchDetail = function(self, isSuccess, data, sendParam)
    if not sendParam.matchid then
        return;
    end

    if isSuccess then
        self:updateData(true, data, sendParam.matchid);
        self:notifyResponseMatchDetail(self.m_data[sendParam.matchid],sendParam.matchid);
    end
end

--@brief 通知回复
MatchDetailData.notifyResponseMatchDetail = function(self, matchDetailData,matchId)
     --临时保存到本地，里面有商家奖品列表，在比赛结束界面会用到
    local dict = new(Dict,"matchRewardTmp");
    if dict then
        dict:load();
        dict:setString("rewardStr",json.encode(matchDetailData));
        dict:save();
        delete(dict);
    end
    self:execDelegate(MatchDetailData.Delegate.onResponseMatchDetail, Copy(matchDetailData),matchId);
end

--@brief 解析比赛详情数据
MatchDetailData._analyseData = function(self, data, matchId)
    data = table.verify(data);
    data.matchid = matchId;
    data.desc = tostring(data.desc or "") or "";
    data.awardcount = tonumber(data.awardcount) or 0;
    data.estimateduration = tonumber(data.estimateduration) or 0;
    data.isSupportReport = number.valueOf(data.opencheatreport) == 1; --是否支持举报:0关闭，1开启
    data.awardsmap = table.verify(data.awardsmap);
    for k, v in pairs(data.awardsmap) do
        data.awardsmap[k] = tostring(v or "") or "";
    end

    data.icon = table.verify(data.icon);
    for k, v in pairs(data.icon) do
        data.icon[k] = tostring(v or "") or "";
    end

    data.award = table.verify(data.award);
    for k, v in ipairs(data.award) do
        v = table.verify(v);
        local tmp = {
            rank = tostring(v.rank or "") or "",
            sort = number.valueOf(v.sort),
            desc = tostring(v.desc or "") or "",
        }
        data.award[k] = tmp;
    end

    table.sort(data.award, function(a, b)
        return a.sort < b.sort
    end)
    
    data.rulescontent = table.verify(data.rulescontent);
    for k, v in pairs(table.verify(data.rulescontent)) do
        data.rulescontent[tostring(k)] = tostring(v);
    end

    return data; 
end

MatchDetailData.s_socketCmdFuncMap = {
    [PHP_REQUEST_MATCH_DETAIL]  = MatchDetailData.onResponseMatchDetail;
};

return MatchDetailData;