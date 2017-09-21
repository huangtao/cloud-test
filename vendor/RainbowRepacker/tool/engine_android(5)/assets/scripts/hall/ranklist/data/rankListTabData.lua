require("gameData/gameData");
require("hall/php/phpSocketCmd");

--@brief 排行榜tab显示控制

RankListTabData = class(GameData);


RankListTabData.Delegate = {
    onGetRankListTabCallBack = "onGetRankListTabCallBack";
}

RankListTabData.initData = function(self)
    self.m_orgData = {};
    self.m_tabList = {};
end

RankListTabData.requestData = function(self)
    if not self.m_isTouched or table.isEmpty(self.m_tabList) then
        local param = { 
            app_version  = kClientInfo:getApkVersion();
            hall_version = kGameManager:getGameVersion(GameType.HALL);
        };
        OnlineSocketManager.getInstance():sendMsg(PHP_GET_RANK_TAB, param);
    end
end

RankListTabData.onGetRankListTabCallBack = function(self, isSuccess, info, sendParam)
    if not isSuccess then
        self:execDelegate(RankListTabData.Delegate.onGetRankListTabCallBack, false);
        return;
    end

    self:updateData(true, info);
end

RankListTabData.updateMemData = function(self, data)
    self:__analysisData(data);
    self:execDelegate(RankListTabData.Delegate.onGetRankListTabCallBack, true, Copy(self.m_tabList) );
end

RankListTabData.getRankTabList = function(self)
    self:requestData();
    return Copy(self.m_tabList);
end

RankListTabData.getPreferDisplayRankType = function(self)
    for k, v in pairs(self.m_tabList) do
        if v.state == 1 then
            return v.type;
        end
    end

    return RankListConstants.eRankType.Money;
end

RankListTabData.__analysisData = function(self, data)
    if table.isEmpty(data)then
        return;
    end

    self.m_orgData = data;
    self.m_tabList = {};
    for key, value in pairs(data) do
        value.title = tostring(value.title) or "";
        value.state = tonumber(value.state) or 0; --state 标识当前哪个tab激活，即哪个优先显示
        value.sort  = tonumber(value.sort)  or 0;
        value.type  = tostring(key) or "";
        if not string.isEmpty(value.type) then
            table.insert(self.m_tabList, value);
        end
    end

    table.sort(self.m_tabList, function(a, b)
            if a and b then
                return a.sort < b.sort;
            else
                return true;
            end
        end);
end

RankListTabData.saveDictData = function(self, dict)
    dict:setString("rankTabData", json.encode(self.m_orgData) or "" );
end

RankListTabData.loadDictData = function(self, dict)
    local strData = dict:getString("rankTabData");
    local tabData = json.decode(strData);
    self:__analysisData(tabData);
end

RankListTabData.getLocalDictName = function(self)
    return "RankListTabData";
end

RankListTabData.s_socketCmdFuncMap = {
    [PHP_GET_RANK_TAB] = RankListTabData.onGetRankListTabCallBack;
}